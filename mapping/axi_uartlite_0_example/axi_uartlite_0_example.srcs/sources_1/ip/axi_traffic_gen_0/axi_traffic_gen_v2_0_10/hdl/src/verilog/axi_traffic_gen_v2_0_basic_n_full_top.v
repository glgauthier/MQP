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
// Filename:       axi_traffic_gen_v2_0_10_basic_n_full_top.v
// Version : v1.0
// Description:    Top level module for VIVADO.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------

`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_basic_n_full_top
        #(
parameter C_FAMILY                = "virtex7"   ,
parameter C_BASEADDR              = 32'hffffffff,
parameter C_HIGHADDR              = 32'h00000000,
parameter C_ZERO_INVALID          = 1           ,
parameter C_IS_AXI4               = 1           ,
parameter C_IS_COHERENT           = 0           ,
parameter C_IS_AFI                = 0           ,
parameter C_NO_EXCL               = 0           ,
parameter C_S_AXI_DATA_WIDTH      = 32          ,
parameter C_S_AXI_AWUSER_WIDTH    = 8           ,
parameter C_S_AXI_ARUSER_WIDTH    = 8           ,
parameter C_S_AXI_ID_WIDTH        = 1           ,
parameter C_M_AXI_THREAD_ID_WIDTH = 1           ,
parameter C_M_AXI_DATA_WIDTH      = 32          ,
parameter C_M_AXI_AWUSER_WIDTH    = 8           ,
parameter C_M_AXI_ARUSER_WIDTH    = 8           ,
parameter C_ATG_AXI4LITE          = 0           ,
parameter C_ATG_BASIC_AXI4        = 0           ,
parameter C_ATG_REPEAT_TYPE       = 0           , //0-One-shit,1-Repititive
parameter C_ATG_HLTP_MODE         = 0           , //0-Custom,1-High Level Traffic.
parameter C_ATG_STATIC            = 0           ,
parameter C_ATG_SLAVE_ONLY        = 0           ,
parameter C_ATG_SYSTEM_INIT       = 0           ,
parameter C_ATG_STREAMING         = 0           , 
parameter C_RAMINIT_CMDRAM0_F     = "NONE"      , 
parameter C_RAMINIT_CMDRAM1_F     = "NONE"      , 
parameter C_RAMINIT_CMDRAM2_F     = "NONE"      , 
parameter C_RAMINIT_CMDRAM3_F     = "NONE"      , 
parameter C_RAMINIT_SRAM0_F       = "NONE"      , 
parameter C_RAMINIT_PARAMRAM0_F   = "NONE"      ,
parameter C_RAMINIT_ADDRRAM0_F    = "NONE"      ,
parameter C_M_AXI_ADDR_WIDTH      = 32          ,
parameter C_REPEAT_COUNT          = 254         ,
parameter C_AXI_WR_ADDR_SEED      = 16'h7C9B    , 
parameter C_AXI_RD_ADDR_SEED      = 16'h5A5A

) (
 input                                 s_axi_aclk         ,
 input                                 s_axi_aresetn      ,
 input                                 core_global_start  , 
 input                                 core_global_stop   ,

 input  [C_S_AXI_ID_WIDTH-1:0]         awid_s             ,
 input  [31:0]                         awaddr_s           ,
 input  [7:0]                          awlen_s            ,
 input  [2:0]                          awsize_s           ,
 input  [1:0]                          awburst_s          ,
 input  [0:0]                          awlock_s           ,
 input  [3:0]                          awcache_s          ,
 input  [2:0]                          awprot_s           ,
 input  [3:0]                          awqos_s            ,
 input  [C_S_AXI_AWUSER_WIDTH-1:0]     awuser_s           ,
 input                                 awvalid_s          ,
 output                                awready_s          ,
 input                                 wlast_s            ,
 input  [C_S_AXI_DATA_WIDTH-1:0]       wdata_s            ,
 input  [C_S_AXI_DATA_WIDTH/8-1:0]     wstrb_s            ,
 input                                 wvalid_s           ,
 output                                wready_s           ,
 output [C_S_AXI_ID_WIDTH-1:0]         bid_s              ,
 output [1:0]                          bresp_s            ,
 output                                bvalid_s           ,
 input                                 bready_s           ,

 input  [C_S_AXI_ID_WIDTH-1:0]         arid_s             ,
 input  [31:0]                         araddr_s           ,
 input  [7:0]                          arlen_s            ,
 input  [2:0]                          arsize_s           ,
 input  [1:0]                          arburst_s          ,
 input  [0:0]                          arlock_s           ,
 input  [3:0]                          arcache_s          ,
 input  [2:0]                          arprot_s           ,
 input  [3:0]                          arqos_s            ,
 input  [C_S_AXI_ARUSER_WIDTH-1:0]     aruser_s           ,
 input                                 arvalid_s          ,
 output                                arready_s          ,
 output [C_S_AXI_ID_WIDTH-1:0]         rid_s              ,
 output                                rlast_s            ,
 output [C_S_AXI_DATA_WIDTH-1:0]       rdata_s            ,
 output [1:0]                          rresp_s            ,
 output                                rvalid_s           ,
 input                                 rready_s           ,



 output [C_M_AXI_THREAD_ID_WIDTH-1:0]  awid_m             ,
 output [C_M_AXI_ADDR_WIDTH-1:0]       awaddr_m           ,
 output [7:0]                          awlen_m            ,
 output [2:0]                          awsize_m           ,
 output [1:0]                          awburst_m          ,
 output [0:0]                          awlock_m           ,
 output [3:0]                          awcache_m          ,
 output [2:0]                          awprot_m           ,
 output [3:0]                          awqos_m            ,
 output [C_M_AXI_AWUSER_WIDTH-1:0]     awuser_m           ,
 output                                awvalid_m          ,
 input                                 awready_m          ,
 output                                wlast_m            ,
 output [C_M_AXI_DATA_WIDTH-1:0]       wdata_m            ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]     wstrb_m            ,
 output                                wvalid_m           ,
 input                                 wready_m           ,
 input  [C_M_AXI_THREAD_ID_WIDTH-1:0]  bid_m              ,
 input  [1:0]                          bresp_m            ,
 input                                 bvalid_m           ,
 output                                bready_m           ,

 output [C_M_AXI_THREAD_ID_WIDTH-1:0]  arid_m             ,
 output [C_M_AXI_ADDR_WIDTH-1:0]       araddr_m           ,
 output [7:0]                          arlen_m            ,
 output [2:0]                          arsize_m           ,
 output [1:0]                          arburst_m          ,
 output [0:0]                          arlock_m           ,
 output [3:0]                          arcache_m          ,
 output [2:0]                          arprot_m           ,
 output [3:0]                          arqos_m            ,
 output [C_M_AXI_ARUSER_WIDTH-1:0]     aruser_m           ,
 output                                arvalid_m          ,
 input                                 arready_m          ,
 input  [C_M_AXI_THREAD_ID_WIDTH-1:0]  rid_m              ,
 input                                 rlast_m            ,
 input  [C_M_AXI_DATA_WIDTH-1:0]       rdata_m            ,
 input  [1:0]                          rresp_m            ,
 input                                 rvalid_m           ,
 output                                rready_m           ,

 output                                irq_out            ,
 output                                err_out            ,
 output [24:0]                         dbg_out            ,
 output [2:0]                          dbg_out_ext        ,

 input                                 global_test_en_l

);
  /* hierarchy structure
  slave 
   |_ slave write
   |_ slave read
  master 
   |_ master write
   |_ master read
  ram
   |_ command ram
   |_ shared ram (master/slave)
   |_ param ram
  axi_traffic_gen_v2_0_10_registers and debug modules
   |_axi_traffic_gen_v2_0_10_registers  
   |_axi_traffic_gen_v2_0_10_debug_capture  
  */
 wire                           maw_fifo0_pop                 ;
 wire                           maw_depend_ok                 ;
 wire                           mar_fifo_push                 ;
 wire                           reg1_disallow_excl            ;
 wire                           reg1_sgl_slv_wr               ;
 wire                           reg1_wrs_block_rds            ;
 wire [15:0]                    err_new_slv                   ;
 wire [15:0]                    wr_reg_decode                 ;
 wire [31:0]                    wr_reg_data                   ;
 wire [71:0]                    slv_ex_info0_ff               ;
 wire [71:0]                    slv_ex_info1_ff               ; 
 wire                           slv_ex_new_valid0             ;
 wire                           slv_ex_new_valid1             ;
 wire [15:0]                    ar_agen_addr                  ;
 wire [C_S_AXI_DATA_WIDTH-1:0]  slvram_rd_out                 ;
 wire [63:0]                    sram_rd_data_a                ;
 wire [10:0]                     slvram_waddr_ff              ;      
 wire [7:0]                     slvram_we_ff                  ;         
 wire [63:0]                    slvram_write_data_ff          ;
 wire [15:0]                    aw_agen_addr                  ;
 wire                           aw_agen_valid                 ;
 wire [15:0]                    cmdram_we                     ;
 wire [63:0]                    slvram_wr_data                ;
 wire                           awfifo_valid                  ;
 wire                           wfifo_valid                   ;
 wire [71:0]                    awfifo_out                    ;
 wire [C_S_AXI_DATA_WIDTH*9/8+1-1:0]    wfifo_out             ; 
 wire                           reg1_sgl_slv_rd               ;
 wire [15:0]                    rd_reg_decode                 ;
 wire [31:0]                    rd_reg_data_raw               ;
 wire                           slv_ex_valid0_ff              ;
 wire                           slv_ex_valid1_ff              ;
 wire [15:0]                    ar_agen0_addr                 ;
 wire                           ar_agen0_valid                ;
 wire                           arfifo_valid                  ;
 wire [71:0]                    arfifo_out                    ;
 wire [127:0]                   cmd_out_mr_i                  ;
 wire                           reg0_m_enable_ff              ;
 wire                           reg0_loop_en_ff               ;
 wire [9:0]                     reg0_mw_ptr_ff                ;
 wire                           reg0_m_enable_cmdram_mrw      ; 
 wire                           reg0_m_enable_cmdram_mrw_ff   ;
 wire                           reg0_m_enable_3ff             ;
 wire                           mw_done_ff                    ;
 wire                           b_resp_unexp_ff               ;
 wire                           b_resp_bad_ff                 ;
 wire [9:0]                     reg0_mw_ptr_update            ;
 wire                           param_cmdw_delayop_valid      ;
 wire [23:0]                    param_cmdw_count              ;
 wire                           param_cmdw_repeatfixedop_valid;
 wire                           param_cmdw_disable_submitincr ;
 wire [127:0]                   cmd_out_mw                    ; 
 wire                           cmdram_mw_regslice_id_stable  ;
 wire [C_M_AXI_DATA_WIDTH-1:0]  mram_out                      ;  
 wire [15:0]                    maw_agen_addr                 ;
 wire [8:0]                     mrd_complete_ptr_ff           ;
 wire [15:0]                    Maw_fifow_dbgout              ;
 wire [9:0]                     maw_ptr_new_ff                ; 
 wire [9:0]                     maw_ptr_new_2ff               ; 
 wire                           maw_fifo_push_ff              ;
 wire                           cmdram_mr_regslice_id_stable  ;
 wire [127:0]                   cmd_out_mr                    ; 
 wire                           param_cmdr_delayop_valid      ; 
 wire [23:0]                    param_cmdr_count              ;
 wire                           param_cmdr_repeatfixedop_valid;
 wire                           param_cmdr_disable_submitincr ;
 wire [10:0]                    mram_waddr_ff                 ;     
 wire [C_M_AXI_DATA_WIDTH/8-1:0] mram_we_ff                   ;        
 wire [C_M_AXI_DATA_WIDTH-1:0]  mram_write_data_ff            ;
 wire [9:0]                     reg0_mr_ptr_ff                ;
 wire                           mr_done_ff                    ;
 wire                           mr_fifo_out_resp_bad          ;
 wire                           mr_bad_last_ff                ;
 wire                           mr_unexp                      ;
 wire [9:0]                     reg0_mr_ptr_update            ;
 wire [8:0]                     mwr_complete_ptr_ff           ;
 wire [9:0]                     mar_ptr_new_ff                ; 
 wire [9:0]                     mar_ptr_new_2ff               ; 
 wire                           mar_fifo_push_ff              ; 
 wire [23:0]                    param_cmdr_submitcnt_ff       ;
 wire [23:0]                    param_cmdw_submitcnt_ff       ;
 wire [127:0]                   cmd_out_mw_regslice           ;
 wire [127:0]                   cmd_out_mr_regslice           ;
 wire [127:0]                   cmd_out_mw_regslice_ff        ;
 wire [127:0]                   cmd_out_mr_regslice_ff        ;
 wire                           rddec6_valid_ff               ;
 wire [71:0]                    slv_ex_info1                  ; 
 wire                           slv_ex_toggle_ff              ;
 wire                           maw_fifow_notfull             ;
 wire [9:0]                     reg0_mr_ptr                   ;
 wire [9:0]                     reg0_mw_ptr                   ;
 wire                           maw_delay_ok_ff               ;
 wire                           maw_cnt_do_dec                ;
 wire                           maw_fifo_notfull              ;
 wire  [3:0]                    mawtrk_free                   ; 
 wire                           maw_fifo0_notfull             ; 
 wire                           maw_fifo1_notfull             ;
 wire                           maw_fifo2_notfull             ;
 wire                           maw_fifo3_notfull             ;
 wire                           maw_block_push_ff             ;
 wire                           b_resp_bad                    ;
 wire                           b_complete_ff                 ;
 wire [9:0]                     maw_ptr_new                   ;
 wire                           maw_fifow_push                ;
 wire                           mar_complete_doinc            ;
 wire                           mar_done                      ;
 wire                           mr_done                       ;
 wire                           mw_done                       ;
 wire                           maw_fifo0_user_disableincr    ;
 wire                           maw_disableincr               ;
 wire                           maw_disableincr_ff            ;
 wire [7:0]                     reg0_rev                      ;
 wire                           maw_fifo1_pop                 ;
 wire                           maw_agen_done                 ;
 wire                           mw_fifo_valid                 ;
 wire                           mw_fifo_pop                   ;
 wire                           mw_fifo_notfull               ;
 wire                           maw_fifow_pop                 ;
 wire                           maw_fifow_valid               ;
 wire                           maw_done                      ;
 wire                           maw_valid                     ;
 wire                           maw_fifo_push                 ;
 wire [8:0]                     maw_complete_depth            ;
 wire [8:0]                     mwr_complete_ptr              ;
 wire [15:0]                    maw_complete_next2            ;
 wire [15:0]                    maw_complete_vec_ff           ;
 wire                           maw_complete_doinc            ;
 wire [15:0]                    maw_complete_inc_exp          ;
 wire                           maw_agen_valid                ;
 wire                           mar_param_disableincr_ff      ;
 wire  [31:0]                   addrram_rd_out                ;

axi_traffic_gen_v2_0_10_s_w_channel # (
  .C_BASEADDR          (C_BASEADDR          ),
  .C_HIGHADDR          (C_HIGHADDR          ),
  .C_S_AXI_ID_WIDTH    (C_S_AXI_ID_WIDTH    ),
  .C_S_AXI_DATA_WIDTH  (C_S_AXI_DATA_WIDTH  ),
  .C_S_AXI_AWUSER_WIDTH(C_S_AXI_AWUSER_WIDTH),
  .C_ZERO_INVALID      (C_ZERO_INVALID      ),
  .C_NO_EXCL           (C_NO_EXCL           ),
  .C_ATG_BASIC_AXI4    (C_ATG_BASIC_AXI4    ),
  .C_ATG_AXI4LITE      (C_ATG_AXI4LITE      ) 
) slv_wr (
    .Clk                  (s_axi_aclk                   ),
    .rst_l                (s_axi_aresetn                ),
    .awid_s               (awid_s                       ),
    .awaddr_s             (awaddr_s                     ),
    .awlen_s              (awlen_s                      ),
    .awsize_s             (awsize_s                     ),
    .awburst_s            (awburst_s                    ),
    .awlock_s             (awlock_s                     ),
    .awcache_s            (awcache_s                    ),
    .awprot_s             (awprot_s                     ),
    .awqos_s              (awqos_s                      ),
    .awuser_s             (awuser_s                     ),
    .awvalid_s            (awvalid_s                    ),
    .awready_s            (awready_s                    ),
    .wlast_s              (wlast_s                      ),
    .wdata_s              (wdata_s                      ),
    .wstrb_s              (wstrb_s                      ),
    .wvalid_s             (wvalid_s                     ),
    .wready_s             (wready_s                     ),
    .bid_s                (bid_s                        ),
    .bresp_s              (bresp_s                      ),
    .bvalid_s             (bvalid_s                     ),
    .bready_s             (bready_s                     ),

    .reg1_disallow_excl   (reg1_disallow_excl           ),
    .reg1_sgl_slv_wr      (reg1_sgl_slv_wr              ),
    .reg1_wrs_block_rds   (reg1_wrs_block_rds           ),
    .err_new_slv          (err_new_slv                  ),
    .wr_reg_decode        (wr_reg_decode                ),
    .wr_reg_data          (wr_reg_data                  ),
    .slv_ex_info0_ff      (slv_ex_info0_ff              ),
    .slv_ex_valid0_ff     (slv_ex_valid0_ff             ),
    .slv_ex_info1_ff      (slv_ex_info1_ff              ),
    .slv_ex_valid1_ff     (slv_ex_valid1_ff             ),
    .slv_ex_new_valid0    (slv_ex_new_valid0            ),
    .slv_ex_new_valid1    (slv_ex_new_valid1            ),
    .ar_agen_addr         (ar_agen_addr                 ),
    .slvram_rd_out        (slvram_rd_out                ),
    .sram_rd_data_a       (sram_rd_data_a               ),
    .slvram_waddr_ff      (slvram_waddr_ff              ),
    .slvram_we_ff         (slvram_we_ff                 ),
    .slvram_write_data_ff (slvram_write_data_ff         ),
    .aw_agen_addr         (aw_agen_addr                 ),
    .aw_agen_valid_out    (aw_agen_valid                ),
    .cmdram_we            (cmdram_we                    ),
    .slvram_wr_data       (slvram_wr_data               ),
    .awfifo_valid         (awfifo_valid                 ),
    .awfifo_out           (awfifo_out                   ),
    .wfifo_valid          (wfifo_valid                  ),
    .wfifo_out            (wfifo_out                    )
                                                        );


axi_traffic_gen_v2_0_10_s_r_channel #
(
  .C_BASEADDR           (C_BASEADDR           ),
  .C_HIGHADDR           (C_HIGHADDR           ),
  .C_ZERO_INVALID       (C_ZERO_INVALID       ),
  .C_NO_EXCL            (C_NO_EXCL            ),
  .C_S_AXI_ID_WIDTH     (C_S_AXI_ID_WIDTH     ),
  .C_S_AXI_ARUSER_WIDTH (C_S_AXI_ARUSER_WIDTH ),
  .C_S_AXI_DATA_WIDTH   (C_S_AXI_DATA_WIDTH   ),
  .C_ATG_BASIC_AXI4     (C_ATG_BASIC_AXI4     ),
  .C_ATG_AXI4LITE       (C_ATG_AXI4LITE       ) 
) slv_rd (
    .Clk                (s_axi_aclk                 ),
    .rst_l              (s_axi_aresetn              ),
    .arid_s             (arid_s                     ),
    .araddr_s           (araddr_s                   ),
    .arlen_s            (arlen_s                    ),
    .arsize_s           (arsize_s                   ),
    .arburst_s          (arburst_s                  ),
    .arlock_s           (arlock_s                   ),
    .arcache_s          (arcache_s                  ),
    .arprot_s           (arprot_s                   ),
    .arqos_s            (arqos_s                    ),
    .aruser_s           (aruser_s                   ),
    .arvalid_s          (arvalid_s                  ),
    .arready_s          (arready_s                  ),
    .rid_s              (rid_s                      ),
    .rlast_s            (rlast_s                    ),
    .rdata_s            (rdata_s                    ),
    .rresp_s            (rresp_s                    ),
    .rvalid_s           (rvalid_s                   ),
    .rready_s           (rready_s                   ),

    .reg1_sgl_slv_rd    (reg1_sgl_slv_rd            ),
    .rd_reg_decode      (rd_reg_decode              ),
    .rd_reg_data_raw    (rd_reg_data_raw            ),
    .reg1_disallow_excl (reg1_disallow_excl         ),
    .rddec6_valid_ff    (rddec6_valid_ff            ),
    .slv_ex_info0_ff    (slv_ex_info0_ff            ),
    .slv_ex_valid0_ff   (slv_ex_valid0_ff           ),
    .slv_ex_info1_ff    (slv_ex_info1_ff            ),
    .slv_ex_info1       (slv_ex_info1               ),
    .slv_ex_valid1_ff   (slv_ex_valid1_ff           ),
    .slv_ex_toggle_ff   (slv_ex_toggle_ff           ),
    .slv_ex_new_valid0  (slv_ex_new_valid0          ),
    .slv_ex_new_valid1  (slv_ex_new_valid1          ),
    .ar_agen_addr       (ar_agen_addr               ),
    .slvram_rd_out      (slvram_rd_out              ),
    .ar_agen0_addr      (ar_agen0_addr              ),
    .ar_agen0_valid_out (ar_agen0_valid             ),
    .addrram_rd_out     (addrram_rd_out             ),
    .arfifo_valid       (arfifo_valid               ),
    .arfifo_out         (arfifo_out                 ),
    .cmd_out_mr_i       (cmd_out_mr_i               )
                                                    );

 wire                           extn_param_cmdw_delayop_valid      ;
 wire [23:0]                    extn_param_cmdw_count              ;
 wire                           extn_param_cmdw_repeatfixedop_valid;
 wire                           extn_param_cmdw_disable_submitincr ;
 wire [127:0]                   extn_cmd_out_mw                    ; 
 wire  [31:0]                   extn_cmd_out_mw_ext                ;
 wire  [31:0]                   cmd_out_mw_ext                     ;
 wire  [31:0]                   prm_out_mw                         ;
generate if(C_ATG_BASIC_AXI4 == 1) begin : ATG_PARARAM_MW_YES
    assign extn_param_cmdw_delayop_valid      = 1'b0                   ;
    assign extn_param_cmdw_count              = 24'h0                  ;
    assign extn_param_cmdw_repeatfixedop_valid= 1'b0                   ;
    assign extn_param_cmdw_disable_submitincr = 1'b0                   ;
    assign extn_cmd_out_mw                    = cmd_out_mw_regslice_ff ;
    assign param_cmdr_submitcnt_ff            = 24'h0                  ;
    assign param_cmdw_submitcnt_ff            = 24'h0                  ;
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 0) begin : ATG_PARARAM_MW_NO
    assign extn_param_cmdw_delayop_valid      = param_cmdw_delayop_valid      ; 
    assign extn_param_cmdw_count              = param_cmdw_count              ; 
    assign extn_param_cmdw_repeatfixedop_valid= param_cmdw_repeatfixedop_valid; 
    assign extn_param_cmdw_disable_submitincr = param_cmdw_disable_submitincr ; 
    assign extn_cmd_out_mw                    = cmd_out_mw                    ;        
end
endgenerate
axi_traffic_gen_v2_0_10_m_w_channel #(
  .C_M_AXI_THREAD_ID_WIDTH (C_M_AXI_THREAD_ID_WIDTH ),
  .C_ZERO_INVALID          (C_ZERO_INVALID          ),
  .C_M_AXI_AWUSER_WIDTH    (C_M_AXI_AWUSER_WIDTH    ),
  .C_M_AXI_DATA_WIDTH      (C_M_AXI_DATA_WIDTH      ),
  .C_M_AXI_ADDR_WIDTH      (C_M_AXI_ADDR_WIDTH      ),
  .C_ATG_BASIC_AXI4        (C_ATG_BASIC_AXI4        ),
  .C_ATG_AXI4LITE          (C_ATG_AXI4LITE          )      
) mst_wr (
    .Clk                           (s_axi_aclk                            ),
    .rst_l                         (s_axi_aresetn                         ),
    .awid_m                        (awid_m                                ),
    .awaddr_m                      (awaddr_m                              ),
    .awlen_m                       (awlen_m                               ),
    .awsize_m                      (awsize_m                              ),
    .awburst_m                     (awburst_m                             ),
    .awlock_m                      (awlock_m                              ),
    .awcache_m                     (awcache_m                             ),
    .awprot_m                      (awprot_m                              ),
    .awqos_m                       (awqos_m                               ),
    .awuser_m                      (awuser_m                              ),
    .awvalid_m                     (awvalid_m                             ),
    .awready_m                     (awready_m                             ),
    .wlast_m                       (wlast_m                               ),
    .wdata_m                       (wdata_m                               ),
    .wstrb_m                       (wstrb_m                               ),
    .wvalid_m                      (wvalid_m                              ),
    .wready_m                      (wready_m                              ),
    .bid_m                         (bid_m                                 ),
    .bresp_m                       (bresp_m                               ),
    .bvalid_m                      (bvalid_m                              ),
    .bready_m                      (bready_m                              ),
    .reg0_m_enable_ff              (reg0_m_enable_ff                      ),
    .reg0_mw_ptr_ff                (reg0_mw_ptr_ff                        ),
    .reg0_m_enable_cmdram_mrw      (reg0_m_enable_cmdram_mrw              ),
    .reg0_m_enable_cmdram_mrw_ff   (reg0_m_enable_cmdram_mrw_ff           ),
    .reg0_m_enable_3ff             (reg0_m_enable_3ff                     ),
    .reg0_loop_en_ff               (reg0_loop_en_ff                       ),
    .mw_done_ff                    (mw_done_ff                            ),
    .b_resp_unexp_ff               (b_resp_unexp_ff                       ),
    .b_resp_bad_ff                 (b_resp_bad_ff                         ),
    .reg0_mw_ptr_update            (reg0_mw_ptr_update                    ),
    .param_cmdw_delayop_valid      (extn_param_cmdw_delayop_valid         ),
    .param_cmdw_count              (extn_param_cmdw_count                 ),
    .param_cmdw_repeatfixedop_valid(extn_param_cmdw_repeatfixedop_valid   ),
    .param_cmdw_disable_submitincr (extn_param_cmdw_disable_submitincr    ),
    .cmd_out_mw                    (extn_cmd_out_mw                       ),
    .cmd_out_mw_ext                (extn_cmd_out_mw_ext                   ), 
    .cmdram_mw_regslice_id_stable  (cmdram_mw_regslice_id_stable          ),
    .mram_out                      (mram_out                              ),
    .maw_agen_addr                 (maw_agen_addr                         ),
    .mwr_complete_ptr_ff           ( mwr_complete_ptr_ff                  ),
    .mrd_complete_ptr_ff           (mrd_complete_ptr_ff                   ),
    .Maw_fifow_dbgout              (Maw_fifow_dbgout                      ),
    .maw_ptr_new_ff                (maw_ptr_new_ff                        ),
    .maw_ptr_new_2ff               (maw_ptr_new_2ff                       ),
    .maw_fifo_push_ff              (maw_fifo_push_ff                      ),
    .maw_fifow_notfull             ( maw_fifow_notfull                    ),
    .maw_delay_ok_ff               ( maw_delay_ok_ff                      ),
    .maw_cnt_do_dec                ( maw_cnt_do_dec                       ),
    .maw_fifo_notfull              ( maw_fifo_notfull                     ),
    .mawtrk_free                   ( mawtrk_free                          ),
    .maw_fifo0_notfull             ( maw_fifo0_notfull                    ),
    .maw_fifo1_notfull             ( maw_fifo1_notfull                    ),
    .maw_fifo2_notfull             ( maw_fifo2_notfull                    ),
    .maw_fifo3_notfull             ( maw_fifo3_notfull                    ),
    .maw_block_push_ff             ( maw_block_push_ff                    ),
    .b_resp_bad                    ( b_resp_bad                           ),
    .b_complete_ff                 ( b_complete_ff                        ),
    .maw_ptr_new                   ( maw_ptr_new                          ),
    .maw_fifow_push                ( maw_fifow_push                       ),
    .mw_done                       ( mw_done                              ),
    .maw_fifo0_user_disableincr    ( maw_fifo0_user_disableincr           ),
    .maw_disableincr               ( maw_disableincr                      ),
    .maw_disableincr_ff            ( maw_disableincr_ff                   ),
    .maw_fifo1_pop                 ( maw_fifo1_pop                        ),
    .maw_fifo0_pop                 ( maw_fifo0_pop                        ),
    .maw_agen_done                 ( maw_agen_done                        ),
    .mw_fifo_valid                 ( mw_fifo_valid                        ),
    .mw_fifo_pop                   ( mw_fifo_pop                          ),
    .mw_fifo_notfull               ( mw_fifo_notfull                      ),
    .maw_fifow_pop                 ( maw_fifow_pop                        ),
    .maw_fifow_valid               ( maw_fifow_valid                      ),
    .maw_done                      ( maw_done                             ),
    .mrd_done                      ( mr_done                              ),
    .maw_valid                     ( maw_valid                            ),
    .maw_fifo_push                 ( maw_fifo_push                        ),
    .maw_depend_ok                 ( maw_depend_ok                        ),
    .maw_complete_depth            (maw_complete_depth                    ),
    .mwr_complete_ptr              ( mwr_complete_ptr                     ),
    .maw_complete_next2            ( maw_complete_next2                   ),
    .maw_complete_vec_ff           ( maw_complete_vec_ff                  ),
    .maw_complete_doinc            ( maw_complete_doinc                   ),
    .maw_complete_inc_exp          ( maw_complete_inc_exp                 ),
    .maw_agen_valid                ( maw_agen_valid                       )
);

 wire [127:0]                   extn_cmd_out_mr                    ; 
 wire                           extn_param_cmdr_delayop_valid      ; 
 wire [23:0]                    extn_param_cmdr_count              ;
 wire                           extn_param_cmdr_repeatfixedop_valid;
 wire                           extn_param_cmdr_disable_submitincr ;
 wire  [31:0]                   extn_cmd_out_mr_ext                ;
 wire  [31:0]                   cmd_out_mr_ext                     ;
 wire  [31:0]                   prm_out_mr                         ;
generate if(C_ATG_BASIC_AXI4 == 0) begin : ATG_PARARAM_MR_YES
    assign extn_cmd_out_mr                    = cmd_out_mr                     ; 
    assign extn_param_cmdr_delayop_valid      = param_cmdr_delayop_valid       ;
    assign extn_param_cmdr_count              = param_cmdr_count               ;
    assign extn_param_cmdr_repeatfixedop_valid= param_cmdr_repeatfixedop_valid ;
    assign extn_param_cmdr_disable_submitincr = param_cmdr_disable_submitincr  ;
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1) begin : ATG_PARARAM_MR_NO
    assign extn_cmd_out_mr                    = cmd_out_mr_regslice_ff; 
    assign extn_param_cmdr_delayop_valid      = 1'b0                  ;
    assign extn_param_cmdr_count              = 24'h0                 ;
    assign extn_param_cmdr_repeatfixedop_valid= 1'b0                  ;
    assign extn_param_cmdr_disable_submitincr = 1'b0                  ;
end
endgenerate
axi_traffic_gen_v2_0_10_m_r_channel # (
   .C_M_AXI_THREAD_ID_WIDTH (C_M_AXI_THREAD_ID_WIDTH ),
   .C_M_AXI_ARUSER_WIDTH    (C_M_AXI_ARUSER_WIDTH    ),
   .C_ZERO_INVALID          (C_ZERO_INVALID          ),
   .C_M_AXI_DATA_WIDTH      (C_M_AXI_DATA_WIDTH      ),
   .C_M_AXI_ADDR_WIDTH      (C_M_AXI_ADDR_WIDTH      ),
   .C_ATG_BASIC_AXI4        (C_ATG_BASIC_AXI4        ),
   .C_ATG_AXI4LITE          (C_ATG_AXI4LITE          )      
) mst_rd (
    .Clk                           (s_axi_aclk                             ),
    .rst_l                         (s_axi_aresetn                          ),
    .arid_m                        ( arid_m                                ),
    .araddr_m                      ( araddr_m                              ),
    .arlen_m                       ( arlen_m                               ),
    .arsize_m                      ( arsize_m                              ),
    .arburst_m                     ( arburst_m                             ),
    .arlock_m                      ( arlock_m                              ),
    .arcache_m                     ( arcache_m                             ),
    .arprot_m                      ( arprot_m                              ),
    .arqos_m                       ( arqos_m                               ),
    .aruser_m                      ( aruser_m                              ),
    .arvalid_m                     ( arvalid_m                             ),
    .arready_m                     ( arready_m                             ),
    .rid_m                         ( rid_m                                 ),
    .rlast_m                       ( rlast_m                               ),
    .rdata_m                       ( rdata_m                               ),
    .rresp_m                       ( rresp_m                               ),
    .rvalid_m                      ( rvalid_m                              ),
    .rready_m                      ( rready_m                              ),
    .cmdram_mr_regslice_id_stable  ( cmdram_mr_regslice_id_stable          ),
    .cmd_out_mr                    ( extn_cmd_out_mr                       ), 
    .cmd_out_mr_ext                ( extn_cmd_out_mr_ext                   ), 
    .param_cmdr_delayop_valid      ( extn_param_cmdr_delayop_valid         ),
    .param_cmdr_count              ( extn_param_cmdr_count                 ),
    .param_cmdr_repeatfixedop_valid( extn_param_cmdr_repeatfixedop_valid   ),
    .param_cmdr_disable_submitincr ( extn_param_cmdr_disable_submitincr    ),
    .mram_waddr_ff                 ( mram_waddr_ff                         ),
    .mram_we_ff                    ( mram_we_ff                            ),
    .mram_write_data_ff            ( mram_write_data_ff                    ),
    .reg0_m_enable_ff              ( reg0_m_enable_ff                      ),
    .reg0_mr_ptr_ff                ( reg0_mr_ptr_ff                        ),
    .reg0_m_enable_cmdram_mrw_ff   ( reg0_m_enable_cmdram_mrw_ff           ),
    .reg0_m_enable_cmdram_mrw      ( reg0_m_enable_cmdram_mrw              ),
    .reg0_m_enable_3ff             ( reg0_m_enable_3ff                     ),
    .reg0_loop_en_ff               ( reg0_loop_en_ff                       ),
    .mr_done_ff                    ( mr_done_ff                            ),
    .mr_fifo_out_resp_bad          ( mr_fifo_out_resp_bad                  ),
    .mr_bad_last_ff                ( mr_bad_last_ff                        ),
    .mr_unexp                      ( mr_unexp                              ),
    .reg0_mr_ptr_update            ( reg0_mr_ptr_update                    ),
    .mwr_complete_ptr_ff           ( mwr_complete_ptr_ff                   ),
    .mrd_complete_ptr_ff           (mrd_complete_ptr_ff                    ),
    .mar_ptr_new_ff                ( mar_ptr_new_ff                        ),
    .mar_ptr_new_2ff               ( mar_ptr_new_2ff                       ),
    .mar_fifo_push_ff              ( mar_fifo_push_ff                      ),
    .mar_complete_doinc            ( mar_complete_doinc                    ),
    .mar_done                      ( mar_done                              ),
    .mr_done                       ( mr_done                               ),
    .mwr_done                      ( mw_done                               ),
    .mar_param_disableincr_ff      ( mar_param_disableincr_ff              ),
    .mar_fifo_push                 ( mar_fifo_push                         )
                                                                           );

axi_traffic_gen_v2_0_10_cmdram_wrap # (
   .C_FAMILY            (C_FAMILY            ),
   .C_ATG_BASIC_AXI4    (C_ATG_BASIC_AXI4    ),
   .C_M_AXI_DATA_WIDTH  (C_M_AXI_DATA_WIDTH  ),
   .C_RAMINIT_CMDRAM0_F (C_RAMINIT_CMDRAM0_F ), 
   .C_RAMINIT_CMDRAM1_F (C_RAMINIT_CMDRAM1_F ), 
   .C_RAMINIT_CMDRAM2_F (C_RAMINIT_CMDRAM2_F ), 
   .C_RAMINIT_CMDRAM3_F (C_RAMINIT_CMDRAM3_F ) 
) cmd_blk (
    .Clk                         (s_axi_aclk                          ),
    .rst_l                       (s_axi_aresetn                       ),
    .cmdram_we                   (cmdram_we                           ),
    .aw_agen_addr                (aw_agen_addr                        ),
    .reg0_m_enable_ff            (reg0_m_enable_ff                    ),
    .reg0_mw_ptr_update          (reg0_mw_ptr_update                  ),
    .reg0_mr_ptr_update          (reg0_mr_ptr_update                  ),
    .mar_ptr_new_ff              (mar_ptr_new_ff                      ),
    .ar_agen0_addr               (ar_agen0_addr                       ),
    .slvram_wr_data              (slvram_wr_data                      ),
    .arfifo_valid                (arfifo_valid                        ),
    .arfifo_out                  (arfifo_out                          ),
    .param_cmdr_submitcnt_ff     (param_cmdr_submitcnt_ff             ),
    .param_cmdw_submitcnt_ff     (param_cmdw_submitcnt_ff             ),
    .maw_ptr_new_ff              (maw_ptr_new_ff                      ),
    .cmd_out_mr_i                (cmd_out_mr_i                        ),
    .cmdram_mr_regslice_id_stable(cmdram_mr_regslice_id_stable        ),
    .cmd_out_mw_regslice         (cmd_out_mw_regslice                 ),
    .cmd_out_mr_regslice         (cmd_out_mr_regslice                 ),
    .cmd_out_mw_regslice_ff      (cmd_out_mw_regslice_ff              ),
    .cmd_out_mr_regslice_ff      (cmd_out_mr_regslice_ff              ),
    .cmdram_mw_regslice_id_stable(cmdram_mw_regslice_id_stable        )
);

axi_traffic_gen_v2_0_10_sharedram_wrap # (
   .C_FAMILY           (C_FAMILY           ),
   .C_S_AXI_DATA_WIDTH (C_S_AXI_DATA_WIDTH ),
   .C_M_AXI_DATA_WIDTH (C_M_AXI_DATA_WIDTH ),
   .C_RAMINIT_SRAM0_F  (C_RAMINIT_SRAM0_F  ) 
) sharedram_blk (
    .Clk                  (s_axi_aclk                   ),
    .rst_l                (s_axi_aresetn                ),
    .mram_waddr_ff        (mram_waddr_ff                ),
    .mram_we_ff           (mram_we_ff                   ),
    .mram_write_data_ff   (mram_write_data_ff           ),
    .mram_out             (mram_out                     ),
    .maw_agen_addr        (maw_agen_addr                ),
    .slvram_waddr_ff      (slvram_waddr_ff              ),
    .slvram_we_ff         (slvram_we_ff                 ),
    .slvram_write_data_ff (slvram_write_data_ff         ),
    .sram_rd_data_a       (sram_rd_data_a               ),
    .ar_agen_addr         (ar_agen_addr                 )
);

generate if(C_ATG_BASIC_AXI4 == 0 && C_M_AXI_ADDR_WIDTH == 32) begin : ATG_PARARAM_INST_YES
axi_traffic_gen_v2_0_10_paramram_wrap # (
  .C_FAMILY              (C_FAMILY              ),
  .C_RAMINIT_PARAMRAM0_F (C_RAMINIT_PARAMRAM0_F ),
  .C_S_AXI_DATA_WIDTH    (C_S_AXI_DATA_WIDTH    ),
  .C_M_AXI_DATA_WIDTH    (C_M_AXI_DATA_WIDTH    ),
  .C_M_AXI_ADDR_WIDTH    (C_M_AXI_ADDR_WIDTH    ),
  .C_REPEAT_COUNT        (C_REPEAT_COUNT        ),
  .C_ATG_BASIC_AXI4      (C_ATG_BASIC_AXI4      ),
  .C_AXI_WR_ADDR_SEED    (C_AXI_WR_ADDR_SEED    ),
  .C_AXI_RD_ADDR_SEED    (C_AXI_RD_ADDR_SEED    )  
) paramram_blk (
    .Clk                           (s_axi_aclk                            ),
    .rst_l                         (s_axi_aresetn                         ),
    .awfifo_valid                  (awfifo_valid                          ),
    .awfifo_out                    (awfifo_out                            ),
    .wfifo_valid                   (wfifo_valid                           ),
    .wfifo_out                     (wfifo_out                             ),
    .cmd_out_mr_regslice           (cmd_out_mr_regslice                   ),
    .cmd_out_mr_regslice_ff        (cmd_out_mr_regslice_ff                ),
    .cmd_out_mw_regslice           (cmd_out_mw_regslice                   ),
    .cmd_out_mw_regslice_ff        (cmd_out_mw_regslice_ff                ),
    .param_cmdw_submitcnt_ff       (param_cmdw_submitcnt_ff               ),
    .param_cmdr_submitcnt_ff       (param_cmdr_submitcnt_ff               ),
    .cmd_out_mr                    (cmd_out_mr                            ),
    .mar_fifo_push_ff              (mar_fifo_push_ff                      ),
    .mar_ptr_new_ff                (mar_ptr_new_ff                        ),
    .mar_ptr_new_2ff               (mar_ptr_new_2ff                       ),
    .param_cmdr_delayop_valid      (param_cmdr_delayop_valid              ), 
    .param_cmdr_count              (param_cmdr_count                      ),
    .param_cmdr_repeatfixedop_valid(param_cmdr_repeatfixedop_valid        ),
    .param_cmdr_disable_submitincr (param_cmdr_disable_submitincr         ),
    .cmd_out_mw                    (cmd_out_mw                            ),
    .maw_fifo_push_ff              (maw_fifo_push_ff                      ),
    .maw_ptr_new_ff                (maw_ptr_new_ff                        ),
    .maw_ptr_new_2ff               (maw_ptr_new_2ff                       ),
    .param_cmdw_delayop_valid      (param_cmdw_delayop_valid              ),
    .param_cmdw_count              (param_cmdw_count                      ),
    .param_cmdw_repeatfixedop_valid(param_cmdw_repeatfixedop_valid        ),
    .param_cmdw_disable_submitincr (param_cmdw_disable_submitincr         )
);
end
endgenerate

generate if(C_ATG_BASIC_AXI4 == 1 && C_M_AXI_ADDR_WIDTH > 32) begin : EXT_ADDR_BASIC_INST
assign extn_cmd_out_mw_ext = cmd_out_mw_ext;
assign extn_cmd_out_mr_ext = cmd_out_mr_ext;
end
endgenerate

generate if(C_ATG_BASIC_AXI4 == 0 && C_M_AXI_ADDR_WIDTH > 32) begin : ATG_PARARAM_64_INST_YES
axi_traffic_gen_v2_0_10_paramram_64_wrap # (
  .C_FAMILY              (C_FAMILY              ),
  .C_RAMINIT_PARAMRAM0_F (C_RAMINIT_PARAMRAM0_F ),
  .C_S_AXI_DATA_WIDTH    (C_S_AXI_DATA_WIDTH    ),
  .C_M_AXI_DATA_WIDTH    (C_M_AXI_DATA_WIDTH    ),
  .C_M_AXI_ADDR_WIDTH    (C_M_AXI_ADDR_WIDTH    ),
  .C_REPEAT_COUNT        (C_REPEAT_COUNT        ),
  .C_ATG_BASIC_AXI4      (C_ATG_BASIC_AXI4      ),
  .C_AXI_WR_ADDR_SEED    (C_AXI_WR_ADDR_SEED    ),
  .C_AXI_RD_ADDR_SEED    (C_AXI_RD_ADDR_SEED    )  
) paramram_blk (
    .Clk                           (s_axi_aclk                            ),
    .rst_l                         (s_axi_aresetn                         ),
    .awfifo_valid                  (awfifo_valid                          ),
    .awfifo_out                    (awfifo_out                            ),
    .wfifo_valid                   (wfifo_valid                           ),
    .wfifo_out                     (wfifo_out                             ),
    .cmd_out_mr_regslice           (cmd_out_mr_regslice                   ),
    .cmd_out_mr_regslice_ff        (cmd_out_mr_regslice_ff                ),
    .cmd_out_mw_regslice           (cmd_out_mw_regslice                   ),
    .cmd_out_mw_regslice_ff        (cmd_out_mw_regslice_ff                ),
    .param_cmdw_submitcnt_ff       (param_cmdw_submitcnt_ff               ),
    .param_cmdr_submitcnt_ff       (param_cmdr_submitcnt_ff               ),
    .cmd_out_mr                    (cmd_out_mr                            ),
    .adr_out_mr                    (cmd_out_mr_ext                        ),
    .adr_out_mw                    (cmd_out_mw_ext                        ),
    .prm_out_mr                    (prm_out_mr                            ),
    .prm_out_mw                    (prm_out_mw                            ),
    .mar_fifo_push_ff              (mar_fifo_push_ff                      ),
    .mar_ptr_new_ff                (mar_ptr_new_ff                        ),
    .mar_ptr_new_2ff               (mar_ptr_new_2ff                       ),
    .param_cmdr_delayop_valid      (param_cmdr_delayop_valid              ), 
    .param_cmdr_count              (param_cmdr_count                      ),
    .param_cmdr_repeatfixedop_valid(param_cmdr_repeatfixedop_valid        ),
    .param_cmdr_disable_submitincr (param_cmdr_disable_submitincr         ),
    .cmd_out_mw                    (cmd_out_mw                            ),
    .maw_fifo_push_ff              (maw_fifo_push_ff                      ),
    .maw_ptr_new_ff                (maw_ptr_new_ff                        ),
    .maw_ptr_new_2ff               (maw_ptr_new_2ff                       ),
    .param_cmdw_delayop_valid      (param_cmdw_delayop_valid              ),
    .param_cmdw_count              (param_cmdw_count                      ),
    .param_cmdw_repeatfixedop_valid(param_cmdw_repeatfixedop_valid        ),
    .param_cmdw_disable_submitincr (param_cmdw_disable_submitincr         )
);

assign extn_cmd_out_mw_ext = prm_out_mw;
assign extn_cmd_out_mr_ext = prm_out_mr;

end
endgenerate

generate if(C_M_AXI_ADDR_WIDTH > 32) begin : ATG_ADDRRAM_INST_YES
axi_traffic_gen_v2_0_10_addrram_wrap # (
  .C_FAMILY              (C_FAMILY              ),
  .C_RAMINIT_ADDRRAM0_F  (C_RAMINIT_ADDRRAM0_F  ),
  .C_S_AXI_DATA_WIDTH    (C_S_AXI_DATA_WIDTH    ),
  .C_M_AXI_DATA_WIDTH    (C_M_AXI_DATA_WIDTH    ),
  .C_M_AXI_ADDR_WIDTH    (C_M_AXI_ADDR_WIDTH    ),
  .C_ATG_BASIC_AXI4      (C_ATG_BASIC_AXI4      )
) addrram_blk (
    .Clk                           (s_axi_aclk                            ),
    .rst_l                         (s_axi_aresetn                         ),
    .ar_agen_addr                  (ar_agen0_addr                         ),
    .ar_agen_valid                 (ar_agen0_valid                        ),
    .aw_agen_addr                  (aw_agen_addr                          ),
    .aw_agen_valid                 (aw_agen_valid                         ),
    .wfifo_valid                   (wfifo_valid                           ),
    .wfifo_out                     (wfifo_out                             ),
    .rd_ext_addr                   (addrram_rd_out                        ),
    .mr_ext_addr                   (cmd_out_mr_ext                        ),
    .mw_ext_addr                   (cmd_out_mw_ext                        ),
    .mar_ptr_new_ff                (mar_ptr_new_ff                        ),
    .maw_ptr_new_ff                (maw_ptr_new_ff                        )
);
end
endgenerate

generate if(C_M_AXI_ADDR_WIDTH == 32) begin : ATG_ADDRRAM_INST_NO
assign extn_cmd_out_mr_ext = 32'h00000000;
assign extn_cmd_out_mw_ext = 32'h00000000;
end
endgenerate

axi_traffic_gen_v2_0_10_registers # (
  .C_IS_COHERENT          (C_IS_COHERENT          ),
  .C_IS_AFI               (C_IS_AFI               ),
  .C_M_AXI_DATA_WIDTH     (C_M_AXI_DATA_WIDTH     ),
  .C_IS_AXI4              (C_IS_AXI4              ),
  .C_S_AXI_DATA_WIDTH     (C_S_AXI_DATA_WIDTH     ),
  .C_M_AXI_THREAD_ID_WIDTH(C_M_AXI_THREAD_ID_WIDTH),
  .C_S_AXI_ID_WIDTH       (C_S_AXI_ID_WIDTH       ),
  .C_ATG_BASIC_AXI4       (C_ATG_BASIC_AXI4       ),
  .C_ATG_REPEAT_TYPE      (C_ATG_REPEAT_TYPE      ),
  .C_ATG_HLTP_MODE        (C_ATG_HLTP_MODE        ),
  .C_ATG_STATIC           (C_ATG_STATIC           ),
  .C_ATG_SLAVE_ONLY       (C_ATG_SLAVE_ONLY       ),
  .C_ATG_SYSTEM_INIT      (C_ATG_SYSTEM_INIT      ), 
  .C_ATG_STREAMING        (C_ATG_STREAMING        ) 
) reg_blk (
    .Clk                        (s_axi_aclk                         ),
    .rst_l                      (s_axi_aresetn                      ),
    .core_global_start          (core_global_start                  ),
    .core_global_stop           (core_global_stop                   ),
    .wr_reg_decode              (wr_reg_decode                      ),
    .wr_reg_data                (wr_reg_data                        ),
    .reg0_mr_ptr_update         (reg0_mr_ptr_update                 ),
    .reg0_mw_ptr_update         (reg0_mw_ptr_update                 ),
    .mr_done_ff                 (mr_done_ff                         ),
    .mw_done_ff                 (mw_done_ff                         ),
    .rddec6_valid_ff            (rddec6_valid_ff                    ),
    .err_new_slv                (err_new_slv                        ),
    .rd_reg_decode              (rd_reg_decode                      ),
    .rd_reg_data_raw            (rd_reg_data_raw                    ),
    .slv_ex_info0_ff            (slv_ex_info0_ff                    ),
    .slv_ex_info1_ff            (slv_ex_info1_ff                    ),
    .slv_ex_info1               (slv_ex_info1                       ),
    .slv_ex_valid0_ff           (slv_ex_valid0_ff                   ),
    .slv_ex_valid1_ff           (slv_ex_valid1_ff                   ),
    .slv_ex_toggle_ff           (slv_ex_toggle_ff                   ),
    .b_resp_unexp_ff            (b_resp_unexp_ff                    ),
    .b_resp_bad_ff              (b_resp_bad_ff                      ),
    .mr_unexp                   (mr_unexp                           ),
    .mr_fifo_out_resp_bad       (mr_fifo_out_resp_bad               ),
    .mr_bad_last_ff             (mr_bad_last_ff                     ),
    .reg1_disallow_excl         (reg1_disallow_excl                 ),
    .reg1_sgl_slv_wr            (reg1_sgl_slv_wr                    ),
    .reg1_wrs_block_rds         (reg1_wrs_block_rds                 ),
    .reg1_sgl_slv_rd            (reg1_sgl_slv_rd                    ),
    .reg0_mw_ptr_ff             (reg0_mw_ptr_ff                     ),
    .reg0_m_enable_cmdram_mrw   (reg0_m_enable_cmdram_mrw           ),
    .reg0_m_enable_cmdram_mrw_ff(reg0_m_enable_cmdram_mrw_ff        ),
    .reg0_m_enable_ff           (reg0_m_enable_ff                   ),
    .reg0_m_enable_3ff          (reg0_m_enable_3ff                  ),
    .reg0_loop_en_ff            (reg0_loop_en_ff                    ),
    .reg0_mr_ptr_ff             (reg0_mr_ptr_ff                     ),
    .err_out                    (err_out                            ),
    .irq_out                    (irq_out                            ),
    .reg0_mr_ptr                ( reg0_mr_ptr                       ),
    .reg0_mw_ptr                ( reg0_mw_ptr                       ),
    .reg0_rev                   ( reg0_rev                          )
);

//NOTE:
// global_test_en_l is not used.
assign dbg_out   = 24'h0;
assign dbg_out_ext = 3'b000;
endmodule





