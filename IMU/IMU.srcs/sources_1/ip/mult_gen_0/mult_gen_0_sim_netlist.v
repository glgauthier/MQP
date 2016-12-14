// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Wed Dec 14 15:00:50 2016
// Host        : JOHN-HP running 64-bit major release  (build 7600)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/John/Documents/GitHub/MQP/IMU/IMU.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_11,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module mult_gen_0
   (CLK,
    A,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [8:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [16:0]P;

  wire [8:0]A;
  wire CLK;
  wire [16:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "9" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10110100" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "2" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "2" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "16" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_11 U0
       (.A(A),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "1" *) (* C_A_WIDTH = "9" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10110100" *) (* C_B_WIDTH = "8" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "2" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "2" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "16" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "mult_gen_v12_0_11" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0_11
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [8:0]A;
  input [7:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [16:0]P;
  output [47:0]PCASC;

  wire [8:0]A;
  wire [7:0]B;
  wire CE;
  wire CLK;
  wire [16:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "9" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10110100" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "2" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "2" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "16" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_11_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(SCLR),
        .ZERO_DETECT(ZERO_DETECT));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
gD7l84kB+WAh1ATog3H36h0/cMgn9QL5jGe9p9PjvP7N+FJAVvGVlrxcgBw6dZaWDNZqNANQuRFv
ZSE8fsSCFg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YQUcxim/tlzHeVlJ7otHN7u41KO3Yg5DFb1yF4GCsbXGLtUvWNlkFjY+UPIlgYImR4Zo4dTHJQ+j
3BaUNSUOqAVzT9CfyUelv2YD2ZTfAtzIe1Mboyb3+StKnuzxnZmIhVPiZlowdW5lQ1r7BjDPOsge
ztxOfUTbvYcTUE1ABIE=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
eu4MFD/NMz3pssr62VCh1XDd9mthYydX9VaOq3lWUwHi5/7e5dl2SAWHtYwTnBgGPY+jCcMycJhy
WSlkhQxVj5BsMm2aAItwXFvH2mSbjlPggtI0/+DNGQ4x8LQSFLTDYnnQbBrHlJymsS+/asMkXACD
SJ2tF8LF5tMhAlMPZZ0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rNAzbNlIFUMjdhvgzZ2FokzvR4AuFtV+1AHGDKa9QgeBsZ1e0Fom48uKbJ9iakvqUoUcKKAvRzeY
OBkbx9P7Imx0gvIgzFsgiVw23cBYWOhbhSqVb7mef9aKx8yeF8T48n7gKldUkwBHIPeqaayRI9/Q
HCZO+k2+HCjRZE6L/Gzd+IOdEVUFOg3NtWFPk2JFkfZkxs8X7Vg/xxtvH7uvp+/EbVyiMbnwDT/p
NSqOyA+rJwBJYD3xRIPTFDI83XJLCF+1i4E8hyu7Y0F9MtjKugqEHwAG+JK3jde00nzNNaeLVUQ1
OfFMZJpkk0Cg66d2cvJY/G11oPkmvTq/JZ4+5g==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
apuTRT8aJu0TR7Ciy6ONiGK4AT7TUEiokS4gFf1g+kDg6PdKk9VRun4HKszIadRtahjPQo0of9uS
yvu3GS4EQo+Y+T116wnAIXnZSa8EQaEsDkziOI+rCvXv8IgaPYN8Cq0aRlASFL7IHOWNI49V0c0A
FIG/+5U7ZyNQFCVwuE4gCgK/pA6apm5kY4FGJft/EdZ5YAbR/nCTzK4P53+XsKHrtGfw+/MthFWz
tI0OtloKqc7laKZWKOVFqWq8Qmq7UL6utFODtxEQqzczH+q+Gw4rkUyOosIY+cbB67hX+GlmXXEF
jMwvUcen9t6c+wiH6rmBDcUIiuUHHz6q+jCwJQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dfDj35aI8y6zqcW/IHFxmCDw2mpyex25qQAUnsL+tIRxivv/85PqpCOrf3b7NWnwUKMrsxtw+JBY
mtlPsVxQKR1gn6VkaHwbEgwxXXxFe71Z+1nWQhfF8Nt55jGvq1joWKMrurSV7Mo+HkvHMSszXj3v
8ElD0S6sN91oml0nObejOhxzHf0ybK+sGag+CFA7aBr4k4rYglf7AzOYrPl3nNoCkyrFDQFa46/w
SXJm/os7zUHbsDI5GGUH3BU+NktHZV6GK3iyhtHTwrMgDtpGk6vKHMKULM1Gjv9g1/jp9Ao4cUhr
bCVOXM1v2e8A3564rmh3if78zTzCKamPRAB5Ig==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
dbhREr2fqq8SdjAlrPpRdqxXT6CVXK0eIttNEdumTJEMoBV+rbnAA6WWgzWbXnKHkAX9An1pc1oP
bck2bYnSps20qEkhtD/BSfjTF81h8rRNM7ywlbu2tg08NNxtAjUPDcWcvAUQALGFy+y3KLfHYzJN
k4XUtB1qopvNc5zDMOGylGiynhhVHuZdHaoo4NDvserqLrnX0n/wdIzbJ5q91UmuL47TdYBIS+NF
wQLks0K7i5/64YolDYaNZng/gtImNArj8Qa5HHKAv4+zYryvKF3dT8wfozYMuyc97p7eN9MKG+D1
cFirJRicS+ZRkHasUF3Nfwk3rAc+HCcoSvm/cA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
RpYx8Sjlf3XfpZpVh7hYxU7M9FlmiH2DGrn88ItmTTE9le3W8HEyDBWsPmaES7mMWvb/U+BB6NvN
/hbrlpBOg/tW0CVxdaKyJP+bpvydkrqpD3wh7y1hx8dl/wJltijvWEXRZh5ncYlsNJrNXwa10jOy
rb+AJSRY5B18ZzztqIlJNzPJpKUBThcxJTidrb+XtX/Z7GZk6boaIyLlAGT/cwKCYrJp1jZVUAeY
TUWbuhBs1F8/0ybx9+VL8GrQOqUOiyZwuVrjWHeXQ4ffnoCyq/xFHN/XHP6IAbkVuR7rIuq2vkOi
QdpkMDGdaegIr/mUHe0kYN/YSU16Hvqr0gokJQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21088)
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
