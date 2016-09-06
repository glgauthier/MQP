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
// Filename:       axi_traffic_gen_v2_0_10_static_top.v
// Version : v1.0
// Description:    static configuration top level module
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_static_top #
(
  parameter C_S_AXI_DATA_WIDTH      = 32              ,
  parameter C_S_AXI_ID_WIDTH        = 1               ,
  parameter C_M_AXI_THREAD_ID_WIDTH = 1               ,
  parameter C_M_AXI_AWUSER_WIDTH    = 1               ,
  parameter C_M_AXI_ARUSER_WIDTH    = 1               ,
  parameter C_M_AXI_DATA_WIDTH      = 32              , 
  parameter C_M_AXI_ADDR_WIDTH      = 32              , 
  parameter C_ATG_STATIC_WR_ADDRESS = 32'h12A0_0000   ,
  parameter C_ATG_STATIC_RD_ADDRESS = 32'h13A0_0000   ,
  parameter C_ATG_STATIC_WR_HIGH_ADDRESS = 32'h12A0_0FFF,
  parameter C_ATG_STATIC_RD_HIGH_ADDRESS = 32'h13A0_0FFF,
  parameter C_ATG_STATIC_INCR       = 0               ,  
  parameter C_ATG_STATIC_EN_READ    = 1               ,
  parameter C_ATG_STATIC_EN_WRITE   = 1               ,
  parameter C_ATG_STATIC_FREE_RUN   = 1               ,
  parameter C_ATG_STATIC_TRANGAP    = 32'd255         ,
  parameter C_ATG_STATIC_RD_PIPELINE   = 1               ,
  parameter C_ATG_STATIC_WR_PIPELINE   = 1               ,
  parameter C_ATG_HLTP_MODE            = 0               , //0-Custom,1-High Level Traffic.
  parameter C_ATG_STATIC_LENGTH     = 8'h3
) (
// system
 input                                Clk            ,
 input                                rst_l          ,
 input                                core_global_start,
 input                                core_global_stop ,
//Slave
 input  [C_S_AXI_ID_WIDTH-1:0]        awid_s         ,
 input  [31:0]                        awaddr_s       ,
 input	                              awvalid_s      ,
 output	                              awready_s      ,
 input	                              wlast_s        ,
 input  [C_S_AXI_DATA_WIDTH-1:0]      wdata_s        ,
 input  [C_S_AXI_DATA_WIDTH/8-1:0]    wstrb_s        ,
 input	                              wvalid_s       ,
 output	                              wready_s       ,
 output [C_S_AXI_ID_WIDTH-1:0]        bid_s          ,
 output [1:0]                         bresp_s        ,
 output	                              bvalid_s       ,
 input	                              bready_s       ,
 
 input  [C_S_AXI_ID_WIDTH-1:0]        arid_s         ,
 input  [31:0]                        araddr_s       ,
 input	                              arvalid_s      ,
 output	                              arready_s      ,
 output [C_S_AXI_ID_WIDTH-1:0]        rid_s          ,
 output	                              rlast_s        ,
 output [C_S_AXI_DATA_WIDTH-1:0]      rdata_s        ,
 output [1:0]                         rresp_s        ,
 output	                              rvalid_s       ,
 input	                              rready_s       ,
//Master-write
 output [C_M_AXI_THREAD_ID_WIDTH-1:0] awid_m         ,
 output [C_M_AXI_ADDR_WIDTH-1:0]      awaddr_m       ,
 output [7:0]                         awlen_m        ,
 output [2:0]                         awsize_m       ,
 output [1:0]                         awburst_m      ,
 output [0:0]                         awlock_m       ,
 output [3:0]                         awcache_m      ,
 output [2:0]                         awprot_m       ,
 output [3:0]                         awqos_m        ,
 output [C_M_AXI_AWUSER_WIDTH-1:0]    awuser_m       ,
 output                               awvalid_m      ,
 input                                awready_m      ,

 output                               wlast_m        ,
 output [C_M_AXI_DATA_WIDTH-1:0]      wdata_m        ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]    wstrb_m        ,
 output                               wvalid_m       ,
 input                                wready_m       ,

 input [C_M_AXI_THREAD_ID_WIDTH-1:0]  bid_m          ,
 input [1:0]                          bresp_m        ,
 input                                bvalid_m       ,
 output                               bready_m       , 
