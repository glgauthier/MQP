onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -L dist_mem_gen_v8_0_10 -L blk_mem_gen_v8_3_3 -L lib_bmg_v1_0_5 -L lib_cdc_v1_0_2 -L axi_traffic_gen_v2_0_10 -lib xil_defaultlib xil_defaultlib.axi_traffic_gen_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {axi_traffic_gen_0.udo}

run -all

quit -force
