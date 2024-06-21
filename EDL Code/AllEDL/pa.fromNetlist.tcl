
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name AllEDL -dir "C:/Users/Sachintha/Desktop/OUSL/2022/EEX5351 Digital Electronic Sys/LAB/Lab 02/Code/AllEDL/planAhead_run_1" -part xc3s700anfgg484-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Sachintha/Desktop/OUSL/2022/EEX5351 Digital Electronic Sys/LAB/Lab 02/Code/AllEDL/ELD_TEST.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Sachintha/Desktop/OUSL/2022/EEX5351 Digital Electronic Sys/LAB/Lab 02/Code/AllEDL} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "ELD_TEST.ucf" [current_fileset -constrset]
add_files [list {ELD_TEST.ucf}] -fileset [get_property constrset [current_run]]
link_design
