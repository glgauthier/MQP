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
// Filename:       axi_traffic_gen_v2_0_10_cmdram.v
// Version : v1.0
// Description:    command ram (RAM instantiation) :stores commands received
//                  through slave interface. 
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
`include "axi_traffic_gen_v2_0_10_defines.v"
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_cmdram #(
  parameter C_FAMILY = "virtex7",
  parameter C_INITRAM_0 = "NONE", 
  parameter C_INITRAM_1 = "NONE", 
  parameter C_INITRAM_2 = "NONE", 
  parameter C_INITRAM_3 = "NONE" 
) (

 input          reset            ,
   
 input          clk_a            ,
 input          active           ,
 input  [15:0 ] we_a             ,
 input  [15:0 ] addr_a_idle      ,
 input  [15:0 ] addr_a_active    ,
 input  [127:0] wr_data_a        ,
 output [127:0] rd_data_a        ,

 input          clk_b            ,
 input          addr_b_idle_latch,
 input  [15:0 ] addr_b_idle      ,
 input  [15:0 ] addr_b_active    ,
 output [127:0] rd_data_b
);

// axi_traffic_gen_v2_0_10_cmdram
wire [127:0] a_int_rd_data, b_int_rd_data;

reg [12:0] a_addr_active_ff, b_addr_active_ff;
reg [127:0] a_int_rd_ff, b_int_rd_ff;
reg [12:0] b_addr_idle_save_ff;
reg        active_ff, active_2ff;

wire a_changed = (addr_a_active[4] ^ a_addr_active_ff[4]) ||
                                (active_ff && ~active_2ff);
wire [12:0] a_addr_act =   addr_a_active[12:0] ;
wire [12:0] a_addr = (active) ? a_addr_act[12:0] : addr_a_idle[12:0];
wire [127:0] a_int_rd = (a_changed || ~active) ? a_int_rd_data[127:0] :
                                                a_int_rd_ff[127:0];


wire b_changed = (addr_b_active[4] ^ b_addr_active_ff[4]) ||
                                (active_ff && ~active_2ff);
wire [12:0] b_addr_act =   addr_b_active[12:0] ;
wire [12:0] b_addr_idle_save = (addr_b_idle_latch) ? addr_b_idle[12:0] :
                                                b_addr_idle_save_ff[12:0];
wire [12:0] b_addr = (active) ? b_addr_act[12:0] : b_addr_idle_save[12:0];

wire [127:0] b_int_rd = (b_changed || ~active) ? b_int_rd_data[127:0] :
                                                b_int_rd_ff[127:0];

always @(posedge clk_b) begin
        active_ff <= active;
        active_2ff <= active_ff;
        a_addr_active_ff[12:0] <= addr_a_active[12:0];
        b_addr_active_ff[12:0] <= addr_b_active[12:0];
        a_int_rd_ff[127:0] <= a_int_rd[127:0];
        b_int_rd_ff[127:0] <= b_int_rd[127:0];
        b_addr_idle_save_ff[12:0] <= (reset) ? 13'b0  :   b_addr_idle_save[12:0];
end
//cmdram: 512 commands each of 128-bit width
axi_traffic_gen_v2_0_10_inferram #(
		     .C_FAMILY   (C_FAMILY   ),    
		     //.C_RAMINIT_F("/home/kpolise/cmd.mif"),    
		     .C_RAMINIT_F(C_INITRAM_0),    
		     .SIZE       (512        ),    
		     .ADDR_WIDTH (9          ),    
		     .NB_COL     (16         ),
		     .COL_WIDTH  (8          ),
                     .INFER_TYPE (1          ) 
		     )
   cmd_ram0_3   (
	 .clk  (clk_a               ),
	 .wea  (we_a[15:0]          ),
	 .web  (16'b0               ),	 
	 .addra(a_addr[12:4]        ),
	 .addrb(b_addr[12:4]        ),	 
	 .dia  (wr_data_a[127:0]    ),
	 .dib  (128'h0              ),	 
	 .doa  (a_int_rd_data[127:0]),
	 .dob  (b_int_rd_data[127:0])
       );
/*
axi_traffic_gen_v2_0_10_inferram #(
		     .C_RAMINIT_F(C_INITRAM_0),    
		     .NB_COL(4),
		     .COL_WIDTH(8)
		     )
   ram0 (
	 .clk(clk_a),
	 .wea(we_a[3:0]),
	 .web(4'b0),	 
	 .addra({1'b0,a_addr[12:4]}),
	 .addrb({1'b0,b_addr[12:4]}),	 
	 .dia(wr_data_a[31:0]),
	 .dib(32'b0),	 
	 .doa(a_int_rd_data[31:0]),
	 .dob(b_int_rd_data[31:0])
	 );

axi_traffic_gen_v2_0_10_inferram #(
		     .C_RAMINIT_F(C_INITRAM_1),    
		     .NB_COL(4),
		     .COL_WIDTH(8)
		     )
   ram1 (
	 .clk(clk_a),
	 .wea(we_a[7:4]),
	 .web(4'b0),	 
	 .addra({1'b0,a_addr[12:4]}),
	 .addrb({1'b0,b_addr[12:4]}),	 
	 .dia(wr_data_a[63:32]),
	 .dib(32'b0),	 
	 .doa(a_int_rd_data[63:32]),
	 .dob(b_int_rd_data[63:32])
	 );

axi_traffic_gen_v2_0_10_inferram #(
		     .C_RAMINIT_F(C_INITRAM_2),    
		     .NB_COL(4),
		     .COL_WIDTH(8)
		     )
   ram2 (
	 .clk(clk_a),
	 .wea(we_a[11:8]),
	 .web(4'b0),	 
	 .addra({1'b0,a_addr[12:4]}),
	 .addrb({1'b0,b_addr[12:4]}),	 
	 .dia(wr_data_a[95:64]),
	 .dib(32'b0),	 
	 .doa(a_int_rd_data[95:64]),
	 .dob(b_int_rd_data[95:64])
	 );

axi_traffic_gen_v2_0_10_inferram #(
		     .C_RAMINIT_F(C_INITRAM_3),    
		     .NB_COL(4),
		     .COL_WIDTH(8)
		     )
   ram3 (
	 .clk(clk_a),
	 .wea(we_a[15:12]),
	 .web(4'b0),	 
	 .addra({1'b0,a_addr[12:4]}),
	 .addrb({1'b0,b_addr[12:4]}),	 
	 .dia(wr_data_a[127:96]),
	 .dib(32'b0),	 
	 .doa(a_int_rd_data[127:96]),
	 .dob(b_int_rd_data[127:96])
	 );
*/
assign rd_data_a[127:0] =  a_int_rd_data[127:0] ;
assign rd_data_b[127:0] =  b_int_rd_data[127:0] ;

endmodule
