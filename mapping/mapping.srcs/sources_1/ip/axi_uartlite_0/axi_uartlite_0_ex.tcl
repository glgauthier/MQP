#-------------------------------------------------------------
# Generated Example Tcl script for IP 'axi_uartlite_0' (xilinx.com:ip:axi_uartlite:2.0)
#-------------------------------------------------------------

# Declare source IP directory
set srcIpDir "c:/Users/John/Documents/GitHub/MQP/mapping/mapping.srcs/sources_1/ip/axi_uartlite_0"

# Create project
create_project -name axi_uartlite_0_example -force
set_property part xc7z020clg484-1 [current_project]
set_property target_language verilog [current_project]
set_property simulator_language MIXED [current_project]
set_property coreContainer.enable false [current_project]
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
set returnCode 0

# Import the original IP (excluding example files)
import_ip -files [list [file join $srcIpDir axi_uartlite_0.xci]] -name axi_uartlite_0
reset_target {open_example} [get_ips axi_uartlite_0]

# Generate the IP
proc _filter_supported_targets {targets ip} {
  set res {}
  set all [get_property SUPPORTED_TARGETS $ip]
  foreach target $targets {
    lappend res {*}[lsearch -all -inline -nocase $all $target]
  }
  return $res
}
generate_target -quiet [_filter_supported_targets {instantiation_template synthesis simulation implementation shared_logic} [get_ips axi_uartlite_0]] [get_ips axi_uartlite_0]

# Add example synthesis HDL files
add_files -scan_for_includes -quiet -fileset [current_fileset] \
  [list [file join $srcIpDir axi_uartlite_0/example_design/clock_gen.vhd]] \
  [list [file join $srcIpDir axi_uartlite_0/example_design/axi_uartlite_0_exdes.vhd]]

# Add example miscellaneous synthesis files
add_files -quiet -fileset [current_fileset] \
  [list [file join $srcIpDir atg_addr.coe]] \
  [list [file join $srcIpDir atg_data.coe]] \
  [list [file join $srcIpDir atg_ctrl.coe]] \
  [list [file join $srcIpDir atg_mask.coe]]

# Add example XDC files
add_files -quiet -fileset [current_fileset -constrset] \
  [list [file join $srcIpDir axi_uartlite_0/example_design/axi_uartlite_0_exdes.xdc]]


# Add example simulation HDL files
if { [catch {current_fileset -simset} exc] } { create_fileset -simset sim_1 }
add_files -quiet -scan_for_includes -fileset [current_fileset -simset] \
  [list [file join $srcIpDir axi_uartlite_0/example_design/axi_uartlite_0_exdes_tb.vhd]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $srcIpDir axi_uartlite_0/example_design/axi_uartlite_0_exdes_tb.vhd]]]

# Import all files while preserving hierarchy
import_files

# Set top
set_property TOP [lindex [find_top] 0] [current_fileset]

# Source script extension file(s)
if {[catch {source [file join $srcIpDir top_set.tcl]} errMsg]} {
  puts "Error encountered while sourcing custom IP example design script."
  puts "$errorInfo"
  incr returnCode
}

# Update compile order
update_compile_order -fileset [current_fileset]
update_compile_order -fileset [current_fileset -simset]
set tops [list]
foreach tfile [ get_files -filter {name=~"*.xci" || name=~"*.bd"}] { if { [lsearch [list_property $tfile] PARENT_COMPOSITE_FILE ] == -1} {lappend tops $tfile} }
generate_target all $tops
export_ip_user_files -force

set dfile "c:/Users/John/Documents/GitHub/MQP/mapping/mapping.srcs/sources_1/ip/axi_uartlite_0/oepdone.txt"
if { [ catch { set doneFile [open $dfile w] } ] } {
} else { 
  puts $doneFile "Open Example Project DONE"
  close $doneFile
}
if { $returnCode != 0 } {
  error "Problems were encountered while executing the example design script, please review the log files."
}
