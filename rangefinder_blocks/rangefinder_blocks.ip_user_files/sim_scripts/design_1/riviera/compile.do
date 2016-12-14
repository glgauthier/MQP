vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/processing_system7_bfm_v2_0_5
vlib riviera/xbip_utils_v3_0_6
vlib riviera/xbip_pipe_v3_0_2
vlib riviera/xbip_bram18k_v3_0_2
vlib riviera/mult_gen_v12_0_11
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_9
vlib riviera/blk_mem_gen_v8_3_3
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/fifo_generator_v13_1_1
vlib riviera/axi_data_fifo_v2_1_8
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_register_slice_v2_1_9
vlib riviera/axi_protocol_converter_v2_1_9

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap processing_system7_bfm_v2_0_5 riviera/processing_system7_bfm_v2_0_5
vmap xbip_utils_v3_0_6 riviera/xbip_utils_v3_0_6
vmap xbip_pipe_v3_0_2 riviera/xbip_pipe_v3_0_2
vmap xbip_bram18k_v3_0_2 riviera/xbip_bram18k_v3_0_2
vmap mult_gen_v12_0_11 riviera/mult_gen_v12_0_11
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_9 riviera/proc_sys_reset_v5_0_9
vmap blk_mem_gen_v8_3_3 riviera/blk_mem_gen_v8_3_3
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_1_1 riviera/fifo_generator_v13_1_1
vmap axi_data_fifo_v2_1_8 riviera/axi_data_fifo_v2_1_8
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_9 riviera/axi_register_slice_v2_1_9
vmap axi_protocol_converter_v2_1_9 riviera/axi_protocol_converter_v2_1_9

vlog -work xil_defaultlib -v2k5 -sv "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
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

vlog -work processing_system7_bfm_v2_0_5 -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
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

vlog -work xil_defaultlib -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
"../../../bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_0.v" \

vcom -work xbip_utils_v3_0_6 -93 \
"../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/mult_gen_0/xbip_utils_v3_0_6/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_2 -93 \
"../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/mult_gen_0/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
"../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/mult_gen_0/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0.vhd" \

vcom -work xbip_bram18k_v3_0_2 -93 \
"../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/mult_gen_0/xbip_bram18k_v3_0_2/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
"../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/mult_gen_0/xbip_bram18k_v3_0_2/hdl/xbip_bram18k_v3_0.vhd" \

vcom -work mult_gen_v12_0_11 -93 \
"../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/mult_gen_0/mult_gen_v12_0_11/hdl/mult_gen_v12_0_vh_rfs.vhd" \
"../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/mult_gen_0/mult_gen_v12_0_11/hdl/mult_gen_v12_0.vhd" \
"../../../bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/mult_gen_0/sim/mult_gen_0.vhd" \
"../../../bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/mult_gen_1/sim/mult_gen_1.vhd" \
"../../../bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/mult_gen_2/sim/mult_gen_2.vhd" \

vlog -work xil_defaultlib -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../bd/design_1/ipshared/xilinx.com/nu_nu_rangefinder_vga_v1_0/src/rangefinder.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ipshared/xilinx.com/nu_nu_rangefinder_vga_v1_0/src/vga_controller_640_60.vhd" \

vlog -work xil_defaultlib -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../bd/design_1/ipshared/xilinx.com/nu_nu_rangefinder_vga_v1_0/src/mqp_top.v" \
"../../../bd/design_1/ipshared/xilinx.com/nu_nu_rangefinder_vga_v1_0/hdl/nu_nu_rangefinder_vga_v1_0_S00_AXI.v" \
"../../../bd/design_1/ipshared/xilinx.com/nu_nu_rangefinder_vga_v1_0/hdl/nu_nu_rangefinder_vga_v1_0.v" \
"../../../bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/sim/design_1_nu_nu_rangefinder_vga_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../ipstatic/lib_cdc_v1_0/hdl/src/vhdl/cdc_sync.vhd" \

vcom -work proc_sys_reset_v5_0_9 -93 \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/upcnt_n.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/sequence_psr.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/lpf.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/proc_sys_reset.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_rst_processing_system7_0_100M_0/sim/design_1_rst_processing_system7_0_100M_0.vhd" \

vlog -work xil_defaultlib -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../bd/design_1/hdl/design_1.v" \

vlog -work blk_mem_gen_v8_3_3 -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/blk_mem_gen_v8_3/simulation/blk_mem_gen_v8_3.v" \

vlog -work xil_defaultlib -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_1/sim/design_1_blk_mem_gen_0_1.v" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_1_0/sim/design_1_blk_mem_gen_1_0.v" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_2_0/sim/design_1_blk_mem_gen_2_0.v" \

vlog -work generic_baseblocks_v2_1_0 -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_and.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_latch_and.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_latch_or.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_or.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_command_fifo.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_mask_static.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_mask.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_mask_static.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_mask.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_static.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_static.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_mux_enc.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_mux.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_nto1_mux.v" \

vlog -work fifo_generator_v13_1_1 -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/fifo_generator_v13_1/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_1_1 -93 \
"../../../ipstatic/fifo_generator_v13_1/hdl/fifo_generator_v13_1_rfs.vhd" \

vlog -work fifo_generator_v13_1_1 -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/fifo_generator_v13_1/hdl/fifo_generator_v13_1_rfs.v" \

vlog -work axi_data_fifo_v2_1_8 -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_fifo.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_fifo_gen.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_srl_fifo.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_reg_srl_fifo.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_ndeep_srl.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axi_data_fifo.v" \

vlog -work axi_infrastructure_v1_1_0 -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_axi2vector.v" \
"../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_axic_srl_fifo.v" \
"../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_vector2axi.v" \

vlog -work axi_register_slice_v2_1_9 -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/axi_register_slice_v2_1/hdl/verilog/axi_register_slice_v2_1_axic_register_slice.v" \
"../../../ipstatic/axi_register_slice_v2_1/hdl/verilog/axi_register_slice_v2_1_axi_register_slice.v" \

vlog -work axi_protocol_converter_v2_1_9 -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_a_axi3_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_axi3_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_axilite_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_r_axi3_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_w_axi3_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b_downsizer.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_decerr_slave.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_simple_fifo.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_wrap_cmd.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_incr_cmd.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_wr_cmd_fsm.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_rd_cmd_fsm.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_cmd_translator.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_b_channel.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_r_channel.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_aw_channel.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_ar_channel.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_axi_protocol_converter.v" \

vlog -work xil_defaultlib -v2k5 "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" "+incdir+../../../../rangefinder_blocks.srcs/sources_1/bd/design_1/ip/design_1_nu_nu_rangefinder_vga_0_0/src/clk_wiz_0_1/clk_wiz_v5_3_1" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/processing_system7_bfm_v2_0/hdl" \
"../../../bd/design_1/ip/design_1_auto_pc_0_1/sim/design_1_auto_pc_0.v" \

vlog -work xil_defaultlib "glbl.v"

