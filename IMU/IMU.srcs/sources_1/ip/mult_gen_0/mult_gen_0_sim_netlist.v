// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Wed Dec 14 19:30:40 2016
// Host        : Georges-T460p running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/georges/Documents/GitHub/MQP/IMU/IMU.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
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
(* C_B_VALUE = "10110100" *) (* C_B_WIDTH = "8" *) (* C_CCM_IMP = "2" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "3" *) (* C_MODEL_TYPE = "0" *) 
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
bCmjxNnaZYCdhbpMQFRIlJi8lDKrACss4S/B6H2e1cylajZX3GY6tHHe5PadcAzL7NLbpn8X5u3w
2x82LKW0xO4P3rUtdH/nStcEQxZe9BoLBWbamu53qGNHpHD0p3nSlI9aS2sijPH0pjm5+1Y1gULi
vULT/NIrZMfm1C/Q66Dd+PRMA4iWMCS2d6ADtjGzNTCkGIlCRFilRAyg0ELU8Q71fNc2bqBsoZbN
HRzlqVoCM5MEDhTVJS9M/LMeNpiE7bjpoQAEhbzJMOewe4dvQfiJRHEOZV450w4/ax/7l3hNUk+K
5cdNvtIbrwnh6AV2yUL6+zeFJke07mO1/E70SA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
q9yNVS1HsV05g2k66KbKLym5rltp731VctFe0I85PJwIGG8Pt9ZiYO8UxMSpCOFm0AQGUhE6QBll
bRE33boaRe/utKDwSUA3JUJA0eUGJIESEqVxIQUxnx0cQDqmLUMdimHDk117L2u2jVQGaZsyFBz2
kVb4QvqK3v7EkES4/2vYtTmHR1R1gE65oNEINiQKXxxObX3cdlzA52JLD5VECF6wqNix8c6hHGco
fyCkCngDODpCc6cM36egv/okTtEZruCzZyds+qNzhG+IEeUFwC5R7+ugEivfi4Ho+Bu4ntJbQy9v
D/N1seq/CDlrFX+iGUe8gGvY9O4EoRW2EHC+tg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7584)
`pragma protect data_block
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
IY23
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
