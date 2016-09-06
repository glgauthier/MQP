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
// Filename:       axi_traffic_gen_v2_0_10_systeminit_top.v
// Version : v1.0
// Description:    static configuration top level module
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_systeminit_top #
(
  parameter C_FAMILY                = "virtex7"        ,
  parameter C_M_AXI_THREAD_ID_WIDTH = 1                ,
  parameter C_M_AXI_AWUSER_WIDTH    = 1                ,
  parameter C_M_AXI_DATA_WIDTH      = 32               , 
  parameter C_ATG_DATA_MIF          = "atg_data.mif"   ,
  parameter C_ATG_ADDR_MIF          = "atg_addr.mif"   ,
  parameter C_ATG_CTRL_MIF          = "atg_ctrl.mif"   ,
  parameter C_ATG_MASK_MIF          = "atg_mask.mif"   ,
  parameter C_ATG_MIF_ADDR_BITS     = 5                ,// 4(16),5(32),6(64),7(128),8(256)
  parameter C_ATG_MIF_DATA_DEPTH    = 32               ,// 4(16),5(32),6(64),7(128),8(256)
  parameter C_ATG_SYSTEM_INIT       = 0                ,
  parameter C_ATG_SYSTEM_TEST       = 0                ,
  parameter C_ATG_SYSTEM_CMD_MAX_RETRY = 32'h1         ,
  parameter C_ATG_SYSTEM_TEST_MAX_CLKS = 32'h0000001A  ,
  parameter C_ATG_SYSTEM_MAX_CHANNELS  = 32'h1         ,
  parameter C_ATG_SYSTEM_CH1_LOW       = 32'h0000_0000 ,
  parameter C_ATG_SYSTEM_CH1_HIGH      = 32'h0000_00FF ,
  parameter C_ATG_SYSTEM_CH2_LOW       = 32'h0000_0100 ,
  parameter C_ATG_SYSTEM_CH2_HIGH      = 32'h0000_01FF ,
  parameter C_ATG_SYSTEM_CH3_LOW       = 32'h0000_0200 ,
  parameter C_ATG_SYSTEM_CH3_HIGH      = 32'h0000_02FF ,
  parameter C_ATG_SYSTEM_CH4_LOW       = 32'h0000_0300 ,
  parameter C_ATG_SYSTEM_CH4_HIGH      = 32'h0000_03FF ,
  parameter C_ATG_SYSTEM_CH5_LOW       = 32'h0000_0400 ,
  parameter C_ATG_SYSTEM_CH5_HIGH      = 32'h0000_04FF  
) (
// system
 input                                Clk            ,
 input                                rst_l          ,
//Master-write-ch1
 output [31:0]                        ch1_awaddr_m       ,
 output                               ch1_awvalid_m      ,
 input                                ch1_awready_m      ,
 output [2:0]                         ch1_awprot_m       ,
 output [C_M_AXI_DATA_WIDTH-1:0]      ch1_wdata_m        ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]    ch1_wstrb_m        ,
 output                               ch1_wvalid_m       ,
 input                                ch1_wready_m       ,
 input [1:0]                          ch1_bresp_m        ,
 input                                ch1_bvalid_m       ,
 output                               ch1_bready_m       ,        
 output [31:0]                        ch1_araddr_m       ,
 output                               ch1_arvalid_m      ,
 input                                ch1_arready_m      ,
 input [C_M_AXI_DATA_WIDTH-1:0]       ch1_rdata_m        ,
 input                                ch1_rvalid_m       ,
 input [1:0]                          ch1_rresp_m        ,
 output                               ch1_rready_m       ,

//Master-write-ch2
 output [31:0]                        ch2_awaddr_m       ,
 output                               ch2_awvalid_m      ,
 input                                ch2_awready_m      ,
 output [2:0]                         ch2_awprot_m       ,
 output [C_M_AXI_DATA_WIDTH-1:0]      ch2_wdata_m        ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]    ch2_wstrb_m        ,
 output                               ch2_wvalid_m       ,
 input                                ch2_wready_m       ,
 input [1:0]                          ch2_bresp_m        ,
 input                                ch2_bvalid_m       ,
 output                               ch2_bready_m       ,        
 output [31:0]                        ch2_araddr_m       ,
 output                               ch2_arvalid_m      ,
 input                                ch2_arready_m      ,
 input [C_M_AXI_DATA_WIDTH-1:0]       ch2_rdata_m        ,
 input                                ch2_rvalid_m       ,
 input [1:0]                          ch2_rresp_m        ,
 output                               ch2_rready_m       ,

