proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7z020clg484-1
  set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.cache/wt [current_project]
  set_property parent.project_path C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.xpr [current_project]
  set_property ip_repo_paths {
  c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.cache/ip
  C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs
} [current_project]
  set_property ip_output_repo c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.cache/ip [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.runs/synth_1/mqp_top.dcp
  add_files -quiet C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.runs/processing_system7_0_synth_1/processing_system7_0.dcp
  set_property netlist_only true [get_files C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.runs/processing_system7_0_synth_1/processing_system7_0.dcp]
  add_files -quiet C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.runs/clk_wiz_0_synth_1/clk_wiz_0.dcp
  set_property netlist_only true [get_files C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.runs/clk_wiz_0_synth_1/clk_wiz_0.dcp]
  add_files -quiet C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.runs/blk_mem_gen_0_synth_1/blk_mem_gen_0.dcp
  set_property netlist_only true [get_files C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.runs/blk_mem_gen_0_synth_1/blk_mem_gen_0.dcp]
  add_files -quiet C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1.dcp
  set_property netlist_only true [get_files C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1.dcp]
  add_files -quiet C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.runs/blk_mem_gen_2_synth_1/blk_mem_gen_2.dcp
  set_property netlist_only true [get_files C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.runs/blk_mem_gen_2_synth_1/blk_mem_gen_2.dcp]
  read_xdc -ref processing_system7_0 -cells inst c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/sources_1/ip/processing_system7_0/processing_system7_0.xdc
  set_property processing_order EARLY [get_files c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/sources_1/ip/processing_system7_0/processing_system7_0.xdc]
  read_xdc -mode out_of_context -ref clk_wiz_0 -cells inst c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc
  set_property processing_order EARLY [get_files c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]
  read_xdc -prop_thru_buffers -ref clk_wiz_0 -cells inst c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
  read_xdc -ref clk_wiz_0 -cells inst c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc
  set_property processing_order EARLY [get_files c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
  read_xdc -mode out_of_context -ref blk_mem_gen_0 -cells U0 c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc
  set_property processing_order EARLY [get_files c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_gen_1 -cells U0 c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_ooc.xdc
  set_property processing_order EARLY [get_files c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_gen_2 -cells U0 c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/sources_1/ip/blk_mem_gen_2/blk_mem_gen_2_ooc.xdc
  set_property processing_order EARLY [get_files c:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/sources_1/ip/blk_mem_gen_2/blk_mem_gen_2_ooc.xdc]
  read_xdc C:/Users/John/Documents/GitHub/MQP/mqp_test/mqp_test.srcs/constrs_1/new/mqp.xdc
  link_design -top mqp_top -part xc7z020clg484-1
  write_hwdef -file mqp_top.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force mqp_top_opt.dcp
  report_drc -file mqp_top_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force mqp_top_placed.dcp
  report_io -file mqp_top_io_placed.rpt
  report_utilization -file mqp_top_utilization_placed.rpt -pb mqp_top_utilization_placed.pb
  report_control_sets -verbose -file mqp_top_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force mqp_top_routed.dcp
  report_drc -file mqp_top_drc_routed.rpt -pb mqp_top_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file mqp_top_timing_summary_routed.rpt -rpx mqp_top_timing_summary_routed.rpx
  report_power -file mqp_top_power_routed.rpt -pb mqp_top_power_summary_routed.pb -rpx mqp_top_power_routed.rpx
  report_route_status -file mqp_top_route_status.rpt -pb mqp_top_route_status.pb
  report_clock_utilization -file mqp_top_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force mqp_top.mmi }
  write_bitstream -force mqp_top.bit 
  catch { write_sysdef -hwdef mqp_top.hwdef -bitfile mqp_top.bit -meminfo mqp_top.mmi -file mqp_top.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

