// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Sun Jan 15 12:57:16 2017
// Host        : Georges-T460p running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/georges/Documents/GitHub/MQP/final_implemention/final_implemention.srcs/sources_1/bd/design_1/design_1_stub.v
// Design      : design_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module design_1(DDR_addr, DDR_ba, DDR_cas_n, DDR_ck_n, DDR_ck_p, DDR_cke, DDR_cs_n, DDR_dm, DDR_dq, DDR_dqs_n, DDR_dqs_p, DDR_odt, DDR_ras_n, DDR_reset_n, DDR_we_n, FIFO_DATA, FIFO_OE1, FIFO_OE2, FIFO_RCK, FIFO_RRST1, FIFO_RRST2, FIXED_IO_ddr_vrn, FIXED_IO_ddr_vrp, FIXED_IO_mio, FIXED_IO_ps_clk, FIXED_IO_ps_porb, FIXED_IO_ps_srstb, GPIO_0_tri_i, GPIO_0_tri_o, GPIO_0_tri_t, SPI_0_io0_i, SPI_0_io0_o, SPI_0_io0_t, SPI_0_io1_i, SPI_0_io1_o, SPI_0_io1_t, SPI_0_sck_i, SPI_0_sck_o, SPI_0_sck_t, SPI_0_ss1_o, SPI_0_ss2_o, SPI_0_ss_i, SPI_0_ss_o, SPI_0_ss_t, button, cam_reset, cam_rst, cam_sysclk, cam_trigger, fpga_clk, hsync, leds, reset, rgb, sw, vsync)
/* synthesis syn_black_box black_box_pad_pin="DDR_addr[14:0],DDR_ba[2:0],DDR_cas_n,DDR_ck_n,DDR_ck_p,DDR_cke,DDR_cs_n,DDR_dm[3:0],DDR_dq[31:0],DDR_dqs_n[3:0],DDR_dqs_p[3:0],DDR_odt,DDR_ras_n,DDR_reset_n,DDR_we_n,FIFO_DATA[7:0],FIFO_OE1,FIFO_OE2,FIFO_RCK,FIFO_RRST1,FIFO_RRST2,FIXED_IO_ddr_vrn,FIXED_IO_ddr_vrp,FIXED_IO_mio[53:0],FIXED_IO_ps_clk,FIXED_IO_ps_porb,FIXED_IO_ps_srstb,GPIO_0_tri_i[1:0],GPIO_0_tri_o[1:0],GPIO_0_tri_t[1:0],SPI_0_io0_i,SPI_0_io0_o,SPI_0_io0_t,SPI_0_io1_i,SPI_0_io1_o,SPI_0_io1_t,SPI_0_sck_i,SPI_0_sck_o,SPI_0_sck_t,SPI_0_ss1_o,SPI_0_ss2_o,SPI_0_ss_i,SPI_0_ss_o,SPI_0_ss_t,button,cam_reset,cam_rst,cam_sysclk,cam_trigger,fpga_clk,hsync,leds[7:0],reset,rgb[11:0],sw[7:0],vsync" */;
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  input [7:0]FIFO_DATA;
  output FIFO_OE1;
  output FIFO_OE2;
  output FIFO_RCK;
  output FIFO_RRST1;
  output FIFO_RRST2;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  input [1:0]GPIO_0_tri_i;
  output [1:0]GPIO_0_tri_o;
  output [1:0]GPIO_0_tri_t;
  input SPI_0_io0_i;
  output SPI_0_io0_o;
  output SPI_0_io0_t;
  input SPI_0_io1_i;
  output SPI_0_io1_o;
  output SPI_0_io1_t;
  input SPI_0_sck_i;
  output SPI_0_sck_o;
  output SPI_0_sck_t;
  output SPI_0_ss1_o;
  output SPI_0_ss2_o;
  input SPI_0_ss_i;
  output SPI_0_ss_o;
  output SPI_0_ss_t;
  input button;
  output cam_reset;
  input cam_rst;
  output cam_sysclk;
  output cam_trigger;
  input fpga_clk;
  output hsync;
  output [7:0]leds;
  input reset;
  output [11:0]rgb;
  input [7:0]sw;
  output vsync;
endmodule
