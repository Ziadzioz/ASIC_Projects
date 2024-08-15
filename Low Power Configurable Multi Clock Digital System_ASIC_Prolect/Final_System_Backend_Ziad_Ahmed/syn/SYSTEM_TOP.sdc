###################################################################

# Created by write_sdc on Thu Aug 15 20:34:20 2024

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports REF_CLK]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports UART_CLK]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports RST]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports RX_IN]
set_load -pin_load 0.1 [get_ports Tx_OUT]
set_load -pin_load 0.1 [get_ports Parity_error]
set_load -pin_load 0.1 [get_ports Stop_error]
create_clock [get_ports REF_CLK]  -name MASTER_CLK_1  -period 20  -waveform {0 10}
set_clock_uncertainty -setup 0.2  [get_clocks MASTER_CLK_1]
set_clock_uncertainty -hold 0.1  [get_clocks MASTER_CLK_1]
create_clock [get_ports UART_CLK]  -name MASTER_CLK_2  -period 271.3  -waveform {0 135.65}
set_clock_uncertainty -setup 0.2  [get_clocks MASTER_CLK_2]
set_clock_uncertainty -hold 0.1  [get_clocks MASTER_CLK_2]
create_generated_clock [get_pins CLK_DIV_TX/O_DIV_CLK]  -name UART_TX_CLK  -source [get_ports UART_CLK]  -master_clock MASTER_CLK_2  -divide_by 32  -add
set_clock_uncertainty -setup 0.2  [get_clocks UART_TX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_TX_CLK]
create_generated_clock [get_pins CLK_DIV_RX/O_DIV_CLK]  -name UART_RX_CLK  -source [get_ports UART_CLK]  -master_clock MASTER_CLK_2  -divide_by 1  -add
set_clock_uncertainty -setup 0.2  [get_clocks UART_RX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_RX_CLK]
create_generated_clock [get_pins CLOCK_GATING/ALU_CLK]  -name ALU_CLK  -source [get_ports REF_CLK]  -master_clock MASTER_CLK_1  -divide_by 1  -add
set_clock_uncertainty -setup 0.2  [get_clocks ALU_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks ALU_CLK]
group_path -name INOUT  -from [list [get_ports REF_CLK] [get_ports UART_CLK] [get_ports RST] [get_ports RX_IN]]  -to [list [get_ports Tx_OUT] [get_ports Parity_error] [get_ports Stop_error]]
group_path -name INREG  -from [list [get_ports REF_CLK] [get_ports UART_CLK] [get_ports RST] [get_ports RX_IN]]
group_path -name REGOUT  -to [list [get_ports Tx_OUT] [get_ports Parity_error] [get_ports Stop_error]]
set_multicycle_path 31 -hold -from [get_clocks MASTER_CLK_2] -to [get_clocks UART_TX_CLK]
set_multicycle_path 32 -setup -from [get_clocks MASTER_CLK_2] -to [get_clocks UART_TX_CLK]
set_input_delay -clock UART_RX_CLK  54.26  [get_ports RX_IN]
set_output_delay -clock UART_TX_CLK  54.26  [get_ports Tx_OUT]
set_output_delay -clock UART_TX_CLK  54.26  [get_ports Parity_error]
set_output_delay -clock UART_TX_CLK  54.26  [get_ports Stop_error]
set_clock_groups -asynchronous -name MASTER_CLK_1_1 -group [list [get_clocks MASTER_CLK_1] [get_clocks ALU_CLK]] -group [list [get_clocks MASTER_CLK_2] [get_clocks UART_TX_CLK] [get_clocks UART_RX_CLK]]
