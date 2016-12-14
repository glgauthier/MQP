// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Mon Dec 12 22:24:22 2016
// Host        : JOHN-HP running 64-bit major release  (build 7600)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/John/Documents/GitHub/MQP/IMU/IMU.srcs/sources_1/ip/mult_gen_1/mult_gen_1_stub.v
// Design      : mult_gen_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_11,Vivado 2016.2" *)
module mult_gen_1(CLK, A, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[10:0],P[17:0]" */;
  input CLK;
  input [10:0]A;
  output [17:0]P;
endmodule
