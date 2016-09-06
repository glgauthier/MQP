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
// Filename:       axi_traffic_gen_v2_0_10_streaming_top.v
// Version : v1.0
// Description:    Streaming Top level module for VIVADO.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
`include "axi_traffic_gen_v2_0_10_defines.v"
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_streaming_top
#(
parameter C_FAMILY                       = "virtex7",
parameter C_S_AXI_ID_WIDTH               = 1,
parameter C_S_AXI_DATA_WIDTH             = 32,
parameter C_AXIS1_HAS_TKEEP              = 1 ,
parameter C_AXIS1_HAS_TSTRB              = 1 ,
parameter C_AXIS2_HAS_TKEEP              = 1 ,
parameter C_AXIS2_HAS_TSTRB              = 1 ,
parameter C_AXIS_TDATA_WIDTH             = 32,
parameter C_AXIS_TUSER_WIDTH             = 8,
parameter C_AXIS_TID_WIDTH               = 1,
parameter C_AXIS_TDEST_WIDTH             = 1,
parameter ZERO_INVALID                   = 1,
parameter C_ATG_STREAMING_MST_ONLY       = 1,
parameter C_ATG_STREAMING_MST_LPBK       = 0,
parameter C_ATG_STREAMING_SLV_LPBK       = 0,
parameter C_ATG_STREAMING_MAX_LEN_BITS   = 1,
parameter C_FIRST_AXIS                   = 2,
parameter C_AXIS_SPARSE_EN               = 0,
parameter C_BASEADDR                     = 32'hffffffff,
parameter C_HIGHADDR                     = 0,
parameter C_STRM_DATA_SEED               = 16'hABCD
) (
input                               Clk                     ,
input                               Rst_n                   ,
input                               core_global_start       ,
input                               core_global_stop        ,

input  [C_S_AXI_ID_WIDTH-1:0]       awid_s                  ,
input  [31:0]                       awaddr_s                ,
input                               awvalid_s               ,
output                              awready_s               ,
input                               wlast_s                 ,
input  [C_S_AXI_DATA_WIDTH-1:0]     wdata_s                 ,
input  [C_S_AXI_DATA_WIDTH/8-1:0]   wstrb_s                 ,
input                               wvalid_s                ,
output                              wready_s                ,
output [C_S_AXI_ID_WIDTH-1:0]       bid_s                   ,
output [1:0]                        bresp_s                 ,
output                              bvalid_s                ,
input                               bready_s                ,

input  [C_S_AXI_ID_WIDTH-1:0]       arid_s                  ,
input  [31:0]                       araddr_s                ,
input                               arvalid_s               ,
output                              arready_s               ,
output [C_S_AXI_ID_WIDTH-1:0]       rid_s                   ,
output                              rlast_s                 ,
output [C_S_AXI_DATA_WIDTH-1:0]     rdata_s                 ,
output [1:0]                        rresp_s                 ,
output                              rvalid_s                ,
input                               rready_s                ,
//axis1_out
input                               axis1_out_tready        ,
output                              axis1_out_tvalid        ,
output                              axis1_out_tlast         ,
output [C_AXIS_TDATA_WIDTH-1:0]     axis1_out_tdata         ,
output [(C_AXIS_TDATA_WIDTH/8)-1:0] axis1_out_tstrb         ,
output [(C_AXIS_TDATA_WIDTH/8)-1:0] axis1_out_tkeep         ,
output [C_AXIS_TUSER_WIDTH-1:0]     axis1_out_tuser         ,
output [C_AXIS_TID_WIDTH-1:0]       axis1_out_tid           ,
output [C_AXIS_TDEST_WIDTH-1:0]     axis1_out_tdest         ,
//axis1_in
output                              axis1_in_tready         ,
input                               axis1_in_tvalid         ,
input                               axis1_in_tlast          ,
input  [C_AXIS_TDATA_WIDTH-1:0]     axis1_in_tdata          ,
input  [(C_AXIS_TDATA_WIDTH/8)-1:0] axis1_in_tstrb          ,
input  [(C_AXIS_TDATA_WIDTH/8)-1:0] axis1_in_tkeep          ,
input  [C_AXIS_TUSER_WIDTH-1:0]     axis1_in_tuser          ,
input  [C_AXIS_TID_WIDTH-1:0]       axis1_in_tid            ,
input  [C_AXIS_TDEST_WIDTH-1:0]     axis1_in_tdest          ,
output reg [15:0]                   axis1_err_counter       ,
//axis2_in
output                              axis2_in_tready         ,
input                               axis2_in_tvalid         ,
input                               axis2_in_tlast          ,
input  [C_AXIS_TDATA_WIDTH-1:0]     axis2_in_tdata          ,
input  [(C_AXIS_TDATA_WIDTH/8)-1:0] axis2_in_tstrb          ,
input  [(C_AXIS_TDATA_WIDTH/8)-1:0] axis2_in_tkeep          ,
input  [C_AXIS_TUSER_WIDTH-1:0]     axis2_in_tuser          ,
input  [C_AXIS_TID_WIDTH-1:0]       axis2_in_tid            ,
input  [C_AXIS_TDEST_WIDTH-1:0]     axis2_in_tdest          ,
//axis2_out
input                               axis2_out_tready        ,
output                              axis2_out_tvalid        ,
output                              axis2_out_tlast         ,
output [C_AXIS_TDATA_WIDTH-1:0]     axis2_out_tdata         ,
output [(C_AXIS_TDATA_WIDTH/8)-1:0] axis2_out_tstrb         ,
output [(C_AXIS_TDATA_WIDTH/8)-1:0] axis2_out_tkeep         ,
output [C_AXIS_TUSER_WIDTH-1:0]     axis2_out_tuser         ,
output [C_AXIS_TID_WIDTH-1:0]       axis2_out_tid           ,
output [C_AXIS_TDEST_WIDTH-1:0]     axis2_out_tdest          

);

wire [7:0] axis_ex_rev = `AXIEX_REV ;

// 
// C_ATG_STREAMING_MST_ONLY : Only AXIS1 out Master interface available
// C_ATG_STREAMING_MST_LPBK : Only AXIS1 out and AXIS1 in interface available
// C_ATG_STREAMING_SLV_LPBK : Only AXIS2 out and AXIS2 in interface available
// 
// Register interface:start
// 
//
reg [31:0] reg0_ctrl_ff   ;
reg [31:0] reg1_config_ff ;
reg [31:0] reg2_tdata_ff  = 32'h0;
wire  reg1_out0_tlast     = 1'b0;

