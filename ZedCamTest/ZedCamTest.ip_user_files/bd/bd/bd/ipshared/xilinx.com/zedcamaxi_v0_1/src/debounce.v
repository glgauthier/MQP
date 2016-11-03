`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2016 06:21:19 PM
// Design Name: 
// Module Name: debounce
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


module debounce(
    input clk,
    input btn,
    output reg btn_val
    );

reg [1:0] count = 1'b0; // counter for keeping track of button signal times

always @ (posedge clk)
	
	// When a button press is initially detected, do nothing other than increment
	//		the counter
	if (btn && count == 2'b00) 
		count <= 2'b01;
	
	// If 50ms has passed and the button input is still high, it is counted as 
	//		a press and the output is turned high
	else if (btn && count >= 2'b01) 
		begin
		btn_val <= 1'b1;
		count <= 2'b10;
		end
	
	// If the button isn't pressed at all, don't increment the counter, and
	// 	keep the output low
	else 
		begin
		btn_val <= 1'b0;
		count <= 2'b00;
		end

endmodule
