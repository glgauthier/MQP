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
// Filename:       axi_traffic_gen_v2_0_10_slave_only_top.v
// Version : v1.0
// Description:    Top level module for VIVADO.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------

`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_slave_only_top
        #(
parameter C_FAMILY                = "virtex7"   ,
parameter C_BASEADDR              = 32'hffffffff,
parameter C_HIGHADDR              = 32'h00000000,
parameter C_ZERO_INVALID          = 1           ,
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
parameter C_ATG_BASIC_AXI4        = 1           ,
parameter C_RAMINIT_CMDRAM0_F     = "NONE"      , 
parameter C_RAMINIT_CMDRAM1_F     = "NONE"      , 
parameter C_RAMINIT_CMDRAM2_F     = "NONE"      , 
parameter C_RAMINIT_CMDRAM3_F     = "NONE"      , 
parameter C_RAMINIT_SRAM0_F       = "NONE"      , 
parameter C_RAMINIT_PARAMRAM0_F   = "NONE" 

) (
 input                                 s_axi_aclk         ,
 input                                 s_axi_aresetn      ,

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
 input                                 global_test_en_l

);
  /* hierarchy structure
  slave 
   |_ slave write
   |_ slave read
  */
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
 wire [15:0]                    cmdram_we                     ;
 wire [63:0]                    slvram_wr_data                ;
 wire                           awfifo_valid                  ;
 wire [71:0]                    awfifo_out                    ;
 wire [C_S_AXI_DATA_WIDTH*9/8+1-1:0]    wfifo_out             ; 
 wire                           slv_ex_valid0_ff              ;
 wire                           slv_ex_valid1_ff              ;
 wire                           reg0_m_enable_ff              ;
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
 wire [19:0]                    param_cmdr_submitcnt_ff       ;
 wire [19:0]                    param_cmdw_submitcnt_ff       ;
 wire [127:0]                   cmd_out_mw_regslice           ;
 wire [127:0]                   cmd_out_mr_regslice           ;
 wire [127:0]                   cmd_out_mw_regslice_ff        ;
 wire [127:0]                   cmd_out_mr_regslice_ff        ;
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
    .slvram_write_data_ff (slvram_write_data_ff         ) 
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

    .slv_ex_info0_ff    (slv_ex_info0_ff            ),
    .slv_ex_valid0_ff   (slv_ex_valid0_ff           ),
    .slv_ex_info1_ff    (slv_ex_info1_ff            ),
    .slv_ex_info1       (slv_ex_info1               ),
    .slv_ex_valid1_ff   (slv_ex_valid1_ff           ),
    .slv_ex_toggle_ff   (slv_ex_toggle_ff           ),
    .slv_ex_new_valid0  (slv_ex_new_valid0          ),
    .slv_ex_new_valid1  (slv_ex_new_valid1          ),
    .ar_agen_addr       (ar_agen_addr               ),
    .slvram_rd_out      (slvram_rd_out              ) 
);

assign mram_we_ff        = {(C_M_AXI_DATA_WIDTH/8) {1'b0}};
assign mram_write_data_ff= { C_M_AXI_DATA_WIDTH {1'b0}};
assign maw_agen_addr     = 16'h0;
axi_traffic_gen_v2_0_10_sharedram_wrap # (
   .C_FAMILY           (C_FAMILY           ),
   .C_S_AXI_DATA_WIDTH (C_S_AXI_DATA_WIDTH ),
   .C_M_AXI_DATA_WIDTH (C_M_AXI_DATA_WIDTH ),
   .C_RAMINIT_SRAM0_F  (C_RAMINIT_SRAM0_F  ) 
) sharedram_blk (
    .Clk                  (s_axi_aclk                   ),
    .rst_l                (s_axi_aresetn                ),
    .mram_waddr_ff        (11'h0                        ),
    .mram_we_ff           (mram_we_ff                   ),
    .mram_write_data_ff   (mram_write_data_ff           ),
    .maw_agen_addr        (maw_agen_addr                ),
    .slvram_waddr_ff      (slvram_waddr_ff              ),
    .slvram_we_ff         (slvram_we_ff                 ),
    .slvram_write_data_ff (slvram_write_data_ff         ),
    .sram_rd_data_a       (sram_rd_data_a               ),
    .ar_agen_addr         (ar_agen_addr                 )
);

endmodule
