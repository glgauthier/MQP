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
// Filename:       axi_traffic_gen_v2_0_10_addrgen.v
// Version : v1.0
// Description:    Generates address for the next beat in the transfer.
//                 used to index mstram to read/write data.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_addrgen
 #(
parameter USE_ADDR_OFFSET    = 0,
parameter C_DATA_WIDTH       = 64,
parameter IS_READ            = 1,
parameter C_ATG_BASIC_AXI4   = 1,
parameter C_ATG_AXI4LITE     = 0
  ) (
input             Clk                ,
input             rst_l              ,
input  [15:0]      in_addr           ,
input  [8:0]       in_addr_offset    ,
input  [15:0]      in_id             ,
input  [7:0]       in_len            ,
input  [2:0]       in_size           ,
input  [5:0]       in_lastaddr       ,
input  [1:0]       in_burst          ,
input              in_push           ,
input              in_pop            ,
input  [0:0]       in_user           ,
output [0:0]       out_user          ,
output [15:0]               out_addr ,
output [15:0]               out_id   ,
output [C_DATA_WIDTH/8-1:0] out_be   ,
output                      out_done ,
output                      out_valid
);

localparam ADDR_BITS = (C_DATA_WIDTH == 32 ) ? 2 :
                       (C_DATA_WIDTH == 64 ) ? 3 :
                       (C_DATA_WIDTH == 128) ? 4 : 
                       (C_DATA_WIDTH == 256) ? 5 : 6;
reg  [15:0              ] addr_ff       ;
reg  [7:0               ] len_ff        ;
reg  [C_DATA_WIDTH/8-1:0] be_ff         ;
reg  [2:0               ] size_ff       ;
reg  [1:0               ] burst_ff      ;
reg  [ADDR_BITS-1:0     ] lastaddr_ff   ;
reg  [11:0              ] wrap_mask_ff  ;
reg  [11:0              ] addr_offset_ff;
reg  [15:0              ] addr_base_ff  ;
reg  [15:0              ] id_ff         ;
reg  [0:0               ] user_ff       ;
reg  done_ff, valid_ff                  ;
wire [2:0               ] size_opt      ;
generate if(C_ATG_BASIC_AXI4 == 0)  begin : ATG_NARROW_YES
 assign size_opt = in_size;
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1)  begin : ATG_NARROW_NO
  if(C_DATA_WIDTH == 32) begin
     assign size_opt = 2 ;
  end
  if(C_DATA_WIDTH == 64) begin
    assign  size_opt = 3 ;
  end
  if(C_DATA_WIDTH == 128) begin
    assign  size_opt = 4 ;
  end
  if(C_DATA_WIDTH == 256) begin
    assign  size_opt = 5 ;
  end
  if(C_DATA_WIDTH == 512) begin
    assign  size_opt = 6 ;
  end
end
endgenerate

wire [0:0] user  = (in_push) ? in_user : user_ff;
wire [2:0] size  = (in_push) ? size_opt[2:0] : size_ff[2:0];
wire [1:0] burst = (in_push) ? in_burst[1:0] : burst_ff[1:0];
wire [15:0] id   = (in_push) ? in_id[15:0] : id_ff[15:0];


