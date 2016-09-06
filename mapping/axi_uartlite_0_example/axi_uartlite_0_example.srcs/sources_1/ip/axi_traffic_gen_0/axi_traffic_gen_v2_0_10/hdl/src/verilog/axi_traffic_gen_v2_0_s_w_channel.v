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
// Filename:       axi_traffic_gen_v2_0_10_s_w_channel.v
// Version : v1.0
// Description:    slave interface write channel.Write requests are processed
// to write to target location.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------

//Specific WARNINGs moved to INFO by Vivado Synthesis Tool
`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_s_w_channel #(
  parameter C_BASEADDR           = 32'hffffffff,
  parameter C_HIGHADDR           = 32'h00000000,
  parameter C_S_AXI_ID_WIDTH     = 1           ,
  parameter C_S_AXI_DATA_WIDTH   = 32          ,
  parameter C_S_AXI_AWUSER_WIDTH = 8           ,
  parameter C_ZERO_INVALID       = 1           ,
  parameter C_NO_EXCL            = 0           ,
  parameter C_ATG_BASIC_AXI4     = 1           ,
  parameter C_ATG_AXI4LITE       = 0            
) (

// system
 input                              Clk                 ,
 input                              rst_l               ,
// AW
 input [C_S_AXI_ID_WIDTH-1:0]       awid_s              ,
 input [31:0]                       awaddr_s            ,
 input [7:0]                        awlen_s             ,
 input [2:0]                        awsize_s            ,
 input [1:0]                        awburst_s           ,
 input [0:0]                        awlock_s            ,
 input [3:0]                        awcache_s           ,
 input [2:0]                        awprot_s            ,
 input [3:0]                        awqos_s             ,
 input [C_S_AXI_AWUSER_WIDTH-1:0]   awuser_s            ,
 input                              awvalid_s           ,
 output                             awready_s           ,
// W
 input                              wlast_s             ,
 input [C_S_AXI_DATA_WIDTH-1:0]     wdata_s             ,
 input [C_S_AXI_DATA_WIDTH/8-1:0]   wstrb_s             ,
 input                              wvalid_s            ,
 output                             wready_s            ,
//B
 output [C_S_AXI_ID_WIDTH-1:0]      bid_s               ,
 output [1:0]                       bresp_s             ,
 output                             bvalid_s            ,
 input                              bready_s            ,
// Register module
 input                              reg1_disallow_excl  ,
 input                              reg1_sgl_slv_wr     ,
 input                              reg1_wrs_block_rds  ,
 output [15:0]                      err_new_slv         ,
 output [15:0]                      wr_reg_decode       ,
 output [31:0]                      wr_reg_data         ,
// sr channel
 input [71:0]                       slv_ex_info0_ff     ,
 output reg                         slv_ex_valid0_ff    ,
 input[71:0]                        slv_ex_info1_ff     , 
 output reg                         slv_ex_valid1_ff    ,
 input                              slv_ex_new_valid0   ,
 input                              slv_ex_new_valid1   ,
 input [15:0]                       ar_agen_addr        ,
 output [C_S_AXI_DATA_WIDTH-1:0]    slvram_rd_out       ,
//slvram
 input  [63:0]                      sram_rd_data_a      ,
 output [10:0]                      slvram_waddr_ff     ,      
 output [7:0]                       slvram_we_ff        ,         
 output [63:0]                      slvram_write_data_ff,
//axi_traffic_gen_v2_0_10_cmdram
 output [15:0]                      aw_agen_addr        ,
 output                             aw_agen_valid_out   ,
 output [15:0]                      cmdram_we           ,
 output [64-1:0]                      slvram_wr_data      ,
//paramram
 output                             awfifo_valid        ,
 output [71:0]                      awfifo_out          ,
 output                             wfifo_valid        ,
 output [C_S_AXI_DATA_WIDTH*9/8+1-1:0] wfifo_out 
);

wire [31:0] base_addr = C_BASEADDR;
wire [31:0] high_addr = C_HIGHADDR;
wire [31:0] addr_mask = base_addr[31:0] ^ high_addr[31:0];

//wire [7:0] awlen8_s = awlen_s[7:0] | { 4'h0, awlen3_s[3:0] };
wire [7:0] awlen8_s = awlen_s[7:0] | { 4'h0, 4'h0 };

wire [15:0] awbuf_id = awid_s[C_S_AXI_ID_WIDTH-1:0];
wire [31:0] aw_addr_masked = awaddr_s[31:0] & addr_mask[31:0];
//Address re-mapped
//wire        aw_isslvram = ((aw_addr_masked[22:16] != 'h0 ));
wire        aw_isslvram = ((aw_addr_masked[15:14]==2'b11));
wire        aw_iscmd = ~aw_isslvram && awaddr_s[15] && ~awaddr_s[13];
wire [71:0] awbuf_rawdata = {
                awbuf_id[15:0],                                             //71:56
                aw_isslvram, aw_iscmd, awprot_s[2:0], awsize_s[2:0],        //55:48
                awburst_s[1:0], 1'b0,awlock_s[0:0], awcache_s[3:0],         //47:40 //awlock made 1-bit
                awlen8_s[7:0],                                              //39:32
                awaddr_s[31:0] };                                           //31:0
wire        awbuf_valid = awvalid_s && awready_s;

wire        awfifo_notfull;
wire        aw_agen_write;



axi_traffic_gen_v2_0_10_ex_fifo #(
.WIDTH     (72),
.DEPTH     (8 ),
.DEPTHBITS (3 ),
.HEADREG   (1 ),
.FULL_LEVEL(6 )
) Awfifo (
        .Clk              (Clk                ),
        .rst_l            (rst_l              ),
        .in_data          (awbuf_rawdata[71:0]),
        .in_push          (awbuf_valid        ),
        .in_pop           (aw_agen_write      ),
        .out_data         (awfifo_out[71:0]   ),
        .is_full          (                   ),
        .is_notfull       (awfifo_notfull     ),
        .is_empty         (                   ),
        .out_valid        (awfifo_valid       ),
        .ex_fifo_dbgout   (                   )
);
assign awready_s = awfifo_notfull;

wire [15:0] aw_agen_id;
wire [C_S_AXI_DATA_WIDTH/8-1:0] aw_agen_be;
wire        aw_agen_pop;
wire        aw_agen_done;
wire        aw_agen_valid;

wire        awfifo_out_is_excl ;
wire        aw_agen_pause = awfifo_valid && awfifo_out_is_excl && aw_agen_valid;
assign        aw_agen_write = awfifo_valid && ~aw_agen_valid && ~aw_agen_pause;
assign      aw_agen_valid_out = aw_agen_valid;

wire [71:0] slv_ex_wr_info       ;
wire        slv_ex_addr_matches0 ;
wire        slv_ex_id_matches0   ;
wire        slv_ex_wr_matches0   ;
wire        slv_ex_addr_matches1 ;
wire        slv_ex_id_matches1   ;
wire        slv_ex_wr_matches1   ;
wire        slv_ex_wr_matches    ;
wire [1:0]  awfifo_out_excl      ; 
wire        awfifo_out_null      ;
wire        aw_err               ;
generate if(C_NO_EXCL == 0 ) begin : S_W_EXCL_0
assign        awfifo_out_is_excl = (awfifo_out[45:44] == 2'b01);
assign  slv_ex_wr_info = awfifo_out[71:0];
assign        slv_ex_addr_matches0 = (slv_ex_wr_info[19:7] == slv_ex_info0_ff[19:7]);
assign        slv_ex_id_matches0 = (slv_ex_wr_info[71:56] == slv_ex_info0_ff[71:56]);
assign        slv_ex_wr_matches0 = (slv_ex_wr_info[55:20] ==slv_ex_info0_ff[55:20]) &&
                        (slv_ex_wr_info[6:0] == slv_ex_info0_ff[6:0]) &&
                        slv_ex_addr_matches0 && slv_ex_id_matches0 &&
                        slv_ex_valid0_ff;
assign        slv_ex_addr_matches1 = (slv_ex_wr_info[19:7] == slv_ex_info1_ff[19:7]);
assign        slv_ex_id_matches1 = (slv_ex_wr_info[71:56] == slv_ex_info1_ff[71:56]);
assign        slv_ex_wr_matches1 = (slv_ex_wr_info[55:20] ==slv_ex_info1_ff[55:20]) &&
                        (slv_ex_wr_info[6:0] == slv_ex_info1_ff[6:0]) &&
                        slv_ex_addr_matches1 && slv_ex_id_matches1 &&
                        slv_ex_valid1_ff;
assign        slv_ex_wr_matches = (C_NO_EXCL) ? 1'b0 :
                                slv_ex_wr_matches0 || slv_ex_wr_matches1;
assign        awfifo_out_excl = (awfifo_out_is_excl && slv_ex_wr_matches) ? 2'b01 :
                                                                2'b00;
assign        awfifo_out_null = aw_err ||
                (awfifo_out_is_excl && ~reg1_disallow_excl &&
                                ~slv_ex_wr_matches && (C_NO_EXCL == 0));

end
endgenerate
generate if(C_NO_EXCL == 1) begin : S_W_EXCL_1
assign        awfifo_out_is_excl = 2'b00;
assign        slv_ex_wr_matches = 1'b0 ;
assign        awfifo_out_excl   = 2'b00;
assign        awfifo_out_null   = aw_err ;

end
endgenerate
assign        aw_err = (awfifo_out[55:54] == 2'b00) && (awfifo_out[5:2] == 4'hd) &&
                                        awfifo_out[7] && ~awfifo_out[12] && ~awfifo_out[13];
                                // writing to reg13, at 0xb4
                                //    and not 0x1XXX (for special queue ops)

wire [1:0] awfifo_out_resp = (reg1_disallow_excl) ? 2'b00 :
                                (aw_err) ? 2'b10 : awfifo_out_excl[1:0];



axi_traffic_gen_v2_0_10_addrgen #(
  .USE_ADDR_OFFSET (0)                 ,
  .C_DATA_WIDTH    (C_S_AXI_DATA_WIDTH),
  .IS_READ         (0)                 ,
  .C_ATG_BASIC_AXI4(C_ATG_BASIC_AXI4)  ,
  .C_ATG_AXI4LITE  (C_ATG_AXI4LITE)    
) Aw_agen (
        .Clk           (Clk                                                        ),
        .rst_l         (rst_l                                                      ),
        .in_addr       ({awfifo_out[55:54], awfifo_out[13:0]}                      ),
        .in_addr_offset(awfifo_out[8:0]                                            ),
        .in_id         ({ awfifo_out_resp[1:0], awfifo_out_null, awfifo_out[68:56]}),
        .in_len        (awfifo_out[39:32]                                          ),
        .in_size       (awfifo_out[50:48]                                          ),
        .in_lastaddr   (6'b000000                                                  ),
        .in_burst      (awfifo_out[47:46]                                          ),
        .in_push       (aw_agen_write                                              ),
        .in_pop        (aw_agen_pop                                                ),
        .in_user       (1'b0                                                       ),
        .out_user      (                                                           ),
        .out_addr      (aw_agen_addr[15:0]                                         ),
        .out_id        (aw_agen_id[15:0]                                           ),
        .out_be        (aw_agen_be[C_S_AXI_DATA_WIDTH/8-1:0]                       ),
        .out_done      (aw_agen_done                                               ),
        .out_valid     (aw_agen_valid                                              )
);


wire        slv_ex_agen_id_matches0 ;
wire        slv_ex_clr_valid0       ;
wire        slv_ex_valid0           ;
wire        slv_ex_agen_id_matches1 ;
wire        slv_ex_clr_valid1       ;
wire        slv_ex_valid1           ;
generate if(C_NO_EXCL == 0 ) begin : S_W1_EXCL_0
assign        slv_ex_agen_id_matches0 = (aw_agen_id[13:0] == slv_ex_info0_ff[69:56]);
assign        slv_ex_clr_valid0 = aw_agen_valid &&
                (aw_agen_addr[13:3] == slv_ex_info0_ff[13:3]) &&
                ~slv_ex_agen_id_matches0 && ~aw_agen_id[13];
                // Don't clear if its from the ex master, or if the write is
                //  nullified (aw_agen_id[13]).
assign        slv_ex_valid0 = (C_NO_EXCL) ? 1'b0 :
                slv_ex_new_valid0 || (~slv_ex_clr_valid0 && slv_ex_valid0_ff);

assign        slv_ex_agen_id_matches1 = (aw_agen_id[13:0] == slv_ex_info1_ff[69:56]);
assign        slv_ex_clr_valid1 = aw_agen_valid &&
                (aw_agen_addr[13:3] == slv_ex_info1_ff[13:3]) &&
                ~slv_ex_agen_id_matches1 && ~aw_agen_id[13];
                // Don't clear if its from the ex master, or if the write is
                //  nullified (aw_agen_id[13]).
assign        slv_ex_valid1 = (C_NO_EXCL) ? 1'b0 :
                slv_ex_new_valid1 || (~slv_ex_clr_valid1 && slv_ex_valid1_ff);

end
endgenerate
generate if(C_NO_EXCL == 1 ) begin : S_W1_EXCL_1
assign        slv_ex_valid0 = 1'b0 ;
assign        slv_ex_valid1 = 1'b0 ;
end
endgenerate
// Buffer write data in a fifo
wire        wbuf_valid = wvalid_s && wready_s;

wire        wbuf_pop;
wire        wfifo_notfull;
//wire        wfifo_valid;


axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH     (C_S_AXI_DATA_WIDTH*9/8+1),
  .DEPTH     (8 ),
  .DEPTHBITS (3 ),
  .HEADREG   (1 ),
  .FULL_LEVEL(6 )
) Wfifo (
        .Clk              (Clk               ),
        .rst_l            (rst_l             ),
	.in_data({ wlast_s, wstrb_s[C_S_AXI_DATA_WIDTH/8-1:0],
				wdata_s[C_S_AXI_DATA_WIDTH-1:0] }),
        .in_push          (wbuf_valid        ),
        .in_pop           (wbuf_pop          ),
        .out_data         (wfifo_out[C_S_AXI_DATA_WIDTH*9/8+1-1:0]   ),
        .is_full          (                  ),
        .is_notfull       (wfifo_notfull     ),
        .is_empty         (                  ),
        .out_valid        (wfifo_valid       ),
        .ex_fifo_dbgout   (                  )
);

assign wready_s = wfifo_notfull;

// Buffer bresps in fifos as well
wire [15:0] bbuf_id = aw_agen_id[15:0];
wire [1:0] bbuf_resp = aw_agen_id[15:14];
wire [19:0] bbuf_rawdata = {
                        bbuf_id[15:0],                                        //19:4
                        2'b00, bbuf_resp[1:0] };                        //3:0

wire [3:0] btrk_fifo_num, btrk_free;
wire        bfifo0_pop, bfifo1_pop, bfifo2_pop, bfifo3_pop;
wire        bfifo0_notfull, bfifo1_notfull, bfifo2_notfull, bfifo3_notfull;
wire        bfifo0_valid, bfifo1_valid, bfifo2_valid, bfifo3_valid;
wire [19:0] bfifo0_out, bfifo1_out, bfifo2_out, bfifo3_out;

wire [C_S_AXI_ID_WIDTH-1:0] btrk_in_push_id = bbuf_rawdata[19:0];
wire [3:0] b_fifo_valid = { bfifo3_valid, bfifo2_valid,
                                bfifo1_valid, bfifo0_valid };
wire [3:0] b_fifo_push = ~b_fifo_valid[3:0] & btrk_fifo_num[3:0];
wire [3:0] btrk_clear_pos = ~b_fifo_valid[3:0];
wire        btrk_push = aw_agen_pop && aw_agen_done;

wire [C_S_AXI_ID_WIDTH-1:0] dummy_search_id = 32'h0;
wire dis_dis_out_of_order;
generate if(C_ATG_BASIC_AXI4 == 0)  begin : ATG_S_W_OOO_YES
  assign dis_dis_out_of_order = 1'b0;
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1)  begin : ATG_S_W_OOO_NO
  assign dis_dis_out_of_order = 1'b1;
end
endgenerate
axi_traffic_gen_v2_0_10_id_track #(
  .ID_WIDTH(C_S_AXI_ID_WIDTH)
) B_track (
        .Clk           (Clk                                  ),
        .rst_l         (rst_l                                ),
        .in_push_id    (btrk_in_push_id[C_S_AXI_ID_WIDTH-1:0]),
        .in_push       (btrk_push                            ),
        .in_search_id  (dummy_search_id[C_S_AXI_ID_WIDTH-1:0]),
        .in_clear_pos  (btrk_clear_pos[3:0]                  ),
        .in_only_entry0(dis_dis_out_of_order                 ),
        .out_push_pos  (btrk_fifo_num[3:0]                   ),
        .out_search_hit(                                     ),
        .out_free      (btrk_free[3:0]                       )
);

axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH     (20),
  .DEPTH     (8 ),
  .DEPTHBITS (3 ),
  .HEADREG   (0 ),
  .FULL_LEVEL(6 )
) B_fifo0 (
        .Clk              (Clk               ),
        .rst_l            (rst_l             ),
        .in_data          (bbuf_rawdata[19:0]),
        .in_push          (btrk_fifo_num[0]  ),
        .in_pop           (bfifo0_pop        ),
        .out_data         (bfifo0_out[19:0]  ),
        .is_full          (                  ),
        .is_notfull       (bfifo0_notfull    ),
        .is_empty         (                  ),
        .out_valid        (bfifo0_valid      ),
        .ex_fifo_dbgout   (                  )
);

generate if(C_ATG_BASIC_AXI4 == 1)  begin : ATG_S_W_OOO_F_NO
 assign bfifo1_notfull = 1'b1;
 assign bfifo1_valid   = 1'b0;
 assign bfifo2_notfull = 1'b1;
 assign bfifo2_valid   = 1'b0;
 assign bfifo3_notfull = 1'b1;
 assign bfifo3_valid   = 1'b0;
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 0)  begin : ATG_S_W_OOO_F_YES
axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH     (20),
  .DEPTH     (8 ),
  .DEPTHBITS (3 ),
  .HEADREG   (0 ),
  .FULL_LEVEL(6 )
) B_fifo1 (
        .Clk              (Clk               ),
        .rst_l            (rst_l             ),
        .in_data          (bbuf_rawdata[19:0]),
        .in_push          (btrk_fifo_num[1]  ),
        .in_pop           (bfifo1_pop        ),
        .out_data         (bfifo1_out[19:0]  ),
        .is_full          (                  ),
        .is_notfull       (bfifo1_notfull    ),
        .is_empty         (                  ),
        .out_valid        (bfifo1_valid      ),
        .ex_fifo_dbgout   (                  ) 
);

axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH     (20),
  .DEPTH     (8 ),
  .DEPTHBITS (3 ),
  .HEADREG   (0 ),
  .FULL_LEVEL(6 )
) B_fifo2 (
        .Clk              (Clk               ),
        .rst_l            (rst_l             ),
        .in_data          (bbuf_rawdata[19:0]),
        .in_push          (btrk_fifo_num[2]  ),
        .in_pop           (bfifo2_pop        ),
        .out_data         (bfifo2_out[19:0]  ),
        .is_full          (                  ),
        .is_notfull       (bfifo2_notfull    ),
        .is_empty         (                  ),
        .out_valid        (bfifo2_valid      ),
        .ex_fifo_dbgout   (                  ) 
);

axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH     (20),
  .DEPTH     (8 ),
  .DEPTHBITS (3 ),
  .HEADREG   (0 ),
  .FULL_LEVEL(6 )
) B_fifo3 (
        .Clk              (Clk               ),
        .rst_l            (rst_l             ),
        .in_data          (bbuf_rawdata[19:0]),
        .in_push          (btrk_fifo_num[3]  ),
        .in_pop           (bfifo3_pop        ),
        .out_data         (bfifo3_out[19:0]  ),
        .is_full          (                  ),
        .is_notfull       (bfifo3_notfull    ),
        .is_empty         (                  ),
        .out_valid        (bfifo3_valid      ),
        .ex_fifo_dbgout   (                  ) 
);

end
endgenerate
wire [19:0] bfifo_out;
wire        bfifo_valid;
wire        bfifo_notfull;

wire [3:0] bfifo_sel = (bfifo3_valid) ? 4'h8 :
                        (bfifo2_valid) ? 4'h4 :
                        (bfifo1_valid) ? 4'h2 :
                        (bfifo0_valid) ? 4'h1 : 4'h0;

assign        bfifo0_pop = bfifo_notfull && bfifo_sel[0];
assign        bfifo1_pop = bfifo_notfull && bfifo_sel[1];
assign        bfifo2_pop = bfifo_notfull && bfifo_sel[2];
assign        bfifo3_pop = bfifo_notfull && bfifo_sel[3];

wire [19:0] bfifo_in_data ;
generate if(C_ATG_BASIC_AXI4 == 0)  begin : ATG_S_W1_OOO_YES
assign bfifo_in_data = ((bfifo_sel[0]) ? bfifo0_out[19:0] : 20'h0) |
                        ((bfifo_sel[1]) ? bfifo1_out[19:0] : 20'h0) |
                        ((bfifo_sel[2]) ? bfifo2_out[19:0] : 20'h0) |
                        ((bfifo_sel[3]) ? bfifo3_out[19:0] : 20'h0);
end
endgenerate
generate if(C_ATG_BASIC_AXI4 == 1)  begin : ATG_S_W1_OOO_NO
assign  bfifo_in_data = ((bfifo_sel[0]) ? bfifo0_out[19:0] : 20'h0) ;
end
endgenerate

wire        bfifo_pop = bfifo_valid && bready_s;
wire        bfifo_push = bfifo_notfull && (bfifo_sel[3:0] != 4'h0);


axi_traffic_gen_v2_0_10_ex_fifo #(
  .WIDTH       (20            ),
  .DEPTH       (8             ),
  .DEPTHBITS   (3             ),
  .HEADREG     (1             ),
  .ZERO_INVALID(C_ZERO_INVALID),
  .FULL_LEVEL  (6             )
) Bfifo (
        .Clk              (Clk                ),
        .rst_l            (rst_l              ),
        .in_data          (bfifo_in_data[19:0]),
        .in_push          (bfifo_push         ),
        .in_pop           (bfifo_pop          ),
        .out_data         (bfifo_out[19:0]    ),
        .is_full          (                   ),
        .is_notfull       (bfifo_notfull      ),
        .is_empty         (                   ),
        .out_valid        (bfifo_valid        ),
        .ex_fifo_dbgout   (                   ) 
);

assign        wbuf_pop = wfifo_valid && aw_agen_valid &&
                        bfifo0_notfull && bfifo1_notfull && bfifo2_notfull &&
                        bfifo3_notfull && (btrk_free[3:0] != 4'h0);
assign        aw_agen_pop = wbuf_pop;

wire        wfifo_bad_last = wbuf_pop && (aw_agen_done != wfifo_out[C_S_AXI_DATA_WIDTH*9/8]);
wire [C_S_AXI_DATA_WIDTH/8-1:0] wfifo_out_be =
			wfifo_out[C_S_AXI_DATA_WIDTH*9/8-1:C_S_AXI_DATA_WIDTH];

wire	wfifo_bad_be_pre = (~aw_agen_be[C_S_AXI_DATA_WIDTH/8-1:0] &
			wfifo_out_be[C_S_AXI_DATA_WIDTH/8-1:0]) != 8'h0;
wire        wfifo_bad_be = wbuf_pop && wfifo_bad_be_pre;


assign bresp_s[1:0] = bfifo_out[1:0];
assign bid_s[C_S_AXI_ID_WIDTH-1:0] = bfifo_out[19:4];
assign bvalid_s = bfifo_valid;

wire        slv_wr_pending = awfifo_valid || aw_agen_valid;

always @(posedge Clk) begin
        slv_ex_valid0_ff <= (rst_l) ? slv_ex_valid0 : 1'b0;
        slv_ex_valid1_ff <= (rst_l) ? slv_ex_valid1 : 1'b0;
end


//register interface information
wire        wr_reg_isreg = (aw_agen_addr[15:14] == 2'b00) && aw_agen_pop &&
                                                        ~aw_agen_addr[7] 
                                                        && ~aw_agen_addr[12]//;  // adding this for special_queue
                                                        && ~aw_agen_addr[13];  // adding this for addrram
assign wr_reg_decode = { 15'h0, wr_reg_isreg } << aw_agen_addr[5:2];

wire [11:0] wr_reg_shift = (C_S_AXI_DATA_WIDTH == 32) ? 12'h0 :
		(C_S_AXI_DATA_WIDTH == 64) ? { 6'h0, aw_agen_addr[2], 5'h0 } :
		(C_S_AXI_DATA_WIDTH == 128) ? { 5'h0, aw_agen_addr[3:2], 5'h0 }:
					{ 4'h0, aw_agen_addr[4:2], 5'h0 };
assign wr_reg_data = wfifo_out[C_S_AXI_DATA_WIDTH-1:0] >>
							wr_reg_shift[11:0];

//slv/mst ram decode
wire        slvram_do_write = wbuf_pop && aw_agen_addr[15] && ~aw_agen_id[13];
wire [7:0] slvram_we = (slvram_do_write) ?
			{4'h0,wfifo_out_be[C_S_AXI_DATA_WIDTH/8-1:0]} : 'h0;

assign slvram_wr_data = (C_S_AXI_DATA_WIDTH == 64) ? wfifo_out[C_S_AXI_DATA_WIDTH-1:0] :
                          {2{wfifo_out[C_S_AXI_DATA_WIDTH-1:0]}};

wire [63:0] slvram_rd_out_pre;
assign  slvram_rd_out_pre[63:0]  = sram_rd_data_a;

   
reg [63:0] slvram_wr_data64_ff;
reg [7:0] slvram_rdwr_mask8_ff;

reg [C_S_AXI_DATA_WIDTH-1:0] slvram_wr_datareg_ff;
reg [31:0] slvram_rdwr_mask_ff;

wire [13:0] rdwr_match_mask =
			(C_S_AXI_DATA_WIDTH == 256) ? 14'h3fe0 :
			(C_S_AXI_DATA_WIDTH == 128) ? 14'h1ff0 :
			(C_S_AXI_DATA_WIDTH == 64) ? 14'h1ffe : 14'h1ffc;
wire	slvram_rdwr_match = slvram_do_write &&
			((ar_agen_addr[13:0] & rdwr_match_mask[13:0]) ==
				(aw_agen_addr[13:0] & rdwr_match_mask[13:0]));
wire [C_S_AXI_DATA_WIDTH-1:0] slvram_wr_datareg = (slvram_rdwr_match) ?
			slvram_wr_data[C_S_AXI_DATA_WIDTH-1:0] :
			slvram_wr_datareg_ff[C_S_AXI_DATA_WIDTH-1:0];
wire [31:0] slvram_rdwr_mask = (slvram_rdwr_match) ?
				wfifo_out_be[C_S_AXI_DATA_WIDTH/8-1:0] : 'h0;

wire [C_S_AXI_DATA_WIDTH-1:0] slvram_rdwr_mask_exp = {
	{ 8 { slvram_rdwr_mask_ff[31] } }, { 8 { slvram_rdwr_mask_ff[30] } },
	{ 8 { slvram_rdwr_mask_ff[29] } }, { 8 { slvram_rdwr_mask_ff[28] } },
	{ 8 { slvram_rdwr_mask_ff[27] } }, { 8 { slvram_rdwr_mask_ff[26] } },
	{ 8 { slvram_rdwr_mask_ff[25] } }, { 8 { slvram_rdwr_mask_ff[24] } },
	{ 8 { slvram_rdwr_mask_ff[23] } }, { 8 { slvram_rdwr_mask_ff[22] } },
	{ 8 { slvram_rdwr_mask_ff[21] } }, { 8 { slvram_rdwr_mask_ff[20] } },
	{ 8 { slvram_rdwr_mask_ff[19] } }, { 8 { slvram_rdwr_mask_ff[18] } },
	{ 8 { slvram_rdwr_mask_ff[17] } }, { 8 { slvram_rdwr_mask_ff[16] } },
	{ 8 { slvram_rdwr_mask_ff[15] } }, { 8 { slvram_rdwr_mask_ff[14] } },
	{ 8 { slvram_rdwr_mask_ff[13] } }, { 8 { slvram_rdwr_mask_ff[12] } },
	{ 8 { slvram_rdwr_mask_ff[11] } }, { 8 { slvram_rdwr_mask_ff[10] } },
	{ 8 { slvram_rdwr_mask_ff[9] } }, { 8 { slvram_rdwr_mask_ff[8] } },
	{ 8 { slvram_rdwr_mask_ff[7] } }, { 8 { slvram_rdwr_mask_ff[6] } },
	{ 8 { slvram_rdwr_mask_ff[5] } }, { 8 { slvram_rdwr_mask_ff[4] } },
	{ 8 { slvram_rdwr_mask_ff[3] } }, { 8 { slvram_rdwr_mask_ff[2] } },
	{ 8 { slvram_rdwr_mask_ff[1] } }, { 8 { slvram_rdwr_mask_ff[0] } } };
assign slvram_rd_out[C_S_AXI_DATA_WIDTH-1:0] =
		(slvram_rdwr_mask_exp[C_S_AXI_DATA_WIDTH-1:0] &
			slvram_wr_datareg_ff[C_S_AXI_DATA_WIDTH-1:0]) |
		(~slvram_rdwr_mask_exp[C_S_AXI_DATA_WIDTH-1:0] &
			slvram_rd_out_pre[C_S_AXI_DATA_WIDTH-1:0]);

always @(posedge Clk) begin
	slvram_wr_datareg_ff[C_S_AXI_DATA_WIDTH-1:0] <= (rst_l) ?
		slvram_wr_datareg[C_S_AXI_DATA_WIDTH-1:0] : 'h0;
	slvram_rdwr_mask_ff[31:0] <= (rst_l) ? slvram_rdwr_mask[31:0] : 32'h0;
end

assign err_new_slv[15:0] = { 14'h0, wfifo_bad_be, wfifo_bad_last };

// adding sram regslice for timing closure
wire [82:0] sram_slvramwr_ff;
   
 axi_traffic_gen_v2_0_10_regslice
  #(
    .DWIDTH   (83),
    .IDWIDTH  (1) ,
    .DATADEPTH(1 )
    )
  sram_slvramwr_regslice
   (
    .din         ({aw_agen_addr[12:2],slvram_we,slvram_wr_data}),
    .dout        (sram_slvramwr_ff                             ),      
    .dout_early  (                                             ),      
    .idin        (1'b0                                         ),      
    .idout       (                                             ),      
    .id_stable   (                                             ),      
    .id_stable_ff(                                             ),      
    .data_stable (                                             ),      
    .clk         (Clk                                          ),  
    .reset       (~rst_l                                       )  
    ); 

   assign slvram_waddr_ff      = sram_slvramwr_ff[82:72];
   assign slvram_we_ff         = sram_slvramwr_ff[71:64];
   assign slvram_write_data_ff = sram_slvramwr_ff[63:0];

//cmdram decode
// sent out aw_agen_addr as output also.
// this is used along with ar_agen0_addr,maw_ptr_new,mar_ptr_new
//  to select address to cmdram based on reg0_m_enable_ff
wire [31:0] cmdram_we32 = wfifo_out_be[C_S_AXI_DATA_WIDTH/8-1:0];
wire [3:0] cmdram_we4 ;
wire [7:0] cmdram_we8 ;
wire [7:0] cmdram_we_pre ;
generate if(C_S_AXI_DATA_WIDTH == 32) begin :CMD_WE_32
assign cmdram_we4 = cmdram_we32[31:28] | cmdram_we32[27:24] |
		cmdram_we32[23:20] | cmdram_we32[19:16] |
		cmdram_we32[15:12] | cmdram_we32[11:8] |
		cmdram_we32[7:4] | cmdram_we32[3:0];

assign cmdram_we_pre = (wbuf_pop && aw_agen_addr[14]) ? cmdram_we4[3:0] :
									4'h0;
assign cmdram_we =
	(aw_agen_addr[3:2] == 2'b11) ? { cmdram_we_pre[3:0], 12'h0 } :
	(aw_agen_addr[3:2] == 2'b10) ? { 4'h0, cmdram_we_pre[3:0], 8'h0 } :
	(aw_agen_addr[3:2] == 2'b01) ? { 8'h0, cmdram_we_pre[3:0], 4'h0 } :
						{ 12'h0, cmdram_we_pre[3:0] };
end
endgenerate

generate if(C_S_AXI_DATA_WIDTH == 64) begin :CMD_WE_64
assign cmdram_we8 = cmdram_we32[31:24]  |
		    cmdram_we32[23:16]  |
		    cmdram_we32[15:8]   |
		    cmdram_we32[7:0] ;

assign cmdram_we_pre = (wbuf_pop && aw_agen_addr[14]) ? cmdram_we8[7:0] :
									8'h0;
assign cmdram_we =
	(aw_agen_addr[3] == 1'b1) ? { cmdram_we_pre[7:0], 8'h0 } :
						{ 8'h0, cmdram_we_pre[7:0] };
end
endgenerate

endmodule


