current_design rcc_top

#==============================================================================
# CLK-External
#============================================================================== 
create_clock -name hclk           [get_ports hclk]            -period 5      -waveform {0 2.5}  #200 MHz
create_clock -name hsi_origin_clk [get_ports hsi_origin_clk]  -period 15.625 -waveform {0 7.3125}  # 64 MHz
create_clock -name hsi48_clk      [get_ports hsi48_clk]       -period 20.83  -waveform {0 10.415}  # 48 MHz
create_clock -name hse_origin_clk [get_ports hse_origin_clk]  -period 20.83  -waveform {0 10.415}  # 48 MHz
create_clock -name csi_origin_clk [get_ports csi_origin_clk]  -period 250    -waveform {0 125}  # 4 MHz
create_clock -name lsi_clk        [get_ports lsi_clk]         -period 31250  -waveform {0 15625}  # 32KHz
create_clock -name lse_clk        [get_ports lse_clk]         -period 31250  -waveform {0 15625}  # 32KHz
create_clock -name pll1_p_clk     [get_ports pll1_p_clk]      -period 1.25   -waveform {0 0.625}  #800 MHz
create_clock -name pll1_q_clk     [get_ports pll1_q_clk]      -period 1.25   -waveform {0 0.625}  #800 MHz
create_clock -name pll2_p_clk     [get_ports pll2_p_clk]      -period 1.25   -waveform {0 0.625}  #800 MHz
create_clock -name pll2_q_clk     [get_ports pll2_q_clk]      -period 1.25   -waveform {0 0.625}  #800 MHz
create_clock -name pll2_r_clk     [get_ports pll2_r_clk]      -period 1.25   -waveform {0 0.625}  #800 MHz
create_clock -name pll3_p_clk     [get_ports pll3_p_clk]      -period 1.25   -waveform {0 0.625}  #800 MHz
create_clock -name pll3_q_clk     [get_ports pll3_q_clk]      -period 1.25   -waveform {0 0.625}  #800 MHz
create_clock -name pll3_r_clk     [get_ports pll3_r_clk]      -period 1.25   -waveform {0 0.625}  #800 MHz

create_clock -name pad_rcc_eth_mii_rx_clk [get_ports pad_rcc_eth_mii_rx_clk]  -period 41.66 -waveform {0 20.83} # 200 MHz MAX
create_clock -name pad_rcc_eth_mii_tx_clk [get_ports pad_rcc_eth_mii_tx_clk]  -period 41.66 -waveform {0 20.83} # 200 MHz MAX

create_clock -name I2S_clk_IN [get_ports I2S_clk_IN]  -period 100   -waveform {0 50}  # 10 MHz
create_clock -name USB_PHY1   [get_ports USB_PHY1]    -period 20.83 -waveform {0 10.415}  # 48 MHz

#==============================================================================
# CLK-Internal
#============================================================================== 
#generated_clock -name <clk-obj-name> -source <source-obj-name> -tag <tag-name> -divide_by <divide-factor> -multiply_by <mult-factor> -master_clock <source-clock-tag-name>
create_generated_clock -name hsi_clk -source [get_ports hsi_origin_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.hsi_clk] -master_clock hsi_origin_clk 
create_generated_clock -name hsi_ker_clk -source [get_ports hsi_origin_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.hsi_ker_clk] -master_clock hsi_origin_clk  # 64 MHz
create_generated_clock -name csi_clk -source [get_ports csi_origin_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.csi_clk] -master_clock csi_origin_clk  # 4 MHz
create_generated_clock -name csi_ker_clk -source [get_ports csi_origin_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.csi_ker_clk] -master_clock csi_origin_clk  # 4 MHz
create_generated_clock -name hse_clk -source [get_ports hse_origin_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.hse_clk] -master_clock hse_origin_clk  # 48 MHz
create_generated_clock -name hsi_per_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.hsi_ker_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.per_clk] -master_clock hsi_ker_clk -add# 64 MHz MAX
create_generated_clock -name csi_per_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.csi_ker_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.per_clk] -master_clock csi_ker_clk -add# 64 MHz MAX
create_generated_clock -name hse_per_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.hse_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.per_clk] -master_clock hse_clk -add# 64 MHz MAX
create_generated_clock -name hse_rtc_clk -source [get_ports hse_origin_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.hse_rtc_clk] -divide_by 2 -master_clock hse_origin_clk # 24 MHz MAX
create_generated_clock -name csi_ker_clk_122_div -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.csi_ker_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_per_clk_rst_control.csi_ker_clk_122_div] -divide_by 122 -master_clock csi_ker_clk  # 4/122 MHz


