-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Mon Dec 12 22:24:22 2016
-- Host        : JOHN-HP running 64-bit major release  (build 7600)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/John/Documents/GitHub/MQP/IMU/IMU.srcs/sources_1/ip/mult_gen_1/mult_gen_1_stub.vhdl
-- Design      : mult_gen_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mult_gen_1 is
  Port ( 
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 10 downto 0 );
    P : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );

end mult_gen_1;

architecture stub of mult_gen_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,A[10:0],P[17:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "mult_gen_v12_0_11,Vivado 2016.2";
begin
end;
