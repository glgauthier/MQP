//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Thu Oct 27 18:56:18 2016
//Host        : JOHN-HP running 64-bit major release  (build 7600)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mqp_top
(
   input fpga_clk,
   input reset,
   output hsync,
   output vsync,
   output [11:0] rgb,
   input [27:0] data_enable_step,
   output transmit
);
  
  wire clk_100M;
  wire clk_25M;
      
    //for rangefinder logic
    wire [15:0] data;
    wire enable;
    wire [10:0] step;
    wire [7:0] xlocation, ylocation;
    wire write;
//        wire transmit;
      
    // for vga logic
    wire [10:0] hcount;    // horizontal location on screen
    wire [10:0] vcount;    // vertical location on screen
    wire blank;        
    
    //map of pixel data
//        reg [639:0] vga_map [479:0];
    
    wire [639:0] x_vga;
    reg [639:0] dina;
    
    always @ (posedge clk_100M)
    begin
        dina <= 5'b11111 << (638 - xlocation);
    end
    
    blk_mem_gen_2 vga_map
    (
        .addra(ylocation),
        .clka(clk_100M),
        .dina(dina),
        .ena(1'b1),
        .wea(write),
        
        .addrb(vcount),
        .clkb(clk_25M),
        .doutb(x_vga),  //doutb[hcount]
        .web(1'b0),
        .enb(1'b1)
    );
        
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
        .transmit(transmit)
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
