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
// Filename:       axi_traffic_gen_v2_0_10_sharedram_wrap.v
// Version : v1.0
// Description:    shared ram wrapper module. To store read data on received 
// m_r_channel and write data for m_w_channel
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
`include "axi_traffic_gen_v2_0_10_defines.v"
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_sharedram_wrap #
(
  parameter C_FAMILY           = "virtex7",
  parameter C_S_AXI_DATA_WIDTH = 32       ,
  parameter C_M_AXI_DATA_WIDTH = 32       ,
  parameter C_RAMINIT_SRAM0_F  = "NONE"     
) (

 input                     Clk                 ,
 input                     rst_l               ,
//mr
 input [10:0]              mram_waddr_ff       ,     
 input [C_M_AXI_DATA_WIDTH/8-1:0]               mram_we_ff          ,        
 input [C_M_AXI_DATA_WIDTH-1:0]              mram_write_data_ff  ,
 output [C_M_AXI_DATA_WIDTH-1:0]             mram_out            ,  
//mw
 input [15:0]              maw_agen_addr       ,
//sw
 input [10:0]              slvram_waddr_ff     ,      
 input [7:0]               slvram_we_ff        ,         
 input [63:0]              slvram_write_data_ff,
 output [63:0]             sram_rd_data_a      ,
//sr
 input [15:0]              ar_agen_addr

);


   // grahams : combining mstram+slvram into one structure.... shrink+functionality 
   //----------------CHANNEL  A ---------------------------------
   wire [7:0]  sram_we_a       ; 
   wire [9:0]  sram_addr_a     ;
   generate
   if(C_M_AXI_DATA_WIDTH == 32) begin: CHA_M_32
     assign  sram_addr_a     = (mram_we_ff[C_M_AXI_DATA_WIDTH/8-1:0] != 0) ? mram_waddr_ff[10:1] : {ar_agen_addr[12:3]};   
     assign  sram_we_a       = mram_waddr_ff[0]? {mram_we_ff[C_M_AXI_DATA_WIDTH/8-1:0],4'h0} : {4'h0,mram_we_ff[C_M_AXI_DATA_WIDTH/8-1:0]};   
   end
   endgenerate
   generate
   if(C_M_AXI_DATA_WIDTH >= 64) begin: CHA_M_G64
     assign  sram_addr_a     = (mram_we_ff[C_M_AXI_DATA_WIDTH/8-1:0] != 0) ? mram_waddr_ff[10:1] : {ar_agen_addr[12:3]};   
     assign  sram_we_a       = mram_we_ff[C_M_AXI_DATA_WIDTH/8-1:0]; //use only lower enables for writing.
   end
   endgenerate
   wire [63:0] sram_wr_data_a  ;
   generate
   if( C_M_AXI_DATA_WIDTH == 32) begin: M_R_WR_32
     assign  sram_wr_data_a[63:0] = (mram_waddr_ff[0])?{
                                  2{mram_write_data_ff[C_M_AXI_DATA_WIDTH-1:0]}}:
                                    mram_write_data_ff;
   end
   if( C_M_AXI_DATA_WIDTH >= 64) begin: M_R_WR_G64 //store only 64-bit data for widths >= 64bit
     assign  sram_wr_data_a[63:0] = mram_write_data_ff[C_M_AXI_DATA_WIDTH-1:0];
   end
   endgenerate
   //32-bit read to a 64-bit RAM
   reg ar_agen_addr_bit2_ff;
   wire [63:0] sram_rd_data_a_pre;
   always @(posedge Clk) begin
       ar_agen_addr_bit2_ff <= (rst_l) ? ar_agen_addr[2] : 1'b0;
   end
   generate
     if( C_S_AXI_DATA_WIDTH == 32) begin: MRAM_RD_32
       assign  sram_rd_data_a[C_S_AXI_DATA_WIDTH-1:0] = 
                                     (ar_agen_addr_bit2_ff)?{
                                    2{sram_rd_data_a_pre[63:32]}}:
                                      sram_rd_data_a_pre;
     end
     if( C_S_AXI_DATA_WIDTH == 64) begin: MRAM_RD_64
       assign  sram_rd_data_a[C_S_AXI_DATA_WIDTH-1:0] = sram_rd_data_a_pre;
     end
   endgenerate

   //----------------CHANNEL  B ---------------------------------
   wire [7:0]  sram_we_b       ;
   wire [9:0]  sram_addr_b     ;
   wire [9:0]  sram_addr_s     ;
   generate
   if(C_M_AXI_DATA_WIDTH == 32) begin: CHB_M_32
      assign  sram_addr_s     = maw_agen_addr[12:3];   
   end 
   endgenerate
   generate
   if(C_M_AXI_DATA_WIDTH == 64) begin: CHB_M_64
      assign  sram_addr_s     = maw_agen_addr[12:3];   
   end 
   endgenerate
   generate
   if(C_M_AXI_DATA_WIDTH == 128) begin: CHB_M_128
      assign  sram_addr_s     = maw_agen_addr[13:4];   
   end 
   endgenerate
   generate
   if(C_M_AXI_DATA_WIDTH == 256) begin: CHB_M_256
      assign  sram_addr_s     = maw_agen_addr[14:5];   
   end 
   endgenerate
   generate
   if(C_M_AXI_DATA_WIDTH == 512) begin: CHB_M_512
      assign  sram_addr_s     = maw_agen_addr[15:6];   
   end 
   endgenerate


   generate
   if(C_S_AXI_DATA_WIDTH == 32 ) begin: CHB_S_32
      assign  sram_addr_b     = (slvram_we_ff[7:0] != 0) ? slvram_waddr_ff[10:1] : sram_addr_s;   
      assign  sram_we_b       = slvram_waddr_ff[0]? {slvram_we_ff[3:0],4'h0} : {4'h0,slvram_we_ff[3:0]};   
   end 
   endgenerate
   generate
   if(C_S_AXI_DATA_WIDTH == 64 ) begin: CHB_S_64
      assign sram_addr_b     = (slvram_we_ff[7:0] != 0) ? slvram_waddr_ff[10:1] : sram_addr_s;   
      assign  sram_we_b       = slvram_we_ff[7:0];
   end 
   endgenerate
   wire [63:0] sram_wr_data_b  = (slvram_we_ff[7:0] != 0) ? slvram_write_data_ff[63:0] : 64'h0;   
   
   wire [63:0] sram_rd_data_b;
reg maw_agen_addr_bit2_ff;
always @(posedge Clk) begin
    maw_agen_addr_bit2_ff <= (rst_l) ? maw_agen_addr[2] : 1'b0;
end
   generate
   if( C_M_AXI_DATA_WIDTH == 32) begin: MRAM_WR_32
     assign  mram_out[C_M_AXI_DATA_WIDTH-1:0] = 
                                   (maw_agen_addr_bit2_ff)?{
                                  2{sram_rd_data_b[63:32]}}:
                                    sram_rd_data_b;
   end
   if( C_M_AXI_DATA_WIDTH == 64) begin: MRAM_WR_64
     assign  mram_out[C_M_AXI_DATA_WIDTH-1:0] = sram_rd_data_b;
   end
   //duplicate 64-bit data from SRAM to full axi-width programmed.
   if( C_M_AXI_DATA_WIDTH == 128) begin: MRAM_WR_128
     assign  mram_out[C_M_AXI_DATA_WIDTH-1:0] = {2{sram_rd_data_b}};
   end
   if( C_M_AXI_DATA_WIDTH == 256) begin: MRAM_WR_256
     assign  mram_out[C_M_AXI_DATA_WIDTH-1:0] = {4{sram_rd_data_b}};
   end
   if( C_M_AXI_DATA_WIDTH == 512) begin: MRAM_WR_512
     assign  mram_out[C_M_AXI_DATA_WIDTH-1:0] = {8{sram_rd_data_b}};
   end
   endgenerate

axi_traffic_gen_v2_0_10_slvram_v7 #(
         .C_FAMILY    (C_FAMILY         ),
         .C_DATAWIDTH (64               ),
         .C_SIZE      (1024             ),
         .C_ADDR_WIDTH(10               ),
         //.C_INITRAM_F ("/home/kpolise/mst.mif") 
         .C_INITRAM_F (C_RAMINIT_SRAM0_F) 
         ) sharedram (
        .clk_a    (Clk               ),
        .we_a     (sram_we_a         ),
        .addr_a   (sram_addr_a       ),
        .wr_data_a(sram_wr_data_a    ),
        .rd_data_a(sram_rd_data_a_pre),

        .clk_b    (Clk               ),
        .we_b     (sram_we_b         ),
        .addr_b   (sram_addr_b       ),
        .wr_data_b(sram_wr_data_b    ),
        .rd_data_b(sram_rd_data_b    )
);
   
endmodule
