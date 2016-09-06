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
// Filename:       axi_traffic_gen_v2_0_10_systeminit_dmg.v
// Version : v1.0
// Description:    Rd/wr command generator
// various features/status of the core.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
`include "axi_traffic_gen_v2_0_10_defines.v"
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_systeminit_dmg 
# (
  parameter C_FAMILY = "virtex7"    ,
  parameter C_ATG_MIF_ADDR_BITS     = 4 ,// 4(16),5(32),6(64),7(128),8(256)
  parameter C_ATG_MIF_DATA_DEPTH    = 16 ,// 4(16),5(32),6(64),7(128),8(256)
  parameter C_ATG_MIF = "atg_init.mif"    
) (
  input [C_ATG_MIF_ADDR_BITS-1 : 0]   a         ,
  input           clk       ,
  input           qspo_srst ,
  output [31 : 0] qspo 
               
);

//wire [31:0] rom_matrix[255:0] ;
//reg  [31:0] qspo_i;
//assign rom_matrix[0] =  {32'h81111111};
//assign rom_matrix[1] =  {32'h82222222};
//assign rom_matrix[2] =  {32'h73333333};
//assign rom_matrix[3] =  {32'h84444444};
//assign rom_matrix[4] =  {32'h85555555};
//assign rom_matrix[5] =  {32'h86666666};
//assign rom_matrix[6] =  {32'h87777777};
//assign rom_matrix[7] =  {32'h88888888};
//assign rom_matrix[8] =  {32'h89999999};
//assign rom_matrix[9] =  {32'h80000000};
//assign rom_matrix[10] = {32'h8aaaaaaa};
//assign rom_matrix[11] = {32'h8bbbbbbb};
//assign rom_matrix[12] = {32'h8ccccccc};
//assign rom_matrix[13] = {32'h8ddddddd};
//assign rom_matrix[14] = {32'h0fffffff};
//assign rom_matrix[15] = {32'h8fffffff};
//assign rom_matrix[16] = {32'h23232323}; 
//assign rom_matrix[17] = {32'h11111111};
//assign rom_matrix[18] = {32'h22222222};
//assign rom_matrix[19] = {32'h33333333};
//assign rom_matrix[20] = {32'h44444444};
//assign rom_matrix[21] = {32'h55555555};
//assign rom_matrix[22] = {32'hffffffff};
//assign rom_matrix[23] = {32'h66666666};
//assign rom_matrix[24] = {32'h77777777};
//assign rom_matrix[25] = {32'h88888888};
//assign rom_matrix[26] = {32'h99999999};
//assign rom_matrix[27] = {32'haaaaaaaa};
//assign rom_matrix[28] = {32'hbbbbbbbb};
//assign rom_matrix[29] = {32'hcccccccc};
//assign rom_matrix[30] = {32'hdddddddd};
//assign rom_matrix[31] = {32'heeeeeeee};
//always @(posedge clk) begin
//  if(qspo_srst == 1'b1) begin
//     qspo_i <= 32'h0;
//  end else begin 
//     qspo_i <= rom_matrix[a];
//  end
//end
// assign qspo = qspo_i;
  dist_mem_gen_v8_0_10 #(
    .C_ADDR_WIDTH     (C_ATG_MIF_ADDR_BITS ),
    .C_DEFAULT_DATA   ("0"                 ),
    .C_DEPTH          (C_ATG_MIF_DATA_DEPTH),
    .C_FAMILY         (C_FAMILY            ),
    .C_HAS_CLK        (1                   ),
    .C_HAS_D          (0                   ),
    .C_HAS_DPO        (0                   ),
    .C_HAS_DPRA       (0                   ),
    .C_HAS_I_CE       (0                   ),
    .C_HAS_QDPO       (0                   ),
    .C_HAS_QDPO_CE    (0                   ),
    .C_HAS_QDPO_CLK   (0                   ),
    .C_HAS_QDPO_RST   (0                   ),
    .C_HAS_QDPO_SRST  (0                   ),
    .C_HAS_QSPO       (1                   ),
    .C_HAS_QSPO_CE    (0                   ),
    .C_HAS_QSPO_RST   (0                   ),
    .C_HAS_QSPO_SRST  (1                   ),
    .C_HAS_SPO        (0                   ),
    .C_HAS_WE         (0                   ),
    .C_MEM_INIT_FILE  (C_ATG_MIF           ),
    .C_MEM_TYPE       (0                   ),
    .C_PARSER_TYPE    (1                   ),
    .C_PIPELINE_STAGES(0                   ),
    .C_QCE_JOINED     (0                   ),
    .C_QUALIFY_WE     (0                   ),
    .C_READ_MIF       (1                   ),
    .C_REG_A_D_INPUTS (0                   ),
    .C_REG_DPRA_INPUT (0                   ),
    .C_SYNC_ENABLE    (1                   ),
    .C_WIDTH          (32                  )
  )
  inst (
    .a        (a                          ),
    .clk      (clk                        ),
    .qspo_srst(qspo_srst                  ),
    .qspo     (qspo                       ), 
    //Default out/inputs
    .d        (32'h0                      ),
    .dpra     ({C_ATG_MIF_ADDR_BITS{1'b0}}),
    .we       (1'b0                       ),
    .i_ce     (1'b0                       ),
    .qspo_ce  (1'b0                       ),
    .qdpo_ce  (1'b0                       ),
    .qdpo_clk (1'b0                       ),
    .qspo_rst (1'b0                       ),
    .qdpo_rst (1'b0                       ),
    .qdpo_srst(1'b0                       ),
    .spo      (                           ),
    .dpo      (                           ),
    .qdpo     (                           )
  );

endmodule
