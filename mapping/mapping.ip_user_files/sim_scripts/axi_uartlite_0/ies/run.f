-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/axi_lite_ipif_v3_0_4 \
  "../../../ipstatic/axi_lite_ipif_v3_0_4/hdl/src/vhdl/ipif_pkg.vhd" \
  "../../../ipstatic/axi_lite_ipif_v3_0_4/hdl/src/vhdl/pselect_f.vhd" \
  "../../../ipstatic/axi_lite_ipif_v3_0_4/hdl/src/vhdl/address_decoder.vhd" \
  "../../../ipstatic/axi_lite_ipif_v3_0_4/hdl/src/vhdl/slave_attachment.vhd" \
  "../../../ipstatic/axi_lite_ipif_v3_0_4/hdl/src/vhdl/axi_lite_ipif.vhd" \
-endlib
-makelib ies/lib_pkg_v1_0_2 \
  "../../../ipstatic/lib_pkg_v1_0_2/hdl/src/vhdl/lib_pkg.vhd" \
-endlib
-makelib ies/lib_srl_fifo_v1_0_2 \
  "../../../ipstatic/lib_srl_fifo_v1_0_2/hdl/src/vhdl/cntr_incr_decr_addn_f.vhd" \
  "../../../ipstatic/lib_srl_fifo_v1_0_2/hdl/src/vhdl/dynshreg_f.vhd" \
  "../../../ipstatic/lib_srl_fifo_v1_0_2/hdl/src/vhdl/srl_fifo_rbu_f.vhd" \
  "../../../ipstatic/lib_srl_fifo_v1_0_2/hdl/src/vhdl/srl_fifo_f.vhd" \
-endlib
-makelib ies/lib_cdc_v1_0_2 \
  "../../../ipstatic/lib_cdc_v1_0_2/hdl/src/vhdl/cdc_sync.vhd" \
-endlib
-makelib ies/axi_uartlite_v2_0_13 \
  "../../../ipstatic/axi_uartlite_v2_0_13/hdl/src/vhdl/dynshreg_i_f.vhd" \
  "../../../ipstatic/axi_uartlite_v2_0_13/hdl/src/vhdl/uartlite_tx.vhd" \
  "../../../ipstatic/axi_uartlite_v2_0_13/hdl/src/vhdl/uartlite_rx.vhd" \
  "../../../ipstatic/axi_uartlite_v2_0_13/hdl/src/vhdl/baudrate.vhd" \
  "../../../ipstatic/axi_uartlite_v2_0_13/hdl/src/vhdl/uartlite_core.vhd" \
  "../../../ipstatic/axi_uartlite_v2_0_13/hdl/src/vhdl/axi_uartlite.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../mapping.srcs/sources_1/ip/axi_uartlite_0/sim/axi_uartlite_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

