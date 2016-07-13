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
		input SW_cam_oe,
		input SW_cam_info,
		output reg cam_i2c_sda,
		output cam_i2c_sclk,
		output LOCKED,
		output cam_sysclk,
		output cam_reset,
		output cam_trigger,
		output cam_oe,
		output [6:0] cathodes,
		output [3:0] anodes
		);
parameter [7:0] READ = 8'h8b; // printed LSB->msb so this will appear as 0xB8 to the i2c bus

wire clk_20Hz_unbuf;
wire clk_20Hz;
wire clk_10kHz;
wire clk_50kHz_unbuf;
wire clk_50kHz;
wire clk_24MHz;

// 24MHz clock for driving MT9V034's SYSCLK
dcm CLK_24MHz
   (
    .CLK_IN1(sysclk),  
    .CLK_OUT1(clk_24MHz),
    .RESET(reset),
    .LOCKED(LOCKED)
	 ); 
	 
// further divide the dcm clock to other freqs	 
clk_div clks(
	 .reset(reset), // synchronous reset
    .clk_24M(clk_24MHz), // 24MHz clock signal
    .clk_debounce(clk_20Hz_unbuf), // 20Hz clock pulse
	 .anodes(clk_10kHz), // 10k 7Seg anode driver
	 .sclk(clk_50kHz_unbuf) // 50k I2C sclk
    );

BUFG clk_20H (
      .O(clk_20Hz), // 1-bit output: Clock buffer output
      .I(clk_20Hz_unbuf)  // 1-bit input: Clock buffer input
);
BUFG clk_50k (
      .O(clk_50kHz), // 1-bit output: Clock buffer output
      .I(clk_50kHz_unbuf)  // 1-bit input: Clock buffer input
);

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

// forward the camera i2c sclk out using a dedicated clocking route
ODDR2 #(
      .DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1" 
      .INIT(1'b1),    // Sets initial state of the Q output to 1'b0 or 1'b1
      .SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
   ) clkfwd1 (
      .Q(cam_i2c_sclk),     // 1-bit DDR output data
      .C0(clk_50kHz),  // 1-bit clock input
      .C1(~clk_50kHz), // 1-bit clock input
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
	 
// debounce camera reset button
debounce deb1(
    .clk(clk_20Hz),
    .btn(cam_rst),
    .btn_val(cam_reset)
    );

wire cam_info_deb;
btnlatch sw_deb(
    .clk(clk_20Hz),
    .btn(SW_cam_info),
    .btn_val(cam_info_deb)
    );

btnlatch sw_oe(
    .clk(clk_20Hz),
    .btn(SW_cam_oe),
    .btn_val(cam_oe)
    );

reg [5:0] i2c_count = 6'b00_0000; 
always @(posedge clk_50kHz)
begin
	if(!cam_info_deb)
	begin
		i2c_count <= 6'b00_0000;
		displayVal [15:0] <= 16'h0000;
		cam_i2c_sda <= 1'b1;
	end
	
	if(cam_info_deb && (i2c_count == 6'b00_0000))
	begin
		cam_i2c_sda <= 1'b0; // pull SDA low
		i2c_count <= i2c_count + 1'b1;
	end
	else if ((i2c_count >= 1) && (i2c_count < 8)) // write/read command
	begin
		cam_i2c_sda <= READ[i2c_count-1]; // send 0xB8, LSB first
		i2c_count <= i2c_count + 1'b1;
	end
	else if (i2c_count == 8)
	begin
		displayVal [15:0] <= 16'hffff;
		cam_i2c_sda <= 1'b1;
	end
end

endmodule
