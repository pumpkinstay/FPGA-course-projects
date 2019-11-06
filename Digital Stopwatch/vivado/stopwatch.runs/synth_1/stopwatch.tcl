# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir G:/Lab12/vivado/stopwatch.cache/wt [current_project]
set_property parent.project_path G:/Lab12/vivado/stopwatch.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo g:/Lab12/vivado/stopwatch.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  G:/Lab12/src/timer/BCD_60.v
  G:/Lab12/src/button_pro/button_pro.v
  G:/Lab12/src/control/control.v
  G:/Lab12/src/button_pro/control_button.v
  G:/Lab12/src/button_pro/counter_n.v
  G:/Lab12/src/button_pro/debouncer.v
  G:/Lab12/src/button_pro/dffre.v
  G:/Lab12/src/button_pro/pulse_trans.v
  G:/Lab12/src/display/seg7_display.v
  G:/Lab12/src/button_pro/synchronizer.v
  G:/Lab12/src/button_pro/timer.v
  G:/Lab12/src/timer/timing.v
  G:/Lab12/src/stopwatch.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc G:/Lab12/src/stopwatch.xdc
set_property used_in_implementation false [get_files G:/Lab12/src/stopwatch.xdc]


synth_design -top stopwatch -part xc7a35tcpg236-1


write_checkpoint -force -noxdef stopwatch.dcp

catch { report_utilization -file stopwatch_utilization_synth.rpt -pb stopwatch_utilization_synth.pb }
