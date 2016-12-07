`timescale 1 ps / 1 ps

module mqp_top
(
    // physical pins
    input fpga_clk,
    input reset,
    input button, // trigger rangefinder data sequence
    input [7:0] sw, 
    output [7:0] leds,
    output hsync,
    output vsync,
    output reg [11:0] rgb,
    
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
    input [27:0] data_enable_step,
    output transmit,
    
    //rangefinder BRAM
    output [7:0] addra1,
    input [12:0] coord1_data,
    output clk_100M,
    output [7:0] addra2,
    input [12:0] coord2_data,
    
    //vga map BRAM
    output [18:0] vga_waddr,
    output [7:0] dina,
    output ena,
    output wea,
    
    output [18:0] vga_raddr,
    output clk_25M,
    input [7:0] x_vga,
    output enb
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
    //splitting up data, enable, and step data
    assign data = data_enable_step[27:12];
    assign enable = data_enable_step[11];
    assign step = data_enable_step[10:0];
    
    wire [8:0] device_x, device_y; // non-constant with IMU
    assign device_x = 321; // non-constant with IMU
    assign device_y = 265; // non-constant with IMU
    
    rangefinder rangefinder(
           .clk(clk_100M),
           .reset(reset),
           .button(button),
           .device_x(device_x),
           .device_y(device_y),
           .leds(leds),
           .data(data),
           .enable(enable),
           .step(step),
           .vga_waddr(vga_waddr),
           .write(write),
           .transmit(transmit),
           .dina(dina),
           .wea(wea),
           .addra1(addra1),
           .coord1_data(coord1_data),
           .addra2(addra2),
           .coord2_data(coord2_data)
       );   
       
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ VGA Logic ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
    
    // write and read enable for VGA BRAM
    assign ena = 1'b1;
    assign enb = 1'b1;
    //address for read from vga BRAM 
    assign vga_raddr = (640*vcount) + hcount;
    //rgb vga logic                  
    always @ (hcount, vcount, blank)
    begin
        if(blank)
            rgb = 12'h000;
        else if ((hcount >= device_x-1 && hcount <= device_x+1) && (vcount >= device_y-1 && vcount <= device_y+1))
            rgb = 12'hF00;
        else if(x_vga == 8'hFF)
            rgb = 12'h000;
        else
            rgb = 12'hFFF;
    end
   
//--------------------------------- fin --------------------------------------
 
endmodule
