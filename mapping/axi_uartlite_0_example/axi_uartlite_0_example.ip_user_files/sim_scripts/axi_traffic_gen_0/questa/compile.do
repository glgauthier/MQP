vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/dist_mem_gen_v8_0_10
vlib msim/blk_mem_gen_v8_3_3
vlib msim/lib_bmg_v1_0_5
vlib msim/lib_cdc_v1_0_2
vlib msim/axi_traffic_gen_v2_0_10

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap dist_mem_gen_v8_0_10 msim/dist_mem_gen_v8_0_10
vmap blk_mem_gen_v8_3_3 msim/blk_mem_gen_v8_3_3
vmap lib_bmg_v1_0_5 msim/lib_bmg_v1_0_5
vmap lib_cdc_v1_0_2 msim/lib_cdc_v1_0_2
vmap axi_traffic_gen_v2_0_10 msim/axi_traffic_gen_v2_0_10

vlog -work xil_defaultlib -64 -sv "+incdir+../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog" "+incdir+../../../../axi_uartlite_0_example.srcs/sources_1/ip/axi_traffic_gen_0/hdl/src/verilog" "+incdir+../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog" "+incdir+../../../../axi_uartlite_0_example.srcs/sources_1/ip/axi_traffic_gen_0/hdl/src/verilog" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work dist_mem_gen_v8_0_10 -64 "+incdir+../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog" "+incdir+../../../../axi_uartlite_0_example.srcs/sources_1/ip/axi_traffic_gen_0/hdl/src/verilog" "+incdir+../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog" "+incdir+../../../../axi_uartlite_0_example.srcs/sources_1/ip/axi_traffic_gen_0/hdl/src/verilog" \
"../../../ipstatic/dist_mem_gen_v8_0_10/simulation/dist_mem_gen_v8_0.v" \

vlog -work blk_mem_gen_v8_3_3 -64 "+incdir+../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog" "+incdir+../../../../axi_uartlite_0_example.srcs/sources_1/ip/axi_traffic_gen_0/hdl/src/verilog" "+incdir+../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog" "+incdir+../../../../axi_uartlite_0_example.srcs/sources_1/ip/axi_traffic_gen_0/hdl/src/verilog" \
"../../../ipstatic/blk_mem_gen_v8_3_3/simulation/blk_mem_gen_v8_3.v" \

vcom -work lib_bmg_v1_0_5 -64 \
"../../../ipstatic/lib_bmg_v1_0_5/hdl/src/vhdl/blk_mem_gen_wrapper.vhd" \

vcom -work lib_cdc_v1_0_2 -64 \
"../../../ipstatic/lib_cdc_v1_0_2/hdl/src/vhdl/cdc_sync.vhd" \

vlog -work axi_traffic_gen_v2_0_10 -64 "+incdir+../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog" "+incdir+../../../../axi_uartlite_0_example.srcs/sources_1/ip/axi_traffic_gen_0/hdl/src/verilog" "+incdir+../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog" "+incdir+../../../../axi_uartlite_0_example.srcs/sources_1/ip/axi_traffic_gen_0/hdl/src/verilog" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_asynch_rst_ff.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_slvram_v7.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_regslice.v" \

vcom -work axi_traffic_gen_v2_0_10 -64 \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/vhdl/axi_traffic_gen_v2_0_bmg_wrap.vhd" \

vlog -work axi_traffic_gen_v2_0_10 -64 "+incdir+../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog" "+incdir+../../../../axi_uartlite_0_example.srcs/sources_1/ip/axi_traffic_gen_0/hdl/src/verilog" "+incdir+../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog" "+incdir+../../../../axi_uartlite_0_example.srcs/sources_1/ip/axi_traffic_gen_0/hdl/src/verilog" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_inferram.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_randgen.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_id_track.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_ex_fifo.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_cmdram.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_addrgen.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_s_w_channel.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_s_r_channel.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_sharedram_wrap.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_registers.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_paramram_wrap.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_paramram_64_wrap.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_addrram_wrap.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_m_w_channel.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_m_r_channel.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_cmdram_wrap.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_static_regblk.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_static_cmdgen.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_static_mrdwr.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_static_top.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_slave_only_top.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_basic_n_full_top.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_axis_fifo.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_streaming_top.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_systeminit_dmg.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_systeminit_mrdwr.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_systeminit_top.v" \
"../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_top.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog" "+incdir+../../../../axi_uartlite_0_example.srcs/sources_1/ip/axi_traffic_gen_0/hdl/src/verilog" "+incdir+../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog" "+incdir+../../../../axi_uartlite_0_example.srcs/sources_1/ip/axi_traffic_gen_0/hdl/src/verilog" \
"../../../../axi_uartlite_0_example.srcs/sources_1/ip/axi_traffic_gen_0/sim/axi_traffic_gen_0.v" \

vlog -work xil_defaultlib "glbl.v"
