`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Georges Gauthier - Box 117
// Due Fri Feb. 19
// Description: This module is used for debouncing button inputs. The module
// 	consumes a button input and 50mS clock pulse. When the button input goes 
//		high, a counter is initiated to keep track of how many clock pulses that
//		the button stays high for. Depending on the value of the button input and
//		counter, the output is written high or low. 
//////////////////////////////////////////////////////////////////////////////////

module btnlatch(
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
