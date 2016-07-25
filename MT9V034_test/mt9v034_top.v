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
		input cam_LV, // line valid in from camera
		output LOCKED, // oddr2 LOCKED led
		output cam_sysclk, // sysclk out to camera
		output cam_reset, // reset_bar out to camera
		output cam_trigger, // trigger out to camera
		output cam_oe, // output enable out to camera
		output i2c_ready, // LED indicator for i2c bus ready
		output [6:0] cathodes, // 7seg cathodes
		output [3:0] anodes, // 7seg anodes
		input MICRO_SW, // SW2, used to trigger a new FIFO dump over UART from the mcs
		input mcs_reset, // Microblaze reset
		output MICRO_LED0, // LED used to indicate if mcs is reading from FIFO
		input [7:0] FIFO_DATA, // DO[7:0] from AL422b fifo
		output FIFO_WE, // Write enable to fifo (LV inverted)
		output FIFO_OE, // read enable to fifo (active low)
		output FIFO_RRST, // read reset to fifo (active low)
		output FIFO_RCK, // rck to fifo (1MHz)
		output UART_Tx // UART send pin from mcs
		); 
 
wire clk_20Hz_unbuf, clk_20Hz;
wire clk_10kHz;
wire clk_1MHz, clk_1MHz_unbuf;
wire clk_24MHz;
wire clk_100MHz;

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
    .clk_24M(clk_24MHz), // 24MHz camera SCLK
	 .clk_fifo(clk_1MHz_unbuf), // 1MHz FIFO RCK
    .clk_debounce(clk_20Hz_unbuf), // 20Hz clock pulse for debouncing stuff
	 .anodes(clk_10kHz) // 10k 7Seg anode driver
    );

// clock buffer for 1MHz fifo rck
BUFG clk_1M (
      .O(clk_1MHz), 
      .I(clk_1MHz_unbuf)  
);
// clock buffer for 20Hz button debouncing
BUFG clk_20H (
      .O(clk_20Hz), 
      .I(clk_20Hz_unbuf)  
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
	
// forward the fifo read clk out using a dedicated clocking route
ODDR2 #(
      .DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1" 
      .INIT(1'b0),    // Sets initial state of the Q output to 1'b0 or 1'b1
      .SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
   ) clkfwd1 (
      .Q(FIFO_RCK),     // 1-bit DDR output data
      .C0(clk_1MHz),  // 1-bit clock input
      .C1(~clk_1MHz), // 1-bit clock input
      .CE(1'b1),      // 1-bit clock enable input
      .D0(1'b0), // 1-bit data input (associated with C0)
      .D1(1'b1), // 1-bit data input (associated with C1)
      .R(1'b0),   // 1-bit reset input
      .S(1'b0)   // 1-bit set input
   );

// 7seg display controls
wire [15:0] displayVal;
seven_seg segs(
    .values(displayVal), // values to be written to the four seven segment LEDs
	 .CLK(clk_24MHz), // 24MHz clock
	 .en(clk_10kHz), // 10kHz counter enable used for setting the segment refresh rate
    .cathodes(cathodes), 
    .anodes(anodes)
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
reg [11:0] init_count = 12'h000;
always @(posedge clk_24MHz) // cam sysclk before ODDR2
begin
	if (cam_rst) // if cam_rst is pressed, redo the initialization sequence
		init_count <= 12'h000;
	else if(init_count < 2500) // keep cam_rst asserted for at least 20 cam_sysclk cycles - I use 30 since it's the minimum time for the i2c bus to be ready
		init_count <= init_count + 1'b1;
end
assign cam_reset = (init_count >= 20);
assign i2c_ready = (init_count >= 30);

// assert/de-assert RE and WE ~0.1mS after power on
wire fifo_rden;
assign FIFO_OE = fifo_rden;
assign FIFO_WE = ~cam_LV;

// Microblaze MCS for reading from local buffer/Tx over UART
wire fifo_read_en, fifo_reset; // tell fpga to put new data in the FIFO
wire [7:0] pixelVal; // value of a camera pixel from fpga line buffer -> microblaze
wire [9:0] pixelPos; // pixel position (0-751) on a line, from microblaze -> fpga line buffer
microblaze_mcs mcs_0 (
  .Clk(clk_100MHz), // input Clk
  .Reset(mcs_reset), // input Reset
  .UART_Tx(UART_Tx), // output UART_Tx
  .GPO1({fifo_read_en,
		  fifo_reset,
		  MICRO_LED0}), // output [3 : 0] GPO1
  .GPO2(pixelPos),
  .GPI1(pixelVal), // pixel data from FIFO/FPGA buffer
  .GPI2({read_en,mcs_read_en}) // sw1
);

// Buffer for storing a line of pixels from the FIFO
fifo_read linebuf(
	.reset_pointer(fifo_reset),
	.get_data(fifo_read_en), // from microblaze (sent to trigger new read from FIFO to FPGA buffer)
	.pixel_addr(pixelPos), // from microblaze, 0-751
	.fifo_data(FIFO_DATA), // 8 bit data in from fifo
	.fifo_rck(clk_1MHz), // 1MHz clock signal generated by FPGA
	.fifo_rrst(FIFO_RRST), // fifo read reset (reset read addr pointer to 0)
	.fifo_oe(fifo_rden), // fifo output enable (allow for addr pointer to increment)
	.buffer_ready(mcs_read_en),
	.pixel_value(pixelVal), // 8-bit pixel value from internal buffer
	.current_line(displayVal)
   );

endmodule
