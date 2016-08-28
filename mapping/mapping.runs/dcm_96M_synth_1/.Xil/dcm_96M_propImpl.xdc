set_property SRC_FILE_INFO {cfile:c:/Users/John/Documents/GitHub/MQP/mapping/mapping.srcs/sources_1/ip/dcm_96M/dcm_96M.xdc rfile:../../../mapping.srcs/sources_1/ip/dcm_96M/dcm_96M.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
