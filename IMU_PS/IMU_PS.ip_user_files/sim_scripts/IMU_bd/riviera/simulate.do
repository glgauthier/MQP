onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+IMU_bd -pli "C:/Xilinx/Vivado/2016.2/lib/win64.o/libxil_vsim.dll" -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L processing_system7_bfm_v2_0_5 -O5 xil_defaultlib.IMU_bd xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {IMU_bd.udo}

run -all

endsim

quit -force
