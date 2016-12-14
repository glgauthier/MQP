// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Wed Dec 14 14:25:32 2016
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [9:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [17:0]P;

  wire [9:0]A;
  wire CLK;
  wire [17:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "10" *) 
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
  (* C_OUT_HIGH = "17" *) 
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

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "10" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10110100" *) (* C_B_WIDTH = "8" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "2" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "2" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "17" *) 
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
  input [9:0]A;
  input [7:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [17:0]P;
  output [47:0]PCASC;

  wire [9:0]A;
  wire [7:0]B;
  wire CE;
  wire CLK;
  wire [17:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "10" *) 
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
  (* C_OUT_HIGH = "17" *) 
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
WFpD5lJ3165QhF74quXTCYQj9OIZFFkHazpFyijl5yFZStFmZ7/IIkOqEsK+zJKIv0EWyKbjo9Fd
XpDSeUolTCpvcGbd8hUbEeaYKxxErf8CWVAcrTCWEBY2Piz+wK6F34QJ2eZuwjUDGfJpSdHAW6DW
moAKEqznqZEQVrajhGMJqP29Fhx+oMIMmlMNoI6Ufi4HBMbNxb6vFmR9Wj8YjUqTqv/u4LwY/jUJ
7NiQB6LcBG94fqxgsB+hWHfnOAjmb9qhomfJV4dW0NmwM9w80O3QAUTmH43NKFyVomMboIWGkSiI
00MeVmMeWV0QKtnjJhj/LpYZYerWLC8b6Hc5Eg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
Ug3Svfm38y8yLPyDIvX5JjVlJPPsiuRBWcR72zEpcWvnbqAOro95Wu50DkI62gT5dLebAHClMhvS
zcsItH6g7zl5/Wdw2jA2xgq6UFpuuJTPIwB6SeQCPK2jVYDuE3UAp7CJSPMTjFWiUVc60uv4JQOX
Ri7ic15Ym7VXyAbkKYQZNZmzAo0EIgNA7azyXJ064KK94Wu7TUm4N6IZuetP5hlj1WPOssdHgusf
RsfhK45BEqaUCToayzFBlDSyGZD6i2zp3xrMOPTKqQYXv3kaTed4eDyWpbP7e7E2Jt2HFtcGrCWO
Cm0eXomvO3N/iABupdUNipv4D6kAsgr5ji5q0Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18816)
`pragma protect data_block
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
dQ3H3nx5
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
