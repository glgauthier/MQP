// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Sun Nov 27 22:10:45 2016
// Host        : Georges-T460p running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/georges/Documents/GitHub/MQP/ZedFinalCams/ZedFinalCams.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clkin_100MHz, clk_100MHz, clk_25MHz, clk_24MHz, clk_5MHz, reset)
/* synthesis syn_black_box black_box_pad_pin="clkin_100MHz,clk_100MHz,clk_25MHz,clk_24MHz,clk_5MHz,reset" */;
  input clkin_100MHz;
  output clk_100MHz;
  output clk_25MHz;
  output clk_24MHz;
  output clk_5MHz;
  input reset;
endmodule
