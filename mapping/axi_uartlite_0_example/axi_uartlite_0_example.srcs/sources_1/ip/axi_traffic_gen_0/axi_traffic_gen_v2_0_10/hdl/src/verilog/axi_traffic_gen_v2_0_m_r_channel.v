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
// Filename:       axi_traffic_gen_v2_0_10_m_r_channel.v
// Version : v1.0
// Description:    master read channel: Issue read commands based on the cmd
//                 ram entries.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
`include "axi_traffic_gen_v2_0_10_defines.v"
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_m_r_channel #
(
  parameter C_M_AXI_THREAD_ID_WIDTH = 1,
  parameter C_M_AXI_ARUSER_WIDTH    = 8,
  parameter C_ZERO_INVALID          = 1,
  parameter C_M_AXI_DATA_WIDTH      = 32,
  parameter C_M_AXI_ADDR_WIDTH      = 32,
  parameter C_ATG_BASIC_AXI4        = 1,
  parameter C_ATG_AXI4LITE          = 0
) (
// system
 input                                Clk                           ,
 input                                rst_l                         ,
//ar
 output [C_M_AXI_THREAD_ID_WIDTH-1:0] arid_m                        ,
 output [C_M_AXI_ADDR_WIDTH-1:0]      araddr_m                      ,
 output [7:0]                         arlen_m                       ,
 output [2:0]                         arsize_m                      ,
 output [1:0]                         arburst_m                     ,
 output [0:0]                         arlock_m                      ,
 output [3:0]                         arcache_m                     ,
 output [2:0]                         arprot_m                      ,
 output [3:0]                         arqos_m                       ,
 output [C_M_AXI_ARUSER_WIDTH-1:0]    aruser_m                      ,
 output                               arvalid_m                     ,
 input                                arready_m                     ,
//r
 input [C_M_AXI_THREAD_ID_WIDTH-1:0]  rid_m                         ,
 input                                rlast_m                       ,
 input [C_M_AXI_DATA_WIDTH-1:0]       rdata_m                       ,
 input [1:0]                          rresp_m                       ,
 input                                rvalid_m                      ,
 output                               rready_m                      ,
//cmd ram
 input  [127:0]                       cmd_out_mr                    , //from paramwrap logic
 input  [31:0]                        cmd_out_mr_ext                , //from addrram logic
 input                                cmdram_mr_regslice_id_stable  ,
//paramram
 input                                param_cmdr_delayop_valid      , 
 input [23:0]                         param_cmdr_count              ,
 input                                param_cmdr_repeatfixedop_valid,
 input                                param_cmdr_disable_submitincr ,
//masterram
 output [10:0]                        mram_waddr_ff                 ,     
 output [C_M_AXI_DATA_WIDTH/8-1:0]                         mram_we_ff                    ,        
 output [C_M_AXI_DATA_WIDTH-1:0]                        mram_write_data_ff            ,
//register block
 input                                reg0_m_enable_ff              ,
 input [9:0]                          reg0_mr_ptr_ff                ,
 input                                reg0_m_enable_cmdram_mrw_ff   ,
 input                                reg0_m_enable_cmdram_mrw      , 
 input                                reg0_m_enable_3ff             ,
 input                                reg0_loop_en_ff               ,
 input                                mwr_done                      ,
 output reg                           mr_done_ff                    ,
 output                               mr_fifo_out_resp_bad          ,
 output reg                           mr_bad_last_ff                ,
 output                               mr_unexp                      ,
 output        [9:0]                  reg0_mr_ptr_update            ,
//masterwrite
 input [8:0]                          mwr_complete_ptr_ff           ,
 output reg [8:0]                     mrd_complete_ptr_ff           ,
//to exeterna modules              
 output reg [9:0]                     mar_ptr_new_ff                , 
 output reg [9:0]                     mar_ptr_new_2ff               , 
 output reg                           mar_fifo_push_ff              ,
//debug-capture
 output                               mar_complete_doinc            ,
 output                               mar_done                      ,
 output                               mr_done                       ,
 output reg                           mar_param_disableincr_ff      ,   
 output                               mar_fifo_push

);


reg [23:0] mar_cnt_ff;
reg        mar_done_ff, mar_block_push_ff;

wire        mar_fifo_notfull;
wire        mar_fifo0_notfull, mar_fifo1_notfull, mar_fifo2_notfull,
                mar_fifo3_notfull;
wire [3:0] martrk_free;

//  CR#768069: when the loop is enabled, issue & complete pointers
//  cannot be directly compared as the issue pointer roll backs to start 
//  value after the last command is issued.
//  So inc/dec_ptr pulses are used to calculate the complete depth.
reg [8:0] mar_complete_depth;
wire inc_ptr,dec_ptr;
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    mar_complete_depth <= 9'h0;
  end else if(inc_ptr & dec_ptr) begin
    mar_complete_depth <= mar_complete_depth;
  end else if(inc_ptr) begin
    mar_complete_depth <= mar_complete_depth+1'b1;
  end else if(dec_ptr) begin
    mar_complete_depth <= mar_complete_depth-1'b1;
  end
end
//wire [8:0] mar_complete_depth = (reg0_mr_ptr_ff[8:0]-mrd_complete_ptr_ff[8:0]);
wire        mar_block_push = (mar_complete_depth[8:0] >= 9'h0d);

/////////////////////////////
wire dis_latch;
reg dis_reg;
reg mar_valid_d1;
wire mar_valid;
wire cur_itrn_dis_rcvd;    //current iteration disable received
reg  cur_itrn_dis_rcvd_d1; //current iteration disable received 1clk delayed

// Push cmd_out_mr into mar_fifo, if rd_depend and wr_depend are met

wire  mar_fifo_push_xff;
wire        mar_cnt_reload = ~reg0_m_enable_cmdram_mrw_ff || mar_fifo_push_xff || (dis_reg && ~dis_latch);

   
wire [7:0] mar_cnt_expand = 8'h00;
//                ((cmd_out_mr[59:56] == 4'h0) ? 8'h00 : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'h1) ? 8'h00 : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'h2) ? 8'h01 : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'h3) ? 8'h02 : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'h4) ? 8'h06 : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'h5) ? 8'h09 : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'h6) ? 8'h0c : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'h7) ? 8'h11 : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'h8) ? 8'h18 : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'h9) ? 8'h21 : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'ha) ? 8'h32 : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'hb) ? 8'h45 : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'hc) ? 8'h68 : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'hd) ? 8'h81 : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'he) ? 8'hbe : 8'h00) |
//                ((cmd_out_mr[59:56] == 4'hf) ? 8'hff : 8'h00);
wire        mar_cnt_is_not0 = (mar_cnt_ff[23:0] != 24'h0);
wire        mar_cnt_ok = ~mar_cnt_reload && ~mar_cnt_is_not0;

wire [8:0] mar_wr_depend = cmd_out_mr[85:77];
wire [8:0] mar_rd_depend = cmd_out_mr[94:86];
wire mar_depend_ok = (reg0_loop_en_ff | mwr_done)? 1'b1 :
                     ((mar_rd_depend[8:0] <= mrd_complete_ptr_ff[8:0]) &&
                      (mar_wr_depend[8:0] <= mwr_complete_ptr_ff[8:0]));

   
//wire        mar_valid = cmd_out_mr[63] && reg0_m_enable_3ff;
//   wire        mar_valid = (cmd_out_mr[63] &&  cmdram_mr_regslice_data_stable)   && reg0_m_enable_cmdram_mr;
   wire        mar_valid_i = (cmd_out_mr[63] &&     cmdram_mr_regslice_id_stable)   && reg0_m_enable_cmdram_mrw && reg0_m_enable_3ff;

//   reg         mar_valid_ff;   
//   always @(posedge Clk) begin
//      mar_valid_ff <= (rst_l) ? mar_valid : 0;      
//   end
   
assign dis_latch = (cur_itrn_dis_rcvd == 1'b1) ? 1'b1 : ((mar_valid_i == 1'b1) ? 1'b0 : dis_reg);

always @(posedge Clk) begin
  dis_reg <= (rst_l) ? dis_latch : 1'b0;
  mar_valid_d1 <= (rst_l) ? mar_valid_i : 1'b0;
end

assign mar_valid = (dis_reg == 1'b1) ? mar_valid_d1 : mar_valid_i;
////////////////////////////   
   
//wire        mar_delay_ok = (cmd_out_mr[59:56] == 4'h0) || mar_cnt_ok;
wire        mar_delay_ok = (cmd_out_mr[59:56] == 4'h0 && 
                         ~( param_cmdr_delayop_valid || param_cmdr_repeatfixedop_valid)) || mar_cnt_ok;   
//flop delay_ok for timing improvement
reg mar_delay_ok_ff;
always @(posedge Clk) begin
        mar_delay_ok_ff <= (rst_l) ? mar_delay_ok : 1'b0;
end
wire        mar_cnt_do_dec = mar_fifo_notfull && mar_depend_ok &&
                        mar_fifo0_notfull && mar_fifo1_notfull &&
                        mar_fifo2_notfull && mar_fifo3_notfull &&
                        ~mar_block_push_ff && (martrk_free[3:0] != 4'h0);
assign        mar_fifo_push      = mar_valid && mar_cnt_do_dec && mar_delay_ok_ff && ~mar_fifo_push_ff;

 axi_traffic_gen_v2_0_10_regslice
  #(
    .DWIDTH   (1                      ),
    .IDWIDTH  (1                      ),
    .DATADEPTH(`REGSLICE_FIFOPUSH_DATA)
    )
   marfifopush_regslice
   (
    .din         (mar_fifo_push    ),
    .dout        (mar_fifo_push_xff),    
    .dout_early  (                 ),      
    .idin        (1'b0             ),      
    .idout       (                 ),
    .id_stable   (                 ),
    .id_stable_ff(                 ),
    .data_stable (                 ), 
    .clk         (Clk              ),  
    .reset       (~rst_l           )  
    ); 




// using delayed fifopush, since next cmd takes some cycles before showing up here
wire        param_mar_cnt_reload_delayop       = param_cmdr_delayop_valid && (~reg0_m_enable_cmdram_mrw_ff || mar_fifo_push_xff);
wire        param_mar_cnt_reload_repeatfixedop = param_cmdr_repeatfixedop_valid && (~reg0_m_enable_cmdram_mrw_ff || mar_fifo_push_xff || (dis_reg && ~dis_latch)); 



  
/*   
wire [23:0] mar_cnt = (param_mar_cnt_reload_delayop)       ? param_cmdr_count_ff[23:0]   :  
                      (param_mar_cnt_reload_repeatfixedop) ? {12'h0,param_cmdr_count_ff[19:8]}   :  
                      (mar_cnt_reload)                     ? {16'h0,mar_cnt_expand[7:0]} :            
                      (mar_cnt_do_dec)                     ? mar_cnt_minus1_ff :            
                                                             mar_cnt_ff[23:0];
*/
reg [23:0]         mar_cnt_minus1_ff   ;
   wire [23:0] mar_cnt_minus1 = mar_cnt_ff[23:0] - { 22'h0, mar_cnt_is_not0 };
wire [23:0] mar_cnt = (param_mar_cnt_reload_delayop)       ? param_cmdr_count[23:0]   :  
                      (param_mar_cnt_reload_repeatfixedop) ? {12'h0,param_cmdr_count[19:8]}   :  
                      //(mar_cnt_reload)                     ? {16'h0,mar_cnt_expand[7:0]} :            
                      (mar_cnt_do_dec)                     ? mar_cnt_minus1 :            
                                                             mar_cnt_ff[23:0];

   

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
                           ((~cmd_out_mr[63] &&  cmdram_mr_regslice_id_stable)|| mar_done_ff);
wire cur_itrn_done;
always @(posedge Clk) begin
  cur_itrn_dis_rcvd_d1 <= (rst_l) ? cur_itrn_dis_rcvd : 1'b0;
end
assign cur_itrn_done = cur_itrn_dis_rcvd & ~cur_itrn_dis_rcvd_d1;

assign  mar_done = reg0_m_enable_ff && reg0_m_enable_3ff && ~reg0_loop_en_ff &&
                   ((~cmd_out_mr[63] &&  cmdram_mr_regslice_id_stable)   || mar_done_ff);
   // increment unless param'd disable incr is set
wire [9:0] mar_ptr_new = (cur_itrn_done)?10'h0:
                         ((mar_fifo_push_ff && ~param_cmdr_disable_submitincr) ? reg0_mr_ptr_ff[9:0] + 10'h1 :
                         reg0_mr_ptr_ff[9:0]);

//CR#768069:Hold the index where the invalid command received in cmdram set.
reg [9:0] last_cmd_index;
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    last_cmd_index <= 10'h3FF; 
  end else if(cur_itrn_done) begin
    last_cmd_index <= reg0_mr_ptr_ff; 
  end else begin
    last_cmd_index <= last_cmd_index;
  end
end

//inc_ptr: pulse when command issued pointer is incremented.
assign inc_ptr = mar_fifo_push_ff && ~param_cmdr_disable_submitincr;




assign        reg0_mr_ptr_update[9:0] = mar_ptr_new[9:0];



   
always @(posedge Clk) begin
        mar_done_ff <= (rst_l) ? mar_done : 1'b0;
        mar_fifo_push_ff <= (rst_l) ? mar_fifo_push : 1'b0;
        mar_block_push_ff <= (rst_l) ? mar_block_push : 1'b0;
        mar_cnt_ff[23:0] <= (rst_l) ? mar_cnt[23:0] : 20'h0;
        mar_cnt_minus1_ff[23:0] <= (rst_l) ? mar_cnt_minus1[23:0] : 20'h0;
        mar_ptr_new_ff  <= (rst_l) ? mar_ptr_new : 8'h0;
        mar_ptr_new_2ff  <= (rst_l) ? mar_ptr_new_ff            : 8'h0;      
   
end

//flop mar_fifo_push for timing improvement
reg mar_fifo_push_1ff ;
reg [100:0] cmd_out_mr_1ff ;
reg [48:0] cmd_out_mr_opt_1ff ;
  always @(posedge Clk) begin
    mar_fifo_push_1ff <= mar_fifo_push;
  end
generate if(C_ATG_BASIC_AXI4 == 0) begin : AXI4_AR_BASIC1_YES
  always @(posedge Clk) begin
    cmd_out_mr_1ff    <= { cmd_out_mr[123:116],cmd_out_mr[115:100], cmd_out_mr[76:0] };
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


generate if(C_ATG_BASIC_AXI4 == 1) begin : AXI4_AR_BASIC1_NO
  always @(posedge Clk) begin
   cmd_out_mr_opt_1ff <= { 
                           cmd_out_mr[52:47],     //id
                           cmd_out_mr[46:44],     //size
                           cmd_out_mr[39:32],     //len
                           cmd_out_mr[31: 0]   }; //address
  end
end
endgenerate
wire [100:0] mar_fifo_out;
wire [31:0] mar_fifo_out_ext;
wire        mar_fifo_valid, mar_fifo_pop;

generate if(C_ATG_BASIC_AXI4 == 0) begin : AXI4_AR_BASIC2_NO
axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH       (101           ),
  .DEPTH       (8             ),
  .DEPTHBITS   (3             ),
  .HEADREG     (1             ),
  .ZERO_INVALID(C_ZERO_INVALID),
  .FULL_LEVEL  (6             )
) Mar_fifo (
        .Clk              (Clk               ),
        .rst_l            (rst_l             ),
        .in_data          (cmd_out_mr_1ff    ),
        .in_push          (mar_fifo_push_1ff ),
        .in_pop           (mar_fifo_pop      ),
        .out_data         (mar_fifo_out[100:0]),
        .is_full          (                  ),
        .is_notfull       (mar_fifo_notfull  ),
        .is_empty         (                  ),
        .out_valid        (mar_fifo_valid    ),
        .ex_fifo_dbgout   (                  ) 
);
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1) begin : AXI4_AR_BASIC2_YES
axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH       (49            ),
  .DEPTH       (8             ),
  .DEPTHBITS   (3             ),
  .HEADREG     (1             ),
  .ZERO_INVALID(C_ZERO_INVALID),
  .FULL_LEVEL  (6             )
) Mar_fifo (
        .Clk              (Clk               ),
        .rst_l            (rst_l             ),
        .in_data          (cmd_out_mr_opt_1ff),
        .in_push          (mar_fifo_push_1ff ),
        .in_pop           (mar_fifo_pop      ),
        .out_data         (mar_fifo_out[48:0]),
        .is_full          (                  ),
        .is_notfull       (mar_fifo_notfull  ),
        .is_empty         (                  ),
        .out_valid        (mar_fifo_valid    ),
        .ex_fifo_dbgout   (                  ) 
);
end
endgenerate

