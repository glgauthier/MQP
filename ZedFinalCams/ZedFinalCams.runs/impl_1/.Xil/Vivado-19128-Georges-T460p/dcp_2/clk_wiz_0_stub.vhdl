-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
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
begin
end;
