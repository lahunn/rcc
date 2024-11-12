current_design rcc_top
#==============================================================================
# CLK-External
#==============================================================================
create_clock -name hsi_origin_clk [get_ports hsi_origin_clk]  -period 15.625 -waveform {0 7.3125}
create_clock -name hsi48_clk      [get_ports hsi48_clk]       -period 20.83  -waveform {0 10.415}
create_clock -name hse_origin_clk [get_ports hse_origin_clk]  -period 20.83  -waveform {0 10.415}
create_clock -name csi_origin_clk [get_ports csi_origin_clk]  -period 250    -waveform {0 125}
create_clock -name lsi_clk        [get_ports lsi_clk]         -period 31250  -waveform {0 15625}
create_clock -name lse_clk        [get_ports lse_clk]         -period 31250  -waveform {0 15625}
create_clock -name pll1_p_clk     [get_ports pll1_p_clk]      -period 1.25   -waveform {0 0.625}
create_clock -name pll1_q_clk     [get_ports pll1_q_clk]      -period 1.25   -waveform {0 0.625}
create_clock -name pll2_p_clk     [get_ports pll2_p_clk]      -period 1.25   -waveform {0 0.625}
create_clock -name pll2_q_clk     [get_ports pll2_q_clk]      -period 1.25   -waveform {0 0.625}
create_clock -name pll2_r_clk     [get_ports pll2_r_clk]      -period 1.25   -waveform {0 0.625}
create_clock -name pll3_p_clk     [get_ports pll3_p_clk]      -period 1.25   -waveform {0 0.625}
create_clock -name pll3_q_clk     [get_ports pll3_q_clk]      -period 1.25   -waveform {0 0.625}
create_clock -name pll3_r_clk     [get_ports pll3_r_clk]      -period 1.25   -waveform {0 0.625}
create_clock -name eth_mii_rx_clk [get_ports pad_rcc_eth_mii_rx_clk]  -period 100 -waveform {0 50}
create_clock -name eth_mii_tx_clk [get_ports pad_rcc_eth_mii_tx_clk]  -period 100 -waveform {0 50}

create_clock -name I2S_clk_IN [get_ports I2S_clk_IN]  -period 100   -waveform {0 50}
create_clock -name USB_PHY1   [get_ports USB_PHY1]    -period 20.83 -waveform {0 10.415}

#==============================================================================
# CLK-Internal
#==============================================================================
#generated_clock -name <clk-obj-name> -source <source-obj-name> -tag <tag-name> -divide_by <divide-factor> -multiply_by <mult-factor> -master_clock <source-clock-tag-name>
create_generated_clock -name hsi_clk -source             [get_ports hsi_origin_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_hsi_clk_gating/gen_clk]                                         -combinational -master_clock hsi_origin_clk    -add
create_generated_clock -name hsi_ker_clk -source         [get_ports hsi_origin_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/hsi_ker_clk]                                                  -combinational -master_clock hsi_origin_clk    -add
create_generated_clock -name csi_clk -source             [get_ports csi_origin_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_csi_clk_gating/gen_clk]                                         -combinational -master_clock csi_origin_clk    -add
create_generated_clock -name csi_ker_clk -source         [get_ports csi_origin_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/csi_ker_clk]                                                  -combinational -master_clock csi_origin_clk    -add
create_generated_clock -name hse_clk -source             [get_ports hse_origin_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/hse_clk]                                                      -combinational -master_clock hse_origin_clk    -add
create_generated_clock -name csi_ker_clk_122_div -source [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/csi_ker_clk] [get_pins u_rcc_vcore_top/u_rcc_per_clk_rst_control/csi_ker_clk_122_divider/o_clk]    -divide_by 122 -master_clock csi_ker_clk       -add


