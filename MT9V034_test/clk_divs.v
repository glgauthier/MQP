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
    output clk_debounce // 20Hz clock pulse
    );

// counter with room to count from 0 past 1,200,000 (24M/1.2M = 20Hz; 50mS debounce)
reg [20:0] bounce_count; 
always @(posedge clk_24M)
	if (reset) // synchronous reset
		bounce_count <= 0;
	else if (bounce_count == 1199999)
		bounce_count <= 0;
	else 
		bounce_count <= bounce_count + 1'b1;

// when each counter rolls over, pulse the respective clk output
assign clk_debounce = (bounce_count == 18'h00000);

endmodule