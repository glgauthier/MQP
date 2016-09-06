-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/dist_mem_gen_v8_0_10 \
  "../../../ipstatic/dist_mem_gen_v8_0_10/simulation/dist_mem_gen_v8_0.v" \
-endlib
-makelib ies/blk_mem_gen_v8_3_3 \
  "../../../ipstatic/blk_mem_gen_v8_3_3/simulation/blk_mem_gen_v8_3.v" \
-endlib
-makelib ies/lib_bmg_v1_0_5 \
  "../../../ipstatic/lib_bmg_v1_0_5/hdl/src/vhdl/blk_mem_gen_wrapper.vhd" \
-endlib
-makelib ies/lib_cdc_v1_0_2 \
  "../../../ipstatic/lib_cdc_v1_0_2/hdl/src/vhdl/cdc_sync.vhd" \
-endlib
-makelib ies/axi_traffic_gen_v2_0_10 \
  "../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_asynch_rst_ff.v" \
  "../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_slvram_v7.v" \
  "../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/verilog/axi_traffic_gen_v2_0_regslice.v" \
-endlib
-makelib ies/axi_traffic_gen_v2_0_10 \
  "../../../ipstatic/axi_traffic_gen_v2_0_10/hdl/src/vhdl/axi_traffic_gen_v2_0_bmg_wrap.vhd" \
-endlib
-makelib ies/axi_traffic_gen_v2_0_10 \
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
-endlib
-makelib ies/xil_defaultlib \
  "../../../../axi_uartlite_0_example.srcs/sources_1/ip/axi_traffic_gen_0/sim/axi_traffic_gen_0.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

