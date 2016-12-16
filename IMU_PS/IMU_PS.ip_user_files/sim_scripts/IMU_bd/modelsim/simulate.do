onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -pli "C:/Xilinx/Vivado/2016.2/lib/win64.o/libxil_vsim.dll" -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L processing_system7_bfm_v2_0_5 -lib xil_defaultlib xil_defaultlib.IMU_bd xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {IMU_bd.udo}

run -all

quit -force
