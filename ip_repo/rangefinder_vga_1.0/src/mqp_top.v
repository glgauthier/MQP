//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Tue Nov 01 20:42:35 2016
//Host        : JOHN-HP running 64-bit major release  (build 7600)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mqp_top
(
    //physical pins
    input fpga_clk,
    input reset,
    output hsync,
    output vsync,
    output [11:0] rgb,
    
    //processing system
    output [27:0] data_enable_step,
    input transmit,
    
    //rangefinder BRAM controllers
    output reg [8:0] addra1,
    input [12:0] coord1_data,
    output clk_100M1,   
    output reg [8:0] addra2,
    input [12:0] coord2_data,
    output clk_100M2,
    
    //vga BRAM controller
    output [8:0] ylocation,
    output clk_100M3,
    output reg [639:0] dina,
    output ena,
    output write,
    output [8:0] vcount_9, // check size on this 
    output clk_25M1,
    output [639:0] x_vga,
    output enb
);
    
    wire clk_100M;   
    wire clk_25M;

    assign clk_100M1 = clk_100M;
    assign clk_100M2 = clk_100M;
    assign clk_100M3 = clk_100M;
    assign clk_25M1 = clk_25M;
     
    //for rangefinder logic
    wire [15:0] data;
    wire enable;
    wire [10:0] step;
    wire [8:0] xlocation;
     
   // for vga logic
   wire [10:0] hcount, vcount;    // horizontal location on screen
   assign vcount_9 = vcount[8:0];   // this could cause problems
   wire blank;        
      
   always @ (posedge clk_100M)
   begin
       dina <= 5'b11111 << (638 - xlocation);
   end

   assign rgb = (x_vga[hcount] == 1'b1) ? 12'hFFF : 12'h088;
   
   assign data = data_enable_step[27:12];
   assign enable = data_enable_step[11];
   assign step = data_enable_step[10:0];
   
   rangefinder rangefinder
   (
       .clk(clk_100M),
       .reset(reset),
       .data(data),
       .enable(enable),
       .step(step),
       .xlocation(xlocation),
       .ylocation(ylocation),
       .write(write),
       .transmit(transmit),
       
       .addra1(addra1),
       .coord1(coord1),
       
       .addra2(addra2),
       .coord2(coord2)
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
