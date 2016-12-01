create_clock -period 10.000 -name clock -add [get_ports fpga_clk]
set_property PACKAGE_PIN Y9 [get_ports fpga_clk]
set_property IOSTANDARD LVCMOS33 [get_ports fpga_clk]


set_property PACKAGE_PIN P16 [get_ports reset]
set_property PACKAGE_PIN R18 [get_ports button]

set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports button]

set_property PACKAGE_PIN W12 [get_ports cs_n]
set_property PACKAGE_PIN W11 [get_ports sclk]
set_property PACKAGE_PIN V10 [get_ports mosi]
set_property PACKAGE_PIN W8 [get_ports miso]


set_property IOSTANDARD LVCMOS33 [get_ports cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports sclk]
set_property IOSTANDARD LVCMOS33 [get_ports mosi]
set_property IOSTANDARD LVCMOS33 [get_ports miso]