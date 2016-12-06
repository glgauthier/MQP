-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity noip_top is
  Port ( 
    sysclk : in STD_LOGIC;
    reset : in STD_LOGIC;
    sw : in STD_LOGIC;
    cam_rst : in STD_LOGIC;
    trigger : in STD_LOGIC;
    cam_sysclk : out STD_LOGIC;
    cam_reset : out STD_LOGIC;
    cam_trigger : out STD_LOGIC;
    FIFO_DATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    FIFO_OE1 : out STD_LOGIC;
    FIFO_RRST1 : out STD_LOGIC;
    FIFO_OE2 : out STD_LOGIC;
    FIFO_RRST2 : out STD_LOGIC;
    FIFO_RCK : out STD_LOGIC;
    rgb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    HS : out STD_LOGIC;
    VS : out STD_LOGIC;
    LEDs : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end noip_top;

architecture stub of noip_top is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
begin
end;
