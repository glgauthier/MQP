`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Created by Georges Gauthier
// July 09 2016
// Test module for controlling the Leopardboard LI-VM34LP camera breakout
//////////////////////////////////////////////////////////////////////////////////
module mt9v034_top(
		input sysclk,
		input reset,
		input trigger,
		output LOCKED,
		output cam_sysclk,
		output trigPin
    );

wire trigDB;
wire clk_50mS;
wire clk_24MHz;

// 24MHz clock for driving MT9V034's SYSCLK
dcm CLK_24MHz
   (
    .CLK_IN1(sysclk),  
    .CLK_OUT1(clk_24MHz),
    .RESET(reset),
    .LOCKED(LOCKED)
	 ); 
	 
clk_div debounce_clk(
	 .reset(reset), // synchronous reset
    .clk_24M(clk_24MHz), // 24MHz clock signal
    .clk_debounce(clk_50mS) // 20Hz clock pulse
    );
	 
// debounce trigger button input
debounce deb(
    .clk(clk_50mS),
    .btn(trigger),
    .btn_val(trig_DB)
    );

assign trigPin = trig_DB;
assign cam_sysclk = clk_24MHz;

endmodule