#==============================================================================
# SYS CLK FROM DIFFERENT SOURCES
#============================================================================== 
# clock -name "rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.pre_sys_clk" -period 1.25 -edge {0 0.625} -domain "pre_sys_clk"  # 800 MHz MAX
create_generated_clock -name hsi_pre_sys_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.hsi_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.pre_sys_clk] -master_clock hsi_clk -add
create_generated_clock -name csi_pre_sys_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.csi_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.pre_sys_clk] -master_clock csi_clk -add
create_generated_clock -name hse_pre_sys_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.hse_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.pre_sys_clk] -master_clock hse_clk -add
create_generated_clock -name pll1_pre_sys_clk -source [get_ports pll1_p_clk]                                                               [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.pre_sys_clk] -master_clock pll1_p_clk -add

create_generated_clock -name hsi_sys_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.pre_sys_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_clk] -master_clock hsi_pre_sys_clk    -add # 800 MHz MAX
create_generated_clock -name hsi_sys_d1cpre_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_d1cpre_clk] -master_clock hsi_sys_clk        -add # 400 MHz MA -add X
create_generated_clock -name hsi_rcc_c1_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_d1cpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_c1_clk] -master_clock hsi_sys_d1cpre_clk -add  # 400 MHz MAX -add 
create_generated_clock -name hsi_sys_hpre_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_d1cpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] -master_clock hsi_sys_d1cpre_clk -add  # 200 MHz MAX -add 
create_generated_clock -name hsi_rcc_d1_bus_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_d1_bus_clk] -master_clock hsi_sys_hpre_clk   -add  # 200 MHz MA -add X
create_generated_clock -name hsi_rcc_c2_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_c2_clk] -master_clock hsi_sys_hpre_clk   -add  # 200 MHz MAX -add 
create_generated_clock -name hsi_rcc_d2_bus_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_d2_bus_clk] -master_clock hsi_sys_hpre_clk   -add  # 200 MHz MAX
create_generated_clock -name hsi_rcc_d3_bus_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_d3_bus_clk] -master_clock hsi_sys_hpre_clk   -add  # 200 MHz MAX

create_generated_clock -name csi_sys_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.pre_sys_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_clk] -master_clock csi_pre_sys_clk    -add # 800 MHz MAX
create_generated_clock -name csi_sys_d1cpre_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_d1cpre_clk] -master_clock csi_sys_clk        -add # 400 MHz MA -add X
create_generated_clock -name csi_rcc_c1_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_d1cpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_c1_clk] -master_clock csi_sys_d1cpre_clk -add  # 400 MHz MAX -add 
create_generated_clock -name csi_sys_hpre_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_d1cpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] -master_clock csi_sys_d1cpre_clk -add  # 200 MHz MAX -add 
create_generated_clock -name csi_rcc_d1_bus_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_d1_bus_clk] -master_clock csi_sys_hpre_clk   -add  # 200 MHz MA -add X
create_generated_clock -name csi_rcc_c2_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_c2_clk] -master_clock csi_sys_hpre_clk   -add  # 200 MHz MAX -add 
create_generated_clock -name csi_rcc_d2_bus_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_d2_bus_clk] -master_clock csi_sys_hpre_clk   -add  # 200 MHz MAX
create_generated_clock -name csi_rcc_d3_bus_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_d3_bus_clk] -master_clock csi_sys_hpre_clk   -add  # 200 MHz MAX

create_generated_clock -name hse_sys_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.pre_sys_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_clk] -master_clock hse_pre_sys_clk    -add # 800 MHz MAX
create_generated_clock -name hse_sys_d1cpre_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_d1cpre_clk] -master_clock hse_sys_clk        -add # 400 MHz MA -add X
create_generated_clock -name hse_rcc_c1_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_d1cpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_c1_clk] -master_clock hse_sys_d1cpre_clk -add  # 400 MHz MAX -add 
create_generated_clock -name hse_sys_hpre_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_d1cpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] -master_clock hse_sys_d1cpre_clk -add  # 200 MHz MAX -add 
create_generated_clock -name hse_rcc_d1_bus_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_d1_bus_clk] -master_clock hse_sys_hpre_clk   -add  # 200 MHz MA -add X
create_generated_clock -name hse_rcc_c2_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_c2_clk] -master_clock hse_sys_hpre_clk   -add  # 200 MHz MAX -add 
create_generated_clock -name hse_rcc_d2_bus_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_d2_bus_clk] -master_clock hse_sys_hpre_clk   -add  # 200 MHz MAX
create_generated_clock -name hse_rcc_d3_bus_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_d3_bus_clk] -master_clock hse_sys_hpre_clk   -add  # 200 MHz MAX

