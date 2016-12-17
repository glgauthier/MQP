//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Fri Dec 16 16:49:53 2016
//Host        : Georges-T460p running 64-bit major release  (build 9200)
//Command     : generate_target IMU_bd.bd
//Design      : IMU_bd
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "IMU_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=IMU_bd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_ps7_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "IMU_bd.hwdef" *) 
module IMU_bd
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
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    GPIO_0_tri_i,
    GPIO_0_tri_o,
    GPIO_0_tri_t,
    SPI_0_io0_i,
    SPI_0_io0_o,
    SPI_0_io0_t,
    SPI_0_io1_i,
    SPI_0_io1_o,
    SPI_0_io1_t,
    SPI_0_sck_i,
    SPI_0_sck_o,
    SPI_0_sck_t,
    SPI_0_ss1_o,
    SPI_0_ss2_o,
    SPI_0_ss_i,
    SPI_0_ss_o,
    SPI_0_ss_t);
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

  wire [14:0]processing_system7_0_DDR_ADDR;
  wire [2:0]processing_system7_0_DDR_BA;
  wire processing_system7_0_DDR_CAS_N;
  wire processing_system7_0_DDR_CKE;
  wire processing_system7_0_DDR_CK_N;
  wire processing_system7_0_DDR_CK_P;
  wire processing_system7_0_DDR_CS_N;
  wire [3:0]processing_system7_0_DDR_DM;
  wire [31:0]processing_system7_0_DDR_DQ;
  wire [3:0]processing_system7_0_DDR_DQS_N;
  wire [3:0]processing_system7_0_DDR_DQS_P;
  wire processing_system7_0_DDR_ODT;
  wire processing_system7_0_DDR_RAS_N;
  wire processing_system7_0_DDR_RESET_N;
  wire processing_system7_0_DDR_WE_N;
  wire processing_system7_0_FCLK_CLK0;
  wire processing_system7_0_FIXED_IO_DDR_VRN;
  wire processing_system7_0_FIXED_IO_DDR_VRP;
  wire [53:0]processing_system7_0_FIXED_IO_MIO;
  wire processing_system7_0_FIXED_IO_PS_CLK;
  wire processing_system7_0_FIXED_IO_PS_PORB;
  wire processing_system7_0_FIXED_IO_PS_SRSTB;
  wire [1:0]processing_system7_0_GPIO_0_TRI_I;
  wire [1:0]processing_system7_0_GPIO_0_TRI_O;
  wire [1:0]processing_system7_0_GPIO_0_TRI_T;
  wire processing_system7_0_SPI_0_IO0_I;
  wire processing_system7_0_SPI_0_IO0_O;
  wire processing_system7_0_SPI_0_IO0_T;
  wire processing_system7_0_SPI_0_IO1_I;
  wire processing_system7_0_SPI_0_IO1_O;
  wire processing_system7_0_SPI_0_IO1_T;
  wire processing_system7_0_SPI_0_SCK_I;
  wire processing_system7_0_SPI_0_SCK_O;
  wire processing_system7_0_SPI_0_SCK_T;
  wire processing_system7_0_SPI_0_SS1_O;
  wire processing_system7_0_SPI_0_SS2_O;
  wire processing_system7_0_SPI_0_SS_I;
  wire processing_system7_0_SPI_0_SS_O;
  wire processing_system7_0_SPI_0_SS_T;

  assign GPIO_0_tri_o[1:0] = processing_system7_0_GPIO_0_TRI_O;
  assign GPIO_0_tri_t[1:0] = processing_system7_0_GPIO_0_TRI_T;
  assign SPI_0_io0_o = processing_system7_0_SPI_0_IO0_O;
  assign SPI_0_io0_t = processing_system7_0_SPI_0_IO0_T;
  assign SPI_0_io1_o = processing_system7_0_SPI_0_IO1_O;
  assign SPI_0_io1_t = processing_system7_0_SPI_0_IO1_T;
  assign SPI_0_sck_o = processing_system7_0_SPI_0_SCK_O;
  assign SPI_0_sck_t = processing_system7_0_SPI_0_SCK_T;
  assign SPI_0_ss1_o = processing_system7_0_SPI_0_SS1_O;
  assign SPI_0_ss2_o = processing_system7_0_SPI_0_SS2_O;
  assign SPI_0_ss_o = processing_system7_0_SPI_0_SS_O;
  assign SPI_0_ss_t = processing_system7_0_SPI_0_SS_T;
  assign processing_system7_0_GPIO_0_TRI_I = GPIO_0_tri_i[1:0];
  assign processing_system7_0_SPI_0_IO0_I = SPI_0_io0_i;
  assign processing_system7_0_SPI_0_IO1_I = SPI_0_io1_i;
  assign processing_system7_0_SPI_0_SCK_I = SPI_0_sck_i;
  assign processing_system7_0_SPI_0_SS_I = SPI_0_ss_i;
  IMU_bd_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(processing_system7_0_FCLK_CLK0),
        .GPIO_I(processing_system7_0_GPIO_0_TRI_I),
        .GPIO_O(processing_system7_0_GPIO_0_TRI_O),
        .GPIO_T(processing_system7_0_GPIO_0_TRI_T),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(processing_system7_0_FCLK_CLK0),
        .M_AXI_GP0_ARREADY(1'b0),
        .M_AXI_GP0_AWREADY(1'b0),
        .M_AXI_GP0_BID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_GP0_BRESP({1'b0,1'b0}),
        .M_AXI_GP0_BVALID(1'b0),
        .M_AXI_GP0_RDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_GP0_RID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_GP0_RLAST(1'b0),
        .M_AXI_GP0_RRESP({1'b0,1'b0}),
        .M_AXI_GP0_RVALID(1'b0),
        .M_AXI_GP0_WREADY(1'b0),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .SPI0_MISO_I(processing_system7_0_SPI_0_IO1_I),
        .SPI0_MISO_O(processing_system7_0_SPI_0_IO1_O),
        .SPI0_MISO_T(processing_system7_0_SPI_0_IO1_T),
        .SPI0_MOSI_I(processing_system7_0_SPI_0_IO0_I),
        .SPI0_MOSI_O(processing_system7_0_SPI_0_IO0_O),
        .SPI0_MOSI_T(processing_system7_0_SPI_0_IO0_T),
        .SPI0_SCLK_I(processing_system7_0_SPI_0_SCK_I),
        .SPI0_SCLK_O(processing_system7_0_SPI_0_SCK_O),
        .SPI0_SCLK_T(processing_system7_0_SPI_0_SCK_T),
        .SPI0_SS1_O(processing_system7_0_SPI_0_SS1_O),
        .SPI0_SS2_O(processing_system7_0_SPI_0_SS2_O),
        .SPI0_SS_I(processing_system7_0_SPI_0_SS_I),
        .SPI0_SS_O(processing_system7_0_SPI_0_SS_O),
        .SPI0_SS_T(processing_system7_0_SPI_0_SS_T));
endmodule
