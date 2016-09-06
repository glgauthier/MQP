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
// Filename:       axi_traffic_gen_v2_0_10_id_track.v
// Version : v1.0
// Description:    To track the id received against the stored id.
// ARID and RID are tracked in case of read operations.
// AWID and BID are tracked in case of write operations.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------

`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_id_track
        #(
parameter ID_WIDTH = 1
) (
  input                 Clk           ,
  input                 rst_l         ,
  input [ID_WIDTH-1:0]  in_push_id    ,
  input                 in_push       ,
  input [ID_WIDTH-1:0]  in_search_id  ,
  input [3:0]           in_clear_pos  ,
  input                 in_only_entry0,
  output [3:0]          out_push_pos  ,
  output [3:0]          out_search_hit,
  output [3:0]          out_free
);

reg [ID_WIDTH:0] id_arr0_ff, id_arr1_ff, id_arr2_ff, id_arr3_ff;
reg [3:0] push_pos_ff, push_pos_2ff;
reg [3:0] in_clear_pos_ff;

wire [ID_WIDTH:0] push_id = { 1'b1, in_push_id[ID_WIDTH-1:0] };
wire [3:0] push_search = { (push_id[ID_WIDTH:0] == id_arr3_ff[ID_WIDTH:0]),
                        (push_id[ID_WIDTH:0] == id_arr2_ff[ID_WIDTH:0]),
                        (push_id[ID_WIDTH:0] == id_arr1_ff[ID_WIDTH:0]),
                        (push_id[ID_WIDTH:0] == id_arr0_ff[ID_WIDTH:0]) };

wire [3:0] free_pre = { ~id_arr3_ff[ID_WIDTH], ~id_arr2_ff[ID_WIDTH],
                        ~id_arr1_ff[ID_WIDTH], ~id_arr0_ff[ID_WIDTH] };
wire [3:0] free = (in_only_entry0) ? { 3'b000, free_pre[0] } : free_pre[3:0];
wire [3:0] first_free = (free[0]) ? 4'h1 :
                        (free[1]) ? 4'h2 :
                        (free[2]) ? 4'h4 :
                        (free[3]) ? 4'h8 : 4'h0;

wire [3:0] push_pos = (in_push == 1'b0) ? 4'h0 :
                (push_search[3:0] != 4'h0) ? push_search[3:0] :
                        first_free[3:0];

wire [ID_WIDTH:0] search_id = { 1'b1, in_search_id[ID_WIDTH-1:0] };
wire [3:0] search_pos = { (search_id[ID_WIDTH:0] == id_arr3_ff[ID_WIDTH:0]),
                        (search_id[ID_WIDTH:0] == id_arr2_ff[ID_WIDTH:0]),
                        (search_id[ID_WIDTH:0] == id_arr1_ff[ID_WIDTH:0]),
                        (search_id[ID_WIDTH:0] == id_arr0_ff[ID_WIDTH:0]) };

wire [3:0] do_clear = ~push_pos_ff[3:0] & ~push_pos_2ff[3:0] &
                                                in_clear_pos_ff[3:0];

wire [ID_WIDTH:0] id_arr0 = (push_pos[0]) ? push_id[ID_WIDTH:0] :
        { (do_clear[0]) ? 1'b0:id_arr0_ff[ID_WIDTH], id_arr0_ff[ID_WIDTH-1:0] };
wire [ID_WIDTH:0] id_arr1 = (push_pos[1]) ? push_id[ID_WIDTH:0] :
        { (do_clear[1]) ? 1'b0:id_arr1_ff[ID_WIDTH], id_arr1_ff[ID_WIDTH-1:0] };
wire [ID_WIDTH:0] id_arr2 = (push_pos[2]) ? push_id[ID_WIDTH:0] :
        { (do_clear[2]) ? 1'b0:id_arr2_ff[ID_WIDTH], id_arr2_ff[ID_WIDTH-1:0] };
wire [ID_WIDTH:0] id_arr3 = (push_pos[3]) ? push_id[ID_WIDTH:0] :
        { (do_clear[3]) ? 1'b0:id_arr3_ff[ID_WIDTH], id_arr3_ff[ID_WIDTH-1:0] };

always @(posedge Clk) begin
        id_arr0_ff[ID_WIDTH:0] <= (rst_l) ? id_arr0[ID_WIDTH:0] : 1'b0;
        id_arr1_ff[ID_WIDTH:0] <= (rst_l) ? id_arr1[ID_WIDTH:0] : 1'b0;
        id_arr2_ff[ID_WIDTH:0] <= (rst_l) ? id_arr2[ID_WIDTH:0] : 1'b0;
        id_arr3_ff[ID_WIDTH:0] <= (rst_l) ? id_arr3[ID_WIDTH:0] : 1'b0;
        push_pos_ff[3:0] <= (rst_l) ? push_pos[3:0] : 4'h0;
        push_pos_2ff[3:0] <= (rst_l) ? push_pos_ff[3:0] : 4'h0;
        in_clear_pos_ff[3:0] <= (rst_l) ? in_clear_pos[3:0] : 4'h0;
end

assign out_search_hit[3:0] = search_pos[3:0];
assign out_push_pos[3:0] = push_pos[3:0];
assign out_free[3:0] = free[3:0];






endmodule
