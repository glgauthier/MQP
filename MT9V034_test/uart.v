`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:54:00 07/11/2016 
// Design Name: 
// Module Name:    uart 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module uart(
	input UART_EN, //NET "UART_EN" LOC = T10; #SW0
	input UART_CLK,
	output reg UART_TX //NET "UART_TX" LOC = N18;
    );
	 
reg [55:0] message = 56'h16_a6_36_36_f6_50_b0; //'hello\n\r' = 56'h68_65_6c_6c_6f_0a_0d LSB FIRST: 56'h16_a6_36_36_f6_50_b0;

reg [3:0] char_count = 4'h0;
always @(posedge uart_clk)
begin
	if(UART_EN==1'b1)
	begin
		if(char_count == 4'h0) // start bit - uart[0]
		begin
			UART_TX <= 1'b0; 
			char_count <= char_count + 1'b1;
		end
		else if (char_count<9)  // data bits - uart[1:8]
		begin
			UART_TX <= message[55];
			$display("%h\n",message[55:52]);
			message[55:0] <= {message[54:0],message[55]};
			char_count <= char_count + 1'b1;
		end
		else
		begin
			UART_TX <= 1'b1; 
			char_count <= 4'h0;
		end
	end
	else
	begin
		UART_TX <= 1'b1;
	end		
end

endmodule
