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
module axi_traffic_gen_v2_0_10_paramram_64_wrap #
(
parameter C_FAMILY = "virtex7",
parameter C_RAMINIT_PARAMRAM0_F = "NONE" ,
parameter C_S_AXI_DATA_WIDTH = 32,
parameter C_M_AXI_DATA_WIDTH = 32,
parameter C_M_AXI_ADDR_WIDTH = 32,
parameter C_REPEAT_COUNT = 254,
parameter C_ATG_BASIC_AXI4 = 0,
parameter C_AXI_WR_ADDR_SEED         = 16'h7C9B, 
parameter C_AXI_RD_ADDR_SEED         = 16'h5A5A
) (
   input                 Clk                           ,
   input                 rst_l                         ,
//s
   input                 awfifo_valid                  ,
   input [71:0]          awfifo_out                    ,
   input                 wfifo_valid                   ,
   input [C_S_AXI_DATA_WIDTH*9/8+1-1:0]    wfifo_out   , 
//axi_traffic_gen_v2_0_10_cmdram
   input [127:0]         cmd_out_mr_regslice           ,
   input [127:0]         cmd_out_mr_regslice_ff        ,
   input [127:0]         cmd_out_mw_regslice           ,
   input [127:0]         cmd_out_mw_regslice_ff        ,
   output reg [23:0]     param_cmdw_submitcnt_ff       ,
   output reg [23:0]     param_cmdr_submitcnt_ff       ,

//MSB address bits from addrram
   input [31:0]          adr_out_mr                    ,
   input [31:0]          adr_out_mw                    ,
   output reg [31:0]     prm_out_mr                    ,
   output reg [31:0]     prm_out_mw                    ,
//mr
   output reg  [127:0]   cmd_out_mr                    ,
   input                 mar_fifo_push_ff              , 
   input [9:0]           mar_ptr_new_ff                , 
   input [9:0]           mar_ptr_new_2ff               , 
   output                param_cmdr_delayop_valid      , 
   output [23:0]         param_cmdr_count              ,
   output                param_cmdr_repeatfixedop_valid,
   output reg            param_cmdr_disable_submitincr ,
//mw
   output reg [127:0]    cmd_out_mw                    , 
   input                 maw_fifo_push_ff              ,
   input [9:0]           maw_ptr_new_ff                , 
   input [9:0]           maw_ptr_new_2ff               ,
   output                param_cmdw_delayop_valid      ,
   output [23:0]         param_cmdw_count              ,
   output                param_cmdw_repeatfixedop_valid, 
   output reg            param_cmdw_disable_submitincr 
//debug-capture 
);

wire [31:0] prm_out_mr_postmux;
wire [31:0] prm_out_mw_postmux;
wire [127:0] cmd_out_mr_postmux;
wire [127:0] cmd_out_mw_postmux;
//generate if(C_ATG_BASIC_AXI4 == 1 ) begin : PARAMRAM_OFF
//    always @(posedge Clk) begin  
//       param_cmdw_submitcnt_ff    <=  20'h0; 
//       param_cmdr_submitcnt_ff    <=  20'h0; 
//    end
//   assign cmd_out_mr_postmux[31:0]    = cmd_out_mr_regslice_ff[31:0];
//   assign cmd_out_mr_postmux[127:32]  = cmd_out_mr_regslice[127:32];  
//   always @(posedge Clk) begin 
//        cmd_out_mr <= cmd_out_mr_postmux; 
//   end
//   assign   param_cmdr_delayop_valid      = 1'b0; 
//   assign   param_cmdr_count              = 1'b0;
//   assign   param_cmdr_repeatfixedop_valid= 1'b0;
//   always @(posedge Clk) begin 
//     param_cmdr_disable_submitincr <= 1'b0;
//   end
//
//    assign cmd_out_mw_postmux[31:0]    = cmd_out_mw_regslice_ff[31:0];
//    assign cmd_out_mw_postmux[127:32]  = cmd_out_mw_regslice[127:32];   
//    always @(posedge Clk) begin 
//       cmd_out_mw <= cmd_out_mw_postmux; 
//    end
//    assign param_cmdw_delayop_valid       = 1'b0;
//    assign param_cmdw_count               = 1'b0;
//    assign param_cmdw_repeatfixedop_valid = 1'b0;
//   always @(posedge Clk) begin 
//     param_cmdw_disable_submitincr <= 1'b0;
//   end
//end
//endgenerate
generate if(C_ATG_BASIC_AXI4 == 0 ) begin : PARAMRAM_ON
/* 
 *
 *   grahams : adding parameterized FSM + registers
 *
 * 
 * 
 */   

   //  PORT A : AXI SLV writes, CMDR read
   //  PORT B :                 CMDW read
   //wire param_ram_we               = awfifo_valid && (awfifo_out[23:12] == 12'h001);
   wire param_ram_we               = awfifo_valid && (awfifo_out[15:12] == 4'h1);
   reg         param_ram_we_ff;
   reg [8:0]   param_ram_addr_ff;
   
   always @(posedge Clk) begin 
      param_ram_we_ff <=  (rst_l) ? ((param_ram_we) ? 1'h1 : ((wfifo_valid) ? 1'h0 : param_ram_we_ff)) : 1'h0 ;
      param_ram_addr_ff <=  (rst_l) ? ((param_ram_we) ? awfifo_out[10:2] : param_ram_addr_ff) : 9'h0 ;
   end
      
   wire [3:0]  paramram_we_a       = (wfifo_valid && param_ram_we_ff)  ? 4'hf : 4'h0 ;  
   //wire [9:0] paramram_addr_a     = (param_ram_we_ff)  ? {1'b0,awfifo_out[10:2]} : {2'b0,mar_ptr_new_ff[7:0]}  ; 
   wire [8:0] paramram_addr_a     = (wfifo_valid && param_ram_we_ff)  ? param_ram_addr_ff : {1'b0,mar_ptr_new_ff[7:0]}  ; 
   wire [31:0] paramram_wr_data_a;
   if(C_S_AXI_DATA_WIDTH == 64) begin: ADDR_64_GEN
      assign paramram_wr_data_a  =  (param_ram_addr_ff[0]) ? wfifo_out[63:32]: wfifo_out[31:0];   
   end 
   if(C_S_AXI_DATA_WIDTH == 32) begin: ADDR_32_GEN
      assign paramram_wr_data_a  =  wfifo_out[31:0];   
   end 
   wire [31:0] paramram_rd_data_a;
   wire [3:0]  paramram_we_b       = 4'b0 ;   
   wire [8:0] paramram_addr_b     = {1'b1,maw_ptr_new_ff[7:0]};   
   wire [31:0] paramram_wr_data_b  = 32'h0;  
   wire [31:0] paramram_rd_data_b;



   
   
axi_traffic_gen_v2_0_10_slvram_v7 #(
            .C_FAMILY    (C_FAMILY             ),
            .C_DATAWIDTH (32                   ),
            .C_SIZE      (512                  ),
            .C_ADDR_WIDTH(9                    ),
            //.C_INITRAM_F ("/home/kpolise/prm.mif")
            .C_INITRAM_F (C_RAMINIT_PARAMRAM0_F)
) paramram (
      .clk_a    (Clk               ),
      .we_a     (paramram_we_a     ),
      .addr_a   (paramram_addr_a   ),
      .wr_data_a(paramram_wr_data_a),
      .rd_data_a(paramram_rd_data_a),
      
      .clk_b    (Clk               ),
      .we_b     (paramram_we_b     ),
      .addr_b   (paramram_addr_b   ),
      .wr_data_b(paramram_wr_data_b),
      .rd_data_b(paramram_rd_data_b)
                                   );
   
   wire [31:0] paramram_mr_regslice;
   wire [31:0] paramram_mw_regslice;
   
 axi_traffic_gen_v2_0_10_regslice
  #(
    .DWIDTH(32),
    .IDWIDTH(1),    
    .DATADEPTH(`REGSLICE_PARAMRAM_DATA),
    .IDDEPTH(1)
    )
   paramram_r_regslice
   (
    .din          (paramram_rd_data_a  ),
    .dout         (paramram_mr_regslice),    
    .dout_early   (                    ),    
    .idin         (1'b0                ),
    .idout        (                    ),    
    .id_stable    (                    ),    
    .id_stable_ff (                    ),    
    .data_stable  (                    ),    
    .clk          (Clk                 ),  
    .reset        (~rst_l              )  
    ); 

 axi_traffic_gen_v2_0_10_regslice
  #(
    .DWIDTH   (32                     ),
    .IDWIDTH  (1                      ),    
    .DATADEPTH(`REGSLICE_PARAMRAM_DATA),
    .IDDEPTH  (1                      )
    )
   paramram_w_regslice
   (
    .din          (paramram_rd_data_b  ),
    .dout         (paramram_mw_regslice),    
    .dout_early   (                    ),    
    .idin         (1'b0                ),
    .idout        (                    ),
    .id_stable    (                    ),
    .id_stable_ff (                    ),
    .data_stable  (                    ),
    .clk          (Clk                 ),  
    .reset        (~rst_l              )  
    ); 
   
   
   /*
    *  CMDR PARAM FSM / CONTROL
    * 
    */
 
   reg [2:0]   param_cmdr_op_ff          ;      
   reg [1:0]   param_cmdr_addrmode_ff    ;
   reg [1:0]   param_cmdr_intervalmode_ff;
   reg                param_cmdr_idmode_ff      ;
  

   wire [23:0] cmdr_rnum;
   wire [15:0] r_randnum;
   assign cmdr_rnum  = {r_randnum[7:0],r_randnum[15:0]};

   axi_traffic_gen_v2_0_10_randgen #(
               .seed         (C_AXI_RD_ADDR_SEED )
   ) cmdr_rand (
               .randnum      (r_randnum),
               .generate_next(1'b1     ),
               .reset        (~rst_l   ),
               .clk          (Clk      )
               );

   reg  [23:0]  param_cmdr_count_minus1_ff ;
   wire [23:0]         paramram_mr_regslice_minus1 = paramram_mr_regslice[23:0]-1;
   wire [23:0] param_cmdr_count_int = (paramram_mr_regslice[23:0] <= 24'd6) ? 24'b0 : paramram_mr_regslice[23:0]-24'h6;
   wire [11:0] param_cmdr_dint = (paramram_mr_regslice[19:8] <= 12'd6) ? 12'b0 : paramram_mr_regslice[19:8]-12'h6; 
   wire [23:0] param_cmdr_count_dint = {paramram_mr_regslice[23:20],param_cmdr_dint,paramram_mr_regslice[7:0]};
   assign      param_cmdr_count  = (param_cmdr_repeatfixedop_valid == 1'b1) ? param_cmdr_count_dint : param_cmdr_count_int;

   //assign param_cmdr_count = param_cmdr_count_int;  

    
   always @(posedge Clk) begin 
      param_cmdr_count_minus1_ff   <=  paramram_mr_regslice_minus1   ;    
      param_cmdr_addrmode_ff       <=  paramram_mr_regslice[25:24]  ;      
      param_cmdr_intervalmode_ff   <=  paramram_mr_regslice[27:26]    ;   
      param_cmdr_idmode_ff         <=  paramram_mr_regslice[28]    ;
      param_cmdr_op_ff             <=  paramram_mr_regslice[31:29]  ;

   end   




   

   // opcntrl signals here, will be validated by opcode field
   reg [3:0] param_cmdr_addrrandrange_encoded; 
   always @(posedge Clk) begin 
      param_cmdr_addrrandrange_encoded <=   paramram_mr_regslice[23:20]     ;    
   end   
         
         
   reg [3:0]  param_cmdr_state_ff;
   reg [3:0]  param_cmdr_state_nxt;
   reg [23:0] param_cmdr_submitcnt_nxt;
   
   // control for incrementing counters during special op
   reg [C_M_AXI_ADDR_WIDTH-1:0] param_cmdr_addr_ff;
   reg [C_M_AXI_ADDR_WIDTH-1:0] param_cmdr_add_1;
   reg [C_M_AXI_ADDR_WIDTH-1:0] param_cmdr_addr_nxt;
   reg [C_M_AXI_ADDR_WIDTH-1:0] param_cmdr_addr_tmp;
   reg [C_M_AXI_ADDR_WIDTH-1:0] four_k_bound_chk;
   reg [C_M_AXI_ADDR_WIDTH-1:0] four_k_bound_chk_ff;
   reg               param_cmdr_addrmux;
   
   wire [31:0] cmd_out_mr_addr_align = cmd_out_mr_regslice[31:0] & 32'hFFFFF000;
   reg [31:0] cmd_out_mr_addr_align_four;
   reg [31:0] cmd_out_mr_addr_align_eight;
   reg [C_M_AXI_ADDR_WIDTH-1:0] cmd_out_mr_comp;

   wire [3:0]  param_incr_shift = (C_M_AXI_DATA_WIDTH == 32) ? 4'h2 : (C_M_AXI_DATA_WIDTH == 64) ? 4'h3 : (C_M_AXI_DATA_WIDTH == 128) ? 4'h4 : (C_M_AXI_DATA_WIDTH == 256) ? 4'h5: 4'h6;

   //wire [31:0] param_maxburstbytes = (C_M_AXI_DATA_WIDTH == 32) ? `SQOP_ADDRMODE_RAND_MAXBURSTBYTES_32 : `SQOP_ADDRMODE_RAND_MAXBURSTBYTES_64;   
   //wire [31:0] param_maxburstbytes = (C_M_AXI_DATA_WIDTH == 32) ? `SQOP_ADDRMODE_RAND_MAXBURSTBYTES_32 : (C_M_AXI_DATA_WIDTH == 64) ? `SQOP_ADDRMODE_RAND_MAXBURSTBYTES_64 : (C_M_AXI_DATA_WIDTH == 128) ? `SQOP_ADDRMODE_RAND_MAXBURSTBYTES_128 :  (C_M_AXI_DATA_WIDTH == 256) ? `SQOP_ADDRMODE_RAND_MAXBURSTBYTES_256 : `SQOP_ADDRMODE_RAND_MAXBURSTBYTES_512;   
   wire [31:0] param_maxburstbytes = (C_M_AXI_DATA_WIDTH == 32) ? `SQOP_ADDRMODE_RAND_MAXBURSTBYTES_32 : (C_M_AXI_DATA_WIDTH == 64) ? `SQOP_ADDRMODE_RAND_MAXBURSTBYTES_64 : `SQOP_ADDRMODE_RAND_MAXBURSTBYTES_128;   
   wire [12:0] param_cmdr_addrincr = (cmd_out_mr_regslice[39:32]+1) << param_incr_shift;
   wire [12:0] param_cmdr_addrrandc = (cmd_out_mr_regslice[39:32]+1) << param_incr_shift;
   reg [12:0]  param_cmdr_addrincr_ff;
   reg mar_fifo_push_2ff;
   reg [31:0] rand_addr_n;
   reg [31:0] rand_addr_n_ff;
   reg [31:0] rand_addr_n_tmp;
   reg [31:0] rand_addr_n_tmpc;
   reg [31:0] param_cmdr_addrrand_i;
   reg [31:0] param_cmdr_addrrand_i_ff;


   
    always @(posedge Clk) begin  
       param_cmdr_addrincr_ff    <= (rst_l) ? param_cmdr_addrincr       : 13'h0;
       param_cmdr_state_ff       <= (rst_l) ? param_cmdr_state_nxt      : `SQOP_ST_IDLE;
       param_cmdr_submitcnt_ff   <= (rst_l) ? param_cmdr_submitcnt_nxt  : 24'h0; 
       param_cmdr_addr_ff        <= (rst_l) ? param_cmdr_addr_nxt       : 'h0;
       param_cmdr_add_1          <= (rst_l) ? param_cmdr_addr_ff+param_cmdr_addrincr : 'h0;
       param_cmdr_addr_tmp       <= (rst_l) ? param_cmdr_add_1+param_cmdr_addrincr    : 'h0;
       four_k_bound_chk_ff       <= (rst_l) ? four_k_bound_chk          : 32'h0;
       mar_fifo_push_2ff         <= (rst_l) ? mar_fifo_push_ff          : 1'b0;
       param_cmdr_addrrand_i_ff  <= (rst_l) ? param_cmdr_addrrand_i     : 1'b0;
    end


   



/*
 *
 * ADDR RANGE Encoding w/ needed bits to meet range
 * 
0        4096                12        10
1        8192                13        11
2        16384                14        12
3        32768                15        13
4        65536                16        14
5        131072                17        15
6        262144                18        16
7        524288                19        17
8        1048576                20        18
9        2097152                21        19
10        4194304                22        20
11        8388608                23        21
12        16777216        24        22
13        33554432              25        23
14        67108864               26        24
15        134217728              27        25
*/


if(C_M_AXI_DATA_WIDTH == 512) begin: RAND_R_ADDR_512_GEN
   always @(*)
     begin
        case (param_cmdr_addrrandrange_encoded) 
          4'd0: param_cmdr_addrrand_i  = {cmdr_rnum[10-5:0],6'b0};          
          4'd1: param_cmdr_addrrand_i  = {cmdr_rnum[11-5:0],6'b0};
          4'd2: param_cmdr_addrrand_i  = {cmdr_rnum[12-5:0],6'b0};
          4'd3: param_cmdr_addrrand_i  = {cmdr_rnum[13-5:0],6'b0};
          4'd4: param_cmdr_addrrand_i  = {cmdr_rnum[14-5:0],6'b0};
          4'd5: param_cmdr_addrrand_i  = {cmdr_rnum[15-5:0],6'b0};
          4'd6: param_cmdr_addrrand_i  = {cmdr_rnum[16-5:0],6'b0};
          4'd7: param_cmdr_addrrand_i  = {cmdr_rnum[17-5:0],6'b0};
          4'd8: param_cmdr_addrrand_i  = {cmdr_rnum[18-5:0],6'b0};
          4'd9: param_cmdr_addrrand_i  = {cmdr_rnum[19-5:0],6'b0};
          4'd10: param_cmdr_addrrand_i = {cmdr_rnum[20-5:0],6'b0};
          4'd11: param_cmdr_addrrand_i = {cmdr_rnum[21-5:0],6'b0};
          4'd12: param_cmdr_addrrand_i = {cmdr_rnum[22-5:0],6'b0};
          4'd13: param_cmdr_addrrand_i = {cmdr_rnum[23-5:0],6'b0};
          4'd14: param_cmdr_addrrand_i = {cmdr_rnum[23-5:0],6'b0};
          4'd15: param_cmdr_addrrand_i = {cmdr_rnum[23-5:0],6'b0};  // redundant
        endcase         
     end // always @ begin
  end
