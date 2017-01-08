`timescale 1 ps / 1 ps
// MQP custom_logic Top Module
// contains custom logic for controlling the cameras, AL422B camera FIFOs,
// rangefinder data manipulation, and disparity algorithm.
// This module connects to the PS via AXI, as well as to direct GPIO
module mqp_top
(
    // physical pins
    input fpga_clk, // 100MHz input clock
    input reset, // reset button
    input button, // trigger rangefinder data sequence
    input [7:0] sw, // user switches
    output [7:0] leds, // output LEDs
    output hsync, // VGA HS
    output vsync, // VGA VS
    output reg [11:0] rgb, // VGA color logic
    
    // cameras
    input cam_rst, // button for camera RESET_BAR
    output cam_sysclk, // sysclk out to camera
    output cam_reset, // reset_bar out to camera
    output cam_trigger, // trigger out to camera
    input [7:0] FIFO_DATA, // DO[7:0] from AL422b fifo
    output FIFO_OE1, // read enable to fifo (active low)
    output FIFO_RRST1, // read reset to fifo (active low)
    output FIFO_OE2, // read enable to fifo (active low)
    output FIFO_RRST2, // read reset to fifo (active low)
    output FIFO_RCK, // rck to fifo (1MHz)
       
    //processing system
    input [27:0] data_enable_step, // AXI data from PS
    output transmit, // AXI data to PS (trigger new rangefinder data)
    
    // rangefinder lookup table BRAM (0-45 degrees)
    output [7:0] addra1, // lookup table 1 address
    input [12:0] coord1_data, // lookup table 1 data
    output clk_100M, // 100MHZ output clock 
    // rangefinder lookup table BRAM (45-90 degrees)
    output [7:0] addra2, // lookup table 2 address
    input [12:0] coord2_data, // lookup table 2 data
    
    // VGA output pixel value BRAM
    output [18:0] vga_waddr, // pixel write address (640*vcount)+hcount
    output [7:0] dina, // pixel write data
    output ena, // write port enable
    output wea, // pixel write enable
    output reg [18:0] vga_raddr, // pixel read address
    output clk_25M, // pixel read clock (VGA clock)
    input [7:0] x_vga, // pixel read data (to VGA color logic)
    output enb // read port enable
);

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Clocking ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    wire clk_24M, clk_5M;
    clk_wiz_0 mmcm(
       .clk_in1(fpga_clk), // 100MHz input
       .clk_100M(clk_100M), // top level output to BRAM modules
       .clk_25M(clk_25M), // top level output to VGA BRAM module
       .clk_out3(clk_24M), // MT9V034 camera sysclk
       .clk_out4(clk_5M), // AL422B FIFO RCK
       .reset(reset) // mmcm reset
    );     
    
    assign cam_sysclk = clk_24M; // Camera sysclk (also determines AL422B WCK)
    assign FIFO_RCK = clk_5M; // AL422B RCK
 
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Rangefinder ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    wire [15:0] data;
    wire enable;
    wire [10:0] step;
    //splitting up data, enable, and step data from AXI/Ps
    assign data = data_enable_step[27:12];  // distance value (one data point)
    assign enable = data_enable_step[11];   // new data ready for processing
    assign step = data_enable_step[10:0];   // current step (0-768)
    
    // offset for centralized device "location" on VGA display
    // i.e. show rangefinder in center of display
    parameter [8:0] X_OFFSET = 321, Y_OFFSET = 240;
    
    // VGA display buffer controls from rangefinder controller
    wire [18:0] rangefinder_waddr; // VGA display logic waddr
    wire [7:0] rangefinder_data; // VGA display logic data in
    wire rangefinder_wen; // VGA display logic write enable
    
    // LED indicators from rangedinder controller
    wire [7:0] rangefinder_leds;
    
    rangefinder rangefinder(
           .clk(clk_100M), // 100MHz input clock
           .reset(reset), // synchronous reset 
           .button(button), // trigger for new data capture sequence
           .device_x(X_OFFSET), // device x offset for display
           .device_y(Y_OFFSET), // device y offset for display
           .leds(rangefinder_leds), // current_state LED indicators
           .data(data), // rangefinder data in (from PS/PL AXI interface)
           .enable(enable), // PL data processing enable (from PS/PL AXI)
           .step(step), // current step offset (0-768) [from PS/PL AXI)
           .vga_waddr(rangefinder_waddr), // write address to VGA logic
           .transmit(transmit), // enable new data capture (to PS via AXI)
           .dina(rangefinder_data), // VGA output buffer pixel data
           .wea(rangefinder_wen), // VGA output buffer write enable
           .addra1(addra1), // 0-45 degree ROM lookup table address
           .coord1_data(coord1_data), // 0-45 degree ROM lookup table data
           .addra2(addra2), // 45-90 degree ROM lookup table address
           .coord2_data(coord2_data) // 0-45 degree ROM lookup table data
       );   
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Cameras ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // Camera Initialization sequence
    reg [4:0] init_count = 5'd0;
    always @(posedge clk_24M) // cam sysclk
    begin
        if (cam_rst) // if cam_rst is pressed, redo the initialization sequence
            init_count <= 5'd0;
        else if(init_count < 5'd25) 
            init_count <= init_count + 1'b1;
    end
    // Keep cam_rst asserted for at least 20 cam_sysclk cycles to init cams
    assign cam_reset = (init_count >= 5'd20);
    
    // Trigger a new image capture and disparity sequence when disparity idles
    // this allows for continuous disparity data capture
    wire trig_db; // camera controller trigger input
    wire [2:0] current_state; // disparity current state
    assign trig_db = current_state == 2'b00; 
    
    // Stereo camera breakout board AL422B buffer control lines
    wire fifo_oe, fifo_rrst, image_sel;
    // control output enable for left and right cams based on image_sel
    assign FIFO_OE1 = (image_sel == 1'b0) ? fifo_oe : 1'b1;
    assign FIFO_OE2 = (image_sel == 1'b1) ? fifo_oe : 1'b1;
    // control read reset for left and right cams based on image_sel
    assign FIFO_RRST1 = (image_sel == 1'b0) ? fifo_rrst : 1'b1;
    assign FIFO_RRST2 = (image_sel == 1'b1) ? fifo_rrst : 1'b1;
    
    // State machine for capturing and storing new camera images
    // This module also contains internal BRAM for storing left and right images
    wire [16:0] laddr, raddr, disp_laddr, disp_raddr; // left/right image buffer addr
    reg [16:0] img_laddr, img_raddr;
    assign laddr = (sw[7:0] != 8'h03) ? disp_laddr : img_laddr;
    assign raddr = (sw[7:0] != 8'h04) ? disp_raddr : img_raddr;
    wire [7:0] ldata, rdata; // left/right image pixel data
    wire buffer_ready; // image capture complete (disparity enable)
    imgbuf camctl(
        .get_data(trig_db), // image capture enable
        .laddr(laddr), // left image data addres
        .raddr(raddr), // right image data address
        .ldata(ldata), // left image pixel data
        .rdata(rdata), // right image pixel data
        .fifo_data(FIFO_DATA), // 8 bit data in from fifo
        .fifo_rck(clk_5M), // 5MHz AL422B RCK
        .bram_rck(clk_100M), // left/right internal image data RCK
        .image_sel(image_sel), // left/right image select (for AL422B controls)
        .fifo_rrst(fifo_rrst), // AL422B RRST (Reset read addr to 0)
        .fifo_oe(fifo_oe), // AL422B REN (allow for addr pointer to increment)
        .trigger(cam_trigger), // MT9V034 camera trigger line
        .buffer_ready(buffer_ready) // image capture complete
       );
       
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Disparity ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
    reg [6:0] lineaddr; // depth line address
    wire [7:0] lineout; // depth line data
    wire [7:0]  result_data; // output depth data for VGA bram
    wire result_wen; // VGA bram write enable
    wire [18:0] result_addr; // VGA bram pixel address
    
    parallel_disparity disp(
         .clk(clk_100M), // Read clk signal
         .enable(buffer_ready), // enable new disparity calculation 
         .sw(sw[7:0]>=8'h02), // added in to parallel module (was sw[1])
         .reset(reset), // reset disparity FSM
         .ldata(ldata), // FIFO data in
         .rdata(rdata), // FIFO data in
         .laddr(disp_laddr), // left camera data address (to imgbuf)
         .raddr(disp_raddr), // right camera data address (to imgbuf)
         .result_addr(result_addr), // VGA bram write address
         .result_data(result_data), // VGA bram pixel data (disparity vals)
         .result_wea(result_wen), // VGA bram write enable
         .state_LED(current_state), // current state indicator
         .lineout(lineout), // single line pixel data [7:0]
         .lineaddr(lineaddr) // single line pixel address
        );
        
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ VGA Logic ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // Assign LED outputs for debug based on output mode
    assign leds = (sw[0]) ? {result_wen,trig_db,buffer_ready,current_state[2:0],sw[1:0]} : rangefinder_leds;
    
    // VGA output
    wire [10:0] hcount, vcount; // horizontal, vertical location on screen
    wire blank; // blanking signal
    vga_controller_640_60 vga_controller(
        .rst(reset),
        .pixel_clk(clk_25M),
        .HS(hsync),
        .VS(vsync),
        .hcount(hcount),
        .vcount(vcount),
        .blank(blank)
    );  
    
    //address for read from vga BRAM 
    always @(hcount, vcount)
        if(sw[0])
            vga_raddr = (384*(vcount-96))+(hcount-128);
        else
            vga_raddr = (640*vcount) + hcount;
    
    // assign vga bram write address
    assign vga_waddr = (sw[0] == 1'b1) ? result_addr : rangefinder_waddr;
    // assign vga bram write data
    assign dina = (sw[0] == 1'b1) ? result_data : rangefinder_data;
    // assign vga bram port A enable
    assign ena = (sw[0] == 1'b1) ? 1'b1 : rangefinder_wen;
    // assign vga bram port A write enable
    assign wea = 1'b1;
    // assign vga bram port B enable
    assign enb = 1'b1;
    
    // handle addressing for single-line data from disparity module
    always @(hcount)
        lineaddr = (hcount >= 272 && hcount < 368) ? hcount-272 : 7'd0;
        
    // Modify output color logic based on current mode              
    always @ (hcount, vcount, blank, sw, x_vga, lineout)
    begin
        if(blank)
            rgb = 12'h000;
        else case(sw[7:0])
            8'h00: // rangefinder output
            begin
                if ((hcount >= X_OFFSET-1 && hcount <= X_OFFSET+1) && (vcount >= Y_OFFSET-1 && vcount <= Y_OFFSET+1))
                    rgb = 12'hF00;
                else if(x_vga == 8'hFF)
                    rgb = 12'h000;
                else
                    rgb = 12'hFFF;
            end
            8'h01: // full disparity output
            begin
                // center 384x288 output in the middle of the screen
                if(hcount>= 128 && hcount < 512 && vcount >= 96 && vcount < 384)
                    rgb = {x_vga,4'h8};
                // pad screen areas outside the active image black
                else
                    rgb = 12'h000;
            end
            8'h02: // single line disparity output
            begin
                if(hcount >= 272 && hcount < 368)
                    if(vcount == Y_OFFSET-lineout)
                        rgb = {4'h8,lineout};
                    else
                        rgb = 12'h000;
            end
            8'h03: // left camera image
            begin
                // center 384x288 output in the middle of the screen
                if(hcount>= 128 && hcount < 512 && vcount >= 96 && vcount < 384) begin
                    img_laddr = 384*(vcount-96) + (hcount-128);
                    rgb = {ldata,4'h8};
                end
                // pad screen areas outside the active image black
                else
                    rgb = 12'h000;
            end
            8'h04: // right camera image
            begin
                // center 384x288 output in the middle of the screen
                if(hcount>= 128 && hcount < 512 && vcount >= 96 && vcount < 384) begin
                    img_raddr = 384*(vcount-96) + (hcount-128);
                    rgb = {rdata,4'h8};
                end
                // pad screen areas outside the active image black
                else
                    rgb = 12'h000;
            end
            default: // combined disparity + rangefinder output
            begin
                // central point representing rangefinder location
                if ((hcount >= X_OFFSET-1 && hcount <= X_OFFSET+1) && (vcount >= Y_OFFSET-1 && vcount <= Y_OFFSET+1))
                    rgb = 12'hF00;
                // point from rangefinder data (with or without disparity overlap)
                else if(x_vga == 8'hFF)
                    if(hcount >= 272 && hcount < 368 && vcount == Y_OFFSET-lineout)
                        rgb = {4'hF,lineout};
                    else
                        rgb = 12'h000;
                // point from disparity data without rangefinder overlap
                else if(hcount >= 272 && hcount < 368 && vcount == Y_OFFSET-lineout && lineout > 0)
                    rgb = {4'h0,lineout};
                else
                    rgb = 12'hFFF;
            end
            endcase
    end
   
//--------------------------------- fin --------------------------------------
 
endmodule
