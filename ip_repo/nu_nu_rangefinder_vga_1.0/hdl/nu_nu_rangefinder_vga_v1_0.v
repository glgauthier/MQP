
`timescale 1 ns / 1 ps

	module custom_logic_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here

        //physical pins
        input wire fpga_clk,
        input wire reset,
        input wire button,
        input wire [7:0] sw,
        output wire [7:0] leds,
        output wire hsync,
        output wire vsync,
        output wire [11:0] rgb,
        
        // cameras
        input wire cam_rst, // button for camera RESET_BAR
        output wire cam_sysclk, // sysclk out to camera
        output wire cam_reset, // reset_bar out to camera
        output wire cam_trigger, // trigger out to camera
        input wire [7:0] FIFO_DATA, // DO[7:0] from AL422b fifo
        output wire FIFO_OE1, // read enable to fifo (active low)
        output wire FIFO_RRST1, // read reset to fifo (active low)
        output wire FIFO_OE2, // read enable to fifo (active low)
        output wire FIFO_RRST2, // read reset to fifo (active low)
        output wire FIFO_RCK, // rck to fifo (1MHz)
        
        //rangefinder BRAM
        output wire [7:0] addra1,
        input wire [12:0] coord1_data,
        output wire clk_100M,
        output wire [7:0] addra2,
        input wire [12:0] coord2_data,
        //output wire clk_100M2,
        
        //vga map BRAM
        output wire [18:0] vga_waddr,
        //output wire clk_100M3,
        output wire [7:0] dina,
        output wire ena,
        output wire wea,
        
        output wire [18:0] vga_raddr,
        output wire clk_25M,
        input wire [7:0] x_vga,
        output wire enb,

		// User ports ends
		// Do not modify the ports beyond this line

		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
	
    //processing system
    wire [27:0] data_enable_step;
    wire transmit;
	
// Instantiation of Axi Bus Interface S00_AXI
	custom_logic_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) custom_logic_v1_0_S00_AXI_inst (
	    .data_enable_step(data_enable_step),
	    .transmit(transmit),
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

	// Add user logic here

    mqp_top mqp_top
    (
        //physical pins
        .fpga_clk(fpga_clk),
        .reset(reset),
        .button(button),
        .sw(sw),
        .leds(leds),
        .hsync(hsync),
        .vsync(vsync),
        .rgb(rgb),
        
        // cameras
        .cam_rst(cam_rst), // button for camera RESET_BAR
        .cam_sysclk(cam_sysclk), // sysclk out to camera
        .cam_reset(cam_reset), // reset_bar out to camera
        .cam_trigger(cam_trigger), // trigger out to camera
        .FIFO_DATA(FIFO_DATA), // DO[7:0] from AL422b fifo
        .FIFO_OE1(FIFO_OE1), // read enable to fifo (active low)
        .FIFO_RRST1(FIFO_RRST1), // read reset to fifo (active low)
        .FIFO_OE2(FIFO_OE2), // read enable to fifo (active low)
        .FIFO_RRST2(FIFO_RRST2), // read reset to fifo (active low)
        .FIFO_RCK(FIFO_RCK), // rck to fifo (1MHz)
        
        //processing system
        .data_enable_step(data_enable_step),
        .transmit(transmit),
        
        //rangefinder BRAM controllers
        .addra1(addra1),
        .coord1_data(coord1_data),
        .clk_100M(clk_100M),   
        .addra2(addra2),
        .coord2_data(coord2_data),
        //.clk_100M2(clk_100M2),
        
        //vga BRAM controller
        .vga_waddr(vga_waddr),
        //.clk_100M3(clk_100M3),
        .dina(dina),
        .ena(ena),
        .wea(wea),
        .vga_raddr(vga_raddr), // check size on this 
        .clk_25M(clk_25M),
        .x_vga(x_vga),
        .enb(enb)
    );
    
       // User logic ends

	endmodule