//Master-write-ch3
 output [31:0]                        ch3_awaddr_m       ,
 output                               ch3_awvalid_m      ,
 input                                ch3_awready_m      ,
 output [2:0]                         ch3_awprot_m       ,
 output [C_M_AXI_DATA_WIDTH-1:0]      ch3_wdata_m        ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]    ch3_wstrb_m        ,
 output                               ch3_wvalid_m       ,
 input                                ch3_wready_m       ,
 input [1:0]                          ch3_bresp_m        ,
 input                                ch3_bvalid_m       ,
 output                               ch3_bready_m       ,        
 output [31:0]                        ch3_araddr_m       ,
 output                               ch3_arvalid_m      ,
 input                                ch3_arready_m      ,
 input [C_M_AXI_DATA_WIDTH-1:0]       ch3_rdata_m        ,
 input                                ch3_rvalid_m       ,
 input [1:0]                          ch3_rresp_m        ,
 output                               ch3_rready_m       ,

//Master-write-ch4
 output [31:0]                        ch4_awaddr_m       ,
 output                               ch4_awvalid_m      ,
 input                                ch4_awready_m      ,
 output [2:0]                         ch4_awprot_m       ,
 output [C_M_AXI_DATA_WIDTH-1:0]      ch4_wdata_m        ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]    ch4_wstrb_m        ,
 output                               ch4_wvalid_m       ,
 input                                ch4_wready_m       ,
 input [1:0]                          ch4_bresp_m        ,
 input                                ch4_bvalid_m       ,
 output                               ch4_bready_m       ,        
 output [31:0]                        ch4_araddr_m       ,
 output                               ch4_arvalid_m      ,
 input                                ch4_arready_m      ,
 input [C_M_AXI_DATA_WIDTH-1:0]       ch4_rdata_m        ,
 input                                ch4_rvalid_m       ,
 input [1:0]                          ch4_rresp_m        ,
 output                               ch4_rready_m       ,

//Master-write-ch5
 output [31:0]                        ch5_awaddr_m       ,
 output                               ch5_awvalid_m      ,
 input                                ch5_awready_m      ,
 output [2:0]                         ch5_awprot_m       ,
 output [C_M_AXI_DATA_WIDTH-1:0]      ch5_wdata_m        ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]    ch5_wstrb_m        ,
 output                               ch5_wvalid_m       ,
 input                                ch5_wready_m       ,
 input [1:0]                          ch5_bresp_m        ,
 input                                ch5_bvalid_m       ,
 output                               ch5_bready_m       ,        
 output [31:0]                        ch5_araddr_m       ,
 output                               ch5_arvalid_m      ,
 input                                ch5_arready_m      ,
 input [C_M_AXI_DATA_WIDTH-1:0]       ch5_rdata_m        ,
 input                                ch5_rvalid_m       ,
 input [1:0]                          ch5_rresp_m        ,
 output                               ch5_rready_m       ,

 output                               irq_out        ,
 output                               done           ,
 output [31:0]                        status        
);
wire done_i;
wire [31:0] status_i;
wire [31:0]  rom_data                 ;
wire [31:0]  rom_mask                 ;
wire [31:0]  rom_ctrl                 ;
wire [31:0]  rom_addr                 ;
wire  [9:0]  rom_addr_ptr_ff          ;
wire  [9:0]  rom_data_ptr_ff          ;
wire [127:0] cmd_out_mw               ;
wire [C_M_AXI_DATA_WIDTH-1:0] mram_out;  
assign done = done_i;
assign status = status_i;
assign ch1_awprot_m = 3'b000; //Fixed value driven
assign ch2_awprot_m = 3'b000; //Fixed value driven
assign ch3_awprot_m = 3'b000; //Fixed value driven
assign ch4_awprot_m = 3'b000; //Fixed value driven
assign ch5_awprot_m = 3'b000; //Fixed value driven

axi_traffic_gen_v2_0_10_systeminit_dmg #(
 .C_FAMILY (C_FAMILY                       )  ,
 .C_ATG_MIF (C_ATG_ADDR_MIF                )  ,
 .C_ATG_MIF_ADDR_BITS (C_ATG_MIF_ADDR_BITS )  ,
 .C_ATG_MIF_DATA_DEPTH(C_ATG_MIF_DATA_DEPTH)
) systeminit_dmg_addr(
  .a         (rom_addr_ptr_ff[C_ATG_MIF_ADDR_BITS-1:0] ),
  .clk       (Clk                 ),
  .qspo_srst (~rst_l              ),
  .qspo      (rom_addr            ) 
);

