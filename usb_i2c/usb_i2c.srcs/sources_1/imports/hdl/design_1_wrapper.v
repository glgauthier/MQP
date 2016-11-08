//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Tue Nov 01 20:42:35 2016
//Host        : JOHN-HP running 64-bit major release  (build 7600)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
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
    data_step_enable,
    transmit,
    fpga_clk,
    reset,
    hsync,
    vsync,
    rgb
   );
   
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
  output [27:0]data_step_enable;
  input transmit;
  
  input fpga_clk;
  input reset;
  output hsync;
  output vsync;
  output [11:0] rgb;  

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
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [27:0]data_step_enable;
  wire transmit;
  
  wire fpga_clk;
  wire reset;
  wire hsync;
  wire vsync;
  wire [11:0] rgb;  

  design_1 design_1_i
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
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .data_step_enable(data_step_enable),
        .transmit(transmit)
       );
       
       wire clk_100M;
       wire clk_25M;
         
       //for rangefinder logic
       wire [27:0] data_enable_step;
       wire [15:0] data;
       wire enable;
       wire [10:0] step;
       wire [7:0] xlocation, ylocation;
       wire write;
//        wire transmit;
         
       // for vga logic
       wire [10:0] hcount;    // horizontal location on screen
       wire [10:0] vcount;    // vertical location on screen
       wire blank;        
       
       //map of pixel data
//        reg [639:0] vga_map [479:0];
       
       wire [639:0] x_vga;
       reg [639:0] dina;
       
       always @ (posedge clk_100M)
       begin
           dina <= 5'b11111 << (638 - xlocation);
       end
       
       blk_mem_gen_2 vga_map
       (
           .addra(ylocation),
           .clka(clk_100M),
           .dina(dina),
           .ena(1'b1),
           .wea(write),
           
           .addrb(vcount),
           .clkb(clk_25M),
           .doutb(x_vga),  //doutb[hcount]
           .enb(1'b1)
       );        
           
//        always @ (posedge clk_100M)
//        begin
//            if(write)
//            begin
//                // creates a 5x5 pixel square on the map
//                vga_map[xlocation - 2][ylocation - 2] <= 5'b11111;
//                vga_map[xlocation - 2][ylocation - 1] <= 5'b11111;
//                vga_map[xlocation - 2][ylocation]     <= 5'b11111;
//                vga_map[xlocation - 2][ylocation + 1] <= 5'b11111;
//                vga_map[xlocation - 2][ylocation + 2] <= 5'b11111;
//            end
//        end                 
           
       assign rgb = (x_vga[hcount] == 1'b1) ? 12'hFFF : 12'h088;
       
       assign data = data_enable_step[27:12];
       assign enable = data_enable_step[11];
       assign step = data_enable_step[10:0];        
           
       rangefinder rangefinder
       (
           .clk(clk_100M),
           .reset(reset),
           .data(data),
           .enable(enable),
           .step(step),
           .xlocation(xlocation),
           .ylocation(ylocation),
           .write(write),
           .transmit(transmit)
       );        
           
       vga_controller_640_60 vga_controller
       (
           .rst(reset),
           .pixel_clk(clk_25M),
           .HS(hsync),
           .VS(vsync),
           .hcount(hcount),
           .vcount(vcount),
           .blank(blank)
       );        
           
       clk_wiz_0 mmcm
       (
           .clk_in1(fpga_clk),
           .clk_100M(clk_100M),
           .clk_25M(clk_25M),
           .reset(reset),
           .locked()
       );       
       
endmodule
