-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Thu Dec 01 11:14:54 2016
-- Host        : Georges-T460p running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/georges/Documents/GitHub/MQP/ZedFinalCams/ZedFinalCams.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.vhdl
-- Design      : clk_wiz_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_0 is
  Port ( 
    clkin_100MHz : in STD_LOGIC;
    clk_100MHz : out STD_LOGIC;
    clk_25MHz : out STD_LOGIC;
    clk_24MHz : out STD_LOGIC;
    clk_5MHz : out STD_LOGIC;
    reset : in STD_LOGIC
  );

end clk_wiz_0;

architecture stub of clk_wiz_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clkin_100MHz,clk_100MHz,clk_25MHz,clk_24MHz,clk_5MHz,reset";
begin
end;
