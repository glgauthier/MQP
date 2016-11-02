vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/processing_system7_bfm_v2_0_5

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap processing_system7_bfm_v2_0_5 riviera/processing_system7_bfm_v2_0_5

vlog -work xil_defaultlib -v2k5 -sv "+incdir+../../../ipstatic/processing_system7_bfm_v2_0_5/hdl" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0_5/hdl" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work processing_system7_bfm_v2_0_5 -v2k5 "+incdir+../../../ipstatic/processing_system7_bfm_v2_0_5/hdl" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0_5/hdl" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_arb_wr.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_arb_rd.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_arb_wr_4.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_arb_rd_4.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_arb_hp2_3.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_arb_hp0_1.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_ssw_hp.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_sparse_mem.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_reg_map.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_ocm_mem.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_intr_wr_mem.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_intr_rd_mem.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_fmsw_gp.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_regc.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_ocmc.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_interconnect_model.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_gen_reset.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_gen_clock.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_ddrc.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_axi_slave.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_axi_master.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_afi_slave.v" \
"../../../ipstatic/processing_system7_bfm_v2_0_5/hdl/processing_system7_bfm_v2_0_processing_system7_bfm.v" \

vlog -work xil_defaultlib -v2k5 "+incdir+../../../ipstatic/processing_system7_bfm_v2_0_5/hdl" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0_5/hdl" \
"../../../../ZedCamTest.srcs/sources_1/ip/processing_system7_0/sim/processing_system7_0.v" \

vlog -work xil_defaultlib "glbl.v"