if(C_M_AXI_DATA_WIDTH == 256) begin: RAND_R_ADDR_256_GEN
   always @(*)
     begin
        case (param_cmdr_addrrandrange_encoded) 
          4'd0: param_cmdr_addrrand_i  = {cmdr_rnum[10-4:0],5'b0};          
          4'd1: param_cmdr_addrrand_i  = {cmdr_rnum[11-4:0],5'b0};
          4'd2: param_cmdr_addrrand_i  = {cmdr_rnum[12-4:0],5'b0};
          4'd3: param_cmdr_addrrand_i  = {cmdr_rnum[13-4:0],5'b0};
          4'd4: param_cmdr_addrrand_i  = {cmdr_rnum[14-4:0],5'b0};
          4'd5: param_cmdr_addrrand_i  = {cmdr_rnum[15-4:0],5'b0};
          4'd6: param_cmdr_addrrand_i  = {cmdr_rnum[16-4:0],5'b0};
          4'd7: param_cmdr_addrrand_i  = {cmdr_rnum[17-4:0],5'b0};
          4'd8: param_cmdr_addrrand_i  = {cmdr_rnum[18-4:0],5'b0};
          4'd9: param_cmdr_addrrand_i  = {cmdr_rnum[19-4:0],5'b0};
          4'd10: param_cmdr_addrrand_i = {cmdr_rnum[20-4:0],5'b0};
          4'd11: param_cmdr_addrrand_i = {cmdr_rnum[21-4:0],5'b0};
          4'd12: param_cmdr_addrrand_i = {cmdr_rnum[22-4:0],5'b0};
          4'd13: param_cmdr_addrrand_i = {cmdr_rnum[23-4:0],5'b0};
          4'd14: param_cmdr_addrrand_i = {cmdr_rnum[23-4:0],5'b0};
          4'd15: param_cmdr_addrrand_i = {cmdr_rnum[23-4:0],5'b0};  // redundant
        endcase         
     end // always @ begin
  end
if(C_M_AXI_DATA_WIDTH == 128) begin: RAND_R_ADDR_128_GEN
   always @(*)
     begin
        case (param_cmdr_addrrandrange_encoded) 
          4'd0: param_cmdr_addrrand_i  = {cmdr_rnum[10-3:0],4'b0};          
          4'd1: param_cmdr_addrrand_i  = {cmdr_rnum[11-3:0],4'b0};
          4'd2: param_cmdr_addrrand_i  = {cmdr_rnum[12-3:0],4'b0};
          4'd3: param_cmdr_addrrand_i  = {cmdr_rnum[13-3:0],4'b0};
          4'd4: param_cmdr_addrrand_i  = {cmdr_rnum[14-3:0],4'b0};
          4'd5: param_cmdr_addrrand_i  = {cmdr_rnum[15-3:0],4'b0};
          4'd6: param_cmdr_addrrand_i  = {cmdr_rnum[16-3:0],4'b0};
          4'd7: param_cmdr_addrrand_i  = {cmdr_rnum[17-3:0],4'b0};
          4'd8: param_cmdr_addrrand_i  = {cmdr_rnum[18-3:0],4'b0};
          4'd9: param_cmdr_addrrand_i  = {cmdr_rnum[19-3:0],4'b0};
          4'd10: param_cmdr_addrrand_i = {cmdr_rnum[20-3:0],4'b0};
          4'd11: param_cmdr_addrrand_i = {cmdr_rnum[21-3:0],4'b0};
          4'd12: param_cmdr_addrrand_i = {cmdr_rnum[22-3:0],4'b0};
          4'd13: param_cmdr_addrrand_i = {cmdr_rnum[23-3:0],4'b0};
          4'd14: param_cmdr_addrrand_i = {cmdr_rnum[23-3:0],4'b0};
          4'd15: param_cmdr_addrrand_i = {cmdr_rnum[23-3:0],4'b0};  // redundant
        endcase         
     end // always @ begin
  end
