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
// Filename:       axi_traffic_gen_v2_0_10_paramram_wrap.v
// Version : v1.0
// Description:    manage address/data generation to paramram module.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
`include "axi_traffic_gen_v2_0_10_defines.v"
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_addrram_wrap #
(
parameter C_FAMILY = "virtex7",
parameter C_RAMINIT_ADDRRAM0_F = "NONE" ,
parameter C_S_AXI_DATA_WIDTH = 32,
parameter C_M_AXI_DATA_WIDTH = 32,
parameter C_M_AXI_ADDR_WIDTH = 32,
parameter C_ATG_BASIC_AXI4 = 0
) (
   input                 Clk                           ,
   input                 rst_l                         ,
//s
   input [15:0]          aw_agen_addr                  ,
   input                 aw_agen_valid                 ,
   input [15:0]          ar_agen_addr                  ,
   input                 ar_agen_valid                 ,
   input                 wfifo_valid                   ,
   input [C_S_AXI_DATA_WIDTH*9/8+1-1:0]    wfifo_out   ,
 
   output [31:0]         mr_ext_addr                   ,
   output [31:0]         mw_ext_addr                   ,
   output [31:0]         rd_ext_addr                   ,
   input [9:0]           mar_ptr_new_ff                , 

   input [9:0]           maw_ptr_new_ff                 
);

generate if(C_M_AXI_ADDR_WIDTH > 32 ) begin : EXT_ADDR_ON
   wire [31:0] addrram_rd_data_a;
   wire [3:0]  addrram_we_b       = 4'b0 ;   
   wire [8:0]  addrram_addr_b     = {1'b1,maw_ptr_new_ff[7:0]};   
   wire [31:0] addrram_wr_data_b  = 32'h00000000;  
   wire [31:0] addrram_rd_data_b;
   wire addr_ram_we               = aw_agen_valid && (aw_agen_addr[15:11] == 5'b00100);
   reg         addr_ram_we_ff;
   wire [8:0]   addr_ram_addr_ff;
   assign addr_ram_addr_ff =  (rst_l) ? ((addr_ram_we) ? aw_agen_addr[10:2] : addr_ram_addr_ff) : 9'h0 ;
   wire [3:0] addrram_we_a       = (wfifo_valid && addr_ram_we)  ? 4'hf : 4'h0 ;  
   wire [8:0] addrram_addr_a     = (wfifo_valid && addr_ram_we)  ? addr_ram_addr_ff : (ar_agen_valid && ar_agen_addr[15:11] == 5'b00100) ? ar_agen_addr[10:2] : {1'b0,mar_ptr_new_ff[7:0]};
   wire [31:0] addrram_wr_data_a;
    
   assign rd_ext_addr             = addrram_rd_data_a;
   assign mr_ext_addr             = addrram_rd_data_a;
   assign mw_ext_addr             = addrram_rd_data_b;

   always @(posedge Clk) begin 
      addr_ram_we_ff <=  (rst_l) ? ((addr_ram_we) ? 1'h1 : ((wfifo_valid) ? 1'h0 : addr_ram_we_ff)) : 1'h0 ;
   end
      
   if(C_S_AXI_DATA_WIDTH == 64) begin: EXT_ADDR_64_GEN
      assign addrram_wr_data_a  =  (addr_ram_addr_ff[0]) ? wfifo_out[63:32]: wfifo_out[31:0];   
   end 
   if(C_S_AXI_DATA_WIDTH == 32) begin: EXT_ADDR_32_GEN
      assign addrram_wr_data_a  =  wfifo_out[31:0];   
   end 


axi_traffic_gen_v2_0_10_slvram_v7 #(
            .C_FAMILY    (C_FAMILY             ),
            .C_DATAWIDTH (32                   ),
            .C_SIZE      (512                  ),
            .C_ADDR_WIDTH(9                    ),
            .C_INITRAM_F (C_RAMINIT_ADDRRAM0_F )
) addrram (
      .clk_a    (Clk              ),
      .we_a     (addrram_we_a     ),
      .addr_a   (addrram_addr_a   ),
      .wr_data_a(addrram_wr_data_a),
      .rd_data_a(addrram_rd_data_a),
      
      .clk_b    (Clk              ),
      .we_b     (addrram_we_b     ),
      .addr_b   (addrram_addr_b   ),
      .wr_data_b(addrram_wr_data_b),
      .rd_data_b(addrram_rd_data_b)
      );

end
endgenerate

endmodule                                   
