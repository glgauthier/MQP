
`timescale 1 ns / 1 ps

	module ZedCamAXI_v0_1 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S_AXI
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
        input wire sysclk,
        input wire reset, // reset 
        input wire cam_rst, // button for camera RESET_BAR
        input wire trigger, // button for camera trigger
        input wire SW_camSelect, // switch for camera output enable
        input wire SW_read_fifo,
        output wire cam_sysclk, // sysclk out to camera
        output wire cam_reset, // reset_bar out to camera
        output wire cam_trigger, // trigger out to camera
        //output i2c_ready, // LED indicator for i2c bus ready
        //input output_sel,
        //input [10:0] xLoc,
        //input [10:0] yLoc,
        //output [7:0] pixel_out,
        input wire [7:0] FIFO_DATA, // DO[7:0] from AL422b fifo
        output wire FIFO_OE1, // read enable to fifo (active low)
        output wire FIFO_RRST1, // read reset to fifo (active low)
        output wire FIFO_OE2, // read enable to fifo (active low)
        output wire FIFO_RRST2, // read reset to fifo (active low)
        output wire FIFO_RCK, // rck to fifo (1MHz)
        output wire [7:0] rgb, // values on vga color pins
        output wire HS, // horizontal sync (to VGA port)
        output wire VS, // vertical sync (to VGA port)
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S_AXI
		input wire  s_axi_aclk,
		input wire  s_axi_aresetn,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_awaddr,
		input wire [2 : 0] s_axi_awprot,
		input wire  s_axi_awvalid,
		output wire  s_axi_awready,
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_wdata,
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] s_axi_wstrb,
		input wire  s_axi_wvalid,
		output wire  s_axi_wready,
		output wire [1 : 0] s_axi_bresp,
		output wire  s_axi_bvalid,
		input wire  s_axi_bready,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_araddr,
		input wire [2 : 0] s_axi_arprot,
		input wire  s_axi_arvalid,
		output wire  s_axi_arready,
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_rdata,
		output wire [1 : 0] s_axi_rresp,
		output wire  s_axi_rvalid,
		input wire  s_axi_rready
	);
	
	wire [10:0] xLoc, yLoc; 
	wire [7:0] pixel_out;
	wire i2c_ready, output_sel;
// Instantiation of Axi Bus Interface S_AXI
	ZedCamAXI_v0_1_S_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
	) ZedCamAXI_v0_1_S_AXI_inst (
	    .xLoc(xLoc),
        .yLoc(yLoc),
        .output_sel(output_sel),
        .i2c_ready(i2c_ready),
        .pixel_out(pixel_out),
		.S_AXI_ACLK(s_axi_aclk),
		.S_AXI_ARESETN(s_axi_aresetn),
		.S_AXI_AWADDR(s_axi_awaddr),
		.S_AXI_AWPROT(s_axi_awprot),
		.S_AXI_AWVALID(s_axi_awvalid),
		.S_AXI_AWREADY(s_axi_awready),
		.S_AXI_WDATA(s_axi_wdata),
		.S_AXI_WSTRB(s_axi_wstrb),
		.S_AXI_WVALID(s_axi_wvalid),
		.S_AXI_WREADY(s_axi_wready),
		.S_AXI_BRESP(s_axi_bresp),
		.S_AXI_BVALID(s_axi_bvalid),
		.S_AXI_BREADY(s_axi_bready),
		.S_AXI_ARADDR(s_axi_araddr),
		.S_AXI_ARPROT(s_axi_arprot),
		.S_AXI_ARVALID(s_axi_arvalid),
		.S_AXI_ARREADY(s_axi_arready),
		.S_AXI_RDATA(s_axi_rdata),
		.S_AXI_RRESP(s_axi_rresp),
		.S_AXI_RVALID(s_axi_rvalid),
		.S_AXI_RREADY(s_axi_rready)
	);

	// Add user logic here
    ZedCamTest_top custom_code(
        .sysclk(sysclk),
        .reset(reset), // reset 
        .cam_rst(cam_rst), // button for camera RESET_BAR
        .trigger(trigger), // button for camera trigger
        .SW_camSelect(SW_camSelect), // switch for camera output enable
        .SW_read_fifo(SW_read_fifo),
        .cam_sysclk(cam_sysclk), // sysclk out to camera
        .cam_reset(cam_reset), // reset_bar out to camera
        .cam_trigger(cam_trigger), // trigger out to camera
        .i2c_ready(i2c_ready), // LED indicator for i2c bus ready
        .output_sel(output_sel),
        .xLoc(xLoc),
        .yLoc(yLoc),
        .pixel_out(pixel_out),
        .FIFO_DATA(FIFO_DATA), // DO[7:0] from AL422b fifo
        .FIFO_OE1(FIFO_OE1), // read enable to fifo (active low)
        .FIFO_RRST1(FIFO_RRST1), // read reset to fifo (active low)
        .FIFO_OE2(FIFO_OE2), // read enable to fifo (active low)
        .FIFO_RRST2(FIFO_RRST2), // read reset to fifo (active low)
        .FIFO_RCK(FIFO_RCK), // rck to fifo (1MHz)
        .rgb(rgb), // values on vga color pins
        .HS(HS), // horizontal sync (to VGA port)
        .VS(VS) // vertical sync (to VGA port)
    );
	// User logic ends

	endmodule