#==============================================================================
# SYS CLK FROM DIFFERENT SOURCES
#==============================================================================
# clock -name "u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/pre_sys_clk" -period 1.25 -edge {0 0.625} -domain "pre_sys_clk"
create_generated_clock -name hsi_sys_clk         -source [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_hsi_clk_gating/gen_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_sys_clk_switch/i_clk[0]]          -combinational
create_generated_clock -name csi_sys_clk         -source [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_csi_clk_gating/gen_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_sys_clk_switch/i_clk[1]]          -combinational
create_generated_clock -name hse_sys_clk         -source [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/hse_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_sys_clk_switch/i_clk[2]]                  -combinational
create_generated_clock -name pll1_p_sys_clk      -source [get_ports pll1_p_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_sys_clk_switch/i_clk[3]]               -combinational

# create_generated_clock -name pre_sys_clk         -source [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_sys_clk_switch/o_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/pre_sys_clk]          -combinational
create_generated_clock -name sys_clk         -source [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/pre_sys_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/sys_clk]                                    -combinational
create_generated_clock -name sys_d1cpre_clk  -source [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/sys_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_sys_d1cpre_clk_divider/o_clk]                 -divide_by 1         -master_clock sys_clk         -add
create_generated_clock -name rcc_c1_clk      -source [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_sys_d1cpre_clk_divider/o_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/rcc_c1_clk]              -combinational       -master_clock sys_d1cpre_clk  -add
create_generated_clock -name sys_hpre_clk    -source [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_sys_d1cpre_clk_divider/o_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/sys_hpre_clk_divider/o_clk]   -divide_by 1    -master_clock sys_d1cpre_clk  -add
create_generated_clock -name rcc_d1_bus_clk  -source [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/sys_hpre_clk_divider/o_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_d1_bus_clk_gating/gen_clk] -combinational       -master_clock sys_hpre_clk    -add
create_generated_clock -name rcc_c2_clk      -source [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/sys_hpre_clk_divider/o_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/rcc_c2_clk]                  -combinational       -master_clock sys_hpre_clk    -add
create_generated_clock -name rcc_d2_bus_clk  -source [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/sys_hpre_clk_divider/o_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_d2_bus_clk_gating/gen_clk] -combinational       -master_clock sys_hpre_clk    -add
create_generated_clock -name rcc_d3_bus_clk  -source [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/sys_hpre_clk_divider/o_clk] [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_d3_bus_clk_gating/gen_clk] -combinational       -master_clock sys_hpre_clk    -add

#eth clock
create_generated_clock -name eth_mii_rx_clk_divided -source [get_ports pad_rcc_eth_mii_rx_clk] [get_nets u_rcc_vcore_top/u_rcc_eth_ker_clk_ctrl/pad_rcc_eth_mii_rx_clk_divided] -divide_by 2 -master_clock eth_mii_rx_clk -add
#ahb clock
create_generated_clock -name rcc_hclk                   -source [get_pins u_rcc_vcore_top/u_rcc_sys_clk_rst_ctrl/u_d3_bus_clk_gating/gen_clk] [get_pins u_rcc_vcore_top/u_rcc_per_clk_rst_control/rcc_rcc_hclk] -combinational -master_clock rcc_d3_bus_clk    -add

create_generated_clock -name rcc_bdcr_byte0_wren    -source [get_pins u_rcc_vcore_top/u_rcc_per_clk_rst_control/rcc_rcc_hclk] [get_pins u_rcc_vsw_top/rcc_bdcr_byte0_wren]  -combinational -master_clock rcc_hclk    -add
create_generated_clock -name rcc_bdcr_byte1_wren    -source [get_pins u_rcc_vcore_top/u_rcc_per_clk_rst_control/rcc_rcc_hclk] [get_pins u_rcc_vsw_top/rcc_bdcr_byte1_wren]  -combinational -master_clock rcc_hclk    -add
create_generated_clock -name rcc_bdcr_byte2_wren    -source [get_pins u_rcc_vcore_top/u_rcc_per_clk_rst_control/rcc_rcc_hclk] [get_pins u_rcc_vsw_top/rcc_bdcr_byte2_wren]  -combinational -master_clock rcc_hclk    -add
create_generated_clock -name rcc_c1_rsr_rmvf_wren   -source [get_pins u_rcc_vcore_top/u_rcc_per_clk_rst_control/rcc_rcc_hclk] [get_pins u_rcc_vdd_top/rcc_c1_rsr_rmvf_wren] -combinational -master_clock rcc_hclk    -add
create_generated_clock -name rcc_c2_rsr_rmvf_wren   -source [get_pins u_rcc_vcore_top/u_rcc_per_clk_rst_control/rcc_rcc_hclk] [get_pins u_rcc_vdd_top/rcc_c2_rsr_rmvf_wren] -combinational -master_clock rcc_hclk    -add
create_generated_clock -name rcc_csr_lsion_wren     -source [get_pins u_rcc_vcore_top/u_rcc_per_clk_rst_control/rcc_rcc_hclk] [get_pins u_rcc_vdd_top/rcc_csr_lsion_wren]   -combinational -master_clock rcc_hclk    -add


