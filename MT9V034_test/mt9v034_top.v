`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Created by Georges Gauthier
// July 09 2016
// Test module for controlling the Leopardboard LI-VM34LP camera breakout
//////////////////////////////////////////////////////////////////////////////////
module mt9v034_top(
		input sysclk,
		input reset,
		input cam_rst,
		input trigger,
		output LOCKED,
		output cam_sysclk,
		output cam_reset,
		output cam_trigger
    );
 
wire clk_50mS;
wire clk_24MHz;
wire uart_clk;

// 24MHz clock for driving MT9V034's SYSCLK
dcm CLK_24MHz
   (
    .CLK_IN1(sysclk),  
    .CLK_OUT1(clk_24MHz),
    .RESET(reset),
    .LOCKED(LOCKED)
	 ); 

// forward the camera sysclk out using a dedicated clocking route
ODDR2 #(
      .DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1" 
      .INIT(1'b0),    // Sets initial state of the Q output to 1'b0 or 1'b1
      .SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
   ) clock_forward_inst (
      .Q(cam_sysclk),     // 1-bit DDR output data
      .C0(clk_24MHz),  // 1-bit clock input
      .C1(~clk_24MHz), // 1-bit clock input
      .CE(1'b1),      // 1-bit clock enable input
      .D0(1'b0), // 1-bit data input (associated with C0)
      .D1(1'b1), // 1-bit data input (associated with C1)
      .R(1'b0),   // 1-bit reset input
      .S(1'b0)   // 1-bit set input
   );
	
clk_div clks(
	 .reset(reset), // synchronous reset
    .clk_24M(clk_24MHz), // 24MHz clock signal
    .clk_debounce(clk_50mS), // 20Hz clock pulse
	 .clk_uart(uart_clk) // 9600 baud
    );
	 
// debounce trigger button input
debounce deb(
    .clk(clk_50mS),
    .btn(trigger),
    .btn_val(cam_trigger)
    );
	 
// debounce camera reset button
debounce deb1(
    .clk(clk_50mS),
    .btn(cam_rst),
    .btn_val(cam_reset)
    );

endmodule
