create_ip -name clk_wiz -version 5.3 -vendor xilinx.com -library ip -module_name clk_wiz_0
set_property -dict [list CONFIG.PRIM_IN_FREQ {200.000} CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {100.000}] [get_ips clk_wiz_0]
generate_target all [get_ips clk_wiz_0]
create_ip -name axi_traffic_gen -version 2.0 -vendor xilinx.com -library ip -module_name axi_traffic_gen_0
set coe1 [lindex [get_property name [get_files *atg_addr.coe]] 0 ]
set coe2 [lindex [get_property name [get_files *atg_mask.coe]] 0 ]
set coe3 [lindex [get_property name [get_files *atg_ctrl.coe]] 0 ]
set coe4 [lindex [get_property name [get_files *atg_data.coe]] 0 ]

set_property -dict [list CONFIG.C_ATG_MODE {AXI4-Lite} CONFIG.C_ATG_SYSTEM_INIT_ADDR_MIF $coe1 CONFIG.C_ATG_SYSTEM_INIT_MASK_MIF $coe2 CONFIG.C_ATG_SYSTEM_INIT_CTRL_MIF $coe3 CONFIG.C_ATG_SYSTEM_INIT_DATA_MIF $coe4 CONFIG.C_ATG_SYSINIT_MODES {System_Test} CONFIG.C_ATG_SYSTEM_TEST_MAX_CLKS {2147483647} CONFIG.C_ATG_MIF_DATA_DEPTH {16}] [get_ips axi_traffic_gen_0]
generate_target all [get_ips axi_traffic_gen_0]

##create_ip -name clk_wiz -version 5.3 -vendor xilinx.com -library ip -module_name clk_wiz_tb
##set_property -dict [list CONFIG.PRIM_IN_FREQ {200.000} CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {100.000}] [get_ips clk_wiz_tb]
##generate_target all [get_ips clk_wiz_tb]
##create_fileset -blockset clk_wiz_tb 
##set_property top clk_wiz_tb [get_fileset clk_wiz_tb]
##move_files -fileset [get_fileset clk_wiz_tb] [get_files -of_objects [get_fileset sources_1] *clk_wiz_tb.xci]
##launch_run  clk_wiz_tb_synth_1
##wait_on_run clk_wiz_tb_synth_1
##import_files -fileset sim_1 [get_files -all -of_objects [get_files *clk_wiz_tb.xci] -filter {USED_IN=~"*sim*"&&NAME=~"*clk_wiz_tb*sim*"&&USED_IN_SYNTHESIS==0}]
##set_property used_in_synthesis false [get_files *clk_wiz_tb.xci]
##set_property used_in_implementation false [get_files *clk_wiz_tb.xci]
##set_property used_in_simulation false [get_files *clk_wiz_tb.xci]
##file delete -force *clk_wiz_tb
##remove_files -fileset clk_wiz_tb *clk_wiz_tb.xci
##delete_fileset clk_wiz_tb
set_property top axi_uartlite_0_exdes [current_fileset]
update_compile_order -fileset sources_1
set_property top axi_uartlite_0_exdes_tb [get_filesets sim_1]
set_property top_lib {} [get_filesets sim_1]
set_property top_arch {} [get_filesets sim_1]
set_property top_file {} [get_filesets sim_1]
update_compile_order -fileset sim_1
