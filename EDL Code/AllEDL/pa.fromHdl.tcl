
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name AllEDL -dir "C:/Users/Sachintha/Desktop/OUSL/2022/EEX5351 Digital Electronic Sys/LAB/Lab 02/Code/AllEDL/planAhead_run_2" -part xc3s700anfgg484-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "ELD_TEST.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {EDL.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top ELD_TEST $srcset
add_files [list {ELD_TEST.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s700anfgg484-4
