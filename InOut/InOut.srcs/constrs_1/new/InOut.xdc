# Inputs/Outputs (to/from PS PMOD through passthrough PMOD)
set_property PACKAGE_PIN W7 [get_ports sclk]
set_property PACKAGE_PIN V7 [get_ports mosi]
set_property PACKAGE_PIN V4 [get_ports miso_O]
set_property PACKAGE_PIN V5 [get_ports cs_nM]

# Outputs to IMU
set_property PACKAGE_PIN AA4 [get_ports sclk_O]
set_property PACKAGE_PIN AB6 [get_ports mosi_O]
set_property PACKAGE_PIN Y4 [get_ports miso_I]
set_property PACKAGE_PIN T4 [get_ports cs_nM_O]
set_property PACKAGE_PIN AB7 [get_ports cs_nAG_O]
set_property PACKAGE_PIN U4 [get_ports cs_nALT_O]

# IOstandards
set_property IOSTANDARD LVCMOS33 [get_ports cs_nAG_O]
set_property IOSTANDARD LVCMOS33 [get_ports cs_nALT_O]
set_property IOSTANDARD LVCMOS33 [get_ports sclk]
set_property IOSTANDARD LVCMOS33 [get_ports sclk_O]
set_property IOSTANDARD LVCMOS33 [get_ports mosi]
set_property IOSTANDARD LVCMOS33 [get_ports mosi_O]
set_property IOSTANDARD LVCMOS33 [get_ports miso_O]
set_property IOSTANDARD LVCMOS33 [get_ports miso_I]
set_property IOSTANDARD LVCMOS33 [get_ports cs_nM]
set_property IOSTANDARD LVCMOS33 [get_ports cs_nM_O]