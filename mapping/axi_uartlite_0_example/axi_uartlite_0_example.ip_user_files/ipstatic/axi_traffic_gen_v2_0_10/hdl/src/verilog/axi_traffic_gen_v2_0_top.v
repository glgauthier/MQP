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
// Filename:       axi_traffic_gen_v2_0_10_top.v
// Version : v1.0
// Description:    Top level module for VIVADO.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------

`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_top
        #(
parameter C_FAMILY                   = "virtex7"      ,
parameter C_BASEADDR                 = 32'h00000000   ,
parameter C_HIGHADDR                 = 32'h0000ffff   ,
parameter C_ZERO_INVALID             = 1              ,
parameter C_NO_EXCL                  = 0              ,
parameter C_S_AXI_DATA_WIDTH         = 32             ,
parameter C_S_AXI_AWUSER_WIDTH       = 8              ,
parameter C_S_AXI_ARUSER_WIDTH       = 8              ,
parameter C_S_AXI_ID_WIDTH           = 1              ,
parameter C_M_AXI_THREAD_ID_WIDTH    = 1              ,
parameter C_M_AXI_DATA_WIDTH         = 32             ,
parameter C_M_AXI_ADDR_WIDTH         = 32             ,
parameter C_M_AXI_AWUSER_WIDTH       = 8              ,
parameter C_M_AXI_ARUSER_WIDTH       = 8              ,
parameter C_AXIS1_HAS_TKEEP          = 1              ,
parameter C_AXIS1_HAS_TSTRB          = 1              ,
parameter C_AXIS2_HAS_TKEEP          = 1              ,
parameter C_AXIS2_HAS_TSTRB          = 1              ,
parameter C_AXIS_TDATA_WIDTH         = 32             ,
parameter C_AXIS_TUSER_WIDTH         = 8              ,
parameter C_AXIS_TID_WIDTH           = 8              ,
parameter C_AXIS_TDEST_WIDTH         = 8              ,
parameter C_ATG_BASIC_AXI4           = 0              ,
parameter C_ATG_REPEAT_TYPE          = 0              , //0-One-shit,1-Repititive
parameter C_ATG_HLTP_MODE            = 0              , //0-Custom,1-High Level Traffic.
parameter C_ATG_STATIC               = 0              ,
parameter C_ATG_SYSTEM_INIT          = 0              ,
parameter C_ATG_SYSTEM_TEST          = 0              ,
parameter C_ATG_STREAMING            = 0              ,
parameter C_ATG_STREAMING_MST_ONLY   = 1              ,
parameter C_ATG_STREAMING_MST_LPBK   = 0              ,
parameter C_ATG_STREAMING_SLV_LPBK   = 0              ,
parameter C_ATG_STREAMING_MAX_LEN_BITS = 1            ,
parameter C_AXIS_SPARSE_EN           = 1              ,
parameter C_ATG_SLAVE_ONLY           = 0              ,
parameter C_ATG_STATIC_WR_ADDRESS    = 32'h12A0_0000  ,
parameter C_ATG_STATIC_RD_ADDRESS    = 32'h13A0_0000  ,
parameter C_ATG_STATIC_WR_HIGH_ADDRESS  = 32'h12A0_0FFF,
parameter C_ATG_STATIC_RD_HIGH_ADDRESS  = 32'h13A0_0FFF,
parameter C_ATG_STATIC_INCR          = 0              ,
parameter C_ATG_STATIC_EN_READ       = 1              ,
parameter C_ATG_STATIC_EN_WRITE      = 1              ,
parameter C_ATG_STATIC_FREE_RUN      = 1              ,
parameter C_ATG_STATIC_RD_PIPELINE   = 3              , //3-Static case,1-Throughput
parameter C_ATG_STATIC_WR_PIPELINE   = 3              , //3-static case,1-Throughput
parameter C_ATG_STATIC_TRANGAP       = 32'd255        , //0-static cases,>1-Throughput
parameter C_ATG_STATIC_LENGTH        = 16             ,
parameter C_ATG_SYSTEM_INIT_DATA_MIF = "atg_data.mif" ,
parameter C_ATG_SYSTEM_INIT_ADDR_MIF = "atg_addr.mif" ,
parameter C_ATG_SYSTEM_INIT_CTRL_MIF = "atg_ctrl.mif" ,
parameter C_ATG_SYSTEM_INIT_MASK_MIF = "atg_mask.mif" ,
parameter C_ATG_MIF_DATA_DEPTH       = 16             ,// 4(16),5(32),6(64),7(128),8(256)
parameter C_ATG_MIF_ADDR_BITS        = 4              ,// 4(16),5(32),6(64),7(128),8(256)
parameter C_ATG_SYSTEM_CMD_MAX_RETRY = 32'h100        ,
parameter C_ATG_SYSTEM_TEST_MAX_CLKS = 32'h00001388   , 
parameter C_ATG_SYSTEM_MAX_CHANNELS  = 32'h1          ,
parameter C_ATG_SYSTEM_CH1_LOW       = 32'h0000_0000  ,
parameter C_ATG_SYSTEM_CH1_HIGH      = 32'hFFFF_FFFF  ,
parameter C_ATG_SYSTEM_CH2_LOW       = 32'h0000_0100  ,
parameter C_ATG_SYSTEM_CH2_HIGH      = 32'h0000_01FF  ,
parameter C_ATG_SYSTEM_CH3_LOW       = 32'h0000_0200  ,
parameter C_ATG_SYSTEM_CH3_HIGH      = 32'h0000_02FF  ,
parameter C_ATG_SYSTEM_CH4_LOW       = 32'h0000_0300  ,
parameter C_ATG_SYSTEM_CH4_HIGH      = 32'h0000_03FF  ,
parameter C_ATG_SYSTEM_CH5_LOW       = 32'h0000_0400  ,
parameter C_ATG_SYSTEM_CH5_HIGH      = 32'h0000_04FF  ,
parameter C_RAMINIT_CMDRAM0_F        = "default_cmdram.mif" , 
parameter C_RAMINIT_CMDRAM1_F        = "NONE"         , 
parameter C_RAMINIT_CMDRAM2_F        = "NONE"         , 
parameter C_RAMINIT_CMDRAM3_F        = "NONE"         , 
parameter C_RAMINIT_SRAM0_F          = "default_mstram.mif" , 
parameter C_RAMINIT_PARAMRAM0_F      = "default_prmram.mif" ,
parameter C_RAMINIT_ADDRRAM0_F       = "default_addrram.mif" ,
parameter C_REPEAT_COUNT             = 254 ,
parameter C_STRM_DATA_SEED           = 16'hABCD, 
parameter C_AXI_WR_ADDR_SEED         = 16'h7C9B, 
parameter C_AXI_RD_ADDR_SEED         = 16'h5A5A 

) (
 input                                 s_axi_aclk             ,
 input                                 s_axi_aresetn          ,

 input                                 core_ext_start         ,
 input                                 core_ext_stop          ,

 input  [C_S_AXI_ID_WIDTH-1:0]         s_axi_awid             ,
 input  [31:0]                         s_axi_awaddr           ,
 input  [7:0]                          s_axi_awlen            ,
 input  [2:0]                          s_axi_awsize           ,
 input  [1:0]                          s_axi_awburst          ,
 input  [0:0]                          s_axi_awlock           ,
 input  [3:0]                          s_axi_awcache          ,
 input  [2:0]                          s_axi_awprot           ,
 input  [3:0]                          s_axi_awqos            ,
 input  [C_S_AXI_AWUSER_WIDTH-1:0]     s_axi_awuser           ,
 input                                 s_axi_awvalid          ,
 output                                s_axi_awready          ,
 input                                 s_axi_wlast            ,
 input  [C_S_AXI_DATA_WIDTH-1:0]       s_axi_wdata            ,
 input  [C_S_AXI_DATA_WIDTH/8-1:0]     s_axi_wstrb            ,
 input                                 s_axi_wvalid           ,
 output                                s_axi_wready           ,
 output [C_S_AXI_ID_WIDTH-1:0]         s_axi_bid              ,
 output [1:0]                          s_axi_bresp            ,
 output                                s_axi_bvalid           ,
 input                                 s_axi_bready           ,

 input  [C_S_AXI_ID_WIDTH-1:0]         s_axi_arid             ,
 input  [31:0]                         s_axi_araddr           ,
 input  [7:0]                          s_axi_arlen            ,
 input  [2:0]                          s_axi_arsize           ,
 input  [1:0]                          s_axi_arburst          ,
 input  [0:0]                          s_axi_arlock           ,
 input  [3:0]                          s_axi_arcache          ,
 input  [2:0]                          s_axi_arprot           ,
 input  [3:0]                          s_axi_arqos            ,
 input  [C_S_AXI_ARUSER_WIDTH-1:0]     s_axi_aruser           ,
 input                                 s_axi_arvalid          ,
 output                                s_axi_arready          ,
 output [C_S_AXI_ID_WIDTH-1:0]         s_axi_rid              ,
 output                                s_axi_rlast            ,
 output [C_S_AXI_DATA_WIDTH-1:0]       s_axi_rdata            ,
 output [1:0]                          s_axi_rresp            ,
 output                                s_axi_rvalid           ,
 input                                 s_axi_rready           ,



 output [C_M_AXI_THREAD_ID_WIDTH-1:0]  m_axi_awid             ,
 output [C_M_AXI_ADDR_WIDTH-1:0]       m_axi_awaddr           ,
 output [7:0]                          m_axi_awlen            ,
 output [2:0]                          m_axi_awsize           ,
 output [1:0]                          m_axi_awburst          ,
 output [0:0]                          m_axi_awlock           ,
 output [3:0]                          m_axi_awcache          ,
 output [2:0]                          m_axi_awprot           ,
 output [3:0]                          m_axi_awqos            ,
 output [C_M_AXI_AWUSER_WIDTH-1:0]     m_axi_awuser           ,
 output                                m_axi_awvalid          ,
 input                                 m_axi_awready          ,
 output                                m_axi_wlast            ,
 output [C_M_AXI_DATA_WIDTH-1:0]       m_axi_wdata            ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]     m_axi_wstrb            ,
 output                                m_axi_wvalid           ,
 input                                 m_axi_wready           ,
 input  [C_M_AXI_THREAD_ID_WIDTH-1:0]  m_axi_bid              ,
 input  [1:0]                          m_axi_bresp            ,
 input                                 m_axi_bvalid           ,
 output                                m_axi_bready           ,

 output [C_M_AXI_THREAD_ID_WIDTH-1:0]  m_axi_arid             ,
 output [C_M_AXI_ADDR_WIDTH-1:0]       m_axi_araddr           ,
 output [7:0]                          m_axi_arlen            ,
 output [2:0]                          m_axi_arsize           ,
 output [1:0]                          m_axi_arburst          ,
 output [0:0]                          m_axi_arlock           ,
 output [3:0]                          m_axi_arcache          ,
 output [2:0]                          m_axi_arprot           ,
 output [3:0]                          m_axi_arqos            ,
 output [C_M_AXI_ARUSER_WIDTH-1:0]     m_axi_aruser           ,
 output                                m_axi_arvalid          ,
 input                                 m_axi_arready          ,
 input  [C_M_AXI_THREAD_ID_WIDTH-1:0]  m_axi_rid              ,
 input                                 m_axi_rlast            ,
 input  [C_M_AXI_DATA_WIDTH-1:0]       m_axi_rdata            ,
 input  [1:0]                          m_axi_rresp            ,
 input                                 m_axi_rvalid           ,
 output                                m_axi_rready           ,
 //streaming interface:
 
 input                                 m_axis_1_tready        ,
 output                                m_axis_1_tvalid        ,
 output                                m_axis_1_tlast         ,
 output [C_AXIS_TDATA_WIDTH-1:0]       m_axis_1_tdata         ,
 output [(C_AXIS_TDATA_WIDTH/8)-1:0]   m_axis_1_tstrb         ,
 output [(C_AXIS_TDATA_WIDTH/8)-1:0]   m_axis_1_tkeep         ,
 output [C_AXIS_TUSER_WIDTH-1:0]       m_axis_1_tuser         ,
 output [C_AXIS_TID_WIDTH-1:0]         m_axis_1_tid           ,
 output [C_AXIS_TDEST_WIDTH-1:0]       m_axis_1_tdest         ,
 output                                s_axis_1_tready        ,
 input                                 s_axis_1_tvalid        ,
 input                                 s_axis_1_tlast         ,
 input  [C_AXIS_TDATA_WIDTH-1:0]       s_axis_1_tdata         ,
 input  [(C_AXIS_TDATA_WIDTH/8)-1:0]   s_axis_1_tstrb         ,
 input  [(C_AXIS_TDATA_WIDTH/8)-1:0]   s_axis_1_tkeep         ,
 input  [C_AXIS_TUSER_WIDTH-1:0]       s_axis_1_tuser         ,
 input  [C_AXIS_TID_WIDTH-1:0]         s_axis_1_tid           ,
 input  [C_AXIS_TDEST_WIDTH-1:0]       s_axis_1_tdest         ,
 output [15:0]                         axis_err_count         ,
 
 output                                s_axis_2_tready        ,
 input                                 s_axis_2_tvalid        ,
 input                                 s_axis_2_tlast         ,
 input  [C_AXIS_TDATA_WIDTH-1:0]       s_axis_2_tdata         ,
 input  [(C_AXIS_TDATA_WIDTH/8)-1:0]   s_axis_2_tstrb         ,
 input  [(C_AXIS_TDATA_WIDTH/8)-1:0]   s_axis_2_tkeep         ,
 input  [C_AXIS_TUSER_WIDTH-1:0]       s_axis_2_tuser         ,
 input  [C_AXIS_TID_WIDTH-1:0]         s_axis_2_tid           ,
 input  [C_AXIS_TDEST_WIDTH-1:0]       s_axis_2_tdest         ,
 
 input                                 m_axis_2_tready        ,
 output                                m_axis_2_tvalid        ,
 output                                m_axis_2_tlast         ,
 output [C_AXIS_TDATA_WIDTH-1:0]       m_axis_2_tdata         ,
 output [(C_AXIS_TDATA_WIDTH/8)-1:0]   m_axis_2_tstrb         ,
 output [(C_AXIS_TDATA_WIDTH/8)-1:0]   m_axis_2_tkeep         ,
 output [C_AXIS_TUSER_WIDTH-1:0]       m_axis_2_tuser         ,
 output [C_AXIS_TID_WIDTH-1:0]         m_axis_2_tid           ,
 output [C_AXIS_TDEST_WIDTH-1:0]       m_axis_2_tdest         ,
 
 //streaming interface:
 output                                irq_out                ,
 output                                err_out                ,

 //lite interface for system init mode
 output [31:0]                         m_axi_lite_ch1_awaddr      ,
 output [2:0]                          m_axi_lite_ch1_awprot      ,
 output                                m_axi_lite_ch1_awvalid     ,
 input                                 m_axi_lite_ch1_awready     ,
 output [C_M_AXI_DATA_WIDTH-1:0]       m_axi_lite_ch1_wdata       ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]     m_axi_lite_ch1_wstrb       ,
 output                                m_axi_lite_ch1_wvalid      ,
 input                                 m_axi_lite_ch1_wready      ,
 input  [1:0]                          m_axi_lite_ch1_bresp       ,
 input                                 m_axi_lite_ch1_bvalid      ,
 output                                m_axi_lite_ch1_bready      ,
 output [31:0]                         m_axi_lite_ch1_araddr      ,
 output                                m_axi_lite_ch1_arvalid     ,
 input                                 m_axi_lite_ch1_arready     ,
 input [C_M_AXI_DATA_WIDTH-1:0]        m_axi_lite_ch1_rdata       ,
 input                                 m_axi_lite_ch1_rvalid      ,
 input [1:0]                           m_axi_lite_ch1_rresp       ,
 output                                m_axi_lite_ch1_rready      ,
 output [31:0]                         m_axi_lite_ch2_awaddr      ,
 output [2:0]                          m_axi_lite_ch2_awprot      ,
 output                                m_axi_lite_ch2_awvalid     ,
 input                                 m_axi_lite_ch2_awready     ,
 output [C_M_AXI_DATA_WIDTH-1:0]       m_axi_lite_ch2_wdata       ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]     m_axi_lite_ch2_wstrb       ,
 output                                m_axi_lite_ch2_wvalid      ,
 input                                 m_axi_lite_ch2_wready      ,
 input  [1:0]                          m_axi_lite_ch2_bresp       ,
 input                                 m_axi_lite_ch2_bvalid      ,
 output                                m_axi_lite_ch2_bready      ,
 output [31:0]                         m_axi_lite_ch2_araddr      ,
 output                                m_axi_lite_ch2_arvalid     ,
 input                                 m_axi_lite_ch2_arready     ,
 input [C_M_AXI_DATA_WIDTH-1:0]        m_axi_lite_ch2_rdata       ,
 input                                 m_axi_lite_ch2_rvalid      ,
 input [1:0]                           m_axi_lite_ch2_rresp       ,
 output                                m_axi_lite_ch2_rready      ,
 output [31:0]                         m_axi_lite_ch3_awaddr      ,
 output [2:0]                          m_axi_lite_ch3_awprot      ,
 output                                m_axi_lite_ch3_awvalid     ,
 input                                 m_axi_lite_ch3_awready     ,
 output [C_M_AXI_DATA_WIDTH-1:0]       m_axi_lite_ch3_wdata       ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]     m_axi_lite_ch3_wstrb       ,
 output                                m_axi_lite_ch3_wvalid      ,
 input                                 m_axi_lite_ch3_wready      ,
 input  [1:0]                          m_axi_lite_ch3_bresp       ,
 input                                 m_axi_lite_ch3_bvalid      ,
 output                                m_axi_lite_ch3_bready      ,
 output [31:0]                         m_axi_lite_ch3_araddr      ,
 output                                m_axi_lite_ch3_arvalid     ,
 input                                 m_axi_lite_ch3_arready     ,
 input [C_M_AXI_DATA_WIDTH-1:0]        m_axi_lite_ch3_rdata       ,
 input                                 m_axi_lite_ch3_rvalid      ,
 input [1:0]                           m_axi_lite_ch3_rresp       ,
 output                                m_axi_lite_ch3_rready      ,
 output [31:0]                         m_axi_lite_ch4_awaddr      ,
 output [2:0]                          m_axi_lite_ch4_awprot      ,
 output                                m_axi_lite_ch4_awvalid     ,
 input                                 m_axi_lite_ch4_awready     ,
 output [C_M_AXI_DATA_WIDTH-1:0]       m_axi_lite_ch4_wdata       ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]     m_axi_lite_ch4_wstrb       ,
 output                                m_axi_lite_ch4_wvalid      ,
 input                                 m_axi_lite_ch4_wready      ,
 input  [1:0]                          m_axi_lite_ch4_bresp       ,
 input                                 m_axi_lite_ch4_bvalid      ,
 output                                m_axi_lite_ch4_bready      ,
 output [31:0]                         m_axi_lite_ch4_araddr      ,
 output                                m_axi_lite_ch4_arvalid     ,
 input                                 m_axi_lite_ch4_arready     ,
 input [C_M_AXI_DATA_WIDTH-1:0]        m_axi_lite_ch4_rdata       ,
 input                                 m_axi_lite_ch4_rvalid      ,
 input [1:0]                           m_axi_lite_ch4_rresp       ,
 output                                m_axi_lite_ch4_rready      ,
 output [31:0]                         m_axi_lite_ch5_awaddr      ,
 output [2:0]                          m_axi_lite_ch5_awprot      ,
 output                                m_axi_lite_ch5_awvalid     ,
 input                                 m_axi_lite_ch5_awready     ,
 output [C_M_AXI_DATA_WIDTH-1:0]       m_axi_lite_ch5_wdata       ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]     m_axi_lite_ch5_wstrb       ,
 output                                m_axi_lite_ch5_wvalid      ,
 input                                 m_axi_lite_ch5_wready      ,
 input  [1:0]                          m_axi_lite_ch5_bresp       ,
 input                                 m_axi_lite_ch5_bvalid      ,
 output                                m_axi_lite_ch5_bready      ,
 output [31:0]                         m_axi_lite_ch5_araddr      ,
 output                                m_axi_lite_ch5_arvalid     ,
 input                                 m_axi_lite_ch5_arready     ,
 input [C_M_AXI_DATA_WIDTH-1:0]        m_axi_lite_ch5_rdata       ,
 input                                 m_axi_lite_ch5_rvalid      ,
 input [1:0]                           m_axi_lite_ch5_rresp       ,
 output                                m_axi_lite_ch5_rready      ,
 output                                done                       ,
 output [31:0]                         status                                      

);

wire ext_start_sync;
wire ext_stop_sync;
wire flop_ze_out;
wire flop_fi_out;
wire st_flop_ze_out;
wire st_flop_fi_out;
wire global_test_en_l;

axi_traffic_gen_v2_0_10_asynch_rst_ff ext_sync_flop_0 (
  .clk   (s_axi_aclk),
  .reset (core_ext_start),
  .data  (1'b0),
  .q     (flop_ze_out)
);

axi_traffic_gen_v2_0_10_asynch_rst_ff ext_sync_flop_1 (
  .clk   (s_axi_aclk),
  .reset (core_ext_start),
  .data  (flop_ze_out),
  .q     (flop_fi_out)
);

cdc_sync #
(
  .C_CDC_TYPE     (1),
  .C_RESET_STATE  (0),
  .C_SINGLE_BIT   (1),
  .C_FLOP_INPUT   (0),
  .C_VECTOR_WIDTH (1),
  .C_MTBF_STAGES  (4)    
) cdc_start_sync (
  .prmry_aclk      (1'b1),
  .prmry_resetn    (1'b1),
  .prmry_in        (flop_fi_out),
  .prmry_ack       (),
  .scndry_out      (ext_start_sync),
  .scndry_aclk     (s_axi_aclk),
  .scndry_resetn   (1'b1),
  .prmry_vect_in   (1'b0),
  .scndry_vect_out ()    
);    

axi_traffic_gen_v2_0_10_asynch_rst_ff ext_st_sync_flop_0 (
  .clk   (s_axi_aclk),
  .reset (core_ext_stop),
  .data  (1'b0),
  .q     (st_flop_ze_out)
);

axi_traffic_gen_v2_0_10_asynch_rst_ff ext_st_sync_flop_1 (
  .clk   (s_axi_aclk),
  .reset (core_ext_stop),
  .data  (st_flop_ze_out),
  .q     (st_flop_fi_out)
);

cdc_sync #
(
  .C_CDC_TYPE     (1),
  .C_RESET_STATE  (0),
  .C_SINGLE_BIT   (1),
  .C_FLOP_INPUT   (0),
  .C_VECTOR_WIDTH (1),
  .C_MTBF_STAGES  (4)    
) cdc_stop_sync (
  .prmry_aclk      (1'b1),
  .prmry_resetn    (1'b1),
  .prmry_in        (st_flop_fi_out),
  .prmry_ack       (),
  .scndry_out      (ext_stop_sync),
  .scndry_aclk     (s_axi_aclk),
  .scndry_resetn   (1'b1),
  .prmry_vect_in   (1'b0),
  .scndry_vect_out ()    
);    

//CR#782248{
//NOTE:Un-comment line#110 if INFER_TYPE=0 is used in axi_traffic_gen_v2_0_10_inferram.v
//defparam ip_tb.duv_container_inst.GEN_FUNCTIONAL.GEN_FUNCTIONAL_BASIC_N_FULL.duv_inst.ATG_MODE_AXI_BASIC_FULL.basic_n_full_top.cmd_blk.Cmdram.cmd_ram0_3.INFER_TYPE = 0;
//defparam ip_tb.duv_container_inst.GEN_FUNCTIONAL.GEN_FUNCTIONAL_BASIC_N_FULL.duv_inst.ATG_MODE_AXI_BASIC_FULL.basic_n_full_top.sharedram_blk.sharedram.ram0.INFER_TYPE = 0;
//defparam ip_tb.duv_container_inst.GEN_FUNCTIONAL.GEN_FUNCTIONAL_BASIC_N_FULL.duv_inst.ATG_MODE_AXI_BASIC_FULL.basic_n_full_top.ATG_PARARAM_INST_YES.paramram_blk.PARAMRAM_ON.paramram.ram0.INFER_TYPE = 0;
//CR#782248}

  /* hierarchy structure
  static 
   |_ 
  basic_n_full 
   |_ 
  init
   |_ 
  slave only
   |_ 
  */
generate if(C_ATG_STATIC == 1) begin : ATG_MODE_STATIC
// -- Static mode --
axi_traffic_gen_v2_0_10_static_top #
(
  .C_S_AXI_DATA_WIDTH     (C_S_AXI_DATA_WIDTH     ),
  .C_S_AXI_ID_WIDTH       (C_S_AXI_ID_WIDTH       ),
  .C_M_AXI_THREAD_ID_WIDTH(C_M_AXI_THREAD_ID_WIDTH),
  .C_M_AXI_AWUSER_WIDTH   (C_M_AXI_AWUSER_WIDTH   ),
  .C_M_AXI_ARUSER_WIDTH   (C_M_AXI_ARUSER_WIDTH   ),
  .C_M_AXI_DATA_WIDTH     (C_M_AXI_DATA_WIDTH     ),
  .C_M_AXI_ADDR_WIDTH     (C_M_AXI_ADDR_WIDTH     ),
  .C_ATG_STATIC_WR_ADDRESS(C_ATG_STATIC_WR_ADDRESS),
  .C_ATG_STATIC_RD_ADDRESS(C_ATG_STATIC_RD_ADDRESS),
  .C_ATG_STATIC_WR_HIGH_ADDRESS(C_ATG_STATIC_WR_HIGH_ADDRESS),
  .C_ATG_STATIC_RD_HIGH_ADDRESS(C_ATG_STATIC_RD_HIGH_ADDRESS),
  .C_ATG_STATIC_INCR      (C_ATG_STATIC_INCR      ),
  .C_ATG_STATIC_EN_READ   (C_ATG_STATIC_EN_READ   ),
  .C_ATG_STATIC_EN_WRITE  (C_ATG_STATIC_EN_WRITE  ),
  .C_ATG_STATIC_FREE_RUN  (C_ATG_STATIC_FREE_RUN  ),
  .C_ATG_STATIC_TRANGAP   (C_ATG_STATIC_TRANGAP   ),
  .C_ATG_STATIC_RD_PIPELINE(C_ATG_STATIC_RD_PIPELINE   ),
  .C_ATG_STATIC_WR_PIPELINE(C_ATG_STATIC_WR_PIPELINE   ),
  .C_ATG_HLTP_MODE         (C_ATG_HLTP_MODE            ),
  .C_ATG_STATIC_LENGTH    (C_ATG_STATIC_LENGTH    ) 
) static_top (
  .Clk      (s_axi_aclk       ),
  .rst_l    (s_axi_aresetn    ),
  .core_global_start   (ext_start_sync   ),
  .core_global_stop    (ext_stop_sync    ),
  .awid_s   (s_axi_awid       ),
  .awaddr_s (s_axi_awaddr     ),
  .awvalid_s(s_axi_awvalid    ),
  .awready_s(s_axi_awready    ),
  .wlast_s  (s_axi_wlast      ),
  .wdata_s  (s_axi_wdata      ),
  .wstrb_s  (s_axi_wstrb      ),
  .wvalid_s (s_axi_wvalid     ),
  .wready_s (s_axi_wready     ),
  .bid_s    (s_axi_bid        ),
  .bresp_s  (s_axi_bresp      ),
  .bvalid_s (s_axi_bvalid     ),
  .bready_s (s_axi_bready     ),
  .arid_s   (s_axi_arid       ),
  .araddr_s (s_axi_araddr     ),
  .arvalid_s(s_axi_arvalid    ),
  .arready_s(s_axi_arready    ),
  .rid_s    (s_axi_rid        ),
  .rlast_s  (s_axi_rlast      ),
  .rdata_s  (s_axi_rdata      ),
  .rresp_s  (s_axi_rresp      ),
  .rvalid_s (s_axi_rvalid     ),
  .rready_s (s_axi_rready     ),
  .awid_m   (m_axi_awid       ),
  .awaddr_m (m_axi_awaddr     ),
  .awlen_m  (m_axi_awlen      ),
  .awsize_m (m_axi_awsize     ),
  .awburst_m(m_axi_awburst    ),
  .awlock_m (m_axi_awlock     ),
  .awcache_m(m_axi_awcache    ),
  .awprot_m (m_axi_awprot     ),
  .awqos_m  (m_axi_awqos      ),
  .awuser_m (m_axi_awuser     ),
  .awvalid_m(m_axi_awvalid    ),
  .awready_m(m_axi_awready    ),
  .wlast_m  (m_axi_wlast      ),
  .wdata_m  (m_axi_wdata      ),
  .wstrb_m  (m_axi_wstrb      ),
  .wvalid_m (m_axi_wvalid     ),
  .wready_m (m_axi_wready     ),
  .bid_m    (m_axi_bid        ),
  .bresp_m  (m_axi_bresp      ),
  .bvalid_m (m_axi_bvalid     ),
  .bready_m (m_axi_bready     ),
  .arid_m   (m_axi_arid       ),
  .araddr_m (m_axi_araddr     ),
  .arlen_m  (m_axi_arlen      ),
  .arsize_m (m_axi_arsize     ),
  .arburst_m(m_axi_arburst    ),
  .arlock_m (m_axi_arlock     ),
  .arcache_m(m_axi_arcache    ),
  .arprot_m (m_axi_arprot     ),
  .arqos_m  (m_axi_arqos      ),
  .aruser_m (m_axi_aruser     ),
  .arvalid_m(m_axi_arvalid    ),
  .arready_m(m_axi_arready    ),
  .rid_m    (m_axi_rid        ),
  .rlast_m  (m_axi_rlast      ),
  .rdata_m  (m_axi_rdata      ),
  .rresp_m  (m_axi_rresp      ),
  .rvalid_m (m_axi_rvalid     ),
  .rready_m (m_axi_rready     ) 
);

end
endgenerate //ATG_MODE_STATIC
// -- Static mode --
// -- slave only mode --
generate if(C_ATG_SLAVE_ONLY     == 1 ) begin : ATG_MODE_SLAVEONLY
axi_traffic_gen_v2_0_10_slave_only_top
#(
  .C_FAMILY               (C_FAMILY               ),
  .C_BASEADDR             (C_BASEADDR             ),
  .C_HIGHADDR             (C_HIGHADDR             ),
  .C_ZERO_INVALID         (C_ZERO_INVALID         ),
  .C_NO_EXCL              (C_NO_EXCL              ),
  .C_S_AXI_DATA_WIDTH     (C_S_AXI_DATA_WIDTH     ),
  .C_S_AXI_AWUSER_WIDTH   (C_S_AXI_AWUSER_WIDTH   ),
  .C_S_AXI_ARUSER_WIDTH   (C_S_AXI_ARUSER_WIDTH   ),
  .C_S_AXI_ID_WIDTH       (C_S_AXI_ID_WIDTH       ),
  .C_M_AXI_THREAD_ID_WIDTH(C_M_AXI_THREAD_ID_WIDTH),
  .C_M_AXI_DATA_WIDTH     (C_M_AXI_DATA_WIDTH     ),
  .C_M_AXI_AWUSER_WIDTH   (C_M_AXI_AWUSER_WIDTH   ),
  .C_M_AXI_ARUSER_WIDTH   (C_M_AXI_ARUSER_WIDTH   ),
  .C_ATG_AXI4LITE         (0                      ),
  .C_ATG_BASIC_AXI4       (1                      ), //force BASIC_AXI4 in slaveonly. Less resources
  .C_RAMINIT_CMDRAM0_F    (C_RAMINIT_CMDRAM0_F    ),
  .C_RAMINIT_CMDRAM1_F    (C_RAMINIT_CMDRAM1_F    ),
  .C_RAMINIT_CMDRAM2_F    (C_RAMINIT_CMDRAM2_F    ),
  .C_RAMINIT_CMDRAM3_F    (C_RAMINIT_CMDRAM3_F    ),
  .C_RAMINIT_SRAM0_F      (C_RAMINIT_SRAM0_F      ),
  .C_RAMINIT_ADDRRAM0_F   (C_RAMINIT_ADDRRAM0_F   ),
  .C_RAMINIT_PARAMRAM0_F  (C_RAMINIT_PARAMRAM0_F  ) 
) slave_only_top (
   .s_axi_aclk      (s_axi_aclk          ),
   .s_axi_aresetn   (s_axi_aresetn       ),
   .awid_s          (s_axi_awid          ),
   .awaddr_s        (s_axi_awaddr        ),
   .awlen_s         (s_axi_awlen         ),
   .awsize_s        (s_axi_awsize        ),
   .awburst_s       (s_axi_awburst       ),
   .awlock_s        (s_axi_awlock        ),
   .awcache_s       (s_axi_awcache       ),
   .awprot_s        (s_axi_awprot        ),
   .awqos_s         (s_axi_awqos         ),
   .awuser_s        (s_axi_awuser        ),
   .awvalid_s       (s_axi_awvalid       ),
   .awready_s       (s_axi_awready       ),
   .wlast_s         (s_axi_wlast         ),
   .wdata_s         (s_axi_wdata         ),
   .wstrb_s         (s_axi_wstrb         ),
   .wvalid_s        (s_axi_wvalid        ),
   .wready_s        (s_axi_wready        ),
   .bid_s           (s_axi_bid           ),
   .bresp_s         (s_axi_bresp         ),
   .bvalid_s        (s_axi_bvalid        ),
   .bready_s        (s_axi_bready        ),
   .arid_s          (s_axi_arid          ),
   .araddr_s        (s_axi_araddr        ),
   .arlen_s         (s_axi_arlen         ),
   .arsize_s        (s_axi_arsize        ),
   .arburst_s       (s_axi_arburst       ),
   .arlock_s        (s_axi_arlock        ),
   .arcache_s       (s_axi_arcache       ),
   .arprot_s        (s_axi_arprot        ),
   .arqos_s         (s_axi_arqos         ),
   .aruser_s        (s_axi_aruser        ),
   .arvalid_s       (s_axi_arvalid       ),
   .arready_s       (s_axi_arready       ),
   .rid_s           (s_axi_rid           ),
   .rlast_s         (s_axi_rlast         ),
   .rdata_s         (s_axi_rdata         ),
   .rresp_s         (s_axi_rresp         ),
   .rvalid_s        (s_axi_rvalid        ),
   .rready_s        (s_axi_rready        ),
   .global_test_en_l(global_test_en_l    ) 
);
end
endgenerate
// -- slave only mode --
// -- streaming mode --
generate if(C_ATG_STREAMING == 1 ) begin: ATG_MODE_STREAMING
axi_traffic_gen_v2_0_10_streaming_top
#(
  .C_FAMILY                (C_FAMILY                ),
  .C_S_AXI_ID_WIDTH        (C_S_AXI_ID_WIDTH        ),
  .C_S_AXI_DATA_WIDTH      (C_S_AXI_DATA_WIDTH      ),
  .C_AXIS1_HAS_TKEEP      (C_AXIS1_HAS_TKEEP      ),
  .C_AXIS1_HAS_TSTRB      (C_AXIS1_HAS_TSTRB      ),
  .C_AXIS2_HAS_TKEEP      (C_AXIS2_HAS_TKEEP      ),
  .C_AXIS2_HAS_TSTRB      (C_AXIS2_HAS_TSTRB      ),
  .C_AXIS_TDATA_WIDTH      (C_AXIS_TDATA_WIDTH      ),
  .C_AXIS_TUSER_WIDTH      (C_AXIS_TUSER_WIDTH      ),
  .C_AXIS_TID_WIDTH        (C_AXIS_TID_WIDTH        ),
  .C_AXIS_TDEST_WIDTH      (C_AXIS_TDEST_WIDTH      ),
  .ZERO_INVALID            (1'b0                    ),
  .C_ATG_STREAMING_MST_ONLY(C_ATG_STREAMING_MST_ONLY),
  .C_ATG_STREAMING_MST_LPBK(C_ATG_STREAMING_MST_LPBK),
  .C_ATG_STREAMING_SLV_LPBK(C_ATG_STREAMING_SLV_LPBK),
  .C_ATG_STREAMING_MAX_LEN_BITS(C_ATG_STREAMING_MAX_LEN_BITS),
  .C_FIRST_AXIS            (0                       ),
  .C_AXIS_SPARSE_EN        (C_AXIS_SPARSE_EN        ),
  .C_STRM_DATA_SEED        (C_STRM_DATA_SEED        ),
  .C_BASEADDR              (C_BASEADDR              ),
  .C_HIGHADDR              (C_HIGHADDR              ) 
) streaming_top (
.Clk             (s_axi_aclk           ),
.Rst_n           (s_axi_aresetn        ),
.core_global_start(ext_start_sync      ),
.core_global_stop (ext_stop_sync       ),
.awid_s          (s_axi_awid           ),
.awaddr_s        (s_axi_awaddr         ),
.awvalid_s       (s_axi_awvalid        ),
.awready_s       (s_axi_awready        ),
.wlast_s         (s_axi_wlast          ),
.wdata_s         (s_axi_wdata          ),
.wstrb_s         (s_axi_wstrb          ),
.wvalid_s        (s_axi_wvalid         ),
.wready_s        (s_axi_wready         ),
.bid_s           (s_axi_bid            ),
.bresp_s         (s_axi_bresp          ),
.bvalid_s        (s_axi_bvalid         ),
.bready_s        (s_axi_bready         ),
.arid_s          (s_axi_arid           ),
.araddr_s        (s_axi_araddr         ),
.arvalid_s       (s_axi_arvalid        ),
.arready_s       (s_axi_arready        ),
.rid_s           (s_axi_rid            ),
.rlast_s         (s_axi_rlast          ),
.rdata_s         (s_axi_rdata          ),
.rresp_s         (s_axi_rresp          ),
.rvalid_s        (s_axi_rvalid         ),
.rready_s        (s_axi_rready         ),
.axis1_out_tready(m_axis_1_tready      ),
.axis1_out_tvalid(m_axis_1_tvalid      ),
.axis1_out_tlast (m_axis_1_tlast       ),
.axis1_out_tdata (m_axis_1_tdata       ),
.axis1_out_tstrb (m_axis_1_tstrb       ),
.axis1_out_tkeep (m_axis_1_tkeep       ),
.axis1_out_tuser (m_axis_1_tuser       ),
.axis1_out_tid   (m_axis_1_tid         ),
.axis1_out_tdest (m_axis_1_tdest       ),
.axis1_in_tready (s_axis_1_tready      ),
.axis1_in_tvalid (s_axis_1_tvalid      ),
.axis1_in_tlast  (s_axis_1_tlast       ),
.axis1_in_tdata  (s_axis_1_tdata       ),
.axis1_in_tstrb  (s_axis_1_tstrb       ),
.axis1_in_tkeep  (s_axis_1_tkeep       ),
.axis1_in_tuser  (s_axis_1_tuser       ),
.axis1_in_tid    (s_axis_1_tid         ),
.axis1_in_tdest  (s_axis_1_tdest       ),
.axis1_err_counter(axis_err_count      ),
.axis2_in_tready (s_axis_2_tready      ),
.axis2_in_tvalid (s_axis_2_tvalid      ),
.axis2_in_tlast  (s_axis_2_tlast       ),
.axis2_in_tdata  (s_axis_2_tdata       ),
.axis2_in_tstrb  (s_axis_2_tstrb       ),
.axis2_in_tkeep  (s_axis_2_tkeep       ),
.axis2_in_tuser  (s_axis_2_tuser       ),
.axis2_in_tid    (s_axis_2_tid         ),
.axis2_in_tdest  (s_axis_2_tdest       ),
.axis2_out_tready(m_axis_2_tready      ),
.axis2_out_tvalid(m_axis_2_tvalid      ),
.axis2_out_tlast (m_axis_2_tlast       ),
.axis2_out_tdata (m_axis_2_tdata       ),
.axis2_out_tstrb (m_axis_2_tstrb       ),
.axis2_out_tkeep (m_axis_2_tkeep       ),
.axis2_out_tuser (m_axis_2_tuser       ),
.axis2_out_tid   (m_axis_2_tid         ),
.axis2_out_tdest (m_axis_2_tdest       ) 
);
end
endgenerate
// -- systemini mode --
generate if(C_ATG_SYSTEM_INIT == 1 || C_ATG_SYSTEM_TEST == 1 ) begin: ATG_MODE_SYSTEM_INIT_TEST
axi_traffic_gen_v2_0_10_systeminit_top 
#(
.C_FAMILY                  (C_FAMILY                  ) ,
.C_ATG_DATA_MIF            (C_ATG_SYSTEM_INIT_DATA_MIF) ,
.C_ATG_ADDR_MIF            (C_ATG_SYSTEM_INIT_ADDR_MIF) ,
.C_ATG_CTRL_MIF            (C_ATG_SYSTEM_INIT_CTRL_MIF) ,
.C_ATG_MASK_MIF            (C_ATG_SYSTEM_INIT_MASK_MIF) ,
.C_ATG_MIF_DATA_DEPTH      (C_ATG_MIF_DATA_DEPTH      ) ,
.C_ATG_MIF_ADDR_BITS       (C_ATG_MIF_ADDR_BITS       ) ,
.C_ATG_SYSTEM_INIT         (C_ATG_SYSTEM_INIT         ) ,
.C_ATG_SYSTEM_TEST         (C_ATG_SYSTEM_TEST         ) ,
.C_ATG_SYSTEM_CMD_MAX_RETRY(C_ATG_SYSTEM_CMD_MAX_RETRY) ,
.C_ATG_SYSTEM_TEST_MAX_CLKS(C_ATG_SYSTEM_TEST_MAX_CLKS) ,
.C_ATG_SYSTEM_MAX_CHANNELS(C_ATG_SYSTEM_MAX_CHANNELS  ) ,
.C_ATG_SYSTEM_CH1_LOW     (C_ATG_SYSTEM_CH1_LOW       ) ,
.C_ATG_SYSTEM_CH1_HIGH    (C_ATG_SYSTEM_CH1_HIGH      ) ,
.C_ATG_SYSTEM_CH2_LOW     (C_ATG_SYSTEM_CH2_LOW       ) ,
.C_ATG_SYSTEM_CH2_HIGH    (C_ATG_SYSTEM_CH2_HIGH      ) ,
.C_ATG_SYSTEM_CH3_LOW     (C_ATG_SYSTEM_CH3_LOW       ) ,
.C_ATG_SYSTEM_CH3_HIGH    (C_ATG_SYSTEM_CH3_HIGH      ) ,
.C_ATG_SYSTEM_CH4_LOW     (C_ATG_SYSTEM_CH4_LOW       ) ,
.C_ATG_SYSTEM_CH4_HIGH    (C_ATG_SYSTEM_CH4_HIGH      ) ,
.C_ATG_SYSTEM_CH5_LOW     (C_ATG_SYSTEM_CH5_LOW       ) ,
.C_ATG_SYSTEM_CH5_HIGH    (C_ATG_SYSTEM_CH5_HIGH      )  
) systeminit_top (
  .Clk          (s_axi_aclk        ),
  .rst_l        (s_axi_aresetn     ),
  .ch1_awaddr_m (m_axi_lite_ch1_awaddr ),
  .ch1_awvalid_m(m_axi_lite_ch1_awvalid),
  .ch1_awready_m(m_axi_lite_ch1_awready),
  .ch1_awprot_m (m_axi_lite_ch1_awprot ),
  .ch1_wdata_m  (m_axi_lite_ch1_wdata  ),
  .ch1_wstrb_m  (m_axi_lite_ch1_wstrb  ),
  .ch1_wvalid_m (m_axi_lite_ch1_wvalid ),
  .ch1_wready_m (m_axi_lite_ch1_wready ),
  .ch1_bresp_m  (m_axi_lite_ch1_bresp  ),
  .ch1_bvalid_m (m_axi_lite_ch1_bvalid ),
  .ch1_bready_m (m_axi_lite_ch1_bready ), 
  .ch1_araddr_m (m_axi_lite_ch1_araddr ),
  .ch1_arvalid_m(m_axi_lite_ch1_arvalid),
  .ch1_arready_m(m_axi_lite_ch1_arready),
  .ch1_rdata_m  (m_axi_lite_ch1_rdata  ),
  .ch1_rvalid_m (m_axi_lite_ch1_rvalid ),
  .ch1_rresp_m  (m_axi_lite_ch1_rresp  ),
  .ch1_rready_m (m_axi_lite_ch1_rready ),
  .ch2_awaddr_m (m_axi_lite_ch2_awaddr ),
  .ch2_awvalid_m(m_axi_lite_ch2_awvalid),
  .ch2_awready_m(m_axi_lite_ch2_awready),
  .ch2_awprot_m (m_axi_lite_ch2_awprot ),
  .ch2_wdata_m  (m_axi_lite_ch2_wdata  ),
  .ch2_wstrb_m  (m_axi_lite_ch2_wstrb  ),
  .ch2_wvalid_m (m_axi_lite_ch2_wvalid ),
  .ch2_wready_m (m_axi_lite_ch2_wready ),
  .ch2_bresp_m  (m_axi_lite_ch2_bresp  ),
  .ch2_bvalid_m (m_axi_lite_ch2_bvalid ),
  .ch2_bready_m (m_axi_lite_ch2_bready ), 
  .ch2_araddr_m (m_axi_lite_ch2_araddr ),
  .ch2_arvalid_m(m_axi_lite_ch2_arvalid),
  .ch2_arready_m(m_axi_lite_ch2_arready),
  .ch2_rdata_m  (m_axi_lite_ch2_rdata  ),
  .ch2_rvalid_m (m_axi_lite_ch2_rvalid ),
  .ch2_rresp_m  (m_axi_lite_ch2_rresp  ),
  .ch2_rready_m (m_axi_lite_ch2_rready ),
  .ch3_awaddr_m (m_axi_lite_ch3_awaddr ),
  .ch3_awvalid_m(m_axi_lite_ch3_awvalid),
  .ch3_awready_m(m_axi_lite_ch3_awready),
  .ch3_awprot_m (m_axi_lite_ch3_awprot ),
  .ch3_wdata_m  (m_axi_lite_ch3_wdata  ),
  .ch3_wstrb_m  (m_axi_lite_ch3_wstrb  ),
  .ch3_wvalid_m (m_axi_lite_ch3_wvalid ),
  .ch3_wready_m (m_axi_lite_ch3_wready ),
  .ch3_bresp_m  (m_axi_lite_ch3_bresp  ),
  .ch3_bvalid_m (m_axi_lite_ch3_bvalid ),
  .ch3_bready_m (m_axi_lite_ch3_bready ), 
  .ch3_araddr_m (m_axi_lite_ch3_araddr ),
  .ch3_arvalid_m(m_axi_lite_ch3_arvalid),
  .ch3_arready_m(m_axi_lite_ch3_arready),
  .ch3_rdata_m  (m_axi_lite_ch3_rdata  ),
  .ch3_rvalid_m (m_axi_lite_ch3_rvalid ),
  .ch3_rresp_m  (m_axi_lite_ch3_rresp  ),
  .ch3_rready_m (m_axi_lite_ch3_rready ),
  .ch4_awaddr_m (m_axi_lite_ch4_awaddr ),
  .ch4_awvalid_m(m_axi_lite_ch4_awvalid),
  .ch4_awready_m(m_axi_lite_ch4_awready),
  .ch4_awprot_m (m_axi_lite_ch4_awprot ),
  .ch4_wdata_m  (m_axi_lite_ch4_wdata  ),
  .ch4_wstrb_m  (m_axi_lite_ch4_wstrb  ),
  .ch4_wvalid_m (m_axi_lite_ch4_wvalid ),
  .ch4_wready_m (m_axi_lite_ch4_wready ),
  .ch4_bresp_m  (m_axi_lite_ch4_bresp  ),
  .ch4_bvalid_m (m_axi_lite_ch4_bvalid ),
  .ch4_bready_m (m_axi_lite_ch4_bready ), 
  .ch4_araddr_m (m_axi_lite_ch4_araddr ),
  .ch4_arvalid_m(m_axi_lite_ch4_arvalid),
  .ch4_arready_m(m_axi_lite_ch4_arready),
  .ch4_rdata_m  (m_axi_lite_ch4_rdata  ),
  .ch4_rvalid_m (m_axi_lite_ch4_rvalid ),
  .ch4_rresp_m  (m_axi_lite_ch4_rresp  ),
  .ch4_rready_m (m_axi_lite_ch4_rready ),
  .ch5_awaddr_m (m_axi_lite_ch5_awaddr ),
  .ch5_awvalid_m(m_axi_lite_ch5_awvalid),
  .ch5_awready_m(m_axi_lite_ch5_awready),
  .ch5_awprot_m (m_axi_lite_ch5_awprot ),
  .ch5_wdata_m  (m_axi_lite_ch5_wdata  ),
  .ch5_wstrb_m  (m_axi_lite_ch5_wstrb  ),
  .ch5_wvalid_m (m_axi_lite_ch5_wvalid ),
  .ch5_wready_m (m_axi_lite_ch5_wready ),
  .ch5_bresp_m  (m_axi_lite_ch5_bresp  ),
  .ch5_bvalid_m (m_axi_lite_ch5_bvalid ),
  .ch5_bready_m (m_axi_lite_ch5_bready ), 
  .ch5_araddr_m (m_axi_lite_ch5_araddr ),
  .ch5_arvalid_m(m_axi_lite_ch5_arvalid),
  .ch5_arready_m(m_axi_lite_ch5_arready),
  .ch5_rdata_m  (m_axi_lite_ch5_rdata  ),
  .ch5_rvalid_m (m_axi_lite_ch5_rvalid ),
  .ch5_rresp_m  (m_axi_lite_ch5_rresp  ),
  .ch5_rready_m (m_axi_lite_ch5_rready ),
  .irq_out      (irq_out           ), 
  .done         (done              ), 
  .status       (status            ) 
);
end
endgenerate
// -- basic and full mode --
generate if(C_ATG_STATIC     == 0 &&
            C_ATG_SYSTEM_INIT== 0 &&
            C_ATG_SYSTEM_TEST== 0 &&
            C_ATG_STREAMING  == 0 &&
            C_ATG_SLAVE_ONLY == 0 ) begin : ATG_MODE_AXI_BASIC_FULL

axi_traffic_gen_v2_0_10_basic_n_full_top
#(
.C_FAMILY                (C_FAMILY                ),
.C_BASEADDR              (C_BASEADDR              ),
.C_HIGHADDR              (C_HIGHADDR              ),
.C_ZERO_INVALID          (C_ZERO_INVALID          ),
.C_IS_AXI4               (0                       ),
.C_IS_COHERENT           (0                       ),
.C_IS_AFI                (0                       ),
.C_NO_EXCL               (C_NO_EXCL               ),
.C_S_AXI_DATA_WIDTH      (C_S_AXI_DATA_WIDTH      ),
.C_S_AXI_AWUSER_WIDTH    (C_S_AXI_AWUSER_WIDTH    ),
.C_S_AXI_ARUSER_WIDTH    (C_S_AXI_ARUSER_WIDTH    ),
.C_S_AXI_ID_WIDTH        (C_S_AXI_ID_WIDTH        ),
.C_M_AXI_THREAD_ID_WIDTH (C_M_AXI_THREAD_ID_WIDTH ),
.C_M_AXI_DATA_WIDTH      (C_M_AXI_DATA_WIDTH      ),
.C_M_AXI_AWUSER_WIDTH    (C_M_AXI_AWUSER_WIDTH    ),
.C_M_AXI_ARUSER_WIDTH    (C_M_AXI_ARUSER_WIDTH    ),
.C_ATG_AXI4LITE          (0                       ),
.C_ATG_BASIC_AXI4        (C_ATG_BASIC_AXI4        ),
.C_ATG_REPEAT_TYPE       (C_ATG_REPEAT_TYPE       ),
.C_ATG_HLTP_MODE         (C_ATG_HLTP_MODE         ),
.C_ATG_STATIC            (C_ATG_STATIC            ),
.C_ATG_SLAVE_ONLY        (C_ATG_SLAVE_ONLY        ),
.C_ATG_SYSTEM_INIT       (C_ATG_SYSTEM_INIT       ), 
.C_ATG_STREAMING         (C_ATG_STREAMING         ), 
.C_RAMINIT_CMDRAM0_F     (C_RAMINIT_CMDRAM0_F     ),
.C_RAMINIT_CMDRAM1_F     (C_RAMINIT_CMDRAM1_F     ),
.C_RAMINIT_CMDRAM2_F     (C_RAMINIT_CMDRAM2_F     ),
.C_RAMINIT_CMDRAM3_F     (C_RAMINIT_CMDRAM3_F     ),
.C_RAMINIT_SRAM0_F       (C_RAMINIT_SRAM0_F       ),
.C_RAMINIT_ADDRRAM0_F    (C_RAMINIT_ADDRRAM0_F    ),
.C_RAMINIT_PARAMRAM0_F   (C_RAMINIT_PARAMRAM0_F   ), 
.C_M_AXI_ADDR_WIDTH      (C_M_AXI_ADDR_WIDTH      ),
.C_REPEAT_COUNT          (C_REPEAT_COUNT          ),
.C_AXI_WR_ADDR_SEED      (C_AXI_WR_ADDR_SEED      ),
.C_AXI_RD_ADDR_SEED      (C_AXI_RD_ADDR_SEED      )
) basic_n_full_top (
.s_axi_aclk      (s_axi_aclk          ),
.s_axi_aresetn   (s_axi_aresetn       ),
.core_global_start (ext_start_sync    ),
.core_global_stop  (ext_stop_sync     ),
.awid_s          (s_axi_awid          ),
.awaddr_s        (s_axi_awaddr        ),
.awlen_s         (s_axi_awlen         ),
.awsize_s        (s_axi_awsize        ),
.awburst_s       (s_axi_awburst       ),
.awlock_s        (s_axi_awlock        ),
.awcache_s       (s_axi_awcache       ),
.awprot_s        (s_axi_awprot        ),
.awqos_s         (s_axi_awqos         ),
.awuser_s        (s_axi_awuser        ),
.awvalid_s       (s_axi_awvalid       ),
.awready_s       (s_axi_awready       ),
.wlast_s         (s_axi_wlast         ),
.wdata_s         (s_axi_wdata         ),
.wstrb_s         (s_axi_wstrb         ),
.wvalid_s        (s_axi_wvalid        ),
.wready_s        (s_axi_wready        ),
.bid_s           (s_axi_bid           ),
.bresp_s         (s_axi_bresp         ),
.bvalid_s        (s_axi_bvalid        ),
.bready_s        (s_axi_bready        ),
.arid_s          (s_axi_arid          ),
.araddr_s        (s_axi_araddr        ),
.arlen_s         (s_axi_arlen         ),
.arsize_s        (s_axi_arsize        ),
.arburst_s       (s_axi_arburst       ),
.arlock_s        (s_axi_arlock        ),
.arcache_s       (s_axi_arcache       ),
.arprot_s        (s_axi_arprot        ),
.arqos_s         (s_axi_arqos         ),
.aruser_s        (s_axi_aruser        ),
.arvalid_s       (s_axi_arvalid       ),
.arready_s       (s_axi_arready       ),
.rid_s           (s_axi_rid           ),
.rlast_s         (s_axi_rlast         ),
.rdata_s         (s_axi_rdata         ),
.rresp_s         (s_axi_rresp         ),
.rvalid_s        (s_axi_rvalid        ),
.rready_s        (s_axi_rready        ),
.awid_m          (m_axi_awid          ),
.awaddr_m        (m_axi_awaddr        ),
.awlen_m         (m_axi_awlen         ),
.awsize_m        (m_axi_awsize        ),
.awburst_m       (m_axi_awburst       ),
.awlock_m        (m_axi_awlock        ),
.awcache_m       (m_axi_awcache       ),
.awprot_m        (m_axi_awprot        ),
.awqos_m         (m_axi_awqos         ),
.awuser_m        (m_axi_awuser        ),
.awvalid_m       (m_axi_awvalid       ),
.awready_m       (m_axi_awready       ),
.wlast_m         (m_axi_wlast         ),
.wdata_m         (m_axi_wdata         ),
.wstrb_m         (m_axi_wstrb         ),
.wvalid_m        (m_axi_wvalid        ),
.wready_m        (m_axi_wready        ),
.bid_m           (m_axi_bid           ),
.bresp_m         (m_axi_bresp         ),
.bvalid_m        (m_axi_bvalid        ),
.bready_m        (m_axi_bready        ),
.arid_m          (m_axi_arid          ),
.araddr_m        (m_axi_araddr        ),
.arlen_m         (m_axi_arlen         ),
.arsize_m        (m_axi_arsize        ),
.arburst_m       (m_axi_arburst       ),
.arlock_m        (m_axi_arlock        ),
.arcache_m       (m_axi_arcache       ),
.arprot_m        (m_axi_arprot        ),
.arqos_m         (m_axi_arqos         ),
.aruser_m        (m_axi_aruser        ),
.arvalid_m       (m_axi_arvalid       ),
.arready_m       (m_axi_arready       ),
.rid_m           (m_axi_rid           ),
.rlast_m         (m_axi_rlast         ),
.rdata_m         (m_axi_rdata         ),
.rresp_m         (m_axi_rresp         ),
.rvalid_m        (m_axi_rvalid        ),
.rready_m        (m_axi_rready        ),
.irq_out         (irq_out             ),
.err_out         (err_out             ),
.dbg_out         (                    ),
.dbg_out_ext     (                    ),
.global_test_en_l(1'b0                ) 
);

end
endgenerate
// -- basic and full mode --
endmodule





