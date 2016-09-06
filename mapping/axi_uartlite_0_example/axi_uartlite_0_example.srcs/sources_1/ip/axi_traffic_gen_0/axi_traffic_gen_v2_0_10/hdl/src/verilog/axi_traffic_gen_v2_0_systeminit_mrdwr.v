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
// Filename:       axi_traffic_gen_v2_0_10_systeminit_mrdwr.v
// Version : v1.0
// Description:    master read channel: Issue read commands based on the
// cmdgen block output
// Verilog-Standard:verilog-2001
//---------------------------------------------------------------------------
`timescale 1ps/1ps
`include "axi_traffic_gen_v2_0_10_defines.v"
(* DowngradeIPIdentifiedWarnings="yes" *)
module axi_traffic_gen_v2_0_10_systeminit_mrdwr #
(
  parameter C_M_AXI_THREAD_ID_WIDTH    = 1             ,
  parameter C_M_AXI_AWUSER_WIDTH       = 8             ,
  parameter C_M_AXI_DATA_WIDTH         = 32            ,
  parameter C_ATG_SYSTEM_INIT          = 0             ,
  parameter C_ATG_SYSTEM_TEST          = 0             ,
  parameter C_ATG_SYSTEM_CMD_MAX_RETRY =  32'hA        ,
  parameter C_ATG_SYSTEM_TEST_MAX_CLKS = 1000          ,
  parameter C_ATG_SYSTEM_MAX_CHANNELS  = 32'h1         ,
  parameter C_ATG_SYSTEM_CH1_LOW       = 32'h0000_0000 ,
  parameter C_ATG_SYSTEM_CH1_HIGH      = 32'h0000_00FF ,
  parameter C_ATG_SYSTEM_CH2_LOW       = 32'h0000_0100 ,
  parameter C_ATG_SYSTEM_CH2_HIGH      = 32'h0000_01FF ,
  parameter C_ATG_SYSTEM_CH3_LOW       = 32'h0000_0200 ,
  parameter C_ATG_SYSTEM_CH3_HIGH      = 32'h0000_02FF ,
  parameter C_ATG_SYSTEM_CH4_LOW       = 32'h0000_0300 ,
  parameter C_ATG_SYSTEM_CH4_HIGH      = 32'h0000_03FF ,
  parameter C_ATG_SYSTEM_CH5_LOW       = 32'h0000_0400 ,
  parameter C_ATG_SYSTEM_CH5_HIGH      = 32'h0000_04FF  
) (
// system
 input                                Clk          ,
 input                                rst_l        ,
//CH1
 output     [31:0]                    ch1_awaddr_m     ,
 output                               ch1_awvalid_m    ,
 input                                ch1_awready_m    ,
 output     [C_M_AXI_DATA_WIDTH-1:0]  ch1_wdata_m      ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]    ch1_wstrb_m      ,
 output                               ch1_wvalid_m     ,
 input                                ch1_wready_m     ,
 input [1:0]                          ch1_bresp_m      ,
 input                                ch1_bvalid_m     ,
 output                               ch1_bready_m     ,
 output     [31:0]                    ch1_araddr_m     ,
 output                               ch1_arvalid_m    ,
 input                                ch1_arready_m    ,
 input [C_M_AXI_DATA_WIDTH-1:0]       ch1_rdata_m      ,
 input                                ch1_rvalid_m     ,
 input [1:0]                          ch1_rresp_m      ,
 output                               ch1_rready_m     ,

//CH2
 output     [31:0]                    ch2_awaddr_m     ,
 output                               ch2_awvalid_m    ,
 input                                ch2_awready_m    ,
 output     [C_M_AXI_DATA_WIDTH-1:0]  ch2_wdata_m      ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]    ch2_wstrb_m      ,
 output                               ch2_wvalid_m     ,
 input                                ch2_wready_m     ,
 input [1:0]                          ch2_bresp_m      ,
 input                                ch2_bvalid_m     ,
 output                               ch2_bready_m     ,
 output     [31:0]                    ch2_araddr_m     ,
 output                               ch2_arvalid_m    ,
 input                                ch2_arready_m    ,
 input [C_M_AXI_DATA_WIDTH-1:0]       ch2_rdata_m      ,
 input                                ch2_rvalid_m     ,
 input [1:0]                          ch2_rresp_m      ,
 output                               ch2_rready_m     ,

