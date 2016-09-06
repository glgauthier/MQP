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
// Filename:       axi_traffic_gen_v2_0_10_randgen.v
// Version : v1.0
// Description:    Random number generator:Used during random address
// generation.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------


/*
 *
 *   Ygal Arbel's Random Number Generator
 * 
 * 
 * 
 * Random Address gen - random lfsr.   Ygal 10/26/2010
   Use a 20-bit LFSR to generate random addr.
   Per xapp052: for 20 bits, shift in the xnor from bits 20,17
 * 
 * 
 *   grahams modified to be 24b
 * 
 */
`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_randgen 
#(
  parameter seed  = 16'hABCD
) (
  output     [15:0] randnum        ,
  input             generate_next  ,
  input             reset          ,
  input             clk
);
   
  
 reg [15:0]  lfsr;
 wire        lfsr_xnor;

always @(posedge clk) begin
   if (reset) begin
      lfsr <= seed;    
   end else if(generate_next) begin
      lfsr    <= {lfsr_xnor,lfsr[15:1]};
   end
end

assign randnum = lfsr;
assign lfsr_xnor = (lfsr[12] ^ lfsr[3] ^  lfsr[1]^ lfsr[0]) ? 1'd0 : 1'd1;  

endmodule // axi_traffic_gen_v2_0_10_randgen
