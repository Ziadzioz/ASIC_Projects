###################################################################

# Created by write_sdc on Fri Aug 2 02:34:42 2024

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports CLK]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports RST]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports party_en]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports data_valid]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports party_typ]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {P_DATA[7]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {P_DATA[6]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {P_DATA[5]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {P_DATA[4]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {P_DATA[3]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {P_DATA[2]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {P_DATA[1]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {P_DATA[0]}]
set_load -pin_load 0.5 [get_ports busy]
set_load -pin_load 0.5 [get_ports Tx_OUT]
create_clock [get_ports CLK]  -name MASTER_CLK  -period 8680.56  -waveform {0 4340.28}
set_clock_latency 0  [get_clocks MASTER_CLK]
set_clock_uncertainty -setup 0.25  [get_clocks MASTER_CLK]
set_clock_uncertainty -hold 0.05  [get_clocks MASTER_CLK]
set_clock_transition -min -fall 0.1 [get_clocks MASTER_CLK]
set_clock_transition -max -fall 0.1 [get_clocks MASTER_CLK]
set_clock_transition -min -rise 0.1 [get_clocks MASTER_CLK]
set_clock_transition -max -rise 0.1 [get_clocks MASTER_CLK]
group_path -name INOUT  -from [list [get_ports CLK] [get_ports RST] [get_ports party_en] [get_ports data_valid] [get_ports party_typ] [get_ports SI] [get_ports test_mode] [get_ports SE] [get_ports scan_clk] [get_ports scan_rst] [get_ports {P_DATA[7]}] [get_ports {P_DATA[6]}] [get_ports {P_DATA[5]}] [get_ports {P_DATA[4]}] [get_ports {P_DATA[3]}] [get_ports {P_DATA[2]}] [get_ports {P_DATA[1]}] [get_ports {P_DATA[0]}]]  -to [list [get_ports busy] [get_ports Tx_OUT] [get_ports SO]]
group_path -name INREG  -from [list [get_ports CLK] [get_ports RST] [get_ports party_en] [get_ports data_valid] [get_ports party_typ] [get_ports SI] [get_ports test_mode] [get_ports SE] [get_ports scan_clk] [get_ports scan_rst] [get_ports {P_DATA[7]}] [get_ports {P_DATA[6]}] [get_ports {P_DATA[5]}] [get_ports {P_DATA[4]}] [get_ports {P_DATA[3]}] [get_ports {P_DATA[2]}] [get_ports {P_DATA[1]}] [get_ports {P_DATA[0]}]]
group_path -name REGOUT  -to [list [get_ports busy] [get_ports Tx_OUT] [get_ports SO]]
set_input_delay -clock MASTER_CLK  2604.17  [get_ports party_en]
set_input_delay -clock MASTER_CLK  2604.17  [get_ports data_valid]
set_input_delay -clock MASTER_CLK  2604.17  [get_ports party_typ]
set_input_delay -clock MASTER_CLK  2604.17  [get_ports {P_DATA[7]}]
set_input_delay -clock MASTER_CLK  2604.17  [get_ports {P_DATA[6]}]
set_input_delay -clock MASTER_CLK  2604.17  [get_ports {P_DATA[5]}]
set_input_delay -clock MASTER_CLK  2604.17  [get_ports {P_DATA[4]}]
set_input_delay -clock MASTER_CLK  2604.17  [get_ports {P_DATA[3]}]
set_input_delay -clock MASTER_CLK  2604.17  [get_ports {P_DATA[2]}]
set_input_delay -clock MASTER_CLK  2604.17  [get_ports {P_DATA[1]}]
set_input_delay -clock MASTER_CLK  2604.17  [get_ports {P_DATA[0]}]
set_output_delay -clock MASTER_CLK  2604.17  [get_ports busy]
set_output_delay -clock MASTER_CLK  2604.17  [get_ports Tx_OUT]