//CH3
 output     [31:0]                    ch3_awaddr_m     ,
 output                               ch3_awvalid_m    ,
 input                                ch3_awready_m    ,
 output     [C_M_AXI_DATA_WIDTH-1:0]  ch3_wdata_m      ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]    ch3_wstrb_m      ,
 output                               ch3_wvalid_m     ,
 input                                ch3_wready_m     ,
 input [1:0]                          ch3_bresp_m      ,
 input                                ch3_bvalid_m     ,
 output                               ch3_bready_m     ,
 output     [31:0]                    ch3_araddr_m     ,
 output                               ch3_arvalid_m    ,
 input                                ch3_arready_m    ,
 input [C_M_AXI_DATA_WIDTH-1:0]       ch3_rdata_m      ,
 input                                ch3_rvalid_m     ,
 input [1:0]                          ch3_rresp_m      ,
 output                               ch3_rready_m     ,

//CH4
 output     [31:0]                    ch4_awaddr_m     ,
 output                               ch4_awvalid_m    ,
 input                                ch4_awready_m    ,
 output     [C_M_AXI_DATA_WIDTH-1:0]  ch4_wdata_m      ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]    ch4_wstrb_m      ,
 output                               ch4_wvalid_m     ,
 input                                ch4_wready_m     ,
 input [1:0]                          ch4_bresp_m      ,
 input                                ch4_bvalid_m     ,
 output                               ch4_bready_m     ,
 output     [31:0]                    ch4_araddr_m     ,
 output                               ch4_arvalid_m    ,
 input                                ch4_arready_m    ,
 input [C_M_AXI_DATA_WIDTH-1:0]       ch4_rdata_m      ,
 input                                ch4_rvalid_m     ,
 input [1:0]                          ch4_rresp_m      ,
 output                               ch4_rready_m     ,

//CH5
 output     [31:0]                    ch5_awaddr_m     ,
 output                               ch5_awvalid_m    ,
 input                                ch5_awready_m    ,
 output     [C_M_AXI_DATA_WIDTH-1:0]  ch5_wdata_m      ,
 output [C_M_AXI_DATA_WIDTH/8-1:0]    ch5_wstrb_m      ,
 output                               ch5_wvalid_m     ,
 input                                ch5_wready_m     ,
 input [1:0]                          ch5_bresp_m      ,
 input                                ch5_bvalid_m     ,
 output                               ch5_bready_m     ,
 output     [31:0]                    ch5_araddr_m     ,
 output                               ch5_arvalid_m    ,
 input                                ch5_arready_m    ,
 input [C_M_AXI_DATA_WIDTH-1:0]       ch5_rdata_m      ,
 input                                ch5_rvalid_m     ,
 input [1:0]                          ch5_rresp_m      ,
 output                               ch5_rready_m     ,


 output [9:0]                         rom_addr_ptr , 
 output [9:0]                         rom_data_ptr , 
 input [C_M_AXI_DATA_WIDTH-1:0]       rom_data     ,  
 input [C_M_AXI_DATA_WIDTH-1:0]       rom_ctrl     ,  
 input [C_M_AXI_DATA_WIDTH-1:0]       rom_mask     ,  
 input [127:0]                        cmd_out_mw   ,     
 output                               irq_out      ,                   
 output reg                           done         ,                
 output reg [31:0]                    status                
);

//-------Input Decode ---------
wire [31:0] addr_mif_entry;
wire [31:0] data_mif_entry;
wire [31:0] mask_mif_entry;
wire [31:0] ctrl_mif_entry;

