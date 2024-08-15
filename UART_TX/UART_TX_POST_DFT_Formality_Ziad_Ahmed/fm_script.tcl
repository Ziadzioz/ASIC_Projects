
###################################################################
########################### Variables #############################
###################################################################

set SSLIB "/home/IC/Labs/Ass_DFT_1/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Labs/Ass_DFT_1/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Labs/Ass_DFT_1/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

###################################################################
############################ Guidance #############################
###################################################################

# Synopsys setup variable
set synopsys_auto_setup true
# Formality Setup File
set_svf -append { /home/IC/Labs/Ass_DFT_1/dft/UART_TX.svf }
###################################################################
###################### Reference Container ########################
###################################################################

# Read Reference Design Verilog Files
read_verilog -container r -libname WORK -05 { /home/IC/Labs/Ass_DFT_1/rtl/FSM.v }
read_verilog -container r -libname WORK -05 { /home/IC/Labs/Ass_DFT_1/rtl/UART_TOP.v }
read_verilog -container r -libname WORK -05 { /home/IC/Labs/Ass_DFT_1/rtl/MUX.v }
read_verilog -container r -libname WORK -05 { /home/IC/Labs/Ass_DFT_1/rtl/serializer.v }
read_verilog -container r -libname WORK -05 { /home/IC/Labs/Ass_DFT_1/rtl/parity_bit.v }
read_verilog -container r -libname WORK -05 { /home/IC/Labs/Ass_DFT_1/rtl/DFT_MUX.v }
# Read Reference technology libraries
read_db [list $SSLIB $TTLIB $FFLIB]

# set the top Reference Design 
set_top r:WORK/UART_TOP


###################################################################
#################### Implementation Container #####################
###################################################################

# Read Implementation Design Files
read_verilog -netlist -container i { /home/IC/Labs/Ass_DFT_3/dft/UART_TX.v }

# Read Implementation technology libraries
read_db [list $SSLIB $TTLIB $FFLIB]

# set the top Implementation Design
set_implementation_design UART_TOP
set_top UART_TOP


########################## Don't verify ###########################

# do not verify  scan out port a compare point as it is existed only after synthesis and not existed in the RTL

#scan_out
set_dont_verify_points -type port r:/WORK/*/*SO*
set_dont_verify_points -type port i:/WORK/*/*SO*


############################### contants #####################################

# all atpg enable (test_mode, scan_enable) are zero during formal compare

#test_mode
set_constant r:/WORK/*/*test_mode* 0
set_constant i:/WORK/*/*test_mode* 0

#scan_enable

set_constant r:/WORK/*/*SE* 0
set_constant i:/WORK/*/*SE* 0


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

