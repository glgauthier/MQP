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
// Filename:       axi_traffic_gen_v2_0_10_static_cmdgen.v
// Version : v1.0
// Description:    Rd/wr command generator
// various features/status of the core.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
`include "axi_traffic_gen_v2_0_10_defines.v"
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_static_cmdgen
# (
  parameter C_ATG_STATIC_ADDRESS     = 32'h12A0_0000,
  parameter C_M_AXI_DATA_WIDTH       = 32           ,
  parameter C_ATG_MIF_ADDR_BITS      = 4 ,// 4(16),5(32),6(64),7(128),8(256)
  parameter C_ATG_STATIC_LENGTH      = 3,
  parameter C_ATG_SYSTEM_INIT        = 0,
  parameter C_ATG_SYSTEM_TEST        = 0            
) (
 input                            Clk            ,
 input                            rst_l          ,

 input                            static_ctl_en  , 
 input [7:0]                      static_len     , 
 input    [9:0]                   rom_addr_ptr_ff, 
 input   [31:0]                   rom_addr       ,
 input   [31:0]                   rom_data       ,
 output [127:0]                   cmd_out_mw     ,
 output [C_M_AXI_DATA_WIDTH-1:0]  cmd_data       ,
 output [127:0]                   cmd_out_mr      
               
);

wire [2:0] size;
generate if(C_M_AXI_DATA_WIDTH == 32 ) begin : M_SISE32
   assign size = 3'b010;
end
endgenerate
generate if(C_M_AXI_DATA_WIDTH == 64 ) begin : M_SISE64
   assign size = 3'b011;
end
endgenerate
generate if(C_M_AXI_DATA_WIDTH == 128 ) begin : M_SISE128
   assign size = 3'b100;
end
endgenerate
generate if(C_M_AXI_DATA_WIDTH == 256 ) begin : M_SISE256
   assign size = 3'b101;
end
endgenerate
generate if(C_M_AXI_DATA_WIDTH == 512 ) begin : M_SISE512
   assign size = 3'b110;
end
endgenerate

wire [5:0] id      = 6'h0;
wire [1:0] burst   = 2'b01;
reg  [7:0] len     = 8'h0;
always @(posedge Clk) begin
  len[7:0] <= (rst_l) ? static_len[7:0] : C_ATG_STATIC_LENGTH;
end
//
//Static-mode
//
generate if(C_ATG_SYSTEM_INIT == 0 &&
            C_ATG_SYSTEM_TEST == 0 ) begin : STATIC_MODE_ON
assign cmd_out_mw = {
                     32'h0,
                     32'h0,
                     static_ctl_en,7'h0,3'b010,id,size,burst,2'b00,len,
                     C_ATG_STATIC_ADDRESS
                    };
assign cmd_out_mr = {
                     32'h0,
                     32'h0,
                     static_ctl_en,7'h0,3'b010,id,size,burst,2'b00,len,
                     C_ATG_STATIC_ADDRESS
                    };
assign cmd_data[C_M_AXI_DATA_WIDTH-1:0] = {
                                           64'hCAFE5AFE_C001CAFE,
                                           64'hCAFE1AFE_C001DAFE,
                                           64'hCAFE2AFE_C001EAFE,
                                           64'hCAFE3AFE_C001FAFE 
                                          };
end
endgenerate
wire system_init_en;
wire system_init_cnt_en;
wire system_init_cmd_en;
// disable when no.of commands count reached Maximum limit(16)
assign system_init_cnt_en = (rom_addr_ptr_ff[C_ATG_MIF_ADDR_BITS] != 1'b1);

// disable when command has cmd-valid bit set to 0
assign system_init_cmd_en = ~(&rom_addr); // All 1's is NOP OPCODE.
assign system_init_en = system_init_cnt_en && system_init_cmd_en;
generate if(C_ATG_SYSTEM_INIT == 1 || C_ATG_SYSTEM_TEST == 1 ) begin : SYSTEM_INIT_TEST_MODE_ON
assign cmd_out_mw = {
                     32'h0,
                     32'h0,
                     system_init_en,7'h0,3'b010,id,size,burst,2'b00,8'h0,
                     rom_addr[31:0]
                    };
assign cmd_data[C_M_AXI_DATA_WIDTH-1:0] = rom_data[31:0];
end
endgenerate
endmodule
