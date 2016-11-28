`timescale 1ns / 1ps

module clk_divs(
	input reset, // synchronous reset
    input clk_24M, // 24MHz clock signal
    output clk_20Hz // 20Hz clock pulse
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
assign clk_20Hz = (bounce_count == 18'h0_00_00);


endmodule
