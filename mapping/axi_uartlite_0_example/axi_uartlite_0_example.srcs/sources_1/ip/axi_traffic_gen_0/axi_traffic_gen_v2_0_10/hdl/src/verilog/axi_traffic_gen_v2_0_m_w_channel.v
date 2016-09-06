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
// Filename:       axi_traffic_gen_v2_0_10_m_w_channel.v
// Version : v1.0
// Description:    master write channel: Issue write commands based on the cmd
//                 ram entries.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
`include "axi_traffic_gen_v2_0_10_defines.v"
//Specific WARNINGs moved to INFO by Vivado Synthesis Tool
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_m_w_channel #
(
  parameter C_M_AXI_THREAD_ID_WIDTH = 1 ,
  parameter C_ZERO_INVALID          = 1 ,
  parameter C_M_AXI_AWUSER_WIDTH    = 8 ,
  parameter C_M_AXI_DATA_WIDTH      = 32,
  parameter C_M_AXI_ADDR_WIDTH      = 32,
  parameter C_ATG_BASIC_AXI4        = 1 ,
  parameter C_ATG_AXI4LITE          = 0
) (
// system
 input                                Clk                           ,
 input                                rst_l                         ,
//aw
 output [C_M_AXI_THREAD_ID_WIDTH-1:0] awid_m                        ,
 output [C_M_AXI_ADDR_WIDTH-1:0]      awaddr_m                      ,
 output [7:0]                         awlen_m                       ,
 output [2:0]                         awsize_m                      ,
 output [1:0]                         awburst_m                     ,
 output [0:0]                         awlock_m                      ,
 output [3:0]                         awcache_m                     ,
 output [2:0]                         awprot_m                      ,
 output [3:0]                         awqos_m                       ,
 output [C_M_AXI_AWUSER_WIDTH-1:0]    awuser_m                      ,
 output                               awvalid_m                     ,
 input                                awready_m                     ,
//w
 output                               wlast_m                       ,
 output [C_M_AXI_DATA_WIDTH-1:0]      wdata_m                       ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]    wstrb_m                       ,
 output                               wvalid_m                      ,
 input                                wready_m                      ,
//b
 input [C_M_AXI_THREAD_ID_WIDTH-1:0]  bid_m                         ,
 input [1:0]                          bresp_m                       ,
 input                                bvalid_m                      ,
 output                               bready_m                      ,

//register module
 input                                reg0_m_enable_ff              ,
 input [9:0]                          reg0_mw_ptr_ff                ,
 input                                reg0_m_enable_cmdram_mrw      , 
 input                                reg0_m_enable_cmdram_mrw_ff   ,
 input                                reg0_m_enable_3ff             ,
 input                                reg0_loop_en_ff               ,
 output reg                           mw_done_ff                    ,
 output reg                           b_resp_unexp_ff               ,
 output reg                           b_resp_bad_ff                 ,
 output [9:0]                         reg0_mw_ptr_update            ,
//param ram block
 input                                param_cmdw_delayop_valid      ,
 input [23:0]                         param_cmdw_count              ,
 input                                param_cmdw_repeatfixedop_valid,
 input                                param_cmdw_disable_submitincr ,
 input                                mrd_done                      ,
//cmd ram
 input [127:0]                        cmd_out_mw                    , 
 input  [31:0]                        cmd_out_mw_ext                , //from addrram logic
 input                                cmdram_mw_regslice_id_stable  ,
//master ram
 input [C_M_AXI_DATA_WIDTH-1:0]       mram_out                      ,  
 output [15:0]                        maw_agen_addr                 ,
//masterread
 output reg [8:0]                     mwr_complete_ptr_ff           ,
 input [8:0]                          mrd_complete_ptr_ff           ,
//debug data
 output [15:0]                        Maw_fifow_dbgout              ,
//external modules 
 output reg [9:0]                     maw_ptr_new_ff                , 
 output reg [9:0]                     maw_ptr_new_2ff               , 
 output reg                           maw_fifo_push_ff              ,
//axi_traffic_gen_v2_0_10_debug_capture
 output                               maw_fifow_notfull             ,
 output reg                           maw_delay_ok_ff               ,
 output                               maw_cnt_do_dec                ,
 output                               maw_fifo_notfull              ,
 output  [3:0]                        mawtrk_free                   ,
 output                               maw_fifo0_notfull             , 
 output                               maw_fifo1_notfull             ,
 output                               maw_fifo2_notfull             ,
 output                               maw_fifo3_notfull             ,
 output reg                           maw_block_push_ff             ,
 output                               b_resp_bad                    ,
 output reg                           b_complete_ff                 ,
 output [9:0]                         maw_ptr_new                   ,
 output                               maw_fifow_push                ,
 output                               mw_done                       ,
 output                               maw_fifo0_user_disableincr    ,
 output                               maw_disableincr               ,
 output reg                           maw_disableincr_ff            ,
 output                               maw_fifo1_pop                 ,
 output                               maw_fifo0_pop                 ,
 output                               maw_agen_done                 ,
 output                               mw_fifo_valid                 ,
 output                               mw_fifo_pop                   ,
 output                               mw_fifo_notfull               ,
 output                               maw_fifow_pop                 ,
 output                               maw_fifow_valid               ,
 output                               maw_done                      ,
 output                               maw_valid                     ,
 output                               maw_fifo_push                 ,
 output                               maw_depend_ok                 ,
 output reg [8:0]                     maw_complete_depth            ,
 output [8:0]                         mwr_complete_ptr              ,
 output [15:0]                        maw_complete_next2            ,
 output reg [15:0]                    maw_complete_vec_ff           ,
 output                               maw_complete_doinc            ,
 output [15:0]                        maw_complete_inc_exp          ,
 output                               maw_agen_valid
);


// MASTER WRITE
reg        maw_done_ff, maw_fifow_push_ff, maw_fifow_push_block_ff;
reg [23:0] maw_cnt_ff;
reg [C_M_AXI_THREAD_ID_WIDTH-1:0] bid_m_ff;
reg [1:0] bresp_m_ff;
wire maw_fifo_push_xff;



 axi_traffic_gen_v2_0_10_regslice
  #(
    .DWIDTH   (1),   
    .IDWIDTH  (1),   
    .DATADEPTH(`REGSLICE_FIFOPUSH_DATA)
    )
   mawfifopush_regslice
   (
    .din         (maw_fifo_push    ),
    .dout        (maw_fifo_push_xff),    
    .dout_early  (                 ),    
    .idin        (1'b0             ),    
    .idout       (                 ),    
    .id_stable   (                 ),    
    .id_stable_ff(                 ),    
    .data_stable (                 ),    
    .clk         (Clk              ),  
    .reset       (~rst_l           )  
    ); 


// Push cmd_out_mw into maw_fifo, if rd_depend and wr_depend are met, if
//  there's room in maw_fifo and maw_fifow.
//  CR#768069: when the loop is enabled, issue & complete pointers
//  cannot be directly compared as the issue pointer roll backs to start 
//  value after the last command is issued.
//  So inc/dec_ptr pulses are used to calculate the complete depth.
wire inc_ptr,dec_ptr;
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    maw_complete_depth <= 9'h0;
  end else if(inc_ptr & dec_ptr) begin
    maw_complete_depth <= maw_complete_depth;
  end else if(inc_ptr) begin
    maw_complete_depth <= maw_complete_depth+1'b1;
  end else if(dec_ptr) begin
    maw_complete_depth <= maw_complete_depth-1'b1;
  end
end
//assign maw_complete_depth = (reg0_mw_ptr_ff[8:0]-mwr_complete_ptr_ff[8:0]);
wire        maw_block_push = (maw_complete_depth[8:0] >= 9'h0d);

/////////////////////////////
wire dis_latch;
reg dis_reg;
reg maw_valid_d1;
wire cur_itrn_dis_rcvd;    //current iteration disable received
reg  cur_itrn_dis_rcvd_d1; //current iteration disable received 1clk delayed

//wire        maw_cnt_reload = ~reg0_m_enable_cmdram_mrw_ff || maw_fifo_push_ff;
wire        maw_cnt_reload = ~reg0_m_enable_cmdram_mrw_ff || maw_fifo_push_xff || (dis_reg && ~dis_latch);

   
//wire [7:0] maw_cnt_expand =
//                ((cmd_out_mw[59:56] == 4'h0) ? 8'h00 : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'h1) ? 8'h00 : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'h2) ? 8'h01 : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'h3) ? 8'h02 : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'h4) ? 8'h06 : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'h5) ? 8'h09 : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'h6) ? 8'h0c : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'h7) ? 8'h11 : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'h8) ? 8'h18 : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'h9) ? 8'h21 : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'ha) ? 8'h32 : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'hb) ? 8'h45 : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'hc) ? 8'h68 : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'hd) ? 8'h81 : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'he) ? 8'hbe : 8'h00) |
//                ((cmd_out_mw[59:56] == 4'hf) ? 8'hff : 8'h00);
   
wire        maw_cnt_is_not0 = (maw_cnt_ff[23:0] != 24'h0);
wire        maw_cnt_ok = ~maw_cnt_reload && ~maw_cnt_is_not0;

wire        maw_valid_i;
wire        maw_delay_ok;
//CR#768069: depend ok set to success when loop enabled.
wire [8:0] maw_wr_depend = cmd_out_mw[94:86];
wire [8:0] maw_rd_depend = cmd_out_mw[85:77];
assign maw_depend_ok =  (reg0_loop_en_ff | mrd_done) ? 1'b1 :
                        ((maw_rd_depend[7:0] <= mrd_complete_ptr_ff) &
                         (maw_wr_depend[7:0] <= mwr_complete_ptr_ff));

   
//wire        maw_valid = cmd_out_mw[63] && reg0_m_enable_3ff;
assign        maw_valid_i = (cmd_out_mw[63] &&     cmdram_mw_regslice_id_stable)   && reg0_m_enable_cmdram_mrw && reg0_m_enable_3ff;

assign dis_latch = (cur_itrn_dis_rcvd == 1'b1) ? 1'b1 : ((maw_valid_i == 1'b1) ? 1'b0 : dis_reg);

always @(posedge Clk) begin
  dis_reg <= (rst_l) ? dis_latch : 1'b0;
  maw_valid_d1 <= (rst_l) ? maw_valid_i : 1'b0;
end

assign maw_valid = (dis_reg == 1'b1) ? maw_valid_d1 : maw_valid_i;
////////////////////////////

   

//wire        maw_delay_ok = (cmd_out_mw[59:56] == 4'h0) || maw_cnt_ok;
assign        maw_delay_ok = (cmd_out_mw[59:56] == 4'h0 && 
                        ~( param_cmdw_delayop_valid || param_cmdw_repeatfixedop_valid)) || maw_cnt_ok;  
//flop delay_ok for timing improvement
reg        maw_fifow_notfull_ff;
always @(posedge Clk) begin
        maw_delay_ok_ff <= (rst_l) ? maw_delay_ok : 1'b0;
end
assign        maw_cnt_do_dec = maw_fifo_notfull && maw_depend_ok &&
                        maw_fifow_notfull_ff && (mawtrk_free[3:0] != 4'h0) &&
                        maw_fifo0_notfull && maw_fifo1_notfull &&
                        maw_fifo2_notfull && maw_fifo3_notfull &&
                        ~maw_block_push_ff;
//flop maw_cnt_do_dec for timing improvement
reg maw_cnt_do_dec_ff;
always @(posedge Clk) begin
  maw_cnt_do_dec_ff <= (rst_l) ? maw_cnt_do_dec : 1'b0;
end                       
assign maw_fifo_push  = maw_valid && maw_cnt_do_dec && maw_delay_ok_ff &&  ~maw_fifo_push_ff ;
//flop maw_fifo_push for timing improvement
reg maw_fifo_push_1ff;
always @(posedge Clk) begin
   maw_fifo_push_1ff <= (rst_l)? maw_fifo_push : 1'b0;
end
assign         maw_fifow_push = maw_valid && maw_cnt_do_dec && maw_delay_ok_ff  && ~maw_fifow_push_block_ff &&  ~maw_fifow_push_ff ;
//wire         maw_fifow_push = maw_valid && maw_cnt_do_dec && ~maw_fifow_push_block_ff &&  ~maw_fifow_push_ff ;

//flop maw_fifwo_push for timing improvement
reg maw_fifow_push_1ff;
always @(posedge Clk) begin
   maw_fifow_push_1ff <= (rst_l)? maw_fifow_push : 1'b0;
end
wire        maw_fifow_push_block = ~maw_fifo_push_1ff && reg0_m_enable_3ff &&
                                (maw_fifow_push_1ff || maw_fifow_push_block_ff);



wire        param_maw_cnt_reload_delayop       = param_cmdw_delayop_valid && (~reg0_m_enable_cmdram_mrw_ff || maw_fifo_push_xff );
wire        param_maw_cnt_reload_repeatfixedop = param_cmdw_repeatfixedop_valid && (~reg0_m_enable_cmdram_mrw_ff || maw_fifo_push_xff || (dis_reg && ~dis_latch));   


reg [23:0] maw_cnt_minus1_ff;

  /* 
wire [23:0] maw_cnt = (param_maw_cnt_reload_delayop)       ? param_cmdw_count_ff[23:0]  :   
                      (param_maw_cnt_reload_repeatfixedop) ? {12'h0,param_cmdw_count_ff[19:8]}   :  
                      (maw_cnt_reload)                     ? {16'h0,maw_cnt_expand[7:0]} :

                      (maw_cnt_do_dec)                     ? maw_cnt_minus1_ff :            
                                                             maw_cnt_ff[23:0];

*/
   wire [23:0] maw_cnt_minus1 = maw_cnt_ff[23:0] - { 22'h0, maw_cnt_is_not0 };
wire [23:0] maw_cnt = (param_maw_cnt_reload_delayop)       ? param_cmdw_count[23:0]  :   
                      (param_maw_cnt_reload_repeatfixedop) ? {12'h0,param_cmdw_count[19:8]}   :  
                      //(maw_cnt_reload)                     ? {16'h0,maw_cnt_expand[7:0]} : //Arb delay feature removed.

                      (maw_cnt_do_dec_ff)                     ? maw_cnt_minus1 :            
                                                             maw_cnt_ff[23:0];

   

   
//CR#768069:
// a.Get the last disable command index.
// b.Generate a pulse to re-start pointers
//    commands issued pointers : reg0_mw_ptr_ff
//    commandes completed pointers:  mwr_complete_ptr_ff
//    Latch reg0_mw_ptr_ff when last command received and use that to
//    clear mwr_complete_ptr_ff when it reached reg0_mw_ptr_ff latched value.
// c.Validate all these signals when loop is enabled.
// d.Hold generating the complete signal(maw_done) when loop is enabled.
// e.mask dependency when loop is enabled.
assign cur_itrn_dis_rcvd = reg0_m_enable_ff && reg0_m_enable_3ff && reg0_loop_en_ff && (~dis_reg) &&
                           ( (~cmd_out_mw[63] &&  cmdram_mw_regslice_id_stable)   || maw_done_ff);
wire cur_itrn_done;
always @(posedge Clk) begin
  cur_itrn_dis_rcvd_d1 <= (rst_l) ? cur_itrn_dis_rcvd : 1'b0;
end
assign cur_itrn_done = cur_itrn_dis_rcvd & ~cur_itrn_dis_rcvd_d1;

assign maw_done = reg0_m_enable_ff && reg0_m_enable_3ff && ~reg0_loop_en_ff &&
                  ( (~cmd_out_mw[63] &&  cmdram_mw_regslice_id_stable)   || maw_done_ff);

//  increment unless specialqueue is active disable bit set  
assign  maw_ptr_new = (cur_itrn_done)? 10'h0:
                      ((maw_fifo_push_ff && ~param_cmdw_disable_submitincr) ? reg0_mw_ptr_ff[9:0] + 10'h1:
                      reg0_mw_ptr_ff[9:0]);

//CR#768069:Hold the index where the invalid command received in cmdram set.
reg [9:0] last_cmd_index;
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    last_cmd_index <= 10'h3FF; 
  end else if(cur_itrn_done) begin
    last_cmd_index <= reg0_mw_ptr_ff; 
  end else begin
    last_cmd_index <= last_cmd_index;
  end
end

//inc_ptr: pulse when command issued pointer is incremented.
assign inc_ptr = maw_fifo_push_ff && ~param_cmdw_disable_submitincr;
   
assign reg0_mw_ptr_update[9:0] = maw_ptr_new[9:0];

// Calculate separate maw_fifow_push to allow wdata to get data even if
//  mawaddr is blocked by cnt.
   
always @(posedge Clk) begin
  maw_done_ff                 <= (rst_l) ? maw_done        : 1'b0;
  maw_fifo_push_ff            <= (rst_l) ? maw_fifo_push   : 1'b0;
  maw_fifow_push_ff           <= (rst_l) ? maw_fifow_push  : 1'b0;  
  maw_block_push_ff           <= (rst_l) ? maw_block_push  : 1'b0;
  maw_fifow_push_block_ff     <= (rst_l) ? maw_fifow_push_block : 1'b0;
  maw_cnt_ff[23:0]            <= (rst_l) ? maw_cnt[23:0]   : 24'h0;
  maw_cnt_minus1_ff[23:0]     <= (rst_l) ? maw_cnt_minus1[23:0] : 24'h0;   
  maw_ptr_new_ff              <= (rst_l) ? maw_ptr_new     : 8'h0;
  maw_ptr_new_2ff             <= (rst_l) ? maw_ptr_new_ff  : 8'h0;       
end

wire [20:0] maw_fifo0_out, maw_fifo1_out, maw_fifo2_out, maw_fifo3_out;
wire        maw_fifo0_valid;
wire        maw_fifo1_valid;
wire        maw_fifo2_valid, maw_fifo2_pop;
wire        maw_fifo3_valid, maw_fifo3_pop;

wire [3:0] mawtrk_clear_pos = { ~maw_fifo3_valid,
                                ~maw_fifo2_valid,
                                ~maw_fifo1_valid,
                                ~maw_fifo0_valid };

wire [3:0] mawtrk_fifo_num, mawtrk_bid_hit;

wire [C_M_AXI_THREAD_ID_WIDTH-1:0] mawtrk_in_push_id = cmd_out_mw[52:47];
wire [C_M_AXI_THREAD_ID_WIDTH-1:0] mawtrk_in_search_id =
                                        bid_m_ff[C_M_AXI_THREAD_ID_WIDTH-1:0];

wire dis_dis_out_of_order;
generate if(C_ATG_BASIC_AXI4 == 0)  begin : ATG_M_W_OOO_YES
  assign dis_dis_out_of_order = 1'b0;
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1)  begin : ATG_M_W_OOO_NO
  assign dis_dis_out_of_order = 1'b1;
end
endgenerate
// flop inputs to maw_track by 1 stage 
// search should not be flopped, as search_id and search_hit occurs in 1 clock
// cycle.Delaying search, causes to hit a wrong search ID.
reg [C_M_AXI_THREAD_ID_WIDTH-1:0] mawtrk_in_push_id_1ff;
reg [C_M_AXI_THREAD_ID_WIDTH-1:0] mawtrk_in_search_id_1ff;
reg [3:0]                         mawtrk_clear_pos_1ff;
always @(posedge Clk) begin
 mawtrk_in_push_id_1ff   <=  mawtrk_in_push_id ;
 mawtrk_in_search_id_1ff <=  mawtrk_in_search_id; 
 mawtrk_clear_pos_1ff    <=  mawtrk_clear_pos;
end
axi_traffic_gen_v2_0_10_id_track #(
.ID_WIDTH(C_M_AXI_THREAD_ID_WIDTH)
) Maw_track (
        .Clk           (Clk                                                 ),
        .rst_l         (rst_l                                               ),
        .in_push_id    (mawtrk_in_push_id_1ff[C_M_AXI_THREAD_ID_WIDTH-1:0]  ),
        .in_push       (maw_fifo_push_1ff                                   ),
        .in_search_id  (mawtrk_in_search_id[C_M_AXI_THREAD_ID_WIDTH-1:0]    ),
        .in_clear_pos  (mawtrk_clear_pos[3:0]                               ),
        .in_only_entry0(dis_dis_out_of_order                                        ),
        .out_push_pos  (mawtrk_fifo_num[3:0]                                ),
        .out_search_hit(mawtrk_bid_hit[3:0]                                 ),
        .out_free      (mawtrk_free[3:0]                                    )
);

wire [100:0] maw_fifo_out;
wire [31:0] maw_fifo_out_ext;
wire        maw_fifo_valid, maw_fifo_pop;
//flop maw_fifo_pop for timing improvement
reg [100:0] cmd_out_mw_1ff;
reg [48:0] cmd_out_mw_opt_1ff ;
generate if(C_ATG_BASIC_AXI4 == 0) begin : AXI4_AW_BASIC1_YES
  always @(posedge Clk) begin
    cmd_out_mw_1ff <=  { cmd_out_mw[123:116],cmd_out_mw[115:100], cmd_out_mw[76:0] } ;
  end
end
endgenerate
// Command Forma:Field: bits: Actual bit location in 128 bit data.
// address       32  31  0
// len            8  39  32
// lock           1  40  40
// reserved       1  41  41
// burst          2  43  42
// size           3  46  44
// id             6  52  47
// prot           3  55  53
// reserved       4  59  56
// last addr      3  62  60
// valid cmd      1  63  63
// mstram index  13  76  64
// other depend   9  85  77
// my depend      9  94  86
// reserved       1  95  95
// expected resp  3  98  96
// reserved       1  99  99
// cache          4  103  100
// user           8  111  104
// qos            4  115  112
// reserved      12  127  116
generate if(C_ATG_BASIC_AXI4 == 1) begin : AXI4_AW_BASIC1_NO
  always @(posedge Clk) begin
   cmd_out_mw_opt_1ff <= { 
                           cmd_out_mw[52:47],     //id
                           cmd_out_mw[46:44],     //size
                           cmd_out_mw[39:32],     //len
                           cmd_out_mw[31: 0]   }; //address
  end
end
endgenerate
localparam EX_FIFO_DEPTH      = 8;  //16 : Original values.
localparam EX_FIFO_DEPTHBITS  = 3;  // 4
localparam EX_FIFO_FULL_LEVEL = 6;  //14


reg maw_fifo_push_2ff;
reg maw_fifo_push_3ff;
reg maw_fifo_push_4ff;
reg maw_fifo_push_5ff;
always @(posedge Clk) begin
  maw_fifo_push_2ff     <= (rst_l) ? maw_fifo_push_1ff : 1'b0 ;
  maw_fifo_push_3ff     <= (rst_l) ? maw_fifo_push_2ff : 1'b0 ;
  maw_fifo_push_4ff     <= (rst_l) ? maw_fifo_push_3ff : 1'b0 ;
  maw_fifo_push_5ff     <= (rst_l) ? maw_fifo_push_4ff : 1'b0 ;    

end

generate if(C_ATG_BASIC_AXI4 == 0) begin : AXI4_AW_BASIC2_NO
axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH       (101           ),
  .DEPTH       (8             ),
  .DEPTHBITS   (3             ),
  .HEADREG     (1             ),
  .ZERO_INVALID(C_ZERO_INVALID),
  .FULL_LEVEL  (6             )
) Maw_fifo (
        .Clk              (Clk                ),
        .rst_l            (rst_l              ),
        .in_data          (cmd_out_mw_1ff     ),
        .in_push          (maw_fifo_push_3ff  ),
        .in_pop           (maw_fifo_pop       ),
        .out_data         (maw_fifo_out[100:0] ),
        .is_full          (                   ),
        .is_notfull       (maw_fifo_notfull   ),
        .is_empty         (                   ),
        .out_valid        (maw_fifo_valid     ),
        .ex_fifo_dbgout   (                   ) 
);
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1) begin : AXI4_AW_BASIC2_YES
axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH       (49            ),
  .DEPTH       (8             ),
  .DEPTHBITS   (3             ),
  .HEADREG     (1             ),
  .ZERO_INVALID(C_ZERO_INVALID),
  .FULL_LEVEL  (6             )
) Maw_fifo (
        .Clk              (Clk                ),
        .rst_l            (rst_l              ),
        .in_data          (cmd_out_mw_opt_1ff ),
        .in_push          (maw_fifo_push_1ff  ),
        .in_pop           (maw_fifo_pop       ),
        .out_data         (maw_fifo_out[48:0] ),
        .is_full          (                   ),
        .is_notfull       (maw_fifo_notfull   ),
        .is_empty         (                   ),
        .out_valid        (maw_fifo_valid     ),
        .ex_fifo_dbgout   (                   ) 
);
end
endgenerate

generate if(C_M_AXI_ADDR_WIDTH > 32) begin : AXI4_AW_EXT_ADDR
axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH       (32            ),
  .DEPTH       (8             ),
  .DEPTHBITS   (3             ),
  .HEADREG     (1             ),
  .ZERO_INVALID(C_ZERO_INVALID),
  .FULL_LEVEL  (6             )
) Maw_fifo_ext (
        .Clk              (Clk                ),
        .rst_l            (rst_l              ),
        .in_data          (cmd_out_mw_ext     ),
        .in_push          (maw_fifo_push_1ff  ),
        .in_pop           (maw_fifo_pop       ),
        .out_data         (maw_fifo_out_ext   ),
        .is_full          (                   ),
        .is_notfull       (                   ),
        .is_empty         (                   ),
        .out_valid        (                   ),
        .ex_fifo_dbgout   (                   ) 
);
end
endgenerate

assign maw_fifo_pop = awvalid_m && awready_m;


//generate if(C_ATG_BASIC_AXI4 == 0 && C_M_AXI_ADDR_WIDTH == 32) begin : BASIC_NO_DEFAULT_ADDR
//assign awaddr_m[C_M_AXI_ADDR_WIDTH-1:0]    = maw_fifo_out[31:0];
//end
//endgenerate
//
//generate if(C_ATG_BASIC_AXI4 == 0 && C_M_AXI_ADDR_WIDTH > 32) begin : BASIC_NO_EXTENDED_ADDR
//assign awaddr_m[C_M_AXI_ADDR_WIDTH-1:0]    = {maw_fifo_out_ext[C_M_AXI_ADDR_WIDTH-33:0],maw_fifo_out[31:0]};
//end
//endgenerate
//
//generate if(C_ATG_BASIC_AXI4 == 1 && C_M_AXI_ADDR_WIDTH == 32) begin : BASIC_YES_DEFAULT_ADDR
//assign awaddr_m[C_M_AXI_ADDR_WIDTH-1:0]    = maw_fifo_out[31:0];
//end
//endgenerate
//
//generate if(C_ATG_BASIC_AXI4 == 1 && C_M_AXI_ADDR_WIDTH > 32) begin : BASIC_YES_EXTENDED_ADDR
//assign awaddr_m[C_M_AXI_ADDR_WIDTH-1:0]    = {maw_fifo_out_ext[C_M_AXI_ADDR_WIDTH-33:0],maw_fifo_out[31:0]};
//end
//endgenerate

generate if(C_M_AXI_ADDR_WIDTH == 32) begin : AW_DEFAULT_ADDR
assign awaddr_m[C_M_AXI_ADDR_WIDTH-1:0]    = maw_fifo_out[31:0];
end
endgenerate

generate if(C_M_AXI_ADDR_WIDTH > 32) begin : AW_EXTENDED_ADDR
assign awaddr_m[C_M_AXI_ADDR_WIDTH-1:0]    = {maw_fifo_out_ext[C_M_AXI_ADDR_WIDTH-33:0],maw_fifo_out[31:0]};
end
endgenerate

generate if(C_ATG_BASIC_AXI4 == 0) begin : AXI4_AW_BASIC_NO
assign awid_m[C_M_AXI_THREAD_ID_WIDTH-1:0] = maw_fifo_out[52:47];
assign awsize_m[2:0]                       = maw_fifo_out[46:44];
assign awlen_m[7:0]                        = maw_fifo_out[39:32];
assign awvalid_m                           = maw_fifo_valid;
assign awlock_m[0:0]                       = maw_fifo_out[40:40]; //awlock made 1-bit signal
assign awburst_m[1:0]                      = maw_fifo_out[43:42];
assign awprot_m[2:0]                       = maw_fifo_out[55:53];
assign awcache_m[3:0]                      = maw_fifo_out[80:77];
assign awuser_m[C_M_AXI_AWUSER_WIDTH-1:0]  = {maw_fifo_out[100:93],maw_fifo_out[88:81]};
assign awqos_m[3:0]                        = maw_fifo_out[92:89];
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1) begin : AXI4_AW_BASIC_YES
assign awid_m[C_M_AXI_THREAD_ID_WIDTH-1:0] = maw_fifo_out[48:43];
assign awsize_m[2:0]                       = maw_fifo_out[42:40];
assign awlen_m[7:0]                        = maw_fifo_out[39:32];
assign awvalid_m                           = maw_fifo_valid;
assign awlock_m[0:0]                       = 1'b0;
assign awburst_m[1:0]                      = 2'h1;
assign awprot_m[2:0]                       = 3'b000;
assign awcache_m[3:0]                      = 4'b0011;
assign awuser_m[C_M_AXI_AWUSER_WIDTH-1:0]  = {C_M_AXI_AWUSER_WIDTH{1'b0}};
assign awqos_m[3:0]                        = 4'h0;
end
endgenerate
wire [76+1:0] maw_fifow_out;
//
//add flopping state for timing improvement
//
reg [76+1:0] maw_fifow_in_ff;

always @(posedge Clk) begin
  maw_fifow_in_ff <= (rst_l) ? {param_cmdw_disable_submitincr,cmd_out_mw[76:0]} :  77'h0 ;
end
axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH     (78),
  .DEPTH     (8 ),
  .DEPTHBITS (3 ),
  .HEADREG   (1 ),
  .FULL_LEVEL(6 )
) Maw_fifow (
        .Clk              (Clk                  ),
        .rst_l            (rst_l                ),
        .in_data          (maw_fifow_in_ff      ),
        .in_push          (maw_fifow_push_1ff   ),
        .in_pop           (maw_fifow_pop        ),
        .out_data         (maw_fifow_out[76+1:0]),
        .is_full          (                     ),
        .is_notfull       (maw_fifow_notfull    ),
        .is_empty         (                     ),
        .out_valid        (maw_fifow_valid      ),
        .ex_fifo_dbgout   (Maw_fifow_dbgout     )
);

wire [15:0] maw_agen_id;
wire [C_M_AXI_DATA_WIDTH/8-1:0] maw_agen_be;
wire        maw_agen_pop;
//
//add flopping state for timing improvement
//
reg [77:0] maw_fifow_out_ff;
reg        maw_fifow_pop_ff;
reg        maw_fifow_valid_ff;
always @(posedge Clk) begin
  maw_fifow_out_ff     <= (rst_l) ? maw_fifow_out    : 78'h0 ;
  maw_fifow_pop_ff     <= (rst_l) ? maw_fifow_pop    : 1'b0 ;
  maw_fifow_valid_ff   <= (rst_l) ? maw_fifow_valid  : 1'b0 ;
  maw_fifow_notfull_ff <= (rst_l) ? maw_fifow_notfull: 1'b0 ;
end

   
axi_traffic_gen_v2_0_10_addrgen #(
  .USE_ADDR_OFFSET   (1)                 ,
  .C_DATA_WIDTH      (C_M_AXI_DATA_WIDTH),
  .IS_READ           (1)                 ,
  .C_ATG_BASIC_AXI4  (C_ATG_BASIC_AXI4)  ,
  .C_ATG_AXI4LITE    (C_ATG_AXI4LITE)    
) Maw_agen (
        .Clk           (Clk                                   ),
        .rst_l         (rst_l                                 ),
        .in_addr       ({ 3'b000, maw_fifow_out[76:64] }   ),
        .in_addr_offset({1'b0,maw_fifow_out[7:0] }         ),
        .in_id         ({ 10'h0, maw_fifow_out[52:47]}     ),
        .in_len        (maw_fifow_out[39:32]               ),
        .in_size       (maw_fifow_out[46:44]               ),
        .in_lastaddr   ({3'b000,maw_fifow_out[62:60]}      ),
        .in_burst      (maw_fifow_out[43:42]               ),
        .in_push       (maw_fifow_pop                      ),
        .in_pop        (maw_agen_pop                          ),
        .in_user       (1'b0                                  ),
        .out_user      (                                      ),
        .out_addr      (maw_agen_addr[15:0]                   ),
        .out_id        (maw_agen_id[15:0]                     ),
        .out_be        (maw_agen_be[C_M_AXI_DATA_WIDTH/8-1:0] ),
        .out_done      (maw_agen_done                         ),
        .out_valid     (maw_agen_valid                        )
);


assign        maw_agen_pop = mw_fifo_notfull && maw_agen_valid;
assign        maw_fifow_pop = (~maw_agen_valid || maw_agen_done && maw_agen_pop) &&
                                                        maw_fifow_valid_ff && ~maw_fifow_pop_ff;


// Transmit master write data
reg [5:0] mw_id_ff;
reg [C_M_AXI_DATA_WIDTH/8-1:0] maw_agen_be_ff;
reg [15:0] maw_agen_addr_ff;
reg        maw_agen_done_ff, maw_agen_pop_ff;

wire [C_M_AXI_DATA_WIDTH*9/8+7-1:0] mw_fifo_out;

wire [5:0] mw_id = maw_agen_id[5:0];
wire [63:0] mw_be32 = maw_agen_be_ff[C_M_AXI_DATA_WIDTH/8-1:0];
wire [C_M_AXI_DATA_WIDTH-1:0] mw_in_mask = {
	{ 8 { mw_be32[63] } }, { 8 { mw_be32[62] } }, 
	{ 8 { mw_be32[61] } }, { 8 { mw_be32[60] } }, 
	{ 8 { mw_be32[59] } }, { 8 { mw_be32[58] } }, 
	{ 8 { mw_be32[57] } }, { 8 { mw_be32[56] } }, 
	{ 8 { mw_be32[55] } }, { 8 { mw_be32[54] } }, 
	{ 8 { mw_be32[53] } }, { 8 { mw_be32[52] } }, 
	{ 8 { mw_be32[51] } }, { 8 { mw_be32[50] } }, 
	{ 8 { mw_be32[49] } }, { 8 { mw_be32[48] } }, 
	{ 8 { mw_be32[47] } }, { 8 { mw_be32[46] } }, 
	{ 8 { mw_be32[45] } }, { 8 { mw_be32[44] } }, 
	{ 8 { mw_be32[43] } }, { 8 { mw_be32[42] } }, 
	{ 8 { mw_be32[41] } }, { 8 { mw_be32[40] } }, 
	{ 8 { mw_be32[39] } }, { 8 { mw_be32[38] } }, 
	{ 8 { mw_be32[37] } }, { 8 { mw_be32[36] } }, 
	{ 8 { mw_be32[35] } }, { 8 { mw_be32[34] } }, 
	{ 8 { mw_be32[33] } }, { 8 { mw_be32[32] } }, 
	{ 8 { mw_be32[31] } }, { 8 { mw_be32[30] } }, 
	{ 8 { mw_be32[29] } }, { 8 { mw_be32[28] } }, 
	{ 8 { mw_be32[27] } }, { 8 { mw_be32[26] } }, 
	{ 8 { mw_be32[25] } }, { 8 { mw_be32[24] } }, 
	{ 8 { mw_be32[23] } }, { 8 { mw_be32[22] } }, 
	{ 8 { mw_be32[21] } }, { 8 { mw_be32[20] } }, 
	{ 8 { mw_be32[19] } }, { 8 { mw_be32[18] } }, 
	{ 8 { mw_be32[17] } }, { 8 { mw_be32[16] } }, 
	{ 8 { mw_be32[15] } }, { 8 { mw_be32[14] } }, 
	{ 8 { mw_be32[13] } }, { 8 { mw_be32[12] } }, 
	{ 8 { mw_be32[11] } }, { 8 { mw_be32[10] } }, 
	{ 8 { mw_be32[9] } }, { 8 { mw_be32[8] } }, 
	{ 8 { mw_be32[7] } }, { 8 { mw_be32[6] } }, 
	{ 8 { mw_be32[5] } }, { 8 { mw_be32[4] } }, 
	{ 8 { mw_be32[3] } }, { 8 { mw_be32[2] } }, 
	{ 8 { mw_be32[1] } }, { 8 { mw_be32[0] } } };
wire [C_M_AXI_DATA_WIDTH-1:0] mw_data_masked = 
                      mram_out[C_M_AXI_DATA_WIDTH-1:0] & 
                      mw_in_mask[C_M_AXI_DATA_WIDTH-1:0];
                                        
wire [C_M_AXI_DATA_WIDTH*9/8+7-1:0] mw_in_data = {
                mw_id_ff[5:0], maw_agen_done_ff,                        //77:72
                maw_agen_be_ff[C_M_AXI_DATA_WIDTH/8-1:0],                                        //71:64
                mw_data_masked[C_M_AXI_DATA_WIDTH-1:0] };                                        //63:0


                                        //63:0

   


   reg [5:0] mw_id_2ff;   
   reg              maw_agen_done_2ff;
   
   
   
  
always @(posedge Clk) begin
        mw_id_ff[5:0] <= (rst_l) ? mw_id[5:0] : 6'h0;
        maw_agen_be_ff[C_M_AXI_DATA_WIDTH/8-1:0] <= (rst_l) ? 
                 maw_agen_be[C_M_AXI_DATA_WIDTH/8-1:0] : {(C_M_AXI_DATA_WIDTH/8){1'b0}};
        maw_agen_addr_ff[15:0] <= (rst_l) ? maw_agen_addr[15:0] : 16'h0;
        maw_agen_done_ff <= (rst_l) ? maw_agen_done : 1'b0;
        maw_agen_pop_ff <= (rst_l) ? maw_agen_pop : 1'b0;
        //2nd stage
        mw_id_2ff            <= (rst_l) ? mw_id_ff : 0;
        maw_agen_done_2ff    <= (rst_l) ? maw_agen_done_ff : 0;
end



   
axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH(C_M_AXI_DATA_WIDTH*9/8+7),
  .DEPTH       (8             ),
  .DEPTHBITS   (3             ),
  .HEADREG     (1             ),
  .ZERO_INVALID(C_ZERO_INVALID),
  .FULL_LEVEL  (6             )
) Mw_fifo (
        .Clk              (Clk              ),
        .rst_l            (rst_l            ),
	.in_data(mw_in_data[C_M_AXI_DATA_WIDTH*9/8+7-1:0]),
        .in_push          (maw_agen_pop_ff  ),
        .in_pop           (mw_fifo_pop      ),
	.out_data(mw_fifo_out[C_M_AXI_DATA_WIDTH*9/8+7-1:0]),
        .is_full          (                 ),
        .is_notfull       (mw_fifo_notfull  ),
        .is_empty         (                 ),
        .out_valid        (mw_fifo_valid    ),
        .ex_fifo_dbgout   (                 ) 
);

assign mw_fifo_pop = mw_fifo_valid && wready_m;
assign wvalid_m = mw_fifo_valid;


assign wdata_m[C_M_AXI_DATA_WIDTH-1:0] = mw_fifo_out[C_M_AXI_DATA_WIDTH-1:0];
assign wstrb_m[C_M_AXI_DATA_WIDTH/8-1:0] =
		mw_fifo_out[C_M_AXI_DATA_WIDTH*9/8-1:C_M_AXI_DATA_WIDTH];
assign wlast_m = mw_fifo_out[C_M_AXI_DATA_WIDTH*9/8];

axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH     (21),
  .DEPTH     (EX_FIFO_DEPTH),
  .DEPTHBITS (EX_FIFO_DEPTHBITS ),
  .HEADREG   (1 ),
  .FULL_LEVEL(EX_FIFO_FULL_LEVEL)
) Maw_fifo0 (
        .Clk              (Clk                             ),
        .rst_l            (rst_l                           ),
        .in_data          ({ param_cmdw_disable_submitincr,
                             reg0_mw_ptr_ff[7:0], 
                             cmd_out_mw[99:96], 
                             cmd_out_mw[62:61],
                             cmd_out_mw[52:47] }           ),
        .in_push          (mawtrk_fifo_num[0]              ),
        .in_pop           (maw_fifo0_pop                   ),
        .out_data         (maw_fifo0_out[20:0]             ),
        .is_full          (                                ),
        .is_notfull       (maw_fifo0_notfull               ),
        .is_empty         (                                ),
        .out_valid        (maw_fifo0_valid                 ),
        .ex_fifo_dbgout   (                                ) 
);

generate if(C_ATG_BASIC_AXI4 == 1)  begin : ATG_M_W_OOO_F_NO
  assign maw_fifo1_notfull = 1'b1;
  assign maw_fifo1_valid   = 1'b0;
  assign maw_fifo2_notfull = 1'b1;
  assign maw_fifo2_valid   = 1'b0;
  assign maw_fifo3_notfull = 1'b1;
  assign maw_fifo3_valid   = 1'b0;
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 0)  begin : ATG_M_W_OOO_F_YES
axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH     (21),
  .DEPTH     (EX_FIFO_DEPTH),
  .DEPTHBITS (EX_FIFO_DEPTHBITS ),
  .HEADREG   (1 ),
  .FULL_LEVEL(EX_FIFO_FULL_LEVEL)
) Maw_fifo1 (
        .Clk              (Clk                             ),
        .rst_l            (rst_l                           ),
        .in_data          ({ param_cmdw_disable_submitincr,
                             reg0_mw_ptr_ff[7:0], 
                             cmd_out_mw[99:96], 
                             cmd_out_mw[62:61],
                             cmd_out_mw[52:47] }           ),
        .in_push          (mawtrk_fifo_num[1]              ),
        .in_pop           (maw_fifo1_pop                   ),
        .out_data         (maw_fifo1_out[20:0]             ),
        .is_full          (                                ),
        .is_notfull       (maw_fifo1_notfull               ),
        .is_empty         (                                ),
        .out_valid        (maw_fifo1_valid                 ),
        .ex_fifo_dbgout   (                                ) 
);

axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH     (21),
  .DEPTH     (EX_FIFO_DEPTH),
  .DEPTHBITS (EX_FIFO_DEPTHBITS ),
  .HEADREG   (1 ),
  .FULL_LEVEL(EX_FIFO_FULL_LEVEL)
) Maw_fifo2 (
        .Clk              (Clk                             ),
        .rst_l            (rst_l                           ),
        .in_data          ({ param_cmdw_disable_submitincr,
                             reg0_mw_ptr_ff[7:0], 
                             cmd_out_mw[99:96], 
                             cmd_out_mw[62:61],
                             cmd_out_mw[52:47] }           ),
        .in_push          (mawtrk_fifo_num[2]              ),
        .in_pop           (maw_fifo2_pop                   ),
        .out_data         (maw_fifo2_out[20:0]             ),
        .is_full          (                                ),
        .is_notfull       (maw_fifo2_notfull               ),
        .is_empty         (                                ),
        .out_valid        (maw_fifo2_valid                 ),
        .ex_fifo_dbgout   (                                ) 
);

axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH     (21),
  .DEPTH     (EX_FIFO_DEPTH),
  .DEPTHBITS (EX_FIFO_DEPTHBITS ),
  .HEADREG   (1 ),
  .FULL_LEVEL(EX_FIFO_FULL_LEVEL)
) Maw_fifo3 (
        .Clk              (Clk                              ),
        .rst_l            (rst_l                            ),
        .in_data          ({ param_cmdw_disable_submitincr,
                             reg0_mw_ptr_ff[7:0], 
                             cmd_out_mw[99:96], 
                             cmd_out_mw[62:61],
                             cmd_out_mw[52:47] }            ),
        .in_push          (mawtrk_fifo_num[3]               ),
        .in_pop           (maw_fifo3_pop                    ),
        .out_data         (maw_fifo3_out[20:0]              ),
        .is_full          (                                 ),
        .is_notfull       (maw_fifo3_notfull                ),
        .is_empty         (                                 ),
        .out_valid        (maw_fifo3_valid                  ),
        .ex_fifo_dbgout   (                                 ) 
);

end
endgenerate

assign maw_fifo0_pop = b_complete_ff && maw_fifo0_valid && mawtrk_bid_hit[0];
assign maw_fifo1_pop = b_complete_ff && maw_fifo1_valid && mawtrk_bid_hit[1];
assign maw_fifo2_pop = b_complete_ff && maw_fifo2_valid && mawtrk_bid_hit[2];
assign maw_fifo3_pop = b_complete_ff && maw_fifo3_valid && mawtrk_bid_hit[3];

/****
// MASTER BID
reg        bready_int_ff = 1'b0;
reg        b_resp_unexp_ff;
reg        b_resp_bad_ff;


wire        b_complete = bready_m && bvalid_m;

wire [2:0] b_resp_exp = ((mawtrk_bid_hit[0]) ? maw_fifo0_out[10:8] : 3'b000) |
                        ((mawtrk_bid_hit[1]) ? maw_fifo1_out[10:8] : 3'b000) |
                        ((mawtrk_bid_hit[2]) ? maw_fifo2_out[10:8] : 3'b000) |
                        ((mawtrk_bid_hit[3]) ? maw_fifo3_out[10:8] : 3'b000);
wire [2:0] b_resp_mask =
                ((bresp_m_ff[1:0] == 2'b00) ? 3'b001 : 3'b000) |
                ((bresp_m_ff[1:0] == 2'b01) ? 3'b010 : 3'b000) |
                ((bresp_m_ff[1] == 1'b1) ? 3'b100 : 3'b000);
wire [2:0] b_resp_allowed = (b_resp_exp[2:0] == 3'b000) ? 3'b001 :
                                                                b_resp_exp[2:0];
wire        b_resp_ok = ((b_resp_mask[2:0] & b_resp_allowed[2:0]) != 3'b000);
wire        b_resp_bad = b_complete_ff && ~b_resp_ok;
wire        b_resp_unexp = b_complete_ff & (mawtrk_bid_hit[3:0] == 4'h0);

always @(posedge Clk) begin
        bready_int_ff <= (rst_l) ? bready_int : 1'b0;
        b_complete_ff <= (rst_l) ? b_complete : 1'b0;
        b_resp_unexp_ff <= (rst_l) ? b_resp_unexp : 1'b0;
        b_resp_bad_ff <= (rst_l) ? b_resp_bad : 1'b0;
        bid_m_ff[C_M_AXI_THREAD_ID_WIDTH-1:0] <= (rst_l) ?
                                bid_m[C_M_AXI_THREAD_ID_WIDTH-1:0] : 1'b0;
        bresp_m_ff[1:0] <= (rst_l) ? bresp_m[1:0] : 2'b00;
end

assign bready_m = bready_int_ff;
****/


/* grahams : new version that does WR completion based on wlast
                and NOT on bresp.... several IP does not wait for 
                resp signal before completing a tranx
 */
   



   // new complete signal based on wlast
   //wire        b_complete = wlast_m && wready_m;
   wire        b_complete = bready_m && bvalid_m;


   
wire [2:0] b_resp_exp ;
generate if(C_ATG_BASIC_AXI4 == 0)  begin : ATG_M_W1_OOO_F_YES
assign b_resp_exp = ((mawtrk_bid_hit[0]) ? maw_fifo0_out[10:8] : 3'b000) |
                        ((mawtrk_bid_hit[1]) ? maw_fifo1_out[10:8] : 3'b000) |
                        ((mawtrk_bid_hit[2]) ? maw_fifo2_out[10:8] : 3'b000) |
                        ((mawtrk_bid_hit[3]) ? maw_fifo3_out[10:8] : 3'b000);
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1)  begin : ATG_M_W1_OOO_F_NO
assign b_resp_exp = ((mawtrk_bid_hit[0]) ? maw_fifo0_out[10:8] : 3'b000) ;
end
endgenerate
   wire [2:0] b_resp_mask = 
                ((bresp_m_ff[1:0] == 2'b00) ? 3'b001 : 3'b000) |
                ((bresp_m_ff[1:0] == 2'b01) ? 3'b010 : 3'b000) |
                ((bresp_m_ff[1] == 1'b1) ? 3'b100 : 3'b000);
   wire [2:0] b_resp_allowed = (b_resp_exp[2:0] == 3'b000) ? 3'b001 : b_resp_exp[2:0];
wire        b_resp_ok = ((b_resp_mask[2:0] & b_resp_allowed[2:0]) != 3'b000);
assign      b_resp_bad = b_complete_ff && ~b_resp_ok;
wire        b_resp_unexp = b_complete_ff & (mawtrk_bid_hit[3:0] == 4'h0);

always @(posedge Clk) begin
        b_complete_ff <= (rst_l) ? b_complete : 1'b0;
        b_resp_unexp_ff <= (rst_l) ? b_resp_unexp : 1'b0;
        b_resp_bad_ff <= (rst_l) ? b_resp_bad : 1'b0;
        bid_m_ff[C_M_AXI_THREAD_ID_WIDTH-1:0] <= (rst_l) ?
                                bid_m[C_M_AXI_THREAD_ID_WIDTH-1:0] : 1'b0;
        bresp_m_ff[1:0] <= (rst_l) ? bresp_m[1:0] : 2'b00;
end
assign bready_m = ~(b_complete_ff);  //toggle bready for every bvalid match. 
                                                     //cannot accept
                                                     //continuous bvalid

   
// MASTER complete logic

wire [15:0] maw_fifo0_tag_exp = (maw_fifo0_pop) ?
                        (16'h1 << maw_fifo0_out[15:12]) : 16'h0;
wire [15:0] maw_fifo1_tag_exp = (maw_fifo1_pop) ?
                        (16'h1 << maw_fifo1_out[15:12]) : 16'h0;
wire [15:0] maw_fifo2_tag_exp = (maw_fifo2_pop) ?
                        (16'h1 << maw_fifo2_out[15:12]) : 16'h0;
wire [15:0] maw_fifo3_tag_exp = (maw_fifo3_pop) ?
                        (16'h1 << maw_fifo3_out[15:12]) : 16'h0;
assign maw_complete_next2 = (16'h1 << mwr_complete_ptr_ff[3:0]);
assign maw_complete_inc_exp = maw_complete_next2[15:0] &
                                                maw_complete_vec_ff[15:0];
assign        maw_complete_doinc = (maw_complete_inc_exp[15:0] != 16'h0);
wire [15:0] maw_complete_vec = ~maw_complete_inc_exp[15:0] &
                (maw_fifo0_tag_exp[15:0] | maw_fifo1_tag_exp[15:0] |
                maw_fifo2_tag_exp[15:0] | maw_fifo3_tag_exp[15:0] |
                                                maw_complete_vec_ff[15:0]);



assign maw_fifo0_user_disableincr = (maw_fifo0_pop) ?
                        maw_fifo0_out[20] : 1'h0;
wire  maw_fifo1_user_disableincr = (maw_fifo1_pop) ?
                        maw_fifo1_out[20] : 1'h0;
wire maw_fifo2_user_disableincr = (maw_fifo2_pop) ?
                        maw_fifo2_out[20] : 1'h0;
wire maw_fifo3_user_disableincr = (maw_fifo3_pop) ?
                        maw_fifo3_out[20] : 1'h0;

   assign maw_disableincr = maw_fifo0_user_disableincr | 
                          maw_fifo1_user_disableincr | 
                          maw_fifo2_user_disableincr | 
                          maw_fifo3_user_disableincr;
   
   

// using disableincr bit that is tracked for parameterized mode
// CR#768069: Reset complete_ptr when current value equal to latched command
// index.
wire rst_complete_ptr = (last_cmd_index[8:0] == mwr_complete_ptr_ff ) ;//& reg0_loop_en_ff;
assign mwr_complete_ptr = ((~reg0_m_enable_ff)|(rst_complete_ptr)) ? 9'h0 :
                          ((maw_complete_doinc & ~maw_disableincr_ff) ? 
                           mwr_complete_ptr_ff[8:0] + 9'h1 :
                           mwr_complete_ptr_ff[8:0]);

//dec_ptr: pulse when command command pointer is incremented.
assign dec_ptr = maw_complete_doinc & ~maw_disableincr_ff;
   
assign mw_done = (reg0_m_enable_ff && maw_done_ff && (mwr_complete_ptr[8:0] == reg0_mw_ptr_ff[8:0]))? 1'b1 :
                 ((~reg0_m_enable_ff)?1'b0:mw_done_ff);



always @(posedge Clk) begin
        maw_disableincr_ff <= (rst_l) ? maw_disableincr : 1'h0;
        mwr_complete_ptr_ff[8:0] <= (rst_l) ? mwr_complete_ptr[8:0] : 9'h0;
        maw_complete_vec_ff[15:0] <= (rst_l) ? maw_complete_vec[15:0] : 16'h0;
        mw_done_ff <= (rst_l) ? mw_done : 1'b0;
end

endmodule
