// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Wed Dec 14 17:20:50 2016
// Host        : Georges-T460p running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/georges/Documents/GitHub/MQP/IMU/IMU.srcs/sources_1/ip/c_addsub_0/c_addsub_0_sim_netlist.v
// Design      : c_addsub_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_0,c_addsub_v12_0_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_9,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module c_addsub_0
   (A,
    B,
    CLK,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [15:0]S;

  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [15:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "16" *) 
  (* c_add_mode = "1" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "0000000000000000" *) 
  (* c_b_width = "16" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "2" *) 
  (* c_out_width = "16" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_addsub_0_c_addsub_v12_0_9 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "1" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "16" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000000000" *) 
(* C_B_WIDTH = "16" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "2" *) 
(* C_OUT_WIDTH = "16" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "c_addsub_v12_0_9" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module c_addsub_0_c_addsub_v12_0_9
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [15:0]A;
  input [15:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [15:0]S;

  wire [15:0]A;
  wire ADD;
  wire [15:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire C_IN;
  wire C_OUT;
  wire [15:0]S;
  wire SCLR;
  wire SINIT;
  wire SSET;

  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "16" *) 
  (* c_add_mode = "1" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "0000000000000000" *) 
  (* c_b_width = "16" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "2" *) 
  (* c_out_width = "16" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_addsub_0_c_addsub_v12_0_9_viv xst_addsub
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(BYPASS),
        .CE(CE),
        .CLK(CLK),
        .C_IN(C_IN),
        .C_OUT(C_OUT),
        .S(S),
        .SCLR(SCLR),
        .SINIT(SINIT),
        .SSET(SSET));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
A13f8tlz6UJG9JfCNcYl8NLUw8Tlctm35dCRvt/KCTpBFIuXlOawHL7sTHowWNnYPdFQNufThU2P
nq6r7CYRfg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oJAsCu5zl/OMFEQsA8TK81YQdELnJEDcFa6KQ0EHWxmJrxei82pUrFKy5/0YZah/J8433WTkuMYX
n4DxKRAShIrdY1X7G4VuvTy06p94vL5LjcHyEy4fxae5eyT8gPJ2ix4XQa8NTiv0ndfGQZyw3Nh2
G2fKlAI5x3f8zwZZQY8=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
wvBGFVtHjRF0sOMF1pCWFAGskoPwO7T2ijyj/eL3cj3Mn4RaSun2E2ii2aHguV5ZVFP65oRsiH5d
RuZPDUKAsxBDhHSsGkFSPIwX9KivlJTo2FZHlBDTlkfDQbn+a3fWxc1HcR9KUBo8QndFpzMmqgOV
oDGrjFRMryCx3hlDJdU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UMkVtIsRH0SCXq8LQlXc2SFapNVFtJ6lm3Wp55oPh2JHEa2eDcLuSNAMzka2zwzCEXltR/XJthW1
e74yTmf22SChtep5vBZ+ajUd7h2t8MuWnhQAMciHkyF4IkU7ju3JOoQFlih3FqDO3aUJPcamhd7Q
ccMUMAhIvZFp44NdLzl8HbXnE1qh9bi1m8qU8jMCKESUZ7pg4lNlsQjd+Goa1H9iXaLEv3OfHZuq
AS/RQip05I1DUFL5hACAmmneYHUVM5S4EEaO3aHf1jZ3r/piru3ZRDHXxDir2Y9zXiL2oDUfsV5l
w+Pp691O/rBEAjBLQdevDcp/mZn7axrfo7gedQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BizuB2M20zTA5t6lHKGfnJrucOUdZ0HEVkxiYzkxLH0WP9VZIREBo09OejVavblw0lBdoToGD/Dx
ZN2JWgxB3v9b0Oe7EvwN3oB8w0TKm0RoqDmuPV8JuY7RwxtxkHcrVvcjXuOt8j2BPe5Ix86NYRxZ
8RqRFVGNyOVCKZuaFMVHI+ktnNU/xi6ZGsd+L0PEmNWeJ+y+7ubRYuJBTcZK6n0e0Rv144/nsqdy
X+40+rhcynqZUh14Jaqxwmyc8eu2wmo21it2TUiXXzLiWf9C/rPTasxTNu6GgF2yKIv/qtG5zsH5
iEI5vhFnzG+RShh+IHFb+FdSgnifLxcvxMZyfQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WBEZpdyDr9NfPjFUCp37UUdIujNIa897wZZ58/x9eMPhksqlKdy3SYhoDdl4U5n1JXPWIonhbpyY
qfWTq0gV9NaH1PiTuV9w+nrQziNvPhnHnWOzNrltlMQ+uTbMRquXZffmAQGphp7ekw56wGNMIqvn
BRmPzqHv8wZfX/RCaFbjfXAJEmAF89kl5TL3IWnE72Kb9o1cSvFtKTxyRoh9m9E0ghJdkhnRh4Pm
wU/+pIGwon3nUS1E00edVC7apMYbKm+8akp/2UT8ovmuCYJtcE90yRZZaeiFNpLq2UTmaGHp3XHC
2ziTOAA9fjUjv2jhCi5RMA2D0eDmOlHleltm9Q==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
l7b+IH6Xeoa8ml8wXwGdeFfgmy/bwampLs4VvajYzoHVaXiQKcCCKOpRYTx/HF+upRD2DxHGUx6h
ZeA5+BuDhrDo8kt0pwJlcSXEkSqBwpB/xieSb6ACgGd2d+wCGM1N5sAuGhALSPmk2y8Ta0103Tfz
SsCcG5OP1BRciegXh5Vd1c9kWq3HQp3fNaEu4ISNtNl2iHSQ9EIKfW8CEpohzRHl04gbdBsPXA4c
Pyv32883TK2UhFa8XnzNd0uM5sm65ABWw5yfOEC37vgENMZcm+duG5A17EEIELjkP5bQmJevnCXS
SszNnrLP7Xy10p9ckSUA7TS1Kc4L+rbeMsvmRA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
PYO+rjztol+KSVykyMOOvL9KSydxyfb+Mvy7MhWBu2e/E8C/5f94+5IKH0SyXlM0mnJIHmkwXIvt
zCQbmX2AdwwZL4MJjq8SrxkWyFy20e2iDUqcfV8PhiNUYxfzDQlEHt3FcCj4FusxpD22bx1bndOt
bnrTC8SVFhNyy1zQeYsgMfuqmFC8lOb+wkrPtPkY5HKolpmQIEfSexpEEsAYpDg6tNm6Tv+ZGmBq
TchJYQ9BaxGrrKfrt31vhwDTWy8MUUb+QqIS6bQK5KSLDlD2EHhGd4RsYoSwoDir0UWlSnm5OFn/
UNleLtFeLgZxL4Slc6iCI8dckcWxoLEx6Wr4mA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27072)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