generate if(C_M_AXI_ADDR_WIDTH > 32) begin : AXI4_AR_EXT_ADDR
axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH       (32            ),
  .DEPTH       (8             ),
  .DEPTHBITS   (3             ),
  .HEADREG     (1             ),
  .ZERO_INVALID(C_ZERO_INVALID),
  .FULL_LEVEL  (6             )
) Mar_fifo_ext (
        .Clk              (Clk               ),
        .rst_l            (rst_l             ),
        .in_data          (cmd_out_mr_ext    ),
        .in_push          (mar_fifo_push_1ff ),
        .in_pop           (mar_fifo_pop      ),
        .out_data         (mar_fifo_out_ext  ),
        .is_full          (                  ),
        .is_notfull       (                  ),
        .is_empty         (                  ),
        .out_valid        (                  ),
        .ex_fifo_dbgout   (                  ) 
);
end
endgenerate

assign mar_fifo_pop = arvalid_m && arready_m;


//Tie to default values to reduce resources.
//generate if(C_ATG_BASIC_AXI4 == 0 && C_M_AXI_ADDR_WIDTH == 32) begin : BASIC_NO_DEFAULT_ADDR
//assign araddr_m[C_M_AXI_ADDR_WIDTH-1:0]    = mar_fifo_out[31:0];
//end
//endgenerate
//
//generate if(C_ATG_BASIC_AXI4 == 0 && C_M_AXI_ADDR_WIDTH > 32) begin : BASIC_NO_EXTENDED_ADDR
//assign araddr_m[C_M_AXI_ADDR_WIDTH-1:0]    = {mar_fifo_out_ext[C_M_AXI_ADDR_WIDTH-33:0],mar_fifo_out[31:0]};
//end
//endgenerate

