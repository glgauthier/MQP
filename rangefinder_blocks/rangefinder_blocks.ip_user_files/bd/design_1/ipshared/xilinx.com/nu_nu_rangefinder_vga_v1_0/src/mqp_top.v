`timescale 1 ps / 1 ps

module mqp_top
(
    //physical pins
    input fpga_clk,
    input reset,
    input button,
    output [7:0] leds,
    output hsync,
    output vsync,
    output reg [11:0] rgb,
    
    //processing system
    input [27:0] data_enable_step,
    output transmit,
    
    //rangefinder BRAM
    output [7:0] addra1,
    input [12:0] coord1_data,
    output clk_100M1,
    output [7:0] addra2,
    input [12:0] coord2_data,
    output clk_100M2,
    
    //vga map BRAM
    output [18:0] vga_waddr,
    output clk_100M3,
    output [7:0] dina,
    output ena,
    output wea,
    
    output [18:0] vga_raddr,
    output clk_25M1,
    input [7:0] x_vga,
    output enb
);
    
    wire clk_100M;
    wire clk_25M;
    
    //clocks to BRAM
    assign clk_100M1 = clk_100M;
    assign clk_100M2 = clk_100M;
    assign clk_100M3 = clk_100M;
    assign clk_25M1 = clk_25M;
    
    //enables for BRAM
    assign ena = 1'b1;
    assign enb = 1'b1;
    
    //splitting up data, enable, and step data
    assign data = data_enable_step[27:12];
    assign enable = data_enable_step[11];
    assign step = data_enable_step[10:0];
         
    //for rangefinder logic
    wire [15:0] data;
    wire enable;
    wire [10:0] step;
    wire [5:0] count;
    
    wire [8:0] device_x;
    wire [8:0] device_y;
    
    assign device_x = 321;
    assign device_y = 265;
         
    // for vga logic
    wire [10:0] hcount, vcount;    // horizontal, vertical location on screen
    wire blank;
    
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
   
//----------------------------------------------------------------------------
//module instantiations

   rangefinder rangefinder
   (
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
       .transmit(transmit),
       .dina(dina),
       .wea(wea),
       
       .addra1(addra1),
       .coord1_data(coord1_data),
       
       .addra2(addra2),
       .coord2_data(coord2_data)
   );        
       
   vga_controller_640_60 vga_controller
   (
       .rst(reset),
       .pixel_clk(clk_25M),
       .HS(hsync),
       .VS(vsync),
       .hcount(hcount),
       .vcount(vcount),
       .blank(blank)
   );        
       
   clk_wiz_0 mmcm
   (
       .clk_in1(fpga_clk),
       .clk_100M(clk_100M),
       .clk_25M(clk_25M),
       .reset(reset),
       .locked()
   );       
       
endmodule