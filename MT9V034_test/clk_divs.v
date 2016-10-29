`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Georges Gauthier - Box 117
// Due Fri Feb. 19
// Description: This module consumes the 4MHz DCM clock, and produces three 
//		separate clock/en outputs, using one counter per output.
//		1. clk_debounce: 20Hz clock to create 50mS debounce periods for buttons
//////////////////////////////////////////////////////////////////////////////////
module clk_div(
	 input reset, // synchronous reset
    input clk_24M, // 4MHz clock signal
	 output clk_fifo, //6MHz
    output clk_debounce, // 20Hz clock pulse
	 output anodes //10kHz 7seg anode driver
    );

// 6MHz fifo read clock
reg [4:0] fifo_count; // was 4:0
always @(posedge clk_24M)
	if (reset) // synchronous reset
		fifo_count <= 0;
	else if (fifo_count == 23) // was 23
		fifo_count <= 0;
	else 
		fifo_count <= fifo_count + 1'b1;
		
// counter with room to count from 0 past 1,200,000 (24M/1.2M = 20Hz; 50mS debounce)
reg [20:0] bounce_count; 
always @(posedge clk_24M)
	if (reset) // synchronous reset
		bounce_count <= 0;
	else if (bounce_count == 1199999)
		bounce_count <= 0;
	else 
		bounce_count <= bounce_count + 1'b1;

reg [15:0] seg_count; 
always @(posedge clk_24M)
	if (reset) // synchronous reset
		seg_count <= 0;
	else if (seg_count == 23999)
		seg_count <= 0;
	else 
		seg_count <= seg_count + 1'b1;	

// when each counter rolls over, pulse the respective clk output
assign clk_fifo = ((fifo_count >= 5'b01100)&&(fifo_count<=5'b11000));
assign clk_debounce = (bounce_count == 18'h0_00_00);
assign anodes = (seg_count == 12'h000);

endmodule