assign addr_mif_entry = cmd_out_mw[31:0];
assign data_mif_entry = rom_data[31:0];
generate if(C_ATG_SYSTEM_TEST ==1 ) begin : ATG_SYSTEST_MIF
assign mask_mif_entry = rom_mask[31:0];
assign ctrl_mif_entry = rom_ctrl[31:0];
end
endgenerate
generate if(C_ATG_SYSTEM_INIT ==1 ) begin : ATG_SYSINIT_MIF
assign mask_mif_entry = 32'hFFFFFFFF;
assign ctrl_mif_entry = 32'h00010000;
end
endgenerate

wire cmd_valid;   
wire cmd_type_wnr;   //r-0,w-1
wire [1:0] rd_cmp_type;   // equal=2'b00,Less than = 2'b01,Greater than = 2'b10
wire cnt_as_error;
wire [7:0] fail_mif_index;
wire [7:0] pass_mif_index;

//NOTE::ctrl_mif_entry[19:18] are always reserved Should NOT be used.
assign cmd_valid      = cmd_out_mw[63];
assign rd_cmp_type    = ctrl_mif_entry[21:20];  
assign cnt_as_error   = ctrl_mif_entry[17];  
assign cmd_type_wnr   = ctrl_mif_entry[16];
assign pass_mif_index = ctrl_mif_entry[15:8];
assign fail_mif_index = ctrl_mif_entry[7:0];

//-------Input Decode Done---------
wire block_outputs;
wire cmdr1_valid,cmdw1_valid;
wire cmdr2_valid,cmdw2_valid;
wire cmdr3_valid,cmdw3_valid;
wire cmdr4_valid,cmdw4_valid;
wire cmdr5_valid,cmdw5_valid;
wire ch1_select;
wire ch2_select;
wire ch3_select;
wire ch4_select;
wire ch5_select;

//
//Generate ch*_select signals based on address decoding.
//NOTE:ch*_select generate statements can also be made with <= condition.
//     But expilicit decoding based on no.of channels is coded.
generate if(C_ATG_SYSTEM_MAX_CHANNELS ==1 ) begin : ATG_SYSINIT_CHNLS1
assign ch1_select = ((C_ATG_SYSTEM_CH1_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH1_HIGH )) ? 1'b1 : 1'b0;
assign ch2_select = 1'b0;
assign ch3_select = 1'b0;
assign ch4_select = 1'b0;
assign ch5_select = 1'b0;
end
endgenerate
generate if(C_ATG_SYSTEM_MAX_CHANNELS ==2 ) begin : ATG_SYSINIT_CHNLS2
assign ch1_select = ((C_ATG_SYSTEM_CH1_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH1_HIGH )) ? 1'b1 : 1'b0;
assign ch2_select = ((C_ATG_SYSTEM_CH2_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH2_HIGH )) ? 1'b1 : 1'b0;
assign ch3_select = 1'b0;
assign ch4_select = 1'b0;
assign ch5_select = 1'b0;
end
endgenerate
generate if(C_ATG_SYSTEM_MAX_CHANNELS ==3 ) begin : ATG_SYSINIT_CHNLS3
assign ch1_select = ((C_ATG_SYSTEM_CH1_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH1_HIGH )) ? 1'b1 : 1'b0;
assign ch2_select = ((C_ATG_SYSTEM_CH2_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH2_HIGH )) ? 1'b1 : 1'b0;
assign ch3_select = ((C_ATG_SYSTEM_CH3_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH3_HIGH )) ? 1'b1 : 1'b0;
assign ch4_select = 1'b0;
assign ch5_select = 1'b0;
end
endgenerate
generate if(C_ATG_SYSTEM_MAX_CHANNELS ==4 ) begin : ATG_SYSINIT_CHNLS4
assign ch1_select = ((C_ATG_SYSTEM_CH1_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH1_HIGH )) ? 1'b1 : 1'b0;
assign ch2_select = ((C_ATG_SYSTEM_CH2_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH2_HIGH )) ? 1'b1 : 1'b0;
assign ch3_select = ((C_ATG_SYSTEM_CH3_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH3_HIGH )) ? 1'b1 : 1'b0;
assign ch4_select = ((C_ATG_SYSTEM_CH4_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH4_HIGH )) ? 1'b1 : 1'b0;
assign ch5_select = 1'b0;
end
endgenerate
generate if(C_ATG_SYSTEM_MAX_CHANNELS ==5 ) begin : ATG_SYSINIT_CHNLS5
assign ch1_select = ((C_ATG_SYSTEM_CH1_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH1_HIGH )) ? 1'b1 : 1'b0;
assign ch2_select = ((C_ATG_SYSTEM_CH2_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH2_HIGH )) ? 1'b1 : 1'b0;
assign ch3_select = ((C_ATG_SYSTEM_CH3_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH3_HIGH )) ? 1'b1 : 1'b0;
assign ch4_select = ((C_ATG_SYSTEM_CH4_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH4_HIGH )) ? 1'b1 : 1'b0;
assign ch5_select = ((C_ATG_SYSTEM_CH5_LOW <= addr_mif_entry ) &
                     (addr_mif_entry <= C_ATG_SYSTEM_CH5_HIGH )) ? 1'b1 : 1'b0;
