
###################################################################
########################### Variables #############################
###################################################################

set SSLIB "/home/IC/Projects/SYSTEM_PROJECT/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Projects/SYSTEM_PROJECT/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Projects/SYSTEM_PROJECT/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

###################################################################
############################ Guidance #############################
###################################################################

# Synopsys setup variable
set synopsys_auto_setup true
# Formality Setup File
set_svf -append { /home/IC/Projects/SYSTEM_PROJECT/syn/SYSTEM_TOP.svf }
###################################################################
###################### Reference Container ########################
###################################################################

# Read Reference Design Verilog Files
read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/CLK_DIV.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/CLOCK_GATING.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/Data_Sampling.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/DATA_SYNC.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/Deserializer.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/Stop_Check.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/UART_RX_TOP.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/DF_SYNC.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/FIFO_BUFFER.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/FIFO_RD.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/FIFO_TOP.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/FIFO_WR.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/FSM.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/FSM_TX.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/MUX.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/parity_bit.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/Start_Check.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/Parity_Check.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/PRESCALE_BLOCK.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/PULSE_GENRATOR_BLOCK.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/Reg_file.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/RESET_SYNC.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/serializer.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/SEYSTEM_CONTROL.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/ALU_RTL.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/Bit_counter.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/UART_TX_TOP.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/SYS_UART_TOP.v}

 read_verilog -container r -libname WORK -05 { /home/IC/Projects/SYSTEM_PROJECT/rtl/SYSTEM_TOP.v}


# Read Reference technology libraries
read_db [list $SSLIB $TTLIB $FFLIB]

# set the top Reference Design 
set_top r:WORK/SYSTEM_TOP


###################################################################
#################### Implementation Container #####################
###################################################################

# Read Implementation Design Files
read_verilog -netlist -container i { /home/IC/Projects/SYSTEM_PROJECT/syn/SYSTEM_TOP.v }

# Read Implementation technology libraries
read_db [list $SSLIB $TTLIB $FFLIB]

# set the top Implementation Design
set_implementation_design SYSTEM_TOP
set_top SYSTEM_TOP


########################## Don't verify ###########################

# do not verify  scan out port a compare point as it is existed only after synthesis and not existed in the RTL

#scan_out
#set_dont_verify_points -type port r:/WORK/*/*SO*
#set_dont_verify_points -type port i:/WORK/*/*SO*


############################### contants #####################################

# all atpg enable (test_mode, scan_enable) are zero during formal compare

#test_mode
#set_constant r:/WORK/*/*test_mode* 0
#set_constant i:/WORK/*/*test_mode* 0

#scan_enable

##set_constant r:/WORK/*/*SE* 0
#set_constant i:/WORK/*/*SE* 0


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

