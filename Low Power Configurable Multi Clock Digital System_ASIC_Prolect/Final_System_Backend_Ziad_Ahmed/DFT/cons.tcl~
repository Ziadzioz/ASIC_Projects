
# Constraints
# ----------------------------------------------------------------------------
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load




####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 


# 1. Master Clock Definitions 

######## FOR REF_CLOCK
 
set CLK_PER 20
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1

  
        set CLK_NAME MASTER_CLK_1
		create_clock -name $CLK_NAME -period $CLK_PER -waveform "0 [expr $CLK_PER/2]" [get_ports REF_CLK]
		set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK_NAME]
		set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $CLK_NAME]
		
		
######## FOR UART_CLOCK
 
set CLK_PER 271.3
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1

		
	    set CLK_NAME MASTER_CLK_2
		create_clock -name $CLK_NAME -period $CLK_PER -waveform "0 [expr $CLK_PER/2]" [get_ports UART_CLK]
		set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK_NAME]
		set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $CLK_NAME]
		
		
		
		
		
# 2. Generated Clock Definitions
    
		create_generated_clock -master_clock MASTER_CLK_2 -source [get_ports UART_CLK] \
                       -name "UART_TX_CLK" [get_port CLK_DIV_TX/O_DIV_CLK] \
                       -divide_by 32
		set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks UART_TX_CLK]
		set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks UART_TX_CLK]
		
		
		create_generated_clock -master_clock MASTER_CLK_2 -source [get_ports UART_CLK] \
                       -name "UART_RX_CLK" [get_port CLK_DIV_RX/O_DIV_CLK] \
                       -divide_by 1
		set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks UART_RX_CLK]
		set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks UART_RX_CLK]			   
					  
		create_generated_clock -master_clock MASTER_CLK_1 -source [get_ports REF_CLK] \
                       -name "ALU_CLK" [get_port CLOCK_GATING/ALU_CLK] \
                       -divide_by 1
		set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks ALU_CLK]
		set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks ALU_CLK]

set CLK3_NAME SCAN_CLK
set CLK3_PER 100
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1


create_clock -name $CLK3_NAME -period $CLK3_PER -waveform "0 [expr $CLK3_PER/2]" [get_ports scan_clock]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK3_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks $CLK3_NAME]

			   
		
		

####################################################################################



####################################################################################
           #########################################################
                  #### Section 2 : Clocks Relationships ####
           #########################################################
####################################################################################

set_clock_groups -asynchronous -group [get_clocks "MASTER_CLK_1 ALU_CLK"] -group [get_clocks "MASTER_CLK_2 UART_TX_CLK UART_RX_CLK"]

####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################
set CLK_PER 271.3

set in_delay  [expr 0.2*$CLK_PER]

#Constrain Input Paths
set_input_delay $in_delay -clock UART_RX_CLK [get_ports [list RX_IN]]

#Constrain Output Paths
set CLK_PER 271.3
set out_delay [expr 0.2*$CLK_PER]
set_output_delay $out_delay -clock UART_TX_CLK [get_ports [list Tx_OUT Parity_error Stop_error]]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports [list REF_CLK UART_CLK RST RX_IN]]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################


set_load 0.1 [get_ports [list Tx_OUT Parity_error Stop_error]]


####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"


####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################

### set_wire_load_model -name tsmc13_wl30 -library  scmetro_tsmc_cl013g_rvt_ss_1p08v_125c

####################################################################################
           #########################################################
                  #### Section 8 : multicycle path ####
           #########################################################
####################################################################################

set_multicycle_path -setup 32 -from MASTER_CLK_2 -to UART_TX_CLK
set_multicycle_path -hold 31 -from MASTER_CLK_2 -to UART_TX_CLK


############ set_dont_touch_network [get_clocks {MASTER_CLK}]

set_case_analysis 1 [get_port test_mode]