end
endgenerate

assign cmdr1_valid = ch1_select & cmd_valid & ~cmd_type_wnr;
assign cmdw1_valid = ch1_select & cmd_valid &  cmd_type_wnr;
assign cmdr2_valid = ch2_select & cmd_valid & ~cmd_type_wnr;
assign cmdw2_valid = ch2_select & cmd_valid &  cmd_type_wnr;
assign cmdr3_valid = ch3_select & cmd_valid & ~cmd_type_wnr;
assign cmdw3_valid = ch3_select & cmd_valid &  cmd_type_wnr;
assign cmdr4_valid = ch4_select & cmd_valid & ~cmd_type_wnr;
assign cmdw4_valid = ch4_select & cmd_valid &  cmd_type_wnr;
assign cmdr5_valid = ch5_select & cmd_valid & ~cmd_type_wnr;
assign cmdw5_valid = ch5_select & cmd_valid &  cmd_type_wnr;

wire cmdr_valid;
wire cmdw_valid;

assign cmdr_valid = cmdr1_valid | cmdr2_valid | cmdr3_valid | cmdr4_valid | cmdr5_valid;
assign cmdw_valid = cmdw1_valid | cmdw2_valid | cmdw3_valid | cmdw4_valid | cmdw5_valid;

//Internal protocol signals
reg  [31:0] awaddr_m     ;
reg         awvalid_m    ;
wire        awready_m    ;
reg  [31:0] wdata_m      ;
wire [3:0]  wstrb_m      ;
reg         wvalid_m     ;
wire        wready_m     ;
wire [1:0]  bresp_m      ;
wire        bvalid_m     ;
reg         bready_m     ;
reg  [31:0] araddr_m     ;
reg         arvalid_m    ;
wire        arready_m    ;
wire [31:0] rdata_m      ;
wire        rvalid_m     ;
wire [1:0]  rresp_m      ;
reg         rready_m     ;

//Core operation starts here
wire out_of_reset;
reg rst_l_ff;
reg rst_l_2ff;
reg rst_l_3ff;
always @(posedge Clk) begin
  rst_l_ff <= rst_l;
  rst_l_2ff <= rst_l_ff;
  rst_l_3ff <= rst_l_2ff;
end

assign out_of_reset = (rst_l_2ff == 1'b1) && (rst_l_3ff == 1'b0);


wire r_complete;
assign r_complete = rvalid_m && rready_m;
reg  r_complete_ff;
reg  r_complete_2ff;
reg  r_complete_3ff;
reg  b_complete_ff;
reg  b_complete_2ff;
reg  b_complete_3ff;

always @(posedge Clk) begin
  r_complete_ff   <= (rst_l) ? r_complete : 1'b0;
  r_complete_2ff  <= (rst_l) ? r_complete_ff : 1'b0;
  r_complete_3ff  <= (rst_l) ? r_complete_2ff : 1'b0;
end

wire launch_new_rd;
assign 	launch_new_rd = ((out_of_reset || r_complete_3ff || b_complete_3ff) & cmdr_valid & ~block_outputs ) ;