wire [15:0]                    trand_i        ;
reg  [31:0]                    reg2_word_ff   ;
reg  [31:0]                    reg3_word_ff   ;
reg  [31:0]                    reg4_word_ff   ;
reg  [31:0]                    reg5_word_ff   ;
reg  [31:0]                    reg6_word_ff   ;
reg  [31:0]                    reg7_word_ff   ;
reg  [31:0]                    reg8_word_ff   ;
wire [23:0]                    reg2_tran_len  ;
wire [15:0]                    reg2_tran_cnt  ;
wire                           random_lenth   ;
wire                           random_delay   ;
wire                           user_keepstrb  ;
wire [C_AXIS_TDEST_WIDTH-1:0]  s1_out_tdest   ;
wire [15:0]                    delay_cnt      ;
wire                           infinite_trans ;
wire [(C_AXIS_TDATA_WIDTH/8-1):0]  user_keep_strb;

//Get configuration data from registers.
reg  s1_out_run;
reg  s1_out_run_ff;

//rd/wr to registers
//wr
reg [31:0] awaddrbus_ff             ;
reg [C_S_AXI_ID_WIDTH-1:0] awid_ff  ;
reg  awvalid_s_ff                   ;
reg  wvalid_s_ff                    ;
reg [31:0] wdatabus_ff              ;
reg [3:0] wstrb_ff                  ;
reg  slv_aw_valid_ff, slv_w_valid_ff;
reg  slv_wbusy_ff                   ;

