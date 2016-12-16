vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/processing_system7_bfm_v2_0_5

vmap xil_defaultlib activehdl/xil_defaultlib
vmap processing_system7_bfm_v2_0_5 activehdl/processing_system7_bfm_v2_0_5

vlog -work xil_defaultlib -v2k5 "+incdir+../../../bd/IMU_bd/ipshared/xilinx.com/inout_v1_0/src" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../IMU_PS.srcs/sources_1/bd/IMU_bd/ipshared/xilinx.com/inout_v1_0/src" "+incdir+../../../bd/IMU_bd/ipshared/xilinx.com/inout_v1_0/src" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../IMU_PS.srcs/sources_1/bd/IMU_bd/ipshared/xilinx.com/inout_v1_0/src" \
"../../../bd/IMU_bd/hdl/IMU_bd.v" \

vlog -work processing_system7_bfm_v2_0_5 -v2k5 "+incdir+../../../bd/IMU_bd/ipshared/xilinx.com/inout_v1_0/src" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../IMU_PS.srcs/sources_1/bd/IMU_bd/ipshared/xilinx.com/inout_v1_0/src" "+incdir+../../../bd/IMU_bd/ipshared/xilinx.com/inout_v1_0/src" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../IMU_PS.srcs/sources_1/bd/IMU_bd/ipshared/xilinx.com/inout_v1_0/src" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_arb_wr.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_arb_rd.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_arb_wr_4.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_arb_rd_4.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_arb_hp2_3.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_arb_hp0_1.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_ssw_hp.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_sparse_mem.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_reg_map.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_ocm_mem.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_intr_wr_mem.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_intr_rd_mem.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_fmsw_gp.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_regc.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_ocmc.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_interconnect_model.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_gen_reset.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_gen_clock.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_ddrc.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_axi_slave.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_axi_master.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_afi_slave.v" \
"../../../ipstatic/processing_system7_bfm_v2_0/hdl/processing_system7_bfm_v2_0_processing_system7_bfm.v" \

vlog -work xil_defaultlib -v2k5 "+incdir+../../../bd/IMU_bd/ipshared/xilinx.com/inout_v1_0/src" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../IMU_PS.srcs/sources_1/bd/IMU_bd/ipshared/xilinx.com/inout_v1_0/src" "+incdir+../../../bd/IMU_bd/ipshared/xilinx.com/inout_v1_0/src" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../IMU_PS.srcs/sources_1/bd/IMU_bd/ipshared/xilinx.com/inout_v1_0/src" \
"../../../bd/IMU_bd/ip/IMU_bd_processing_system7_0_0/sim/IMU_bd_processing_system7_0_0.v" \
"../../../bd/IMU_bd/ip/IMU_bd_InOut_0_0/sim/IMU_bd_InOut_0_0.v" \

vlog -work xil_defaultlib "glbl.v"

