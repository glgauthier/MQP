onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -pli "C:/Xilinx/Vivado/2016.2/lib/win64.o/libxil_vsim.dll" -lib xil_defaultlib blk_mem_gen_0_opt

do {wave.do}

view wave
view structure
view signals

do {blk_mem_gen_0.udo}

run -all

quit -force
