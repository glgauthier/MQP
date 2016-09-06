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
// Filename:       axi_traffic_gen_v2_0_10_s_r_channel.v
// Version : v1.0
// Description:    slave interface read channel.Read requests are processed to
// output the desired read data.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
//Specific WARNINGs moved to INFO by Vivado Synthesis Tool
`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_s_r_channel 
# (
  parameter C_BASEADDR           = 32'hffffffff,
  parameter C_HIGHADDR           = 32'h00000000,
  parameter C_ZERO_INVALID       = 1           ,
  parameter C_NO_EXCL            = 0           ,
  parameter C_S_AXI_ID_WIDTH     = 1           ,
  parameter C_S_AXI_ARUSER_WIDTH = 8           ,
  parameter C_S_AXI_DATA_WIDTH   = 32          ,
  parameter C_ATG_BASIC_AXI4     = 1           ,
  parameter C_ATG_AXI4LITE       = 0            

) (
// system
 input                                Clk                ,
 input                                rst_l              ,
//AR
 input [C_S_AXI_ID_WIDTH-1:0]         arid_s             ,
 input [31:0]                         araddr_s           ,
 input [7:0]                          arlen_s            ,
 input [2:0]                          arsize_s           ,
 input [1:0]                          arburst_s          ,
 input [0:0]                          arlock_s           ,
 input [3:0]                          arcache_s          ,
 input [2:0]                          arprot_s           ,
 input [3:0]                          arqos_s            ,
 input [C_S_AXI_ARUSER_WIDTH-1:0]     aruser_s           ,
 input                                arvalid_s          ,
 output                               arready_s          ,
//R
 output [C_S_AXI_ID_WIDTH-1:0]        rid_s              ,
 output                               rlast_s            ,
 output [C_S_AXI_DATA_WIDTH-1:0]      rdata_s            ,
 output [1:0]                         rresp_s            ,
 output                               rvalid_s           ,
 input                                rready_s           ,

// Register block
 input                                reg1_sgl_slv_rd    ,
 output [15:0]                        rd_reg_decode      ,
 input [31:0]                         rd_reg_data_raw    ,
 input                                reg1_disallow_excl ,
 output reg                           rddec6_valid_ff    ,
//sw channel
 output reg [71:0]                    slv_ex_info0_ff    ,
 input                                slv_ex_valid0_ff   ,
 output reg [71:0]                    slv_ex_info1_ff    , 
 output[71:0]                         slv_ex_info1       , 
 input                                slv_ex_valid1_ff   ,
 output reg                           slv_ex_toggle_ff   , 
 output                               slv_ex_new_valid0  ,
 output                               slv_ex_new_valid1  ,
 output [15:0]                        ar_agen_addr       ,
 input [C_S_AXI_DATA_WIDTH-1:0]       slvram_rd_out      ,
//axi addressram
 input  [31:0]                        addrram_rd_out     ,
//axi_traffic_gen_v2_0_10_cmdram input
 output [15:0]                        ar_agen0_addr      ,
 output                               ar_agen0_valid_out ,
 output                               arfifo_valid       ,
 output [71:0]                        arfifo_out         ,
 input [127:0]                        cmd_out_mr_i 
);


wire [31:0] base_addr = C_BASEADDR;
wire [31:0] high_addr = C_HIGHADDR;
wire [31:0] addr_mask = base_addr[31:0] ^ high_addr[31:0];

//wire [7:0] arlen8_s = arlen_s[7:0] | { 4'h0, arlen3_s[3:0] };
wire [7:0] arlen8_s = arlen_s[7:0] ;

wire [31:0] ar_addr_masked = araddr_s[31:0] & addr_mask[31:0];
//Address re-mapped
//wire        ar_isslvram = (ar_addr_masked[22:16] != 'h0);
wire        ar_isslvram = (ar_addr_masked[15:14] == 2'b11);
wire        ar_iscmd = ~ar_isslvram && araddr_s[15] && ~araddr_s[13];
wire [15:0] arbuf_id = arid_s[C_S_AXI_ID_WIDTH-1:0];
wire [71:0] arbuf_data = {
                arbuf_id[15:0],                                             //71:56
                ar_isslvram, ar_iscmd, arprot_s[2:0], arsize_s[2:0],        //55:48
                arburst_s[1:0], 1'b0,arlock_s[0:0], arcache_s[3:0],         //47:40 //arlock made 1-bit
                arlen8_s[7:0],                                              //39:32
                araddr_s[31:0] };                                           //31:0

wire        ar_agen0_valid, ar_agen1_valid, ar_agen2_valid, ar_agen3_valid;

wire        arfifo_notfull;
wire        arfifo_push = arvalid_s && arready_s;
wire        arfifo_pop;

assign ar_agen0_valid_out = ar_agen0_valid;

axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH     (72),
  .DEPTH     (8 ),
  .DEPTHBITS (3 ),
  .HEADREG   (1 ),
  .FULL_LEVEL(6 )
) Arfifo (
        .Clk              (Clk              ),
        .rst_l            (rst_l            ),
        .in_data          (arbuf_data[71:0] ),
        .in_push          (arfifo_push      ),
        .in_pop           (arfifo_pop       ),
        .out_data         (arfifo_out[71:0] ),
        .is_full          (                 ),
        .is_notfull       (arfifo_notfull   ),
        .is_empty         (                 ),
        .out_valid        (arfifo_valid     ),
        .ex_fifo_dbgout   (                 ) 
);

assign arready_s = arfifo_notfull;


wire [1:0]  arfifo_out_lock   = arfifo_out[45:44];
wire [71:0] slv_new_ex_info   = arfifo_out[71:0];
wire        slv_ex_new_valid  ;
wire        slv_ex_must_wr0   ;
wire        slv_ex_must_wr1   ;
wire        slv_ex_use_toggle ;
wire        slv_ex_choose1    ;
wire        slv_ex_toggle     ;
wire [71:0] slv_ex_info0      ;
wire [1:0]  ar_calc_resp      ;
generate if(C_NO_EXCL == 0) begin : S_R_EXCL_0
assign        slv_ex_new_valid = arfifo_valid && (arfifo_out_lock[1:0] == 2'b01) &&
                                                        (C_NO_EXCL == 0);

assign  slv_ex_must_wr0 = ~slv_ex_valid0_ff ||
                        (slv_ex_info0_ff[71:56] == slv_new_ex_info[71:56]);
assign  slv_ex_must_wr1 = ~slv_ex_valid1_ff ||
                        (slv_ex_info1_ff[71:56] == slv_new_ex_info[71:56]);
assign  slv_ex_use_toggle = ~slv_ex_must_wr0 && ~slv_ex_must_wr1;
assign  slv_ex_choose1 = (slv_ex_use_toggle) ? slv_ex_toggle_ff :
                                                        slv_ex_must_wr1;
assign  slv_ex_new_valid0 = slv_ex_new_valid && ~slv_ex_choose1;
assign  slv_ex_new_valid1 = slv_ex_new_valid && slv_ex_choose1;

assign  slv_ex_toggle = (slv_ex_use_toggle && slv_ex_new_valid) ?
                        ~slv_ex_toggle_ff : slv_ex_toggle_ff;

assign  slv_ex_info0 = (slv_ex_new_valid0) ? slv_new_ex_info[71:0] :
                                                        slv_ex_info0_ff[71:0];
assign  slv_ex_info1 = (slv_ex_new_valid1) ? slv_new_ex_info[71:0] :
                                                        slv_ex_info1_ff[71:0];
assign  ar_calc_resp = (arfifo_out_lock[1:0] == 2'b01) ? 2'b01 : 2'b00;

end
endgenerate
generate if(C_NO_EXCL == 1) begin : S_R_EXCL_1
assign  slv_ex_info0      = 72'h0;
assign  slv_ex_info1      = 72'h0;
assign  slv_ex_toggle     = 1'b0;
assign  slv_ex_new_valid0 = 1'b0;
assign  slv_ex_new_valid1 = 1'b0;
assign  ar_calc_resp      = 2'b00;
end
endgenerate

wire        ar_agen0_pop, ar_agen1_pop, ar_agen2_pop, ar_agen3_pop;
wire        ar_agen0_done, ar_agen1_done, ar_agen2_done, ar_agen3_done;

wire [3:0] artrk_fifo_num;
wire [C_S_AXI_ID_WIDTH-1:0] artrk_in_push_id = arfifo_out[71:56];
wire        ar_agen0_eff_valid = ar_agen0_valid && ~(ar_agen0_done && ar_agen0_pop);
wire        ar_agen1_eff_valid = ar_agen1_valid && ~(ar_agen1_done && ar_agen1_pop);
wire        ar_agen2_eff_valid = ar_agen2_valid && ~(ar_agen2_done && ar_agen2_pop);
wire        ar_agen3_eff_valid = ar_agen3_valid && ~(ar_agen3_done && ar_agen3_pop);
wire [3:0] ar_agen_eff_valid = { ar_agen3_eff_valid, ar_agen2_eff_valid,
                                ar_agen1_eff_valid, ar_agen0_eff_valid };
wire [3:0] ar_agen_push = ~ar_agen_eff_valid[3:0] & artrk_fifo_num[3:0];
wire [3:0] artrk_clear_pos = ~ar_agen_eff_valid[3:0];
assign        arfifo_pop = arfifo_valid && (ar_agen_push[3:0] != 4'h0);
wire dis_dis_out_of_order;
generate if(C_ATG_BASIC_AXI4 == 0)  begin : ATG_S_R_OOO_YES
  assign dis_dis_out_of_order = 1'b0;
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1)  begin : ATG_S_R_OOO_NO
  assign dis_dis_out_of_order = 1'b1;
end
endgenerate
axi_traffic_gen_v2_0_10_id_track #(
.ID_WIDTH(C_S_AXI_ID_WIDTH)
) Ar_track (
        .Clk           (Clk                                   ),
        .rst_l         (rst_l                                 ),
        .in_push_id    (artrk_in_push_id[C_S_AXI_ID_WIDTH-1:0]),
        .in_push       (arfifo_valid                          ),
        .in_search_id  ({ C_S_AXI_ID_WIDTH { 1'b0 } }         ),
        .in_clear_pos  (artrk_clear_pos[3:0]                  ),
        .in_only_entry0(dis_dis_out_of_order                  ),
        .out_push_pos  (artrk_fifo_num[3:0]                   ),
        .out_search_hit(                                      ),
        .out_free      (                                      )
);


wire [3:0] arbuf_wrsel = (arfifo_pop) ? ar_agen_push[3:0] : 4'h0;

wire [15:0] ar_agen0_id;
wire [C_S_AXI_DATA_WIDTH/8-1:0] ar_agen0_be;

axi_traffic_gen_v2_0_10_addrgen #(
  .USE_ADDR_OFFSET (0)                 ,
  .C_DATA_WIDTH    (C_S_AXI_DATA_WIDTH),
  .IS_READ         (1)                 ,
  .C_ATG_BASIC_AXI4(C_ATG_BASIC_AXI4)  ,
  .C_ATG_AXI4LITE  (C_ATG_AXI4LITE)    
) Ar_agen0 (
        .Clk           (Clk                                     ),
        .rst_l         (rst_l                                   ),
        .in_addr       ({arfifo_out[55:54], arfifo_out[13:0]}   ),
        .in_addr_offset({1'b0,arfifo_out[7:0] }                 ),
        .in_id         ({ ar_calc_resp[1:0], arfifo_out[69:56] }),
        .in_len        (arfifo_out[39:32]                       ),
        .in_size       (arfifo_out[50:48]                       ),
        .in_lastaddr   (6'b000000                               ),
        .in_burst      (arfifo_out[47:46]                       ),
        .in_push       (arbuf_wrsel[0]                          ),
        .in_pop        (ar_agen0_pop                            ),
        .in_user       (1'b0                                    ),
        .out_user      (                                        ),
        .out_addr      (ar_agen0_addr[15:0]                     ),
        .out_be        (ar_agen0_be[C_S_AXI_DATA_WIDTH/8-1:0]   ),
        .out_id        (ar_agen0_id[15:0]                       ),
        .out_done      (ar_agen0_done                           ),
        .out_valid     (ar_agen0_valid                          )
);

wire [15:0] ar_agen1_addr, ar_agen1_id;
wire [C_S_AXI_DATA_WIDTH/8-1:0] ar_agen1_be;
wire [15:0] ar_agen2_addr, ar_agen2_id;
wire [C_S_AXI_DATA_WIDTH/8-1:0] ar_agen2_be;
wire [15:0] ar_agen3_addr, ar_agen3_id;
wire [C_S_AXI_DATA_WIDTH/8-1:0] ar_agen3_be;
generate if(C_ATG_BASIC_AXI4 == 1)  begin : ATG_S_R_OOO_F_NO
 assign ar_agen1_done  = 1'b0;
 assign ar_agen2_done  = 1'b0;
 assign ar_agen3_done  = 1'b0;
 assign ar_agen1_valid = 1'b0;
 assign ar_agen2_valid = 1'b0;
 assign ar_agen3_valid = 1'b0;
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 0)  begin : ATG_S_R_OOO_F_YES

axi_traffic_gen_v2_0_10_addrgen #(
  .USE_ADDR_OFFSET (0)                 ,
  .C_DATA_WIDTH    (C_S_AXI_DATA_WIDTH),
  .IS_READ         (1)                 ,
  .C_ATG_BASIC_AXI4(C_ATG_BASIC_AXI4)  ,
  .C_ATG_AXI4LITE  (C_ATG_AXI4LITE)    
) Ar_agen1 (
        .Clk           (Clk                                     ),
        .rst_l         (rst_l                                   ),
        .in_addr       ({arfifo_out[55:54], arfifo_out[13:0]}   ),
        .in_addr_offset({1'b0,arfifo_out[7:0] }                 ),
        .in_id         ({ ar_calc_resp[1:0], arfifo_out[69:56] }),
        .in_len        (arfifo_out[39:32]                       ),
        .in_size       (arfifo_out[50:48]                       ),
        .in_lastaddr   (6'b000000                               ),
        .in_burst      (arfifo_out[47:46]                       ),
        .in_push       (arbuf_wrsel[1]                          ),
        .in_pop        (ar_agen1_pop                            ),
        .in_user       (1'b0                                    ),
        .out_user      (                                        ),
        .out_addr      (ar_agen1_addr[15:0]                     ),
        .out_be        (ar_agen1_be[C_S_AXI_DATA_WIDTH/8-1:0]   ),
        .out_id        (ar_agen1_id[15:0]                       ),
        .out_done      (ar_agen1_done                           ),
        .out_valid     (ar_agen1_valid                          )
);


axi_traffic_gen_v2_0_10_addrgen #(
  .USE_ADDR_OFFSET (0)                 ,
  .C_DATA_WIDTH    (C_S_AXI_DATA_WIDTH),
  .IS_READ         (1)                 ,
  .C_ATG_BASIC_AXI4(C_ATG_BASIC_AXI4)  ,
  .C_ATG_AXI4LITE  (C_ATG_AXI4LITE)    
) Ar_agen2 (
        .Clk           (Clk                                     ),
        .rst_l         (rst_l                                   ),
        .in_addr       ({arfifo_out[55:54], arfifo_out[13:0]}   ),
        .in_addr_offset({1'b0,arfifo_out[7:0] }                 ),
        .in_id         ({ ar_calc_resp[1:0], arfifo_out[69:56] }),
        .in_len        (arfifo_out[39:32]                       ),
        .in_size       (arfifo_out[50:48]                       ),
        .in_lastaddr   (6'b000000                               ),
        .in_burst      (arfifo_out[47:46]                       ),
        .in_push       (arbuf_wrsel[2]                          ),
        .in_pop        (ar_agen2_pop                            ),
        .in_user       (1'b0                                    ),
        .out_user      (                                        ),
        .out_addr      (ar_agen2_addr[15:0]                     ),
        .out_be        (ar_agen2_be[C_S_AXI_DATA_WIDTH/8-1:0]   ),
        .out_id        (ar_agen2_id[15:0]                       ),
        .out_done      (ar_agen2_done                           ),
        .out_valid     (ar_agen2_valid                          )
);


axi_traffic_gen_v2_0_10_addrgen #(
  .USE_ADDR_OFFSET (0)                 ,
  .C_DATA_WIDTH    (C_S_AXI_DATA_WIDTH),
  .IS_READ         (1)                 ,
  .C_ATG_BASIC_AXI4(C_ATG_BASIC_AXI4)  ,
  .C_ATG_AXI4LITE  (C_ATG_AXI4LITE)    
) Ar_agen3 (
        .Clk           (Clk                                     ),
        .rst_l         (rst_l                                   ),
        .in_addr       ({arfifo_out[55:54], arfifo_out[13:0]}   ),
        .in_addr_offset({1'b0,arfifo_out[7:0] }                 ),
        .in_id         ({ ar_calc_resp[1:0], arfifo_out[69:56] }),
        .in_len        (arfifo_out[39:32]                       ),
        .in_size       (arfifo_out[50:48]                       ),
        .in_lastaddr   (6'b000000                               ),
        .in_burst      (arfifo_out[47:46]                       ),
        .in_push       (arbuf_wrsel[3]                          ),
        .in_pop        (ar_agen3_pop                            ),
        .in_user       (1'b0                                    ),
        .out_user      (                                        ),
        .out_addr      (ar_agen3_addr[15:0]                     ),
        .out_be        (ar_agen3_be[C_S_AXI_DATA_WIDTH/8-1:0]   ),
        .out_id        (ar_agen3_id[15:0]                       ),
        .out_done      (ar_agen3_done                           ),
        .out_valid     (ar_agen3_valid                          )
);

end
endgenerate
wire [3:0] ar_agen_sel ;
wire [15:0] ar_agen_id ;
wire [C_S_AXI_DATA_WIDTH/8-1:0] ar_agen_be ; 
wire        ar_agen_done ;
generate if(C_ATG_BASIC_AXI4 == 0)  begin : ATG_S_R1_OOO_F_YES
assign ar_agen_sel = (ar_agen3_valid) ? 4'h8 :
                        (ar_agen2_valid) ? 4'h4 :
                        (ar_agen1_valid) ? 4'h2 :
                        (ar_agen0_valid) ? 4'h1 : 4'h0;

assign ar_agen_addr = ((ar_agen_sel[0]) ? ar_agen0_addr[15:0] : 16'h0) |
                        ((ar_agen_sel[1]) ? ar_agen1_addr[15:0] : 16'h0) |
                        ((ar_agen_sel[2]) ? ar_agen2_addr[15:0] : 16'h0) |
                        ((ar_agen_sel[3]) ? ar_agen3_addr[15:0] : 16'h0);
assign ar_agen_id = ((ar_agen_sel[0]) ? ar_agen0_id[15:0] : 16'h0) |
                        ((ar_agen_sel[1]) ? ar_agen1_id[15:0] : 16'h0) |
                        ((ar_agen_sel[2]) ? ar_agen2_id[15:0] : 16'h0) |
                        ((ar_agen_sel[3]) ? ar_agen3_id[15:0] : 16'h0);
assign  ar_agen_be = 
                        ((ar_agen_sel[0]) ? ar_agen0_be[C_S_AXI_DATA_WIDTH/8-1:0] : {(C_S_AXI_DATA_WIDTH/8-1){1'b0}}) |
                        ((ar_agen_sel[1]) ? ar_agen1_be[C_S_AXI_DATA_WIDTH/8-1:0] : {(C_S_AXI_DATA_WIDTH/8-1){1'b0}}) |
                        ((ar_agen_sel[2]) ? ar_agen2_be[C_S_AXI_DATA_WIDTH/8-1:0] : {(C_S_AXI_DATA_WIDTH/8-1){1'b0}}) |
                        ((ar_agen_sel[3]) ? ar_agen3_be[C_S_AXI_DATA_WIDTH/8-1:0] : {(C_S_AXI_DATA_WIDTH/8-1){1'b0}}) ;
assign  ar_agen_done = ((ar_agen_sel[0]) ? ar_agen0_done : 1'b0) |
                        ((ar_agen_sel[1]) ? ar_agen1_done : 1'b0) |
                        ((ar_agen_sel[2]) ? ar_agen2_done : 1'b0) |
                        ((ar_agen_sel[3]) ? ar_agen3_done : 1'b0);
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1)  begin : ATG_S_R1_OOO_F_NO
assign ar_agen_sel =  (ar_agen0_valid) ? 4'h1 : 4'h0;

assign ar_agen_addr = ((ar_agen_sel[0]) ? ar_agen0_addr[15:0] : 16'h0) ;
assign ar_agen_id = ((ar_agen_sel[0]) ? ar_agen0_id[15:0] : 16'h0) ;
assign  ar_agen_be = 
                        ((ar_agen_sel[0]) ? ar_agen0_be[C_S_AXI_DATA_WIDTH/8-1:0] : {(C_S_AXI_DATA_WIDTH/8-1){1'b0}}) ;
assign  ar_agen_done = ((ar_agen_sel[0]) ? ar_agen0_done : 1'b0) ;

end
endgenerate
assign  rd_reg_decode = 16'h1 << ar_agen_addr[5:2];
wire        rd_reg_err = (ar_agen_addr[15:14] == 2'b00) && rd_reg_decode[13] &&
                                                        ar_agen_addr[7] && ~ar_agen_addr[13];
wire [1:0] rd_reg_rresp = (reg1_disallow_excl) ? 2'b00 :
                                (rd_reg_err) ? 2'b10 : ar_agen_id[15:14];

wire [56+C_S_AXI_DATA_WIDTH/8-1:0] rd_reg_data = { ar_agen_be[C_S_AXI_DATA_WIDTH/8-1:0],                                //63:56
                ar_agen_id[15:0],                                        //55:40
                ar_agen_addr[15:14], ar_agen_addr[3:2],                        //39:36
                1'b0, ar_agen_done, rd_reg_rresp[1:0],                        //35:32
                rd_reg_data_raw[31:0] };                                //31:0

wire        rdataout_full;
wire [C_S_AXI_DATA_WIDTH+24-1:0] rdata_pre;
reg        rd_reg_valid_ff;
assign        ar_agen0_pop = ar_agen_sel[0] && ~rdataout_full ;
assign        ar_agen1_pop = ar_agen_sel[1] && ~rdataout_full ;
assign        ar_agen2_pop = ar_agen_sel[2] && ~rdataout_full ;
assign        ar_agen3_pop = ar_agen_sel[3] && ~rdataout_full ;
wire        rd_reg_valid = ar_agen0_pop || ar_agen1_pop || ar_agen2_pop || ar_agen3_pop;

wire        rddec6_valid = rd_reg_valid && rd_reg_decode[6] &&
                                        (rd_reg_data[39:38] == 2'b00) && (ar_agen_addr[13] == 1'b0);

reg [56+C_S_AXI_DATA_WIDTH/8-1:0] rd_reg_data_ff;
reg                               addrram_sel;
always @(posedge Clk) begin
  rd_reg_data_ff        <= (rst_l) ? rd_reg_data : 'h0;
  addrram_sel           <= (rst_l) ? ar_agen_addr[13] : 'h0;
  rd_reg_valid_ff       <= (rst_l) ? rd_reg_valid : 1'b0;
  rddec6_valid_ff       <= (rst_l) ? rddec6_valid : 1'b0;
  slv_ex_info0_ff[71:0] <= (rst_l) ? slv_ex_info0[71:0] : 72'h0;
  slv_ex_info1_ff[71:0] <= (rst_l) ? slv_ex_info1[71:0] : 72'h0;
  slv_ex_toggle_ff      <= (rst_l) ? slv_ex_toggle : 1'b0;
end


wire [31:0] cmdram_rd_out =
                ((rd_reg_data_ff[37:36] == 2'b00) ? cmd_out_mr_i[31:0] : 32'h0) |
                ((rd_reg_data_ff[37:36] == 2'b01) ? cmd_out_mr_i[63:32] : 32'h0) |
                ((rd_reg_data_ff[37:36] == 2'b10) ? cmd_out_mr_i[95:64] : 32'h0) |
                ((rd_reg_data_ff[37:36] == 2'b11) ? cmd_out_mr_i[127:96] : 32'h0);

wire [C_S_AXI_DATA_WIDTH-1:0] rd_data_muxed ;
assign  rd_data_muxed =
        (rd_reg_data_ff[39] && ~addrram_sel) ? slvram_rd_out[C_S_AXI_DATA_WIDTH-1:0] :
        (rd_reg_data_ff[38] && ~addrram_sel) ?  { 2 { cmdram_rd_out[31:0] } } :
        (addrram_sel)  ?                        { 2 { addrram_rd_out[31:0] } } :
                                { 2 { rd_reg_data_ff[31:0] } };
wire [C_S_AXI_DATA_WIDTH/8-1:0] rd_data_be = rd_reg_data_ff[56+C_S_AXI_DATA_WIDTH/8-1:
                                                            56];
wire [C_S_AXI_DATA_WIDTH-1:0] rd_data_mask ;
generate if(C_S_AXI_DATA_WIDTH == 32) begin : S_R_BE_32
 assign rd_data_mask = {
	{ 8 { rd_data_be[3] } }, { 8 { rd_data_be[2] } }, 
	{ 8 { rd_data_be[1] } }, { 8 { rd_data_be[0] } } 
                       };
end
endgenerate
generate if(C_S_AXI_DATA_WIDTH == 64) begin : S_R_BE_64
 assign rd_data_mask = {
	{ 8 { rd_data_be[7] } }, { 8 { rd_data_be[6] } }, 
	{ 8 { rd_data_be[5] } }, { 8 { rd_data_be[4] } }, 
	{ 8 { rd_data_be[3] } }, { 8 { rd_data_be[2] } }, 
	{ 8 { rd_data_be[1] } }, { 8 { rd_data_be[0] } } 
                       };
end
endgenerate
wire [C_S_AXI_DATA_WIDTH-1:0] rd_data_masked = 
                              rd_data_muxed[C_S_AXI_DATA_WIDTH-1:0] ;
//
//Timing improvement
//
reg [C_S_AXI_DATA_WIDTH+24-1:0] Rdataout_in_data_ff;
reg  Rdataout_in_push_ff;
always @ (posedge Clk) begin
   Rdataout_in_data_ff <= (rst_l) ?  ({ rd_reg_data_ff[55:32], rd_data_masked[C_S_AXI_DATA_WIDTH-1:0] })  : {(C_S_AXI_DATA_WIDTH+24){1'b0}};
   Rdataout_in_push_ff <= (rst_l) ?  rd_reg_valid_ff : 1'b0;
end
axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH       (C_S_AXI_DATA_WIDTH+24 ),
  .DEPTH       (8                     ),
  .DEPTHBITS   (3                     ),
  .ZERO_INVALID(C_ZERO_INVALID        ),
  .HEADREG     (1                     ),
  .FULL_LEVEL  (6                     )
) Rdataout (
        .Clk              (Clk                                                              ),
        .rst_l            (rst_l                                                            ),
        .in_data          (Rdataout_in_data_ff                                              ),
        .in_push          (Rdataout_in_push_ff                                              ),
        .in_pop           ((rvalid_s && rready_s                                            )),
        .out_data         (rdata_pre[C_S_AXI_DATA_WIDTH+24-1:0]                             ),
        .is_full          (rdataout_full                                                    ),
        .is_notfull       (                                                                 ),
        .is_empty         (                                                                 ),
        .out_valid        (rvalid_s                                                         ),
        .ex_fifo_dbgout   (                                                                 ) 
);

assign  rdata_s[C_S_AXI_DATA_WIDTH-1:0] = rdata_pre[C_S_AXI_DATA_WIDTH-1:0];
assign	rresp_s[1:0]                    = rdata_pre[C_S_AXI_DATA_WIDTH+2-1:C_S_AXI_DATA_WIDTH];
assign	rlast_s                         = rdata_pre[C_S_AXI_DATA_WIDTH+2];
assign	rid_s[C_S_AXI_ID_WIDTH-1:0]     =
			rdata_pre[C_S_AXI_DATA_WIDTH+23:C_S_AXI_DATA_WIDTH+8];

endmodule
