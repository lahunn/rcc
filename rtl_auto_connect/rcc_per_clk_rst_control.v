// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : RCC peripherals clock and reset control
// ****************************************************************

// spyglass disable_block W240
// regret not read input bug
// spyglass disable_block W287b
// neglect not used output bug
module rcc_per_clk_rst_control #(
    parameter CLK_ON_AFTER_PER_RST_RELEASE = 8
) (
    //================================================================
    // test mode signals
    //================================================================
    input  testmode,
    input  test_rst_n,
    // system reset
    input  sys_rst_n,
    input  rcc_arcg_on,
    input  pll1_q_sync_sys_rst_n,
    input  pll2_p_sync_sys_rst_n,
    input  pll2_q_sync_sys_rst_n,
    input  pll2_r_sync_sys_rst_n,
    input  pll3_p_sync_sys_rst_n,
    input  pll3_q_sync_sys_rst_n,
    input  pll3_r_sync_sys_rst_n,
    input  hse_sync_sys_rst_n,
    input  hsi_ker_sync_sys_rst_n,
    input  csi_ker_sync_sys_rst_n,
    input  hsi48_sync_sys_rst_n,
    input  lse_sync_sys_rst_n,
    input  lsi_sync_sys_rst_n,
    input  per_sync_sys_rst_n,
    input  i2s_clk_in_sync_sys_rst_n,
    // peripheral allocate signals
    output c2_per_alloc_d1,
    output c1_per_alloc_d2,
    output c1_per_alloc_apb1,
    output c2_per_alloc_apb1,
    output c1_per_alloc_apb2,
    output c2_per_alloc_apb2,
    output c1_per_alloc_apb3,
    output c2_per_alloc_apb3,
    output c1_per_alloc_ahb1,
    output c2_per_alloc_ahb1,
    output c1_per_alloc_ahb2,
    output c2_per_alloc_ahb2,
    output c1_per_alloc_ahb3,
    output c2_per_alloc_ahb3,
    // hsi csi clock request signals
    output hsi_ker_clk_req,
    output csi_ker_clk_req,
    // bus clocks
    input  rcc_apb3bridge_d3_clk,
    input  rcc_ahb1bridge_d3_clk,
    input  rcc_apb1bridge_d3_clk,
    input  rcc_apb2bridge_d3_clk,
    // kernel clock sources
    input  pll1_p_clk,
    input  pll1_q_clk,
    input  pll2_p_clk,
    input  pll2_q_clk,
    input  pll2_r_clk,
    input  pll3_p_clk,
    input  pll3_q_clk,
    input  pll3_r_clk,
    input  sys_clk,
    input  hse_origin_clk,
    input  hsi_ker_clk,
    input  csi_ker_clk,
    input  hsi48_origin_clk,
    input  lse_clk,
    input  lsi_clk,
    input  per_clk,
    input  i2s_clk_in,
    input  usb_phy1,
    // control signals
    input  c1_sleep,
    input  c1_deepsleep,
    input  c2_sleep,
    input  c2_deepsleep,
    input  d3_deepsleep,
    // rom control signals
    input  rcc_c1_rom_en,
    input  rcc_c2_rom_en,
    input  rcc_c1_rom_lpen,
    input  rcc_c2_rom_lpen,
    input  rcc_rom_amen,
    output rcc_rom_hclk,
    // tsms control signals
    input  rcc_c1_tsms_en,
    input  rcc_c2_tsms_en,
    input  rcc_c1_tsms_lpen,
    input  rcc_c2_tsms_lpen,
    input  rcc_tsms_amen,
    output rcc_tsms_hclk,
    // sms control signals
    input  rcc_c1_sms_en,
    input  rcc_c2_sms_en,
    input  rcc_c1_sms_lpen,
    input  rcc_c2_sms_lpen,
    input  rcc_sms_amen,
    output rcc_sms_hclk,
    // xflash control signals
    input  rcc_c1_xflash_en,
    input  rcc_c2_xflash_en,
    input  rcc_c1_xflash_lpen,
    input  rcc_c2_xflash_lpen,
    input  rcc_xflash_amen,
    output rcc_xflash_hclk,
    // fft control signals
    input  rcc_c1_fft_en,
    input  rcc_c2_fft_en,
    input  rcc_c1_fft_lpen,
    input  rcc_c2_fft_lpen,
    input  rcc_fft_amen,
    output rcc_fft_hclk,
    // npu control signals
    input  rcc_c1_npu_en,
    input  rcc_c2_npu_en,
    input  rcc_c1_npu_lpen,
    input  rcc_c2_npu_lpen,
    input  rcc_npu_amen,
    output rcc_npu_hclk,
    output rcc_npu_pclk,
    // dma1 control signals
    input  rcc_c1_dma1_en,
    input  rcc_c2_dma1_en,
    input  rcc_c1_dma1_lpen,
    input  rcc_c2_dma1_lpen,
    input  rcc_dma1_amen,
    output rcc_dma1_hclk,
    // dma2 control signals
    input  rcc_c1_dma2_en,
    input  rcc_c2_dma2_en,
    input  rcc_c1_dma2_lpen,
    input  rcc_c2_dma2_lpen,
    input  rcc_dma2_amen,
    output rcc_dma2_hclk,
    // dmasch control signals
    input  rcc_c1_dmasch_en,
    input  rcc_c2_dmasch_en,
    input  rcc_c1_dmasch_lpen,
    input  rcc_c2_dmasch_lpen,
    input  rcc_dmasch_amen,
    output rcc_dmasch_hclk,
    // qspi1 control signals
    input  rcc_c1_qspi1_en,
    input  rcc_c2_qspi1_en,
    input  rcc_c1_qspi1_lpen,
    input  rcc_c2_qspi1_lpen,
    input  rcc_qspi1_amen,
    output rcc_qspi1_hclk,
    // qspi2 control signals
    input  rcc_c1_qspi2_en,
    input  rcc_c2_qspi2_en,
    input  rcc_c1_qspi2_lpen,
    input  rcc_c2_qspi2_lpen,
    input  rcc_qspi2_amen,
    output rcc_qspi2_hclk,
    // qspi3 control signals
    input  rcc_c1_qspi3_en,
    input  rcc_c2_qspi3_en,
    input  rcc_c1_qspi3_lpen,
    input  rcc_c2_qspi3_lpen,
    input  rcc_qspi3_amen,
    output rcc_qspi3_hclk,
    // qspi4 control signals
    input  rcc_c1_qspi4_en,
    input  rcc_c2_qspi4_en,
    input  rcc_c1_qspi4_lpen,
    input  rcc_c2_qspi4_lpen,
    input  rcc_qspi4_amen,
    output rcc_qspi4_hclk,
    // xspi control signals
    input  rcc_c1_xspi_en,
    input  rcc_c2_xspi_en,
    input  rcc_c1_xspi_lpen,
    input  rcc_c2_xspi_lpen,
    input  rcc_xspi_amen,
    output rcc_xspi_hclk,
    // mspi control signals
    input  rcc_c1_mspi_en,
    input  rcc_c2_mspi_en,
    input  rcc_c1_mspi_lpen,
    input  rcc_c2_mspi_lpen,
    input  rcc_mspi_amen,
    output rcc_mspi_hclk,
    // hacif_l1 control signals
    input  rcc_c1_hacif_l1_en,
    input  rcc_c2_hacif_l1_en,
    input  rcc_c1_hacif_l1_lpen,
    input  rcc_c2_hacif_l1_lpen,
    input  rcc_hacif_l1_amen,
    output rcc_hacif_l1_hclk,
    output rcc_hacif_l1_pclk,
    // hacif_f1 control signals
    input  rcc_c1_hacif_f1_en,
    input  rcc_c2_hacif_f1_en,
    input  rcc_c1_hacif_f1_lpen,
    input  rcc_c2_hacif_f1_lpen,
    input  rcc_hacif_f1_amen,
    output rcc_hacif_f1_hclk,
    // mac control signals
    input  rcc_c1_mac_en,
    input  rcc_c2_mac_en,
    input  rcc_c1_mac_lpen,
    input  rcc_c2_mac_lpen,
    input  rcc_mac_amen,
    output rcc_mac_hclk,
    // lz control signals
    input  rcc_c1_lz_en,
    input  rcc_c2_lz_en,
    input  rcc_c1_lz_lpen,
    input  rcc_c2_lz_lpen,
    input  rcc_lz_amen,
    output rcc_lz_hclk,
    // gtim1 control signals
    input  rcc_c1_gtim1_en,
    input  rcc_c2_gtim1_en,
    input  rcc_c1_gtim1_lpen,
    input  rcc_c2_gtim1_lpen,
    input  rcc_gtim1_amen,
    output rcc_gtim1_pclk,
    // gtim2 control signals
    input  rcc_c1_gtim2_en,
    input  rcc_c2_gtim2_en,
    input  rcc_c1_gtim2_lpen,
    input  rcc_c2_gtim2_lpen,
    input  rcc_gtim2_amen,
    output rcc_gtim2_pclk,
    // gtim3 control signals
    input  rcc_c1_gtim3_en,
    input  rcc_c2_gtim3_en,
    input  rcc_c1_gtim3_lpen,
    input  rcc_c2_gtim3_lpen,
    input  rcc_gtim3_amen,
    output rcc_gtim3_pclk,
    // gtim4 control signals
    input  rcc_c1_gtim4_en,
    input  rcc_c2_gtim4_en,
    input  rcc_c1_gtim4_lpen,
    input  rcc_c2_gtim4_lpen,
    input  rcc_gtim4_amen,
    output rcc_gtim4_pclk,
    // spi1 control signals
    input  rcc_c1_spi1_en,
    input  rcc_c2_spi1_en,
    input  rcc_c1_spi1_lpen,
    input  rcc_c2_spi1_lpen,
    input  rcc_spi1_amen,
    output rcc_spi1_pclk,
    // spi2 control signals
    input  rcc_c1_spi2_en,
    input  rcc_c2_spi2_en,
    input  rcc_c1_spi2_lpen,
    input  rcc_c2_spi2_lpen,
    input  rcc_spi2_amen,
    output rcc_spi2_pclk,
    // spi3 control signals
    input  rcc_c1_spi3_en,
    input  rcc_c2_spi3_en,
    input  rcc_c1_spi3_lpen,
    input  rcc_c2_spi3_lpen,
    input  rcc_spi3_amen,
    output rcc_spi3_pclk,
    // uart1 control signals
    input  rcc_c1_uart1_en,
    input  rcc_c2_uart1_en,
    input  rcc_c1_uart1_lpen,
    input  rcc_c2_uart1_lpen,
    input  rcc_uart1_amen,
    output rcc_uart1_pclk,
    // uart2 control signals
    input  rcc_c1_uart2_en,
    input  rcc_c2_uart2_en,
    input  rcc_c1_uart2_lpen,
    input  rcc_c2_uart2_lpen,
    input  rcc_uart2_amen,
    output rcc_uart2_pclk,
    // uart3 control signals
    input  rcc_c1_uart3_en,
    input  rcc_c2_uart3_en,
    input  rcc_c1_uart3_lpen,
    input  rcc_c2_uart3_lpen,
    input  rcc_uart3_amen,
    output rcc_uart3_pclk,
    // uart4 control signals
    input  rcc_c1_uart4_en,
    input  rcc_c2_uart4_en,
    input  rcc_c1_uart4_lpen,
    input  rcc_c2_uart4_lpen,
    input  rcc_uart4_amen,
    output rcc_uart4_pclk,
    // i2c1 control signals
    input  rcc_c1_i2c1_en,
    input  rcc_c2_i2c1_en,
    input  rcc_c1_i2c1_lpen,
    input  rcc_c2_i2c1_lpen,
    input  rcc_i2c1_amen,
    output rcc_i2c1_pclk,
    // gpio1 control signals
    input  rcc_c1_gpio1_en,
    input  rcc_c2_gpio1_en,
    input  rcc_c1_gpio1_lpen,
    input  rcc_c2_gpio1_lpen,
    input  rcc_gpio1_amen,
    output rcc_gpio1_pclk,
    // gpio2 control signals
    input  rcc_c1_gpio2_en,
    input  rcc_c2_gpio2_en,
    input  rcc_c1_gpio2_lpen,
    input  rcc_c2_gpio2_lpen,
    input  rcc_gpio2_amen,
    output rcc_gpio2_pclk,
    // gpio3 control signals
    input  rcc_c1_gpio3_en,
    input  rcc_c2_gpio3_en,
    input  rcc_c1_gpio3_lpen,
    input  rcc_c2_gpio3_lpen,
    input  rcc_gpio3_amen,
    output rcc_gpio3_pclk,
    // can1 control signals
    input  rcc_c1_can1_en,
    input  rcc_c2_can1_en,
    input  rcc_c1_can1_lpen,
    input  rcc_c2_can1_lpen,
    input  rcc_can1_amen,
    output rcc_can1_pclk,
    // can2 control signals
    input  rcc_c1_can2_en,
    input  rcc_c2_can2_en,
    input  rcc_c1_can2_lpen,
    input  rcc_c2_can2_lpen,
    input  rcc_can2_amen,
    output rcc_can2_pclk,
    // can3 control signals
    input  rcc_c1_can3_en,
    input  rcc_c2_can3_en,
    input  rcc_c1_can3_lpen,
    input  rcc_c2_can3_lpen,
    input  rcc_can3_amen,
    output rcc_can3_pclk,
    // gtim5 control signals
    input  rcc_c1_gtim5_en,
    input  rcc_c2_gtim5_en,
    input  rcc_c1_gtim5_lpen,
    input  rcc_c2_gtim5_lpen,
    input  rcc_gtim5_amen,
    output rcc_gtim5_pclk,
    // gtim6 control signals
    input  rcc_c1_gtim6_en,
    input  rcc_c2_gtim6_en,
    input  rcc_c1_gtim6_lpen,
    input  rcc_c2_gtim6_lpen,
    input  rcc_gtim6_amen,
    output rcc_gtim6_pclk,
    // spi4 control signals
    input  rcc_c1_spi4_en,
    input  rcc_c2_spi4_en,
    input  rcc_c1_spi4_lpen,
    input  rcc_c2_spi4_lpen,
    input  rcc_spi4_amen,
    output rcc_spi4_pclk,
    // spi5 control signals
    input  rcc_c1_spi5_en,
    input  rcc_c2_spi5_en,
    input  rcc_c1_spi5_lpen,
    input  rcc_c2_spi5_lpen,
    input  rcc_spi5_amen,
    output rcc_spi5_pclk,
    // uart5 control signals
    input  rcc_c1_uart5_en,
    input  rcc_c2_uart5_en,
    input  rcc_c1_uart5_lpen,
    input  rcc_c2_uart5_lpen,
    input  rcc_uart5_amen,
    output rcc_uart5_pclk,
    // uart6 control signals
    input  rcc_c1_uart6_en,
    input  rcc_c2_uart6_en,
    input  rcc_c1_uart6_lpen,
    input  rcc_c2_uart6_lpen,
    input  rcc_uart6_amen,
    output rcc_uart6_pclk,
    // uart7 control signals
    input  rcc_c1_uart7_en,
    input  rcc_c2_uart7_en,
    input  rcc_c1_uart7_lpen,
    input  rcc_c2_uart7_lpen,
    input  rcc_uart7_amen,
    output rcc_uart7_pclk,
    // uart8 control signals
    input  rcc_c1_uart8_en,
    input  rcc_c2_uart8_en,
    input  rcc_c1_uart8_lpen,
    input  rcc_c2_uart8_lpen,
    input  rcc_uart8_amen,
    output rcc_uart8_pclk,
    // i2c2 control signals
    input  rcc_c1_i2c2_en,
    input  rcc_c2_i2c2_en,
    input  rcc_c1_i2c2_lpen,
    input  rcc_c2_i2c2_lpen,
    input  rcc_i2c2_amen,
    output rcc_i2c2_pclk,
    // i2c3 control signals
    input  rcc_c1_i2c3_en,
    input  rcc_c2_i2c3_en,
    input  rcc_c1_i2c3_lpen,
    input  rcc_c2_i2c3_lpen,
    input  rcc_i2c3_amen,
    output rcc_i2c3_pclk,
    // can4 control signals
    input  rcc_c1_can4_en,
    input  rcc_c2_can4_en,
    input  rcc_c1_can4_lpen,
    input  rcc_c2_can4_lpen,
    input  rcc_can4_amen,
    output rcc_can4_pclk,
    // can5 control signals
    input  rcc_c1_can5_en,
    input  rcc_c2_can5_en,
    input  rcc_c1_can5_lpen,
    input  rcc_c2_can5_lpen,
    input  rcc_can5_amen,
    output rcc_can5_pclk,
    // can6 control signals
    input  rcc_c1_can6_en,
    input  rcc_c2_can6_en,
    input  rcc_c1_can6_lpen,
    input  rcc_c2_can6_lpen,
    input  rcc_can6_amen,
    output rcc_can6_pclk,
    // mppt control signals
    input  rcc_c1_mppt_en,
    input  rcc_c2_mppt_en,
    input  rcc_c1_mppt_lpen,
    input  rcc_c2_mppt_lpen,
    input  rcc_mppt_amen,
    output rcc_mppt_pclk,
    output rcc_mppt_ker_clk,
    // gpio4 control signals
    input  rcc_c1_gpio4_en,
    input  rcc_c2_gpio4_en,
    input  rcc_c1_gpio4_lpen,
    input  rcc_c2_gpio4_lpen,
    input  rcc_gpio4_amen,
    output rcc_gpio4_pclk,
    // gpio5 control signals
    input  rcc_c1_gpio5_en,
    input  rcc_c2_gpio5_en,
    input  rcc_c1_gpio5_lpen,
    input  rcc_c2_gpio5_lpen,
    input  rcc_gpio5_amen,
    output rcc_gpio5_pclk,
    // sysctl control signals
    input  rcc_c1_sysctl_en,
    input  rcc_c2_sysctl_en,
    input  rcc_c1_sysctl_lpen,
    input  rcc_c2_sysctl_lpen,
    input  rcc_sysctl_amen,
    output rcc_sysctl_pclk,
    // wwdt control signals
    input  rcc_c1_wwdt_en,
    input  rcc_c2_wwdt_en,
    input  rcc_c1_wwdt_lpen,
    input  rcc_c2_wwdt_lpen,
    input  rcc_wwdt_amen,
    output rcc_wwdt_pclk,
    // tim1 control signals
    input  rcc_c1_tim1_en,
    input  rcc_c2_tim1_en,
    input  rcc_c1_tim1_lpen,
    input  rcc_c2_tim1_lpen,
    input  rcc_tim1_amen,
    output rcc_tim1_pclk,
    // tim2 control signals
    input  rcc_c1_tim2_en,
    input  rcc_c2_tim2_en,
    input  rcc_c1_tim2_lpen,
    input  rcc_c2_tim2_lpen,
    input  rcc_tim2_amen,
    output rcc_tim2_pclk,
    // adcc control signals
    input  rcc_c1_adcc_en,
    input  rcc_c2_adcc_en,
    input  rcc_c1_adcc_lpen,
    input  rcc_c2_adcc_lpen,
    input  rcc_adcc_amen,
    output rcc_adcc_pclk,
    // gpio6 control signals
    input  rcc_c1_gpio6_en,
    input  rcc_c2_gpio6_en,
    input  rcc_c1_gpio6_lpen,
    input  rcc_c2_gpio6_lpen,
    input  rcc_gpio6_amen,
    output rcc_gpio6_pclk,
    // gpio7 control signals
    input  rcc_c1_gpio7_en,
    input  rcc_c2_gpio7_en,
    input  rcc_c1_gpio7_lpen,
    input  rcc_c2_gpio7_lpen,
    input  rcc_gpio7_amen,
    output rcc_gpio7_pclk,
    // gpio8 control signals
    input  rcc_c1_gpio8_en,
    input  rcc_c2_gpio8_en,
    input  rcc_c1_gpio8_lpen,
    input  rcc_c2_gpio8_lpen,
    input  rcc_gpio8_amen,
    output rcc_gpio8_pclk,
    // iwdt control signals
    input  rcc_iwdt_amen,
    output rcc_iwdt_pclk,
    output rcc_iwdt_ker_clk,
    // rcc control signals
    output rcc_rcc_hclk,
    // rtc control signals
    input  rcc_rtc_amen,
    output rcc_rtc_pclk,
    output rcc_rtc_ker_clk,
    // ker clk control bits
    input  romrst,
    output rcc_rom_sync_rst_n,
    input  tsmsrst,
    output rcc_tsms_sync_rst_n,
    input  smsrst,
    output rcc_sms_sync_rst_n,
    input  xflashrst,
    output rcc_xflash_sync_rst_n,
    input  fftrst,
    output rcc_fft_sync_rst_n,
    input  npurst,
    output rcc_npu_sync_rst_n,
    input  dma1rst,
    output rcc_dma1_sync_rst_n,
    input  dma2rst,
    output rcc_dma2_sync_rst_n,
    input  dmaschrst,
    output rcc_dmasch_sync_rst_n,
    input  qspi1rst,
    output rcc_qspi1_sync_rst_n,
    input  qspi2rst,
    output rcc_qspi2_sync_rst_n,
    input  qspi3rst,
    output rcc_qspi3_sync_rst_n,
    input  qspi4rst,
    output rcc_qspi4_sync_rst_n,
    input  xspirst,
    output rcc_xspi_sync_rst_n,
    input  mspirst,
    output rcc_mspi_sync_rst_n,
    input  hacif_l1rst,
    output rcc_hacif_l1_sync_rst_n,
    input  hacif_f1rst,
    output rcc_hacif_f1_sync_rst_n,
    input  macrst,
    output rcc_mac_sync_rst_n,
    input  lzrst,
    output rcc_lz_sync_rst_n,
    input  gtim1rst,
    output rcc_gtim1_sync_rst_n,
    input  gtim2rst,
    output rcc_gtim2_sync_rst_n,
    input  gtim3rst,
    output rcc_gtim3_sync_rst_n,
    input  gtim4rst,
    output rcc_gtim4_sync_rst_n,
    input  spi1rst,
    output rcc_spi1_sync_rst_n,
    input  spi2rst,
    output rcc_spi2_sync_rst_n,
    input  spi3rst,
    output rcc_spi3_sync_rst_n,
    input  uart1rst,
    output rcc_uart1_sync_rst_n,
    input  uart2rst,
    output rcc_uart2_sync_rst_n,
    input  uart3rst,
    output rcc_uart3_sync_rst_n,
    input  uart4rst,
    output rcc_uart4_sync_rst_n,
    input  i2c1rst,
    output rcc_i2c1_sync_rst_n,
    input  gpio1rst,
    output rcc_gpio1_sync_rst_n,
    input  gpio2rst,
    output rcc_gpio2_sync_rst_n,
    input  gpio3rst,
    output rcc_gpio3_sync_rst_n,
    input  can1rst,
    output rcc_can1_sync_rst_n,
    input  can2rst,
    output rcc_can2_sync_rst_n,
    input  can3rst,
    output rcc_can3_sync_rst_n,
    input  gtim5rst,
    output rcc_gtim5_sync_rst_n,
    input  gtim6rst,
    output rcc_gtim6_sync_rst_n,
    input  spi4rst,
    output rcc_spi4_sync_rst_n,
    input  spi5rst,
    output rcc_spi5_sync_rst_n,
    input  uart5rst,
    output rcc_uart5_sync_rst_n,
    input  uart6rst,
    output rcc_uart6_sync_rst_n,
    input  uart7rst,
    output rcc_uart7_sync_rst_n,
    input  uart8rst,
    output rcc_uart8_sync_rst_n,
    input  i2c2rst,
    output rcc_i2c2_sync_rst_n,
    input  i2c3rst,
    output rcc_i2c3_sync_rst_n,
    input  can4rst,
    output rcc_can4_sync_rst_n,
    input  can5rst,
    output rcc_can5_sync_rst_n,
    input  can6rst,
    output rcc_can6_sync_rst_n,
    input  mpptrst,
    output rcc_mppt_sync_rst_n,
    input  gpio4rst,
    output rcc_gpio4_sync_rst_n,
    input  gpio5rst,
    output rcc_gpio5_sync_rst_n,
    input  sysctlrst,
    output rcc_sysctl_sync_rst_n,
    input  wwdtrst,
    output rcc_wwdt_sync_rst_n,
    input  tim1rst,
    output rcc_tim1_sync_rst_n,
    input  tim2rst,
    output rcc_tim2_sync_rst_n,
    input  adccrst,
    output rcc_adcc_sync_rst_n,
    input  gpio6rst,
    output rcc_gpio6_sync_rst_n,
    input  gpio7rst,
    output rcc_gpio7_sync_rst_n,
    input  gpio8rst,
    output rcc_gpio8_sync_rst_n,
    input  iwdtrst,
    output rcc_iwdt_sync_rst_n,
    output rcc_rcc_sync_rst_n,
    input  rtcrst,
    output rcc_rtc_sync_rst_n,
    // dx reset
    input  d1_rst_n,
    input  d2_rst_n
);

  wire [0:0] rom_src_bus_clks;
  wire [0:0] rom_bus_clks;
  wire [0:0] tsms_src_bus_clks;
  wire [0:0] tsms_bus_clks;
  wire [0:0] sms_src_bus_clks;
  wire [0:0] sms_bus_clks;
  wire [0:0] xflash_src_bus_clks;
  wire [0:0] xflash_bus_clks;
  wire [0:0] fft_src_bus_clks;
  wire [0:0] fft_bus_clks;
  wire [1:0] npu_src_bus_clks;
  wire [1:0] npu_bus_clks;
  wire [0:0] dma1_src_bus_clks;
  wire [0:0] dma1_bus_clks;
  wire [0:0] dma2_src_bus_clks;
  wire [0:0] dma2_bus_clks;
  wire [0:0] dmasch_src_bus_clks;
  wire [0:0] dmasch_bus_clks;
  wire [0:0] qspi1_src_bus_clks;
  wire [0:0] qspi1_bus_clks;
  wire [0:0] qspi2_src_bus_clks;
  wire [0:0] qspi2_bus_clks;
  wire [0:0] qspi3_src_bus_clks;
  wire [0:0] qspi3_bus_clks;
  wire [0:0] qspi4_src_bus_clks;
  wire [0:0] qspi4_bus_clks;
  wire [0:0] xspi_src_bus_clks;
  wire [0:0] xspi_bus_clks;
  wire [0:0] mspi_src_bus_clks;
  wire [0:0] mspi_bus_clks;
  wire [1:0] hacif_l1_src_bus_clks;
  wire [1:0] hacif_l1_bus_clks;
  wire [0:0] hacif_f1_src_bus_clks;
  wire [0:0] hacif_f1_bus_clks;
  wire [0:0] mac_src_bus_clks;
  wire [0:0] mac_bus_clks;
  wire [0:0] lz_src_bus_clks;
  wire [0:0] lz_bus_clks;
  wire [0:0] gtim1_src_bus_clks;
  wire [0:0] gtim1_bus_clks;
  wire [0:0] gtim2_src_bus_clks;
  wire [0:0] gtim2_bus_clks;
  wire [0:0] gtim3_src_bus_clks;
  wire [0:0] gtim3_bus_clks;
  wire [0:0] gtim4_src_bus_clks;
  wire [0:0] gtim4_bus_clks;
  wire [0:0] spi1_src_bus_clks;
  wire [0:0] spi1_bus_clks;
  wire [0:0] spi2_src_bus_clks;
  wire [0:0] spi2_bus_clks;
  wire [0:0] spi3_src_bus_clks;
  wire [0:0] spi3_bus_clks;
  wire [0:0] uart1_src_bus_clks;
  wire [0:0] uart1_bus_clks;
  wire [0:0] uart2_src_bus_clks;
  wire [0:0] uart2_bus_clks;
  wire [0:0] uart3_src_bus_clks;
  wire [0:0] uart3_bus_clks;
  wire [0:0] uart4_src_bus_clks;
  wire [0:0] uart4_bus_clks;
  wire [0:0] i2c1_src_bus_clks;
  wire [0:0] i2c1_bus_clks;
  wire [0:0] gpio1_src_bus_clks;
  wire [0:0] gpio1_bus_clks;
  wire [0:0] gpio2_src_bus_clks;
  wire [0:0] gpio2_bus_clks;
  wire [0:0] gpio3_src_bus_clks;
  wire [0:0] gpio3_bus_clks;
  wire [0:0] can1_src_bus_clks;
  wire [0:0] can1_bus_clks;
  wire [0:0] can2_src_bus_clks;
  wire [0:0] can2_bus_clks;
  wire [0:0] can3_src_bus_clks;
  wire [0:0] can3_bus_clks;
  wire [0:0] gtim5_src_bus_clks;
  wire [0:0] gtim5_bus_clks;
  wire [0:0] gtim6_src_bus_clks;
  wire [0:0] gtim6_bus_clks;
  wire [0:0] spi4_src_bus_clks;
  wire [0:0] spi4_bus_clks;
  wire [0:0] spi5_src_bus_clks;
  wire [0:0] spi5_bus_clks;
  wire [0:0] uart5_src_bus_clks;
  wire [0:0] uart5_bus_clks;
  wire [0:0] uart6_src_bus_clks;
  wire [0:0] uart6_bus_clks;
  wire [0:0] uart7_src_bus_clks;
  wire [0:0] uart7_bus_clks;
  wire [0:0] uart8_src_bus_clks;
  wire [0:0] uart8_bus_clks;
  wire [0:0] i2c2_src_bus_clks;
  wire [0:0] i2c2_bus_clks;
  wire [0:0] i2c3_src_bus_clks;
  wire [0:0] i2c3_bus_clks;
  wire [0:0] can4_src_bus_clks;
  wire [0:0] can4_bus_clks;
  wire [0:0] can5_src_bus_clks;
  wire [0:0] can5_bus_clks;
  wire [0:0] can6_src_bus_clks;
  wire [0:0] can6_bus_clks;
  wire [0:0] mppt_src_bus_clks;
  wire [0:0] mppt_src_ker_clks;
  wire [0:0] mppt_bus_clks;
  wire [0:0] gpio4_src_bus_clks;
  wire [0:0] gpio4_bus_clks;
  wire [0:0] gpio5_src_bus_clks;
  wire [0:0] gpio5_bus_clks;
  wire [0:0] sysctl_src_bus_clks;
  wire [0:0] sysctl_bus_clks;
  wire [0:0] wwdt_src_bus_clks;
  wire [0:0] wwdt_bus_clks;
  wire [0:0] tim1_src_bus_clks;
  wire [0:0] tim1_bus_clks;
  wire [0:0] tim2_src_bus_clks;
  wire [0:0] tim2_bus_clks;
  wire [0:0] adcc_src_bus_clks;
  wire [0:0] adcc_bus_clks;
  wire [0:0] gpio6_src_bus_clks;
  wire [0:0] gpio6_bus_clks;
  wire [0:0] gpio7_src_bus_clks;
  wire [0:0] gpio7_bus_clks;
  wire [0:0] gpio8_src_bus_clks;
  wire [0:0] gpio8_bus_clks;
  wire [0:0] iwdt_src_bus_clks;
  wire [0:0] iwdt_src_ker_clks;
  wire [0:0] iwdt_bus_clks;
  wire [0:0] rcc_src_bus_clks;
  wire [0:0] rcc_bus_clks;
  wire [0:0] rtc_src_bus_clks;
  wire [0:0] rtc_src_ker_clks;
  wire [0:0] rtc_bus_clks;
  // rom clock and reset control
  assign rcc_rom_hclk     = rom_bus_clks[0];
  assign rom_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_rom_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (rom_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_rom_en),
      .rcc_c2_per_en  (rcc_c2_rom_en),
      .rcc_c1_per_lpen(rcc_c1_rom_lpen),
      .rcc_c2_per_lpen(rcc_c2_rom_lpen),
      .rcc_per_amen   (rcc_rom_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!romrst),
      .per_bus_clks   (rom_bus_clks),
      .per_rst_n      (rcc_rom_sync_rst_n)
  );
  // tsms clock and reset control
  assign rcc_tsms_hclk     = tsms_bus_clks[0];
  assign tsms_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_tsms_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (tsms_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_tsms_en),
      .rcc_c2_per_en  (rcc_c2_tsms_en),
      .rcc_c1_per_lpen(rcc_c1_tsms_lpen),
      .rcc_c2_per_lpen(rcc_c2_tsms_lpen),
      .rcc_per_amen   (rcc_tsms_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!tsmsrst),
      .per_bus_clks   (tsms_bus_clks),
      .per_rst_n      (rcc_tsms_sync_rst_n)
  );
  // sms clock and reset control
  assign rcc_sms_hclk     = sms_bus_clks[0];
  assign sms_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_sms_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (sms_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_sms_en),
      .rcc_c2_per_en  (rcc_c2_sms_en),
      .rcc_c1_per_lpen(rcc_c1_sms_lpen),
      .rcc_c2_per_lpen(rcc_c2_sms_lpen),
      .rcc_per_amen   (rcc_sms_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!smsrst),
      .per_bus_clks   (sms_bus_clks),
      .per_rst_n      (rcc_sms_sync_rst_n)
  );
  // xflash clock and reset control
  assign rcc_xflash_hclk     = xflash_bus_clks[0];
  assign xflash_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_xflash_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (xflash_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_xflash_en),
      .rcc_c2_per_en  (rcc_c2_xflash_en),
      .rcc_c1_per_lpen(rcc_c1_xflash_lpen),
      .rcc_c2_per_lpen(rcc_c2_xflash_lpen),
      .rcc_per_amen   (rcc_xflash_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!xflashrst),
      .per_bus_clks   (xflash_bus_clks),
      .per_rst_n      (rcc_xflash_sync_rst_n)
  );
  // fft clock and reset control
  assign rcc_fft_hclk     = fft_bus_clks[0];
  assign fft_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_fft_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (fft_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_fft_en),
      .rcc_c2_per_en  (rcc_c2_fft_en),
      .rcc_c1_per_lpen(rcc_c1_fft_lpen),
      .rcc_c2_per_lpen(rcc_c2_fft_lpen),
      .rcc_per_amen   (rcc_fft_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!fftrst),
      .per_bus_clks   (fft_bus_clks),
      .per_rst_n      (rcc_fft_sync_rst_n)
  );
  // npu clock and reset control
  assign rcc_npu_pclk     = npu_bus_clks[0];
  assign rcc_npu_hclk     = npu_bus_clks[1];
  assign npu_src_bus_clks = {rcc_apb3bridge_d3_clk, rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (2),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_npu_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (npu_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_npu_en),
      .rcc_c2_per_en  (rcc_c2_npu_en),
      .rcc_c1_per_lpen(rcc_c1_npu_lpen),
      .rcc_c2_per_lpen(rcc_c2_npu_lpen),
      .rcc_per_amen   (rcc_npu_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!npurst),
      .per_bus_clks   (npu_bus_clks),
      .per_rst_n      (rcc_npu_sync_rst_n)
  );
  // dma1 clock and reset control
  assign rcc_dma1_hclk     = dma1_bus_clks[0];
  assign dma1_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_dma1_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (dma1_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_dma1_en),
      .rcc_c2_per_en  (rcc_c2_dma1_en),
      .rcc_c1_per_lpen(rcc_c1_dma1_lpen),
      .rcc_c2_per_lpen(rcc_c2_dma1_lpen),
      .rcc_per_amen   (rcc_dma1_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!dma1rst),
      .per_bus_clks   (dma1_bus_clks),
      .per_rst_n      (rcc_dma1_sync_rst_n)
  );
  // dma2 clock and reset control
  assign rcc_dma2_hclk     = dma2_bus_clks[0];
  assign dma2_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_dma2_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (dma2_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_dma2_en),
      .rcc_c2_per_en  (rcc_c2_dma2_en),
      .rcc_c1_per_lpen(rcc_c1_dma2_lpen),
      .rcc_c2_per_lpen(rcc_c2_dma2_lpen),
      .rcc_per_amen   (rcc_dma2_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!dma2rst),
      .per_bus_clks   (dma2_bus_clks),
      .per_rst_n      (rcc_dma2_sync_rst_n)
  );
  // dmasch clock and reset control
  assign rcc_dmasch_hclk     = dmasch_bus_clks[0];
  assign dmasch_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_dmasch_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (dmasch_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_dmasch_en),
      .rcc_c2_per_en  (rcc_c2_dmasch_en),
      .rcc_c1_per_lpen(rcc_c1_dmasch_lpen),
      .rcc_c2_per_lpen(rcc_c2_dmasch_lpen),
      .rcc_per_amen   (rcc_dmasch_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!dmaschrst),
      .per_bus_clks   (dmasch_bus_clks),
      .per_rst_n      (rcc_dmasch_sync_rst_n)
  );
  // qspi1 clock and reset control
  assign rcc_qspi1_hclk     = qspi1_bus_clks[0];
  assign qspi1_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_qspi1_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (qspi1_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_qspi1_en),
      .rcc_c2_per_en  (rcc_c2_qspi1_en),
      .rcc_c1_per_lpen(rcc_c1_qspi1_lpen),
      .rcc_c2_per_lpen(rcc_c2_qspi1_lpen),
      .rcc_per_amen   (rcc_qspi1_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!qspi1rst),
      .per_bus_clks   (qspi1_bus_clks),
      .per_rst_n      (rcc_qspi1_sync_rst_n)
  );
  // qspi2 clock and reset control
  assign rcc_qspi2_hclk     = qspi2_bus_clks[0];
  assign qspi2_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_qspi2_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (qspi2_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_qspi2_en),
      .rcc_c2_per_en  (rcc_c2_qspi2_en),
      .rcc_c1_per_lpen(rcc_c1_qspi2_lpen),
      .rcc_c2_per_lpen(rcc_c2_qspi2_lpen),
      .rcc_per_amen   (rcc_qspi2_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!qspi2rst),
      .per_bus_clks   (qspi2_bus_clks),
      .per_rst_n      (rcc_qspi2_sync_rst_n)
  );
  // qspi3 clock and reset control
  assign rcc_qspi3_hclk     = qspi3_bus_clks[0];
  assign qspi3_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_qspi3_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (qspi3_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_qspi3_en),
      .rcc_c2_per_en  (rcc_c2_qspi3_en),
      .rcc_c1_per_lpen(rcc_c1_qspi3_lpen),
      .rcc_c2_per_lpen(rcc_c2_qspi3_lpen),
      .rcc_per_amen   (rcc_qspi3_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!qspi3rst),
      .per_bus_clks   (qspi3_bus_clks),
      .per_rst_n      (rcc_qspi3_sync_rst_n)
  );
  // qspi4 clock and reset control
  assign rcc_qspi4_hclk     = qspi4_bus_clks[0];
  assign qspi4_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_qspi4_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (qspi4_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_qspi4_en),
      .rcc_c2_per_en  (rcc_c2_qspi4_en),
      .rcc_c1_per_lpen(rcc_c1_qspi4_lpen),
      .rcc_c2_per_lpen(rcc_c2_qspi4_lpen),
      .rcc_per_amen   (rcc_qspi4_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!qspi4rst),
      .per_bus_clks   (qspi4_bus_clks),
      .per_rst_n      (rcc_qspi4_sync_rst_n)
  );
  // xspi clock and reset control
  assign rcc_xspi_hclk     = xspi_bus_clks[0];
  assign xspi_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_xspi_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (xspi_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_xspi_en),
      .rcc_c2_per_en  (rcc_c2_xspi_en),
      .rcc_c1_per_lpen(rcc_c1_xspi_lpen),
      .rcc_c2_per_lpen(rcc_c2_xspi_lpen),
      .rcc_per_amen   (rcc_xspi_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!xspirst),
      .per_bus_clks   (xspi_bus_clks),
      .per_rst_n      (rcc_xspi_sync_rst_n)
  );
  // mspi clock and reset control
  assign rcc_mspi_hclk     = mspi_bus_clks[0];
  assign mspi_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_mspi_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (mspi_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_mspi_en),
      .rcc_c2_per_en  (rcc_c2_mspi_en),
      .rcc_c1_per_lpen(rcc_c1_mspi_lpen),
      .rcc_c2_per_lpen(rcc_c2_mspi_lpen),
      .rcc_per_amen   (rcc_mspi_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!mspirst),
      .per_bus_clks   (mspi_bus_clks),
      .per_rst_n      (rcc_mspi_sync_rst_n)
  );
  // hacif_l1 clock and reset control
  assign rcc_hacif_l1_pclk     = hacif_l1_bus_clks[0];
  assign rcc_hacif_l1_hclk     = hacif_l1_bus_clks[1];
  assign hacif_l1_src_bus_clks = {rcc_apb3bridge_d3_clk, rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (2),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_hacif_l1_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (hacif_l1_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_hacif_l1_en),
      .rcc_c2_per_en  (rcc_c2_hacif_l1_en),
      .rcc_c1_per_lpen(rcc_c1_hacif_l1_lpen),
      .rcc_c2_per_lpen(rcc_c2_hacif_l1_lpen),
      .rcc_per_amen   (rcc_hacif_l1_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!hacif_l1rst),
      .per_bus_clks   (hacif_l1_bus_clks),
      .per_rst_n      (rcc_hacif_l1_sync_rst_n)
  );
  // hacif_f1 clock and reset control
  assign rcc_hacif_f1_hclk     = hacif_f1_bus_clks[0];
  assign hacif_f1_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_hacif_f1_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (hacif_f1_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_hacif_f1_en),
      .rcc_c2_per_en  (rcc_c2_hacif_f1_en),
      .rcc_c1_per_lpen(rcc_c1_hacif_f1_lpen),
      .rcc_c2_per_lpen(rcc_c2_hacif_f1_lpen),
      .rcc_per_amen   (rcc_hacif_f1_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!hacif_f1rst),
      .per_bus_clks   (hacif_f1_bus_clks),
      .per_rst_n      (rcc_hacif_f1_sync_rst_n)
  );
  // mac clock and reset control
  assign rcc_mac_hclk     = mac_bus_clks[0];
  assign mac_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_mac_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (mac_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_mac_en),
      .rcc_c2_per_en  (rcc_c2_mac_en),
      .rcc_c1_per_lpen(rcc_c1_mac_lpen),
      .rcc_c2_per_lpen(rcc_c2_mac_lpen),
      .rcc_per_amen   (rcc_mac_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!macrst),
      .per_bus_clks   (mac_bus_clks),
      .per_rst_n      (rcc_mac_sync_rst_n)
  );
  // lz clock and reset control
  assign rcc_lz_hclk     = lz_bus_clks[0];
  assign lz_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_lz_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (lz_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_lz_en),
      .rcc_c2_per_en  (rcc_c2_lz_en),
      .rcc_c1_per_lpen(rcc_c1_lz_lpen),
      .rcc_c2_per_lpen(rcc_c2_lz_lpen),
      .rcc_per_amen   (rcc_lz_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!lzrst),
      .per_bus_clks   (lz_bus_clks),
      .per_rst_n      (rcc_lz_sync_rst_n)
  );
  // gtim1 clock and reset control
  assign rcc_gtim1_pclk     = gtim1_bus_clks[0];
  assign gtim1_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_gtim1_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (gtim1_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_gtim1_en),
      .rcc_c2_per_en  (rcc_c2_gtim1_en),
      .rcc_c1_per_lpen(rcc_c1_gtim1_lpen),
      .rcc_c2_per_lpen(rcc_c2_gtim1_lpen),
      .rcc_per_amen   (rcc_gtim1_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!gtim1rst),
      .per_bus_clks   (gtim1_bus_clks),
      .per_rst_n      (rcc_gtim1_sync_rst_n)
  );
  // gtim2 clock and reset control
  assign rcc_gtim2_pclk     = gtim2_bus_clks[0];
  assign gtim2_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_gtim2_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (gtim2_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_gtim2_en),
      .rcc_c2_per_en  (rcc_c2_gtim2_en),
      .rcc_c1_per_lpen(rcc_c1_gtim2_lpen),
      .rcc_c2_per_lpen(rcc_c2_gtim2_lpen),
      .rcc_per_amen   (rcc_gtim2_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!gtim2rst),
      .per_bus_clks   (gtim2_bus_clks),
      .per_rst_n      (rcc_gtim2_sync_rst_n)
  );
  // gtim3 clock and reset control
  assign rcc_gtim3_pclk     = gtim3_bus_clks[0];
  assign gtim3_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_gtim3_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (gtim3_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_gtim3_en),
      .rcc_c2_per_en  (rcc_c2_gtim3_en),
      .rcc_c1_per_lpen(rcc_c1_gtim3_lpen),
      .rcc_c2_per_lpen(rcc_c2_gtim3_lpen),
      .rcc_per_amen   (rcc_gtim3_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!gtim3rst),
      .per_bus_clks   (gtim3_bus_clks),
      .per_rst_n      (rcc_gtim3_sync_rst_n)
  );
  // gtim4 clock and reset control
  assign rcc_gtim4_pclk     = gtim4_bus_clks[0];
  assign gtim4_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_gtim4_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (gtim4_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_gtim4_en),
      .rcc_c2_per_en  (rcc_c2_gtim4_en),
      .rcc_c1_per_lpen(rcc_c1_gtim4_lpen),
      .rcc_c2_per_lpen(rcc_c2_gtim4_lpen),
      .rcc_per_amen   (rcc_gtim4_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!gtim4rst),
      .per_bus_clks   (gtim4_bus_clks),
      .per_rst_n      (rcc_gtim4_sync_rst_n)
  );
  // spi1 clock and reset control
  assign rcc_spi1_pclk     = spi1_bus_clks[0];
  assign spi1_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_spi1_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (spi1_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_spi1_en),
      .rcc_c2_per_en  (rcc_c2_spi1_en),
      .rcc_c1_per_lpen(rcc_c1_spi1_lpen),
      .rcc_c2_per_lpen(rcc_c2_spi1_lpen),
      .rcc_per_amen   (rcc_spi1_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!spi1rst),
      .per_bus_clks   (spi1_bus_clks),
      .per_rst_n      (rcc_spi1_sync_rst_n)
  );
  // spi2 clock and reset control
  assign rcc_spi2_pclk     = spi2_bus_clks[0];
  assign spi2_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_spi2_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (spi2_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_spi2_en),
      .rcc_c2_per_en  (rcc_c2_spi2_en),
      .rcc_c1_per_lpen(rcc_c1_spi2_lpen),
      .rcc_c2_per_lpen(rcc_c2_spi2_lpen),
      .rcc_per_amen   (rcc_spi2_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!spi2rst),
      .per_bus_clks   (spi2_bus_clks),
      .per_rst_n      (rcc_spi2_sync_rst_n)
  );
  // spi3 clock and reset control
  assign rcc_spi3_pclk     = spi3_bus_clks[0];
  assign spi3_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_spi3_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (spi3_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_spi3_en),
      .rcc_c2_per_en  (rcc_c2_spi3_en),
      .rcc_c1_per_lpen(rcc_c1_spi3_lpen),
      .rcc_c2_per_lpen(rcc_c2_spi3_lpen),
      .rcc_per_amen   (rcc_spi3_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!spi3rst),
      .per_bus_clks   (spi3_bus_clks),
      .per_rst_n      (rcc_spi3_sync_rst_n)
  );
  // uart1 clock and reset control
  assign rcc_uart1_pclk     = uart1_bus_clks[0];
  assign uart1_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_uart1_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (uart1_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_uart1_en),
      .rcc_c2_per_en  (rcc_c2_uart1_en),
      .rcc_c1_per_lpen(rcc_c1_uart1_lpen),
      .rcc_c2_per_lpen(rcc_c2_uart1_lpen),
      .rcc_per_amen   (rcc_uart1_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!uart1rst),
      .per_bus_clks   (uart1_bus_clks),
      .per_rst_n      (rcc_uart1_sync_rst_n)
  );
  // uart2 clock and reset control
  assign rcc_uart2_pclk     = uart2_bus_clks[0];
  assign uart2_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_uart2_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (uart2_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_uart2_en),
      .rcc_c2_per_en  (rcc_c2_uart2_en),
      .rcc_c1_per_lpen(rcc_c1_uart2_lpen),
      .rcc_c2_per_lpen(rcc_c2_uart2_lpen),
      .rcc_per_amen   (rcc_uart2_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!uart2rst),
      .per_bus_clks   (uart2_bus_clks),
      .per_rst_n      (rcc_uart2_sync_rst_n)
  );
  // uart3 clock and reset control
  assign rcc_uart3_pclk     = uart3_bus_clks[0];
  assign uart3_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_uart3_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (uart3_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_uart3_en),
      .rcc_c2_per_en  (rcc_c2_uart3_en),
      .rcc_c1_per_lpen(rcc_c1_uart3_lpen),
      .rcc_c2_per_lpen(rcc_c2_uart3_lpen),
      .rcc_per_amen   (rcc_uart3_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!uart3rst),
      .per_bus_clks   (uart3_bus_clks),
      .per_rst_n      (rcc_uart3_sync_rst_n)
  );
  // uart4 clock and reset control
  assign rcc_uart4_pclk     = uart4_bus_clks[0];
  assign uart4_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_uart4_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (uart4_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_uart4_en),
      .rcc_c2_per_en  (rcc_c2_uart4_en),
      .rcc_c1_per_lpen(rcc_c1_uart4_lpen),
      .rcc_c2_per_lpen(rcc_c2_uart4_lpen),
      .rcc_per_amen   (rcc_uart4_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!uart4rst),
      .per_bus_clks   (uart4_bus_clks),
      .per_rst_n      (rcc_uart4_sync_rst_n)
  );
  // i2c1 clock and reset control
  assign rcc_i2c1_pclk     = i2c1_bus_clks[0];
  assign i2c1_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_i2c1_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (i2c1_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_i2c1_en),
      .rcc_c2_per_en  (rcc_c2_i2c1_en),
      .rcc_c1_per_lpen(rcc_c1_i2c1_lpen),
      .rcc_c2_per_lpen(rcc_c2_i2c1_lpen),
      .rcc_per_amen   (rcc_i2c1_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!i2c1rst),
      .per_bus_clks   (i2c1_bus_clks),
      .per_rst_n      (rcc_i2c1_sync_rst_n)
  );
  // gpio1 clock and reset control
  assign rcc_gpio1_pclk     = gpio1_bus_clks[0];
  assign gpio1_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_gpio1_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (gpio1_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_gpio1_en),
      .rcc_c2_per_en  (rcc_c2_gpio1_en),
      .rcc_c1_per_lpen(rcc_c1_gpio1_lpen),
      .rcc_c2_per_lpen(rcc_c2_gpio1_lpen),
      .rcc_per_amen   (rcc_gpio1_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!gpio1rst),
      .per_bus_clks   (gpio1_bus_clks),
      .per_rst_n      (rcc_gpio1_sync_rst_n)
  );
  // gpio2 clock and reset control
  assign rcc_gpio2_pclk     = gpio2_bus_clks[0];
  assign gpio2_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_gpio2_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (gpio2_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_gpio2_en),
      .rcc_c2_per_en  (rcc_c2_gpio2_en),
      .rcc_c1_per_lpen(rcc_c1_gpio2_lpen),
      .rcc_c2_per_lpen(rcc_c2_gpio2_lpen),
      .rcc_per_amen   (rcc_gpio2_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!gpio2rst),
      .per_bus_clks   (gpio2_bus_clks),
      .per_rst_n      (rcc_gpio2_sync_rst_n)
  );
  // gpio3 clock and reset control
  assign rcc_gpio3_pclk     = gpio3_bus_clks[0];
  assign gpio3_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_gpio3_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (gpio3_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_gpio3_en),
      .rcc_c2_per_en  (rcc_c2_gpio3_en),
      .rcc_c1_per_lpen(rcc_c1_gpio3_lpen),
      .rcc_c2_per_lpen(rcc_c2_gpio3_lpen),
      .rcc_per_amen   (rcc_gpio3_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!gpio3rst),
      .per_bus_clks   (gpio3_bus_clks),
      .per_rst_n      (rcc_gpio3_sync_rst_n)
  );
  // can1 clock and reset control
  assign rcc_can1_pclk     = can1_bus_clks[0];
  assign can1_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_can1_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (can1_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_can1_en),
      .rcc_c2_per_en  (rcc_c2_can1_en),
      .rcc_c1_per_lpen(rcc_c1_can1_lpen),
      .rcc_c2_per_lpen(rcc_c2_can1_lpen),
      .rcc_per_amen   (rcc_can1_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!can1rst),
      .per_bus_clks   (can1_bus_clks),
      .per_rst_n      (rcc_can1_sync_rst_n)
  );
  // can2 clock and reset control
  assign rcc_can2_pclk     = can2_bus_clks[0];
  assign can2_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_can2_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (can2_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_can2_en),
      .rcc_c2_per_en  (rcc_c2_can2_en),
      .rcc_c1_per_lpen(rcc_c1_can2_lpen),
      .rcc_c2_per_lpen(rcc_c2_can2_lpen),
      .rcc_per_amen   (rcc_can2_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!can2rst),
      .per_bus_clks   (can2_bus_clks),
      .per_rst_n      (rcc_can2_sync_rst_n)
  );
  // can3 clock and reset control
  assign rcc_can3_pclk     = can3_bus_clks[0];
  assign can3_src_bus_clks = {rcc_apb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_can3_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (can3_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_can3_en),
      .rcc_c2_per_en  (rcc_c2_can3_en),
      .rcc_c1_per_lpen(rcc_c1_can3_lpen),
      .rcc_c2_per_lpen(rcc_c2_can3_lpen),
      .rcc_per_amen   (rcc_can3_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!can3rst),
      .per_bus_clks   (can3_bus_clks),
      .per_rst_n      (rcc_can3_sync_rst_n)
  );
  // gtim5 clock and reset control
  assign rcc_gtim5_pclk     = gtim5_bus_clks[0];
  assign gtim5_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_gtim5_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (gtim5_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_gtim5_en),
      .rcc_c2_per_en  (rcc_c2_gtim5_en),
      .rcc_c1_per_lpen(rcc_c1_gtim5_lpen),
      .rcc_c2_per_lpen(rcc_c2_gtim5_lpen),
      .rcc_per_amen   (rcc_gtim5_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!gtim5rst),
      .per_bus_clks   (gtim5_bus_clks),
      .per_rst_n      (rcc_gtim5_sync_rst_n)
  );
  // gtim6 clock and reset control
  assign rcc_gtim6_pclk     = gtim6_bus_clks[0];
  assign gtim6_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_gtim6_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (gtim6_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_gtim6_en),
      .rcc_c2_per_en  (rcc_c2_gtim6_en),
      .rcc_c1_per_lpen(rcc_c1_gtim6_lpen),
      .rcc_c2_per_lpen(rcc_c2_gtim6_lpen),
      .rcc_per_amen   (rcc_gtim6_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!gtim6rst),
      .per_bus_clks   (gtim6_bus_clks),
      .per_rst_n      (rcc_gtim6_sync_rst_n)
  );
  // spi4 clock and reset control
  assign rcc_spi4_pclk     = spi4_bus_clks[0];
  assign spi4_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_spi4_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (spi4_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_spi4_en),
      .rcc_c2_per_en  (rcc_c2_spi4_en),
      .rcc_c1_per_lpen(rcc_c1_spi4_lpen),
      .rcc_c2_per_lpen(rcc_c2_spi4_lpen),
      .rcc_per_amen   (rcc_spi4_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!spi4rst),
      .per_bus_clks   (spi4_bus_clks),
      .per_rst_n      (rcc_spi4_sync_rst_n)
  );
  // spi5 clock and reset control
  assign rcc_spi5_pclk     = spi5_bus_clks[0];
  assign spi5_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_spi5_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (spi5_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_spi5_en),
      .rcc_c2_per_en  (rcc_c2_spi5_en),
      .rcc_c1_per_lpen(rcc_c1_spi5_lpen),
      .rcc_c2_per_lpen(rcc_c2_spi5_lpen),
      .rcc_per_amen   (rcc_spi5_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!spi5rst),
      .per_bus_clks   (spi5_bus_clks),
      .per_rst_n      (rcc_spi5_sync_rst_n)
  );
  // uart5 clock and reset control
  assign rcc_uart5_pclk     = uart5_bus_clks[0];
  assign uart5_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_uart5_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (uart5_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_uart5_en),
      .rcc_c2_per_en  (rcc_c2_uart5_en),
      .rcc_c1_per_lpen(rcc_c1_uart5_lpen),
      .rcc_c2_per_lpen(rcc_c2_uart5_lpen),
      .rcc_per_amen   (rcc_uart5_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!uart5rst),
      .per_bus_clks   (uart5_bus_clks),
      .per_rst_n      (rcc_uart5_sync_rst_n)
  );
  // uart6 clock and reset control
  assign rcc_uart6_pclk     = uart6_bus_clks[0];
  assign uart6_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_uart6_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (uart6_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_uart6_en),
      .rcc_c2_per_en  (rcc_c2_uart6_en),
      .rcc_c1_per_lpen(rcc_c1_uart6_lpen),
      .rcc_c2_per_lpen(rcc_c2_uart6_lpen),
      .rcc_per_amen   (rcc_uart6_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!uart6rst),
      .per_bus_clks   (uart6_bus_clks),
      .per_rst_n      (rcc_uart6_sync_rst_n)
  );
  // uart7 clock and reset control
  assign rcc_uart7_pclk     = uart7_bus_clks[0];
  assign uart7_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_uart7_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (uart7_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_uart7_en),
      .rcc_c2_per_en  (rcc_c2_uart7_en),
      .rcc_c1_per_lpen(rcc_c1_uart7_lpen),
      .rcc_c2_per_lpen(rcc_c2_uart7_lpen),
      .rcc_per_amen   (rcc_uart7_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!uart7rst),
      .per_bus_clks   (uart7_bus_clks),
      .per_rst_n      (rcc_uart7_sync_rst_n)
  );
  // uart8 clock and reset control
  assign rcc_uart8_pclk     = uart8_bus_clks[0];
  assign uart8_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_uart8_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (uart8_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_uart8_en),
      .rcc_c2_per_en  (rcc_c2_uart8_en),
      .rcc_c1_per_lpen(rcc_c1_uart8_lpen),
      .rcc_c2_per_lpen(rcc_c2_uart8_lpen),
      .rcc_per_amen   (rcc_uart8_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!uart8rst),
      .per_bus_clks   (uart8_bus_clks),
      .per_rst_n      (rcc_uart8_sync_rst_n)
  );
  // i2c2 clock and reset control
  assign rcc_i2c2_pclk     = i2c2_bus_clks[0];
  assign i2c2_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_i2c2_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (i2c2_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_i2c2_en),
      .rcc_c2_per_en  (rcc_c2_i2c2_en),
      .rcc_c1_per_lpen(rcc_c1_i2c2_lpen),
      .rcc_c2_per_lpen(rcc_c2_i2c2_lpen),
      .rcc_per_amen   (rcc_i2c2_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!i2c2rst),
      .per_bus_clks   (i2c2_bus_clks),
      .per_rst_n      (rcc_i2c2_sync_rst_n)
  );
  // i2c3 clock and reset control
  assign rcc_i2c3_pclk     = i2c3_bus_clks[0];
  assign i2c3_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_i2c3_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (i2c3_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_i2c3_en),
      .rcc_c2_per_en  (rcc_c2_i2c3_en),
      .rcc_c1_per_lpen(rcc_c1_i2c3_lpen),
      .rcc_c2_per_lpen(rcc_c2_i2c3_lpen),
      .rcc_per_amen   (rcc_i2c3_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!i2c3rst),
      .per_bus_clks   (i2c3_bus_clks),
      .per_rst_n      (rcc_i2c3_sync_rst_n)
  );
  // can4 clock and reset control
  assign rcc_can4_pclk     = can4_bus_clks[0];
  assign can4_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_can4_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (can4_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_can4_en),
      .rcc_c2_per_en  (rcc_c2_can4_en),
      .rcc_c1_per_lpen(rcc_c1_can4_lpen),
      .rcc_c2_per_lpen(rcc_c2_can4_lpen),
      .rcc_per_amen   (rcc_can4_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!can4rst),
      .per_bus_clks   (can4_bus_clks),
      .per_rst_n      (rcc_can4_sync_rst_n)
  );
  // can5 clock and reset control
  assign rcc_can5_pclk     = can5_bus_clks[0];
  assign can5_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_can5_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (can5_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_can5_en),
      .rcc_c2_per_en  (rcc_c2_can5_en),
      .rcc_c1_per_lpen(rcc_c1_can5_lpen),
      .rcc_c2_per_lpen(rcc_c2_can5_lpen),
      .rcc_per_amen   (rcc_can5_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!can5rst),
      .per_bus_clks   (can5_bus_clks),
      .per_rst_n      (rcc_can5_sync_rst_n)
  );
  // can6 clock and reset control
  assign rcc_can6_pclk     = can6_bus_clks[0];
  assign can6_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_can6_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (can6_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_can6_en),
      .rcc_c2_per_en  (rcc_c2_can6_en),
      .rcc_c1_per_lpen(rcc_c1_can6_lpen),
      .rcc_c2_per_lpen(rcc_c2_can6_lpen),
      .rcc_per_amen   (rcc_can6_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!can6rst),
      .per_bus_clks   (can6_bus_clks),
      .per_rst_n      (rcc_can6_sync_rst_n)
  );
  // mppt clock and reset control
  assign rcc_mppt_pclk     = mppt_bus_clks[0];
  assign mppt_src_bus_clks = {rcc_apb2bridge_d3_clk};
  assign mppt_src_ker_clks = {pll1_p_clk};
  per_ker_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .KER_CLK_NUM                 (1),
      .KER_CLK_SRC_NUM             (1),
      .IS_LSI                      (0),
      .LSI_INDEX                   (0),
      .IS_LSE                      (0),
      .LSE_INDEX                   (0),
      .IS_HSI                      (0),
      .HSI_INDEX                   (0),
      .IS_CSI                      (0),
      .CSI_INDEX                   (0),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_mppt_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (mppt_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_mppt_en),
      .rcc_c2_per_en  (rcc_c2_mppt_en),
      .rcc_c1_per_lpen(rcc_c1_mppt_lpen),
      .rcc_c2_per_lpen(rcc_c2_mppt_lpen),
      .rcc_per_amen   (rcc_mppt_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .ker_src_clks   (mppt_src_ker_clks),
      .ker_clk_sel    (1'b0),
      .per_ker_clk_req(1'b0),
      .per_ker_clks   (rcc_mppt_ker_clk),
      .csi_ker_clk_req(),
      .hsi_ker_clk_req(),
      .sft_rst_n      (!mpptrst),
      .per_bus_clks   (mppt_bus_clks),
      .per_rst_n      (rcc_mppt_sync_rst_n)
  );
  // gpio4 clock and reset control
  assign rcc_gpio4_pclk     = gpio4_bus_clks[0];
  assign gpio4_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_gpio4_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (gpio4_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_gpio4_en),
      .rcc_c2_per_en  (rcc_c2_gpio4_en),
      .rcc_c1_per_lpen(rcc_c1_gpio4_lpen),
      .rcc_c2_per_lpen(rcc_c2_gpio4_lpen),
      .rcc_per_amen   (rcc_gpio4_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!gpio4rst),
      .per_bus_clks   (gpio4_bus_clks),
      .per_rst_n      (rcc_gpio4_sync_rst_n)
  );
  // gpio5 clock and reset control
  assign rcc_gpio5_pclk     = gpio5_bus_clks[0];
  assign gpio5_src_bus_clks = {rcc_apb2bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_gpio5_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (gpio5_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_gpio5_en),
      .rcc_c2_per_en  (rcc_c2_gpio5_en),
      .rcc_c1_per_lpen(rcc_c1_gpio5_lpen),
      .rcc_c2_per_lpen(rcc_c2_gpio5_lpen),
      .rcc_per_amen   (rcc_gpio5_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!gpio5rst),
      .per_bus_clks   (gpio5_bus_clks),
      .per_rst_n      (rcc_gpio5_sync_rst_n)
  );
  // sysctl clock and reset control
  assign rcc_sysctl_pclk     = sysctl_bus_clks[0];
  assign sysctl_src_bus_clks = {rcc_apb3bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_sysctl_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (sysctl_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_sysctl_en),
      .rcc_c2_per_en  (rcc_c2_sysctl_en),
      .rcc_c1_per_lpen(rcc_c1_sysctl_lpen),
      .rcc_c2_per_lpen(rcc_c2_sysctl_lpen),
      .rcc_per_amen   (rcc_sysctl_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!sysctlrst),
      .per_bus_clks   (sysctl_bus_clks),
      .per_rst_n      (rcc_sysctl_sync_rst_n)
  );
  // wwdt clock and reset control
  assign rcc_wwdt_pclk     = wwdt_bus_clks[0];
  assign wwdt_src_bus_clks = {rcc_apb3bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_wwdt_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (wwdt_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_wwdt_en),
      .rcc_c2_per_en  (rcc_c2_wwdt_en),
      .rcc_c1_per_lpen(rcc_c1_wwdt_lpen),
      .rcc_c2_per_lpen(rcc_c2_wwdt_lpen),
      .rcc_per_amen   (rcc_wwdt_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!wwdtrst),
      .per_bus_clks   (wwdt_bus_clks),
      .per_rst_n      (rcc_wwdt_sync_rst_n)
  );
  // tim1 clock and reset control
  assign rcc_tim1_pclk     = tim1_bus_clks[0];
  assign tim1_src_bus_clks = {rcc_apb3bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_tim1_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (tim1_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_tim1_en),
      .rcc_c2_per_en  (rcc_c2_tim1_en),
      .rcc_c1_per_lpen(rcc_c1_tim1_lpen),
      .rcc_c2_per_lpen(rcc_c2_tim1_lpen),
      .rcc_per_amen   (rcc_tim1_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!tim1rst),
      .per_bus_clks   (tim1_bus_clks),
      .per_rst_n      (rcc_tim1_sync_rst_n)
  );
  // tim2 clock and reset control
  assign rcc_tim2_pclk     = tim2_bus_clks[0];
  assign tim2_src_bus_clks = {rcc_apb3bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_tim2_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (tim2_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_tim2_en),
      .rcc_c2_per_en  (rcc_c2_tim2_en),
      .rcc_c1_per_lpen(rcc_c1_tim2_lpen),
      .rcc_c2_per_lpen(rcc_c2_tim2_lpen),
      .rcc_per_amen   (rcc_tim2_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!tim2rst),
      .per_bus_clks   (tim2_bus_clks),
      .per_rst_n      (rcc_tim2_sync_rst_n)
  );
  // adcc clock and reset control
  assign rcc_adcc_pclk     = adcc_bus_clks[0];
  assign adcc_src_bus_clks = {rcc_apb3bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_adcc_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (adcc_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_adcc_en),
      .rcc_c2_per_en  (rcc_c2_adcc_en),
      .rcc_c1_per_lpen(rcc_c1_adcc_lpen),
      .rcc_c2_per_lpen(rcc_c2_adcc_lpen),
      .rcc_per_amen   (rcc_adcc_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!adccrst),
      .per_bus_clks   (adcc_bus_clks),
      .per_rst_n      (rcc_adcc_sync_rst_n)
  );
  // gpio6 clock and reset control
  assign rcc_gpio6_pclk     = gpio6_bus_clks[0];
  assign gpio6_src_bus_clks = {rcc_apb3bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_gpio6_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (gpio6_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_gpio6_en),
      .rcc_c2_per_en  (rcc_c2_gpio6_en),
      .rcc_c1_per_lpen(rcc_c1_gpio6_lpen),
      .rcc_c2_per_lpen(rcc_c2_gpio6_lpen),
      .rcc_per_amen   (rcc_gpio6_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!gpio6rst),
      .per_bus_clks   (gpio6_bus_clks),
      .per_rst_n      (rcc_gpio6_sync_rst_n)
  );
  // gpio7 clock and reset control
  assign rcc_gpio7_pclk     = gpio7_bus_clks[0];
  assign gpio7_src_bus_clks = {rcc_apb3bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_gpio7_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (gpio7_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_gpio7_en),
      .rcc_c2_per_en  (rcc_c2_gpio7_en),
      .rcc_c1_per_lpen(rcc_c1_gpio7_lpen),
      .rcc_c2_per_lpen(rcc_c2_gpio7_lpen),
      .rcc_per_amen   (rcc_gpio7_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!gpio7rst),
      .per_bus_clks   (gpio7_bus_clks),
      .per_rst_n      (rcc_gpio7_sync_rst_n)
  );
  // gpio8 clock and reset control
  assign rcc_gpio8_pclk     = gpio8_bus_clks[0];
  assign gpio8_src_bus_clks = {rcc_apb3bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (1),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (0),
      .ASSIGNED_TO_CPU2            (0),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_gpio8_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (gpio8_src_bus_clks),
      .rcc_c1_per_en  (rcc_c1_gpio8_en),
      .rcc_c2_per_en  (rcc_c2_gpio8_en),
      .rcc_c1_per_lpen(rcc_c1_gpio8_lpen),
      .rcc_c2_per_lpen(rcc_c2_gpio8_lpen),
      .rcc_per_amen   (rcc_gpio8_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (!gpio8rst),
      .per_bus_clks   (gpio8_bus_clks),
      .per_rst_n      (rcc_gpio8_sync_rst_n)
  );
  // iwdt clock and reset control
  assign rcc_iwdt_pclk     = iwdt_bus_clks[0];
  assign iwdt_src_bus_clks = {rcc_apb3bridge_d3_clk};
  assign iwdt_src_ker_clks = {hse_origin_clk};
  per_ker_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (0),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (1),
      .ASSIGNED_TO_CPU2            (1),
      .DOMAIN                      (3),
      .KER_CLK_NUM                 (1),
      .KER_CLK_SRC_NUM             (1),
      .IS_LSI                      (0),
      .LSI_INDEX                   (0),
      .IS_LSE                      (0),
      .LSE_INDEX                   (0),
      .IS_HSI                      (0),
      .HSI_INDEX                   (0),
      .IS_CSI                      (0),
      .CSI_INDEX                   (0),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_iwdt_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (iwdt_src_bus_clks),
      .rcc_c1_per_en  (1'b1),
      .rcc_c2_per_en  (1'b1),
      .rcc_c1_per_lpen(1'b1),
      .rcc_c2_per_lpen(1'b1),
      .rcc_per_amen   (rcc_iwdt_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .ker_src_clks   (iwdt_src_ker_clks),
      .ker_clk_sel    (1'b0),
      .per_ker_clk_req(1'b0),
      .per_ker_clks   (rcc_iwdt_ker_clk),
      .csi_ker_clk_req(),
      .hsi_ker_clk_req(),
      .sft_rst_n      (!iwdtrst),
      .per_bus_clks   (iwdt_bus_clks),
      .per_rst_n      (rcc_iwdt_sync_rst_n)
  );
  // rcc clock and reset control
  assign rcc_rcc_hclk     = rcc_bus_clks[0];
  assign rcc_src_bus_clks = {rcc_ahb1bridge_d3_clk};
  per_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (0),
      .SUPPORT_AMEN                (0),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (1),
      .ASSIGNED_TO_CPU2            (1),
      .DOMAIN                      (3),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_rcc_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (rcc_src_bus_clks),
      .rcc_c1_per_en  (1'b1),
      .rcc_c2_per_en  (1'b1),
      .rcc_c1_per_lpen(1'b1),
      .rcc_c2_per_lpen(1'b1),
      .rcc_per_amen   (1'b1),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .sft_rst_n      (1'b1),
      .per_bus_clks   (rcc_bus_clks),
      .per_rst_n      (rcc_rcc_sync_rst_n)
  );
  // rtc clock and reset control
  assign rcc_rtc_pclk     = rtc_bus_clks[0];
  assign rtc_src_bus_clks = {rcc_apb3bridge_d3_clk};
  assign rtc_src_ker_clks = {hse_origin_clk};
  per_ker_clk_rst_control #(
      .BUS_CLK_NUM                 (1),
      .SUPPORT_LPEN                (0),
      .SUPPORT_AMEN                (1),
      .D3_DEFAULT_NO_CLK           (0),
      .ASSIGNED_TO_CPU1            (1),
      .ASSIGNED_TO_CPU2            (1),
      .DOMAIN                      (3),
      .KER_CLK_NUM                 (1),
      .KER_CLK_SRC_NUM             (1),
      .IS_LSI                      (0),
      .LSI_INDEX                   (0),
      .IS_LSE                      (0),
      .LSE_INDEX                   (0),
      .IS_HSI                      (0),
      .HSI_INDEX                   (0),
      .IS_CSI                      (0),
      .CSI_INDEX                   (0),
      .CLK_ON_AFTER_PER_RST_RELEASE(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_rtc_per_clk_rst_control (
      .test_rst_n     (test_rst_n),
      .bus_clks       (rtc_src_bus_clks),
      .rcc_c1_per_en  (1'b1),
      .rcc_c2_per_en  (1'b1),
      .rcc_c1_per_lpen(1'b1),
      .rcc_c2_per_lpen(1'b1),
      .rcc_per_amen   (rcc_rtc_amen),
      .c1_sleep       (c1_sleep),
      .c1_deepsleep   (c1_deepsleep),
      .c2_sleep       (c2_sleep),
      .c2_deepsleep   (c2_deepsleep),
      .d3_deepsleep   (d3_deepsleep),
      .arcg_on        (rcc_arcg_on),
      .testmode       (testmode),
      .sys_rst_n      (sys_rst_n),
      .d1_rst_n       (d1_rst_n),
      .d2_rst_n       (d2_rst_n),
      .ker_src_clks   (rtc_src_ker_clks),
      .ker_clk_sel    (1'b0),
      .per_ker_clk_req(1'b0),
      .per_ker_clks   (rcc_rtc_ker_clk),
      .csi_ker_clk_req(),
      .hsi_ker_clk_req(),
      .sft_rst_n      (!rtcrst),
      .per_bus_clks   (rtc_bus_clks),
      .per_rst_n      (rcc_rtc_sync_rst_n)
  );

  // generate c2_per_alloc_d1 and c1_per_alloc_d2
  assign c2_per_alloc_d1 =  rcc_c1_rom_en || rcc_c1_tsms_en || rcc_c1_sms_en || rcc_c1_xflash_en || rcc_c1_fft_en || rcc_c1_npu_en || rcc_c1_dma1_en || rcc_c1_dma2_en || rcc_c1_dmasch_en || rcc_c1_qspi1_en || rcc_c1_qspi2_en || rcc_c1_qspi3_en || rcc_c1_qspi4_en || rcc_c1_xspi_en || rcc_c1_mspi_en || rcc_c1_hacif_l1_en || rcc_c1_hacif_f1_en || rcc_c1_mac_en || rcc_c1_lz_en || rcc_c1_gtim1_en || rcc_c1_gtim2_en || rcc_c1_gtim3_en || rcc_c1_gtim4_en || rcc_c1_spi1_en || rcc_c1_spi2_en || rcc_c1_spi3_en || rcc_c1_uart1_en || rcc_c1_uart2_en || rcc_c1_uart3_en || rcc_c1_uart4_en || rcc_c1_i2c1_en || rcc_c1_gpio1_en || rcc_c1_gpio2_en || rcc_c1_gpio3_en || rcc_c1_can1_en || rcc_c1_can2_en || rcc_c1_can3_en || rcc_c1_gtim5_en || rcc_c1_gtim6_en || rcc_c1_spi4_en || rcc_c1_spi5_en || rcc_c1_uart5_en || rcc_c1_uart6_en || rcc_c1_uart7_en || rcc_c1_uart8_en || rcc_c1_i2c2_en || rcc_c1_i2c3_en || rcc_c1_can4_en || rcc_c1_can5_en || rcc_c1_can6_en || rcc_c1_mppt_en || rcc_c1_gpio4_en || rcc_c1_gpio5_en || rcc_c1_sysctl_en || rcc_c1_wwdt_en || rcc_c1_tim1_en || rcc_c1_tim2_en || rcc_c1_adcc_en || rcc_c1_gpio6_en || rcc_c1_gpio7_en || rcc_c1_gpio8_en ;
  assign c1_per_alloc_d2 =  rcc_c2_rom_en || rcc_c2_tsms_en || rcc_c2_sms_en || rcc_c2_xflash_en || rcc_c2_fft_en || rcc_c2_npu_en || rcc_c2_dma1_en || rcc_c2_dma2_en || rcc_c2_dmasch_en || rcc_c2_qspi1_en || rcc_c2_qspi2_en || rcc_c2_qspi3_en || rcc_c2_qspi4_en || rcc_c2_xspi_en || rcc_c2_mspi_en || rcc_c2_hacif_l1_en || rcc_c2_hacif_f1_en || rcc_c2_mac_en || rcc_c2_lz_en || rcc_c2_gtim1_en || rcc_c2_gtim2_en || rcc_c2_gtim3_en || rcc_c2_gtim4_en || rcc_c2_spi1_en || rcc_c2_spi2_en || rcc_c2_spi3_en || rcc_c2_uart1_en || rcc_c2_uart2_en || rcc_c2_uart3_en || rcc_c2_uart4_en || rcc_c2_i2c1_en || rcc_c2_gpio1_en || rcc_c2_gpio2_en || rcc_c2_gpio3_en || rcc_c2_can1_en || rcc_c2_can2_en || rcc_c2_can3_en || rcc_c2_gtim5_en || rcc_c2_gtim6_en || rcc_c2_spi4_en || rcc_c2_spi5_en || rcc_c2_uart5_en || rcc_c2_uart6_en || rcc_c2_uart7_en || rcc_c2_uart8_en || rcc_c2_i2c2_en || rcc_c2_i2c3_en || rcc_c2_can4_en || rcc_c2_can5_en || rcc_c2_can6_en || rcc_c2_mppt_en || rcc_c2_gpio4_en || rcc_c2_gpio5_en || rcc_c2_sysctl_en || rcc_c2_wwdt_en || rcc_c2_tim1_en || rcc_c2_tim2_en || rcc_c2_adcc_en || rcc_c2_gpio6_en || rcc_c2_gpio7_en || rcc_c2_gpio8_en ;
  assign c1_per_alloc_apb1 =  (rcc_c1_gtim1_en && rcc_c1_gtim1_lpen) || (rcc_c1_gtim2_en && rcc_c1_gtim2_lpen) || (rcc_c1_gtim3_en && rcc_c1_gtim3_lpen) || (rcc_c1_gtim4_en && rcc_c1_gtim4_lpen) || (rcc_c1_spi1_en && rcc_c1_spi1_lpen) || (rcc_c1_spi2_en && rcc_c1_spi2_lpen) || (rcc_c1_spi3_en && rcc_c1_spi3_lpen) || (rcc_c1_uart1_en && rcc_c1_uart1_lpen) || (rcc_c1_uart2_en && rcc_c1_uart2_lpen) || (rcc_c1_uart3_en && rcc_c1_uart3_lpen) || (rcc_c1_uart4_en && rcc_c1_uart4_lpen) || (rcc_c1_i2c1_en && rcc_c1_i2c1_lpen) || (rcc_c1_gpio1_en && rcc_c1_gpio1_lpen) || (rcc_c1_gpio2_en && rcc_c1_gpio2_lpen) || (rcc_c1_gpio3_en && rcc_c1_gpio3_lpen) || (rcc_c1_can1_en && rcc_c1_can1_lpen) || (rcc_c1_can2_en && rcc_c1_can2_lpen) || (rcc_c1_can3_en && rcc_c1_can3_lpen) ;
  assign c2_per_alloc_apb1 =  (rcc_c2_gtim1_en && rcc_c2_gtim1_lpen) || (rcc_c2_gtim2_en && rcc_c2_gtim2_lpen) || (rcc_c2_gtim3_en && rcc_c2_gtim3_lpen) || (rcc_c2_gtim4_en && rcc_c2_gtim4_lpen) || (rcc_c2_spi1_en && rcc_c2_spi1_lpen) || (rcc_c2_spi2_en && rcc_c2_spi2_lpen) || (rcc_c2_spi3_en && rcc_c2_spi3_lpen) || (rcc_c2_uart1_en && rcc_c2_uart1_lpen) || (rcc_c2_uart2_en && rcc_c2_uart2_lpen) || (rcc_c2_uart3_en && rcc_c2_uart3_lpen) || (rcc_c2_uart4_en && rcc_c2_uart4_lpen) || (rcc_c2_i2c1_en && rcc_c2_i2c1_lpen) || (rcc_c2_gpio1_en && rcc_c2_gpio1_lpen) || (rcc_c2_gpio2_en && rcc_c2_gpio2_lpen) || (rcc_c2_gpio3_en && rcc_c2_gpio3_lpen) || (rcc_c2_can1_en && rcc_c2_can1_lpen) || (rcc_c2_can2_en && rcc_c2_can2_lpen) || (rcc_c2_can3_en && rcc_c2_can3_lpen) ;
  assign c1_per_alloc_apb2 =  (rcc_c1_gtim5_en && rcc_c1_gtim5_lpen) || (rcc_c1_gtim6_en && rcc_c1_gtim6_lpen) || (rcc_c1_spi4_en && rcc_c1_spi4_lpen) || (rcc_c1_spi5_en && rcc_c1_spi5_lpen) || (rcc_c1_uart5_en && rcc_c1_uart5_lpen) || (rcc_c1_uart6_en && rcc_c1_uart6_lpen) || (rcc_c1_uart7_en && rcc_c1_uart7_lpen) || (rcc_c1_uart8_en && rcc_c1_uart8_lpen) || (rcc_c1_i2c2_en && rcc_c1_i2c2_lpen) || (rcc_c1_i2c3_en && rcc_c1_i2c3_lpen) || (rcc_c1_can4_en && rcc_c1_can4_lpen) || (rcc_c1_can5_en && rcc_c1_can5_lpen) || (rcc_c1_can6_en && rcc_c1_can6_lpen) || (rcc_c1_mppt_en && rcc_c1_mppt_lpen) || (rcc_c1_gpio4_en && rcc_c1_gpio4_lpen) || (rcc_c1_gpio5_en && rcc_c1_gpio5_lpen) ;
  assign c2_per_alloc_apb2 =  (rcc_c2_gtim5_en && rcc_c2_gtim5_lpen) || (rcc_c2_gtim6_en && rcc_c2_gtim6_lpen) || (rcc_c2_spi4_en && rcc_c2_spi4_lpen) || (rcc_c2_spi5_en && rcc_c2_spi5_lpen) || (rcc_c2_uart5_en && rcc_c2_uart5_lpen) || (rcc_c2_uart6_en && rcc_c2_uart6_lpen) || (rcc_c2_uart7_en && rcc_c2_uart7_lpen) || (rcc_c2_uart8_en && rcc_c2_uart8_lpen) || (rcc_c2_i2c2_en && rcc_c2_i2c2_lpen) || (rcc_c2_i2c3_en && rcc_c2_i2c3_lpen) || (rcc_c2_can4_en && rcc_c2_can4_lpen) || (rcc_c2_can5_en && rcc_c2_can5_lpen) || (rcc_c2_can6_en && rcc_c2_can6_lpen) || (rcc_c2_mppt_en && rcc_c2_mppt_lpen) || (rcc_c2_gpio4_en && rcc_c2_gpio4_lpen) || (rcc_c2_gpio5_en && rcc_c2_gpio5_lpen) ;
  assign c1_per_alloc_apb3 =  (rcc_c1_npu_en && rcc_c1_npu_lpen) || (rcc_c1_hacif_l1_en && rcc_c1_hacif_l1_lpen) || (rcc_c1_sysctl_en && rcc_c1_sysctl_lpen) || (rcc_c1_wwdt_en && rcc_c1_wwdt_lpen) || (rcc_c1_tim1_en && rcc_c1_tim1_lpen) || (rcc_c1_tim2_en && rcc_c1_tim2_lpen) || (rcc_c1_adcc_en && rcc_c1_adcc_lpen) || (rcc_c1_gpio6_en && rcc_c1_gpio6_lpen) || (rcc_c1_gpio7_en && rcc_c1_gpio7_lpen) || (rcc_c1_gpio8_en && rcc_c1_gpio8_lpen) ;
  assign c2_per_alloc_apb3 =  (rcc_c2_npu_en && rcc_c2_npu_lpen) || (rcc_c2_hacif_l1_en && rcc_c2_hacif_l1_lpen) || (rcc_c2_sysctl_en && rcc_c2_sysctl_lpen) || (rcc_c2_wwdt_en && rcc_c2_wwdt_lpen) || (rcc_c2_tim1_en && rcc_c2_tim1_lpen) || (rcc_c2_tim2_en && rcc_c2_tim2_lpen) || (rcc_c2_adcc_en && rcc_c2_adcc_lpen) || (rcc_c2_gpio6_en && rcc_c2_gpio6_lpen) || (rcc_c2_gpio7_en && rcc_c2_gpio7_lpen) || (rcc_c2_gpio8_en && rcc_c2_gpio8_lpen) ;
  assign c1_per_alloc_ahb1 =  (rcc_c1_rom_en && rcc_c1_rom_lpen) || (rcc_c1_tsms_en && rcc_c1_tsms_lpen) || (rcc_c1_sms_en && rcc_c1_sms_lpen) || (rcc_c1_xflash_en && rcc_c1_xflash_lpen) || (rcc_c1_fft_en && rcc_c1_fft_lpen) || (rcc_c1_npu_en && rcc_c1_npu_lpen) || (rcc_c1_dma1_en && rcc_c1_dma1_lpen) || (rcc_c1_dma2_en && rcc_c1_dma2_lpen) || (rcc_c1_dmasch_en && rcc_c1_dmasch_lpen) || (rcc_c1_qspi1_en && rcc_c1_qspi1_lpen) || (rcc_c1_qspi2_en && rcc_c1_qspi2_lpen) || (rcc_c1_qspi3_en && rcc_c1_qspi3_lpen) || (rcc_c1_qspi4_en && rcc_c1_qspi4_lpen) || (rcc_c1_xspi_en && rcc_c1_xspi_lpen) || (rcc_c1_mspi_en && rcc_c1_mspi_lpen) || (rcc_c1_hacif_l1_en && rcc_c1_hacif_l1_lpen) || (rcc_c1_hacif_f1_en && rcc_c1_hacif_f1_lpen) || (rcc_c1_mac_en && rcc_c1_mac_lpen) || (rcc_c1_lz_en && rcc_c1_lz_lpen) ;
  assign c2_per_alloc_ahb1 =  (rcc_c2_rom_en && rcc_c2_rom_lpen) || (rcc_c2_tsms_en && rcc_c2_tsms_lpen) || (rcc_c2_sms_en && rcc_c2_sms_lpen) || (rcc_c2_xflash_en && rcc_c2_xflash_lpen) || (rcc_c2_fft_en && rcc_c2_fft_lpen) || (rcc_c2_npu_en && rcc_c2_npu_lpen) || (rcc_c2_dma1_en && rcc_c2_dma1_lpen) || (rcc_c2_dma2_en && rcc_c2_dma2_lpen) || (rcc_c2_dmasch_en && rcc_c2_dmasch_lpen) || (rcc_c2_qspi1_en && rcc_c2_qspi1_lpen) || (rcc_c2_qspi2_en && rcc_c2_qspi2_lpen) || (rcc_c2_qspi3_en && rcc_c2_qspi3_lpen) || (rcc_c2_qspi4_en && rcc_c2_qspi4_lpen) || (rcc_c2_xspi_en && rcc_c2_xspi_lpen) || (rcc_c2_mspi_en && rcc_c2_mspi_lpen) || (rcc_c2_hacif_l1_en && rcc_c2_hacif_l1_lpen) || (rcc_c2_hacif_f1_en && rcc_c2_hacif_f1_lpen) || (rcc_c2_mac_en && rcc_c2_mac_lpen) || (rcc_c2_lz_en && rcc_c2_lz_lpen) ;
  assign c1_per_alloc_ahb2 = 1'b0;
  assign c2_per_alloc_ahb2 = 1'b0;
  assign c1_per_alloc_ahb3 = 1'b0;
  assign c2_per_alloc_ahb3 = 1'b0;
  // generate hsi_ker_clk_req and csi_ker_clk_req
  assign hsi_ker_clk_req = 1'b0;
  assign csi_ker_clk_req = 1'b0;


endmodule
// spyglass enable_block W240
// spyglass enable_block W287b
