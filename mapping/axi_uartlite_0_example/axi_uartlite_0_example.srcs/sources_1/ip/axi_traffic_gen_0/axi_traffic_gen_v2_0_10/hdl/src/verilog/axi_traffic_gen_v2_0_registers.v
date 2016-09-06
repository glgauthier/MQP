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
// Filename:       axi_traffic_gen_v2_0_10_registers.v
// Version : v1.0
// Description:    Registers defined/implemented for the core to set/report
// various features/status of the core.
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
`include "axi_traffic_gen_v2_0_10_defines.v"
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_registers
# (
  parameter C_IS_COHERENT           = 0 ,
  parameter C_IS_AFI                = 0 ,
  parameter C_M_AXI_DATA_WIDTH      = 32,
  parameter C_IS_AXI4               = 1 ,
  parameter C_S_AXI_DATA_WIDTH      = 32,
  parameter C_M_AXI_THREAD_ID_WIDTH = 1 ,
  parameter C_S_AXI_ID_WIDTH        = 1 ,   
  parameter C_ATG_BASIC_AXI4        = 0 ,
  parameter C_ATG_REPEAT_TYPE       = 0 , //0-One-shit,1-Repititive
  parameter C_ATG_HLTP_MODE         = 0 , //0-Custom,1-High Level Traffic.
  parameter C_ATG_STATIC            = 0 ,
  parameter C_ATG_SLAVE_ONLY        = 0 ,
  parameter C_ATG_SYSTEM_INIT       = 0 ,
  parameter C_ATG_STREAMING         = 0  
) (
 input                         Clk                        ,
 input                         rst_l                      ,
 input                         core_global_start          , 
 input                         core_global_stop           ,

//write
 input [15:0]                  wr_reg_decode              ,
 input [31:0]                  wr_reg_data                ,
 input [9:0]                   reg0_mr_ptr_update         ,
 input [9:0]                   reg0_mw_ptr_update         ,
 input                         mr_done_ff                 ,
 input                         mw_done_ff                 ,
 input                         rddec6_valid_ff            ,
 input [15:0]                  err_new_slv                ,

//read
 input [15:0]                  rd_reg_decode              ,
 output [31:0]                 rd_reg_data_raw            ,

 input [71:0]                  slv_ex_info0_ff            ,
 input [71:0]                  slv_ex_info1_ff            , 
 input [71:0]                  slv_ex_info1               , 
 input                         slv_ex_valid0_ff           ,
 input                         slv_ex_valid1_ff           ,
 input                         slv_ex_toggle_ff           ,
//masterwrite
 input                         b_resp_unexp_ff            ,                              
 input                         b_resp_bad_ff              ,                              
//masterslave
 input                         mr_unexp                   ,
 input                         mr_fifo_out_resp_bad       ,
 input                         mr_bad_last_ff             ,
//controls to external modules

 output                        reg1_disallow_excl         ,
 output                        reg1_sgl_slv_wr            ,
 output                        reg1_wrs_block_rds         ,
 output                        reg1_sgl_slv_rd            ,
 output reg [9:0]              reg0_mw_ptr_ff             ,
 output                        reg0_m_enable_cmdram_mrw   ,
 output                        reg0_m_enable_cmdram_mrw_ff,
 output reg                    reg0_m_enable_ff           ,
 output reg                    reg0_m_enable_3ff          ,
 output reg                    reg0_loop_en_ff            ,

 //masterread
 output reg [9:0]              reg0_mr_ptr_ff             ,

 output                        err_out                    , 
 output                        irq_out                    ,
 //debug capture
 output  [9:0]                 reg0_mr_ptr                ,
 output  [9:0]                 reg0_mw_ptr                ,
 output  [7:0]                 reg0_rev
);

//write path
reg  [31:0] reg1_slvctl_ff    ;
reg  [31:0] reg2_err_ff       ;
reg  [31:0] reg3_err_en_ff    ;
reg  [31:0] reg4_mstctl_ff    ;
reg  [31:0] reg9_dbgpause1_ff ;
reg  [31:0] reg10_dbgpause2_ff;
reg  [31:0] reg11_dbgpause3_ff;
reg        reg0_m_enable_2ff  ;
reg        reg0_m_enable_2pff  ;

//generate global_start/global_stop pulse
wire global_start_pulse;
wire global_stop_pulse;
reg global_start_1ff;
reg global_stop_1ff;
always @(posedge Clk) begin
        global_start_1ff  <= (rst_l) ? core_global_start : 1'b0;
        global_stop_1ff   <= (rst_l) ? core_global_stop  : 1'b0;
end
assign global_start_pulse = ~global_start_1ff & core_global_start;
assign global_stop_pulse  = ~global_stop_1ff  & core_global_stop ;

wire reg0_m_disable;
//
//loop from sw registers-enable.
//
wire set_reg0_loop_en; //enable looping from sw register.
wire set_reg0_loop_dis; //disable looping from sw register.
//reg  reg0_loop_en_ff;
//
//Generate control signal for repeat pattern type
//
wire repetitive_on;
assign repetitive_on = (C_ATG_REPEAT_TYPE == 1 & C_ATG_HLTP_MODE == 1 ) ? 1'b1 :
                       (C_ATG_HLTP_MODE == 0 & reg0_loop_en_ff == 1'b1) ? 1'b1 :1'b0;
wire restart_core_pre1;
reg restart_core_pre;
reg restart_core; //Delayed to allow better settling time for the core before
                  //re-start.

reg cycle_complete;
reg cycle_complete_1ff;

//wait for disable, and generate a restart pulse
//always @(posedge Clk) begin
//  if(rst_l == 1'b0 ) begin
//    cycle_complete      <= 1'b0;
//    cycle_complete_1ff  <= 1'b0;
//    restart_core_pre    <= 1'b0;
//    restart_core        <= 1'b0;
//  end else begin
//    if(repetitive_on == 1'b1) begin
//      cycle_complete      <= reg0_m_disable;
//      cycle_complete_1ff  <= cycle_complete;
//      restart_core_pre    <= restart_core_pre1;
//      restart_core        <= restart_core_pre;
//    end
//  end
//end
//assign restart_core_pre1 =  ~cycle_complete_1ff & cycle_complete;
//pulse generation for HLTP-REPEAT-ON
reg  hltp_repeat_pre;
reg  hltp_repeat_pre_d1;
always @(posedge Clk) begin
  if(rst_l == 1'b0 ) begin
    hltp_repeat_pre    <= 1'b0;
    hltp_repeat_pre_d1 <= 1'b0;
  end else if(C_ATG_REPEAT_TYPE == 1 & C_ATG_HLTP_MODE == 1)begin
    hltp_repeat_pre    <= 1'b1;
    hltp_repeat_pre_d1 <= hltp_repeat_pre;
  end
end
wire hltp_repeat_pulse;
assign hltp_repeat_pulse = ~hltp_repeat_pre_d1 & hltp_repeat_pre;

wire set_reg0_m_enable;
assign set_reg0_m_enable = (wr_reg_decode[0] & wr_reg_data[20] ) | (global_start_pulse);// | (restart_core);
assign set_reg0_loop_en  = (wr_reg_decode[0] & wr_reg_data[19] ) | (global_start_pulse &(C_ATG_REPEAT_TYPE == 1 & C_ATG_HLTP_MODE == 1) );
assign set_reg0_loop_dis = (wr_reg_decode[0] & ~wr_reg_data[19]) | (global_stop_pulse );

//register is sperated- only read/write functionality. This value will not
//effect the current running ptr value/initial value of the pointer.
reg [9:0] reg0_mr_ptr_reg_ff;
reg [9:0] reg0_mw_ptr_reg_ff;
wire [9:0]  reg0_mr_ptr_reg = (wr_reg_decode[0]) ? wr_reg_data[9:0] : reg0_mr_ptr_reg_ff;
wire [9:0]  reg0_mw_ptr_reg = (wr_reg_decode[0]) ? wr_reg_data[19:10] : reg0_mw_ptr_reg_ff;
assign reg0_mr_ptr = reg0_mr_ptr_update[9:0];
assign reg0_mw_ptr = reg0_mw_ptr_update[9:0];

assign reg0_m_disable = mr_done_ff && mw_done_ff;

wire reg0_m_enable = (set_reg0_m_enable) ? 1'b1 :
                     (reg0_m_disable)    ? 1'b0 : reg0_m_enable_ff;

wire reg0_loop_en = (set_reg0_loop_en)  ? 1'b1 :
                    (set_reg0_loop_dis) ? 1'b0 : 
                     reg0_loop_en_ff;

wire [31:0] reg1_slvctl = (wr_reg_decode[1]) ? wr_reg_data[31:0] :
                                                        reg1_slvctl_ff[31:0];
wire [31:0] reg2_err_pre2 = (wr_reg_decode[2]) ?
                        ~wr_reg_data[31:0] & reg2_err_ff[31:0] :
                                                        reg2_err_ff[31:0];
wire [31:0] reg3_err_en = (wr_reg_decode[3]) ? wr_reg_data[31:0] :
                                                        reg3_err_en_ff[31:0];
wire [31:0] reg4_mstctl = (wr_reg_decode[4]) ? wr_reg_data[31:0] :
                                                reg4_mstctl_ff[31:0];

wire [31:0] reg9_dbgpause1 = (wr_reg_decode[9]) ? wr_reg_data[31:0] :
                                                reg9_dbgpause1_ff[31:0];
wire [31:0] reg10_dbgpause2 = (wr_reg_decode[10]) ? wr_reg_data[31:0] :
                                                reg10_dbgpause2_ff[31:0];
wire [31:0] reg11_dbgpause3 = (wr_reg_decode[11]) ? wr_reg_data[31:0] :
                                                reg11_dbgpause3_ff[31:0];

wire [31:0] reg2_err_pre = { ~rddec6_valid_ff && reg2_err_pre2[31],
                                                        reg2_err_pre2[30:0] };
wire [31:16] err_new_mst;

//Clear Status register when the core is enabled afresh.
wire [31:0] reg2_err = (set_reg0_m_enable == 1'b1) ? (32'h0):
            (reg2_err_pre[31:0] | (reg3_err_en_ff[31:0] & { err_new_mst[31:16], err_new_slv[15:0] }));

wire        reg0_m_enable_3 = reg0_m_enable_ff && reg0_m_enable_2ff;
wire        reg0_m_enable_4 = reg0_m_enable_ff && reg0_m_enable_2pff;



always @(posedge Clk) begin
  reg0_m_enable_ff         <= (rst_l) ? reg0_m_enable : 1'b0;
  reg0_m_enable_2ff        <= (rst_l) ? reg0_m_enable_ff : 1'b0;
  reg0_m_enable_2pff       <= (rst_l) ? reg0_m_enable_3 : 1'b0;
  reg0_m_enable_3ff        <= (rst_l) ? reg0_m_enable_4 : 1'b0;
  reg1_slvctl_ff[31:0]     <= (rst_l) ? reg1_slvctl[31:0] : 32'h0;
  reg2_err_ff[31:0]        <= (rst_l) ? reg2_err[31:0] : 32'h0;
  reg3_err_en_ff[31:0]     <= (rst_l) ? reg3_err_en[31:0] : 32'h80000000;
  reg4_mstctl_ff[31:0]     <= (rst_l) ? reg4_mstctl[31:0] : 32'h0;
  reg9_dbgpause1_ff[31:0]  <= (rst_l) ? reg9_dbgpause1[31:0] : 32'h0;
  reg10_dbgpause2_ff[31:0] <= (rst_l) ? reg10_dbgpause2[31:0] : 32'h0;
  reg11_dbgpause3_ff[31:0] <= (rst_l) ? reg11_dbgpause3[31:0] : 32'h0;
  reg0_mr_ptr_reg_ff[9:0]  <= (rst_l) ? reg0_mr_ptr_reg[9:0] : 10'h0;
  reg0_mw_ptr_reg_ff[9:0]  <= (rst_l) ? reg0_mw_ptr_reg[9:0] : 10'h0;
  reg0_loop_en_ff          <= (rst_l) ? reg0_loop_en : 1'b0;
end

always @(posedge Clk) begin
  if(rst_l == 1'b0 ) begin
    reg0_mw_ptr_ff[9:0] <= 10'h0 ;
    reg0_mr_ptr_ff[9:0] <= 10'h0 ;
  end else if(reg0_m_disable == 1'b1) begin
    reg0_mw_ptr_ff[9:0] <= 10'h0 ;
    reg0_mr_ptr_ff[9:0] <= 10'h0 ;
  end else begin
    reg0_mw_ptr_ff[9:0] <= reg0_mw_ptr[9:0] ;
    reg0_mr_ptr_ff[9:0] <= reg0_mr_ptr[9:0] ;
  end
end
//read path


assign  reg0_rev = `AXIEX_REV;                // version, revision
wire        datam64 = (C_M_AXI_DATA_WIDTH == 64);
wire        datas64 = (C_S_AXI_DATA_WIDTH == 64);
wire [3:0] reg5_s_id_width = C_S_AXI_ID_WIDTH;
wire        is_axi4 = (C_IS_AXI4 != 0);
wire        is_coh = (C_IS_COHERENT != 0);
wire        is_afi = (C_IS_AFI != 0);
wire        is_pele_gs = 1'b0;

