// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Mon Dec 12 18:24:17 2016
// Host        : JOHN-HP running 64-bit major release  (build 7600)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/John/Documents/GitHub/MQP/IMU/IMU.srcs/sources_1/ip/c_addsub_0/c_addsub_0_sim_netlist.v
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
JDMchKOSbaELl6CziWqUp161DgDzFFFp9Odb10vX+nc5L0qHFpTiwq+wHk/sYL9xnIhphDGTV6Ii
0rt/tdH8wq0M78Y3AKlGUy9lLIjAd4dNdXtlJFZAJL7lDxfADDFqeqqJRHh/FQLzJ6WiF+FjRCwH
uMB/VM/bwW1aLueI6gNg5crlibmTmHSaObGFMnAGoXjBC61tkHIJ4HUVN+Fs0NS4AJy+SuJ2187S
crCsv5EfDUcNMBWQVZr+h0Nb+q4aqVCXqZFxgnX5OZ/oIGe5wVeANxbK+9ixVm3JqIOsbyalRfJP
Jclsfk82Qz6CPKK79kwT7YXkK2bWwcyJRUpejQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
AJ2iepkbL82PaFyndlYOjEm0DTDwL6kD5Ayq30mSIbNjpr6Hgysl/m80l3HdnFa5LgB6ThiPIiq9
inXAne9M8eVl66H0dOWv6rAA8S+MxrTUTVJebLzHDFiAELle0GUmVpqMrQ15K+WGjyJ+hc6D2gGh
p9LHgoju0jhgNVS+bT8oZoLoyFH5vlvsP7o27YRt7i7KXWr2wNSWDcZdMtXea6SkYBaaoZ7XdSZo
dcUyuxqfYHMe+MaBpa8tUBQXsvn+Ok9hKae4hVo6og1PQgvAJWOmiMFSn0Hw8qAapudfrD8xw1iY
zoO+lv36kNyNZA2UjedsRp43FEt3aTJfXE3KHA==

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
