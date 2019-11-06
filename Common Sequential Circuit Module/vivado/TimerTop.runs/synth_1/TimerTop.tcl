# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a200tfbg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir G:/3160104699/lab7/vivado/TimerTop.cache/wt [current_project]
set_property parent.project_path G:/3160104699/lab7/vivado/TimerTop.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo g:/3160104699/lab7/vivado/TimerTop.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  G:/3160104699/lab7/src/counter_n.v
  G:/3160104699/lab7/src/dffre.v
  G:/3160104699/lab7/src/rsff.v
  G:/3160104699/lab7/src/timer.v
  G:/3160104699/lab7/src/TimerTop.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc G:/3160104699/lab7/src/TimerTop.xdc
set_property used_in_implementation false [get_files G:/3160104699/lab7/src/TimerTop.xdc]


synth_design -top TimerTop -part xc7a200tfbg484-1


write_checkpoint -force -noxdef TimerTop.dcp

catch { report_utilization -file TimerTop_utilization_synth.rpt -pb TimerTop_utilization_synth.pb }