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
// Filename:       axi_traffic_gen_v2_0_10_streaming_top.v
// Version : v1.0
// Description:    FIFO used to store / forward streaming data.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_axis_fifo
  #(
parameter WIDTH        = 33,
parameter HEADREG      = 1 ,
parameter ZERO_INVALID = 1 ,
parameter FULL_LEVEL   = 14,
parameter DEPTH        = 16,
parameter DEPTHBITS    = 4
  ) (
input Clk                        ,
input Rst_n                      ,

input [WIDTH-1:0] in_data        ,
input [WIDTH-1:0] in_invalid_data,
input  in_push                   ,
input  in_ready                  ,
input  in_block_notfull          ,
input  in_block_outvalid         ,
output  out_valid                ,
output  out_notfull              ,
output  out_overflow             ,
output [DEPTHBITS-1:0] out_depth ,
output [WIDTH-1:0] out_data
);

(* ram_style = "distributed" *) reg [WIDTH-1:0] data_ff[DEPTH-1:0]               ;
reg [WIDTH-1:0] headreg_ff                       ;
reg [DEPTHBITS-1:0] in_ptr_ff, out_ptr_ff        ;
reg [DEPTHBITS:0] depth_ff                       ;
reg  valid_ff, full_ff, notfull_ff, valid_filt_ff;

wire do_pop = in_ready && valid_filt_ff;
wire [DEPTHBITS-1:0] in_ptr = (in_push) ? in_ptr_ff[DEPTHBITS-1:0] + 'h1 :
            in_ptr_ff[DEPTHBITS-1:0];
wire [DEPTHBITS:0] depth =
    (in_push && ~do_pop) ? depth_ff[DEPTHBITS:0] + 'h1 :
    (~in_push && do_pop) ? depth_ff[DEPTHBITS:0] - 'h1 :
              depth_ff[DEPTHBITS:0];

wire  depth_was1 = (depth_ff[DEPTHBITS:0] == 'h1);
wire  valid      = (depth[DEPTHBITS:0] != 'h0);
wire  full       = (depth[DEPTHBITS:0] >= FULL_LEVEL) || in_block_notfull;
wire  notfull    = ~full;

wire [WIDTH-1:0] raw_data = data_ff[out_ptr_ff[DEPTHBITS-1:0]];
wire [DEPTHBITS-1:0] out_ptr = (do_pop) ? out_ptr_ff[DEPTHBITS-1:0] + 'h1 :
            out_ptr_ff[DEPTHBITS-1:0];
wire [WIDTH-1:0] head_raw_data = (depth_was1) ? in_data[WIDTH-1:0] :
          raw_data[WIDTH-1:0];
wire [WIDTH-1:0] headreg = (!valid_ff && in_push) ? in_data[WIDTH-1:0] :
    (do_pop) ? head_raw_data[WIDTH-1:0] :
              headreg_ff[WIDTH-1:0];
wire  valid_filt = valid &&
      ((valid_filt_ff && ~do_pop) || ~in_block_outvalid);

always @(posedge Clk) begin
  in_ptr_ff[DEPTHBITS-1:0]  <= (Rst_n) ? in_ptr[DEPTHBITS-1:0] : 'h0;
  out_ptr_ff[DEPTHBITS-1:0] <= (Rst_n) ? out_ptr[DEPTHBITS-1:0] : ((HEADREG) ? 'h1 : 'h0);
  depth_ff[DEPTHBITS:0]     <= (Rst_n) ? depth[DEPTHBITS:0] : 'h0;
  valid_ff                  <= (Rst_n) ? valid : 1'b0;
  valid_filt_ff             <= (Rst_n) ? valid_filt : 1'b0;
  full_ff                   <= (Rst_n) ? full : 1'b0;
  notfull_ff                <= (Rst_n) ? notfull : 1'b0;
  headreg_ff[WIDTH-1:0]     <= (Rst_n) ? headreg[WIDTH-1:0] : 'h0;
end

integer i;
always @(posedge Clk) begin
  if(in_push) begin
    data_ff[in_ptr_ff[DEPTHBITS-1:0]] <= in_data[WIDTH-1:0];
  end
end

wire [WIDTH-1:0] out_data_pre = (HEADREG) ? headreg_ff[WIDTH-1:0] :
              raw_data[WIDTH-1:0];
assign out_data[WIDTH-1:0]    = (ZERO_INVALID && ~valid_filt_ff) ?
      in_invalid_data[WIDTH-1:0] : out_data_pre[WIDTH-1:0];
assign out_valid              = valid_filt_ff;
assign out_notfull            = notfull_ff;
assign out_overflow           = depth_ff[DEPTHBITS];
assign out_depth              = depth_ff[DEPTHBITS-1:0];

endmodule