//generate if(C_ATG_BASIC_AXI4 == 1 && C_M_AXI_ADDR_WIDTH == 32) begin : BASIC_YES_DEFAULT_ADDR
//assign araddr_m[C_M_AXI_ADDR_WIDTH-1:0]    = mar_fifo_out[31:0];
//end
//endgenerate
//
//generate if(C_ATG_BASIC_AXI4 == 1 && C_M_AXI_ADDR_WIDTH > 32) begin : BASIC_YES_EXTENDED_ADDR
//assign araddr_m[C_M_AXI_ADDR_WIDTH-1:0]    = {mar_fifo_out_ext[C_M_AXI_ADDR_WIDTH-33:0],mar_fifo_out[31:0]};
//end
//endgenerate

generate if(C_M_AXI_ADDR_WIDTH == 32) begin : AR_DEFAULT_ADDR
assign araddr_m[C_M_AXI_ADDR_WIDTH-1:0]    = mar_fifo_out[31:0];
end
endgenerate

generate if(C_M_AXI_ADDR_WIDTH > 32) begin : AR_EXTENDED_ADDR
assign araddr_m[C_M_AXI_ADDR_WIDTH-1:0]    = {mar_fifo_out_ext[C_M_AXI_ADDR_WIDTH-33:0],mar_fifo_out[31:0]};
end
endgenerate

