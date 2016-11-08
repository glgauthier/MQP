-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Wed Nov 02 13:42:40 2016
-- Host        : JOHN-HP running 64-bit major release  (build 7600)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/John/Documents/GitHub/MQP/usb_i2c/usb_i2c.srcs/sources_1/ip/blk_mem_gen_2/blk_mem_gen_2_stub.vhdl
-- Design      : blk_mem_gen_2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blk_mem_gen_2 is
  Port ( 
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 639 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 639 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 639 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 639 downto 0 )
  );

end blk_mem_gen_2;

architecture stub of blk_mem_gen_2 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,ena,wea[0:0],addra[8:0],dina[639:0],douta[639:0],clkb,enb,web[0:0],addrb[8:0],dinb[639:0],doutb[639:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_3_3,Vivado 2016.2";
begin
end;