//Master-read
 output [C_M_AXI_THREAD_ID_WIDTH-1:0] arid_m         ,
 output [C_M_AXI_ADDR_WIDTH-1:0]      araddr_m       ,
 output [7:0]                         arlen_m        ,
 output [2:0]                         arsize_m       ,
 output [1:0]                         arburst_m      ,
 output [0:0]                         arlock_m       ,
 output [3:0]                         arcache_m      ,
 output [2:0]                         arprot_m       ,
 output [3:0]                         arqos_m        ,
 output [C_M_AXI_ARUSER_WIDTH-1:0]    aruser_m       ,
 output                               arvalid_m      ,
 input                                arready_m      ,
//r
 input [C_M_AXI_THREAD_ID_WIDTH-1:0]  rid_m          ,
 input                                rlast_m        ,
 input [C_M_AXI_DATA_WIDTH-1:0]       rdata_m        ,
 input [1:0]                          rresp_m        ,
 input                                rvalid_m       ,
 output                               rready_m        
);

 wire           reg0_m_enable_ff         ; 
 wire           static_ctl_en            ;
 wire           reg1_done                ;
 wire           reset_reg1_done                ;
 wire           reset_reg1_en                ;
 wire           static_ctl_en_pulse      ;
 wire [31:0]    static_mr_tran_cnt       ;
 wire [31:0]    static_mw_tran_cnt       ;
 wire [31:0]    reg5_glcnt               ;
 wire [7:0]     static_len               ;
 wire           reg2_length_req          ;
 wire           reg0_m_enable_3ff        ;
 wire [127:0]   cmd_out_mw               ;
 wire [127:0]   cmd_out_mr               ;
 wire [C_M_AXI_DATA_WIDTH-1:0]  mram_out ;  
