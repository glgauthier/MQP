connect -url tcp:127.0.0.1:3121
source C:/Users/georges/Documents/GitHub/MQP/ZedCamTest/ZedCamTest.sdk/bd_wrapper_hw_platform_0/ps7_init.tcl
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent Zed 210248447864"} -index 0
loadhw C:/Users/georges/Documents/GitHub/MQP/ZedCamTest/ZedCamTest.sdk/bd_wrapper_hw_platform_0/system.hdf
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent Zed 210248447864"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248447864"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248447864"} -index 0
dow C:/Users/georges/Documents/GitHub/MQP/ZedCamTest/ZedCamTest.sdk/ZedCameraController/Debug/ZedCameraController.elf
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248447864"} -index 0
con