if(C_M_AXI_DATA_WIDTH == 64) begin: RAND_R_ADDR_64_GEN
   always @(*)
     begin
        case (param_cmdr_addrrandrange_encoded) 
          4'd0: param_cmdr_addrrand_i  = {cmdr_rnum[10-2:0],3'b0};          
          4'd1: param_cmdr_addrrand_i  = {cmdr_rnum[11-2:0],3'b0};
          4'd2: param_cmdr_addrrand_i  = {cmdr_rnum[12-2:0],3'b0};
          4'd3: param_cmdr_addrrand_i  = {cmdr_rnum[13-2:0],3'b0};
          4'd4: param_cmdr_addrrand_i  = {cmdr_rnum[14-2:0],3'b0};
          4'd5: param_cmdr_addrrand_i  = {cmdr_rnum[15-2:0],3'b0};
          4'd6: param_cmdr_addrrand_i  = {cmdr_rnum[16-2:0],3'b0};
          4'd7: param_cmdr_addrrand_i  = {cmdr_rnum[17-2:0],3'b0};
          4'd8: param_cmdr_addrrand_i  = {cmdr_rnum[18-2:0],3'b0};
          4'd9: param_cmdr_addrrand_i  = {cmdr_rnum[19-2:0],3'b0};
          4'd10: param_cmdr_addrrand_i = {cmdr_rnum[20-2:0],3'b0};
          4'd11: param_cmdr_addrrand_i = {cmdr_rnum[21-2:0],3'b0};
          4'd12: param_cmdr_addrrand_i = {cmdr_rnum[22-2:0],3'b0};
          4'd13: param_cmdr_addrrand_i = {cmdr_rnum[23-2:0],3'b0};
          4'd14: param_cmdr_addrrand_i = {cmdr_rnum[23-2:0],3'b0};
          4'd15: param_cmdr_addrrand_i = {cmdr_rnum[23-2:0],3'b0};  // redundant
        endcase         
     end // always @ begin
  end 
if(C_M_AXI_DATA_WIDTH == 32) begin: RAND_R_ADDR_32_GEN
   always @(*)
     begin
        case (param_cmdr_addrrandrange_encoded) 
          4'd0: param_cmdr_addrrand_i  = {cmdr_rnum[10-1:0],2'b0};          
          4'd1: param_cmdr_addrrand_i  = {cmdr_rnum[11-1:0],2'b0};
          4'd2: param_cmdr_addrrand_i  = {cmdr_rnum[12-1:0],2'b0};
          4'd3: param_cmdr_addrrand_i  = {cmdr_rnum[13-1:0],2'b0};
          4'd4: param_cmdr_addrrand_i  = {cmdr_rnum[14-1:0],2'b0};
          4'd5: param_cmdr_addrrand_i  = {cmdr_rnum[15-1:0],2'b0};
          4'd6: param_cmdr_addrrand_i  = {cmdr_rnum[16-1:0],2'b0};
          4'd7: param_cmdr_addrrand_i  = {cmdr_rnum[17-1:0],2'b0};
          4'd8: param_cmdr_addrrand_i  = {cmdr_rnum[18-1:0],2'b0};
          4'd9: param_cmdr_addrrand_i  = {cmdr_rnum[19-1:0],2'b0};
          4'd10: param_cmdr_addrrand_i = {cmdr_rnum[20-1:0],2'b0};
          4'd11: param_cmdr_addrrand_i = {cmdr_rnum[21-1:0],2'b0};
          4'd12: param_cmdr_addrrand_i = {cmdr_rnum[22-1:0],2'b0};
          4'd13: param_cmdr_addrrand_i = {cmdr_rnum[23-1:0],2'b0};
          4'd14: param_cmdr_addrrand_i = {cmdr_rnum[23-1:0],2'b0};
          4'd15: param_cmdr_addrrand_i = {cmdr_rnum[23-1:0],2'b0};  // redundant
        endcase         
     end // always @ begin
  end 


   // checking address to gaurantee does not exceed range
   reg param_cmdr_maxaddr_check_32b,param_cmdr_maxaddr_check_64b,param_cmdr_maxaddr_check_128b,param_cmdr_maxaddr_check_256b,param_cmdr_maxaddr_check_512b ;
   
   
if(C_M_AXI_DATA_WIDTH == 32) begin: RAND_R_ADDR_32_CHK
   always @(*)
     begin
        //Set all other checks to 0
        param_cmdr_maxaddr_check_64b = 1'b0;
        param_cmdr_maxaddr_check_128b = 1'b0;
        param_cmdr_maxaddr_check_256b = 1'b0;
        param_cmdr_maxaddr_check_512b = 1'b0;
        case (param_cmdr_addrrandrange_encoded)
          4'd0: param_cmdr_maxaddr_check_32b  = (cmdr_rnum[9:8] == 2'h3) && (C_M_AXI_DATA_WIDTH == 32);          
          4'd1: param_cmdr_maxaddr_check_32b  = (cmdr_rnum[10:8]== 3'h7) && (C_M_AXI_DATA_WIDTH == 32);
          4'd2: param_cmdr_maxaddr_check_32b  = (cmdr_rnum[11:8]== 4'hf) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd3: param_cmdr_maxaddr_check_32b  = (cmdr_rnum[12:8]== 5'h1f) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd4: param_cmdr_maxaddr_check_32b  = (cmdr_rnum[13:8]== 6'h3f) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd5: param_cmdr_maxaddr_check_32b  = (cmdr_rnum[14:8]== 7'h7f) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd6: param_cmdr_maxaddr_check_32b  = (cmdr_rnum[15:8]== 8'hff) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd7: param_cmdr_maxaddr_check_32b  = (cmdr_rnum[16:8]== 9'h1ff) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd8: param_cmdr_maxaddr_check_32b  = (cmdr_rnum[17:8]== 10'h3ff) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd9: param_cmdr_maxaddr_check_32b  = (cmdr_rnum[18:8]== 11'h7ff) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd10: param_cmdr_maxaddr_check_32b = (cmdr_rnum[19:8]== 12'hfff) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd11: param_cmdr_maxaddr_check_32b = (cmdr_rnum[20:8]== 13'h1fff) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd12: param_cmdr_maxaddr_check_32b = (cmdr_rnum[21:8]== 14'h3fff) && (C_M_AXI_DATA_WIDTH == 32);
          4'd13: param_cmdr_maxaddr_check_32b = (cmdr_rnum[22:8]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 32);
          4'd14: param_cmdr_maxaddr_check_32b = (cmdr_rnum[23:8]== 16'hffff) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd15: param_cmdr_maxaddr_check_32b = (cmdr_rnum[23:8]== 16'hffff) && (C_M_AXI_DATA_WIDTH == 32);  // redundant
        endcase
     end // always @ begin
end

   
if(C_M_AXI_DATA_WIDTH == 64) begin: RAND_R_ADDR_64_CHK
   always @(*)
     begin
        //Set all other checks to 0
        param_cmdr_maxaddr_check_32b = 1'b0;
        param_cmdr_maxaddr_check_128b = 1'b0;
        param_cmdr_maxaddr_check_256b = 1'b0;
        param_cmdr_maxaddr_check_512b = 1'b0;
        case (param_cmdr_addrrandrange_encoded)
          4'd0: param_cmdr_maxaddr_check_64b  = (cmdr_rnum[9:9] == 1'h1) && (C_M_AXI_DATA_WIDTH == 64);          
          4'd1: param_cmdr_maxaddr_check_64b  = (cmdr_rnum[10:9]== 2'h3) && (C_M_AXI_DATA_WIDTH == 64);
          4'd2: param_cmdr_maxaddr_check_64b  = (cmdr_rnum[11:9]== 3'h7) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd3: param_cmdr_maxaddr_check_64b  = (cmdr_rnum[12:9]== 4'hf) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd4: param_cmdr_maxaddr_check_64b  = (cmdr_rnum[13:9]== 5'h1f) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd5: param_cmdr_maxaddr_check_64b  = (cmdr_rnum[14:9]== 6'h3f) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd6: param_cmdr_maxaddr_check_64b  = (cmdr_rnum[15:9]== 7'h7f) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd7: param_cmdr_maxaddr_check_64b  = (cmdr_rnum[16:9]== 8'hff) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd8: param_cmdr_maxaddr_check_64b  = (cmdr_rnum[17:9]== 9'h1ff) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd9: param_cmdr_maxaddr_check_64b  = (cmdr_rnum[18:9]== 10'h3ff) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd10: param_cmdr_maxaddr_check_64b = (cmdr_rnum[19:9]== 11'h7ff) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd11: param_cmdr_maxaddr_check_64b = (cmdr_rnum[20:9]== 12'hfff) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd12: param_cmdr_maxaddr_check_64b = (cmdr_rnum[21:9]== 13'h1fff) && (C_M_AXI_DATA_WIDTH == 64);
          4'd13: param_cmdr_maxaddr_check_64b = (cmdr_rnum[22:9]== 14'h3fff) && (C_M_AXI_DATA_WIDTH == 64);
          4'd14: param_cmdr_maxaddr_check_64b = (cmdr_rnum[23:9]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd15: param_cmdr_maxaddr_check_64b = (cmdr_rnum[23:9]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 64); 
        endcase
     end // always @ begin