axi_traffic_gen_v2_0_10_static_regblk #(
  .C_S_AXI_DATA_WIDTH (C_S_AXI_DATA_WIDTH ) ,
  .C_ATG_STATIC_LENGTH(C_ATG_STATIC_LENGTH) , 
  .C_S_AXI_ID_WIDTH   (C_S_AXI_ID_WIDTH   )
) static_regblk (
   .Clk                (Clk                ),
   .rst_l              (rst_l              ),
   .core_global_start  (core_global_start  ),
   .core_global_stop   (core_global_stop   ),
   .awid_s             (awid_s             ),
   .awaddr_s           (awaddr_s           ),
   .awvalid_s          (awvalid_s          ),
   .awready_s          (awready_s          ),
   .wlast_s            (wlast_s            ),
   .wdata_s            (wdata_s            ),
   .wstrb_s            (wstrb_s            ),
   .wvalid_s           (wvalid_s           ),
   .wready_s           (wready_s           ),
   .bid_s              (bid_s              ),
   .bresp_s            (bresp_s            ),
   .bvalid_s           (bvalid_s           ),
   .bready_s           (bready_s           ),
   .arid_s             (arid_s             ),
   .araddr_s           (araddr_s           ),
   .arvalid_s          (arvalid_s          ),
   .arready_s          (arready_s          ),
   .rid_s              (rid_s              ),
   .rlast_s            (rlast_s            ),
   .rdata_s            (rdata_s            ),
   .rresp_s            (rresp_s            ),
   .rvalid_s           (rvalid_s           ),
   .rready_s           (rready_s           ),
   .reg0_m_enable_ff   (reg0_m_enable_ff   ),
   .static_ctl_en      (static_ctl_en      ),
   .reg1_done          (reg1_done          ),
   .reset_reg1_done          (reset_reg1_done          ),
   .reset_reg1_en          (reset_reg1_en          ),
   .static_ctl_en_pulse(static_ctl_en_pulse),
   .static_mw_tran_cnt (static_mw_tran_cnt ),
   .static_mr_tran_cnt (static_mr_tran_cnt ),
   .static_len         (static_len         ),
   .reg5_glbcnt        (reg5_glcnt         ),
   .reg2_length_req    (reg2_length_req    ),
   .reg0_m_enable_3ff  (reg0_m_enable_3ff  ) 
);
//New ST_CODE
axi_traffic_gen_v2_0_10_static_mrdwr #
(
  .C_M_AXI_THREAD_ID_WIDTH ( C_M_AXI_THREAD_ID_WIDTH ), 
  .C_M_AXI_AWUSER_WIDTH    ( C_M_AXI_AWUSER_WIDTH    ),
  .C_M_AXI_ARUSER_WIDTH    ( C_M_AXI_ARUSER_WIDTH    ),
  .C_M_AXI_ADDR_WIDTH      ( C_M_AXI_ADDR_WIDTH      ),
  .C_ATG_STATIC_RD_ADDRESS ( C_ATG_STATIC_RD_ADDRESS ),
  .C_ATG_STATIC_WR_ADDRESS ( C_ATG_STATIC_WR_ADDRESS ),
  .C_ATG_STATIC_WR_HIGH_ADDRESS(C_ATG_STATIC_WR_HIGH_ADDRESS),
  .C_ATG_STATIC_RD_HIGH_ADDRESS(C_ATG_STATIC_RD_HIGH_ADDRESS),
  .C_ATG_STATIC_INCR       (C_ATG_STATIC_INCR        ),  
  .C_ATG_STATIC_EN_READ    ( C_ATG_STATIC_EN_READ    ),
  .C_ATG_STATIC_EN_WRITE   ( C_ATG_STATIC_EN_WRITE   ),
  .C_ATG_STATIC_LENGTH     ( C_ATG_STATIC_LENGTH     ),
  .C_ATG_STATIC_RD_PIPELINE( C_ATG_STATIC_RD_PIPELINE),
  .C_ATG_STATIC_WR_PIPELINE( C_ATG_STATIC_WR_PIPELINE),
  .C_ATG_STATIC_FREE_RUN   ( C_ATG_STATIC_FREE_RUN   ),
  .C_ATG_STATIC_TRANGAP    ( C_ATG_STATIC_TRANGAP    ),
  .C_ATG_HLTP_MODE         (C_ATG_HLTP_MODE          ),
  .C_M_AXI_DATA_WIDTH      ( C_M_AXI_DATA_WIDTH      )
) static_mrdwr (
  .Clk            (Clk            ),
  .rst_l          (rst_l          ),
  .awid_m         (awid_m         ),
  .awaddr_m       (awaddr_m       ),
  .awlen_m        (awlen_m        ),
  .awsize_m       (awsize_m       ),
  .awburst_m      (awburst_m      ),
  .awlock_m       (awlock_m       ),
  .awcache_m      (awcache_m      ),
  .awprot_m       (awprot_m       ),
  .awqos_m        (awqos_m        ),
  .awuser_m       (awuser_m       ),
  .awvalid_m      (awvalid_m      ),
  .awready_m      (awready_m      ),
  .wlast_m        (wlast_m        ),
  .wdata_m        (wdata_m        ),
  .wstrb_m        (wstrb_m        ),
  .wvalid_m       (wvalid_m       ),
  .wready_m       (wready_m       ),
  .bid_m          (bid_m          ),
  .bresp_m        (bresp_m        ),
  .bvalid_m       (bvalid_m       ),
  .bready_m       (bready_m       ),
  .arid_m         (arid_m         ),
  .araddr_m       (araddr_m       ),
  .arlen_m        (arlen_m        ),
  .arsize_m       (arsize_m       ),
  .arburst_m      (arburst_m      ),
  .arlock_m       (arlock_m       ),
  .arcache_m      (arcache_m      ),
  .arprot_m       (arprot_m       ),
  .arqos_m        (arqos_m        ),
  .aruser_m       (aruser_m       ),
  .arvalid_m      (arvalid_m      ),
  .arready_m      (arready_m      ),
  .rid_m          (rid_m          ),
  .rlast_m        (rlast_m        ),
  .rdata_m        (rdata_m        ),
  .rresp_m        (rresp_m        ),
  .rvalid_m       (rvalid_m       ),
  .rready_m       (rready_m       ),
  .reg1_st_enable (static_ctl_en  ),
  .reg1_done      (reg1_done      ),
   .reset_reg1_done          (reset_reg1_done          ),
   .reset_reg1_en          (reset_reg1_en          ),
  .reg2_length    (static_len     ),
  .reg2_length_req(reg2_length_req),
  .reg3_rdcnt     (static_mr_tran_cnt),
  .reg4_wrcnt     (static_mw_tran_cnt    ),
  .reg5_glcnt     (reg5_glcnt     ) 
);
//New ST_CODE
//axi_traffic_gen_v2_0_10_static_cmdgen # (
// .C_ATG_STATIC_ADDRESS(C_ATG_STATIC_ADDRESS),
// .C_M_AXI_DATA_WIDTH  (C_M_AXI_DATA_WIDTH  ),
// .C_ATG_STATIC_LENGTH (C_ATG_STATIC_LENGTH ) 
//) static_cmdgen (
// .Clk          (Clk          ),
// .rst_l        (rst_l        ),
// .static_ctl_en(static_ctl_en),
// .static_len   (static_len   ),
// .cmd_out_mw   (cmd_out_mw   ),
// .cmd_data     (mram_out     ),
// .cmd_out_mr   (cmd_out_mr   )
//);
//
//               
//axi_traffic_gen_v2_0_10_static_mw # (
// .C_M_AXI_THREAD_ID_WIDTH(C_M_AXI_THREAD_ID_WIDTH),
// .C_M_AXI_AWUSER_WIDTH   (C_M_AXI_AWUSER_WIDTH   ),
// .C_M_AXI_DATA_WIDTH     (C_M_AXI_DATA_WIDTH     ) 
//) static_mw (
// .Clk                (Clk                ),
// .rst_l              (rst_l              ),
// .awid_m             (awid_m             ),
// .awaddr_m           (awaddr_m           ),
// .awlen_m            (awlen_m            ),
// .awsize_m           (awsize_m           ),
// .awburst_m          (awburst_m          ),
// .awlock_m           (awlock_m           ),
// .awcache_m          (awcache_m          ),
// .awprot_m           (awprot_m           ),
// .awqos_m            (awqos_m            ),
// .awuser_m           (awuser_m           ),
// .awvalid_m          (awvalid_m          ),
// .awready_m          (awready_m          ),
// .wlast_m            (wlast_m            ),
// .wdata_m            (wdata_m            ),
// .wstrb_m            (wstrb_m            ),
// .wvalid_m           (wvalid_m           ),
// .wready_m           (wready_m           ),
// .bid_m              (bid_m              ),
// .bresp_m            (bresp_m            ),
// .bvalid_m           (bvalid_m           ),
// .bready_m           (bready_m           ),
// .mram_out           (mram_out           ),
// .reg0_m_enable_ff   (reg0_m_enable_ff   ),
// .reg0_m_enable_3ff  (reg0_m_enable_3ff  ),
// .static_ctl_en_pulse(static_ctl_en_pulse),
// .static_mw_tran_cnt (static_mw_tran_cnt ),
// .cmd_out_mw         (cmd_out_mw         ) 
//);
//
//axi_traffic_gen_v2_0_10_static_mr #
//(
// .C_M_AXI_THREAD_ID_WIDTH(C_M_AXI_THREAD_ID_WIDTH),
// .C_M_AXI_ARUSER_WIDTH   (C_M_AXI_ARUSER_WIDTH   ),
// .C_M_AXI_DATA_WIDTH     (C_M_AXI_DATA_WIDTH     ) 
//) static_mr (
//  .Clk                (Clk                ),
//  .rst_l              (rst_l              ),
//  .arid_m             (arid_m             ),
//  .araddr_m           (araddr_m           ),
//  .arlen_m            (arlen_m            ),
//  .arsize_m           (arsize_m           ),
//  .arburst_m          (arburst_m          ),
//  .arlock_m           (arlock_m           ),
//  .arcache_m          (arcache_m          ),
//  .arprot_m           (arprot_m           ),
//  .arqos_m            (arqos_m            ),
//  .aruser_m           (aruser_m           ),
//  .arvalid_m          (arvalid_m          ),
//  .arready_m          (arready_m          ),
//  .rid_m              (rid_m              ),
//  .rlast_m            (rlast_m            ),
//  .rdata_m            (rdata_m            ),
//  .rresp_m            (rresp_m            ),
//  .rvalid_m           (rvalid_m           ),
//  .rready_m           (rready_m           ),
//  .reg0_m_enable_ff   (reg0_m_enable_ff   ),
//  .reg0_m_enable_3ff  (reg0_m_enable_3ff  ),
//  .static_ctl_en_pulse(static_ctl_en_pulse),
//  .static_mr_tran_cnt (static_mr_tran_cnt ),
//  .cmd_out_mr         (cmd_out_mr         ) 
//);
endmodule