wire [1:0] afi_num = 2'b00;

wire [2:0] reg0_m_id_width = C_M_AXI_THREAD_ID_WIDTH-1'b1;
wire [31:0] reg0_rd = { reg0_rev[7:0],                                        //31:24
                        reg0_m_id_width[2:0], reg0_m_enable_ff,                //23:20 //KPOLISE
                        reg0_loop_en_ff,19'h0 };    //19:0
wire [31:0] reg1_rd = { 12'h0, reg1_slvctl_ff[19:0] };
wire [31:0] reg2_rd = reg2_err_ff[31:0];
wire [31:0] reg3_rd = reg3_err_en_ff[31:0];
wire [31:0] reg4_rd = { 16'h0, reg4_mstctl_ff[15:0] };
//wire [31:0] reg5_rd = { 1'b0, is_axi4, 1'b0, datam64,
//                1'b0, datas64, is_coh, is_afi,
//                reg5_s_id_width[3:0], is_pele_gs, 1'b0, afi_num[1:0],
//                5'h0, slv_ex_toggle_ff, slv_ex_valid1_ff, slv_ex_valid0_ff,
//                slv_ex_info0_ff[71:64] };
wire reserved_0 = 1'b0;
wire [2:0] m_data_width;
wire [2:0] s_data_width;
generate if(C_S_AXI_DATA_WIDTH == 32)  begin : ATG_S_D_WIDTH_32
  assign s_data_width = 3'b000;
end
endgenerate
generate if(C_S_AXI_DATA_WIDTH == 64)  begin : ATG_S_D_WIDTH_64
  assign s_data_width = 3'b001;
end
endgenerate
generate if(C_M_AXI_DATA_WIDTH == 32)  begin : ATG_M_D_WIDTH_32
  assign m_data_width = 3'b000;
end
endgenerate
generate if(C_M_AXI_DATA_WIDTH == 64)  begin : ATG_M_D_WIDTH_64
  assign m_data_width = 3'b001;
end
endgenerate
generate if(C_M_AXI_DATA_WIDTH == 128)  begin : ATG_M_D_WIDTH_128
  assign m_data_width = 3'b010;
end
endgenerate
generate if(C_M_AXI_DATA_WIDTH == 256)  begin : ATG_M_D_WIDTH_256
  assign m_data_width = 3'b011;
end
endgenerate
generate if(C_M_AXI_DATA_WIDTH == 512)  begin : ATG_M_D_WIDTH_512
  assign m_data_width = 3'b100;
end
endgenerate
wire mode_basic     =  (C_ATG_BASIC_AXI4  == 1 );
wire mode_static    =  (C_ATG_STATIC      == 1 );
wire mode_slvonly   =  (C_ATG_SLAVE_ONLY  == 1 );
wire mode_sysinit   =  (C_ATG_SYSTEM_INIT == 1 );
wire mode_streaming =  (C_ATG_STREAMING   == 1 );
wire mode_full      =  ~mode_basic && ~mode_static && ~mode_slvonly && ~mode_sysinit && ~mode_streaming;

wire [31:0] reg5_rd = { reserved_0    ,    //31
                        m_data_width  ,    //30-28
                        s_data_width  ,    //27-25
                        mode_full     ,    //24
                        mode_basic    ,    //23
                        mode_static   ,    //22
                        mode_slvonly  ,    //21
                        mode_sysinit  ,    //20
                        mode_streaming,    //19
                        {19 {reserved_0}}
                      };
//wire [31:0] reg7_rd = { slv_ex_info0_ff[63:40], slv_ex_info1[71:64] };
//wire [31:0] reg8_rd = slv_ex_info1_ff[63:32];
wire [31:0] reg7_rd = { 32'h0 };
wire [31:0] reg8_rd = 32'h0;
wire [31:0] reg9_rd = 32'h0;
wire [31:0] reg10_rd = 32'h0;
wire [31:0] reg11_rd = 32'h0;

assign rd_reg_data_raw =
        ((rd_reg_decode[0]) ? reg0_rd[31:0] : 32'h0) |
        ((rd_reg_decode[1]) ? reg1_rd[31:0] : 32'h0) |
        ((rd_reg_decode[2]) ? reg2_rd[31:0] : 32'h0) |
        ((rd_reg_decode[3]) ? reg3_rd[31:0] : 32'h0) |
        ((rd_reg_decode[4]) ? reg4_rd[31:0] : 32'h0) |
        ((rd_reg_decode[5]) ? reg5_rd[31:0] : 32'h0) |
        ((rd_reg_decode[6]) ? reg2_rd[31:0] : 32'h0) |
        ((rd_reg_decode[7]) ? reg7_rd[31:0] : 32'h0) |
        ((rd_reg_decode[8]) ? reg8_rd[31:0] : 32'h0) |
        ((rd_reg_decode[9]) ?  reg9_rd[31:0] : 32'h0) |
        ((rd_reg_decode[10]) ? reg10_rd[31:0] : 32'h0) |
        ((rd_reg_decode[11]) ? reg11_rd[31:0] : 32'h0);


//controls to external modules

wire [1:0] reg1_awready_pause_sel = reg1_slvctl_ff[1:0];
wire [1:0] reg1_arready_pause_sel = reg1_slvctl_ff[3:2];
wire [1:0] reg1_wready_pause_sel = reg1_slvctl_ff[5:4];
wire [1:0] reg1_bvalid_pause_sel = reg1_slvctl_ff[7:6];
wire [1:0] reg1_rvalid_pause_sel = reg1_slvctl_ff[9:8];
wire [1:0] reg1_bfifo_pause_sel = reg1_slvctl_ff[11:10];
wire [1:0] reg1_rdata_pause_sel = reg1_slvctl_ff[13:12];
wire        reg1_errsig_enable = reg1_slvctl_ff[15];
assign        reg1_sgl_slv_rd = reg1_slvctl_ff[16];
assign        reg1_sgl_slv_wr = reg1_slvctl_ff[17];
assign        reg1_disallow_excl = reg1_slvctl_ff[18];
assign        reg1_wrs_block_rds = reg1_slvctl_ff[19];

wire [1:0] reg4_awvalid_pause_sel = reg4_mstctl_ff[1:0];
wire [1:0] reg4_arvalid_pause_sel = reg4_mstctl_ff[3:2];
wire [1:0] reg4_wvalid_pause_sel = reg4_mstctl_ff[5:4];
wire [1:0] reg4_bready_pause_sel = reg4_mstctl_ff[7:6];
wire [1:0] reg4_rready_pause_sel = reg4_mstctl_ff[9:8];

wire        reg4_errsig_enable = reg4_mstctl_ff[15];


wire [3:0] dbg_pause;


   
   // grahams : removing for timing closure
assign        dbg_pause = 0;

   


//for Master logic
 axi_traffic_gen_v2_0_10_regslice
  #(
    .DWIDTH   (1                            ),
    .IDWIDTH  (1                            ),    
    .DATADEPTH(`REGSLICE_CMDRAM_MR_REGENABLE),
    .IDDEPTH  (1                            )
    )
   regenable_regslice
   (
    .din          (reg0_m_enable              ),
    .dout         (reg0_m_enable_cmdram_mrw_ff), 
    .dout_early   (reg0_m_enable_cmdram_mrw   ),  
    .idin         (1'b0                       ),
    .idout        (                           ),
    .id_stable    (                           ),
    .id_stable_ff (                           ),
    .data_stable  (                           ),
    .clk          (Clk                        ),  
    .reset        (~rst_l                     )  
    );  
 
//error updates from master-write path

wire        err_detect_slv = reg1_errsig_enable && (reg2_err_ff[15:0] != 16'h0);
wire        err_detect_mst = reg4_errsig_enable && (reg2_err_ff[30:16] != 15'h0);
wire        err_detect = err_detect_slv || err_detect_mst;
reg err_detect_ff;
always @(posedge Clk) begin
        err_detect_ff <= (rst_l) ? err_detect : 1'b0;
end
assign        err_out = err_detect_ff;
assign        irq_out = reg2_err_ff[31];


assign err_new_mst[31:16] = { reg0_m_disable, 7'h0,
        3'b000, mr_unexp,
        b_resp_unexp_ff, b_resp_bad_ff, 
        mr_fifo_out_resp_bad, mr_bad_last_ff };


endmodule