end

 if(C_M_AXI_DATA_WIDTH == 128) begin: RAND_R_ADDR_128_CHK
   always @(*)
     begin
        //Set all other checks to 0
        param_cmdr_maxaddr_check_32b = 1'b0;
        param_cmdr_maxaddr_check_64b = 1'b0;
        param_cmdr_maxaddr_check_256b = 1'b0;
        param_cmdr_maxaddr_check_512b = 1'b0;
        case (param_cmdr_addrrandrange_encoded)
          //4'd0: param_cmdr_maxaddr_check_128b  = (cmdr_rnum[10:10] == 1'h1) && (C_M_AXI_DATA_WIDTH >= 128);          
          4'd0: param_cmdr_maxaddr_check_128b  = (cmdr_rnum[8:8]== 1'h1) && (C_M_AXI_DATA_WIDTH == 128);
          4'd1: param_cmdr_maxaddr_check_128b  = (cmdr_rnum[9:8]== 2'h3) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd2: param_cmdr_maxaddr_check_128b  = (cmdr_rnum[10:8]== 3'h7) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd3: param_cmdr_maxaddr_check_128b  = (cmdr_rnum[11:8]== 4'hf) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd4: param_cmdr_maxaddr_check_128b  = (cmdr_rnum[12:8]== 5'h1f) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd5: param_cmdr_maxaddr_check_128b  = (cmdr_rnum[13:8]== 6'h3f) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd6: param_cmdr_maxaddr_check_128b  = (cmdr_rnum[14:8]== 7'h7f) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd7: param_cmdr_maxaddr_check_128b  = (cmdr_rnum[15:8]== 8'hff) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd8: param_cmdr_maxaddr_check_128b  = (cmdr_rnum[16:8]== 9'h1ff) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd9: param_cmdr_maxaddr_check_128b  = (cmdr_rnum[17:8]== 10'h3ff) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd10: param_cmdr_maxaddr_check_128b = (cmdr_rnum[18:8]== 11'h7ff) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd11: param_cmdr_maxaddr_check_128b = (cmdr_rnum[19:8]== 12'hfff) && (C_M_AXI_DATA_WIDTH == 128);
          4'd12: param_cmdr_maxaddr_check_128b = (cmdr_rnum[20:8]== 13'h1fff) && (C_M_AXI_DATA_WIDTH == 128);
          4'd13: param_cmdr_maxaddr_check_128b = (cmdr_rnum[21:8]== 14'h3fff) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd14: param_cmdr_maxaddr_check_128b = (cmdr_rnum[22:8]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd15: param_cmdr_maxaddr_check_128b = (cmdr_rnum[22:8]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 128); 
        endcase
     end // always @ begin
end
   
if(C_M_AXI_DATA_WIDTH == 256) begin: RAND_R_ADDR_256_CHK
   always @(*)
     begin
        //Set all other checks to 0
        param_cmdr_maxaddr_check_32b = 1'b0;
        param_cmdr_maxaddr_check_64b = 1'b0;
        param_cmdr_maxaddr_check_128b = 1'b0;
        param_cmdr_maxaddr_check_512b = 1'b0;
        case (param_cmdr_addrrandrange_encoded)
          //4'd0: param_cmdr_maxaddr_check_256b  = (cmdr_rnum[10:10] == 1'h1) && (C_M_AXI_DATA_WIDTH >= 256);          
          4'd0: param_cmdr_maxaddr_check_256b  = (cmdr_rnum[7:7]== 1'h1) && (C_M_AXI_DATA_WIDTH == 256);          
          4'd1: param_cmdr_maxaddr_check_256b  = (cmdr_rnum[8:7]== 2'h3) && (C_M_AXI_DATA_WIDTH == 256);
          4'd2: param_cmdr_maxaddr_check_256b  = (cmdr_rnum[9:7]== 3'h7) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd3: param_cmdr_maxaddr_check_256b  = (cmdr_rnum[10:7]== 4'hf) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd4: param_cmdr_maxaddr_check_256b  = (cmdr_rnum[11:7]== 5'h1f) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd5: param_cmdr_maxaddr_check_256b  = (cmdr_rnum[12:7]== 6'h2f) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd6: param_cmdr_maxaddr_check_256b  = (cmdr_rnum[13:7]== 7'h7f) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd7: param_cmdr_maxaddr_check_256b  = (cmdr_rnum[14:7]== 8'hff) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd8: param_cmdr_maxaddr_check_256b  = (cmdr_rnum[15:7]== 9'h1ff) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd9: param_cmdr_maxaddr_check_256b  = (cmdr_rnum[16:7]== 10'h3ff) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd10: param_cmdr_maxaddr_check_256b = (cmdr_rnum[17:7]== 11'h7ff) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd11: param_cmdr_maxaddr_check_256b = (cmdr_rnum[18:7]== 12'hfff) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd12: param_cmdr_maxaddr_check_256b = (cmdr_rnum[19:7]== 13'h1fff) && (C_M_AXI_DATA_WIDTH == 256);
          4'd13: param_cmdr_maxaddr_check_256b = (cmdr_rnum[20:7]== 14'h3fff) && (C_M_AXI_DATA_WIDTH == 256);
          4'd14: param_cmdr_maxaddr_check_256b = (cmdr_rnum[21:7]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd15: param_cmdr_maxaddr_check_256b = (cmdr_rnum[21:7]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 256); 
        endcase
     end // always @ begin
end

if(C_M_AXI_DATA_WIDTH == 512) begin: RAND_R_ADDR_512_CHK
   always @(*)
     begin
        //Set all other checks to 0
        param_cmdr_maxaddr_check_32b = 1'b0;
        param_cmdr_maxaddr_check_64b = 1'b0;
        param_cmdr_maxaddr_check_128b = 1'b0;
        param_cmdr_maxaddr_check_256b = 1'b0;
        case (param_cmdr_addrrandrange_encoded)
          //4'd0: param_cmdr_maxaddr_check_512b  = (cmdr_rnum[10:10] == 1'h1) && (C_M_AXI_DATA_WIDTH >= 512);          
          4'd0: param_cmdr_maxaddr_check_512b  = (cmdr_rnum[6:6]== 1'h1) && (C_M_AXI_DATA_WIDTH == 512);          
          4'd1: param_cmdr_maxaddr_check_512b  = (cmdr_rnum[7:6]== 2'h3) && (C_M_AXI_DATA_WIDTH == 512);
          4'd2: param_cmdr_maxaddr_check_512b  = (cmdr_rnum[8:6]== 3'h7) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd3: param_cmdr_maxaddr_check_512b  = (cmdr_rnum[9:6]== 4'hf) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd4: param_cmdr_maxaddr_check_512b  = (cmdr_rnum[10:6]== 5'h1f) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd5: param_cmdr_maxaddr_check_512b  = (cmdr_rnum[11:6]== 6'h2f) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd6: param_cmdr_maxaddr_check_512b  = (cmdr_rnum[12:6]== 7'h7f) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd7: param_cmdr_maxaddr_check_512b  = (cmdr_rnum[13:6]== 8'hff) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd8: param_cmdr_maxaddr_check_512b  = (cmdr_rnum[14:6]== 9'h1ff) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd9: param_cmdr_maxaddr_check_512b  = (cmdr_rnum[15:6]== 10'h3ff) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd10: param_cmdr_maxaddr_check_512b = (cmdr_rnum[16:6]== 11'h7ff) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd11: param_cmdr_maxaddr_check_512b = (cmdr_rnum[17:6]== 12'hfff) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd12: param_cmdr_maxaddr_check_512b = (cmdr_rnum[18:6]== 13'h1fff) && (C_M_AXI_DATA_WIDTH == 512);
          4'd13: param_cmdr_maxaddr_check_512b = (cmdr_rnum[19:6]== 14'h3fff) && (C_M_AXI_DATA_WIDTH == 512);
          4'd14: param_cmdr_maxaddr_check_512b = (cmdr_rnum[20:6]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd15: param_cmdr_maxaddr_check_512b = (cmdr_rnum[20:6]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 512); 
        endcase
     end // always @ begin