generate if(C_ATG_BASIC_AXI4 == 0) begin : AXI4_AR_BASIC_NO
assign arid_m[C_M_AXI_THREAD_ID_WIDTH-1:0] = mar_fifo_out[52:47];
assign arlen_m[7:0]                        = mar_fifo_out[39:32];
assign arvalid_m                           = mar_fifo_valid;
assign arsize_m[2:0]                       = mar_fifo_out[46:44];
assign arlock_m[0:0]                       = mar_fifo_out[40:40]; //arlock made 1-bit signal
assign arburst_m[1:0]                      = mar_fifo_out[43:42];
assign arprot_m[2:0]                       = mar_fifo_out[55:53];
assign arcache_m[3:0]                      = mar_fifo_out[80:77];
assign aruser_m[C_M_AXI_ARUSER_WIDTH-1:0]  = {mar_fifo_out[100:93],mar_fifo_out[88:81]};
assign arqos_m[3:0]                        = mar_fifo_out[92:89];
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1) begin : AXI4_AR_BASIC_YES
assign arid_m[C_M_AXI_THREAD_ID_WIDTH-1:0] = mar_fifo_out[48:43];
assign arsize_m[2:0]                       = mar_fifo_out[42:40];
assign arlen_m[7:0]                        = mar_fifo_out[39:32];
assign arvalid_m                           = mar_fifo_valid;
assign arlock_m[0:0]                       = 1'b0; 
assign arburst_m[1:0]                      = 2'h1;
assign arprot_m[2:0]                       = 3'b000;
assign arcache_m[3:0]                      = 4'b0011;
assign aruser_m[C_M_AXI_ARUSER_WIDTH-1:0]  = {C_M_AXI_ARUSER_WIDTH{1'b0}};
assign arqos_m[3:0]                        = 4'h0; 
end
endgenerate
// grahams : add param tracking through the system
   
wire [88:0] mar_fifo0_out, mar_fifo1_out, mar_fifo2_out, mar_fifo3_out;


wire [0:0] mar_agen0_user,mar_agen1_user,mar_agen2_user,mar_agen3_user;
   

   
wire        mar_fifo0_valid, mar_fifo0_pop;
wire        mar_fifo1_valid, mar_fifo1_pop;
wire        mar_fifo2_valid, mar_fifo2_pop;
wire        mar_fifo3_valid, mar_fifo3_pop;
wire        mar_agen0_valid, mar_agen1_valid, mar_agen2_valid, mar_agen3_valid;
reg        mar_fifo0_valid_ff;
reg        mar_fifo1_valid_ff;
reg        mar_fifo2_valid_ff;
reg        mar_fifo3_valid_ff;
   always @(posedge Clk) begin
      mar_fifo0_valid_ff  <= (rst_l) ? mar_fifo0_valid : 1'b0;
      mar_fifo1_valid_ff  <= (rst_l) ? mar_fifo1_valid : 1'b0;
      mar_fifo2_valid_ff  <= (rst_l) ? mar_fifo2_valid : 1'b0;
      mar_fifo3_valid_ff  <= (rst_l) ? mar_fifo3_valid : 1'b0;
    end
wire [3:0] martrk_clear_pos = { ~mar_agen3_valid && ~mar_fifo3_valid_ff,
                                ~mar_agen2_valid && ~mar_fifo2_valid_ff,
                                ~mar_agen1_valid && ~mar_fifo1_valid_ff,
                                ~mar_agen0_valid && ~mar_fifo0_valid_ff };

wire [3:0] martrk_fifo_num, martrk_mr_hit;
wire [C_M_AXI_DATA_WIDTH+C_M_AXI_THREAD_ID_WIDTH +3-1:0] mr_fifo_out;

wire [C_M_AXI_THREAD_ID_WIDTH-1:0] martrk_in_push_id = cmd_out_mr[52:47];
wire [C_M_AXI_THREAD_ID_WIDTH-1:0] martrk_in_search_id =
    mr_fifo_out[C_M_AXI_DATA_WIDTH+C_M_AXI_THREAD_ID_WIDTH +3-1:C_M_AXI_DATA_WIDTH+3];
//flop mar_fifo_push for timing improvement
// search should not be flopped, as search_id and search_hit occurs in 1 clock
// cycle.Delaying search, causes to hit a wrong search ID.
reg [C_M_AXI_THREAD_ID_WIDTH-1:0] martrk_in_push_id_1ff; 
reg [C_M_AXI_THREAD_ID_WIDTH-1:0] martrk_in_search_id_1ff; 
always @(posedge Clk) begin
 martrk_in_push_id_1ff    <= martrk_in_push_id ; 
 martrk_in_search_id_1ff  <= martrk_in_search_id; 
end

wire dis_dis_out_of_order;
generate if(C_ATG_BASIC_AXI4 == 0)  begin : ATG_M_R_OOO_YES
  assign dis_dis_out_of_order = 1'b0;
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1)  begin : ATG_M_R_OOO_NO
  assign dis_dis_out_of_order = 1'b1;
end
endgenerate

axi_traffic_gen_v2_0_10_id_track #(
.ID_WIDTH(C_M_AXI_THREAD_ID_WIDTH)
) Mar_track (
        .Clk           (Clk                                                 ),
        .rst_l         (rst_l                                               ),
        .in_push_id    (martrk_in_push_id_1ff[C_M_AXI_THREAD_ID_WIDTH-1:0]  ),
        .in_push       (mar_fifo_push_1ff                                   ),
        .in_search_id  (martrk_in_search_id[C_M_AXI_THREAD_ID_WIDTH-1:0]    ),
        .in_clear_pos  (martrk_clear_pos[3:0]                               ),
        .in_only_entry0(dis_dis_out_of_order                                        ),
        .out_push_pos  (martrk_fifo_num[3:0]                                ),
        .out_search_hit(martrk_mr_hit[3:0]                                  ),
        .out_free      (martrk_free[3:0]                                    )
);

   
axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH     (89),
  .DEPTH     (8 ),
  .DEPTHBITS (3 ),
  .HEADREG   (1 ),
  .FULL_LEVEL(6 )
) Mar_fifo0 (
        .Clk              (Clk                           ),
        .rst_l            (rst_l                         ),
        .in_data          ({param_cmdr_disable_submitincr, 
                            reg0_mr_ptr_ff[7:0], 
                            cmd_out_mr[98:96],
                            cmd_out_mr[76:0] }           ),             
        .in_push          (martrk_fifo_num[0]            ),
        .in_pop           (mar_fifo0_pop                 ),
        .out_data         (mar_fifo0_out[88:0]           ),
        .is_full          (                              ),
        .is_notfull       (mar_fifo0_notfull             ),
        .is_empty         (                              ),
        .out_valid        (mar_fifo0_valid               ),
        .ex_fifo_dbgout   (                              ) 
);

