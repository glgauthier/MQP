`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2016 01:06:45 PM
// Design Name: 
// Module Name: clk_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module clk_divider(
	input clk_96M,
	input reset,
	output reg clk19_2k
);

	reg [11:0] count;
	wire en_clk19_2;

	// 19.2kHz clock
	always @ (posedge clk_96M, posedge reset)
		if(reset || count == 2499)
			count <= 0;
		else
			count <= count + 1'b1;
			
	assign en_clk19_2k = (count == 2499);
	
	always @ (posedge clk_96M)
		if(en_clk19_2k)
			clk19_2k = clk19_2k + 1'b1;	// clock this counter at 19.2kHz

endmodule

