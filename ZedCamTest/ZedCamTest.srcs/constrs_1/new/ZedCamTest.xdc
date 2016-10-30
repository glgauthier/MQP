create_clock -add -name clock -period 10.00 [get_ports sysclk]
set_property PACKAGE_PIN Y9 [get_ports sysclk]
set_property IOSTANDARD LVCMOS33 [get_ports sysclk]
#input sysclk,
#input reset, // reset 
set_property PACKAGE_PIN P16 [get_ports {reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
#input cam_rst, // button for camera RESET_BAR
set_property PACKAGE_PIN N15 [get_ports {cam_rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {cam_rst}]
#input trigger, // button for camera trigger
set_property PACKAGE_PIN R18 [get_ports {trigger}]
set_property IOSTANDARD LVCMOS33 [get_ports {trigger}]
#input SW_camSelect, // switch for camera output enable
set_property PACKAGE_PIN F22 [get_ports {SW_camSelect}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW_camSelect}]
#input SW_read_fifo,
set_property PACKAGE_PIN G22 [get_ports {SW_read_fifo}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW_read_fifo}]
#output cam_sysclk, // sysclk out to camera
set_property PACKAGE_PIN AA9 [get_ports {cam_sysclk}]
set_property IOSTANDARD LVCMOS33 [get_ports {cam_sysclk}]
#output cam_reset, // reset_bar out to camera
set_property PACKAGE_PIN Y10 [get_ports {cam_reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {cam_reset}]
#output cam_trigger, // trigger out to camera
set_property PACKAGE_PIN AA11 [get_ports {cam_trigger}]
set_property IOSTANDARD LVCMOS33 [get_ports {cam_trigger}]
#output i2c_ready, // LED indicator for i2c bus ready
set_property PACKAGE_PIN T22 [get_ports {i2c_ready}]
set_property IOSTANDARD LVCMOS33 [get_ports {i2c_ready}]
#input [7:0] FIFO_DATA, // DO[7:0] from AL422b fifo
set_property PACKAGE_PIN V8 [get_ports {FIFO_DATA[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {FIFO_DATA[7]}]
set_property PACKAGE_PIN V9 [get_ports {FIFO_DATA[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {FIFO_DATA[6]}]
set_property PACKAGE_PIN W10 [get_ports {FIFO_DATA[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {FIFO_DATA[5]}]
set_property PACKAGE_PIN V12 [get_ports {FIFO_DATA[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {FIFO_DATA[4]}]
set_property PACKAGE_PIN W8 [get_ports {FIFO_DATA[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {FIFO_DATA[3]}]
set_property PACKAGE_PIN V10 [get_ports {FIFO_DATA[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {FIFO_DATA[2]}]
set_property PACKAGE_PIN W11 [get_ports {FIFO_DATA[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {FIFO_DATA[1]}]
set_property PACKAGE_PIN W12 [get_ports {FIFO_DATA[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {FIFO_DATA[0]}]
#output FIFO_OE1, // read enable to fifo (active low)
set_property PACKAGE_PIN AB9 [get_ports {FIFO_OE1}]
set_property IOSTANDARD LVCMOS33 [get_ports {FIFO_OE1}]
#output FIFO_RRST1, // read reset to fifo (active low)
set_property PACKAGE_PIN Y11 [get_ports {FIFO_RRST1}]
set_property IOSTANDARD LVCMOS33 [get_ports {FIFO_RRST1}]
#output FIFO_OE2, // read enable to fifo (active low)
set_property PACKAGE_PIN AB10 [get_ports {FIFO_OE2}]
set_property IOSTANDARD LVCMOS33 [get_ports {FIFO_OE2}]
#output FIFO_RRST2, // read reset to fifo (active low)
set_property PACKAGE_PIN AB11 [get_ports {FIFO_RRST2}]
set_property IOSTANDARD LVCMOS33 [get_ports {FIFO_RRST2}]
#output FIFO_RCK, // rck to fifo (1MHz)
set_property PACKAGE_PIN AA8 [get_ports {FIFO_RCK}]
set_property IOSTANDARD LVCMOS33 [get_ports {FIFO_RCK}]
#output [7:0] rgb, // values on vga color pins
#output HS, // horizontal sync (to VGA port)
#output VS, // vertical sync (to VGA port)

set_property PACKAGE_PIN AA21 [get_ports {rgb[7]}]
set_property PACKAGE_PIN AB21 [get_ports {rgb[6]}]
set_property PACKAGE_PIN AA22 [get_ports {rgb[5]}]
set_property PACKAGE_PIN AB22 [get_ports {rgb[4]}]
set_property PACKAGE_PIN AB19 [get_ports {rgb[3]}]
set_property PACKAGE_PIN AB20 [get_ports {rgb[2]}]
set_property PACKAGE_PIN Y20 [get_ports {rgb[1]}]
set_property PACKAGE_PIN Y21 [get_ports {rgb[0]}]
set_property PACKAGE_PIN AA19 [get_ports {HS}] 
set_property PACKAGE_PIN Y19 [get_ports {VS}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports HS]
set_property IOSTANDARD LVCMOS33 [get_ports VS]
