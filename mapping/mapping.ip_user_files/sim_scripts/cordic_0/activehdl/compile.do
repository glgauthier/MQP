vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/xbip_utils_v3_0_6
vlib activehdl/c_reg_fd_v12_0_2
vlib activehdl/xbip_dsp48_wrapper_v3_0_4
vlib activehdl/xbip_pipe_v3_0_2
vlib activehdl/xbip_dsp48_addsub_v3_0_2
vlib activehdl/xbip_addsub_v3_0_2
vlib activehdl/c_addsub_v12_0_9
vlib activehdl/xbip_bram18k_v3_0_2
vlib activehdl/mult_gen_v12_0_11
vlib activehdl/axi_utils_v2_0_2
vlib activehdl/cordic_v6_0_10

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap xbip_utils_v3_0_6 activehdl/xbip_utils_v3_0_6
vmap c_reg_fd_v12_0_2 activehdl/c_reg_fd_v12_0_2
vmap xbip_dsp48_wrapper_v3_0_4 activehdl/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_2 activehdl/xbip_pipe_v3_0_2
vmap xbip_dsp48_addsub_v3_0_2 activehdl/xbip_dsp48_addsub_v3_0_2
vmap xbip_addsub_v3_0_2 activehdl/xbip_addsub_v3_0_2
vmap c_addsub_v12_0_9 activehdl/c_addsub_v12_0_9
vmap xbip_bram18k_v3_0_2 activehdl/xbip_bram18k_v3_0_2
vmap mult_gen_v12_0_11 activehdl/mult_gen_v12_0_11
vmap axi_utils_v2_0_2 activehdl/axi_utils_v2_0_2
vmap cordic_v6_0_10 activehdl/cordic_v6_0_10

vlog -work xil_defaultlib -v2k5 -sv \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_6 -93 \
"../../../ipstatic/xbip_utils_v3_0_6/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_2 -93 \
"../../../ipstatic/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../ipstatic/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_2 -93 \
"../../../ipstatic/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_2 -93 \
"../../../ipstatic/xbip_dsp48_addsub_v3_0_2/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_dsp48_addsub_v3_0_2/hdl/xbip_dsp48_addsub_v3_0.vhd" \

vcom -work xbip_addsub_v3_0_2 -93 \
"../../../ipstatic/xbip_addsub_v3_0_2/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_addsub_v3_0_2/hdl/xbip_addsub_v3_0.vhd" \

vcom -work c_addsub_v12_0_9 -93 \
"../../../ipstatic/c_addsub_v12_0_9/hdl/c_addsub_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_addsub_v12_0_9/hdl/c_addsub_v12_0.vhd" \

vcom -work xbip_bram18k_v3_0_2 -93 \
"../../../ipstatic/xbip_bram18k_v3_0_2/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_bram18k_v3_0_2/hdl/xbip_bram18k_v3_0.vhd" \

vcom -work mult_gen_v12_0_11 -93 \
"../../../ipstatic/mult_gen_v12_0_11/hdl/mult_gen_v12_0_vh_rfs.vhd" \
"../../../ipstatic/mult_gen_v12_0_11/hdl/mult_gen_v12_0.vhd" \

vcom -work axi_utils_v2_0_2 -93 \
"../../../ipstatic/axi_utils_v2_0_2/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work cordic_v6_0_10 -93 \
"../../../ipstatic/cordic_v6_0_10/hdl/cordic_v6_0_vh_rfs.vhd" \
"../../../ipstatic/cordic_v6_0_10/hdl/cordic_v6_0.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../mapping.srcs/sources_1/ip/cordic_0/sim/cordic_0.vhd" \

vlog -work xil_defaultlib "glbl.v"

