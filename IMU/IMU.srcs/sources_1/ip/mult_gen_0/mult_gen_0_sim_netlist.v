// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Wed Dec 14 00:58:46 2016
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [4:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [12:0]P;

  wire [4:0]A;
  wire CLK;
  wire [12:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "5" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10110100" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "2" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "12" *) 
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

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "5" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10110100" *) (* C_B_WIDTH = "8" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "2" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "12" *) 
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
  input [4:0]A;
  input [7:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [12:0]P;
  output [47:0]PCASC;

  wire [4:0]A;
  wire [7:0]B;
  wire CE;
  wire CLK;
  wire [12:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "5" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10110100" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "2" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "12" *) 
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
mW7JAuYVkwpXMrm1Lue6uYqJesLC7Au0vu8TTb3XaGnGxu3ZZCIU4cz1YQz5XGQqKCJQMlqAXPFa
Muqsc8hPY2Ks+yR78j9/aryt1Zt2m47zHF9HVCni97Odhg2gFOq5PQTEl76BDUh8N4B1KOVO8Q3c
xuJ+fZNVVIMjMKqbd2Qr2mU6pA78R2THEEVek3vuS5F1GE6vhFq+SuuPoxYcMSc/hrhmTxWGw0jX
0an1bgZ8wVd7eoDmUDddEyI7N8RE1fggDplckjvtxDdU4Yezrw9zC4aRSxtEDpCjiymeKEl6GGBH
bml0w7jLf3vz0Dyd0JdqrUVUdWkgFIALyMde4w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
rlkkiS7bzhwm75SP5j2u27NhH1YZgSUDR6NZKabb/g3//cv9WRuzzoMccudG/HUgqHjcmRwdeNBH
ZFOwXVuQCnTdFbqpOizSUw1/+hMHbYoMBxwlPCofRjX13qCKd46uzlE9sHxSU1kD9j5vgYB4gk83
YKaM/j4v3uDvjNo2kNlocfxe872iuFZ4PWVBawpEbCUv/GcwqyE8zcH2MQHk3QLeLLk/z8VV0NhN
skSaQfEEL+dcA/nKsY9jAeFdskfw0LTsnActPN9v9tmuDqcxmlmGb5sj1B0ELQgWZSkxfX3IzlAG
/wP0wU2F3lpYL6JlDAhHW9tibhCTqDhycMZRVA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7104)
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
