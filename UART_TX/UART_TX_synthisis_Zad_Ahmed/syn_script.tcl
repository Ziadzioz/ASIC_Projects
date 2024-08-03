
########################### Define Top Module ############################
                                                   
set top_module UART_TOP

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

################## Design Compiler Library Files #setup ######################

lappend search_path /home/IC/Labs/Ass_Syn_2.0/std_cells
lappend search_path /home/IC/Labs/Ass_Syn_2.0/rtl

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

#echo "###############################################"
#echo "############# Reading RTL Files  ##############"
#echo "###############################################"
set file_format verilog

read_file -format $file_format UART_TOP.v
read_file -format $file_format MUX.v
read_file -format $file_format FSM.v
read_file -format $file_format parity_bit.v
read_file -format $file_format serializer.v


###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design

############################### Path groups ################################
puts "###############################################"
puts "################ Path groups ##################"
puts "###############################################"

group_path -name INREG -from [all_inputs]
group_path -name REGOUT -to [all_outputs]
group_path -name INOUT -from [all_inputs] -to [all_outputs]

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source -echo ./cons.tcl

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -map_effort high

#############################################################################
# Write out Design after initial compile
#############################################################################


write_file -format verilog -hierarchy -output UART_TX.v
write_file -format ddc -hierarchy -output UART_TX.ddc
write_sdc  -nosplit UART_TX.sdc
write_sdf           UART_TX.sdf

################# reporting #######################


report_area -hierarchy > area.rpt
report_power -hierarchy > power.rpt
report_timing -max_paths 100 -delay_type min > hold.rpt
report_timing -max_paths 100 -delay_type max > setup.rpt
report_clock -attributes > clocks.rpt
report_constraint -all_violators > constraints.rpt

################# starting graphical user interface #######################

#gui_start