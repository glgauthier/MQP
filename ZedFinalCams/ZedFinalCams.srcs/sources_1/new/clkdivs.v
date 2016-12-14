`timescale 1ns / 1ps

module clk_divs(
	input reset, // synchronous reset
    input clk_5MHz, // 24MHz clock signal
    output clk_20Hz // 20Hz clock pulse
    );
		
// counter with room to count from 0 past 1,200,000 (24M/1.2M = 20Hz; 50mS debounce)
reg [17:0] count; 
always @(posedge clk_5MHz)
	if (reset) // synchronous reset
		count <= 0;
	else if (count == 249999)
		count <= 0;
	else 
		count <= count + 1'b1;

// when each counter rolls over, pulse the respective clk output
assign clk_20Hz = (count == 18'd0);


endmodule
