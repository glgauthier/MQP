-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../mapping.srcs/sources_1/ip/dcm_96M/dcm_96M_clk_wiz.v" \
  "../../../../mapping.srcs/sources_1/ip/dcm_96M/dcm_96M.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