wire [4:0] mask_raw ;
wire [8:0] wrap_mask_raw ;
wire [11:0] wrap_mask ;
wire [8:0] addr_offset_new ;
wire [12:0] addr_in_masked ;
wire [12:0] addr_off_masked ;
wire [12:0] addr_base_add_pre ;
wire [12:0] addr_base_add ;
wire [6:0] inc ;
wire [15:0] addr_mask_pre ;
wire [15:0] addr_mask2 ;
wire [15:0] addr_mask ;
wire [12:0] addr_aligned_pre ;
wire [15:0] addr_aligned ;
wire [11:0] addr_offset_inced_pre ;
wire [11:0] addr_offset_inced ;
wire [15:0] addr_inced ;
wire [15:0] addr_base ;
wire [15:0] addr ;
wire [11:0] addr_offset ;
wire [7:0] len ;
generate if(C_ATG_BASIC_AXI4 == 0 && C_ATG_AXI4LITE == 0) begin : ATG_WRAP_FIXED_YES
assign mask_raw = (8'h1 << size_opt[2:0]) - 8'h1;
assign wrap_mask_raw = (in_len[3]) ? { mask_raw[4:0], 4'b1111 } :
    (in_len[2]) ? { mask_raw[4:0], 3'b111 } :
    (in_len[1]) ? { 1'b0, mask_raw[4:0], 2'b11 } :
            { 2'b00, mask_raw[4:0], 1'b1 };
assign wrap_mask = (in_push) ?
    ((in_burst[1]) ? { 3'h0, wrap_mask_raw[8:0] } :
      (in_burst[0]) ? 12'hfff : 12'h0) :
          wrap_mask_ff[11:0];
assign addr_offset_new = (in_burst[1]) ?
      in_addr_offset[8:0] & wrap_mask_raw[8:0] : 9'h00;
assign addr_in_masked = { 4'h0, in_addr[8:0] & wrap_mask_raw[8:0] };
assign addr_off_masked = { 4'h0, in_addr_offset[8:0] & wrap_mask_raw[8:0]};
assign addr_base_add_pre = addr_in_masked[12:0] - addr_off_masked[12:0];
assign addr_base_add = (in_burst[1] && USE_ADDR_OFFSET) ?
          addr_base_add_pre[12:0] : 13'h00;
assign inc = 7'h1 << size_ff[2:0];
assign addr_mask_pre = 16'hffff << size_opt[2:0];
assign addr_mask2 = (in_burst[1]) ? { 7'h0, wrap_mask_raw[8:0] } : 16'h0;
assign addr_mask = addr_mask_pre[15:0] & ~addr_mask2[15:0];
assign addr_aligned_pre = (in_addr[12:0] & addr_mask[12:0]) +
              addr_base_add[12:0];
assign addr_aligned = { in_addr[15:13], addr_aligned_pre[12:0] };

assign addr_offset_inced_pre = addr_offset_ff[11:0] + { 5'h0, inc[6:0] };
assign addr_offset_inced = (addr_offset_ff[11:0] & ~wrap_mask_ff[11:0]) |
      (addr_offset_inced_pre[11:0] & wrap_mask_ff[11:0]);
assign addr_inced = addr_base_ff[15:0] + { 4'h0, addr_offset_inced[11:0]};
assign addr_base = (in_push) ? addr_aligned[15:0] : addr_base_ff[15:0];
assign addr = (in_push) ? in_addr[15:0] :
    (in_pop) ? { addr_base_ff[15:13], addr_inced[12:0] } :
                addr_ff[15:0];
assign addr_offset = (in_push) ? { 3'h0, addr_offset_new[8:0] } :
    (in_pop) ? addr_offset_inced[11:0] : addr_offset_ff[11:0];
end
assign len = (in_push) ? in_len[7:0] :
      (in_pop) ? len_ff[7:0] - 8'h1 : len_ff[7:0];
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1 && C_ATG_AXI4LITE == 0) begin : ATG_WRAP_FIXED_NO
assign inc               = 7'h1 << size_ff[2:0];
assign addr_offset_inced = addr_offset_ff[11:0] + { 5'h0, inc[6:0] };
assign addr_inced        = addr_base_ff[15:0] + { 4'h0, addr_offset_inced[11:0]};
assign addr_base         = (in_push) ? in_addr[15:0] : addr_base_ff[15:0];
assign addr_offset = (in_push) ? 12'h0 : (in_pop) ? addr_offset_inced[11:0] : addr_offset_ff[11:0];
assign addr              = (in_push) ? in_addr[15:0] :
                           (in_pop)  ? { addr_base_ff[15:13], addr_inced[12:0] } :
                            addr_ff[15:0];
assign len               = (in_push) ? in_len[7:0] :
      (in_pop) ? len_ff[7:0] - 8'h1 : len_ff[7:0];
end
endgenerate
generate if(C_ATG_AXI4LITE == 1) begin : ATG_AXI4LITE
assign addr = (in_push) ? in_addr[15:0] :  addr_ff[15:0];
assign len = 8'h0;
end
endgenerate


wire  done = (len[7:0] == 8'h0);
wire [C_DATA_WIDTH/8-1:0] be;
wire [ADDR_BITS-1:0] lastaddr ;
wire [C_DATA_WIDTH/8-1:0] be_mask0 ;
wire [6:0] be_mask_size ;
wire [ADDR_BITS-1:0] be_shift ;
wire [ADDR_BITS-1:0] be_shift2 ;
wire [C_DATA_WIDTH/8-1:0] be_mask_shift ;
wire [C_DATA_WIDTH/8-1:0] be_notlast ;
wire [C_DATA_WIDTH/8-1:0] be_last ;
generate if(C_ATG_BASIC_AXI4 == 0)  begin : ATG_STRB_YES
 assign lastaddr = (in_push) ? in_lastaddr[ADDR_BITS-1:0] :
            lastaddr_ff[ADDR_BITS-1:0];

 assign be_mask0 = (64'h1 << (7'h1 << size[2:0])) - 64'h1;
    // So size==0 -> (1 << 1) - 1 = 1
    // size==1 -> (1 << 2) - 1 = 3
    // size==2 -> (1 << 4) - 1 = 0xf
    // size==3 -> (1 << 8) - 1 = 0xff
    // size==4 -> (1 << 16) - 1 = 0xffff
    // size==5 -> (1 << 32) - 1 = 0xffffffff
    // size==6 -> (1 << 64) - 1 = 0xffff_ffff_ffff_ffff
 assign be_mask_size = (7'h1 << size[2:0]) - 7'h1;
 assign be_shift = be_mask_size[6:0] & addr[6:0];
 assign be_shift2 = ~be_mask_size[6:0] & addr[6:0];
 assign be_mask_shift =
        (64'hffffffff_ffffffff << be_shift[ADDR_BITS-1:0]);
 assign be_notlast =
  (be_mask_shift[C_DATA_WIDTH/8-1:0] & be_mask0[C_DATA_WIDTH/8-1:0]) <<
            be_shift2[ADDR_BITS-1:0];
assign be_last = (lastaddr[ADDR_BITS-1:0] == 'h0) ?
    64'hffffffff_ffffffff : (64'h1 << lastaddr[ADDR_BITS-1:0]) - 64'h1;
  assign be = (done) ? be_notlast[C_DATA_WIDTH/8-1:0] &
    be_last[C_DATA_WIDTH/8-1:0] : be_notlast[C_DATA_WIDTH/8-1:0];
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1)  begin : ATG_STRB_NO
 assign be = {C_DATA_WIDTH/8{1'b1}};
end
endgenerate

wire  complete = in_pop && done_ff;
wire  valid = in_push || (~complete && valid_ff);
generate if(C_ATG_BASIC_AXI4 == 0)  begin : ATG_FF_0
always @(posedge Clk) begin
  addr_ff[15:0]              <= (rst_l) ? addr[15:0] : 16'h0           ;
  addr_base_ff[15:0]         <= (rst_l) ? addr_base[15:0] : 16'h0      ;
  addr_offset_ff[11:0]       <= (rst_l) ? addr_offset[11:0] : 12'h0    ;
  wrap_mask_ff[11:0]         <= (rst_l) ? wrap_mask[11:0] : 12'hfff    ;
  id_ff[15:0]                <= (rst_l) ? id[15:0] : 16'h0             ;
  user_ff[0:0]               <= (rst_l) ? user[0:0] : 1'h0             ;
  size_ff[2:0]               <= (rst_l) ? size[2:0] : 3'b000           ;
  burst_ff[1:0]              <= (rst_l) ? burst[1:0] : 2'b00           ;
  len_ff[7:0]                <= (rst_l) ? len[7:0] : 8'h0              ;
  be_ff[C_DATA_WIDTH/8-1:0]  <= (rst_l) ? be[C_DATA_WIDTH/8-1:0] : 'h0 ;
  lastaddr_ff[ADDR_BITS-1:0] <= (rst_l) ? lastaddr[ADDR_BITS-1:0] : 'h0;
  done_ff                    <= (rst_l) ? done : 1'b0                  ;
  valid_ff                   <= (rst_l) ? valid : 1'b0                 ;
end
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1)  begin : ATG_FF_1
always @(posedge Clk) begin
  addr_offset_ff[11:0]       <= (rst_l) ? addr_offset[11:0] : 12'h0    ;
  addr_base_ff[15:0]         <= (rst_l) ? addr_base[15:0] : 16'h0      ;
  addr_ff[15:0]              <= (rst_l) ? addr[15:0] : 16'h0           ;
  size_ff[2:0]               <= (rst_l) ? size[2:0] : 3'b000           ;
  id_ff[15:0]                <= (rst_l) ? id[15:0] : 16'h0             ;
  len_ff[7:0]                <= (rst_l) ? len[7:0] : 8'h0              ;
  be_ff[C_DATA_WIDTH/8-1:0]  <= (rst_l) ? be[C_DATA_WIDTH/8-1:0] : 'h0 ;
  valid_ff                   <= (rst_l) ? valid : 1'b0                 ;
  done_ff                    <= (rst_l) ? done : 1'b0                  ;
  user_ff[0:0]               <= (rst_l) ? user[0:0] : 1'h0             ;
end
end
endgenerate

assign out_addr[15:0]             = addr_ff[15:0]            ;
assign out_id[15:0]               = id_ff[15:0]              ;
assign out_be[C_DATA_WIDTH/8-1:0] = be_ff[C_DATA_WIDTH/8-1:0];
assign out_valid                  = valid_ff                 ;
assign out_done                   = done_ff                  ;
assign out_user                   = user_ff                  ;
endmodule

