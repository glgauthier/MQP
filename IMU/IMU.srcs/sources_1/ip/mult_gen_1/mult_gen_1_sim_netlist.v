// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Wed Dec 14 23:41:55 2016
// Host        : Georges-T460p running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/georges/Documents/GitHub/MQP/IMU/IMU.srcs/sources_1/ip/mult_gen_1/mult_gen_1_sim_netlist.v
// Design      : mult_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_1,mult_gen_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_11,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module mult_gen_1
   (CLK,
    A,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [16:0]P;

  wire [15:0]A;
  wire CLK;
  wire [16:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "11" *) 
  (* C_B_WIDTH = "2" *) 
  (* C_CCM_IMP = "2" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
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
  mult_gen_1_mult_gen_v12_0_11 U0
       (.A(A),
        .B({1'b0,1'b0}),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "16" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "11" *) (* C_B_WIDTH = "2" *) (* C_CCM_IMP = "2" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "3" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "2" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "16" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "mult_gen_v12_0_11" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_1_mult_gen_v12_0_11
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [15:0]A;
  input [1:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [16:0]P;
  output [47:0]PCASC;

  wire [15:0]A;
  wire [1:0]B;
  wire CE;
  wire CLK;
  wire [16:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "11" *) 
  (* C_B_WIDTH = "2" *) 
  (* C_CCM_IMP = "2" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
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
  mult_gen_1_mult_gen_v12_0_11_viv i_mult
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
XKqY+vLCmfLlPuPED8Pr/x8N/oNSivVAzEeHbqIbb665mydpHupUONUmOZy5Mjj/Fdsfu+VwdiBy
n9qHa+6wAb90lvOLY9gm70UdSyvB4FpOJEwc7u+t6urIHoLFnufwNP9RTKfimABDtDSSMlR3B3Mo
YyQ4kWuh+9Sp41YtYYwQyHEaIlZW4C30FMsL+03VwHRmlhSesS4aHbnQJ7IheshNa0KdVCSLzplS
D9oonr/1VSTcfA9eLv+Xdt0ybtt/d4XOdLt5wJgNsbPwlIERl30vbsIPLbBZf7FoYZ7U/0TAML9A
03MsD1UPt++MFvwlh4kN+JHtPzPxxpZTqhNDQg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
UNfXH2DRkkTJ+WEwQbl7O4BXHHjcFNpD7izDmOoJKcD82VZzazG3ae9IOigjgDsnBfSE+bkM+eXB
2KnPhVgRxvwY6VTLm5Ssjco9oXJhuWoyv/EWVS/YkRD+6lszwV4Ns+1DV4eEQtheWeQRszII+byT
+RCvr8fQELbq3ZJ762U9Zn1mep4BKePu+RoxtyT2gkr/xctAe+XX9weBJjsROZNcNt/D5g13lq0b
cMpHlneUwaRGGMwFYDPDIRFVD/KC9tx7fVqKsryG8AlZOqFmkkSaHUBvMLpk3N+tt15TlX8nXsZO
iRokjbo42TQNXGlYHiwKrIiyZVb9f1MufbY1YQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7472)
`pragma protect data_block
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
y+ZHxKA=
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
