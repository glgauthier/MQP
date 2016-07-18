`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Created by Georges Gauthier
// July 09 2016
// Test module for controlling the Leopardboard LI-VM34LP camera breakout
//////////////////////////////////////////////////////////////////////////////////
 module mt9v034_top(
		input sysclk, // 100MHz fpga clk
		input reset, // oddr2 reset
		input cam_rst, // button for camera RESET_BAR
		input trigger, // button for camera trigger
		input SW_cam_oe, // switch for camera output enable
		input cam_LV,
		output LOCKED, // oddr2 LOCKED led
		output cam_sysclk, // sysclk out to camera
		output cam_reset, // reset_bar out to camera
		output cam_trigger, // trigger out to camera
		output cam_oe, // output enable out to camera
		output i2c_ready, // LED indicator for i2c bus ready
		output [6:0] cathodes, // 7seg cathodes
		output [3:0] anodes, // 7seg anodes
		input [7:0] FIFO_DATA,
		output FIFO_WE,
		output FIFO_OE,
		output FIFO_RRST,
		output FIFO_RCK,
		input mcs_reset,
		output MICRO_LED,
		input MICRO_SW,
		input UART_Rx,
		output UART_Tx
		); 
 
wire clk_20Hz_unbuf;
wire clk_20Hz;
wire clk_10kHz;
wire clk_24MHz;
wire clk_100MHz;

assign FIFO_WE = ~cam_LV;

// 24MHz clock for driving MT9V034's SYSCLK
// 100mhz out for FIFO
// note you can't connect sysclk to a dcm and other things
dcm CLK_24MHz
   (
    .CLK_IN1(sysclk),  
    .CLK_OUT1(clk_100MHz),
	 .CLK_OUT2(clk_24MHz),
    .RESET(reset),
    .LOCKED(LOCKED)
	 ); 
	 
// further divide the dcm clock to other freqs	 
clk_div clks(
	 .reset(reset), // synchronous reset
    .clk_24M(clk_24MHz), // 24MHz clock signal
    .clk_debounce(clk_20Hz_unbuf), // 20Hz clock pulse
	 .anodes(clk_10kHz) // 10k 7Seg anode driver
    );

BUFG clk_20H (
      .O(clk_20Hz), // 1-bit output: Clock buffer output
      .I(clk_20Hz_unbuf)  // 1-bit input: Clock buffer input
);

// 7seg display controls
reg [15:0] displayVal = 16'hdead;
seven_seg segs(
    .values(displayVal), // values to be written to the four seven segment LEDs
	 .CLK(clk_24MHz), // 24MHz clock
	 .en(clk_10kHz), // 10kHz counter enable used for setting the segment refresh rate
    .cathodes(cathodes), 
    .anodes(anodes)
    );
	 
// forward the camera sysclk out using a dedicated clocking route
ODDR2 #(
      .DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1" 
      .INIT(1'b0),    // Sets initial state of the Q output to 1'b0 or 1'b1
      .SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
   ) clkfwd0 (
      .Q(cam_sysclk),     // 1-bit DDR output data
      .C0(clk_24MHz),  // 1-bit clock input
      .C1(~clk_24MHz), // 1-bit clock input
      .CE(1'b1),      // 1-bit clock enable input
      .D0(1'b0), // 1-bit data input (associated with C0)
      .D1(1'b1), // 1-bit data input (associated with C1)
      .R(1'b0),   // 1-bit reset input
      .S(1'b0)   // 1-bit set input
   );

// debounce trigger button input
debounce deb(
    .clk(clk_20Hz),
    .btn(trigger),
    .btn_val(cam_trigger)
    );

// debounce output enable switch
btnlatch sw_oe(
    .clk(clk_20Hz),
    .btn(SW_cam_oe),
    .btn_val(cam_oe)
    );
	 
// debounce the microblaze input sw
wire read_en;
btnlatch fifoRead_en(
    .clk(clk_20Hz),
    .btn(MICRO_SW),
    .btn_val(read_en)
    );
	 
// camera initialization sequence
reg [4:0] init_count = 5'b0_0000;
always @(posedge clk_24MHz) // cam sysclk before ODDR2
begin
	if (cam_rst) // if cam_rst is pressed, redo the initialization sequence
		init_count <= 5'b0_0000;
	else if(init_count < 30) // keep cam_rst asserted for at least 20 cam_sysclk cycles - I use 30 since it's the minimum time for the i2c bus to be ready
		init_count <= init_count + 1'b1;
end
assign cam_reset = (init_count >= 20);
assign i2c_ready = (init_count >= 30);

microblaze_mcs mcs_0 (
  .Clk(clk_100MHz), // input Clk
  .Reset(mcs_reset), // input Reset
  .UART_Rx(UART_Rx), // input UART_Rx
  .UART_Tx(UART_Tx), // output UART_Tx
  .GPO1({FIFO_OE,
		  FIFO_RRST,
		  FIFO_RCK,
		  MICRO_LED}), // output [3 : 0] GPO1
  .GPI1(FIFO_DATA), // input [7 : 0] GPI1
  .GPI2(read_en)
);

endmodule
