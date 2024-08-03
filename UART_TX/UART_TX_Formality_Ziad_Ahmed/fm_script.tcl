
###################################################################
########################### Variables #############################
###################################################################

set SSLIB "/home/IC/Labs/Ass_Syn_2.0/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Labs/Ass_Syn_2.0/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Labs/Ass_Syn_2.0/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

###################################################################
############################ Guidance #############################
###################################################################

# Synopsys setup variable
set synopsys_auto_setup true
# Formality Setup File
set_svf -append { /home/IC/Labs/Ass_Syn_2.0/syn/UART_RX.svf }
###################################################################
###################### Reference Container ########################
###################################################################

# Read Reference Design Verilog Files
read_verilog -container r -libname WORK -05 { /home/IC/Labs/Ass_Syn_2.0/rtl/FSM.v }
read_verilog -container r -libname WORK -05 { /home/IC/Labs/Ass_Syn_2.0/rtl/UART_TOP.v }
read_verilog -container r -libname WORK -05 { /home/IC/Labs/Ass_Syn_2.0/rtl/MUX.v }
read_verilog -container r -libname WORK -05 { /home/IC/Labs/Ass_Syn_2.0/rtl/serializer.v }
read_verilog -container r -libname WORK -05 { /home/IC/Labs/Ass_Syn_2.0/rtl/parity_bit.v }

# Read Reference technology libraries
read_db [list $SSLIB $TTLIB $FFLIB]

# set the top Reference Design 
set_top r:WORK/UART_TOP


###################################################################
#################### Implementation Container #####################
###################################################################

# Read Implementation Design Files
read_verilog -container i -libname WORK -05 { /home/IC/Labs/Ass_Syn_2.0/rtl/FSM.v }
read_verilog -container i -libname WORK -05 { /home/IC/Labs/Ass_Syn_2.0/rtl/UART_TOP.v }
read_verilog -container i -libname WORK -05 { /home/IC/Labs/Ass_Syn_2.0/rtl/MUX.v }
read_verilog -container i -libname WORK -05 { /home/IC/Labs/Ass_Syn_2.0/rtl/serializer.v }
read_verilog -container i -libname WORK -05 { /home/IC/Labs/Ass_Syn_2.0/rtl/parity_bit.v }

# Read Implementation technology libraries
read_db [list $SSLIB $TTLIB $FFLIB]

# set the top Implementation Design
set_top i:WORK/UART_TOP


###################### Matching Compare points ####################

match

######################### Run Verification ########################

set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

########################### Reporting ############################# 
report_passing_points > "passing_points.rpt"
report_failing_points > "failing_points.rpt"
report_aborted_points > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"


start_gui

