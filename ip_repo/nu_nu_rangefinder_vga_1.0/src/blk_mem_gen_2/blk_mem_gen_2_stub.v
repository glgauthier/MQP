// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Thu Nov 03 22:46:18 2016
// Host        : JOHN-HP running 64-bit major release  (build 7600)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/John/Documents/GitHub/MQP/ip_repo/nu_nu_rangefinder_vga_1.0/src/blk_mem_gen_2/blk_mem_gen_2_stub.v
// Design      : blk_mem_gen_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_3,Vivado 2016.2" *)
module blk_mem_gen_2(clka, ena, wea, addra, dina, douta, clkb, enb, web, addrb, dinb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[8:0],dina[639:0],douta[639:0],clkb,enb,web[0:0],addrb[8:0],dinb[639:0],doutb[639:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [8:0]addra;
  input [639:0]dina;
  output [639:0]douta;
  input clkb;
  input enb;
  input [0:0]web;
  input [8:0]addrb;
  input [639:0]dinb;
  output [639:0]doutb;
endmodule
