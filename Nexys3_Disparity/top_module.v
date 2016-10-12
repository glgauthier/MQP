`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////
module top_module(
	input master_reset,
	input clk_fpga,
	output cam_sysclk,
	output idle_LED,
	output fifo_rck,
	output fifo_rrst1, 
	output fifo_rden1, 
	output fifo_rrst2, 
	output fifo_rden2
   );	
	 
	wire [10:0] href, vref;
	wire buffer_read, image_sel;
	
	wire clk_25MHz, clk_5MHz, clk_20Hz;
	
	dual_image_buffer imgbuf(
		.href(), // from microblaze, 0-751
		.vref(), // 0-480
		.fifo_data(), // 8 bit data in from fifo
		.fifo_rck(clk_5MHz), // Fifo read clock
		.get_data(buffer_read), // enable a new read sequence
		.image_sel(image_sel),
		.buffer_ready(), // indicate that buffer has been filled
		.fifo_rrst1(fifo_rrst1), // fifo read reset (reset read addr pointer to 0)
		.fifo_rden1(fifo_rden1), // fifo output enable (allow for addr pointer to increment)
		.fifo_rrst2(fifo_rrst2), // fifo read reset (reset read addr pointer to 0)
		.fifo_rden2(fifo_rden2), // fifo output enable (allow for addr pointer to increment)
		.pixel_value(), // 8-bit value from internal buffer
		.trigger()
   );

	disparity disp(
		.clk(), // Read clk signal
		.enable(), // enable new disparity calculation 
		.reset(master_reset), // reset disparity FSM
		.image_data(), // FIFO data in
		.buffer_ready(),
		.new_image(buffer_read),
		.buffer_href(),
		.buffer_vref(),
		.image_sel(image_sel), // left/right frame select
		.idle(idle_LED) // LED indicator signify end of process
    );
	 
	wire [10:0] hcount,vcount;
	vga_controller_640_60 vga(
		.rst(master_reset),
		.pixel_clk(clk_25MHz),
		.HS(),
		.VS(),
		.hcount(),
		.vcount(),
		.blank()
   );
	
	clk_divs clks(
		.reset(master_reset),
		.clk_fpga(clk_fpga),
		.clk_vga(clk_25MHz),
		.clk_fifo(clk_5MHz), 
		.clk_debounce(clk_20Hz)
	);
	
	ODDR2 #(
      .DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1" 
      .INIT(1'b0),    // Sets initial state of the Q output to 1'b0 or 1'b1
      .SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
   ) clkfwd0 (
      .Q(fifo_rck),     // 1-bit DDR output data
      .C0(clk_5MHz),  // 1-bit clock input
      .C1(~clk_5MHz), // 1-bit clock input
      .CE(1'b1),      // 1-bit clock enable input
      .D0(1'b0), // 1-bit data input (associated with C0)
      .D1(1'b1), // 1-bit data input (associated with C1)
      .R(1'b0),   // 1-bit reset input
      .S(1'b0)   // 1-bit set input
   );
	
	ODDR2 #(
      .DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1" 
      .INIT(1'b0),    // Sets initial state of the Q output to 1'b0 or 1'b1
      .SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
   ) clkfwd1 (
      .Q(cam_sysclk),     // 1-bit DDR output data
      .C0(clk_24MHz),  // 1-bit clock input
      .C1(~clk_24MHz), // 1-bit clock input
      .CE(1'b1),      // 1-bit clock enable input
      .D0(1'b0), // 1-bit data input (associated with C0)
      .D1(1'b1), // 1-bit data input (associated with C1)
      .R(1'b0),   // 1-bit reset input
      .S(1'b0)   // 1-bit set input
   );
	endmodule