axi_traffic_gen_v2_0_10_systeminit_dmg #(
 .C_FAMILY (C_FAMILY                       )  ,
 .C_ATG_MIF (C_ATG_DATA_MIF                )  ,
 .C_ATG_MIF_ADDR_BITS (C_ATG_MIF_ADDR_BITS )  ,
 .C_ATG_MIF_DATA_DEPTH(C_ATG_MIF_DATA_DEPTH)
) systeminit_dmg_data(
  .a         (rom_data_ptr_ff[C_ATG_MIF_ADDR_BITS-1:0]  ),
  .clk       (Clk                 ),
  .qspo_srst (~rst_l              ),
  .qspo      (rom_data            ) 
);

generate if(C_ATG_SYSTEM_TEST ==1 ) begin : ATG_SYSINIT_DMG
axi_traffic_gen_v2_0_10_systeminit_dmg #(
 .C_FAMILY (C_FAMILY                       )  ,
 .C_ATG_MIF (C_ATG_MASK_MIF                )  ,
 .C_ATG_MIF_ADDR_BITS (C_ATG_MIF_ADDR_BITS )  ,
 .C_ATG_MIF_DATA_DEPTH(C_ATG_MIF_DATA_DEPTH)
) systeminit_dmg_mask(
  .a         (rom_addr_ptr_ff[C_ATG_MIF_ADDR_BITS-1:0] ),
  .clk       (Clk                 ),
  .qspo_srst (~rst_l              ),
  .qspo      (rom_mask            ) 
);

axi_traffic_gen_v2_0_10_systeminit_dmg #(
 .C_FAMILY (C_FAMILY                       )  ,
 .C_ATG_MIF (C_ATG_CTRL_MIF                )  ,
 .C_ATG_MIF_ADDR_BITS (C_ATG_MIF_ADDR_BITS )  ,
 .C_ATG_MIF_DATA_DEPTH(C_ATG_MIF_DATA_DEPTH)
) systeminit_dmg_ctrl(
  .a         (rom_addr_ptr_ff[C_ATG_MIF_ADDR_BITS-1:0] ),
  .clk       (Clk                 ),
  .qspo_srst (~rst_l              ),
  .qspo      (rom_ctrl            ) 
);
end
endgenerate