//AR
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    arvalid_m <= 1'b0;
  end else if(arready_m && arvalid_m) begin
    arvalid_m <= 1'b0;
  end else if(launch_new_rd ) begin
    arvalid_m <= 1'b1;
  end else begin
    arvalid_m <= arvalid_m;
  end
end

always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    araddr_m <= 'h0;
  end else if(launch_new_rd ) begin
    araddr_m <= addr_mif_entry[31:0];
  end else begin
    araddr_m <= araddr_m;
  end
end

//R
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    rready_m <= 1'b0;
  end else if(rvalid_m && rready_m) begin
    rready_m <=  1'b0;
  end else if(launch_new_rd ) begin
    rready_m <= 1'b1;
  end else begin
    rready_m <= rready_m;
  end
end

wire b_complete;
assign b_complete = bvalid_m && bready_m;
always @(posedge Clk) begin
  b_complete_ff  <= (rst_l) ? b_complete : 1'b0;
  b_complete_2ff <= (rst_l) ? b_complete_ff : 1'b0;
  b_complete_3ff <= (rst_l) ? b_complete_2ff : 1'b0;
end

wire launch_new_wr;
assign 	launch_new_wr = ((out_of_reset || b_complete_3ff || r_complete_3ff) & cmdw_valid & ~block_outputs);
//AW

always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    awvalid_m <= 1'b0;
  end else if(awready_m && awvalid_m) begin
    awvalid_m <= 1'b0;
  end else if(launch_new_wr ) begin
    awvalid_m <= 1'b1;
  end else begin
    awvalid_m <= awvalid_m;
  end
end

always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    awaddr_m <= 'h0;
  end else if(launch_new_wr ) begin
    awaddr_m <= addr_mif_entry[31:0];
  end else begin
    awaddr_m <= awaddr_m;
  end
end

//W
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    wvalid_m <= 1'b0;
  end else if(wready_m && wvalid_m) begin
    wvalid_m <=  1'b0;
  end else if(launch_new_wr ) begin
    wvalid_m <= 1'b1;
  end else begin
    wvalid_m <= wvalid_m;
  end
end

always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    wdata_m <= 'h0;
  end else if(launch_new_wr ) begin
    wdata_m <= data_mif_entry[31:0];
  end else begin
    wdata_m <= wdata_m;
  end
