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
// Filename:       axi_traffic_gen_v2_0_10_ex_fifo.v
// Version : v1.0
// Description:    FIFO used on all address/data channels to store/forward
// address/data/control information.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------

`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_ex_fifo
        #(
  parameter WIDTH        = 10,
  parameter DEPTH        = 8 ,
  parameter DEPTHBITS    = 3 ,
  parameter HEADREG      = 1 ,
  parameter ZERO_INVALID = 0 ,
  parameter FULL_LEVEL   = 6 ,
  parameter BLOCK_ACTIVE = 0 //Ability to block notfull and valid 
        ) (
  input              Clk              ,
  input              rst_l            ,
  input [WIDTH-1:0]  in_data          ,
  input              in_push          ,
  input              in_pop           ,
  //input              in_block_notfull ,
  //input              in_block_outvalid,
  output [WIDTH-1:0] out_data         ,
  output             is_full          ,
  output             is_notfull       ,
  output             is_empty         ,
  output             out_valid        ,
  
  output [15:0] ex_fifo_dbgout

);
(* max_fanout = 500 *) wire reset_l_reg;
assign reset_l_reg = rst_l;

reg [WIDTH-1:0    ] data_ff[DEPTH-1:0];
reg [DEPTHBITS-1:0] out_ptr_ff;
reg [DEPTHBITS-1:0] in_ptr_ff;
reg [DEPTHBITS:0  ] depth_ff;
reg [WIDTH-1:0    ] headreg_ff;
reg full_ff, notfull_ff, valid_ff, valid_filt_ff;

wire [DEPTHBITS-1:0] in_ptr = (in_push) ? in_ptr_ff[DEPTHBITS-1:0] + 'h1 :
                                                in_ptr_ff[DEPTHBITS-1:0];
wire [DEPTHBITS:0] depth =
                (in_push && ~in_pop) ? depth_ff[DEPTHBITS:0] + 'h1 :
                (~in_push && in_pop) ? depth_ff[DEPTHBITS:0] - 'h1 :
                                                        depth_ff[DEPTHBITS:0];
wire        depth_was1 = (depth_ff[DEPTHBITS:0] == 'h1);
wire        valid = (depth[DEPTHBITS:0] != 'h0);
wire        full ;
generate if(BLOCK_ACTIVE == 1 ) begin : BLOCK_ACTIVE_FULL_YES
// assign full = (depth[DEPTHBITS:0] >= FULL_LEVEL) || in_block_notfull;
end
endgenerate
generate if(BLOCK_ACTIVE == 0 ) begin : BLOCK_ACTIVE_FULL_NO
 assign full = (depth[DEPTHBITS:0] >= FULL_LEVEL) ;
end
endgenerate

wire        notfull = ~full;
wire [WIDTH-1:0] raw_data = data_ff[out_ptr_ff[DEPTHBITS-1:0]];

wire [DEPTHBITS-1:0] out_ptr = (in_pop) ? out_ptr_ff[DEPTHBITS-1:0] + 'h1 :
                                                out_ptr_ff[DEPTHBITS-1:0];

wire [WIDTH-1:0] head_raw_data = (depth_was1) ? in_data[WIDTH-1:0] :
                                                        raw_data[WIDTH-1:0];
wire [WIDTH-1:0] headreg = (!valid_ff && in_push) ? in_data[WIDTH-1:0] :
                (in_pop) ? head_raw_data[WIDTH-1:0] : headreg_ff[WIDTH-1:0];

wire        valid_filt ;
generate if(BLOCK_ACTIVE == 1 ) begin : BLOCK_ACTIVE_VALID_YES
// assign valid_filt = valid &&
//                        ((valid_filt_ff && ~in_pop) || ~in_block_outvalid);
end
endgenerate
generate if(BLOCK_ACTIVE == 0 ) begin : BLOCK_ACTIVE_VALID_NO
 assign valid_filt = valid ;
                        // Deassert output valid sometimes, without changing
                        //  internal valid logic.  Do not deassert valid once
                        //  its been asserted, until other agent drives ready
end
endgenerate

always @(posedge Clk) begin
        in_ptr_ff[DEPTHBITS-1:0]  <= (reset_l_reg) ? in_ptr[DEPTHBITS-1:0] : {DEPTHBITS{1'b0}};
        out_ptr_ff[DEPTHBITS-1:0] <= (reset_l_reg) ? out_ptr[DEPTHBITS-1:0] :
                                                ((HEADREG) ? {{(DEPTHBITS-1){1'b0}},{1'b1}} : {DEPTHBITS{1'b0}});
        depth_ff[DEPTHBITS:0]     <= (reset_l_reg) ? depth[DEPTHBITS:0] : {DEPTHBITS{1'b0}};
        valid_ff                  <= (reset_l_reg) ? valid : 1'b0;
        valid_filt_ff             <= (reset_l_reg) ? valid_filt : 1'b0;
        full_ff                   <= (reset_l_reg) ? full : 1'b1;
        notfull_ff                <= (reset_l_reg) ? notfull : 1'b0;
        headreg_ff[WIDTH-1:0]     <= (reset_l_reg) ? headreg[WIDTH-1:0] : {WIDTH{1'b0}};
end

integer i;
always @(posedge Clk) begin
        if(in_push) begin
                data_ff[in_ptr_ff[DEPTHBITS-1:0]] <= in_data[WIDTH-1:0];
        end

`ifdef FOO_BAR
        for(i = 0; i < DEPTH; i = i + 1) begin
                if(~reset_l_reg && (HEADREG == 0)) begin
                        data_ff[i] <= {WIDTH{1'b0}};
                end else if((i == in_ptr_ff[DEPTHBITS-1:0]) && in_push) begin
                        data_ff[i] <= in_data[WIDTH-1:0];
                end
        end
`endif
end


assign out_data[WIDTH-1:0] = (ZERO_INVALID && ~valid_filt_ff) ? { WIDTH {1'b0}}:
                                (HEADREG) ? headreg_ff[WIDTH-1:0] :
                                                        raw_data[WIDTH-1:0];
assign out_valid  = valid_filt_ff;
assign is_full    = full_ff      ;
assign is_notfull = notfull_ff   ;
assign is_empty   = ~valid_ff    ;


assign ex_fifo_dbgout = 16'b0 | depth_ff;


endmodule

