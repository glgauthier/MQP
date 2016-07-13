`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Georges Gauthier - Box 117
// Due Fri, Feb. 5th
// Description: This module is used for controlling the four digit seven segment
//		display on the nexys3 board. The module contains an 8 bit decoder for the
//		value to be displayed, as well as the instantiation of a 2 bit counter
//		for driving the anodes of each segment.
//
//////////////////////////////////////////////////////////////////////////////////
module seven_seg(
    input [15:0] values, // values to be written to the four seven segment LEDs
	 input CLK, // 4MHz clock
	 input en, // 1kHz counter enable used for setting the segment refresh rate
    output reg [6:0] cathodes, 
    output reg [3:0] anodes
    );

reg [1:0] count = 2'b0; // anode counter 
reg [3:0] currentVal; // storage for the number being displayed

// choose what to write to the display based on the binary counter's current state
always @(posedge CLK)
if (en) // increment the anode counter at each 1kHz clock pulse
	if (count == 2'b11)
		count <= 2'b00;
	else 
		count <= count + 1'b1;
else // if not incrementing the anode counter, write to the current segment.
	case(count)
		// read in value for segment 0
		2'b00 : begin
			anodes <= 4'b1110;
			currentVal [3:0] <=  values [3:0];
			end
		// read in value for segment 1
		2'b01 : begin
			anodes <= 4'b1101;
			currentVal [3:0] <=  values [7:4];
			end
		// read in value for segment 2
		2'b10 : begin
			anodes <= 4'b1011;
			currentVal [3:0] <=  values [11:8];
			end
		// read in value for segment 3
		2'b11 : begin
			anodes <= 4'b0111;
			currentVal [3:0] <=  values [15:12];
			end
	endcase	

	


// decode currentVal into something displayable and write it to the 7seg cathodes
always @(currentVal or cathodes) begin
	case(currentVal)
		4'b0000: cathodes = 7'b0000001; //0
		4'b0001: cathodes = 7'b1001111; //1
		4'b0010: cathodes = 7'b0010010; //2
		4'b0011: cathodes = 7'b0000110; //3
		4'b0100: cathodes = 7'b1001100; //4 
		4'b0101: cathodes = 7'b0100100; //5
		4'b0110: cathodes = 7'b0100000; //6
		4'b0111: cathodes = 7'b0001111; //7
		4'b1000: cathodes = 7'b0000000; //8
		4'b1001: cathodes = 7'b0001100; //9
		4'b1010: cathodes = 7'b0001000; //a
		4'b1011: cathodes = 7'b1100000; //b
		4'b1100: cathodes = 7'b0110001; //c
		4'b1101: cathodes = 7'b1000010; //d
		4'b1110: cathodes = 7'b0110000; //e
		4'b1111: cathodes = 7'b0111000; //f
	endcase
end
	
endmodule
