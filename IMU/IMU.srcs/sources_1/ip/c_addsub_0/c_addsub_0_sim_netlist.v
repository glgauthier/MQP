// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Wed Dec 14 23:58:13 2016
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

  (* C_ADD_MODE = "1" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "0000000000000000" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "2" *) 
  (* C_OUT_WIDTH = "16" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* KEEP_HIERARCHY = "true" *) 
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
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "2" *) 
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

  (* C_ADD_MODE = "1" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "0000000000000000" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "2" *) 
  (* C_OUT_WIDTH = "16" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
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
nZ44cUlRWy5tYLz4soxz24rOZAjpq63KdbgrTLCB5ysjvhlbXs6MXLAga9tOfuNv1CuscktnYpVa
FUkOS269SGJ3C8kbI++69T7DELVAwP73cC+vgUyeYGyy+jQvVBU39KcDAxR5EaBTmiHfrGFwc2k0
BHnDhavUMCgfBbtOib8T7YZi1lVrtmhpUaFXioN+ZfttfdzIf33j7gXNYFqBRQ1/AscPl2B/JSwK
mWqoMocti4COgmCKFYLGWEXVyiEAOXapJtqARAST2G4+4VTinPVbQDgJzfPVH8OHE7h5iCdabN4I
Hvkg0bM39JVVMVB+nSZ3+0g7AVsXFYdkYCdPiA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
fVHNyNUrMxzkpKMJ/GQJM4mgyGzJqZ/aU27r496oASeBJA8wWCIGsLNBZNAc9IKHt8d28A1iNQ1B
mIMFAzaDilPdgONsOv3Kqse4mwWgfBBYRYkwzZ+p0BWWTLxU+aGOYygnBgkFVJxKykkt3Gvp0UYu
ERH149rhMZdkZBywJgM6PhstAfnlWnH10IB77BUn5wUnok3NUhFd334IdsQiqufkj0Ccse9C8+t+
iPBwld65JOgBby48rbPtWqkpR4aGRT5jmOWqmCW8/8ZWhVYEOWS0ZEidprHK7g5zjG6/y4D5hx7a
gd6+L9RHEvmet7HEzFOERlO/p4sQUg3P3OVQOw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12432)
`pragma protect data_block
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
6sHFzuM0
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