axi_traffic_gen_v2_0_10_static_cmdgen # (
 .C_M_AXI_DATA_WIDTH  (C_M_AXI_DATA_WIDTH  ),
 .C_ATG_SYSTEM_INIT   (C_ATG_SYSTEM_INIT   ),
 .C_ATG_SYSTEM_TEST   (C_ATG_SYSTEM_TEST   ),
 .C_ATG_MIF_ADDR_BITS (C_ATG_MIF_ADDR_BITS )
) systeminit_cmdgen (
 .Clk            (Clk            ),
 .rst_l          (rst_l          ),
 .static_ctl_en  (1'b0           ),
 .static_len     (8'h0           ),
 .rom_addr_ptr_ff(rom_addr_ptr_ff), 
 .rom_addr       (rom_addr       ),
 .rom_data       (32'h0          ),
 .cmd_out_mw     (cmd_out_mw     ), 
 .cmd_data       (               ), 
 .cmd_out_mr     (               ) 
);

               
//generate if(C_ATG_SYSTEM_INIT == 1) begin : ATG_SYSINIT_MWR
//axi_traffic_gen_v2_0_10_systeminit_mw # (
// .C_M_AXI_THREAD_ID_WIDTH(C_M_AXI_THREAD_ID_WIDTH),
// .C_M_AXI_AWUSER_WIDTH   (C_M_AXI_AWUSER_WIDTH   ),
// .C_M_AXI_DATA_WIDTH     (C_M_AXI_DATA_WIDTH     ) 
//) static_mw (
// .Clk              (Clk              ),
// .rst_l            (rst_l            ),
// .awaddr_m         (ch1_awaddr_m     ),
// .awvalid_m        (ch1_awvalid_m    ),
// .awready_m        (ch1_awready_m    ),
// .wdata_m          (ch1_wdata_m      ),
// .wstrb_m          (ch1_wstrb_m      ),
// .wvalid_m         (ch1_wvalid_m     ),
// .wready_m         (ch1_wready_m     ),
// .bresp_m          (ch1_bresp_m      ),
// .bvalid_m         (ch1_bvalid_m     ),
// .bready_m         (ch1_bready_m     ),
// .rom_addr_ptr     (rom_addr_ptr_ff  ),
// .rom_data_ptr     (rom_data_ptr_ff  ),
// .rom_data         (rom_data         ),
// .cmd_out_mw       (cmd_out_mw       ), 
// .irq_out          (irq_out          ) 
//);
//
//end
////assign done_i = 1'b0;
////assign status_i = 32'h0;
//endgenerate
               
axi_traffic_gen_v2_0_10_systeminit_mrdwr # (
 .C_M_AXI_THREAD_ID_WIDTH   (C_M_AXI_THREAD_ID_WIDTH   ),
 .C_M_AXI_AWUSER_WIDTH      (C_M_AXI_AWUSER_WIDTH      ),
 .C_M_AXI_DATA_WIDTH        (C_M_AXI_DATA_WIDTH        ),
 .C_ATG_SYSTEM_INIT         (C_ATG_SYSTEM_INIT         ),
 .C_ATG_SYSTEM_TEST         (C_ATG_SYSTEM_TEST         ),
 .C_ATG_SYSTEM_CMD_MAX_RETRY(C_ATG_SYSTEM_CMD_MAX_RETRY),
 .C_ATG_SYSTEM_TEST_MAX_CLKS(C_ATG_SYSTEM_TEST_MAX_CLKS),
 .C_ATG_SYSTEM_MAX_CHANNELS (C_ATG_SYSTEM_MAX_CHANNELS ),
 .C_ATG_SYSTEM_CH1_LOW      (C_ATG_SYSTEM_CH1_LOW      ),
 .C_ATG_SYSTEM_CH1_HIGH     (C_ATG_SYSTEM_CH1_HIGH     ),
 .C_ATG_SYSTEM_CH2_LOW      (C_ATG_SYSTEM_CH2_LOW      ),
 .C_ATG_SYSTEM_CH2_HIGH     (C_ATG_SYSTEM_CH2_HIGH     ),
 .C_ATG_SYSTEM_CH3_LOW      (C_ATG_SYSTEM_CH3_LOW      ),
 .C_ATG_SYSTEM_CH3_HIGH     (C_ATG_SYSTEM_CH3_HIGH     ),
 .C_ATG_SYSTEM_CH4_LOW      (C_ATG_SYSTEM_CH4_LOW      ),
 .C_ATG_SYSTEM_CH4_HIGH     (C_ATG_SYSTEM_CH4_HIGH     ),
 .C_ATG_SYSTEM_CH5_LOW      (C_ATG_SYSTEM_CH5_LOW      ),
 .C_ATG_SYSTEM_CH5_HIGH     (C_ATG_SYSTEM_CH5_HIGH     ) 
) static_mrdwr (
 .Clk              (Clk              ),
 .rst_l            (rst_l            ),
 .ch1_awaddr_m         (ch1_awaddr_m         ),
 .ch1_awvalid_m        (ch1_awvalid_m        ),
 .ch1_awready_m        (ch1_awready_m        ),
 .ch1_wdata_m          (ch1_wdata_m          ),
 .ch1_wstrb_m          (ch1_wstrb_m          ),
 .ch1_wvalid_m         (ch1_wvalid_m         ),
 .ch1_wready_m         (ch1_wready_m         ),
 .ch1_bresp_m          (ch1_bresp_m          ),
 .ch1_bvalid_m         (ch1_bvalid_m         ),
 .ch1_bready_m         (ch1_bready_m         ),
 .ch1_araddr_m         (ch1_araddr_m         ),
 .ch1_arvalid_m        (ch1_arvalid_m        ),
 .ch1_arready_m        (ch1_arready_m        ),
 .ch1_rdata_m          (ch1_rdata_m          ),
 .ch1_rvalid_m         (ch1_rvalid_m         ),
 .ch1_rresp_m          (ch1_rresp_m          ),
 .ch1_rready_m         (ch1_rready_m         ),
 .ch2_awaddr_m         (ch2_awaddr_m         ),
 .ch2_awvalid_m        (ch2_awvalid_m        ),
 .ch2_awready_m        (ch2_awready_m        ),
 .ch2_wdata_m          (ch2_wdata_m          ),
 .ch2_wstrb_m          (ch2_wstrb_m          ),
 .ch2_wvalid_m         (ch2_wvalid_m         ),
 .ch2_wready_m         (ch2_wready_m         ),
 .ch2_bresp_m          (ch2_bresp_m          ),
 .ch2_bvalid_m         (ch2_bvalid_m         ),
 .ch2_bready_m         (ch2_bready_m         ),
 .ch2_araddr_m         (ch2_araddr_m         ),
 .ch2_arvalid_m        (ch2_arvalid_m        ),
 .ch2_arready_m        (ch2_arready_m        ),
 .ch2_rdata_m          (ch2_rdata_m          ),
 .ch2_rvalid_m         (ch2_rvalid_m         ),
 .ch2_rresp_m          (ch2_rresp_m          ),
 .ch2_rready_m         (ch2_rready_m         ),
 .ch3_awaddr_m         (ch3_awaddr_m         ),
 .ch3_awvalid_m        (ch3_awvalid_m        ),
 .ch3_awready_m        (ch3_awready_m        ),
 .ch3_wdata_m          (ch3_wdata_m          ),
 .ch3_wstrb_m          (ch3_wstrb_m          ),
 .ch3_wvalid_m         (ch3_wvalid_m         ),
 .ch3_wready_m         (ch3_wready_m         ),
 .ch3_bresp_m          (ch3_bresp_m          ),
 .ch3_bvalid_m         (ch3_bvalid_m         ),
 .ch3_bready_m         (ch3_bready_m         ),
 .ch3_araddr_m         (ch3_araddr_m         ),
 .ch3_arvalid_m        (ch3_arvalid_m        ),
 .ch3_arready_m        (ch3_arready_m        ),
 .ch3_rdata_m          (ch3_rdata_m          ),
 .ch3_rvalid_m         (ch3_rvalid_m         ),
 .ch3_rresp_m          (ch3_rresp_m          ),
 .ch3_rready_m         (ch3_rready_m         ),
 .ch4_awaddr_m         (ch4_awaddr_m         ),
 .ch4_awvalid_m        (ch4_awvalid_m        ),
 .ch4_awready_m        (ch4_awready_m        ),
 .ch4_wdata_m          (ch4_wdata_m          ),
 .ch4_wstrb_m          (ch4_wstrb_m          ),
 .ch4_wvalid_m         (ch4_wvalid_m         ),
 .ch4_wready_m         (ch4_wready_m         ),
 .ch4_bresp_m          (ch4_bresp_m          ),
 .ch4_bvalid_m         (ch4_bvalid_m         ),
 .ch4_bready_m         (ch4_bready_m         ),
 .ch4_araddr_m         (ch4_araddr_m         ),
 .ch4_arvalid_m        (ch4_arvalid_m        ),
 .ch4_arready_m        (ch4_arready_m        ),
 .ch4_rdata_m          (ch4_rdata_m          ),
 .ch4_rvalid_m         (ch4_rvalid_m         ),
 .ch4_rresp_m          (ch4_rresp_m          ),
 .ch4_rready_m         (ch4_rready_m         ),
 .ch5_awaddr_m         (ch5_awaddr_m         ),
 .ch5_awvalid_m        (ch5_awvalid_m        ),
 .ch5_awready_m        (ch5_awready_m        ),
 .ch5_wdata_m          (ch5_wdata_m          ),
 .ch5_wstrb_m          (ch5_wstrb_m          ),
 .ch5_wvalid_m         (ch5_wvalid_m         ),
 .ch5_wready_m         (ch5_wready_m         ),
 .ch5_bresp_m          (ch5_bresp_m          ),
 .ch5_bvalid_m         (ch5_bvalid_m         ),
 .ch5_bready_m         (ch5_bready_m         ),
 .ch5_araddr_m         (ch5_araddr_m         ),
 .ch5_arvalid_m        (ch5_arvalid_m        ),
 .ch5_arready_m        (ch5_arready_m        ),
 .ch5_rdata_m          (ch5_rdata_m          ),
 .ch5_rvalid_m         (ch5_rvalid_m         ),
 .ch5_rresp_m          (ch5_rresp_m          ),
 .ch5_rready_m         (ch5_rready_m         ),
 .rom_addr_ptr     (rom_addr_ptr_ff  ),
 .rom_data_ptr     (rom_data_ptr_ff  ),
 .rom_data         (rom_data         ),
 .rom_mask         (rom_mask         ),
 .rom_ctrl         (rom_ctrl         ),
 .cmd_out_mw       (cmd_out_mw       ), 
 .irq_out          (irq_out          ),
 .done             (done_i           ), 
 .status           (status_i         ) 
);
endmodule