wire [15:0] mar_agen0_addr, mar_agen0_id;
wire [C_M_AXI_DATA_WIDTH/8-1:0] mar_agen0_be;
wire [7:0] mar_agen0_tag;
wire        mar_agen0_done, mar_agen0_pop;
wire        mr_fifo_valid;
//
//add flopping state for timing improvement
//
reg [88:0] mar_fifo0_out_ff;
reg        mar_fifo0_pop_ff;
always @(posedge Clk) begin
   mar_fifo0_out_ff <= mar_fifo0_out;
   mar_fifo0_pop_ff <= mar_fifo0_pop;
end
axi_traffic_gen_v2_0_10_addrgen #(
  .USE_ADDR_OFFSET (1)                 ,
  .C_DATA_WIDTH    (C_M_AXI_DATA_WIDTH),
  .IS_READ         (1)                 ,
  .C_ATG_BASIC_AXI4(C_ATG_BASIC_AXI4)  ,
  .C_ATG_AXI4LITE  (C_ATG_AXI4LITE)    
) Mar_agen0 (
        .Clk           (Clk                                                       ),
        .rst_l         (rst_l                                                     ),
        .in_addr       ({ mar_fifo0_out[79:64] }                               ),
        .in_addr_offset({1'b0,mar_fifo0_out[7:0]}                              ),
        .in_id         ({ mar_fifo0_out[87:80], 2'b00, mar_fifo0_out[52:47]}),
        .in_len        (mar_fifo0_out[39:32]                                   ),
        .in_size       (mar_fifo0_out[46:44]                                   ),
        .in_lastaddr   ({3'b000,mar_fifo0_out[62:60] }                         ),
        .in_burst      (mar_fifo0_out[43:42]                                   ),
        .in_push       (mar_fifo0_pop                                          ),
        .in_pop        (mar_agen0_pop                                             ),
        .in_user       (mar_fifo0_out[88]                                      ),
        .out_user      (mar_agen0_user[0]                                         ),
        .out_addr      (mar_agen0_addr[15:0]                                      ),
        .out_id        (mar_agen0_id[15:0]                                        ),
        .out_be        (mar_agen0_be[C_M_AXI_DATA_WIDTH/8-1:0]                    ),
        .out_done      (mar_agen0_done                                            ),
        .out_valid     (mar_agen0_valid                                           )
       );

reg        mar_fifo1_pop_ff;
reg        mar_fifo2_pop_ff;
reg        mar_fifo3_pop_ff;
wire [15:0] mar_agen1_addr, mar_agen1_id;
wire [15:0] mar_agen2_addr, mar_agen2_id;
wire [15:0] mar_agen3_addr, mar_agen3_id;
wire        mar_agen1_done, mar_agen1_pop;
wire        mar_agen2_done, mar_agen2_pop;
wire        mar_agen3_done, mar_agen3_pop;
wire [C_M_AXI_DATA_WIDTH/8-1:0] mar_agen1_be;
wire [C_M_AXI_DATA_WIDTH/8-1:0] mar_agen2_be;
wire [C_M_AXI_DATA_WIDTH/8-1:0] mar_agen3_be;
generate if(C_ATG_BASIC_AXI4 == 1)  begin : ATG_M_R_OOO_F_NO
 assign   mar_fifo1_notfull = 1;
 assign   mar_fifo1_valid   = 0;
 assign   mar_agen1_done    = 0;
 assign   mar_agen1_valid   = 0;
 assign   mar_fifo2_notfull = 1;
 assign   mar_fifo2_valid   = 0;
 assign   mar_agen2_done    = 0;
 assign   mar_agen2_valid   = 0;
 assign   mar_fifo3_notfull = 1;
 assign   mar_fifo3_valid   = 0;
 assign   mar_agen3_done    = 0;
 assign   mar_agen3_valid   = 0;
 always @(posedge Clk) begin
    mar_fifo1_pop_ff <= 1'b0;
    mar_fifo2_pop_ff <= 1'b0;
    mar_fifo3_pop_ff <= 1'b0;
 end
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 0)  begin : ATG_M_R_OOO_F_YES
axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH     (89),
  .DEPTH     (8 ),
  .DEPTHBITS (3 ),
  .HEADREG   (1 ),
  .FULL_LEVEL(6 )
) Mar_fifo1 (
        .Clk              (Clk                            ),
        .rst_l            (rst_l                          ),
        .in_data          ({param_cmdr_disable_submitincr,
                            reg0_mr_ptr_ff[7:0], 
                            cmd_out_mr[98:96],
                            cmd_out_mr[76:0] }            ),             
        .in_push          (martrk_fifo_num[1]             ),
        .in_pop           (mar_fifo1_pop                  ),
        .out_data         (mar_fifo1_out[88:0]            ),
        .is_full          (                               ),
        .is_notfull       (mar_fifo1_notfull              ),
        .is_empty         (                               ),
        .out_valid        (mar_fifo1_valid                ),
        .ex_fifo_dbgout   (                               ) 
);

//
//add flopping state for timing improvement
//
reg [88:0] mar_fifo1_out_ff;
always @(posedge Clk) begin
   mar_fifo1_out_ff <= mar_fifo1_out;
   mar_fifo1_pop_ff <= mar_fifo1_pop;
end

axi_traffic_gen_v2_0_10_addrgen #(
.USE_ADDR_OFFSET (1)                 ,
.C_DATA_WIDTH    (C_M_AXI_DATA_WIDTH),
.IS_READ         (1)                 ,
.C_ATG_BASIC_AXI4(C_ATG_BASIC_AXI4)  ,
.C_ATG_AXI4LITE  (C_ATG_AXI4LITE)    
) Mar_agen1 (
        .Clk           (Clk                                                         ),
        .rst_l         (rst_l                                                       ),
        .in_addr       ({ mar_fifo1_out[79:64] }                                 ),
        .in_addr_offset({1'b0,mar_fifo1_out[7:0]}                              ),
        .in_id         ({ mar_fifo1_out[87:80], 2'b00, mar_fifo1_out[52:47]}  ),
        .in_len        (mar_fifo1_out[39:32]                                     ),
        .in_size       (mar_fifo1_out[46:44]                                     ),
        .in_lastaddr   ({3'b000,mar_fifo1_out[62:60] }                           ),
        .in_burst      (mar_fifo1_out[43:42]                                     ),
        .in_push       (mar_fifo1_pop                                            ),
        .in_pop        (mar_agen1_pop                                               ),
        .in_user       (mar_fifo1_out[88]                                        ),
        .out_user      (mar_agen1_user[0]                                           ),
        .out_addr      (mar_agen1_addr[15:0]                                        ),
        .out_id        (mar_agen1_id[15:0]                                          ),
        .out_be        (mar_agen1_be[C_M_AXI_DATA_WIDTH/8-1:0]                      ),
        .out_done      (mar_agen1_done                                              ),
        .out_valid     (mar_agen1_valid                                             )
);

axi_traffic_gen_v2_0_10_ex_fifo #(
   .WIDTH     (89),
   .DEPTH     (8 ),
   .DEPTHBITS (3 ),
   .HEADREG   (1 ),
   .FULL_LEVEL(6 )
) Mar_fifo2 (
        .Clk              (Clk                            ),
        .rst_l            (rst_l                          ),
        .in_data          ({param_cmdr_disable_submitincr,
                            reg0_mr_ptr_ff[7:0], 
                            cmd_out_mr[98:96],
                            cmd_out_mr[76:0] }            ),             
        .in_push          (martrk_fifo_num[2]             ),
        .in_pop           (mar_fifo2_pop                  ),
        .out_data         (mar_fifo2_out[88:0]            ),
        .is_full          (                               ),
        .is_notfull       (mar_fifo2_notfull              ),
        .is_empty         (                               ),
        .out_valid        (mar_fifo2_valid                ),
        .ex_fifo_dbgout   (                               ) 
);

//
//add flopping state for timing improvement
//
reg [88:0] mar_fifo2_out_ff;
always @(posedge Clk) begin
   mar_fifo2_out_ff <= mar_fifo2_out;
   mar_fifo2_pop_ff <= mar_fifo2_pop;
end

axi_traffic_gen_v2_0_10_addrgen #(
  .USE_ADDR_OFFSET (1)                 ,
.C_DATA_WIDTH      (C_M_AXI_DATA_WIDTH),
  .IS_READ         (1)                 ,
  .C_ATG_BASIC_AXI4(C_ATG_BASIC_AXI4)  ,
  .C_ATG_AXI4LITE  (C_ATG_AXI4LITE)    
) Mar_agen2 (
        .Clk           (Clk                                                        ),
        .rst_l         (rst_l                                                      ),
        .in_addr       ({ mar_fifo2_out[79:64] }                                ),
        .in_addr_offset({1'b0,mar_fifo2_out[7:0]}                               ),
        .in_id         ({ mar_fifo2_out[87:80], 2'b00, mar_fifo2_out[52:47]} ),
        .in_len        (mar_fifo2_out[39:32]                                    ),
        .in_size       (mar_fifo2_out[46:44]                                    ),
        .in_lastaddr   ({3'b000,mar_fifo2_out[62:60] }                          ),
        .in_burst      (mar_fifo2_out[43:42]                                    ),
        .in_push       (mar_fifo2_pop                                           ),
        .in_pop        (mar_agen2_pop                                              ),
        .in_user       (mar_fifo2_out[88]                                       ),
        .out_user      (mar_agen2_user[0]                                          ),
        .out_addr      (mar_agen2_addr[15:0]                                       ),
        .out_id        (mar_agen2_id[15:0]                                         ),
        .out_be        (mar_agen2_be[C_M_AXI_DATA_WIDTH/8-1:0]                     ),
        .out_done      (mar_agen2_done                                             ),
        .out_valid     (mar_agen2_valid                                            )
);

axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH     (89),
  .DEPTH     (8 ),
  .DEPTHBITS (3 ),
  .HEADREG   (1 ),
  .FULL_LEVEL(6 )
) Mar_fifo3 (
        .Clk              (Clk                            ),
        .rst_l            (rst_l                          ),
        .in_data          ({param_cmdr_disable_submitincr,
                            reg0_mr_ptr_ff[7:0], 
                            cmd_out_mr[98:96],
                            cmd_out_mr[76:0] }            ),             
        .in_push          (martrk_fifo_num[3]             ),
        .in_pop           (mar_fifo3_pop                  ),
        .out_data         (mar_fifo3_out[88:0]            ),
        .is_full          (                               ),
        .is_notfull       (mar_fifo3_notfull              ),
        .is_empty         (                               ),
        .out_valid        (mar_fifo3_valid                ),
        .ex_fifo_dbgout   (                               ) 
);

//
//add flopping state for timing improvement
//
reg [88:0] mar_fifo3_out_ff;
always @(posedge Clk) begin
   mar_fifo3_out_ff <= mar_fifo3_out;
   mar_fifo3_pop_ff <= mar_fifo3_pop;
end

axi_traffic_gen_v2_0_10_addrgen #(
  .USE_ADDR_OFFSET (1)                 ,
.C_DATA_WIDTH      (C_M_AXI_DATA_WIDTH),
  .IS_READ         (1)                 ,
  .C_ATG_BASIC_AXI4(C_ATG_BASIC_AXI4)  ,
  .C_ATG_AXI4LITE  (C_ATG_AXI4LITE)    
) Mar_agen3 (
        .Clk           (Clk                                                        ),
        .rst_l         (rst_l                                                      ),
        .in_addr       ({ mar_fifo3_out[79:64] }                                ),
        .in_addr_offset({1'b0,mar_fifo3_out[7:0]}                                      ),
        .in_id         ({ mar_fifo3_out[87:80], 2'b00, mar_fifo3_out[52:47]} ),
        .in_len        (mar_fifo3_out[39:32]                                    ),
        .in_size       (mar_fifo3_out[46:44]                                    ),
        .in_lastaddr   ({3'b000,mar_fifo3_out[62:60]}                           ),
        .in_burst      (mar_fifo3_out[43:42]                                    ),
        .in_push       (mar_fifo3_pop                                           ),
        .in_pop        (mar_agen3_pop                                              ),
        .in_user       (mar_fifo3_out[88]                                       ),
        .out_user      (mar_agen3_user[0]                                          ),
        .out_addr      (mar_agen3_addr[15:0]                                       ),
        .out_id        (mar_agen3_id[15:0]                                         ),
        .out_be        (mar_agen3_be[C_M_AXI_DATA_WIDTH/8-1:0]                     ),
        .out_done      (mar_agen3_done                                             ),
        .out_valid     (mar_agen3_valid                                            )
);
end
endgenerate

assign        mar_fifo0_pop = (~mar_agen0_valid || (mar_agen0_done && mar_agen0_pop)) && mar_fifo0_valid_ff & ~mar_fifo0_pop_ff;
assign        mar_fifo1_pop = (~mar_agen1_valid || (mar_agen1_done && mar_agen1_pop)) && mar_fifo1_valid_ff & ~mar_fifo1_pop_ff;
assign        mar_fifo2_pop = (~mar_agen2_valid || (mar_agen2_done && mar_agen2_pop)) && mar_fifo2_valid_ff & ~mar_fifo2_pop_ff;
assign        mar_fifo3_pop = (~mar_agen3_valid || (mar_agen3_done && mar_agen3_pop)) && mar_fifo3_valid_ff & ~mar_fifo3_pop_ff;

assign        mar_agen0_pop = mr_fifo_valid && mar_agen0_valid && martrk_mr_hit[0];
assign        mar_agen1_pop = mr_fifo_valid && mar_agen1_valid && martrk_mr_hit[1];
assign        mar_agen2_pop = mr_fifo_valid && mar_agen2_valid && martrk_mr_hit[2];
assign        mar_agen3_pop = mr_fifo_valid && mar_agen3_valid && martrk_mr_hit[3];

// Receive master data returns
wire        mr_fifo_notfull, mr_fifo_pop;

wire [C_M_AXI_THREAD_ID_WIDTH-1:0] mr_id = rid_m[C_M_AXI_THREAD_ID_WIDTH-1:0];

wire [C_M_AXI_DATA_WIDTH+ C_M_AXI_THREAD_ID_WIDTH +3 -1:0] mr_in_data = {
    mr_id[C_M_AXI_THREAD_ID_WIDTH-1:0],  rlast_m, rresp_m[1:0],rdata_m[C_M_AXI_DATA_WIDTH-1:0] };
axi_traffic_gen_v2_0_10_ex_fifo #(
  //.WIDTH     (C_M_AXI_DATA_WIDTH+10),
  .WIDTH     (C_M_AXI_THREAD_ID_WIDTH+C_M_AXI_DATA_WIDTH+3),
  .DEPTH     (8 ),
  .DEPTHBITS (3 ),
  .HEADREG   (1 ),
  .FULL_LEVEL(6 )
) Mr_fifo (
        .Clk              (Clk                                                          ),
        .rst_l            (rst_l                                                        ),
        .in_data          (mr_in_data[C_M_AXI_DATA_WIDTH+C_M_AXI_THREAD_ID_WIDTH+3-1:0] ),
        .in_push          (rvalid_m && rready_m                                         ),
        .in_pop           (mr_fifo_pop                                                  ),
        .out_data         (mr_fifo_out[C_M_AXI_DATA_WIDTH+C_M_AXI_THREAD_ID_WIDTH+3-1:0]),
        .is_full          (                                                             ),
        .is_notfull       (mr_fifo_notfull                                              ),
        .is_empty         (                                                             ),
        .out_valid        (mr_fifo_valid                                                ),
        .ex_fifo_dbgout   (                                                             ) 
);

assign mr_fifo_pop = mar_agen0_pop || mar_agen1_pop || mar_agen2_pop ||
                                                mar_agen3_pop;
assign rready_m = mr_fifo_notfull;

wire [15:0] mram_waddr = ((mar_agen0_pop) ? mar_agen0_addr[15:0] : 16'h0) |
                        ((mar_agen1_pop) ? mar_agen1_addr[15:0] : 16'h0) |
                        ((mar_agen2_pop) ? mar_agen2_addr[15:0] : 16'h0) |
                        ((mar_agen3_pop) ? mar_agen3_addr[15:0] : 16'h0);


wire mar_param_disableincr = ((mar_agen0_pop) ? mar_agen0_user[0] : 1'h0) |
                        ((mar_agen1_pop) ? mar_agen1_user[0] : 1'h0) |
                        ((mar_agen2_pop) ? mar_agen2_user[0] : 1'h0) |
                        ((mar_agen3_pop) ? mar_agen3_user[0] : 1'h0);


wire mar_param_disableincr_nxt = ((mar_agen0_pop) ? mar_agen0_user[0] : 1'h0) |
                        ((mar_agen1_pop) ? mar_agen1_user[0] : 1'h0) |
                        ((mar_agen2_pop) ? mar_agen2_user[0] : 1'h0) |
                        ((mar_agen3_pop) ? mar_agen3_user[0] : 1'h0) |
                        ((~mar_agen0_pop && ~mar_agen1_pop && ~mar_agen2_pop && ~mar_agen3_pop) ? mar_param_disableincr_ff : 1'h0);


   //reg mar_param_disableincr_2ff;   
   always @(posedge Clk) begin
      mar_param_disableincr_ff  <= (rst_l) ? mar_param_disableincr_nxt : 1'b0;
      //mar_param_disableincr_2ff   <= (rst_l) ? mar_param_disableincr_ff : 1'b0;
   end

   
wire [C_M_AXI_DATA_WIDTH-1:0] mram_dummy_out;
wire [15:0] maw_agen_addr;

wire [C_M_AXI_DATA_WIDTH/8-1:0] mram_we =
                ((mar_agen0_pop) ? mar_agen0_be[C_M_AXI_DATA_WIDTH/8-1:0] : 'h0) |
                ((mar_agen1_pop) ? mar_agen1_be[C_M_AXI_DATA_WIDTH/8-1:0] : 'h0) |
                ((mar_agen2_pop) ? mar_agen2_be[C_M_AXI_DATA_WIDTH/8-1:0] : 'h0) |
                ((mar_agen3_pop) ? mar_agen3_be[C_M_AXI_DATA_WIDTH/8-1:0] : 'h0);

wire [1:0] mr_fifo_out_resp = 
      mr_fifo_out[C_M_AXI_DATA_WIDTH+2-1:C_M_AXI_DATA_WIDTH];
wire [2:0] mr_fifo_out_resp_mask =
                ((mr_fifo_out_resp[1:0] == 2'b00) ? 3'b001 : 3'b000) |
                ((mr_fifo_out_resp[1:0] == 2'b01) ? 3'b010 : 3'b000) |
                ((mr_fifo_out_resp[1] == 1'b1) ? 3'b100 : 3'b000);
wire [2:0] mr_fifo_out_resp_allowed = (mram_waddr[15:13] == 3'b000) ? 3'b001 :
                                                        mram_waddr[15:13];
wire        mr_fifo_out_resp_ok =
                ((mr_fifo_out_resp_allowed[2:0] & mr_fifo_out_resp_mask[2:0]) !=
                                                                3'b000);
assign        mr_fifo_out_resp_bad = mr_fifo_pop && ~mr_fifo_out_resp_ok;

wire [C_M_AXI_DATA_WIDTH-1:0] mram_write_data = 
          mr_fifo_out[C_M_AXI_DATA_WIDTH-1:0];



   

   // adding sram regslice for timing closure
   wire [C_M_AXI_DATA_WIDTH*9/8+11-1:0] sram_mramwr_ff;
   
 axi_traffic_gen_v2_0_10_regslice
  #(
    .DWIDTH   (C_M_AXI_DATA_WIDTH*9/8+11),   
    .IDWIDTH  (1                        ),
    .DATADEPTH(1 )
    )
  sram_mramwr_regslice
   (
    .din         ({mram_waddr[12:2],mram_we,mram_write_data}),
    .dout        (sram_mramwr_ff                            ),      
    .dout_early  (                                          ),      
    .idin        (1'b0                                      ),      
    .idout       (                                          ),
    .id_stable   (                                          ),
    .id_stable_ff(                                          ),
    .data_stable (                                          ), 
    .clk         (Clk                                       ),  
    .reset       (~rst_l                                    )  
    ); 

   assign   mram_waddr_ff      = sram_mramwr_ff[C_M_AXI_DATA_WIDTH*9/8+11-1:
                                                C_M_AXI_DATA_WIDTH*9/8+1-1];
   assign   mram_we_ff         = sram_mramwr_ff[C_M_AXI_DATA_WIDTH*9/8-1:
                                                C_M_AXI_DATA_WIDTH];
   assign   mram_write_data_ff = sram_mramwr_ff[C_M_AXI_DATA_WIDTH-1:0];

   
   
reg        mr_unexp_maybe_ff, mr_unexp_maybe_2ff, mr_unexp_maybe_3ff;

wire  mr_exp_last = mr_fifo_out[C_M_AXI_DATA_WIDTH+2];
wire  mr_bad_last = (mar_agen0_pop && (mar_agen0_done != mr_exp_last)) ||
    (mar_agen1_pop && (mar_agen1_done != mr_exp_last)) ||
    (mar_agen2_pop && (mar_agen2_done != mr_exp_last)) ||
    (mar_agen3_pop && (mar_agen3_done != mr_exp_last));
wire        mr_unexp_maybe = mr_fifo_valid && ~mar_agen0_pop && ~mar_agen1_pop &&
                                        ~mar_agen2_pop && ~mar_agen3_pop;

reg rvalid_m_1ff;
reg rvalid_m_2ff;
reg rvalid_m_3ff;
always @(posedge Clk) begin
        mr_unexp_maybe_ff  <= (rst_l) ? mr_unexp_maybe     : 1'b0;
        mr_unexp_maybe_2ff <= (rst_l) ? mr_unexp_maybe_ff  : 1'b0;
        mr_unexp_maybe_3ff <= (rst_l) ? mr_unexp_maybe_2ff : 1'b0;
        mr_bad_last_ff <= (rst_l) ? mr_bad_last : 1'b0;

        //check for atleast three clock if matching RID comes
        rvalid_m_1ff <= (rst_l) ? rvalid_m     : 1'b0;
        rvalid_m_2ff <= (rst_l) ? rvalid_m_1ff : 1'b0;
        rvalid_m_3ff <= (rst_l) ? rvalid_m_2ff : 1'b0;
end

assign        mr_unexp = mr_unexp_maybe_ff && mr_unexp_maybe_2ff && mr_unexp_maybe_3ff && rvalid_m_3ff;

//master complete logic
reg [15:0] mar_complete_vec_ff;

wire        mar_agen0_complete = mar_agen0_pop && mar_agen0_done;
wire        mar_agen1_complete = mar_agen1_pop && mar_agen1_done;
wire        mar_agen2_complete = mar_agen2_pop && mar_agen2_done;
wire        mar_agen3_complete = mar_agen3_pop && mar_agen3_done;

wire [15:0] mar_agen0_tag_exp = (mar_agen0_complete) ?
                        (16'h1 << mar_agen0_id[11:8]) : 16'h0;
wire [15:0] mar_agen1_tag_exp = (mar_agen1_complete) ?
                        (16'h1 << mar_agen1_id[11:8]) : 16'h0;
wire [15:0] mar_agen2_tag_exp = (mar_agen2_complete) ?
                        (16'h1 << mar_agen2_id[11:8]) : 16'h0;
wire [15:0] mar_agen3_tag_exp = (mar_agen3_complete) ?
                        (16'h1 << mar_agen3_id[11:8]) : 16'h0;

wire [15:0] mar_complete_next2 = (16'h1 << mrd_complete_ptr_ff[3:0]);
wire [15:0] mar_complete_inc_exp = mar_complete_next2[15:0] &
                                                mar_complete_vec_ff[15:0];
assign        mar_complete_doinc = (mar_complete_inc_exp[15:0] != 16'h0);
wire [15:0] mar_complete_vec = //~mar_complete_inc_exp[15:0] &
                (mar_agen0_tag_exp[15:0] | mar_agen1_tag_exp[15:0] |
                mar_agen2_tag_exp[15:0] | mar_agen3_tag_exp[15:0]); //|
                                                //mar_complete_vec_ff[15:0]);

// using disableincr bit that is tracked for parameterized mode
// CR#768069: Reset complete_ptr when current value equal to latched command
// index.
wire [8:0] mrd_complete_ptr;
wire rst_complete_ptr = (last_cmd_index[8:0] == mrd_complete_ptr_ff ) ;//& reg0_loop_en_ff;
assign mrd_complete_ptr = ((~reg0_m_enable_ff)|(rst_complete_ptr)) ? 9'h0 :
                          (mar_complete_doinc & ~mar_param_disableincr_ff) ?
                           mrd_complete_ptr_ff[8:0] + 9'h1 :
                           mrd_complete_ptr_ff[8:0];

//dec_ptr: pulse when command command pointer is incremented.
assign dec_ptr = mar_complete_doinc & ~mar_param_disableincr_ff;
   
assign        mr_done = (reg0_m_enable_ff && mar_done_ff && (mrd_complete_ptr[8:0] == reg0_mr_ptr_ff[8:0]))?1'b1:
                        ((~reg0_m_enable_ff)?1'b0:mr_done_ff);


always @(posedge Clk) begin
        mrd_complete_ptr_ff[8:0] <= (rst_l) ? mrd_complete_ptr[8:0] : 9'h0;
        mar_complete_vec_ff[15:0] <= (rst_l) ? mar_complete_vec[15:0] : 16'h0;
        mr_done_ff <= (rst_l) ? mr_done : 1'b0;
end

endmodule