create_generated_clock -name pll1_sys_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.pre_sys_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_clk] -master_clock pll1_pre_sys_clk    -add # 800 MHz MAX
create_generated_clock -name pll1_sys_d1cpre_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_d1cpre_clk] -master_clock pll1_sys_clk        -add # 400 MHz MA -add X
create_generated_clock -name pll1_rcc_c1_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_d1cpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_c1_clk] -master_clock pll1_sys_d1cpre_clk -add  # 400 MHz MAX -add 
create_generated_clock -name pll1_sys_hpre_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_d1cpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] -master_clock pll1_sys_d1cpre_clk -add  # 200 MHz MAX -add 
create_generated_clock -name pll1_rcc_d1_bus_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_d1_bus_clk] -master_clock pll1_sys_hpre_clk   -add  # 200 MHz MA -add X
create_generated_clock -name pll1_rcc_c2_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_c2_clk] -master_clock pll1_sys_hpre_clk   -add  # 200 MHz MAX -add 
create_generated_clock -name pll1_rcc_d2_bus_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_d2_bus_clk] -master_clock pll1_sys_hpre_clk   -add  # 200 MHz MAX
create_generated_clock -name pll1_rcc_d3_bus_clk -source [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.sys_hpre_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.u_rcc_sys_clk_gen.rcc_d3_bus_clk] -master_clock pll1_sys_hpre_clk   -add  # 200 MHz MAX


#eth clock
create_generated_clock -name eth_mii_rx_clk_divided -source [get_ports pad_rcc_eth_mii_rx_clk] [get_pins rcc_top.u_rcc_vcore_top.u_rcc_eth_ker_clk_ctrl.pad_rcc_eth_mii_rx_clk_divided] -divide_by 2 -master_clock eth_mii_rx_clk# 100 MHz MAX
#ahb clock
create_generated_clock -name rcc_bdcr_byte0_wren -source [get_ports hclk] [get_pins rcc_top.u_rcc_vsw_top.rcc_bdcr_byte0_wren] -master_clock hclk   #200 MHz
create_generated_clock -name rcc_bdcr_byte1_wren -source [get_ports hclk] [get_pins rcc_top.u_rcc_vsw_top.rcc_bdcr_byte1_wren] -master_clock hclk   #200 MHz
create_generated_clock -name rcc_bdcr_byte2_wren -source [get_ports hclk] [get_pins rcc_top.u_rcc_vsw_top.rcc_bdcr_byte2_wren] -master_clock hclk   #200 MHz
create_generated_clock -name rcc_c1_rsr_rmvf_wren -source [get_ports hclk] [get_pins rcc_top.u_rcc_vdd_top.rcc_c1_rsr_rmvf_wren] -master_clock hclk  #200 MHz
create_generated_clock -name rcc_c2_rsr_rmvf_wren -source [get_ports hclk] [get_pins rcc_top.u_rcc_vdd_top.rcc_c2_rsr_rmvf_wren] -master_clock hclk  #200 MHz
create_generated_clock -name rcc_csr_lsion_wren -source [get_ports hclk] [get_pins rcc_top.u_rcc_vdd_top.rcc_csr_lsion_wren] -master_clock hclk    #200 MHz


#==============================================================================
# RST-External
#============================================================================== 
reset -async -name "hresetn" -value 0
reset -async -name "pwr_por_rst" -value 1
#reset -async -name "nrst_in" -value 1

#==============================================================================
# RST-Internal
#============================================================================== 
reset -async -name "rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.sys_rst_n" -value 0
reset -async -name "rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.sys_sync_rst_n" -value 0
reset -async -name "rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.d1_rst_n" -value 0
reset -async -name "rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.d1_sync_rst_n" -value 0
reset -async -name "rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.d2_rst_n" -value 0
reset -async -name "rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.d2_sync_rst_n" -value 0
# reset -async -name "rcc_top.u_rcc_vcore_top.u_rcc_sys_clk_rst_ctrl.sync_vsw_rst_n" -value 0
# reset -async -name "rcc_top.u_rcc_vdd_top.u_rcc_vdd_reg.rst_n" -value 0

#==============================================================================
# IO
#==============================================================================

