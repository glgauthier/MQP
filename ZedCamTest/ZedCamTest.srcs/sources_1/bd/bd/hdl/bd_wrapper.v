//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Thu Nov 10 22:40:08 2016
//Host        : Georges-T460p running 64-bit major release  (build 9200)
//Command     : generate_target bd_wrapper.bd
//Design      : bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIFO_DATA,
    FIFO_OE1,
    FIFO_OE2,
    FIFO_RCK,
    FIFO_RRST1,
    FIFO_RRST2,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    HS,
    SW_camSelect,
    SW_read_fifo,
    VS,
    cam_reset,
    cam_rst,
    cam_sysclk,
    cam_trigger,
    reset,
    rgb,
    sysclk,
    trigger);
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
  output HS;
  input SW_camSelect;
  input SW_read_fifo;
  output VS;
  output cam_reset;
  input cam_rst;
  output cam_sysclk;
  output cam_trigger;
  input reset;
  output [7:0]rgb;
  input sysclk;
  input trigger;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire [7:0]FIFO_DATA;
  wire FIFO_OE1;
  wire FIFO_OE2;
  wire FIFO_RCK;
  wire FIFO_RRST1;
  wire FIFO_RRST2;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire HS;
  wire SW_camSelect;
  wire SW_read_fifo;
  wire VS;
  wire cam_reset;
  wire cam_rst;
  wire cam_sysclk;
  wire cam_trigger;
  wire reset;
  wire [7:0]rgb;
  wire sysclk;
  wire trigger;

  bd bd_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIFO_DATA(FIFO_DATA),
        .FIFO_OE1(FIFO_OE1),
        .FIFO_OE2(FIFO_OE2),
        .FIFO_RCK(FIFO_RCK),
        .FIFO_RRST1(FIFO_RRST1),
        .FIFO_RRST2(FIFO_RRST2),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .HS(HS),
        .SW_camSelect(SW_camSelect),
        .SW_read_fifo(SW_read_fifo),
        .VS(VS),
        .cam_reset(cam_reset),
        .cam_rst(cam_rst),
        .cam_sysclk(cam_sysclk),
        .cam_trigger(cam_trigger),
        .reset(reset),
        .rgb(rgb),
        .sysclk(sysclk),
        .trigger(trigger));
endmodule
