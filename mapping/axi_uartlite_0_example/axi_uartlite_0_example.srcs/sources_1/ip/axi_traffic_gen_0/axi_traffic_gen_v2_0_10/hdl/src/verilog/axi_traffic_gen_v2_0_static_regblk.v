//-----------------------------------------------------------------------------
// (c) Copyright 2012 - 2013 Xilinx, Inc. All rights reserved.
//
//  This file contains confidential and proprietary information
//  of Xilinx, Inc. and is protected under U.S. and 
//  international copyright and other intellectual property
//  laws.
//  
//  DISCLAIMER
//  This disclaimer is not a license and does not grant any
//  rights to the materials distributed herewith. Except as
//  otherwise provided in a valid license issued to you by
//  Xilinx, and to the maximum extent permitted by applicable
//  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
//  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//  (2) Xilinx shall not be liable (whether in contract or tort,
//  including negligence, or under any other theory of
//  liability) for any loss or damage of any kind or nature
//  related to, arising under or in connection with these
//  materials, including for any direct, or any indirect,
//  special, incidental, or consequential loss or damage
//  (including loss of data, profits, goodwill, or any type of
//  loss or damage suffered as a result of any action brought
//  by a third party) even if such damage or loss was
//  reasonably foreseeable or Xilinx had been advised of the
//  possibility of the same.
//  
//  CRITICAL APPLICATIONS
//  Xilinx products are not designed or intended to be fail-
//  safe, or for use in any application requiring fail-safe
//  performance, such as life-support or safety devices or
//  systems, Class III medical devices, nuclear facilities,
//  applications related to the deployment of airbags, or any
//  other applications that could lead to death, personal
//  injury, or severe property or environmental damage
//  (individually and collectively, "Critical
//  Applications"). Customer assumes the sole risk and
//  liability of any use of Xilinx products in Critical
//  Applications, subject only to applicable laws and
//  regulations governing limitations on product liability.
//  
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//  PART OF THIS FILE AT ALL TIMES.
//-----------------------------------------------------------------------------
// Filename:       axi_traffic_gen_v2_0_10_static_regblk.v
// Version : v1.0
// Description:    Registers defined/implemented for the core to set/report
// various features/status of the core.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
`include "axi_traffic_gen_v2_0_10_defines.v"
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_static_regblk
# (
  parameter C_S_AXI_DATA_WIDTH      = 32,
  parameter C_ATG_STATIC_LENGTH     = 3,
  parameter C_S_AXI_ID_WIDTH        = 1
) (
 input                               Clk                  ,
 input                               rst_l                ,
 input                               core_global_start    ,
 input                               core_global_stop     ,
 input  [C_S_AXI_ID_WIDTH-1:0]       awid_s               ,
 input  [31:0]                       awaddr_s             ,
 input	                             awvalid_s            ,
 output	                             awready_s            ,
 input	                             wlast_s              ,
 input  [C_S_AXI_DATA_WIDTH-1:0]     wdata_s              ,
 input  [C_S_AXI_DATA_WIDTH/8-1:0]   wstrb_s              ,
 input	                             wvalid_s             ,
 output	                             wready_s             ,
 output [C_S_AXI_ID_WIDTH-1:0]       bid_s                ,
 output [1:0]                        bresp_s              ,
 output	                             bvalid_s             ,
 input	                             bready_s             ,
 
 input  [C_S_AXI_ID_WIDTH-1:0]       arid_s               ,
 input  [31:0]                       araddr_s             ,
 input	                             arvalid_s            ,
 output	                             arready_s            ,
 output [C_S_AXI_ID_WIDTH-1:0]       rid_s                ,
 output	                             rlast_s              ,
 output [C_S_AXI_DATA_WIDTH-1:0]     rdata_s              ,
 output [1:0]                        rresp_s              ,
 output	                             rvalid_s             ,
 input	                             rready_s             ,

 output reg                          reg0_m_enable_ff     , 
 output                              static_ctl_en        , 
 input                               reg1_done            , 
 output                               reset_reg1_done            , 
 output                               reset_reg1_en            , 
 output                              static_ctl_en_pulse  , 
 input [31:0]                        static_mw_tran_cnt   ,
 input [31:0]                        static_mr_tran_cnt   ,
 output [7:0]                        static_len           , 
 input  [31:0]                       reg5_glbcnt          ,
 output reg                          reg0_m_enable_3ff    ,
 output reg                          reg2_length_req  
);

reg [31:0] rd_out_ff;
reg [31:0] wdatabus_ff;
reg [31:0] araddrbus_ff, awaddrbus_ff;
reg [C_S_AXI_ID_WIDTH-1:0] awid_ff, arid_ff;
reg	slv_rbusy_ff, slv_wbusy_ff;
reg	slv_aw_valid_ff, slv_w_valid_ff;

wire	slv_aw_valid;
wire	slv_awi_valid;
wire [31:0] araddrbus = araddr_s[31:0];
wire [31:0] awaddrbus = (slv_aw_valid_ff) ? awaddrbus_ff[31:0] : awaddr_s[31:0];
wire [C_S_AXI_ID_WIDTH-1:0] arid = (slv_rbusy_ff) ?
		arid_ff[C_S_AXI_ID_WIDTH-1:0] : arid_s[C_S_AXI_ID_WIDTH-1:0];
wire [C_S_AXI_ID_WIDTH-1:0] awid = (slv_awi_valid) ?
		awid_s[C_S_AXI_ID_WIDTH-1:0] : awid_ff[C_S_AXI_ID_WIDTH-1:0];
wire [31:0] wdatabus = (slv_w_valid_ff) ? wdatabus_ff[31:0] : wdata_s[31:0];

always @(posedge Clk) begin
	wdatabus_ff[31:0]             <= (rst_l) ? wdatabus[31:0] : 32'h0;
	araddrbus_ff[31:0]            <= (rst_l) ? araddrbus[31:0] : 32'h0;
	awaddrbus_ff[31:0]            <= (rst_l) ? awaddrbus[31:0] : 32'h0;
	awid_ff[C_S_AXI_ID_WIDTH-1:0] <= (rst_l) ? awid[C_S_AXI_ID_WIDTH-1:0] : {C_S_AXI_ID_WIDTH{1'b0}};
	arid_ff[C_S_AXI_ID_WIDTH-1:0] <= (rst_l) ? arid[C_S_AXI_ID_WIDTH-1:0] : {C_S_AXI_ID_WIDTH{1'b0}};
end

reg	slv_arready_ff, slv_awready_ff, slv_wready_ff;
reg	slv_bvalid_ff, slv_rvalid_ff;
reg	slv_wr_req_ff;


wire	slv_rd_req = arvalid_s && slv_arready_ff;
assign	slv_awi_valid = (awvalid_s && slv_awready_ff);
assign	slv_aw_valid = (awvalid_s && slv_awready_ff) ||
				(slv_aw_valid_ff && ~slv_wbusy_ff);
wire	slv_w_valid = (wvalid_s && slv_wready_ff) ||
				(slv_w_valid_ff && ~slv_wbusy_ff);
wire	slv_wr_req = slv_aw_valid && slv_w_valid;

wire	slv_rdone = rready_s && slv_rvalid_ff && slv_rbusy_ff;
wire	slv_wdone = bready_s && slv_bvalid_ff && slv_wbusy_ff;

wire	slv_rstart = ~slv_rbusy_ff && slv_rd_req;
wire	slv_wstart = ~slv_wbusy_ff && slv_wr_req;

wire	slv_rbusy = ~slv_rdone && (slv_rstart || slv_rbusy_ff);
wire	slv_wbusy = ~slv_wdone && (slv_wstart || slv_wbusy_ff);

wire	slv_arready = ~slv_rbusy;
wire	slv_awready = ~slv_aw_valid;
wire	slv_wready = ~slv_w_valid;
//
//Address space:
//   0x60 to 0x7F
wire static_wr_reg_sel  = ( awaddrbus_ff[11:5] == 7'b0000_011 );
wire [7:0] slvr_reg_dec = (8'h1 << araddrbus[4:2]);
wire [7:0] slvw_reg_dec = ({7'h0,static_wr_reg_sel} << awaddrbus_ff[4:2]);
wire [7:0] slv_reg_wr   = (slv_wr_req_ff) ? slvw_reg_dec[7:0] : 8'h0;

wire	slv_bvalid = slv_wbusy; // && slv_wr_req;
wire	slv_rvalid = slv_rbusy;

always @(posedge Clk) begin
	slv_wbusy_ff    <= (rst_l) ? slv_wbusy    : 1'b0;
	slv_rbusy_ff    <= (rst_l) ? slv_rbusy    : 1'b0;
	slv_aw_valid_ff <= (rst_l) ? slv_aw_valid : 1'b0;
	slv_w_valid_ff  <= (rst_l) ? slv_w_valid  : 1'b0;
	slv_awready_ff  <= (rst_l) ? slv_awready  : 1'b0;
	slv_wready_ff   <= (rst_l) ? slv_wready   : 1'b0;
	slv_arready_ff  <= (rst_l) ? slv_arready  : 1'b0;
	slv_bvalid_ff   <= (rst_l) ? slv_bvalid   : 1'b0;
	slv_rvalid_ff   <= (rst_l) ? slv_rvalid   : 1'b0;
	slv_wr_req_ff   <= (rst_l) ? slv_wr_req   : 1'b0;
end

assign	awready_s = slv_awready_ff;
assign	wready_s = slv_wready_ff;
assign	bid_s[C_S_AXI_ID_WIDTH-1:0] =
		(slv_bvalid_ff) ? awid_ff[C_S_AXI_ID_WIDTH-1:0] : {C_S_AXI_ID_WIDTH{1'b0}};
assign	bresp_s[1:0] = 2'b00;
assign	bvalid_s = slv_bvalid_ff;
assign	arready_s = slv_arready_ff;
assign	rid_s[C_S_AXI_ID_WIDTH-1:0] =
			(slv_rvalid_ff) ? arid_ff[C_S_AXI_ID_WIDTH-1:0] : 16'h0;
assign	rlast_s = 1'b1;
assign	rdata_s[C_S_AXI_DATA_WIDTH-1:0] =
		(slv_rvalid_ff) ? { 2 { rd_out_ff[31:0] } } : 64'h0;
assign	rresp_s[1:0] = 2'b0;
assign	rvalid_s = slv_rvalid_ff;

wire [31:0] reg1_ctl;
reg  [31:0] reg1_ctl_ff;
wire [31:0] reg2_config;
reg  [31:0] reg2_config_ff;
wire [31:0] reg3_rdcnt;
reg  [31:0] reg3_rdcnt_ff;
wire [31:0] reg4_wrcnt;
reg  [31:0] reg4_wrcnt_ff;
reg  [31:0] reg5_glbcnt_ff;
always @(posedge Clk) begin
	reg1_ctl_ff[31:0]    <= (rst_l) ? reg1_ctl[31:0] : 32'h0;
	reg2_config_ff[31:0] <= (rst_l) ? reg2_config[31:0] : C_ATG_STATIC_LENGTH-1;
end
wire [31:0] reg1_rd_value = {`AXIEX_REV,reg1_ctl_ff[23:0]} ;
//wire [31:0] reg1_rd_value = {reg1_ctl_ff[31:0]} ;
wire [31:0] reg2_rd_value = reg2_config_ff[31:0];
wire [31:0] reg3_rd_value = reg3_rdcnt[31:0];
wire [31:0] reg4_rd_value = reg4_wrcnt[31:0];
wire [31:0] reg5_rd_value = reg5_glbcnt[31:0];
wire [31:0] reg_early_out =
		((slvr_reg_dec[0]) ? reg1_rd_value[31:0] : 32'h0) |
		((slvr_reg_dec[1]) ? reg2_rd_value[31:0] : 32'h0) |
		((slvr_reg_dec[2]) ? reg3_rd_value[31:0] : 32'h0) |
		((slvr_reg_dec[3]) ? reg4_rd_value[31:0] : 32'h0) |
		((slvr_reg_dec[4]) ? reg5_rd_value[31:0] : 32'h0) ;

wire [31:0] rd_out = (slv_rstart) ? reg_early_out[31:0] : rd_out_ff[31:0];
always @(posedge Clk) begin
	rd_out_ff[31:0] <= rd_out[31:0];
end

//generate global_start/global_stop pulse
//2-clock wide enable is required.This will be taken care with
//register programing,as two writes will take more than 2 clocks
//For ext.start case, internally pulse is streched to 2 clocks
wire global_start_p0;
reg  global_start_p1;
wire global_start_pulse;
wire global_stop_pulse;
reg global_start_1ff;
reg global_stop_1ff;
always @(posedge Clk) begin
        global_start_1ff  <= (rst_l) ? core_global_start : 1'b0;
        global_stop_1ff   <= (rst_l) ? core_global_stop  : 1'b0;
        global_start_p1   <= (rst_l) ? global_start_p0  : 1'b0;
end
assign global_start_p0 = ~global_start_1ff & core_global_start;
assign global_start_pulse = global_start_p0 | global_start_p1;
assign global_stop_pulse  = ~global_stop_1ff  & core_global_stop ;



//actual registers:
reg static_ctl_en_1ff;
wire set_reg1_en;

//clear done bit when write 1 to en-bit or 1 to done bit
assign reset_reg1_done =  (slv_reg_wr[0]) && (wdatabus_ff[0] || wdatabus_ff[1]) ;

//set enable when a write with 1/ clear enable when done bit set.
//Start with register write or external start pulse
//Stop  with register write or external stop  pulse
assign set_reg1_en   =  (slv_reg_wr[0] &  wdatabus_ff[0]) | global_start_pulse ;
assign reset_reg1_en  = (slv_reg_wr[0] & ~wdatabus_ff[0]) | global_stop_pulse  ;

wire static_ctl_done;
  assign static_ctl_done =  reg1_done;

wire wr1clr_done;
  assign wr1clr_done = ((wdatabus_ff[1]| wdatabus_ff[0])&reg1_ctl_ff[1])? 1'b0 : wdatabus_ff[1];
//
// On reaching max limit of global_cnt set done bit and clear enable bit.
assign reg1_ctl    = (slv_reg_wr[0]) ? {wdatabus_ff[31:2],wr1clr_done,wdatabus_ff[0]} : {reg1_ctl_ff[31:2],static_ctl_done,static_ctl_en};
assign reg2_config = (slv_reg_wr[1]) ? wdatabus_ff[31:0] : reg2_config_ff[31:0];
assign reg3_rdcnt  = static_mr_tran_cnt;
assign reg4_wrcnt  = static_mw_tran_cnt;
assign static_ctl_en  =  (set_reg1_en ) ? 1'b1 :(reg1_done || reset_reg1_en) ? 1'b0 : static_ctl_en_1ff;
assign static_len     = reg2_config_ff[7:0];

reg reg0_m_enable_2ff;
wire  reg0_m_enable_3 = reg0_m_enable_ff && reg0_m_enable_2ff;
always @(posedge Clk) begin
        reg0_m_enable_ff  <= (rst_l) ? reg1_ctl[0]      : 1'b0;
        reg0_m_enable_2ff <= (rst_l) ? reg0_m_enable_ff : 1'b0;
        reg0_m_enable_3ff <= (rst_l) ? reg0_m_enable_3  : 1'b0;
        static_ctl_en_1ff <= (rst_l) ? static_ctl_en    : 1'b0;
        reg2_length_req   <= (rst_l) ? slv_reg_wr[1]    : 1'b0;
end
assign static_ctl_en_pulse = ~static_ctl_en_1ff && static_ctl_en;

endmodule
