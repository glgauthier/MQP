`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Georges Gauthier - Box 117
// Due Fri Feb. 19
// Description: This module consumes the 4MHz DCM clock, and produces three 
//		separate clock/en outputs, using one counter per output.
//		1. clk_debounce: 20Hz clock to create 50mS debounce periods for buttons
//////////////////////////////////////////////////////////////////////////////////
module clk_divs(
	 input reset, // synchronous reset
    input clk_fpga, // 100MHz clock signal
	 output clk_vga,
	 output clk_cam,
	 output clk_fifo,
    output clk_debounce // 20Hz clock pulse
    );
	 
wire clk_24M;

mmcm clkgen
   (
    .CLK_IN1(clk_fpga), // 100 MHz
    .CLK_OUT1(clk_vga), // 25 MHz
	 .CLK_OUT2(clk_24M), // 24 MHz
	 .CLK_OUT3(clk_fifo) // 5 MHz
	 );  
	 
assign clk_cam = clk_24M;

// counter with room to count from 0 past 1,200,000 (24M/1.2M = 20Hz; 50mS debounce)
reg [20:0] bounce_count; 
always @(posedge clk_24M)
	if (reset) // synchronous reset
		bounce_count <= 0;
	else if (bounce_count == 1199999)
		bounce_count <= 0;
	else 
		bounce_count <= bounce_count + 1'b1;

// seven segment display anode driver
reg [15:0] seg_count; 
always @(posedge clk_24M)
	if (reset) // synchronous reset
		seg_count <= 0;
	else if (seg_count == 23999)
		seg_count <= 0;
	else 
		seg_count <= seg_count + 1'b1;	

assign clk_debounce = (bounce_count == 18'h0_00_00);

endmodule