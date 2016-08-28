onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib dcm_96M_opt

do {wave.do}

view wave
view structure
view signals

do {dcm_96M.udo}

run -all

quit -force