end
assign wstrb_m =  {(C_M_AXI_DATA_WIDTH/8) {1'b1}};

//B
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    bready_m <= 1'b0;
  end else if(bvalid_m && bready_m) begin
    bready_m <= 1'b0;
  end else if(launch_new_wr ) begin
    bready_m <= 1'b1;
  end else begin
    bready_m <= bready_m;
  end
end


//current transaction status
reg  cur_trn_status;
wire [31:0] expected_data;
wire [31:0] actual_data;
assign expected_data = data_mif_entry&mask_mif_entry;
assign actual_data = rdata_m&mask_mif_entry;
//read compare check
reg rd_check;
always@(*) begin
  if(rd_cmp_type == 2'b00 &
     actual_data == expected_data) begin
    rd_check = 1'b1; //Pass
  end else if( rd_cmp_type == 2'b01 &
               actual_data < expected_data) begin
    rd_check = 1'b1; //Pass
  end else if( rd_cmp_type == 2'b10 &
               actual_data > expected_data) begin
    rd_check = 1'b1; //Pass
  end else begin
    rd_check = 1'b0; //Fail
  end
end

always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    cur_trn_status <= 1'b0;
  end else if(cmdw_valid & b_complete )begin
    cur_trn_status <= |bresp_m;
  end else if(cmdr_valid & r_complete )begin
    if((rd_check == 1'b1)&(rresp_m == 2'b00)) begin
      cur_trn_status <= 1'b0;
    end else begin
      cur_trn_status <= 1'b1;
    end
  end else begin
    cur_trn_status <= 1'b0;
  end
end

//Decide Nxt Index based on the Current Trn Status and update error counters
reg  [8:0] nxt_rom_ptr;
reg [31:0] test_err_cntr;
wire cur_trn_done;
assign cur_trn_done = r_complete_ff | b_complete_ff ;
generate if(C_ATG_SYSTEM_TEST == 1 ) begin : ATG_SYSTEST_NXT_PTR
  always @(posedge Clk) begin
    if(rst_l == 1'b0) begin
      nxt_rom_ptr <= 9'h0;
      test_err_cntr <= 32'h0;
    end else if(cur_trn_done)begin
      if(cur_trn_status) begin
        nxt_rom_ptr <= fail_mif_index;
        test_err_cntr <= (cnt_as_error) ? test_err_cntr + 1'b1: test_err_cntr;
      end else begin
        nxt_rom_ptr <= pass_mif_index;
        test_err_cntr <= test_err_cntr;
      end
    end
  end
end
endgenerate
generate if(C_ATG_SYSTEM_INIT == 1 ) begin : ATG_SYSINIT_NXT_PTR
  always @(posedge Clk) begin
    if(rst_l == 1'b0) begin
      nxt_rom_ptr <= 9'h0;
      test_err_cntr <= 32'h0;
    end else if(cur_trn_done)begin
        nxt_rom_ptr <= nxt_rom_ptr + 1'b1;
        test_err_cntr <= test_err_cntr;
    end
  end
end
endgenerate
//ROM Address Generation
wire get_nxt_rom_entry;
assign get_nxt_rom_entry = b_complete_2ff | r_complete_2ff;

wire[8:0] rom_ptr;
reg[8:0] rom_ptr_ff;
assign rom_ptr = (get_nxt_rom_entry) ? nxt_rom_ptr : rom_ptr_ff;
always @(posedge Clk) begin
  rom_ptr_ff  <= (rst_l) ? rom_ptr : 10'h0;
end  

assign rom_addr_ptr = rom_ptr;
assign rom_data_ptr = rom_ptr;

//Fail-safe Counters.
reg [31:0] max_retry_cntr;
reg [31:0] max_test_time_cntr;

reg  [1:0] cur_trn_type;
reg  [1:0] new_trn_type;
reg [31:0] cur_trn_addr;
reg [31:0] new_trn_addr;
reg        first_tran_done;
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    cur_trn_type <= 2'b00;
    cur_trn_addr <= 32'h0;
    new_trn_type <= 2'b00;
    new_trn_addr <= 32'h0;
    first_tran_done <= 1'b0;
  end else if(awvalid_m & awready_m)begin
    if(first_tran_done) begin
      new_trn_type <= 2'b01;
      new_trn_addr <= awaddr_m;
      first_tran_done <= 1'b0;
    end else begin
      cur_trn_type <= 2'b01;
      cur_trn_addr <= awaddr_m;
      first_tran_done <= 1'b1;
    end
  end else if(arvalid_m & arready_m)begin
    if(first_tran_done) begin
      new_trn_type <= 2'b10;
      new_trn_addr <= araddr_m;
      first_tran_done <= 1'b0;
    end else begin
      cur_trn_type <= 2'b10;
      cur_trn_addr <= araddr_m;
      first_tran_done <= 1'b1;
    end
  end
end

reg start_retry_check;
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    start_retry_check <= 1'b0;
  end else if((awvalid_m & awready_m) |(arvalid_m & arready_m))begin
    start_retry_check <= 1'b1;
  end
end
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    max_retry_cntr <= 32'h0;
  end else if(start_retry_check & (r_complete | b_complete)) begin
    if((cur_trn_addr == new_trn_addr &
        cur_trn_type == new_trn_type)) begin
      max_retry_cntr <= max_retry_cntr + 1'b1;
    end else begin
      max_retry_cntr <= 32'h0;
    end
  end
end


always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    max_test_time_cntr <= 32'h0;
  end else if((max_test_time_cntr == C_ATG_SYSTEM_TEST_MAX_CLKS)|(block_outputs == 1'b1)) begin
    max_test_time_cntr <= max_test_time_cntr;
  end else begin 
    max_test_time_cntr <= max_test_time_cntr + 1'b1;
  end
end
//Report Status

//all channels idle
//arvalid =0
//rready  =0
//awvalid =0
//wvalid  =0
//bready  =0
wire channels_idle;
reg  rom_eof;
wire first_entry_avlbl;
assign first_entry_avlbl = rst_l_2ff ;
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    rom_eof <= 1'b0;
  end else if(first_entry_avlbl == 1'b1) begin
    rom_eof <= ~cmdr_valid & ~cmdw_valid;
  end 
end
assign channels_idle = (arvalid_m == 1'b0) &
                       ( rready_m == 1'b0) &
                       (awvalid_m == 1'b0) &
                       ( wvalid_m == 1'b0) &
                       ( bready_m == 1'b0) ;
assign irq_out = 1'b0;//Not Used In system testm mode.

wire rom_eof_reached;
wire max_retry_reached;
wire max_test_time_reached;

assign rom_eof_reached = (rom_eof == 1'b1) ;
assign max_retry_reached = (max_retry_cntr == C_ATG_SYSTEM_CMD_MAX_RETRY);
assign max_test_time_reached = (max_test_time_cntr == C_ATG_SYSTEM_TEST_MAX_CLKS);
//
//Stop all:
// Generating transactions.
// Counters(Test time counters)--
//
assign block_outputs =  rom_eof_reached | max_retry_reached | max_test_time_reached;
reg done_i;
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    done_i <= 1'b0;
  end else if(((rom_eof_reached   & channels_idle) |
               (max_retry_reached & channels_idle) |
                max_test_time_reached)
             )begin
    done_i <= 1'b1;
  end
end

//Test error counters will be updated 1 clk after beat sampled.
//So,delay done by 1 clk to account for last beat comparision
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    done <= 1'b0;
  end else begin
    done <= done_i;
  end
end

reg [7:0] cur_rom_ptr;
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    cur_rom_ptr <= 8'h00;
  end else if(r_complete | b_complete) begin
    cur_rom_ptr <= rom_ptr[7:0];
  end
end
 
always @(posedge Clk) begin
  if(rst_l == 1'b0) begin
    status <= 32'h0;
  end else if(done_i)begin
    status <= status;
  end else if( max_retry_reached | max_test_time_reached)begin
    status[1:0]   <= 2'b11;
    status[9:2]   <= nxt_rom_ptr[7:0];
    status[15:10] <= 6'h0;
    status[31:16] <= test_err_cntr;
  end else if (rom_eof_reached) begin 
    status[1:0]   <= (test_err_cntr == 32'h0) ? 2'b01 : 2'b10;
    //status[9:2]   <= cur_rom_ptr;
    status[9:2]   <= nxt_rom_ptr[7:0];
    status[15:10] <= 6'h0;
    status[31:16] <= test_err_cntr;
  end
end

//
//Mux based on ch.Selected
//

assign ch1_awaddr_m   =              awaddr_m;
assign ch1_awvalid_m  = ch1_select & awvalid_m;
assign ch1_wvalid_m   = ch1_select & wvalid_m;
assign ch1_wdata_m    =              wdata_m;
assign ch1_wstrb_m    =              wstrb_m;
assign ch1_bready_m   = ch1_select & bready_m;
assign ch2_awaddr_m   =              awaddr_m;
assign ch2_awvalid_m  = ch2_select & awvalid_m;
assign ch2_wvalid_m   = ch2_select & wvalid_m;
assign ch2_wdata_m    =              wdata_m;
assign ch2_wstrb_m    =              wstrb_m;
assign ch2_bready_m   = ch2_select & bready_m;
assign ch3_awaddr_m   =              awaddr_m;
assign ch3_awvalid_m  = ch3_select & awvalid_m;
assign ch3_wvalid_m   = ch3_select & wvalid_m;
assign ch3_wdata_m    =              wdata_m;
assign ch3_wstrb_m    =              wstrb_m;
assign ch3_bready_m   = ch3_select & bready_m;
assign ch4_awaddr_m   =              awaddr_m;
assign ch4_awvalid_m  = ch4_select & awvalid_m;
assign ch4_wvalid_m   = ch4_select & wvalid_m;
assign ch4_wdata_m    =              wdata_m;
assign ch4_wstrb_m    =              wstrb_m;
assign ch4_bready_m   = ch4_select & bready_m;
assign ch5_awaddr_m   =              awaddr_m;
assign ch5_awvalid_m  = ch5_select & awvalid_m;
assign ch5_wvalid_m   = ch5_select & wvalid_m;
assign ch5_wdata_m    =              wdata_m;
assign ch5_wstrb_m    =              wstrb_m;
assign ch5_bready_m   = ch5_select & bready_m;

assign awready_m  = ((ch1_select & ch1_awready_m) |
                     (ch2_select & ch2_awready_m) |
                     (ch3_select & ch3_awready_m) |
                     (ch4_select & ch4_awready_m) |
                     (ch5_select & ch5_awready_m)  
                    );

assign  wready_m  = ((ch1_select & ch1_wready_m) |
                     (ch2_select & ch2_wready_m) |
                     (ch3_select & ch3_wready_m) |
                     (ch4_select & ch4_wready_m) |
                     (ch5_select & ch5_wready_m)  
                    );

assign  bvalid_m  = ((ch1_select & ch1_bvalid_m) |
                     (ch2_select & ch2_bvalid_m) |
                     (ch3_select & ch3_bvalid_m) |
                     (ch4_select & ch4_bvalid_m) |
                     (ch5_select & ch5_bvalid_m)  
                    );

assign  bresp_m   = ((ch1_select & ch1_bresp_m) |
                     (ch2_select & ch2_bresp_m) |
                     (ch3_select & ch3_bresp_m) |
                     (ch4_select & ch4_bresp_m) |
                     (ch5_select & ch5_bresp_m)  
                    );



assign ch1_araddr_m  =              araddr_m;
assign ch1_arvalid_m = ch1_select & arvalid_m;
assign ch1_rready_m  = ch1_select & rready_m;
assign ch2_araddr_m  =              araddr_m;
assign ch2_arvalid_m = ch2_select & arvalid_m;
assign ch2_rready_m  = ch2_select & rready_m;
assign ch3_araddr_m  =              araddr_m;
assign ch3_arvalid_m = ch3_select & arvalid_m;
assign ch3_rready_m  = ch3_select & rready_m;
assign ch4_araddr_m  =              araddr_m;
assign ch4_arvalid_m = ch4_select & arvalid_m;
assign ch4_rready_m  = ch4_select & rready_m;
assign ch5_araddr_m  =              araddr_m;
assign ch5_arvalid_m = ch5_select & arvalid_m;
assign ch5_rready_m  = ch5_select & rready_m;

assign arready_m = (
                   (ch1_select & ch1_arready_m) | 
                   (ch2_select & ch2_arready_m) | 
                   (ch3_select & ch3_arready_m) | 
                   (ch4_select & ch4_arready_m) | 
                   (ch5_select & ch5_arready_m) 
                   );

assign rdata_m  = (
                   (({32{ch1_select}}) & ch1_rdata_m) | 
                   (({32{ch2_select}}) & ch2_rdata_m) | 
                   (({32{ch3_select}}) & ch3_rdata_m) | 
                   (({32{ch4_select}}) & ch4_rdata_m) | 
                   (({32{ch5_select}}) & ch5_rdata_m) 
                   );

assign rvalid_m  = (
                   (ch1_select & ch1_rvalid_m) | 
                   (ch2_select & ch2_rvalid_m) | 
                   (ch3_select & ch3_rvalid_m) | 
                   (ch4_select & ch4_rvalid_m) | 
                   (ch5_select & ch5_rvalid_m) 
                   );

assign rresp_m  = (
                   (({2{ch1_select}}) & ch1_rresp_m) | 
                   (({2{ch2_select}}) & ch2_rresp_m) | 
                   (({2{ch3_select}}) & ch3_rresp_m) | 
                   (({2{ch4_select}}) & ch4_rresp_m) | 
                   (({2{ch5_select}}) & ch5_rresp_m) 
                   );
endmodule