wire  slv_aw_valid;
wire  slv_awi_valid;
wire [31:0] awaddrbus            = (slv_aw_valid_ff) ? awaddrbus_ff[31:0] : awaddr_s[31:0];
wire [C_S_AXI_ID_WIDTH-1:0] awid = (slv_awi_valid)    ? awid_s[C_S_AXI_ID_WIDTH-1:0] : awid_ff[C_S_AXI_ID_WIDTH-1:0];
wire [31:0] wdatabus             = (slv_w_valid_ff)  ? wdatabus_ff[31:0] : wdata_s[31:0];
wire [3:0] wstrb                 = (slv_w_valid_ff)  ? wstrb_ff[3:0] : wstrb_s[3:0];
always @(posedge Clk) begin
  awid_ff[C_S_AXI_ID_WIDTH-1:0] <= (Rst_n) ? awid[C_S_AXI_ID_WIDTH-1:0] : {C_S_AXI_ID_WIDTH{1'b0}};
  awaddrbus_ff[31:0]            <= (Rst_n) ? awaddrbus[31:0] : 32'h0;
  awvalid_s_ff                  <= (Rst_n) ? awvalid_s : 1'b0;
  wdatabus_ff[31:0]             <= (Rst_n) ? wdatabus[31:0] : 32'h0;
  wvalid_s_ff                   <= (Rst_n) ? wvalid_s : 1'b0;
  wstrb_ff[3:0]                 <= (Rst_n) ? wstrb[3:0] : 4'h0;
end
//rd
reg [31:0] rd_out_ff               ;
reg [31:0] araddrbus_ff            ;
reg [C_S_AXI_ID_WIDTH-1:0]  arid_ff;
reg arvalid_s_ff                   ;
reg slv_rbusy_ff                   ;

wire [31:0] araddrbus = araddr_s[31:0];
wire [C_S_AXI_ID_WIDTH-1:0] arid = (slv_rbusy_ff) ?  arid_ff[C_S_AXI_ID_WIDTH-1:0] : arid_s[C_S_AXI_ID_WIDTH-1:0];
always @(posedge Clk) begin
  araddrbus_ff[31:0]            <= (Rst_n) ? araddrbus[31:0] : 32'h0;
  arid_ff[C_S_AXI_ID_WIDTH-1:0] <= (Rst_n) ? arid[C_S_AXI_ID_WIDTH-1:0] : {C_S_AXI_ID_WIDTH{1'b0}};
  arvalid_s_ff                  <= (Rst_n) ? arvalid_s : 1'b0;
end

//register interface control logic.
reg  slv_arready_ff, slv_awready_ff, slv_wready_ff;
reg  slv_bvalid_ff, slv_rvalid_ff;
reg  slv_wr_req_ff;


wire  slv_rd_req = arvalid_s && slv_arready_ff;
assign  slv_awi_valid = (awvalid_s && slv_awready_ff);
assign  slv_aw_valid = (awvalid_s && slv_awready_ff) ||
        (slv_aw_valid_ff && ~slv_wbusy_ff);
wire  slv_w_valid = (wvalid_s && slv_wready_ff) ||
        (slv_w_valid_ff && ~slv_wbusy_ff);
wire  slv_wr_req = slv_aw_valid && slv_w_valid;

wire  slv_rdone = rready_s && slv_rvalid_ff && slv_rbusy_ff;
wire  slv_wdone = bready_s && slv_bvalid_ff && slv_wbusy_ff;

wire  slv_rstart = ~slv_rbusy_ff && slv_rd_req;
wire  slv_wstart = ~slv_wbusy_ff && slv_wr_req;

wire  slv_rbusy = ~slv_rdone && (slv_rstart || slv_rbusy_ff);
wire  slv_wbusy = ~slv_wdone && (slv_wstart || slv_wbusy_ff);

wire  slv_arready = ~slv_rbusy;
wire  slv_awready = ~slv_aw_valid;
wire  slv_wready = ~slv_w_valid;


wire streaming_wr_reg_sel = ((awaddrbus_ff[11:4] == 8'h03 )|(awaddrbus_ff[11:4] == 8'h04)|(awaddrbus_ff[11:4] == 8'h05));
wire [8:0] slvr_reg_dec   = (9'h1 << (araddrbus[5:2]-4'b1100));
wire [8:0] slvw_reg_dec   = ({8'h0,streaming_wr_reg_sel} << (awaddrbus_ff[5:2]-4'b1100));
wire [8:0] slv_reg_wr     = (slv_wr_req_ff) ? slvw_reg_dec[8:0] : 9'h0;

wire  slv_bvalid = slv_wbusy ;//&& slv_wr_req;
wire  slv_rvalid = slv_rbusy;

always @(posedge Clk) begin
  slv_wbusy_ff    <= (Rst_n) ? slv_wbusy    : 1'b0;
  slv_rbusy_ff    <= (Rst_n) ? slv_rbusy    : 1'b0;
  slv_aw_valid_ff <= (Rst_n) ? slv_aw_valid : 1'b0;
  slv_w_valid_ff  <= (Rst_n) ? slv_w_valid  : 1'b0;
  slv_awready_ff  <= (Rst_n) ? slv_awready  : 1'b0;
  slv_wready_ff   <= (Rst_n) ? slv_wready   : 1'b0;
  slv_arready_ff  <= (Rst_n) ? slv_arready  : 1'b0;
  slv_bvalid_ff   <= (Rst_n) ? slv_bvalid   : 1'b0;
  slv_rvalid_ff   <= (Rst_n) ? slv_rvalid   : 1'b0;
  slv_wr_req_ff   <= (Rst_n) ? slv_wr_req   : 1'b0;
end

wire  p2_overflow;
wire s1_out_ctl_en;
reg  s1_out_ctl_done;
reg [31:0] axis_trn_cnt;

wire wr1clr_done;
  assign wr1clr_done = ((wdatabus_ff[1]| wdatabus_ff[0])&reg0_ctrl_ff[1])? 1'b0 : wdatabus_ff[1];

wire [31:0] reg0_ctrl   =  (slv_reg_wr[0]) ? {wdatabus_ff[31:2],wr1clr_done,wdatabus_ff[0]} : {reg0_ctrl_ff[31:2],s1_out_ctl_done,s1_out_ctl_en};
wire [31:0] reg1_config = (slv_reg_wr[1]) ? wdatabus_ff[31:0] : reg1_config_ff[31:0];
wire [31:0] reg2_word   = (slv_reg_wr[2]) ? wdatabus_ff[31:0] : reg2_word_ff[31:0];
wire [31:0] reg3_word   = axis_trn_cnt;
wire [31:0] reg4_word   = (slv_reg_wr[4]) ? wdatabus_ff[31:0] : reg4_word_ff[31:0]; //axis_strb_w0;
wire [31:0] reg5_word   = (slv_reg_wr[5]) ? wdatabus_ff[31:0] : reg5_word_ff[31:0]; //axis_strb_w1;
wire [31:0] reg6_word   = (slv_reg_wr[6]) ? wdatabus_ff[31:0] : reg6_word_ff[31:0]; //axis_strb_w2;
wire [31:0] reg7_word   = (slv_reg_wr[7]) ? wdatabus_ff[31:0] : reg7_word_ff[31:0]; //axis_strb_w3;
wire [31:0] reg8_word   = (slv_reg_wr[8]) ? {24'h0,wdatabus_ff[7:0]} : reg8_word_ff[31:0]; //TLEN new reg;
wire [31:0] wr_mask = { { 8 { wstrb_ff[3] } }, { 8 { wstrb_ff[2] } },
                        { 8 { wstrb_ff[1] } }, { 8 { wstrb_ff[0] } } };
assign user_keep_strb = {reg7_word_ff,reg6_word_ff,reg5_word_ff,reg4_word_ff};

always @(posedge Clk) begin
  reg0_ctrl_ff[31:0]   <= (Rst_n) ? reg0_ctrl[31:0]   : 32'h0;
  reg1_config_ff[31:0] <= (Rst_n) ? reg1_config[31:0] : 32'h1;
  reg2_word_ff[31:0]   <= (Rst_n) ? reg2_word[31:0]   : 32'h0;
  reg3_word_ff[31:0]   <= (Rst_n) ? reg3_word[31:0]   : 32'h0;
  reg4_word_ff[31:0]   <= (Rst_n) ? reg4_word[31:0]   : 32'h0;
  reg5_word_ff[31:0]   <= (Rst_n) ? reg5_word[31:0]   : 32'h0;
  reg6_word_ff[31:0]   <= (Rst_n) ? reg6_word[31:0]   : 32'h0;
  reg7_word_ff[31:0]   <= (Rst_n) ? reg7_word[31:0]   : 32'h0;
  reg8_word_ff[31:0]   <= (Rst_n) ? reg8_word[31:0]   : 32'h0;
end

wire [3:0] p2_depth, p3_depth;

wire [31:0] reg0_rd_value = { axis_ex_rev[7:0],reg0_ctrl_ff[23:0]};

wire [31:0] reg_early_out =
    ((slvr_reg_dec[0]) ? reg0_rd_value[31:0]  : 32'h0) |
    ((slvr_reg_dec[1]) ? reg1_config_ff[31:0] : 32'h0) |
    ((slvr_reg_dec[2]) ? reg2_word_ff[31:0]   : 32'h0) |
    ((slvr_reg_dec[3]) ? reg3_word_ff[31:0]   : 32'h0) |
    ((slvr_reg_dec[4]) ? reg4_word_ff[31:0]   : 32'h0) |
    ((slvr_reg_dec[5]) ? reg5_word_ff[31:0]   : 32'h0) |
    ((slvr_reg_dec[6]) ? reg6_word_ff[31:0]   : 32'h0) |
    ((slvr_reg_dec[7]) ? reg7_word_ff[31:0]   : 32'h0) |
    ((slvr_reg_dec[8]) ? reg8_word_ff[31:0]   : 32'h0) ;
    

wire [31:0] rd_out = (slv_rstart) ? reg_early_out[31:0] : rd_out_ff[31:0];

always @(posedge Clk) begin
  rd_out_ff[31:0]    <= rd_out[31:0];
end

//register interface output assignment
assign  awready_s                       = slv_awready_ff;
assign  wready_s                        = slv_wready_ff;
assign  bid_s[C_S_AXI_ID_WIDTH-1:0]     = (slv_bvalid_ff) ? awid_ff[C_S_AXI_ID_WIDTH-1:0] : {C_S_AXI_ID_WIDTH{1'b0}};
assign  bresp_s[1:0]                    = 2'b00;
assign  bvalid_s                        = slv_bvalid_ff;
assign  arready_s                       = slv_arready_ff;
assign  rid_s[C_S_AXI_ID_WIDTH-1:0]     = (slv_rvalid_ff) ? arid_ff[C_S_AXI_ID_WIDTH-1:0] : 16'h0;
assign  rlast_s                         = 1'b1;
assign  rdata_s[C_S_AXI_DATA_WIDTH-1:0] = (slv_rvalid_ff) ? { 2 { rd_out_ff[31:0] } } : 64'h0;
assign  rresp_s[1:0]                    = 2'b0;
assign  rvalid_s                        = slv_rvalid_ff;

// Register interface:end
//generate global_start/global_stop pulse
wire global_start_pulse;
wire global_stop_pulse;
reg global_start_1ff;
reg global_stop_1ff;
always @(posedge Clk) begin
        global_start_1ff  <= (Rst_n) ? core_global_start : 1'b0;
        global_stop_1ff   <= (Rst_n) ? core_global_stop  : 1'b0;
end
assign global_start_pulse = ~global_start_1ff & core_global_start;
assign global_stop_pulse  = ~global_stop_1ff  & core_global_stop ;

//Read of registers by Core
//

//Current Value Set to Core
reg random_lenth_c;
reg random_delay_c;
reg user_keepstrb_c;
reg [C_AXIS_TDEST_WIDTH-1:0] s1_out_tdest_c;
reg [15:0] delay_cnt_c;
reg [23:0] reg2_tran_len_c;
reg [15:0] reg2_tran_cnt_c;
reg infinite_trans_c;
always @(posedge Clk) begin
  if(Rst_n == 1'b0 ) begin
    random_lenth_c    <= 1'b0;
    random_delay_c    <= 1'b0;
    user_keepstrb_c   <= 1'b0;
    s1_out_tdest_c    <= {C_AXIS_TDEST_WIDTH{1'b0}};
    delay_cnt_c       <= 16'h0;
    reg2_tran_len_c   <= 24'h0;
    reg2_tran_cnt_c   <= 16'h0;
    infinite_trans_c  <= 1'b0;
  end else begin
    random_lenth_c    <= random_lenth   ;
    random_delay_c    <= random_delay   ;
    user_keepstrb_c   <= user_keepstrb  ;
    s1_out_tdest_c    <= s1_out_tdest   ;
    delay_cnt_c       <= delay_cnt      ;
    reg2_tran_len_c   <= reg2_tran_len  ;
    reg2_tran_cnt_c   <= reg2_tran_cnt  ;
    infinite_trans_c  <= infinite_trans ;
  end
end

//Get the Snap-Shot of Registers when core is not running.
assign random_lenth   = s1_out_run ? random_lenth_c : reg1_config_ff[0];
assign random_delay   = s1_out_run ? random_delay_c : reg1_config_ff[1];
assign user_keepstrb  = s1_out_run ? user_keepstrb_c: reg1_config_ff[2];
assign s1_out_tdest   = s1_out_run ? s1_out_tdest_c : reg1_config_ff[8+8-1:8];
assign delay_cnt      = s1_out_run ? delay_cnt_c    : reg1_config_ff[31:16];
//reg2
assign reg2_tran_len  = s1_out_run ? reg2_tran_len_c: {reg8_word_ff[7:0], reg2_word_ff[15:0]};
assign reg2_tran_cnt  = s1_out_run ? reg2_tran_cnt_c: ((reg2_word_ff[31:16] == 16'h0) ? 16'h2 : reg2_word_ff[31:16]);
assign infinite_trans = s1_out_run ? infinite_trans_c :(reg2_word_ff[31:16] == 16'h0);



//Channel en/run status
wire s1_out_reg_en;
wire s1_in_reg_en;
reg  s1_in_run;
wire s2_out_reg_en;
reg  s2_out_run;
wire s2_in_reg_en;
reg  s2_in_run;
wire reset_s1_out_en;
wire reset_s1_out_done;

assign s1_out_reg_en     =(slv_reg_wr[0] & wdatabus_ff[0] ) | global_start_pulse;
assign reset_s1_out_en   =(slv_reg_wr[0] & ~wdatabus_ff[0]) | global_stop_pulse ; 
assign reset_s1_out_done = slv_reg_wr[0] & ( wdatabus_ff[1] | wdatabus_ff[0]); 
assign s1_in_reg_en      = slv_reg_wr[0] & wdatabus_ff[0];
assign s2_out_reg_en     = slv_reg_wr[0] & wdatabus_ff[0];
assign s2_in_reg_en      = slv_reg_wr[0] & wdatabus_ff[0];


wire s1_out_ctl_pulse;
reg  s1_out_ctl_en_ff;

assign s1_out_ctl_en = (s1_out_reg_en) ? 1'b1 : ((s1_out_ctl_done | reset_s1_out_en) ? 1'b0 :s1_out_ctl_en_ff );
assign s1_out_ctl_pulse = s1_out_ctl_en & ~s1_out_ctl_en_ff;
always @(posedge Clk) begin
  if(Rst_n == 1'b0 ) begin
    s1_out_ctl_en_ff <= 1'b0;
    s1_out_run_ff    <= 1'b0;
  end else begin 
    s1_out_ctl_en_ff <= s1_out_ctl_en;
    s1_out_run_ff    <= s1_out_run;
  end
end
always @(posedge Clk) begin
  if(Rst_n == 1'b0 ) begin
    s1_out_ctl_done <= 1'b0;
  end else if(s1_out_ctl_pulse | reset_s1_out_done) begin
    s1_out_ctl_done <= 1'b0;
  end else if(s1_out_run == 1'b0 & s1_out_run_ff == 1'b1) begin
    s1_out_ctl_done <= 1'b1;
  end
end
// C_ATG_STREAMING_MST_ONLY or C_ATG_STREAMING_MST_LPBK :start
//AXIS1-OUT
wire [15:0] beat_cnt_i;
generate if(C_ATG_STREAMING_MAX_LEN_BITS  == 16 ) begin: STRM_MAXLEN1
  assign beat_cnt_i = trand_i[15:0];
end
endgenerate
generate if(C_ATG_STREAMING_MAX_LEN_BITS  != 16 ) begin: STRM_MAXLEN0
  assign beat_cnt_i = {{(16-C_ATG_STREAMING_MAX_LEN_BITS){1'b0}},trand_i[(C_ATG_STREAMING_MAX_LEN_BITS-1):0]} ;
end
endgenerate

generate if(C_ATG_STREAMING_MST_ONLY  == 1 || C_ATG_STREAMING_MST_LPBK == 1 ) begin: ATG_STREAMING_MST_ONLY_OR_LPBK_ON
reg  tvalid_i;
reg  tlast_i;
wire dbgcnt0_pause;

//capture register length
reg [15:0] axis1_tran_cnt;
reg [23:0] axis1_beat_cnt;
reg [23:0] axis1_beats_req;
wire axis1_trans_not0 =  (axis1_tran_cnt != 16'h0);
wire axis1_trans_eql1 =  (axis1_tran_cnt == 16'h1);
wire axis1_trans_eql0 =  (axis1_tran_cnt == 16'h0);
wire axis1_beats_not0 =  (axis1_beat_cnt != 24'h0);
wire axis1_beats_eql1 =  (axis1_beat_cnt == 24'h1);
wire axis1_beats_req_eql0 =  (axis1_beats_req == 24'h0);
wire axis1_out_last_sampled = axis1_out_tvalid & axis1_out_tready & axis1_out_tlast;

//Run status of each channel
always @(posedge Clk) begin
  if(Rst_n == 1'b0 ) begin
    s1_out_run <= 1'b0;
  end else if(s1_out_run == 1'b1 & axis1_trans_eql0 == 1'b1) begin //ch running
    s1_out_run <= 1'b0;
  end else if(s1_out_ctl_pulse == 1'b1 & axis1_trans_not0 == 1'b1) begin //ch enabled
    s1_out_run <= 1'b1;
  end
end
//
//No.Of transactions to be generated
//
always @(posedge Clk) begin
  if(Rst_n == 1'b0 ) begin
    axis1_tran_cnt <= 16'h0;
  end else if(s1_out_run == 1'b0) begin //reg-write
    axis1_tran_cnt <= reg2_tran_cnt;
  end else if(axis1_out_tvalid && axis1_out_tready && axis1_out_tlast) begin
    if(s1_out_ctl_en_ff == 1'b0) begin //Force trnas to be generated to 0,when cen made to 0.
      axis1_tran_cnt <= 16'h0;
    end else begin
      axis1_tran_cnt <= axis1_tran_cnt - (axis1_trans_not0 && ~infinite_trans);
    end
  end
end

//
//delay counters: To insert delays between transactions generated at
//AXIS1_OUT
//
reg [15:0] ld_cnt;
wire delay_not0    = (random_delay)?(trand_i[15:0] != 16'h0):(delay_cnt != 16'h0);
wire ld_cnt0       = (ld_cnt == 16'h0) ;
wire ld_cnt_not0   = (ld_cnt != 16'h0) ;
assign dbgcnt0_pause = ld_cnt_not0 ;

always @(posedge Clk) begin
  if(Rst_n == 1'b0) begin 
    ld_cnt <= 16'h0;
  end else if(axis1_out_last_sampled == 1'b1) begin
    if(random_delay == 1'b1) begin
      ld_cnt <= (trand_i[15:0] == 16'h0)? 16'h0: trand_i[15:0] -1'b1;
    end else begin
      //As delay is flopped,load a value of less by 1 for delay's > 0
      ld_cnt <= (delay_cnt == 16'h0)?16'h0:delay_cnt - 1'b1;
    end
  end else begin
    ld_cnt <= ld_cnt - ld_cnt_not0;
  end
end

always @(posedge Clk) begin
  if(Rst_n == 1'b0) begin 
    tvalid_i <= 1'b0;
  end else if(axis1_out_tvalid && ~axis1_out_tready) begin
    tvalid_i <= tvalid_i;
  //CEN is disabled during transfers
  end else if(~s1_out_ctl_en_ff & axis1_out_tvalid & axis1_out_tready & axis1_out_tlast) begin
    tvalid_i <= 1'b0;
  //Last beat of requested no.of transfers
  end else if(axis1_trans_eql1 & axis1_out_tvalid & axis1_out_tready & axis1_out_tlast) begin
    tvalid_i <= 1'b0;
  //Last beat of current transfer + a delay between transfers
  end else if(axis1_out_tvalid & axis1_out_tready & axis1_out_tlast & delay_not0 ) begin
    tvalid_i <= 1'b0;
  end else begin
  //Assert tvalid if transfers are pending.
    tvalid_i <= s1_out_run & axis1_trans_not0 && ~dbgcnt0_pause ; 
  end
end

//
//No.Of beats to be generated per transaction
//
always @(posedge Clk) begin
  if(Rst_n == 1'b0 ) begin
    axis1_beat_cnt <= 24'h0;
    axis1_beats_req <= 24'h0;
  end else if(axis1_out_last_sampled == 1'b1 | s1_out_run == 1'b0) begin
    if(random_lenth == 1'b1 ) begin
      axis1_beat_cnt <= (beat_cnt_i == 16'h0)? 24'h1:{8'h0, beat_cnt_i};
      axis1_beats_req <= (beat_cnt_i == 16'h0)? 24'h1:{8'h0, beat_cnt_i};
    end else begin
      //axis1_beat_cnt <= (reg2_tran_len[15:0] == 16'h0)? 16'h1: reg2_tran_len[15:0];
      axis1_beat_cnt <= reg2_tran_len[23:0];
      axis1_beats_req <= reg2_tran_len[23:0];
    end
  end else if(axis1_out_tvalid && axis1_out_tready) begin
    axis1_beat_cnt <= axis1_beat_cnt - axis1_beats_not0;
    axis1_beats_req <= axis1_beats_req;
  end
end
//
//Strobe-keep generation
//
wire [(C_AXIS_TDATA_WIDTH/8-1):0]   keep_strb            ;
wire [127:0]                        sparse_keep_strb_all1;
wire [127:0]                        sparse_keep_strb_all0;
reg  [2*(C_AXIS_TDATA_WIDTH/8)-1:0] sparse_keep_strb     ;
assign sparse_keep_strb_all1 = {128{1'b1}};
assign sparse_keep_strb_all0 = {128{1'b0}};
//
//Generate TKEEP and TSTRB such that
// a. TKEEP = TSTRB
// b. Valid bytes are all contigious ie 1,3,7,F are the only valid sparse
// strobe/keep signals allowed for 32-bit tdata.
//
always @(posedge Clk) begin
  if(Rst_n == 1'b0) begin 
     sparse_keep_strb <= {sparse_keep_strb_all0[C_AXIS_TDATA_WIDTH/8-1:0],sparse_keep_strb_all1[C_AXIS_TDATA_WIDTH/8-1:0]};
  end else if( user_keepstrb == 1'b1 )  begin
     sparse_keep_strb <= user_keep_strb;
  end else if((sparse_keep_strb[C_AXIS_TDATA_WIDTH/8-1:0] == 1) && (axis1_out_last_sampled == 1'b1) )  begin
     sparse_keep_strb <= {sparse_keep_strb_all0[C_AXIS_TDATA_WIDTH/8-1:0],sparse_keep_strb_all1[C_AXIS_TDATA_WIDTH/8-1:0]};
  end else  if(axis1_out_last_sampled == 1'b1) begin
     sparse_keep_strb <= {sparse_keep_strb[0],sparse_keep_strb[2*(C_AXIS_TDATA_WIDTH/8)-1:1]};
  end
end

assign keep_strb = sparse_keep_strb[C_AXIS_TDATA_WIDTH/8-1:0];

//
// tlast generation
//
always @(posedge Clk) begin
  if(Rst_n == 1'b0) begin 
    tlast_i  <= 1'b0;
  //Keep tlast set if no.of beats =1 after end of each transfer.
  end else if(axis1_out_tvalid && axis1_out_tready && axis1_out_tlast) begin
    tlast_i  <= (axis1_beats_req_eql0)?1'b1:1'b0;
  //set tlast if no.of beats requested = 1(register value =0)
  end else if(s1_out_run & axis1_beats_req_eql0) begin
    tlast_i  <= 1'b1;
  //assert for last beat (where no.of beats >1)
  end else if(axis1_out_tvalid && axis1_out_tready) begin
    tlast_i  <= s1_out_run & axis1_beats_eql1 &(axis1_trans_not0 & ~dbgcnt0_pause);
  //de-assert if core is not in run state.
  end else if(s1_out_run == 1'b0) begin
    tlast_i  <= 1'b0;
  end
end
 
//Data generation
wire [C_AXIS_TDATA_WIDTH-1:0] tdata_i;
//
//using randgen which generates 16-bit random generator.
//Make 1024 bit width data (maximum allowed data width)
// and assign based on current data width selected
//
wire axis1_gen_out_nxt_data;
assign axis1_gen_out_nxt_data = axis1_out_tvalid & axis1_out_tready;     
axi_traffic_gen_v2_0_10_randgen #(
 .seed         (C_STRM_DATA_SEED      )
 ) stream_data_gen (
 .randnum      (trand_i               ),
 .generate_next(axis1_gen_out_nxt_data),
 .reset        (~Rst_n                ),
 .clk          (Clk                   )
);

assign tdata_i =  { 64{trand_i}  };

// AXIS1_OUT outputs generation generation
assign axis1_out_tvalid = tvalid_i;
assign axis1_out_tlast  = tlast_i;
assign axis1_out_tkeep  = (tvalid_i && tlast_i) ? (C_AXIS_SPARSE_EN ? keep_strb : {C_AXIS_TDATA_WIDTH/8{1'b1}}):{C_AXIS_TDATA_WIDTH/8{1'b1}};
assign axis1_out_tstrb  = (tvalid_i && tlast_i) ? (C_AXIS_SPARSE_EN ? keep_strb : {C_AXIS_TDATA_WIDTH/8{1'b1}}):{C_AXIS_TDATA_WIDTH/8{1'b1}};
//NO_SPARSE_STRB_KEEP assign axis1_out_tkeep  = {C_AXIS_TDATA_WIDTH/8{1'b1}};
//NO_SPARSE_STRB_KEEP assign axis1_out_tstrb  = {C_AXIS_TDATA_WIDTH/8{1'b1}};
assign axis1_out_tdata  = tdata_i;
assign axis1_out_tuser  = {(C_AXIS_TUSER_WIDTH){1'b0}};
assign axis1_out_tid    = {(C_AXIS_TID_WIDTH){1'b0}};
assign axis1_out_tdest  = s1_out_tdest;

// C_ATG_STREAMING_MST_ONLY or C_ATG_STREAMING_SLV_LPBK :end
end
endgenerate
generate if(C_ATG_STREAMING_MST_ONLY  == 0 && C_ATG_STREAMING_MST_LPBK == 0 ) begin: ATG_STREAMING_MST_ONLY_OR_LPBK_OFF
  // AXIS1_OUT outputs generation generation
  assign axis1_out_tvalid = 1'b0;
  assign axis1_out_tlast  = 1'b0;
  assign axis1_out_tkeep  = {C_AXIS_TDATA_WIDTH/8{1'b0}};
  assign axis1_out_tstrb  = {C_AXIS_TDATA_WIDTH/8{1'b0}};
  assign axis1_out_tdata  = {C_AXIS_TDATA_WIDTH{1'b0}};
  assign axis1_out_tuser  = {(C_AXIS_TUSER_WIDTH){1'b0}};
  assign axis1_out_tid    = {(C_AXIS_TID_WIDTH){1'b0}};
  assign axis1_out_tdest  = {(C_AXIS_TDEST_WIDTH){1'b0}};
end
endgenerate
// C_ATG_STREAMING_SLV_LPBK:begin
wire  [(C_AXIS_TDATA_WIDTH/8)-1:0] axis2_in_tstrb_i;
generate if(C_AXIS2_HAS_TSTRB == 0 && C_AXIS2_HAS_TKEEP == 1 ) begin: AXIS2_STRB0_KEEP1
  assign axis2_in_tstrb_i = axis2_in_tkeep;
end else begin: AXIS2_STRB_KEEP
  assign axis2_in_tstrb_i = axis2_in_tstrb;
end
endgenerate
generate if(C_ATG_STREAMING_SLV_LPBK == 1 ) begin: ATG_STREAMING_SLV_LPBK_ON
localparam AXIS_FIFO_WIDTH = C_AXIS_TDATA_WIDTH*10/8 + C_AXIS_TUSER_WIDTH + C_AXIS_TID_WIDTH + C_AXIS_TDEST_WIDTH +1;
wire  p2_push           = axis2_in_tvalid && axis2_in_tready;
wire  p2_block_notfull  = 1'b0;
wire  p2_block_outvalid = 1'b0;
wire  [AXIS_FIFO_WIDTH-1:0] invalid_data = {AXIS_FIFO_WIDTH{1'b0}};

axi_traffic_gen_v2_0_10_axis_fifo #(
  .ZERO_INVALID(ZERO_INVALID),
  .WIDTH(AXIS_FIFO_WIDTH)
) P2 (
  .Clk              (Clk),
  .Rst_n            (Rst_n),
  .in_data          ({ axis2_in_tlast, 
                       axis2_in_tdata[C_AXIS_TDATA_WIDTH-1:0  ] ,
                       axis2_in_tkeep[C_AXIS_TDATA_WIDTH/8-1:0] ,
                       axis2_in_tstrb_i[C_AXIS_TDATA_WIDTH/8-1:0] ,
                       axis2_in_tuser[C_AXIS_TUSER_WIDTH-1:0  ] ,
                       axis2_in_tid  [C_AXIS_TID_WIDTH-1:0    ] ,
                       axis2_in_tdest[C_AXIS_TDEST_WIDTH-1:0  ] 
                     }),
  .in_invalid_data  (invalid_data),
  .in_push          (p2_push),
  .in_ready         (axis2_out_tready),
  .in_block_notfull (p2_block_notfull),
  .in_block_outvalid(p2_block_notfull),
  .out_valid        (axis2_out_tvalid),
  .out_notfull      (axis2_in_tready),
  .out_overflow     (p2_overflow),
  .out_depth        (p2_depth[3:0]),
  .out_data         ({axis2_out_tlast, 
                      axis2_out_tdata[C_AXIS_TDATA_WIDTH-1:0  ] ,
                      axis2_out_tkeep[C_AXIS_TDATA_WIDTH/8-1:0] ,
                      axis2_out_tstrb[C_AXIS_TDATA_WIDTH/8-1:0] ,
                      axis2_out_tuser[C_AXIS_TUSER_WIDTH-1:0  ] ,
                      axis2_out_tid  [C_AXIS_TID_WIDTH-1:0    ] ,
                      axis2_out_tdest[C_AXIS_TDEST_WIDTH-1:0  ] 
                      } )
);
end
endgenerate

generate if(C_ATG_STREAMING_SLV_LPBK == 0 ) begin: ATG_STREAMING_SLV_LPBK_OFF
  assign axis2_in_tready  = 1'b0;
  assign axis2_out_tvalid = 1'b0;
  assign axis2_out_tlast  = 1'b0;
  assign axis2_out_tkeep  = {C_AXIS_TDATA_WIDTH/8{1'b0}};
  assign axis2_out_tstrb  = {C_AXIS_TDATA_WIDTH/8{1'b0}};
  assign axis2_out_tdata  = {C_AXIS_TDATA_WIDTH{1'b0}};
  assign axis2_out_tuser  = {(C_AXIS_TUSER_WIDTH){1'b0}};
  assign axis2_out_tid    = {(C_AXIS_TID_WIDTH){1'b0}};
  assign axis2_out_tdest  = {(C_AXIS_TDEST_WIDTH){1'b0}};
end
endgenerate
// C_ATG_STREAMING_SLV_LPBK:end


//C_ATG_STREAMING_MST_LPBK:start
//2013.2 New features:
// a. Master loopback
// b. TID,TDEST ports addtions

wire axis1_gen_in_nxt_data;
reg  axis1_gen_in_nxt_data_d1;
wire [15:0] axis1_trand_in_i;
wire [C_AXIS_TDATA_WIDTH-1:0] axis1_trand_in_i2;
wire [C_AXIS_TDATA_WIDTH-1:0] axis1_trand_in;
wire [C_AXIS_TDATA_WIDTH-1:0] axis1_comp_data;
wire [(C_AXIS_TDATA_WIDTH/8)-1:0] axis1_keep_strb_valid; 
wire [C_AXIS_TDATA_WIDTH-1:0] axis1_keep_strb_ext;  //From Interface
wire [C_AXIS_TDATA_WIDTH/8-1:0] axis1_keep_strb_int;  //Internally generated

//valid mask for incoming data stream
// TKEEP  TSTRB  Description
// 1        1     Data byte
// 1        0     Position byte
// 0        0     Null byte
// 0        1     Must not be used
// **ONLY* data bytes are compared ie., TKEEP =1 and TSTRB =1
wire  [(C_AXIS_TDATA_WIDTH/8)-1:0] axis1_in_tstrb_i;
generate if(C_AXIS1_HAS_TSTRB == 0 && C_AXIS1_HAS_TKEEP == 1 ) begin: AXIS1_STRB0_KEEP1
  assign axis1_in_tstrb_i = axis1_in_tkeep;
end else begin: AXIS1_STRB_KEEP
  assign axis1_in_tstrb_i = axis1_in_tstrb;
end
endgenerate

assign axis1_keep_strb_valid = axis1_in_tkeep & axis1_in_tstrb_i;
generate
  genvar byte_num;
  for (byte_num = 0; byte_num < C_AXIS_TDATA_WIDTH/8; byte_num = byte_num+1) begin : axis1_keep_strb_gen
     assign  axis1_keep_strb_ext[byte_num*8+7:byte_num*8] =
                  {8{axis1_keep_strb_valid[byte_num]}};
  end
endgenerate
//
//Generate TKEEP and TSTRB such that
// a. TKEEP = TSTRB
// b. Valid bytes are all contigious ie 1,3,7,F are the only valid sparse
// strobe/keep signals allowed for 32-bit tdata.
//
wire [(C_AXIS_TDATA_WIDTH/8-1):0]   keep_strb_int            ;
reg  [2*(C_AXIS_TDATA_WIDTH/8)-1:0] sparse_keep_strb_int     ;
wire [127:0]                        sparse_keep_strb_int_all1;
wire [127:0]                        sparse_keep_strb_int_all0;
wire axis1_in_last_sampled = axis1_in_tvalid & axis1_in_tready & axis1_in_tlast;
assign sparse_keep_strb_int_all1 = {128{1'b1}};
assign sparse_keep_strb_int_all0 = {128{1'b0}};

always @(posedge Clk) begin
  if(Rst_n == 1'b0) begin 
     sparse_keep_strb_int <= {sparse_keep_strb_int_all0[C_AXIS_TDATA_WIDTH/8-1:0],sparse_keep_strb_int_all1[C_AXIS_TDATA_WIDTH/8-1:0]};
  end else if( user_keepstrb == 1'b1 )  begin
     sparse_keep_strb_int <= user_keep_strb;
  end else if((sparse_keep_strb_int[C_AXIS_TDATA_WIDTH/8-1:0] == 1) && (axis1_in_last_sampled == 1'b1) )  begin
     sparse_keep_strb_int <= {sparse_keep_strb_int_all0[C_AXIS_TDATA_WIDTH/8-1:0],sparse_keep_strb_int_all1[C_AXIS_TDATA_WIDTH/8-1:0]};
  end else  if(axis1_in_last_sampled == 1'b1) begin
     sparse_keep_strb_int <= {sparse_keep_strb_int[0],sparse_keep_strb_int[2*(C_AXIS_TDATA_WIDTH/8)-1:1]};
  end
end
assign keep_strb_int       = sparse_keep_strb_int[C_AXIS_TDATA_WIDTH/8-1:0];
assign axis1_keep_strb_int = (axis1_in_tvalid & axis1_in_tlast) ? (C_AXIS_SPARSE_EN ? keep_strb_int : {C_AXIS_TDATA_WIDTH/8{1'b1}} ) : {C_AXIS_TDATA_WIDTH/8{1'b1}};
//NO_SPARSE_STRB_KEEP assign axis1_keep_strb_int =  {C_AXIS_TDATA_WIDTH/8{1'b1}};
assign axis1_trand_in_i2   = { 64{axis1_trand_in_i}};
assign axis1_comp_data     = axis1_in_tdata & axis1_keep_strb_ext;
assign axis1_trand_in      = axis1_trand_in_i2 & axis1_keep_strb_ext;


//
//No.Of Transactions received
//
generate if(C_ATG_STREAMING_MST_ONLY == 1 ) begin: ATG_TRN_MO
 always@(posedge Clk) begin
   if(!Rst_n) begin
     axis_trn_cnt <= 32'h0;
   end else if(axis1_out_tvalid == 1'b1 &
               axis1_out_tready == 1'b1 &
               axis1_out_tlast )begin 
     axis_trn_cnt <= axis_trn_cnt + 1'b1;
   end
 end
end
endgenerate
generate if(C_ATG_STREAMING_MST_LPBK == 1 ) begin: ATG_TRN_ML
 always@(posedge Clk) begin
   if(!Rst_n) begin
     axis_trn_cnt <= 32'h0;
   end else if(axis1_in_tvalid == 1'b1 &
               axis1_in_tready == 1'b1 &
               axis1_in_tlast )begin 
     axis_trn_cnt <= axis_trn_cnt + 1'b1;
   end
 end
end
endgenerate
generate if(C_ATG_STREAMING_SLV_LPBK == 1 ) begin: ATG_TRN_SL
 always@(posedge Clk) begin
   if(!Rst_n) begin
     axis_trn_cnt <= 32'h0;
   end else if(axis2_out_tvalid == 1'b1 &
               axis2_out_tready == 1'b1 &
               axis2_out_tlast )begin 
     axis_trn_cnt <= axis_trn_cnt + 1'b1;
   end
 end
end
endgenerate
//
//Error counter: Maintain internal error counter of 1-bit higher width
// to check for overlflow
// Stop incrementing once overflow happens
//
reg [16:0] axis1_err_counter_i;
//
//Stage1: Compare byte level data
//
reg [C_AXIS_TDATA_WIDTH/8-1:0] stage1_data_cmp;
generate
genvar cmp_byte_num;
for (cmp_byte_num = 0; cmp_byte_num < C_AXIS_TDATA_WIDTH/8; cmp_byte_num = cmp_byte_num+1) begin : stage_1_comp 
  always@(posedge Clk) begin
    if(!Rst_n) begin
      stage1_data_cmp[cmp_byte_num] <= 1'b0;
    end else if(axis1_gen_in_nxt_data ) begin
      if( (axis1_in_tkeep[cmp_byte_num] != axis1_keep_strb_int[cmp_byte_num]) ||  //keep error
          (axis1_in_tstrb_i[cmp_byte_num] != axis1_keep_strb_int[cmp_byte_num]) ||  //strb error
          (axis1_trand_in[cmp_byte_num*8+7:cmp_byte_num*8] != axis1_comp_data[cmp_byte_num*8+7:cmp_byte_num*8]) //data error
        ) begin
         stage1_data_cmp[cmp_byte_num] <= 1'b1;
      end else begin
         stage1_data_cmp[cmp_byte_num] <= 1'b0;
      end
    end
  end //always
end //for-loop
endgenerate

//
//Stage2: Compare stage-1 data
//
always @(posedge Clk) begin
  if(!Rst_n) begin
    axis1_err_counter_i <= 17'h0;
  end else if(axis1_gen_in_nxt_data_d1) begin
      if(( stage1_data_cmp != 0 ) & (axis1_err_counter_i[16] == 1'b0)) begin
        axis1_err_counter_i <= axis1_err_counter_i + 16'h1;
      end
  end
end

assign axis1_gen_in_nxt_data = axis1_in_tvalid & axis1_in_tready;

always @(posedge Clk) begin
  if(!Rst_n) begin
    axis1_gen_in_nxt_data_d1 <= 1'b0;
  end else begin 
    axis1_gen_in_nxt_data_d1 <= axis1_gen_in_nxt_data;
  end
end
axi_traffic_gen_v2_0_10_randgen #(
 .seed         (C_STRM_DATA_SEED     )
 ) stream_data_chk (
 .randnum      (axis1_trand_in_i     ),
 .generate_next(axis1_gen_in_nxt_data),
 .reset        (~Rst_n               ),
 .clk          (Clk                  )
);
//C_ATG_STREAMING_MST_LPBK:end
generate if(C_ATG_STREAMING_MST_LPBK == 1 ) begin: ATG_STREAMING_MST_LPBK_ON
  assign axis1_in_tready = 1'b1; //Ready to accept all the time.
  //
  //Since error counter is not required immmediately, flop o/p signals
  // for better timing.
  //
  always @(posedge Clk) begin
    if(!Rst_n) begin
      axis1_err_counter <= 16'h0;
    end else if(axis1_err_counter_i[16]) begin
      axis1_err_counter <= 16'hFFFF; 
    end else begin
      axis1_err_counter <= axis1_err_counter_i[15:0];
    end
  end
end
endgenerate
generate if(C_ATG_STREAMING_MST_LPBK == 0 ) begin: ATG_STREAMING_MST_LPBK_OFF
  assign axis1_in_tready = 1'b0; //Loop bakc off
  always @(posedge Clk) begin
      axis1_err_counter <= 16'h0;
  end
end
endgenerate
endmodule