#==============================================================================
# SET CLOCK GROUPS
#==============================================================================
set_clock_groups -name total_group -asynchronous -group [get_clocks {hsi_sys_clk csi_sys_clk hse_sys_clk pll1_p_sys_clk sys_clk sys_d1cpre_clk rcc_c1_clk sys_hpre_clk rcc_d1_bus_clk rcc_c2_clk rcc_d2_bus_clk rcc_d3_bus_clk rcc_hclk rcc_bdcr_byte0_wren rcc_bdcr_byte1_wren rcc_bdcr_byte2_wren rcc_c1_rsr_rmvf_wren rcc_c2_rsr_rmvf_wren rcc_csr_lsion_wren}] \
  -group [get_clocks {hsi_origin_clk hsi_clk hsi_ker_clk}] \
  -group [get_clocks {csi_origin_clk csi_clk csi_ker_clk csi_ker_clk_122_div}] \
  -group [get_clocks {hse_origin_clk hse_clk}] \
  -group [get_clocks {pll1_p_clk}] \
  -group [get_clocks {lsi_clk}] \
  -group [get_clocks {lse_clk}] \
  -group [get_clocks {pll2_p_clk}] \
  -group [get_clocks {pll3_p_clk}] \
  -group [get_clocks {pll1_q_clk}] \
  -group [get_clocks {pll2_q_clk}] \
  -group [get_clocks {pll3_q_clk}] \
  -group [get_clocks {pll2_r_clk}] \
  -group [get_clocks {pll3_r_clk}] \
  -group [get_clocks {hsi48_clk}] \
  -group [get_clocks {eth_mii_rx_clk eth_mii_rx_clk_divided}] \
  -group [get_clocks {eth_mii_tx_clk}] \
  -group [get_clocks {I2S_clk_IN}] \
  -group [get_clocks {USB_PHY1}]

set_clock_groups -name sys_clk_group -logically_exclusive -group [get_clocks {hsi_clk}] \
  -group [get_clocks {csi_clk}] \
  -group [get_clocks {hse_clk}] \
  -group [get_clocks {pll1_p_clk}]

set_clock_groups -name per_clk_group -logically_exclusive -group [get_clocks {hsi_ker_clk}] \
  -group [get_clocks {csi_ker_clk}] \
  -group [get_clocks {hse_clk}]

set_clock_groups -name mco1_clk_group -logically_exclusive -group [get_clocks {hsi48_clk}] \
  -group [get_clocks {pll1_q_clk}] \
  -group [get_clocks {hse_clk}] \
  -group [get_clocks {lse_clk}] \
  -group [get_clocks {hsi_clk}]

set_clock_groups -name mco2_clk_group -logically_exclusive -group [get_clocks {lsi_clk}] \
  -group [get_clocks {csi_clk}] \
  -group [get_clocks {pll1_p_clk}] \
  -group [get_clocks {hse_clk}] \
  -group [get_clocks {pll2_p_clk}]

#==============================================================================
# sys clock mux
#==============================================================================
# set_case_analysis -name "rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.mco1_clk_switch_cell.sel[2:0]" -value "{h 0}{h 1}{h 2}{h 3}{h 4}"
# set_case_analysis -name "rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.mco2_clk_switch_cell.sel[2:0]" -value "{h 0}{h 1}{h 2}{h 3}{h 4}{h 5}"
