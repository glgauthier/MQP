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
// Filename:       axi_traffic_gen_v2_0_10_cmdram_wrap.v
// Version : v1.0
// Description:    command ram wrapper module: To manage the read/write
//                 addresses to cmdram module.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
`include "axi_traffic_gen_v2_0_10_defines.v"
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_cmdram_wrap #
(
parameter C_FAMILY            = "virtex7",
parameter C_ATG_BASIC_AXI4    = 1     ,
parameter C_M_AXI_DATA_WIDTH  = 32    ,
parameter C_RAMINIT_CMDRAM0_F = "NONE",  
parameter C_RAMINIT_CMDRAM1_F = "NONE",  
parameter C_RAMINIT_CMDRAM2_F = "NONE",  
parameter C_RAMINIT_CMDRAM3_F = "NONE"  

) (

   input              Clk                         ,
   input              rst_l                       ,
   input  [15:0 ]     cmdram_we                   ,
   input  [15:0 ]     aw_agen_addr                ,
   input              reg0_m_enable_ff            ,
   input  [9:0  ]     reg0_mw_ptr_update          , //maw_ptr_new
   input  [9:0  ]     reg0_mr_ptr_update          , //mar_ptr_new
   input  [9:0  ]     mar_ptr_new_ff              , 
   input  [15:0 ]     ar_agen0_addr               ,
   input  [63:0 ]     slvram_wr_data              ,
   input              arfifo_valid                ,
   input  [71:0 ]     arfifo_out                  ,
   input  [23:0 ]     param_cmdr_submitcnt_ff     ,
   input  [23:0 ]     param_cmdw_submitcnt_ff     ,
   input  [9:0  ]     maw_ptr_new_ff              ,

   output [127:0]     cmd_out_mr_i                , 
   output             cmdram_mr_regslice_id_stable,

   output [127:0]     cmd_out_mw_regslice         ,
   output [127:0]     cmd_out_mr_regslice         ,
   output [127:0]     cmd_out_mw_regslice_ff      ,
   output [127:0]     cmd_out_mr_regslice_ff      ,
   output             cmdram_mw_regslice_id_stable
);

wire [9:0] maw_ptr_new = reg0_mw_ptr_update;
wire [9:0] mar_ptr_new = reg0_mr_ptr_update;

wire [127:0] cmd_out_mw_i;
wire [15:0] cmdram_addra = (reg0_m_enable_ff) ?
                { 4'b0001, maw_ptr_new[7:0], 4'b0000 } :
                { 3'b000, aw_agen_addr[12:4], 4'b0000 };

wire [15:0] cmdram_addrb = (reg0_m_enable_ff) ?
                { 4'b0000, mar_ptr_new[7:0], 4'b0000 } :
                { 3'b000, ar_agen0_addr[12:4], 4'b0000 };
wire [127:0] cmd_out_mw_raw;
wire [127:0] cmd_out_mr_raw;
generate if (C_ATG_BASIC_AXI4 == 0 ) begin : CMDRAM_FULLAXI
   assign cmd_out_mw_i = cmd_out_mw_raw; 
   assign cmd_out_mr_i = cmd_out_mr_raw; 
end
endgenerate
//
//Fixed controls for a basic axi4 support.
//
wire [2:0] size;
generate if(C_M_AXI_DATA_WIDTH == 32 ) begin : CMDWRAP_SISE32
   assign size = 3'b010;
end
endgenerate
generate if(C_M_AXI_DATA_WIDTH == 64 ) begin : CMDWRAP_SISE64
   assign size = 3'b011;
end
endgenerate
generate if(C_M_AXI_DATA_WIDTH == 128 ) begin : CMDWRAP_SISE128
   assign size = 3'b100;
end
endgenerate
generate if(C_M_AXI_DATA_WIDTH == 256 ) begin : CMDWRAP_SISE256
   assign size = 3'b101;
end
endgenerate
generate if(C_M_AXI_DATA_WIDTH == 512 ) begin : CMDWRAP_SISE512
   assign size = 3'b110;
end
endgenerate
wire       fixed_lock  = 1'b0;
wire [1:0] fixed_burst = 2'b01;
wire [2:0] fixed_prot  = 3'b010;
wire [3:0] fixed_cache = 4'h0;
wire [7:0] fixed_user  = 7'h0;
wire [2:0] fixed_size  = size;
wire [3:0] fixed_qos   = 4'h0;
generate if (C_ATG_BASIC_AXI4 == 1 ) begin : CMDRAM_BASICAXI
   assign cmd_out_mw_i = {
                         cmd_out_mw_raw[127],fixed_qos,fixed_user,fixed_cache,cmd_out_mw_raw[99:96],
                         cmd_out_mw_raw[95:64],
                         cmd_out_mw_raw[63:56],fixed_prot,cmd_out_mw_raw[52:47],fixed_size,fixed_burst,cmd_out_mw_raw[41],fixed_lock,cmd_out_mw_raw[39:32],
                         cmd_out_mw_raw[31:0]
                          }; 
   assign cmd_out_mr_i = {
                         cmd_out_mr_raw[127],fixed_qos,fixed_user,fixed_cache,cmd_out_mr_raw[99:96],
                         cmd_out_mr_raw[95:64],
                         cmd_out_mr_raw[63:56],fixed_prot,cmd_out_mr_raw[52:47],fixed_size,fixed_burst,cmd_out_mr_raw[41],fixed_lock,cmd_out_mr_raw[39:32],
                         cmd_out_mr_raw[31:0]
                          }; 
end
endgenerate

axi_traffic_gen_v2_0_10_cmdram #(
  .C_FAMILY   (C_FAMILY           ),
  .C_INITRAM_0(C_RAMINIT_CMDRAM0_F), 
  .C_INITRAM_1(C_RAMINIT_CMDRAM1_F), 
  .C_INITRAM_2(C_RAMINIT_CMDRAM2_F), 
  .C_INITRAM_3(C_RAMINIT_CMDRAM3_F) 
) Cmdram (

         .reset           (~rst_l                                    ),            
        .clk_a            (Clk                                       ),
        .we_a             (cmdram_we[15:0]                           ),
        .active           (reg0_m_enable_ff                          ),
        .addr_a_idle      ({ 3'b000, aw_agen_addr[12:4], 4'b0000 }   ),
        .addr_a_active    ( { 4'b0001, maw_ptr_new_ff[7:0], 4'b0000 }),
        .wr_data_a        ({ 2 { slvram_wr_data[63:0] } }            ),
        .rd_data_a        (cmd_out_mw_raw[127:0]                       ),
        .clk_b            (Clk                                       ),
        .addr_b_idle_latch(arfifo_valid                              ),
        .addr_b_idle      ({ 3'b000, arfifo_out[12:4], 4'b0000 }     ),
        .addr_b_active    ({ 4'b0000, mar_ptr_new_ff[7:0], 4'b0000 } ),
        .rd_data_b        (cmd_out_mr_raw[127:0]                       )
);


   // id is a mix of submitcnt,mar_ptr -- so can ID new cmds even if just a repeat
   wire [9:0] cmdram_mr_regslice_idin =   {param_cmdr_submitcnt_ff[0],1'b0, mar_ptr_new_ff[7:0]};
  
   wire [9:0] cmdram_mw_regslice_idin =   {param_cmdw_submitcnt_ff[0],reg0_m_enable_ff, maw_ptr_new_ff[7:0]};
   
   
 axi_traffic_gen_v2_0_10_regslice
  #(
    .DWIDTH   (128                     ),
    .IDWIDTH  (10                      ),    
    .DATADEPTH(`REGSLICE_CMDRAM_MR_DATA),
    .IDDEPTH  (`REGSLICE_CMDRAM_MR_ID  )
    )
   cmdram_regslice_r
   (
    .din         (cmd_out_mr_i                ),
    .dout        (cmd_out_mr_regslice_ff      ),
    .dout_early  (cmd_out_mr_regslice         ),    
    .idin        (cmdram_mr_regslice_idin     ),
    .idout       (                            ),
    .id_stable   (cmdram_mr_regslice_id_stable),  
    .id_stable_ff(                            ),
    .data_stable (                            ),
    .clk         (Clk                         ),  
    .reset       (~rst_l                      )  
    );


    
 axi_traffic_gen_v2_0_10_regslice
  #(
    .DWIDTH   (128                     ),
    .IDWIDTH  (10                      ),    
    .DATADEPTH(`REGSLICE_CMDRAM_MW_DATA),
    .IDDEPTH  (`REGSLICE_CMDRAM_MW_ID  )
    )
   cmdram_regslice_w
   (
    .din         (cmd_out_mw_i                ),
    .dout        (cmd_out_mw_regslice_ff      ),
    .dout_early  (cmd_out_mw_regslice         ),    
    .idin        (cmdram_mw_regslice_idin     ),
    .idout       (                            ),    
    .id_stable   (cmdram_mw_regslice_id_stable),  
    .id_stable_ff(                            ),    
    .data_stable (                            ),    
    .clk         (Clk                         ),  
    .reset       (~rst_l                      )  
    );  




endmodule