end

   reg  [31:0] param_cmdr_addrrand_ff;
   reg  [31:0] param_cmdr_addrrand_2ff;
   reg  [31:0] rand_base_chkr_t_ff;
   reg  [31:0] rand_base_chkr_ff;
   wire param_cmdr_addrrand_valid;
   wire param_cmdr_addrincr_valid;
   wire param_cmdr_intervalrand_valid;   
   wire [31:0]  rand_base_chkr_t = cmd_out_mr_regslice[31:0] + param_cmdr_addrrand_i_ff;
   wire [31:0]  rand_base_chkr = rand_base_chkr_t_ff - param_maxburstbytes;
   wire [31:0] param_cmdr_addrrand       = (param_cmdr_maxaddr_check_512b | param_cmdr_maxaddr_check_256b | param_cmdr_maxaddr_check_128b | param_cmdr_maxaddr_check_64b | param_cmdr_maxaddr_check_32b) ? 
                                           (cmd_out_mr_regslice[31:0] > rand_base_chkr_ff) ? cmd_out_mr_regslice[31:0] : rand_base_chkr_ff : 
                                           (cmd_out_mr_regslice[31:0] + param_cmdr_addrrand_i_ff);
   assign param_cmdr_addrrand_valid      = ( param_cmdr_addrmode_ff == `SQOP_ADDRMODE_RAND );
   assign param_cmdr_addrincr_valid      = ( param_cmdr_addrmode_ff == `SQOP_ADDRMODE_INCR );  
   //Currently NOT IN USE
   assign param_cmdr_intervalrand_valid  = ( param_cmdr_intervalmode_ff == `SQOP_INTERVALMODE_RAND ); 

   always @(posedge Clk) begin
     rand_base_chkr_ff         <= rand_base_chkr;
     rand_base_chkr_t_ff       <= rand_base_chkr_t;
     rand_addr_n_ff            <= rand_addr_n;
     rand_addr_n               <= param_cmdr_addrrand + param_cmdr_addrrandc;
   end

   always @(posedge Clk) begin
     param_cmdr_addrrand_ff    <= param_cmdr_addrrand;
     param_cmdr_addrrand_2ff   <= param_cmdr_addrrand_ff;
     rand_addr_n_tmpc          <= rand_addr_n - (param_cmdr_addrrand_ff & 32'hFFFFF000);
     rand_addr_n_tmp           <= param_cmdr_addrrand_2ff - rand_addr_n_tmpc;
   end



   wire        newcmdr_param_valid            = cmd_out_mr[63]; 
   wire        param_cmdr_repeatop_valid      = newcmdr_param_valid && 
                                                   paramram_mr_regslice[23:1] != 23'h0 && // need value >1
                                                   paramram_mr_regslice[31:29] == `SQOP_REPEATOP;   
   assign        param_cmdr_repeatfixedop_valid = newcmdr_param_valid &&
                                                   paramram_mr_regslice[31:29] == `SQOP_FIXEDREPEATOP;
   assign        param_cmdr_delayop_valid = newcmdr_param_valid && 
                                                   paramram_mr_regslice[31:29] == `SQOP_DELAYOP;
   
   
   
   
   always @(*)
     begin

        param_cmdr_state_nxt          = param_cmdr_state_ff;
        param_cmdr_submitcnt_nxt      = param_cmdr_submitcnt_ff;
        param_cmdr_addr_nxt           = param_cmdr_addr_ff;        
        param_cmdr_disable_submitincr = 1'b0;       
        param_cmdr_addrmux            = 1'b0;
        four_k_bound_chk              = four_k_bound_chk_ff;
        
        case (param_cmdr_state_ff)
          `SQOP_ST_IDLE :
            begin
               param_cmdr_submitcnt_nxt   = 0 ;               
               param_cmdr_addr_nxt        = 'h0;
               four_k_bound_chk           = {adr_out_mr[C_M_AXI_ADDR_WIDTH-33:0], cmd_out_mr_addr_align_four};

               if ( param_cmdr_repeatop_valid || param_cmdr_repeatfixedop_valid )
                 begin
                    param_cmdr_disable_submitincr = 1'b1;                    
                    if (param_cmdr_addrrand_valid & ~param_cmdr_addrrand[11])
                      begin
                         param_cmdr_addr_nxt      = {adr_out_mr[C_M_AXI_ADDR_WIDTH-33:0], param_cmdr_addrrand};
                      end
                    else
                      begin
                        param_cmdr_addr_nxt      = {adr_out_mr[C_M_AXI_ADDR_WIDTH-33:0], cmd_out_mr[31:0]};
                      end   
                    param_cmdr_state_nxt = `SQOP_ST_ACTIVE;
                 end        
               else
                 begin
                   param_cmdr_state_nxt = `SQOP_ST_IDLE;
                 end
            end

          `SQOP_ST_ACTIVE :
            begin


               if (  mar_ptr_new_ff != mar_ptr_new_2ff )
                 
                 param_cmdr_submitcnt_nxt  = 8'h0;
               else if (mar_fifo_push_ff)                 
                 param_cmdr_submitcnt_nxt = param_cmdr_submitcnt_ff+1;

               
               if (param_cmdr_repeatop_valid && (param_cmdr_submitcnt_ff != param_cmdr_count_minus1_ff))
                 param_cmdr_disable_submitincr = 1'b1;
               else if (param_cmdr_repeatfixedop_valid && (param_cmdr_submitcnt_ff != C_REPEAT_COUNT))
                 param_cmdr_disable_submitincr = 1'b1;
               
               if  (param_cmdr_submitcnt_ff > 0 && (param_cmdr_addrrand_valid | param_cmdr_addrincr_valid))
                 param_cmdr_addrmux = 1'b1;

               if (param_cmdr_addrrand_valid & ~param_cmdr_addrrand[11])
                 begin
                   if (param_cmdr_addrrand_2ff[31:12] != rand_addr_n_ff[31:12]) begin
                     if (rand_addr_n_tmp < cmd_out_mr_regslice[31:0])
                       param_cmdr_addr_nxt      = {adr_out_mr[C_M_AXI_ADDR_WIDTH-33:0], cmd_out_mr_regslice[31:0]};
                     else
                       param_cmdr_addr_nxt      = {adr_out_mr[C_M_AXI_ADDR_WIDTH-33:0], rand_addr_n_tmp};
                   end
                   else begin
                    param_cmdr_addr_nxt      = {adr_out_mr[C_M_AXI_ADDR_WIDTH-33:0], param_cmdr_addrrand_2ff};
                   end
                 end
               else
                 begin                                        
                    // special case for ix:0, which has x's on cmd_mr_out initially...
                    if (param_cmdr_submitcnt_ff == 0) begin
                     if (cmd_out_mr_comp > {adr_out_mr[C_M_AXI_ADDR_WIDTH-33:0],cmd_out_mr_addr_align_four}) begin
                        param_cmdr_addr_nxt      = {adr_out_mr[C_M_AXI_ADDR_WIDTH-33:0],cmd_out_mr_addr_align_four};        
                        four_k_bound_chk         = {adr_out_mr[C_M_AXI_ADDR_WIDTH-33:0], cmd_out_mr_addr_align_eight};
                     end
                     else begin
                        param_cmdr_addr_nxt      = {adr_out_mr[C_M_AXI_ADDR_WIDTH-33:0], cmd_out_mr_regslice[31:0]}+param_cmdr_addrincr;        
                        four_k_bound_chk         = {adr_out_mr[C_M_AXI_ADDR_WIDTH-33:0], cmd_out_mr_addr_align_four};
                     end
                    end
                    else if ( mar_fifo_push_ff && ~mar_fifo_push_2ff && param_cmdr_addrincr_valid) begin
                    //else if ( mar_fifo_push_ff && param_cmdr_addrincr_valid) begin
                      if (param_cmdr_addr_tmp  > four_k_bound_chk_ff) begin
                        param_cmdr_addr_nxt      = {adr_out_mr[C_M_AXI_ADDR_WIDTH-33:0], four_k_bound_chk_ff};
                        four_k_bound_chk         = {adr_out_mr[C_M_AXI_ADDR_WIDTH-33:0], four_k_bound_chk_ff} + 32'd4096;
                      end
                      else begin
                        param_cmdr_addr_nxt      = param_cmdr_add_1;
                        four_k_bound_chk         = four_k_bound_chk_ff;
                      end
                    end
                 end
               
               if (  mar_ptr_new_ff != mar_ptr_new_2ff )         
                 param_cmdr_state_nxt = `SQOP_ST_IDLE  ;
               else
                 param_cmdr_state_nxt = `SQOP_ST_ACTIVE  ;
            end          
          default : param_cmdr_state_nxt = param_cmdr_state_ff;          
        endcase                                                       
     end

     always @(posedge Clk) begin
       cmd_out_mr_addr_align_four  <= cmd_out_mr_addr_align + 32'd4096;
       cmd_out_mr_addr_align_eight <= cmd_out_mr_addr_align + 32'd8192;
       cmd_out_mr_comp             <= {adr_out_mr[C_M_AXI_ADDR_WIDTH-33:0],cmd_out_mr_regslice[31:0]}+param_cmdr_addrincr+param_cmdr_addrincr;
     end
   

   // address mode incrementing...
   wire [127:0] param_cmdr_cmd_out_mr_data;
   wire [31:0] param_cmdr_cmd_out_mr_msb_addr;
   assign param_cmdr_cmd_out_mr_data[127:32] = cmd_out_mr_regslice[127:32];
   assign param_cmdr_cmd_out_mr_data[31:0]   = param_cmdr_addr_ff[31:0];      
   assign param_cmdr_cmd_out_mr_msb_addr[C_M_AXI_ADDR_WIDTH-33:0]   = param_cmdr_addr_ff[C_M_AXI_ADDR_WIDTH-1:32];      
   
   
   assign cmd_out_mr_postmux[31:0]    = (param_cmdr_addrmux) ? param_cmdr_cmd_out_mr_data[31:0]  :  cmd_out_mr_regslice_ff[31:0];
   assign cmd_out_mr_postmux[127:32]  = cmd_out_mr_regslice[127:32];  
   assign prm_out_mr_postmux[31:0]    = (param_cmdr_addrmux) ? param_cmdr_cmd_out_mr_msb_addr[31:0]  :  adr_out_mr[31:0];
   
   // retiming for timing closure
     always @(posedge Clk) begin 
        cmd_out_mr <= cmd_out_mr_postmux; 
        prm_out_mr <= prm_out_mr_postmux; 
     end
   
   /*
    *  CMDW PARAM FSM / CONTROL
    * 
    */
   reg [23:0]         param_cmdw_count_ff       ;
   reg [2:0]         param_cmdw_op_ff          ;      
   reg [1:0]         param_cmdw_addrmode_ff    ;
   reg [1:0]         param_cmdw_intervalmode_ff;
   reg                 param_cmdw_idmode_ff      ;
   
   
   wire [23:0] cmdw_rnum;
   wire [15:0] w_randnum;
   assign cmdw_rnum  = {w_randnum[7:0],w_randnum[15:0]};
   
   axi_traffic_gen_v2_0_10_randgen #(
               .seed         (C_AXI_WR_ADDR_SEED)
   ) cmdw_rand (
               .randnum      (w_randnum),
               .generate_next(1'b1     ),
               .reset        (~rst_l   ),
               .clk          (Clk      )
               );

   

   reg  [23:0]  param_cmdw_count_minus1_ff ;
   wire [23:0]         paramram_mw_regslice_minus1 = paramram_mw_regslice[23:0]-1;
   

   wire [23:0] param_cmdw_count_int = (paramram_mw_regslice[23:0] <= 24'd6) ? 24'b0 : paramram_mw_regslice[23:0]-24'h6; 
   wire [11:0] param_cmdw_dint = (paramram_mw_regslice[19:8] <= 12'd6) ? 12'b0 : paramram_mw_regslice[19:8]-12'h6; 
   wire [23:0] param_cmdw_count_dint = {paramram_mw_regslice[23:20],param_cmdw_dint,paramram_mw_regslice[7:0]};
   assign      param_cmdw_count  = (param_cmdw_repeatfixedop_valid == 1'b1) ? param_cmdw_count_dint : param_cmdw_count_int;

   
   always @(posedge Clk) begin 
      param_cmdw_count_ff          <=   paramram_mw_regslice[23:0]    ;
      param_cmdw_count_minus1_ff   <=   paramram_mw_regslice_minus1    ;
      
      param_cmdw_addrmode_ff       <=   paramram_mw_regslice[25:24]  ;      
      param_cmdw_intervalmode_ff   <=   paramram_mw_regslice[27:26]    ;   
      param_cmdw_idmode_ff         <=   paramram_mw_regslice[28]       ;
      param_cmdw_op_ff             <=   paramram_mw_regslice[31:29]   ;

   end 

   // opcntrl signals here, will be validated by opcode field
   reg [3:0] param_cmdw_addrrandrange_encoded; 
   always @(posedge Clk) begin 
      param_cmdw_addrrandrange_encoded <=   paramram_mw_regslice[23:20]      ;      
   end   

   reg [3:0]  param_cmdw_state_nxt;
   reg [23:0] param_cmdw_submitcnt_nxt;
   
   // control for incrementing counters during special op
   reg [C_M_AXI_ADDR_WIDTH-1:0] param_cmdw_addr_ff;
   reg [C_M_AXI_ADDR_WIDTH-1:0] param_cmdw_add_1;
   reg [C_M_AXI_ADDR_WIDTH-1:0] param_cmdw_addr_nxt;
   reg [C_M_AXI_ADDR_WIDTH-1:0] param_cmdw_addr_tmp;
   reg [C_M_AXI_ADDR_WIDTH-1:0] four_k_bound_chkw;
   reg [C_M_AXI_ADDR_WIDTH-1:0] four_k_bound_chk_ffw;   
   reg               param_cmdw_addrmux;
  
   wire [31:0] cmd_out_mw_addr_align = cmd_out_mw_regslice[31:0] & 32'hFFFFF000;
   reg [31:0] cmd_out_mw_addr_align_four;
   reg [31:0] cmd_out_mw_addr_align_eight;
   reg [C_M_AXI_ADDR_WIDTH-1:0] cmd_out_mw_comp;

   wire [12:0] param_cmdw_addrincr = (cmd_out_mw_regslice[39:32]+1) << param_incr_shift;
   wire [12:0] param_cmdw_addrrandc = (cmd_out_mw_regslice[39:32]+1) << param_incr_shift;
   reg [12:0]  param_cmdw_addrincr_ff;
   reg maw_fifo_push_2ff;
   reg [31:0] rand_addw_n;
   reg [31:0] rand_addw_n_ff;
   reg [31:0] rand_addw_n_tmp;
   reg [31:0] rand_addw_n_tmpc;
   reg [31:0] param_cmdw_addrrand_i;
   reg [31:0] param_cmdw_addrrand_i_ff;
   
   reg [3:0]  param_cmdw_state_ff;
    always @(posedge Clk) begin  
       param_cmdw_addrincr_ff     <= (rst_l) ? param_cmdw_addrincr      : 13'h0;
       param_cmdw_state_ff        <= (rst_l) ? param_cmdw_state_nxt     : `SQOP_ST_IDLE;
       param_cmdw_submitcnt_ff    <= (rst_l) ? param_cmdw_submitcnt_nxt : 24'h0; 
       param_cmdw_addr_ff         <= (rst_l) ? param_cmdw_addr_nxt      : 32'h0;
       param_cmdw_add_1           <= (rst_l) ? param_cmdw_addr_ff+param_cmdw_addrincr_ff : 32'h0;
       param_cmdw_addr_tmp        <= (rst_l) ? param_cmdw_add_1+param_cmdw_addrincr_ff    : 32'h0;
       four_k_bound_chk_ffw       <= (rst_l) ? four_k_bound_chkw        : 32'h0;
       maw_fifo_push_2ff          <= (rst_l) ? maw_fifo_push_ff         : 1'b0;
       param_cmdw_addrrand_i_ff   <= (rst_l) ? param_cmdw_addrrand_i    : 1'b0;
    end



if(C_M_AXI_DATA_WIDTH == 512) begin: RAND_W_ADDR_512_GEN
   always @(*)
     begin
        case (param_cmdw_addrrandrange_encoded)
          4'd0: param_cmdw_addrrand_i  = {cmdw_rnum[10-5:0],6'b0};          
          4'd1: param_cmdw_addrrand_i  = {cmdw_rnum[11-5:0],6'b0};
          4'd2: param_cmdw_addrrand_i  = {cmdw_rnum[12-5:0],6'b0};
          4'd3: param_cmdw_addrrand_i  = {cmdw_rnum[13-5:0],6'b0};
          4'd4: param_cmdw_addrrand_i  = {cmdw_rnum[14-5:0],6'b0};
          4'd5: param_cmdw_addrrand_i  = {cmdw_rnum[15-5:0],6'b0};
          4'd6: param_cmdw_addrrand_i  = {cmdw_rnum[16-5:0],6'b0};
          4'd7: param_cmdw_addrrand_i  = {cmdw_rnum[17-5:0],6'b0};
          4'd8: param_cmdw_addrrand_i  = {cmdw_rnum[18-5:0],6'b0};
          4'd9: param_cmdw_addrrand_i  = {cmdw_rnum[19-5:0],6'b0};
          4'd10: param_cmdw_addrrand_i = {cmdw_rnum[20-5:0],6'b0};
          4'd11: param_cmdw_addrrand_i = {cmdw_rnum[21-5:0],6'b0};
          4'd12: param_cmdw_addrrand_i = {cmdw_rnum[22-5:0],6'b0};
          4'd13: param_cmdw_addrrand_i = {cmdw_rnum[23-5:0],6'b0};
          4'd14: param_cmdw_addrrand_i = {cmdw_rnum[23-5:0],6'b0};
          4'd15: param_cmdw_addrrand_i = {cmdw_rnum[23-5:0],6'b0};
        endcase
     end
end
if(C_M_AXI_DATA_WIDTH == 256) begin: RAND_W_ADDR_256_GEN
   always @(*)
     begin
        case (param_cmdw_addrrandrange_encoded)
          4'd0: param_cmdw_addrrand_i  = {cmdw_rnum[10-4:0],5'b0};          
          4'd1: param_cmdw_addrrand_i  = {cmdw_rnum[11-4:0],5'b0};
          4'd2: param_cmdw_addrrand_i  = {cmdw_rnum[12-4:0],5'b0};
          4'd3: param_cmdw_addrrand_i  = {cmdw_rnum[13-4:0],5'b0};
          4'd4: param_cmdw_addrrand_i  = {cmdw_rnum[14-4:0],5'b0};
          4'd5: param_cmdw_addrrand_i  = {cmdw_rnum[15-4:0],5'b0};
          4'd6: param_cmdw_addrrand_i  = {cmdw_rnum[16-4:0],5'b0};
          4'd7: param_cmdw_addrrand_i  = {cmdw_rnum[17-4:0],5'b0};
          4'd8: param_cmdw_addrrand_i  = {cmdw_rnum[18-4:0],5'b0};
          4'd9: param_cmdw_addrrand_i  = {cmdw_rnum[19-4:0],5'b0};
          4'd10: param_cmdw_addrrand_i = {cmdw_rnum[20-4:0],5'b0};
          4'd11: param_cmdw_addrrand_i = {cmdw_rnum[21-4:0],5'b0};
          4'd12: param_cmdw_addrrand_i = {cmdw_rnum[22-4:0],5'b0};
          4'd13: param_cmdw_addrrand_i = {cmdw_rnum[23-4:0],5'b0};
          4'd14: param_cmdw_addrrand_i = {cmdw_rnum[23-4:0],5'b0};
          4'd15: param_cmdw_addrrand_i = {cmdw_rnum[23-4:0],5'b0};
        endcase
     end
end
if(C_M_AXI_DATA_WIDTH == 128) begin: RAND_W_ADDR_128_GEN
   always @(*)
     begin
        case (param_cmdw_addrrandrange_encoded)
          4'd0: param_cmdw_addrrand_i  = {cmdw_rnum[10-3:0],4'b0};          
          4'd1: param_cmdw_addrrand_i  = {cmdw_rnum[11-3:0],4'b0};
          4'd2: param_cmdw_addrrand_i  = {cmdw_rnum[12-3:0],4'b0};
          4'd3: param_cmdw_addrrand_i  = {cmdw_rnum[13-3:0],4'b0};
          4'd4: param_cmdw_addrrand_i  = {cmdw_rnum[14-3:0],4'b0};
          4'd5: param_cmdw_addrrand_i  = {cmdw_rnum[15-3:0],4'b0};
          4'd6: param_cmdw_addrrand_i  = {cmdw_rnum[16-3:0],4'b0};
          4'd7: param_cmdw_addrrand_i  = {cmdw_rnum[17-3:0],4'b0};
          4'd8: param_cmdw_addrrand_i  = {cmdw_rnum[18-3:0],4'b0};
          4'd9: param_cmdw_addrrand_i  = {cmdw_rnum[19-3:0],4'b0};
          4'd10: param_cmdw_addrrand_i = {cmdw_rnum[20-3:0],4'b0};
          4'd11: param_cmdw_addrrand_i = {cmdw_rnum[21-3:0],4'b0};
          4'd12: param_cmdw_addrrand_i = {cmdw_rnum[22-3:0],4'b0};
          4'd13: param_cmdw_addrrand_i = {cmdw_rnum[23-3:0],4'b0};
          4'd14: param_cmdw_addrrand_i = {cmdw_rnum[23-3:0],4'b0};
          4'd15: param_cmdw_addrrand_i = {cmdw_rnum[23-3:0],4'b0};
        endcase
     end
end
if(C_M_AXI_DATA_WIDTH == 64) begin: RAND_W_ADDR_64_GEN
   always @(*)
     begin
        case (param_cmdw_addrrandrange_encoded)
          4'd0: param_cmdw_addrrand_i  = {cmdw_rnum[10-2:0],3'b0};          
          4'd1: param_cmdw_addrrand_i  = {cmdw_rnum[11-2:0],3'b0};
          4'd2: param_cmdw_addrrand_i  = {cmdw_rnum[12-2:0],3'b0};
          4'd3: param_cmdw_addrrand_i  = {cmdw_rnum[13-2:0],3'b0};
          4'd4: param_cmdw_addrrand_i  = {cmdw_rnum[14-2:0],3'b0};
          4'd5: param_cmdw_addrrand_i  = {cmdw_rnum[15-2:0],3'b0};
          4'd6: param_cmdw_addrrand_i  = {cmdw_rnum[16-2:0],3'b0};
          4'd7: param_cmdw_addrrand_i  = {cmdw_rnum[17-2:0],3'b0};
          4'd8: param_cmdw_addrrand_i  = {cmdw_rnum[18-2:0],3'b0};
          4'd9: param_cmdw_addrrand_i  = {cmdw_rnum[19-2:0],3'b0};
          4'd10: param_cmdw_addrrand_i = {cmdw_rnum[20-2:0],3'b0};
          4'd11: param_cmdw_addrrand_i = {cmdw_rnum[21-2:0],3'b0};
          4'd12: param_cmdw_addrrand_i = {cmdw_rnum[22-2:0],3'b0};
          4'd13: param_cmdw_addrrand_i = {cmdw_rnum[23-2:0],3'b0};
          4'd14: param_cmdw_addrrand_i = {cmdw_rnum[23-2:0],3'b0};
          4'd15: param_cmdw_addrrand_i = {cmdw_rnum[23-2:0],3'b0};
        endcase
     end
end 
if(C_M_AXI_DATA_WIDTH == 32) begin: RAND_W_ADDR_32_GEN
   always @(*)
     begin
        case (param_cmdw_addrrandrange_encoded)
          4'd0: param_cmdw_addrrand_i  = {cmdw_rnum[10-1:0],2'b0};          
          4'd1: param_cmdw_addrrand_i  = {cmdw_rnum[11-1:0],2'b0};
          4'd2: param_cmdw_addrrand_i  = {cmdw_rnum[12-1:0],2'b0};
          4'd3: param_cmdw_addrrand_i  = {cmdw_rnum[13-1:0],2'b0};
          4'd4: param_cmdw_addrrand_i  = {cmdw_rnum[14-1:0],2'b0};
          4'd5: param_cmdw_addrrand_i  = {cmdw_rnum[15-1:0],2'b0};
          4'd6: param_cmdw_addrrand_i  = {cmdw_rnum[16-1:0],2'b0};
          4'd7: param_cmdw_addrrand_i  = {cmdw_rnum[17-1:0],2'b0};
          4'd8: param_cmdw_addrrand_i  = {cmdw_rnum[18-1:0],2'b0};
          4'd9: param_cmdw_addrrand_i  = {cmdw_rnum[19-1:0],2'b0};
          4'd10: param_cmdw_addrrand_i = {cmdw_rnum[20-1:0],2'b0};
          4'd11: param_cmdw_addrrand_i = {cmdw_rnum[21-1:0],2'b0};
          4'd12: param_cmdw_addrrand_i = {cmdw_rnum[22-1:0],2'b0};
          4'd13: param_cmdw_addrrand_i = {cmdw_rnum[23-1:0],2'b0};
          4'd14: param_cmdw_addrrand_i = {cmdw_rnum[23-1:0],2'b0};
          4'd15: param_cmdw_addrrand_i = {cmdw_rnum[23-1:0],2'b0};
        endcase
     end
end 


   reg param_cmdw_maxaddr_check_32b,param_cmdw_maxaddr_check_64b,param_cmdw_maxaddr_check_128b,param_cmdw_maxaddr_check_256b,param_cmdw_maxaddr_check_512b;
   
if(C_M_AXI_DATA_WIDTH == 32) begin: RAND_W_ADDR_32_CHK
   always @(*)
     begin
        //Set all other checks to 0
        param_cmdw_maxaddr_check_64b = 1'b0;
        param_cmdw_maxaddr_check_128b = 1'b0;
        param_cmdw_maxaddr_check_256b = 1'b0;
        param_cmdw_maxaddr_check_512b = 1'b0;
        case (param_cmdw_addrrandrange_encoded)
          4'd0: param_cmdw_maxaddr_check_32b  = (cmdw_rnum[9:8] == 2'h3) && (C_M_AXI_DATA_WIDTH == 32);          
          4'd1: param_cmdw_maxaddr_check_32b  = (cmdw_rnum[10:8]== 3'h7) && (C_M_AXI_DATA_WIDTH == 32);
          4'd2: param_cmdw_maxaddr_check_32b  = (cmdw_rnum[11:8]== 4'hf) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd3: param_cmdw_maxaddr_check_32b  = (cmdw_rnum[12:8]== 5'h1f) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd4: param_cmdw_maxaddr_check_32b  = (cmdw_rnum[13:8]== 6'h3f) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd5: param_cmdw_maxaddr_check_32b  = (cmdw_rnum[14:8]== 7'h7f) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd6: param_cmdw_maxaddr_check_32b  = (cmdw_rnum[15:8]== 8'hff) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd7: param_cmdw_maxaddr_check_32b  = (cmdw_rnum[16:8]== 9'h1ff) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd8: param_cmdw_maxaddr_check_32b  = (cmdw_rnum[17:8]== 10'h3ff) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd9: param_cmdw_maxaddr_check_32b  = (cmdw_rnum[18:8]== 11'h7ff) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd10: param_cmdw_maxaddr_check_32b = (cmdw_rnum[19:8]== 12'hfff) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd11: param_cmdw_maxaddr_check_32b = (cmdw_rnum[20:8]== 13'h1fff) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd12: param_cmdw_maxaddr_check_32b = (cmdw_rnum[21:8]== 14'h3fff) && (C_M_AXI_DATA_WIDTH == 32);
          4'd13: param_cmdw_maxaddr_check_32b = (cmdw_rnum[22:8]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 32);
          4'd14: param_cmdw_maxaddr_check_32b = (cmdw_rnum[23:8]== 16'hffff) && (C_M_AXI_DATA_WIDTH == 32); 
          4'd15: param_cmdw_maxaddr_check_32b = (cmdw_rnum[23:8]== 16'hffff) && (C_M_AXI_DATA_WIDTH == 32); 
        endcase
     end // always @ begin
end

if(C_M_AXI_DATA_WIDTH == 64) begin: RAND_W_ADDR_64_CHK
   
   always @(*)
     begin
        //Set all other checks to 0
        param_cmdw_maxaddr_check_32b = 1'b0;
        param_cmdw_maxaddr_check_128b = 1'b0;
        param_cmdw_maxaddr_check_256b = 1'b0;
        param_cmdw_maxaddr_check_512b = 1'b0;
        case (param_cmdw_addrrandrange_encoded)
          4'd0: param_cmdw_maxaddr_check_64b  = (cmdw_rnum[9:9] == 1'h1) && (C_M_AXI_DATA_WIDTH == 64);          
          4'd1: param_cmdw_maxaddr_check_64b  = (cmdw_rnum[10:9]== 2'h3) && (C_M_AXI_DATA_WIDTH == 64);
          4'd2: param_cmdw_maxaddr_check_64b  = (cmdw_rnum[11:9]== 3'h7) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd3: param_cmdw_maxaddr_check_64b  = (cmdw_rnum[12:9]== 4'hf) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd4: param_cmdw_maxaddr_check_64b  = (cmdw_rnum[13:9]== 5'h1f) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd5: param_cmdw_maxaddr_check_64b  = (cmdw_rnum[14:9]== 6'h3f) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd6: param_cmdw_maxaddr_check_64b  = (cmdw_rnum[15:9]== 7'h7f) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd7: param_cmdw_maxaddr_check_64b  = (cmdw_rnum[16:9]== 8'hff) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd8: param_cmdw_maxaddr_check_64b  = (cmdw_rnum[17:9]== 9'h1ff) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd9: param_cmdw_maxaddr_check_64b  = (cmdw_rnum[18:9]== 10'h3ff) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd10: param_cmdw_maxaddr_check_64b = (cmdw_rnum[19:9]== 11'h7ff) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd11: param_cmdw_maxaddr_check_64b = (cmdw_rnum[20:9]== 12'hfff) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd12: param_cmdw_maxaddr_check_64b = (cmdw_rnum[21:9]== 13'h1fff) && (C_M_AXI_DATA_WIDTH == 64);
          4'd13: param_cmdw_maxaddr_check_64b = (cmdw_rnum[22:9]== 14'h3fff) && (C_M_AXI_DATA_WIDTH == 64);
          4'd14: param_cmdw_maxaddr_check_64b = (cmdw_rnum[23:9]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 64); 
          4'd15: param_cmdw_maxaddr_check_64b = (cmdw_rnum[23:9]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 64); 
        endcase
     end // always @ begin
end

if(C_M_AXI_DATA_WIDTH == 128) begin: RAND_W_ADDR_128_CHK
   always @(*)
     begin
        //Set all other checks to 0
        param_cmdw_maxaddr_check_32b = 1'b0;
        param_cmdw_maxaddr_check_64b = 1'b0;
        param_cmdw_maxaddr_check_256b = 1'b0;
        param_cmdw_maxaddr_check_512b = 1'b0;
        case (param_cmdw_addrrandrange_encoded)
          //4'd0: param_cmdw_maxaddr_check_128b  = (cmdw_rnum[10:10] == 1'h1) && (C_M_AXI_DATA_WIDTH >= 128);          
          4'd0: param_cmdw_maxaddr_check_128b  = (cmdw_rnum[8:8]== 1'h1) && (C_M_AXI_DATA_WIDTH == 128);
          4'd1: param_cmdw_maxaddr_check_128b  = (cmdw_rnum[9:8]== 2'h3) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd2: param_cmdw_maxaddr_check_128b  = (cmdw_rnum[10:8]== 3'h7) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd3: param_cmdw_maxaddr_check_128b  = (cmdw_rnum[11:8]== 4'hf) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd4: param_cmdw_maxaddr_check_128b  = (cmdw_rnum[12:8]== 5'h1f) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd5: param_cmdw_maxaddr_check_128b  = (cmdw_rnum[13:8]== 6'h3f) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd6: param_cmdw_maxaddr_check_128b  = (cmdw_rnum[14:8]== 7'h7f) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd7: param_cmdw_maxaddr_check_128b  = (cmdw_rnum[15:8]== 8'hff) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd8: param_cmdw_maxaddr_check_128b  = (cmdw_rnum[16:8]== 9'h1ff) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd9: param_cmdw_maxaddr_check_128b  = (cmdw_rnum[17:8]== 10'h3ff) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd10: param_cmdw_maxaddr_check_128b = (cmdw_rnum[18:8]== 11'h7ff) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd11: param_cmdw_maxaddr_check_128b = (cmdw_rnum[19:8]== 12'hfff) && (C_M_AXI_DATA_WIDTH == 128);
          4'd12: param_cmdw_maxaddr_check_128b = (cmdw_rnum[20:8]== 13'h1fff) && (C_M_AXI_DATA_WIDTH == 128);
          4'd13: param_cmdw_maxaddr_check_128b = (cmdw_rnum[21:8]== 14'h3fff) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd14: param_cmdw_maxaddr_check_128b = (cmdw_rnum[22:8]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 128); 
          4'd15: param_cmdw_maxaddr_check_128b = (cmdw_rnum[22:8]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 128); 
        endcase
     end // always @ begin
end
   
if(C_M_AXI_DATA_WIDTH == 256) begin: RAND_W_ADDR_256_CHK
   always @(*)
     begin
        //Set all other checks to 0
        param_cmdw_maxaddr_check_32b = 1'b0;
        param_cmdw_maxaddr_check_64b = 1'b0;
        param_cmdw_maxaddr_check_128b = 1'b0;
        param_cmdw_maxaddr_check_512b = 1'b0;
        case (param_cmdw_addrrandrange_encoded)
          //4'd0: param_cmdw_maxaddr_check_256b  = (cmdw_rnum[10:10] == 1'h1) && (C_M_AXI_DATA_WIDTH >= 256);          
          4'd0: param_cmdw_maxaddr_check_256b  = (cmdw_rnum[7:7]== 1'h1) && (C_M_AXI_DATA_WIDTH == 256);          
          4'd1: param_cmdw_maxaddr_check_256b  = (cmdw_rnum[8:7]== 2'h3) && (C_M_AXI_DATA_WIDTH == 256);
          4'd2: param_cmdw_maxaddr_check_256b  = (cmdw_rnum[9:7]== 3'h7) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd3: param_cmdw_maxaddr_check_256b  = (cmdw_rnum[10:7]== 4'hf) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd4: param_cmdw_maxaddr_check_256b  = (cmdw_rnum[11:7]== 5'h1f) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd5: param_cmdw_maxaddr_check_256b  = (cmdw_rnum[12:7]== 6'h2f) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd6: param_cmdw_maxaddr_check_256b  = (cmdw_rnum[13:7]== 7'h7f) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd7: param_cmdw_maxaddr_check_256b  = (cmdw_rnum[14:7]== 8'hff) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd8: param_cmdw_maxaddr_check_256b  = (cmdw_rnum[15:7]== 9'h1ff) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd9: param_cmdw_maxaddr_check_256b  = (cmdw_rnum[16:7]== 10'h3ff) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd10: param_cmdw_maxaddr_check_256b = (cmdw_rnum[17:7]== 11'h7ff) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd11: param_cmdw_maxaddr_check_256b = (cmdw_rnum[18:7]== 12'hfff) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd12: param_cmdw_maxaddr_check_256b = (cmdw_rnum[19:7]== 13'h1fff) && (C_M_AXI_DATA_WIDTH == 256);
          4'd13: param_cmdw_maxaddr_check_256b = (cmdw_rnum[20:7]== 14'h3fff) && (C_M_AXI_DATA_WIDTH == 256);
          4'd14: param_cmdw_maxaddr_check_256b = (cmdw_rnum[21:7]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 256); 
          4'd15: param_cmdw_maxaddr_check_256b = (cmdw_rnum[21:7]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 256); 
        endcase
     end // always @ begin
end

if(C_M_AXI_DATA_WIDTH == 512) begin: RAND_W_ADDR_512_CHK
   always @(*)
     begin
        //Set all other checks to 0
        param_cmdw_maxaddr_check_32b = 1'b0;
        param_cmdw_maxaddr_check_64b = 1'b0;
        param_cmdw_maxaddr_check_128b = 1'b0;
        param_cmdw_maxaddr_check_256b = 1'b0;
        case (param_cmdw_addrrandrange_encoded)
          //4'd0: param_cmdw_maxaddr_check_512b  = (cmdw_rnum[10:10] == 1'h1) && (C_M_AXI_DATA_WIDTH >= 512);          
          4'd0: param_cmdw_maxaddr_check_512b  = (cmdw_rnum[6:6]== 1'h1) && (C_M_AXI_DATA_WIDTH == 512);          
          4'd1: param_cmdw_maxaddr_check_512b  = (cmdw_rnum[7:6]== 2'h3) && (C_M_AXI_DATA_WIDTH == 512);
          4'd2: param_cmdw_maxaddr_check_512b  = (cmdw_rnum[8:6]== 3'h7) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd3: param_cmdw_maxaddr_check_512b  = (cmdw_rnum[9:6]== 4'hf) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd4: param_cmdw_maxaddr_check_512b  = (cmdw_rnum[10:6]== 5'h1f) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd5: param_cmdw_maxaddr_check_512b  = (cmdw_rnum[11:6]== 6'h2f) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd6: param_cmdw_maxaddr_check_512b  = (cmdw_rnum[12:6]== 7'h7f) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd7: param_cmdw_maxaddr_check_512b  = (cmdw_rnum[13:6]== 8'hff) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd8: param_cmdw_maxaddr_check_512b  = (cmdw_rnum[14:6]== 9'h1ff) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd9: param_cmdw_maxaddr_check_512b  = (cmdw_rnum[15:6]== 10'h3ff) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd10: param_cmdw_maxaddr_check_512b = (cmdw_rnum[16:6]== 11'h7ff) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd11: param_cmdw_maxaddr_check_512b = (cmdw_rnum[17:6]== 12'hfff) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd12: param_cmdw_maxaddr_check_512b = (cmdw_rnum[18:6]== 13'h1fff) && (C_M_AXI_DATA_WIDTH == 512);
          4'd13: param_cmdw_maxaddr_check_512b = (cmdw_rnum[19:6]== 14'h3fff) && (C_M_AXI_DATA_WIDTH == 512);
          4'd14: param_cmdw_maxaddr_check_512b = (cmdw_rnum[20:6]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 512); 
          4'd15: param_cmdw_maxaddr_check_512b = (cmdw_rnum[20:6]== 15'h7fff) && (C_M_AXI_DATA_WIDTH == 512); 
        endcase
     end // always @ begin
end

   reg [31:0] param_cmdw_addrrand_ff;
   reg [31:0] param_cmdw_addrrand_2ff;
   reg [31:0] rand_base_chkw_t_ff;
   reg [31:0] rand_base_chkw_ff;
   wire param_cmdw_addrrand_valid;
   wire param_cmdw_addrincr_valid;
   wire param_cmdw_intervalrand_valid;
   wire [31:0]  rand_base_chkw_t = cmd_out_mw_regslice[31:0] + param_cmdw_addrrand_i_ff;
   wire [31:0]  rand_base_chkw = rand_base_chkw_t_ff - param_maxburstbytes;
   wire [31:0] param_cmdw_addrrand       = (param_cmdw_maxaddr_check_512b | param_cmdw_maxaddr_check_256b | param_cmdw_maxaddr_check_128b | param_cmdw_maxaddr_check_64b | param_cmdw_maxaddr_check_32b) ? 
                                           (cmd_out_mw_regslice[31:0] > rand_base_chkw_ff) ? cmd_out_mw_regslice[31:0] : rand_base_chkw_ff : 
                                           (cmd_out_mw_regslice[31:0] + param_cmdw_addrrand_i_ff);

   assign param_cmdw_addrrand_valid      = ( param_cmdw_addrmode_ff == `SQOP_ADDRMODE_RAND );
   assign param_cmdw_addrincr_valid      = ( param_cmdw_addrmode_ff == `SQOP_ADDRMODE_INCR );  

   assign param_cmdw_intervalrand_valid  = ( param_cmdw_intervalmode_ff == `SQOP_INTERVALMODE_RAND ); 

   always @(posedge Clk) begin
     rand_base_chkw_ff          <= rand_base_chkw;
     rand_base_chkw_t_ff        <= rand_base_chkw_t;
     rand_addw_n_ff             <= rand_addw_n;
     rand_addw_n                <= param_cmdw_addrrand + param_cmdw_addrrandc;
   end

   always @(posedge Clk) begin
     param_cmdw_addrrand_ff     <= param_cmdw_addrrand;
     param_cmdw_addrrand_2ff    <= param_cmdw_addrrand_ff;
     rand_addw_n_tmpc           <= rand_addw_n - (param_cmdw_addrrand_ff & 32'hFFFFF000);
     rand_addw_n_tmp            <= param_cmdw_addrrand_2ff - rand_addw_n_tmpc;
   end

   
   wire        newcmdw_param_valid = cmd_out_mw[63];
   
   wire        param_cmdw_repeatop_valid = newcmdw_param_valid && 
                                           paramram_mw_regslice[23:1] != 23'h0 && // need value >1
                                           paramram_mw_regslice[31:29] == `SQOP_REPEATOP;   
   assign        param_cmdw_repeatfixedop_valid = newcmdw_param_valid &&
                                                paramram_mw_regslice[31:29] == `SQOP_FIXEDREPEATOP;
   assign        param_cmdw_delayop_valid = newcmdw_param_valid && 
                                    paramram_mw_regslice[31:29] == `SQOP_DELAYOP;   

   always @(*)
     begin

        param_cmdw_state_nxt               = param_cmdw_state_ff;
        param_cmdw_submitcnt_nxt           = param_cmdw_submitcnt_ff;
        param_cmdw_addr_nxt                = param_cmdw_addr_ff;        
        param_cmdw_disable_submitincr      = 1'b0;       
        param_cmdw_addrmux                 = 1'b0;
        four_k_bound_chkw                  = four_k_bound_chk_ffw;
        
        case (param_cmdw_state_ff)
          `SQOP_ST_IDLE :
            begin
               param_cmdw_submitcnt_nxt   = 0;               
               param_cmdw_addr_nxt        = 0;
               four_k_bound_chkw          = {adr_out_mw[C_M_AXI_ADDR_WIDTH-33:0], cmd_out_mw_addr_align_four};

               if ( param_cmdw_repeatop_valid || param_cmdw_repeatfixedop_valid )
         
                 begin
                    param_cmdw_disable_submitincr = 1'b1;                    

                    if (param_cmdw_addrrand_valid & ~param_cmdw_addrrand[11])
                      begin
                         param_cmdw_addr_nxt      = {adr_out_mw[C_M_AXI_ADDR_WIDTH-33:0], param_cmdw_addrrand};
                      end
                    else
                      begin                    
                       param_cmdw_addr_nxt      = {adr_out_mw[C_M_AXI_ADDR_WIDTH-33:0], cmd_out_mw[31:0]};
                      end
                    param_cmdw_state_nxt = `SQOP_ST_ACTIVE;
                 end        
               else
                 begin
                    param_cmdw_state_nxt = `SQOP_ST_IDLE;
                 end
            end

          `SQOP_ST_ACTIVE :
            begin
               //rand_addw_n = param_cmdw_addrrand+param_cmdw_addrrandc;
               //rand_addw_n_tmp = param_cmdw_addrrand - (rand_addw_n - (param_cmdw_addrrand & 32'hFFFFF000));

               if (  maw_ptr_new_ff != maw_ptr_new_2ff )
                 param_cmdw_submitcnt_nxt = 8'h0;
               else if (maw_fifo_push_ff)                 
                 param_cmdw_submitcnt_nxt = param_cmdw_submitcnt_ff+1;

               
               if (param_cmdw_repeatop_valid && (param_cmdw_submitcnt_ff != param_cmdw_count_minus1_ff))
                 param_cmdw_disable_submitincr = 1'b1;
               else if (param_cmdw_repeatfixedop_valid && (param_cmdw_submitcnt_ff != C_REPEAT_COUNT))
                 param_cmdw_disable_submitincr = 1'b1;


               
               if  (param_cmdw_submitcnt_ff > 0 && (param_cmdw_addrrand_valid | param_cmdw_addrincr_valid))
                 param_cmdw_addrmux = 1'b1;
               
               if (param_cmdw_addrrand_valid & ~param_cmdw_addrrand[11])
                 begin
                  if (param_cmdw_addrrand_2ff[31:12] != rand_addw_n_ff[31:12]) begin
                    if (rand_addw_n_tmp < cmd_out_mw_regslice[31:0])
                      param_cmdw_addr_nxt      = {adr_out_mw[C_M_AXI_ADDR_WIDTH-33:0], cmd_out_mw_regslice[31:0]};
                    else
                      param_cmdw_addr_nxt      = {adr_out_mw[C_M_AXI_ADDR_WIDTH-33:0], rand_addw_n_tmp};
                  end
                  else begin
                    param_cmdw_addr_nxt      = {adr_out_mw[C_M_AXI_ADDR_WIDTH-33:0], param_cmdw_addrrand_2ff};
                  end
                 end
               else
                 begin               
                    // special case for ix:0, which has x's on cmd_mr_out initially...
                    if (param_cmdw_submitcnt_ff == 0) begin
                      if (cmd_out_mw_comp > {adr_out_mw[C_M_AXI_ADDR_WIDTH-33:0],cmd_out_mw_addr_align_four}) begin
                        param_cmdw_addr_nxt      = {adr_out_mw[C_M_AXI_ADDR_WIDTH-33:0],cmd_out_mw_addr_align_four};
                        four_k_bound_chkw        = {adr_out_mw[C_M_AXI_ADDR_WIDTH-33:0], cmd_out_mw_addr_align_eight};
                      end
                      else begin
                        param_cmdw_addr_nxt      = {adr_out_mw[C_M_AXI_ADDR_WIDTH-33:0], cmd_out_mw_regslice[31:0]+param_cmdw_addrincr};
                        four_k_bound_chkw        = {adr_out_mw[C_M_AXI_ADDR_WIDTH-33:0], cmd_out_mw_addr_align_four};
                      end
                    end    
                    else if ( maw_fifo_push_ff && ~maw_fifo_push_2ff && param_cmdw_addrincr_valid) begin
                    //else if ( maw_fifo_push_ff && param_cmdw_addrincr_valid) begin
                      if (param_cmdw_addr_tmp > four_k_bound_chk_ffw) begin
                        param_cmdw_addr_nxt      = {adr_out_mw[C_M_AXI_ADDR_WIDTH-33:0], four_k_bound_chk_ffw};
                        four_k_bound_chkw        = {adr_out_mw[C_M_AXI_ADDR_WIDTH-33:0], four_k_bound_chk_ffw} + 32'd4096;
                      end
                      else begin
                        param_cmdw_addr_nxt      = param_cmdw_add_1;
                        four_k_bound_chkw        = four_k_bound_chk_ffw;
                      end
                    end  
                 end


               if (  maw_ptr_new_ff != maw_ptr_new_2ff )             
                 param_cmdw_state_nxt = `SQOP_ST_IDLE  ;
               else
                 param_cmdw_state_nxt = `SQOP_ST_ACTIVE  ;
            end
          
          default : param_cmdw_state_nxt <= param_cmdw_state_ff;          
        endcase                                                       
     end


     always @(posedge Clk) begin
       cmd_out_mw_addr_align_four  <= cmd_out_mw_addr_align + 32'd4096;
       cmd_out_mw_addr_align_eight <= cmd_out_mw_addr_align + 32'd8192;
       cmd_out_mw_comp             <= {adr_out_mw[C_M_AXI_ADDR_WIDTH-33:0], cmd_out_mw_regslice[31:0]}+param_cmdw_addrincr+param_cmdw_addrincr;
     end
   

   // address mode incrementing...
   wire [127:0] param_cmdw_cmd_out_mw_data;
   wire [31:0] param_cmdw_cmd_out_mw_msb_addr;
   assign param_cmdw_cmd_out_mw_data[127:32] = cmd_out_mw_regslice[127:32];   
   assign param_cmdw_cmd_out_mw_data[31:0]   = param_cmdw_addr_ff;      
   assign param_cmdw_cmd_out_mw_msb_addr[C_M_AXI_ADDR_WIDTH-33:0]   = param_cmdw_addr_ff[C_M_AXI_ADDR_WIDTH-1:32];      

   assign cmd_out_mw_postmux[31:0]    = (param_cmdw_addrmux) ? param_cmdw_cmd_out_mw_data[31:0]  :  cmd_out_mw_regslice_ff[31:0];
   assign cmd_out_mw_postmux[127:32]  = cmd_out_mw_regslice[127:32];   
   assign prm_out_mw_postmux[31:0]    = (param_cmdw_addrmux) ? param_cmdw_cmd_out_mw_msb_addr[31:0]  :  adr_out_mw[31:0];

  
   
  always @(posedge Clk) begin 
     cmd_out_mw <= cmd_out_mw_postmux; 
     prm_out_mw <= prm_out_mw_postmux; 
  end
   
end
endgenerate

endmodule
