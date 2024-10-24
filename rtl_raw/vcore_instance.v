// rcc_vcore_top Parameters
parameter CLK_ON_AFTER_PER_RST_RELEASE   = 8;
parameter CLK_ON_AFTER_SYS_RST_RELEASE   = 8;
parameter CLK_ON_AFTER_D1_RST_RELEASE    = 8;
parameter CLK_ON_AFTER_D2_RST_RELEASE    = 8;
parameter CLK_ON_AFTER_CPU1_RST_RELEASE  = 8;
parameter CLK_ON_AFTER_CPU2_RST_RELEASE  = 8;

// rcc_vcore_top Inputs
reg   nrst_in;
reg   iwdg1_out_rst;
reg   wwdg1_out_rst;
reg   iwdg2_out_rst;
reg   wwdg2_out_rst;
reg   lpwr2_rst;
reg   lpwr1_rst;
reg   pwr_bor_rst;
reg   pwr_por_rst;
reg   cpu2_sftrst;
reg   cpu1_sftrst;
reg   d3_deepsleep;
reg   pwr_d1_wkup;
reg   pwr_d2_wkup;
reg   pwr_d3_wkup;
reg   flash_power_ok;
reg   pwr_d1_ok;
reg   pwr_d2_ok;
reg   pwr_vcore_ok;
reg   backup_protect;
reg   c2_sleep;
reg   c2_deepsleep;
reg   c1_sleep;
reg   c1_deepsleep;
reg   pad_rcc_eth_mii_tx_clk;
reg   pad_rcc_eth_mii_rx_clk;
reg   USB_PHY1;
reg   flash_obl_reload;
reg   obl_done;
reg   rcc_arcg_on;
reg   pll3_rdy;
reg   pll2_rdy;
reg   pll1_rdy;
reg   hse_rdy;
reg   hsi48_rdy;
reg   csi_rdy;
reg   hsi_rdy;
reg   [7:0]  flash_csi_opt;
reg   [11:0]  flash_hsi_opt;
reg   [9:0]  crs_hsi48_trim;
reg   rcc_hsecss_fail;
reg   rcc_lsecss_fail;
reg   ahb_hclk;
reg   ahb_hresetn;
reg   [31:0]  ahb_haddr;
reg   [2:0]  ahb_hburst;
reg   [2:0]  ahb_hprot;
reg   ahb_hready_in;
reg   [2:0]  ahb_hsize;
reg   [1:0]  ahb_htrans;
reg   [31:0]  ahb_hwdata;
reg   ahb_hwrite;
reg   ahb_hsel;
reg   ahb_hmaster;
reg   uart8_ker_clk_req;
reg   uart7_ker_clk_req;
reg   i2c3_ker_clk_req;
reg   i2c2_ker_clk_req;
reg   i2c1_ker_clk_req;
reg   uart5_ker_clk_req;
reg   uart4_ker_clk_req;
reg   usart3_ker_clk_req;
reg   usart2_ker_clk_req;
reg   usart6_ker_clk_req;
reg   usart1_ker_clk_req;
reg   i2c4_ker_clk_req;
reg   lpuart1_ker_clk_req;
reg   pll1_p_clk;
reg   pll1_q_clk;
reg   pll2_p_clk;
reg   pll2_q_clk;
reg   pll2_r_clk;
reg   pll3_p_clk;
reg   pll3_q_clk;
reg   pll3_r_clk;
reg   I2S_clk_IN;
reg   axibridge_d1_busy;
reg   ahb3bridge_d1_busy;
reg   apb3bridge_d1_busy;
reg   ahb1bridge_d2_busy;
reg   ahb2bridge_d2_busy;
reg   apb1bridge_d2_busy;
reg   apb2bridge_d2_busy;
reg   ahb4bridge_d3_busy;
reg   apb4bridge_d3_busy;
reg   flash_busy;
reg   hse_css_fail;
reg   hse_clk_pre;
reg   lse_clk;
reg   lsi_clk;
reg   hsi48_clk;
reg   csi_clk_pre;
reg   hsi_origin_clk;
reg   eth_rcc_fes;
reg   eth_rcc_epis_2;
reg   cur_rcc_bdcr_bdrst;
reg   cur_rcc_bdcr_rtcen;
reg   [1:0]  cur_rcc_bdcr_rtcsel;
reg   cur_rcc_bdcr_lsecssd;
reg   cur_rcc_bdcr_lsecsson;
reg   [1:0]  cur_rcc_bdcr_lsedrv;
reg   cur_rcc_bdcr_lsebyp;
reg   cur_rcc_bdcr_lserdy;
reg   cur_rcc_bdcr_lseon;
reg   cur_rcc_c1_rsr_lpwr2rstf;
reg   cur_rcc_c1_rsr_lpwr1rstf;
reg   cur_rcc_c1_rsr_wwdg2rstf;
reg   cur_rcc_c1_rsr_wwdg1rstf;
reg   cur_rcc_c1_rsr_iwdg2rstf;
reg   cur_rcc_c1_rsr_iwdg1rstf;
reg   cur_rcc_c1_rsr_sft2rstf;
reg   cur_rcc_c1_rsr_sft1rstf;
reg   cur_rcc_c1_rsr_porrstf;
reg   cur_rcc_c1_rsr_pinrstf;
reg   cur_rcc_c1_rsr_borrstf;
reg   cur_rcc_c1_rsr_d2rstf;
reg   cur_rcc_c1_rsr_d1rstf;
reg   cur_rcc_c1_rsr_oblrstf;
reg   cur_rcc_c1_rsr_rmvf;
reg   cur_rcc_c2_rsr_lpwr2rstf;
reg   cur_rcc_c2_rsr_lpwr1rstf;
reg   cur_rcc_c2_rsr_wwdg2rstf;
reg   cur_rcc_c2_rsr_wwdg1rstf;
reg   cur_rcc_c2_rsr_iwdg2rstf;
reg   cur_rcc_c2_rsr_iwdg1rstf;
reg   cur_rcc_c2_rsr_sft2rstf;
reg   cur_rcc_c2_rsr_sft1rstf;
reg   cur_rcc_c2_rsr_porrstf;
reg   cur_rcc_c2_rsr_pinrstf;
reg   cur_rcc_c2_rsr_borrstf;
reg   cur_rcc_c2_rsr_d2rstf;
reg   cur_rcc_c2_rsr_d1rstf;
reg   cur_rcc_c2_rsr_oblrstf;
reg   cur_rcc_c2_rsr_rmvf;
reg   cur_rcc_csr_lsirdy;
reg   cur_rcc_csr_lsion;

// rcc_vcore_top Outputs
wire  nrst_out;
wire  rcc_pwr_d1_req;
wire  rcc_pwr_d2_req;
wire  rcc_pwr_d3_req;
wire  c2_per_alloc_d1;
wire  c1_per_alloc_d2;
wire  rcc_c2_clk;
wire  rcc_fclk_c2;
wire  rcc_c2_systick_clk;
wire  rcc_c1_clk;
wire  rcc_fclk_c1;
wire  rcc_c1_systick_clk;
wire  cpu1_arcg_rst_n;
wire  cpu2_arcg_rst_n;
wire  d1_bus_arcg_rst_n;
wire  d2_bus_arcg_rst_n;
wire  d3_bus_arcg_rst_n;
wire  rcc_timx_ker_clk;
wire  rcc_timy_ker_clk;
wire  rcc_hrtimer_prescalar_clk;
wire  sys_d1cpre_clk;
wire  sys_hpre_clk;
wire  hse_rtc_clk;
wire  mco1;
wire  mco2;
wire  rcc_hsefail_it;
wire  rcc_lsefail_it;
wire  rcc_it;
wire  pwr_por_rst_n;
wire  sys_arcg_rst_n;
wire  d1_arcg_rst_n;
wire  d2_arcg_rst_n;
wire  stby_rst_n;
wire  rcc_flash_arcg_rst_n;
wire  rcc_qspi_arcg_rst_n;
wire  rcc_axisram_arcg_rst_n;
wire  rcc_fmc_arcg_rst_n;
wire  rcc_dma2d_arcg_rst_n;
wire  rcc_mdma_arcg_rst_n;
wire  rcc_ltdc_arcg_rst_n;
wire  rcc_ramecc1_arcg_rst_n;
wire  rcc_gpv_arcg_rst_n;
wire  rcc_itcm_arcg_rst_n;
wire  rcc_dtcm2_arcg_rst_n;
wire  rcc_dtcm1_arcg_rst_n;
wire  rcc_jpgdec_arcg_rst_n;
wire  rcc_sdmmc1_arcg_rst_n;
wire  rcc_wwdg1_arcg_rst_n;
wire  rcc_usb2ulpi_arcg_rst_n;
wire  rcc_usb2otg_arcg_rst_n;
wire  rcc_usb1ulpi_arcg_rst_n;
wire  rcc_usb1otg_arcg_rst_n;
wire  rcc_eth1rx_arcg_rst_n;
wire  rcc_eth1tx_arcg_rst_n;
wire  rcc_eth1mac_arcg_rst_n;
wire  rcc_adc12_arcg_rst_n;
wire  rcc_dma2_arcg_rst_n;
wire  rcc_dma1_arcg_rst_n;
wire  rcc_sram3_arcg_rst_n;
wire  rcc_sram2_arcg_rst_n;
wire  rcc_sram1_arcg_rst_n;
wire  rcc_sdmmc2_arcg_rst_n;
wire  rcc_rng_arcg_rst_n;
wire  rcc_hash_arcg_rst_n;
wire  rcc_crypt_arcg_rst_n;
wire  rcc_dcmi_arcg_rst_n;
wire  rcc_ramecc2_arcg_rst_n;
wire  rcc_uart8_arcg_rst_n;
wire  rcc_uart7_arcg_rst_n;
wire  rcc_dac12_arcg_rst_n;
wire  rcc_hdmicec_arcg_rst_n;
wire  rcc_i2c3_arcg_rst_n;
wire  rcc_i2c2_arcg_rst_n;
wire  rcc_i2c1_arcg_rst_n;
wire  rcc_uart5_arcg_rst_n;
wire  rcc_uart4_arcg_rst_n;
wire  rcc_usart3_arcg_rst_n;
wire  rcc_usart2_arcg_rst_n;
wire  rcc_spdifrx_arcg_rst_n;
wire  rcc_spi3_arcg_rst_n;
wire  rcc_spi2_arcg_rst_n;
wire  rcc_wwdg2_arcg_rst_n;
wire  rcc_lptim1_arcg_rst_n;
wire  rcc_tim14_arcg_rst_n;
wire  rcc_tim13_arcg_rst_n;
wire  rcc_tim12_arcg_rst_n;
wire  rcc_tim7_arcg_rst_n;
wire  rcc_tim6_arcg_rst_n;
wire  rcc_tim5_arcg_rst_n;
wire  rcc_tim4_arcg_rst_n;
wire  rcc_tim3_arcg_rst_n;
wire  rcc_tim2_arcg_rst_n;
wire  rcc_fdcan_arcg_rst_n;
wire  rcc_mdios_arcg_rst_n;
wire  rcc_opamp_arcg_rst_n;
wire  rcc_swpmi_arcg_rst_n;
wire  rcc_crs_arcg_rst_n;
wire  rcc_hrtim_arcg_rst_n;
wire  rcc_dfsdm1_arcg_rst_n;
wire  rcc_sai3_arcg_rst_n;
wire  rcc_sai2_arcg_rst_n;
wire  rcc_sai1_arcg_rst_n;
wire  rcc_spi5_arcg_rst_n;
wire  rcc_tim17_arcg_rst_n;
wire  rcc_tim16_arcg_rst_n;
wire  rcc_tim15_arcg_rst_n;
wire  rcc_spi4_arcg_rst_n;
wire  rcc_spi1_arcg_rst_n;
wire  rcc_usart6_arcg_rst_n;
wire  rcc_usart1_arcg_rst_n;
wire  rcc_tim8_arcg_rst_n;
wire  rcc_tim1_arcg_rst_n;
wire  rcc_sram4_arcg_rst_n;
wire  rcc_bkpram_arcg_rst_n;
wire  rcc_ramecc3_arcg_rst_n;
wire  rcc_hsem_arcg_rst_n;
wire  rcc_adc3_arcg_rst_n;
wire  rcc_bdma_arcg_rst_n;
wire  rcc_crc_arcg_rst_n;
wire  rcc_gpiok_arcg_rst_n;
wire  rcc_gpioj_arcg_rst_n;
wire  rcc_gpioi_arcg_rst_n;
wire  rcc_gpioh_arcg_rst_n;
wire  rcc_gpiog_arcg_rst_n;
wire  rcc_gpiof_arcg_rst_n;
wire  rcc_gpioe_arcg_rst_n;
wire  rcc_gpiod_arcg_rst_n;
wire  rcc_gpioc_arcg_rst_n;
wire  rcc_gpiob_arcg_rst_n;
wire  rcc_gpioa_arcg_rst_n;
wire  rcc_rcc_arcg_rst_n;
wire  rcc_pwr_arcg_rst_n;
wire  rcc_sai4_arcg_rst_n;
wire  rcc_rtc_arcg_rst_n;
wire  rcc_vref_arcg_rst_n;
wire  rcc_comp12_arcg_rst_n;
wire  rcc_lptim5_arcg_rst_n;
wire  rcc_lptim4_arcg_rst_n;
wire  rcc_lptim3_arcg_rst_n;
wire  rcc_lptim2_arcg_rst_n;
wire  rcc_i2c4_arcg_rst_n;
wire  rcc_spi6_arcg_rst_n;
wire  rcc_lpuart1_arcg_rst_n;
wire  rcc_syscfg_arcg_rst_n;
wire  rcc_iwdg2_arcg_rst_n;
wire  rcc_iwdg1_arcg_rst_n;
wire  rcc_exti_arcg_rst_n;
wire  [31:0]  ahb_hrdata;
wire  ahb_hready_out;
wire  ahb_hresp;
wire  rcc_axibridge_d1_clk;
wire  rcc_ahb3bridge_d1_clk;
wire  rcc_apb3bridge_d1_clk;
wire  rcc_ahb1bridge_d2_clk;
wire  rcc_ahb2bridge_d2_clk;
wire  rcc_apb1bridge_d2_clk;
wire  rcc_apb2bridge_d2_clk;
wire  rcc_ahb4bridge_d3_clk;
wire  rcc_apb4bridge_d3_clk;
wire  pll1_src_clk;
wire  pll2_src_clk;
wire  pll3_src_clk;
wire  pll3on;
wire  pll2on;
wire  pll1on;
wire  hsecsson;
wire  hsebyp;
wire  hseon;
wire  hsi48on;
wire  csikeron;
wire  csion;
wire  [1:0]  hsidiv;
wire  hsikeron;
wire  hsion;
wire  [7:0]  rcc_csi_triming;
wire  [11:0]  rcc_hsi_triming;
wire  divr3en;
wire  divq3en;
wire  divp3en;
wire  divr2en;
wire  divq2en;
wire  divp2en;
wire  divr1en;
wire  divq1en;
wire  divp1en;
wire  [1:0]  pll3rge;
wire  pll3vcosel;
wire  pll3fracen;
wire  [1:0]  pll2rge;
wire  pll2vcosel;
wire  pll2fracen;
wire  [1:0]  pll1rge;
wire  pll1vcosel;
wire  pll1fracen;
wire  [6:0]  divr1;
wire  [6:0]  divq1;
wire  [6:0]  divp1;
wire  [8:0]  divn1;
wire  [12:0]  fracn1;
wire  [6:0]  divr2;
wire  [6:0]  divq2;
wire  [6:0]  divp2;
wire  [8:0]  divn2;
wire  [12:0]  fracn2;
wire  [6:0]  divr3;
wire  [6:0]  divq3;
wire  [6:0]  divp3;
wire  [8:0]  divn3;
wire  [12:0]  fracn3;
wire  rcc_eth_mii_tx_clk;
wire  rcc_eth_mii_rx_clk;
wire  rcc_eth_rmii_ref_clk;
wire  rcc_c1_rsr_rmvf_wren;
wire  rcc_c2_rsr_rmvf_wren;
wire  rcc_csr_lsion_wren;
wire  rcc_bdcr_byte2_wren;
wire  rcc_bdcr_byte1_wren;
wire  rcc_bdcr_byte0_wren;
wire  nxt_rcc_bdcr_bdrst;
wire  nxt_rcc_bdcr_rtcen;
wire  [1:0]  nxt_rcc_bdcr_rtcsel;
wire  nxt_rcc_bdcr_lsecsson;
wire  [1:0]  nxt_rcc_bdcr_lsedrv;
wire  nxt_rcc_bdcr_lsebyp;
wire  nxt_rcc_bdcr_lseon;
wire  rcc_rtc_pclk;
wire  rcc_flash_aclk;
wire  rcc_flash_hclk;
wire  rcc_qspi_aclk;
wire  rcc_qspi_hclk;
wire  rcc_qspi_ker_clk;
wire  rcc_axisram_aclk;
wire  rcc_fmc_aclk;
wire  rcc_fmc_hclk;
wire  rcc_fmc_ker_clk;
wire  rcc_dma2d_aclk;
wire  rcc_dma2d_hclk;
wire  rcc_mdma_aclk;
wire  rcc_mdma_hclk;
wire  rcc_ltdc_aclk;
wire  rcc_ltdc_pclk;
wire  rcc_ltdc_ker_clk;
wire  rcc_ramecc1_hclk;
wire  rcc_gpv_hclk;
wire  rcc_itcm_hclk;
wire  rcc_dtcm2_hclk;
wire  rcc_dtcm1_hclk;
wire  rcc_jpgdec_hclk;
wire  rcc_sdmmc1_hclk;
wire  rcc_sdmmc1_ker_clk;
wire  rcc_wwdg1_pclk;
wire  rcc_usb2ulpi_hclk;
wire  rcc_usb2otg_hclk;
wire  rcc_usb2otg_ker_clk;
wire  rcc_usb1ulpi_hclk;
wire  rcc_usb1ulpi_ker_clk;
wire  rcc_usb1otg_hclk;
wire  rcc_usb1otg_ker_clk;
wire  rcc_eth1rx_hclk;
wire  rcc_eth1tx_hclk;
wire  rcc_eth1mac_hclk;
wire  rcc_adc12_hclk;
wire  rcc_adc12_ker_clk;
wire  rcc_dma2_hclk;
wire  rcc_dma1_hclk;
wire  rcc_sram3_hclk;
wire  rcc_sram2_hclk;
wire  rcc_sram1_hclk;
wire  rcc_sdmmc2_hclk;
wire  rcc_sdmmc2_ker_clk;
wire  rcc_rng_hclk;
wire  rcc_rng_ker_clk;
wire  rcc_hash_hclk;
wire  rcc_crypt_hclk;
wire  rcc_dcmi_hclk;
wire  rcc_ramecc2_hclk;
wire  rcc_uart8_pclk;
wire  rcc_uart8_ker_clk;
wire  rcc_uart7_pclk;
wire  rcc_uart7_ker_clk;
wire  rcc_dac12_pclk;
wire  rcc_hdmicec_pclk;
wire  rcc_hdmicec_ker_clk;
wire  rcc_i2c3_pclk;
wire  rcc_i2c3_ker_clk;
wire  rcc_i2c2_pclk;
wire  rcc_i2c2_ker_clk;
wire  rcc_i2c1_pclk;
wire  rcc_i2c1_ker_clk;
wire  rcc_uart5_pclk;
wire  rcc_uart5_ker_clk;
wire  rcc_uart4_pclk;
wire  rcc_uart4_ker_clk;
wire  rcc_usart3_pclk;
wire  rcc_usart3_ker_clk;
wire  rcc_usart2_pclk;
wire  rcc_usart2_ker_clk;
wire  rcc_spdifrx_pclk;
wire  rcc_spdifrx_ker_clk;
wire  rcc_spi3_pclk;
wire  rcc_spi3_ker_clk;
wire  rcc_spi2_pclk;
wire  rcc_spi2_ker_clk;
wire  rcc_wwdg2_pclk;
wire  rcc_lptim1_pclk;
wire  rcc_lptim1_ker_clk;
wire  rcc_tim14_pclk;
wire  rcc_tim14_ker_clk;
wire  rcc_tim13_pclk;
wire  rcc_tim13_ker_clk;
wire  rcc_tim12_pclk;
wire  rcc_tim12_ker_clk;
wire  rcc_tim7_pclk;
wire  rcc_tim7_ker_clk;
wire  rcc_tim6_pclk;
wire  rcc_tim6_ker_clk;
wire  rcc_tim5_pclk;
wire  rcc_tim5_ker_clk;
wire  rcc_tim4_pclk;
wire  rcc_tim4_ker_clk;
wire  rcc_tim3_pclk;
wire  rcc_tim3_ker_clk;
wire  rcc_tim2_pclk;
wire  rcc_tim2_ker_clk;
wire  rcc_fdcan_pclk;
wire  rcc_fdcan_ker_clk;
wire  rcc_mdios_pclk;
wire  rcc_opamp_pclk;
wire  rcc_swpmi_pclk;
wire  rcc_swpmi_ker_clk;
wire  rcc_crs_pclk;
wire  rcc_hrtim_pclk;
wire  rcc_hrtim_ker_clk;
wire  rcc_dfsdm1_pclk;
wire  rcc_dfsdm1_ker_clk_0;
wire  rcc_dfsdm1_ker_clk_1;
wire  rcc_sai3_pclk;
wire  rcc_sai3_ker_clk;
wire  rcc_sai2_pclk;
wire  rcc_sai2_ker_clk;
wire  rcc_sai1_pclk;
wire  rcc_sai1_ker_clk;
wire  rcc_spi5_pclk;
wire  rcc_spi5_ker_clk;
wire  rcc_tim17_pclk;
wire  rcc_tim17_ker_clk;
wire  rcc_tim16_pclk;
wire  rcc_tim16_ker_clk;
wire  rcc_tim15_pclk;
wire  rcc_tim15_ker_clk;
wire  rcc_spi4_pclk;
wire  rcc_spi4_ker_clk;
wire  rcc_spi1_pclk;
wire  rcc_spi1_ker_clk;
wire  rcc_usart6_pclk;
wire  rcc_usart6_ker_clk;
wire  rcc_usart1_pclk;
wire  rcc_usart1_ker_clk;
wire  rcc_tim8_pclk;
wire  rcc_tim8_ker_clk;
wire  rcc_tim1_pclk;
wire  rcc_tim1_ker_clk;
wire  rcc_sram4_hclk;
wire  rcc_bkpram_hclk;
wire  rcc_ramecc3_hclk;
wire  rcc_hsem_hclk;
wire  rcc_adc3_hclk;
wire  rcc_adc3_ker_clk;
wire  rcc_bdma_hclk;
wire  rcc_crc_hclk;
wire  rcc_gpiok_hclk;
wire  rcc_gpioj_hclk;
wire  rcc_gpioi_hclk;
wire  rcc_gpioh_hclk;
wire  rcc_gpiog_hclk;
wire  rcc_gpiof_hclk;
wire  rcc_gpioe_hclk;
wire  rcc_gpiod_hclk;
wire  rcc_gpioc_hclk;
wire  rcc_gpiob_hclk;
wire  rcc_gpioa_hclk;
wire  rcc_rcc_hclk;
wire  rcc_pwr_hclk;
wire  rcc_sai4_pclk;
wire  rcc_sai4_ker_clk_0;
wire  rcc_sai4_ker_clk_1;
wire  rcc_vref_pclk;
wire  rcc_comp12_pclk;
wire  rcc_lptim5_pclk;
wire  rcc_lptim5_ker_clk;
wire  rcc_lptim4_pclk;
wire  rcc_lptim4_ker_clk;
wire  rcc_lptim3_pclk;
wire  rcc_lptim3_ker_clk;
wire  rcc_lptim2_pclk;
wire  rcc_lptim2_ker_clk;
wire  rcc_i2c4_pclk;
wire  rcc_i2c4_ker_clk;
wire  rcc_spi6_pclk;
wire  rcc_spi6_ker_clk;
wire  rcc_lpuart1_pclk;
wire  rcc_lpuart1_ker_clk;
wire  rcc_syscfg_pclk;
wire  rcc_iwdg2_pclk;
wire  rcc_iwdg1_pclk;
wire  rcc_exti_pclk;

rcc_vcore_top #(
    .CLK_ON_AFTER_PER_RST_RELEASE  ( 8 ),
    .CLK_ON_AFTER_SYS_RST_RELEASE  ( 8 ),
    .CLK_ON_AFTER_D1_RST_RELEASE   ( 8 ),
    .CLK_ON_AFTER_D2_RST_RELEASE   ( 8 ),
    .CLK_ON_AFTER_CPU1_RST_RELEASE ( 8 ),
    .CLK_ON_AFTER_CPU2_RST_RELEASE ( 8 ))
 u_rcc_vcore_top (
    .nrst_in                    ( nrst_in                     ),
    .iwdg1_out_rst              ( iwdg1_out_rst               ),
    .wwdg1_out_rst              ( wwdg1_out_rst               ),
    .iwdg2_out_rst              ( iwdg2_out_rst               ),
    .wwdg2_out_rst              ( wwdg2_out_rst               ),
    .lpwr2_rst                  ( lpwr2_rst                   ),
    .lpwr1_rst                  ( lpwr1_rst                   ),
    .pwr_bor_rst                ( pwr_bor_rst                 ),
    .pwr_por_rst                ( pwr_por_rst                 ),
    .cpu2_sftrst                ( cpu2_sftrst                 ),
    .cpu1_sftrst                ( cpu1_sftrst                 ),
    .d3_deepsleep               ( d3_deepsleep                ),
    .pwr_d1_wkup                ( pwr_d1_wkup                 ),
    .pwr_d2_wkup                ( pwr_d2_wkup                 ),
    .pwr_d3_wkup                ( pwr_d3_wkup                 ),
    .flash_power_ok             ( flash_power_ok              ),
    .pwr_d1_ok                  ( pwr_d1_ok                   ),
    .pwr_d2_ok                  ( pwr_d2_ok                   ),
    .pwr_vcore_ok               ( pwr_vcore_ok                ),
    .backup_protect             ( backup_protect              ),
    .c2_sleep                   ( c2_sleep                    ),
    .c2_deepsleep               ( c2_deepsleep                ),
    .c1_sleep                   ( c1_sleep                    ),
    .c1_deepsleep               ( c1_deepsleep                ),
    .pad_rcc_eth_mii_tx_clk     ( pad_rcc_eth_mii_tx_clk      ),
    .pad_rcc_eth_mii_rx_clk     ( pad_rcc_eth_mii_rx_clk      ),
    .USB_PHY1                   ( USB_PHY1                    ),
    .flash_obl_reload           ( flash_obl_reload            ),
    .obl_done                   ( obl_done                    ),
    .rcc_arcg_on                ( rcc_arcg_on                 ),
    .pll3_rdy                   ( pll3_rdy                    ),
    .pll2_rdy                   ( pll2_rdy                    ),
    .pll1_rdy                   ( pll1_rdy                    ),
    .hse_rdy                    ( hse_rdy                     ),
    .hsi48_rdy                  ( hsi48_rdy                   ),
    .csi_rdy                    ( csi_rdy                     ),
    .hsi_rdy                    ( hsi_rdy                     ),
    .flash_csi_opt              ( flash_csi_opt               ),
    .flash_hsi_opt              ( flash_hsi_opt               ),
    .crs_hsi48_trim             ( crs_hsi48_trim              ),
    .rcc_hsecss_fail            ( rcc_hsecss_fail             ),
    .rcc_lsecss_fail            ( rcc_lsecss_fail             ),
    .ahb_hclk                   ( ahb_hclk                    ),
    .ahb_hresetn                ( ahb_hresetn                 ),
    .ahb_haddr                  ( ahb_haddr                   ),
    .ahb_hburst                 ( ahb_hburst                  ),
    .ahb_hprot                  ( ahb_hprot                   ),
    .ahb_hready_in              ( ahb_hready_in               ),
    .ahb_hsize                  ( ahb_hsize                   ),
    .ahb_htrans                 ( ahb_htrans                  ),
    .ahb_hwdata                 ( ahb_hwdata                  ),
    .ahb_hwrite                 ( ahb_hwrite                  ),
    .ahb_hsel                   ( ahb_hsel                    ),
    .ahb_hmaster                ( ahb_hmaster                 ),
    .uart8_ker_clk_req          ( uart8_ker_clk_req           ),
    .uart7_ker_clk_req          ( uart7_ker_clk_req           ),
    .i2c3_ker_clk_req           ( i2c3_ker_clk_req            ),
    .i2c2_ker_clk_req           ( i2c2_ker_clk_req            ),
    .i2c1_ker_clk_req           ( i2c1_ker_clk_req            ),
    .uart5_ker_clk_req          ( uart5_ker_clk_req           ),
    .uart4_ker_clk_req          ( uart4_ker_clk_req           ),
    .usart3_ker_clk_req         ( usart3_ker_clk_req          ),
    .usart2_ker_clk_req         ( usart2_ker_clk_req          ),
    .usart6_ker_clk_req         ( usart6_ker_clk_req          ),
    .usart1_ker_clk_req         ( usart1_ker_clk_req          ),
    .i2c4_ker_clk_req           ( i2c4_ker_clk_req            ),
    .lpuart1_ker_clk_req        ( lpuart1_ker_clk_req         ),
    .pll1_p_clk                 ( pll1_p_clk                  ),
    .pll1_q_clk                 ( pll1_q_clk                  ),
    .pll2_p_clk                 ( pll2_p_clk                  ),
    .pll2_q_clk                 ( pll2_q_clk                  ),
    .pll2_r_clk                 ( pll2_r_clk                  ),
    .pll3_p_clk                 ( pll3_p_clk                  ),
    .pll3_q_clk                 ( pll3_q_clk                  ),
    .pll3_r_clk                 ( pll3_r_clk                  ),
    .I2S_clk_IN                 ( I2S_clk_IN                  ),
    .axibridge_d1_busy          ( axibridge_d1_busy           ),
    .ahb3bridge_d1_busy         ( ahb3bridge_d1_busy          ),
    .apb3bridge_d1_busy         ( apb3bridge_d1_busy          ),
    .ahb1bridge_d2_busy         ( ahb1bridge_d2_busy          ),
    .ahb2bridge_d2_busy         ( ahb2bridge_d2_busy          ),
    .apb1bridge_d2_busy         ( apb1bridge_d2_busy          ),
    .apb2bridge_d2_busy         ( apb2bridge_d2_busy          ),
    .ahb4bridge_d3_busy         ( ahb4bridge_d3_busy          ),
    .apb4bridge_d3_busy         ( apb4bridge_d3_busy          ),
    .flash_busy                 ( flash_busy                  ),
    .hse_css_fail               ( hse_css_fail                ),
    .hse_clk_pre                ( hse_clk_pre                 ),
    .lse_clk                    ( lse_clk                     ),
    .lsi_clk                    ( lsi_clk                     ),
    .hsi48_clk                  ( hsi48_clk                   ),
    .csi_clk_pre                ( csi_clk_pre                 ),
    .hsi_origin_clk             ( hsi_origin_clk              ),
    .eth_rcc_fes                ( eth_rcc_fes                 ),
    .eth_rcc_epis_2             ( eth_rcc_epis_2              ),
    .cur_rcc_bdcr_bdrst         ( cur_rcc_bdcr_bdrst          ),
    .cur_rcc_bdcr_rtcen         ( cur_rcc_bdcr_rtcen          ),
    .cur_rcc_bdcr_rtcsel        ( cur_rcc_bdcr_rtcsel         ),
    .cur_rcc_bdcr_lsecssd       ( cur_rcc_bdcr_lsecssd        ),
    .cur_rcc_bdcr_lsecsson      ( cur_rcc_bdcr_lsecsson       ),
    .cur_rcc_bdcr_lsedrv        ( cur_rcc_bdcr_lsedrv         ),
    .cur_rcc_bdcr_lsebyp        ( cur_rcc_bdcr_lsebyp         ),
    .cur_rcc_bdcr_lserdy        ( cur_rcc_bdcr_lserdy         ),
    .cur_rcc_bdcr_lseon         ( cur_rcc_bdcr_lseon          ),
    .cur_rcc_c1_rsr_lpwr2rstf   ( cur_rcc_c1_rsr_lpwr2rstf    ),
    .cur_rcc_c1_rsr_lpwr1rstf   ( cur_rcc_c1_rsr_lpwr1rstf    ),
    .cur_rcc_c1_rsr_wwdg2rstf   ( cur_rcc_c1_rsr_wwdg2rstf    ),
    .cur_rcc_c1_rsr_wwdg1rstf   ( cur_rcc_c1_rsr_wwdg1rstf    ),
    .cur_rcc_c1_rsr_iwdg2rstf   ( cur_rcc_c1_rsr_iwdg2rstf    ),
    .cur_rcc_c1_rsr_iwdg1rstf   ( cur_rcc_c1_rsr_iwdg1rstf    ),
    .cur_rcc_c1_rsr_sft2rstf    ( cur_rcc_c1_rsr_sft2rstf     ),
    .cur_rcc_c1_rsr_sft1rstf    ( cur_rcc_c1_rsr_sft1rstf     ),
    .cur_rcc_c1_rsr_porrstf     ( cur_rcc_c1_rsr_porrstf      ),
    .cur_rcc_c1_rsr_pinrstf     ( cur_rcc_c1_rsr_pinrstf      ),
    .cur_rcc_c1_rsr_borrstf     ( cur_rcc_c1_rsr_borrstf      ),
    .cur_rcc_c1_rsr_d2rstf      ( cur_rcc_c1_rsr_d2rstf       ),
    .cur_rcc_c1_rsr_d1rstf      ( cur_rcc_c1_rsr_d1rstf       ),
    .cur_rcc_c1_rsr_oblrstf     ( cur_rcc_c1_rsr_oblrstf      ),
    .cur_rcc_c1_rsr_rmvf        ( cur_rcc_c1_rsr_rmvf         ),
    .cur_rcc_c2_rsr_lpwr2rstf   ( cur_rcc_c2_rsr_lpwr2rstf    ),
    .cur_rcc_c2_rsr_lpwr1rstf   ( cur_rcc_c2_rsr_lpwr1rstf    ),
    .cur_rcc_c2_rsr_wwdg2rstf   ( cur_rcc_c2_rsr_wwdg2rstf    ),
    .cur_rcc_c2_rsr_wwdg1rstf   ( cur_rcc_c2_rsr_wwdg1rstf    ),
    .cur_rcc_c2_rsr_iwdg2rstf   ( cur_rcc_c2_rsr_iwdg2rstf    ),
    .cur_rcc_c2_rsr_iwdg1rstf   ( cur_rcc_c2_rsr_iwdg1rstf    ),
    .cur_rcc_c2_rsr_sft2rstf    ( cur_rcc_c2_rsr_sft2rstf     ),
    .cur_rcc_c2_rsr_sft1rstf    ( cur_rcc_c2_rsr_sft1rstf     ),
    .cur_rcc_c2_rsr_porrstf     ( cur_rcc_c2_rsr_porrstf      ),
    .cur_rcc_c2_rsr_pinrstf     ( cur_rcc_c2_rsr_pinrstf      ),
    .cur_rcc_c2_rsr_borrstf     ( cur_rcc_c2_rsr_borrstf      ),
    .cur_rcc_c2_rsr_d2rstf      ( cur_rcc_c2_rsr_d2rstf       ),
    .cur_rcc_c2_rsr_d1rstf      ( cur_rcc_c2_rsr_d1rstf       ),
    .cur_rcc_c2_rsr_oblrstf     ( cur_rcc_c2_rsr_oblrstf      ),
    .cur_rcc_c2_rsr_rmvf        ( cur_rcc_c2_rsr_rmvf         ),
    .cur_rcc_csr_lsirdy         ( cur_rcc_csr_lsirdy          ),
    .cur_rcc_csr_lsion          ( cur_rcc_csr_lsion           ),

    .nrst_out                   ( nrst_out                    ),
    .rcc_pwr_d1_req             ( rcc_pwr_d1_req              ),
    .rcc_pwr_d2_req             ( rcc_pwr_d2_req              ),
    .rcc_pwr_d3_req             ( rcc_pwr_d3_req              ),
    .c2_per_alloc_d1            ( c2_per_alloc_d1             ),
    .c1_per_alloc_d2            ( c1_per_alloc_d2             ),
    .rcc_c2_clk                 ( rcc_c2_clk                  ),
    .rcc_fclk_c2                ( rcc_fclk_c2                 ),
    .rcc_c2_systick_clk         ( rcc_c2_systick_clk          ),
    .rcc_c1_clk                 ( rcc_c1_clk                  ),
    .rcc_fclk_c1                ( rcc_fclk_c1                 ),
    .rcc_c1_systick_clk         ( rcc_c1_systick_clk          ),
    .cpu1_arcg_rst_n            ( cpu1_arcg_rst_n             ),
    .cpu2_arcg_rst_n            ( cpu2_arcg_rst_n             ),
    .d1_bus_arcg_rst_n          ( d1_bus_arcg_rst_n           ),
    .d2_bus_arcg_rst_n          ( d2_bus_arcg_rst_n           ),
    .d3_bus_arcg_rst_n          ( d3_bus_arcg_rst_n           ),
    .rcc_timx_ker_clk           ( rcc_timx_ker_clk            ),
    .rcc_timy_ker_clk           ( rcc_timy_ker_clk            ),
    .rcc_hrtimer_prescalar_clk  ( rcc_hrtimer_prescalar_clk   ),
    .sys_d1cpre_clk             ( sys_d1cpre_clk              ),
    .sys_hpre_clk               ( sys_hpre_clk                ),
    .hse_rtc_clk                ( hse_rtc_clk                 ),
    .mco1                       ( mco1                        ),
    .mco2                       ( mco2                        ),
    .rcc_hsefail_it             ( rcc_hsefail_it              ),
    .rcc_lsefail_it             ( rcc_lsefail_it              ),
    .rcc_it                     ( rcc_it                      ),
    .pwr_por_rst_n              ( pwr_por_rst_n               ),
    .sys_arcg_rst_n             ( sys_arcg_rst_n              ),
    .d1_arcg_rst_n              ( d1_arcg_rst_n               ),
    .d2_arcg_rst_n              ( d2_arcg_rst_n               ),
    .stby_rst_n                 ( stby_rst_n                  ),
    .rcc_flash_arcg_rst_n       ( rcc_flash_arcg_rst_n        ),
    .rcc_qspi_arcg_rst_n        ( rcc_qspi_arcg_rst_n         ),
    .rcc_axisram_arcg_rst_n     ( rcc_axisram_arcg_rst_n      ),
    .rcc_fmc_arcg_rst_n         ( rcc_fmc_arcg_rst_n          ),
    .rcc_dma2d_arcg_rst_n       ( rcc_dma2d_arcg_rst_n        ),
    .rcc_mdma_arcg_rst_n        ( rcc_mdma_arcg_rst_n         ),
    .rcc_ltdc_arcg_rst_n        ( rcc_ltdc_arcg_rst_n         ),
    .rcc_ramecc1_arcg_rst_n     ( rcc_ramecc1_arcg_rst_n      ),
    .rcc_gpv_arcg_rst_n         ( rcc_gpv_arcg_rst_n          ),
    .rcc_itcm_arcg_rst_n        ( rcc_itcm_arcg_rst_n         ),
    .rcc_dtcm2_arcg_rst_n       ( rcc_dtcm2_arcg_rst_n        ),
    .rcc_dtcm1_arcg_rst_n       ( rcc_dtcm1_arcg_rst_n        ),
    .rcc_jpgdec_arcg_rst_n      ( rcc_jpgdec_arcg_rst_n       ),
    .rcc_sdmmc1_arcg_rst_n      ( rcc_sdmmc1_arcg_rst_n       ),
    .rcc_wwdg1_arcg_rst_n       ( rcc_wwdg1_arcg_rst_n        ),
    .rcc_usb2ulpi_arcg_rst_n    ( rcc_usb2ulpi_arcg_rst_n     ),
    .rcc_usb2otg_arcg_rst_n     ( rcc_usb2otg_arcg_rst_n      ),
    .rcc_usb1ulpi_arcg_rst_n    ( rcc_usb1ulpi_arcg_rst_n     ),
    .rcc_usb1otg_arcg_rst_n     ( rcc_usb1otg_arcg_rst_n      ),
    .rcc_eth1rx_arcg_rst_n      ( rcc_eth1rx_arcg_rst_n       ),
    .rcc_eth1tx_arcg_rst_n      ( rcc_eth1tx_arcg_rst_n       ),
    .rcc_eth1mac_arcg_rst_n     ( rcc_eth1mac_arcg_rst_n      ),
    .rcc_adc12_arcg_rst_n       ( rcc_adc12_arcg_rst_n        ),
    .rcc_dma2_arcg_rst_n        ( rcc_dma2_arcg_rst_n         ),
    .rcc_dma1_arcg_rst_n        ( rcc_dma1_arcg_rst_n         ),
    .rcc_sram3_arcg_rst_n       ( rcc_sram3_arcg_rst_n        ),
    .rcc_sram2_arcg_rst_n       ( rcc_sram2_arcg_rst_n        ),
    .rcc_sram1_arcg_rst_n       ( rcc_sram1_arcg_rst_n        ),
    .rcc_sdmmc2_arcg_rst_n      ( rcc_sdmmc2_arcg_rst_n       ),
    .rcc_rng_arcg_rst_n         ( rcc_rng_arcg_rst_n          ),
    .rcc_hash_arcg_rst_n        ( rcc_hash_arcg_rst_n         ),
    .rcc_crypt_arcg_rst_n       ( rcc_crypt_arcg_rst_n        ),
    .rcc_dcmi_arcg_rst_n        ( rcc_dcmi_arcg_rst_n         ),
    .rcc_ramecc2_arcg_rst_n     ( rcc_ramecc2_arcg_rst_n      ),
    .rcc_uart8_arcg_rst_n       ( rcc_uart8_arcg_rst_n        ),
    .rcc_uart7_arcg_rst_n       ( rcc_uart7_arcg_rst_n        ),
    .rcc_dac12_arcg_rst_n       ( rcc_dac12_arcg_rst_n        ),
    .rcc_hdmicec_arcg_rst_n     ( rcc_hdmicec_arcg_rst_n      ),
    .rcc_i2c3_arcg_rst_n        ( rcc_i2c3_arcg_rst_n         ),
    .rcc_i2c2_arcg_rst_n        ( rcc_i2c2_arcg_rst_n         ),
    .rcc_i2c1_arcg_rst_n        ( rcc_i2c1_arcg_rst_n         ),
    .rcc_uart5_arcg_rst_n       ( rcc_uart5_arcg_rst_n        ),
    .rcc_uart4_arcg_rst_n       ( rcc_uart4_arcg_rst_n        ),
    .rcc_usart3_arcg_rst_n      ( rcc_usart3_arcg_rst_n       ),
    .rcc_usart2_arcg_rst_n      ( rcc_usart2_arcg_rst_n       ),
    .rcc_spdifrx_arcg_rst_n     ( rcc_spdifrx_arcg_rst_n      ),
    .rcc_spi3_arcg_rst_n        ( rcc_spi3_arcg_rst_n         ),
    .rcc_spi2_arcg_rst_n        ( rcc_spi2_arcg_rst_n         ),
    .rcc_wwdg2_arcg_rst_n       ( rcc_wwdg2_arcg_rst_n        ),
    .rcc_lptim1_arcg_rst_n      ( rcc_lptim1_arcg_rst_n       ),
    .rcc_tim14_arcg_rst_n       ( rcc_tim14_arcg_rst_n        ),
    .rcc_tim13_arcg_rst_n       ( rcc_tim13_arcg_rst_n        ),
    .rcc_tim12_arcg_rst_n       ( rcc_tim12_arcg_rst_n        ),
    .rcc_tim7_arcg_rst_n        ( rcc_tim7_arcg_rst_n         ),
    .rcc_tim6_arcg_rst_n        ( rcc_tim6_arcg_rst_n         ),
    .rcc_tim5_arcg_rst_n        ( rcc_tim5_arcg_rst_n         ),
    .rcc_tim4_arcg_rst_n        ( rcc_tim4_arcg_rst_n         ),
    .rcc_tim3_arcg_rst_n        ( rcc_tim3_arcg_rst_n         ),
    .rcc_tim2_arcg_rst_n        ( rcc_tim2_arcg_rst_n         ),
    .rcc_fdcan_arcg_rst_n       ( rcc_fdcan_arcg_rst_n        ),
    .rcc_mdios_arcg_rst_n       ( rcc_mdios_arcg_rst_n        ),
    .rcc_opamp_arcg_rst_n       ( rcc_opamp_arcg_rst_n        ),
    .rcc_swpmi_arcg_rst_n       ( rcc_swpmi_arcg_rst_n        ),
    .rcc_crs_arcg_rst_n         ( rcc_crs_arcg_rst_n          ),
    .rcc_hrtim_arcg_rst_n       ( rcc_hrtim_arcg_rst_n        ),
    .rcc_dfsdm1_arcg_rst_n      ( rcc_dfsdm1_arcg_rst_n       ),
    .rcc_sai3_arcg_rst_n        ( rcc_sai3_arcg_rst_n         ),
    .rcc_sai2_arcg_rst_n        ( rcc_sai2_arcg_rst_n         ),
    .rcc_sai1_arcg_rst_n        ( rcc_sai1_arcg_rst_n         ),
    .rcc_spi5_arcg_rst_n        ( rcc_spi5_arcg_rst_n         ),
    .rcc_tim17_arcg_rst_n       ( rcc_tim17_arcg_rst_n        ),
    .rcc_tim16_arcg_rst_n       ( rcc_tim16_arcg_rst_n        ),
    .rcc_tim15_arcg_rst_n       ( rcc_tim15_arcg_rst_n        ),
    .rcc_spi4_arcg_rst_n        ( rcc_spi4_arcg_rst_n         ),
    .rcc_spi1_arcg_rst_n        ( rcc_spi1_arcg_rst_n         ),
    .rcc_usart6_arcg_rst_n      ( rcc_usart6_arcg_rst_n       ),
    .rcc_usart1_arcg_rst_n      ( rcc_usart1_arcg_rst_n       ),
    .rcc_tim8_arcg_rst_n        ( rcc_tim8_arcg_rst_n         ),
    .rcc_tim1_arcg_rst_n        ( rcc_tim1_arcg_rst_n         ),
    .rcc_sram4_arcg_rst_n       ( rcc_sram4_arcg_rst_n        ),
    .rcc_bkpram_arcg_rst_n      ( rcc_bkpram_arcg_rst_n       ),
    .rcc_ramecc3_arcg_rst_n     ( rcc_ramecc3_arcg_rst_n      ),
    .rcc_hsem_arcg_rst_n        ( rcc_hsem_arcg_rst_n         ),
    .rcc_adc3_arcg_rst_n        ( rcc_adc3_arcg_rst_n         ),
    .rcc_bdma_arcg_rst_n        ( rcc_bdma_arcg_rst_n         ),
    .rcc_crc_arcg_rst_n         ( rcc_crc_arcg_rst_n          ),
    .rcc_gpiok_arcg_rst_n       ( rcc_gpiok_arcg_rst_n        ),
    .rcc_gpioj_arcg_rst_n       ( rcc_gpioj_arcg_rst_n        ),
    .rcc_gpioi_arcg_rst_n       ( rcc_gpioi_arcg_rst_n        ),
    .rcc_gpioh_arcg_rst_n       ( rcc_gpioh_arcg_rst_n        ),
    .rcc_gpiog_arcg_rst_n       ( rcc_gpiog_arcg_rst_n        ),
    .rcc_gpiof_arcg_rst_n       ( rcc_gpiof_arcg_rst_n        ),
    .rcc_gpioe_arcg_rst_n       ( rcc_gpioe_arcg_rst_n        ),
    .rcc_gpiod_arcg_rst_n       ( rcc_gpiod_arcg_rst_n        ),
    .rcc_gpioc_arcg_rst_n       ( rcc_gpioc_arcg_rst_n        ),
    .rcc_gpiob_arcg_rst_n       ( rcc_gpiob_arcg_rst_n        ),
    .rcc_gpioa_arcg_rst_n       ( rcc_gpioa_arcg_rst_n        ),
    .rcc_rcc_arcg_rst_n         ( rcc_rcc_arcg_rst_n          ),
    .rcc_pwr_arcg_rst_n         ( rcc_pwr_arcg_rst_n          ),
    .rcc_sai4_arcg_rst_n        ( rcc_sai4_arcg_rst_n         ),
    .rcc_rtc_arcg_rst_n         ( rcc_rtc_arcg_rst_n          ),
    .rcc_vref_arcg_rst_n        ( rcc_vref_arcg_rst_n         ),
    .rcc_comp12_arcg_rst_n      ( rcc_comp12_arcg_rst_n       ),
    .rcc_lptim5_arcg_rst_n      ( rcc_lptim5_arcg_rst_n       ),
    .rcc_lptim4_arcg_rst_n      ( rcc_lptim4_arcg_rst_n       ),
    .rcc_lptim3_arcg_rst_n      ( rcc_lptim3_arcg_rst_n       ),
    .rcc_lptim2_arcg_rst_n      ( rcc_lptim2_arcg_rst_n       ),
    .rcc_i2c4_arcg_rst_n        ( rcc_i2c4_arcg_rst_n         ),
    .rcc_spi6_arcg_rst_n        ( rcc_spi6_arcg_rst_n         ),
    .rcc_lpuart1_arcg_rst_n     ( rcc_lpuart1_arcg_rst_n      ),
    .rcc_syscfg_arcg_rst_n      ( rcc_syscfg_arcg_rst_n       ),
    .rcc_iwdg2_arcg_rst_n       ( rcc_iwdg2_arcg_rst_n        ),
    .rcc_iwdg1_arcg_rst_n       ( rcc_iwdg1_arcg_rst_n        ),
    .rcc_exti_arcg_rst_n        ( rcc_exti_arcg_rst_n         ),
    .ahb_hrdata                 ( ahb_hrdata                  ),
    .ahb_hready_out             ( ahb_hready_out              ),
    .ahb_hresp                  ( ahb_hresp                   ),
    .rcc_axibridge_d1_clk       ( rcc_axibridge_d1_clk        ),
    .rcc_ahb3bridge_d1_clk      ( rcc_ahb3bridge_d1_clk       ),
    .rcc_apb3bridge_d1_clk      ( rcc_apb3bridge_d1_clk       ),
    .rcc_ahb1bridge_d2_clk      ( rcc_ahb1bridge_d2_clk       ),
    .rcc_ahb2bridge_d2_clk      ( rcc_ahb2bridge_d2_clk       ),
    .rcc_apb1bridge_d2_clk      ( rcc_apb1bridge_d2_clk       ),
    .rcc_apb2bridge_d2_clk      ( rcc_apb2bridge_d2_clk       ),
    .rcc_ahb4bridge_d3_clk      ( rcc_ahb4bridge_d3_clk       ),
    .rcc_apb4bridge_d3_clk      ( rcc_apb4bridge_d3_clk       ),
    .pll1_src_clk               ( pll1_src_clk                ),
    .pll2_src_clk               ( pll2_src_clk                ),
    .pll3_src_clk               ( pll3_src_clk                ),
    .pll3on                     ( pll3on                      ),
    .pll2on                     ( pll2on                      ),
    .pll1on                     ( pll1on                      ),
    .hsecsson                   ( hsecsson                    ),
    .hsebyp                     ( hsebyp                      ),
    .hseon                      ( hseon                       ),
    .hsi48on                    ( hsi48on                     ),
    .csikeron                   ( csikeron                    ),
    .csion                      ( csion                       ),
    .hsidiv                     ( hsidiv                      ),
    .hsikeron                   ( hsikeron                    ),
    .hsion                      ( hsion                       ),
    .rcc_csi_triming            ( rcc_csi_triming             ),
    .rcc_hsi_triming            ( rcc_hsi_triming             ),
    .divr3en                    ( divr3en                     ),
    .divq3en                    ( divq3en                     ),
    .divp3en                    ( divp3en                     ),
    .divr2en                    ( divr2en                     ),
    .divq2en                    ( divq2en                     ),
    .divp2en                    ( divp2en                     ),
    .divr1en                    ( divr1en                     ),
    .divq1en                    ( divq1en                     ),
    .divp1en                    ( divp1en                     ),
    .pll3rge                    ( pll3rge                     ),
    .pll3vcosel                 ( pll3vcosel                  ),
    .pll3fracen                 ( pll3fracen                  ),
    .pll2rge                    ( pll2rge                     ),
    .pll2vcosel                 ( pll2vcosel                  ),
    .pll2fracen                 ( pll2fracen                  ),
    .pll1rge                    ( pll1rge                     ),
    .pll1vcosel                 ( pll1vcosel                  ),
    .pll1fracen                 ( pll1fracen                  ),
    .divr1                      ( divr1                       ),
    .divq1                      ( divq1                       ),
    .divp1                      ( divp1                       ),
    .divn1                      ( divn1                       ),
    .fracn1                     ( fracn1                      ),
    .divr2                      ( divr2                       ),
    .divq2                      ( divq2                       ),
    .divp2                      ( divp2                       ),
    .divn2                      ( divn2                       ),
    .fracn2                     ( fracn2                      ),
    .divr3                      ( divr3                       ),
    .divq3                      ( divq3                       ),
    .divp3                      ( divp3                       ),
    .divn3                      ( divn3                       ),
    .fracn3                     ( fracn3                      ),
    .rcc_eth_mii_tx_clk         ( rcc_eth_mii_tx_clk          ),
    .rcc_eth_mii_rx_clk         ( rcc_eth_mii_rx_clk          ),
    .rcc_eth_rmii_ref_clk       ( rcc_eth_rmii_ref_clk        ),
    .rcc_c1_rsr_rmvf_wren       ( rcc_c1_rsr_rmvf_wren        ),
    .rcc_c2_rsr_rmvf_wren       ( rcc_c2_rsr_rmvf_wren        ),
    .rcc_csr_lsion_wren         ( rcc_csr_lsion_wren          ),
    .rcc_bdcr_byte2_wren        ( rcc_bdcr_byte2_wren         ),
    .rcc_bdcr_byte1_wren        ( rcc_bdcr_byte1_wren         ),
    .rcc_bdcr_byte0_wren        ( rcc_bdcr_byte0_wren         ),
    .nxt_rcc_bdcr_bdrst         ( nxt_rcc_bdcr_bdrst          ),
    .nxt_rcc_bdcr_rtcen         ( nxt_rcc_bdcr_rtcen          ),
    .nxt_rcc_bdcr_rtcsel        ( nxt_rcc_bdcr_rtcsel         ),
    .nxt_rcc_bdcr_lsecsson      ( nxt_rcc_bdcr_lsecsson       ),
    .nxt_rcc_bdcr_lsedrv        ( nxt_rcc_bdcr_lsedrv         ),
    .nxt_rcc_bdcr_lsebyp        ( nxt_rcc_bdcr_lsebyp         ),
    .nxt_rcc_bdcr_lseon         ( nxt_rcc_bdcr_lseon          ),
    .rcc_rtc_pclk               ( rcc_rtc_pclk                ),
    .rcc_flash_aclk             ( rcc_flash_aclk              ),
    .rcc_flash_hclk             ( rcc_flash_hclk              ),
    .rcc_qspi_aclk              ( rcc_qspi_aclk               ),
    .rcc_qspi_hclk              ( rcc_qspi_hclk               ),
    .rcc_qspi_ker_clk           ( rcc_qspi_ker_clk            ),
    .rcc_axisram_aclk           ( rcc_axisram_aclk            ),
    .rcc_fmc_aclk               ( rcc_fmc_aclk                ),
    .rcc_fmc_hclk               ( rcc_fmc_hclk                ),
    .rcc_fmc_ker_clk            ( rcc_fmc_ker_clk             ),
    .rcc_dma2d_aclk             ( rcc_dma2d_aclk              ),
    .rcc_dma2d_hclk             ( rcc_dma2d_hclk              ),
    .rcc_mdma_aclk              ( rcc_mdma_aclk               ),
    .rcc_mdma_hclk              ( rcc_mdma_hclk               ),
    .rcc_ltdc_aclk              ( rcc_ltdc_aclk               ),
    .rcc_ltdc_pclk              ( rcc_ltdc_pclk               ),
    .rcc_ltdc_ker_clk           ( rcc_ltdc_ker_clk            ),
    .rcc_ramecc1_hclk           ( rcc_ramecc1_hclk            ),
    .rcc_gpv_hclk               ( rcc_gpv_hclk                ),
    .rcc_itcm_hclk              ( rcc_itcm_hclk               ),
    .rcc_dtcm2_hclk             ( rcc_dtcm2_hclk              ),
    .rcc_dtcm1_hclk             ( rcc_dtcm1_hclk              ),
    .rcc_jpgdec_hclk            ( rcc_jpgdec_hclk             ),
    .rcc_sdmmc1_hclk            ( rcc_sdmmc1_hclk             ),
    .rcc_sdmmc1_ker_clk         ( rcc_sdmmc1_ker_clk          ),
    .rcc_wwdg1_pclk             ( rcc_wwdg1_pclk              ),
    .rcc_usb2ulpi_hclk          ( rcc_usb2ulpi_hclk           ),
    .rcc_usb2otg_hclk           ( rcc_usb2otg_hclk            ),
    .rcc_usb2otg_ker_clk        ( rcc_usb2otg_ker_clk         ),
    .rcc_usb1ulpi_hclk          ( rcc_usb1ulpi_hclk           ),
    .rcc_usb1ulpi_ker_clk       ( rcc_usb1ulpi_ker_clk        ),
    .rcc_usb1otg_hclk           ( rcc_usb1otg_hclk            ),
    .rcc_usb1otg_ker_clk        ( rcc_usb1otg_ker_clk         ),
    .rcc_eth1rx_hclk            ( rcc_eth1rx_hclk             ),
    .rcc_eth1tx_hclk            ( rcc_eth1tx_hclk             ),
    .rcc_eth1mac_hclk           ( rcc_eth1mac_hclk            ),
    .rcc_adc12_hclk             ( rcc_adc12_hclk              ),
    .rcc_adc12_ker_clk          ( rcc_adc12_ker_clk           ),
    .rcc_dma2_hclk              ( rcc_dma2_hclk               ),
    .rcc_dma1_hclk              ( rcc_dma1_hclk               ),
    .rcc_sram3_hclk             ( rcc_sram3_hclk              ),
    .rcc_sram2_hclk             ( rcc_sram2_hclk              ),
    .rcc_sram1_hclk             ( rcc_sram1_hclk              ),
    .rcc_sdmmc2_hclk            ( rcc_sdmmc2_hclk             ),
    .rcc_sdmmc2_ker_clk         ( rcc_sdmmc2_ker_clk          ),
    .rcc_rng_hclk               ( rcc_rng_hclk                ),
    .rcc_rng_ker_clk            ( rcc_rng_ker_clk             ),
    .rcc_hash_hclk              ( rcc_hash_hclk               ),
    .rcc_crypt_hclk             ( rcc_crypt_hclk              ),
    .rcc_dcmi_hclk              ( rcc_dcmi_hclk               ),
    .rcc_ramecc2_hclk           ( rcc_ramecc2_hclk            ),
    .rcc_uart8_pclk             ( rcc_uart8_pclk              ),
    .rcc_uart8_ker_clk          ( rcc_uart8_ker_clk           ),
    .rcc_uart7_pclk             ( rcc_uart7_pclk              ),
    .rcc_uart7_ker_clk          ( rcc_uart7_ker_clk           ),
    .rcc_dac12_pclk             ( rcc_dac12_pclk              ),
    .rcc_hdmicec_pclk           ( rcc_hdmicec_pclk            ),
    .rcc_hdmicec_ker_clk        ( rcc_hdmicec_ker_clk         ),
    .rcc_i2c3_pclk              ( rcc_i2c3_pclk               ),
    .rcc_i2c3_ker_clk           ( rcc_i2c3_ker_clk            ),
    .rcc_i2c2_pclk              ( rcc_i2c2_pclk               ),
    .rcc_i2c2_ker_clk           ( rcc_i2c2_ker_clk            ),
    .rcc_i2c1_pclk              ( rcc_i2c1_pclk               ),
    .rcc_i2c1_ker_clk           ( rcc_i2c1_ker_clk            ),
    .rcc_uart5_pclk             ( rcc_uart5_pclk              ),
    .rcc_uart5_ker_clk          ( rcc_uart5_ker_clk           ),
    .rcc_uart4_pclk             ( rcc_uart4_pclk              ),
    .rcc_uart4_ker_clk          ( rcc_uart4_ker_clk           ),
    .rcc_usart3_pclk            ( rcc_usart3_pclk             ),
    .rcc_usart3_ker_clk         ( rcc_usart3_ker_clk          ),
    .rcc_usart2_pclk            ( rcc_usart2_pclk             ),
    .rcc_usart2_ker_clk         ( rcc_usart2_ker_clk          ),
    .rcc_spdifrx_pclk           ( rcc_spdifrx_pclk            ),
    .rcc_spdifrx_ker_clk        ( rcc_spdifrx_ker_clk         ),
    .rcc_spi3_pclk              ( rcc_spi3_pclk               ),
    .rcc_spi3_ker_clk           ( rcc_spi3_ker_clk            ),
    .rcc_spi2_pclk              ( rcc_spi2_pclk               ),
    .rcc_spi2_ker_clk           ( rcc_spi2_ker_clk            ),
    .rcc_wwdg2_pclk             ( rcc_wwdg2_pclk              ),
    .rcc_lptim1_pclk            ( rcc_lptim1_pclk             ),
    .rcc_lptim1_ker_clk         ( rcc_lptim1_ker_clk          ),
    .rcc_tim14_pclk             ( rcc_tim14_pclk              ),
    .rcc_tim14_ker_clk          ( rcc_tim14_ker_clk           ),
    .rcc_tim13_pclk             ( rcc_tim13_pclk              ),
    .rcc_tim13_ker_clk          ( rcc_tim13_ker_clk           ),
    .rcc_tim12_pclk             ( rcc_tim12_pclk              ),
    .rcc_tim12_ker_clk          ( rcc_tim12_ker_clk           ),
    .rcc_tim7_pclk              ( rcc_tim7_pclk               ),
    .rcc_tim7_ker_clk           ( rcc_tim7_ker_clk            ),
    .rcc_tim6_pclk              ( rcc_tim6_pclk               ),
    .rcc_tim6_ker_clk           ( rcc_tim6_ker_clk            ),
    .rcc_tim5_pclk              ( rcc_tim5_pclk               ),
    .rcc_tim5_ker_clk           ( rcc_tim5_ker_clk            ),
    .rcc_tim4_pclk              ( rcc_tim4_pclk               ),
    .rcc_tim4_ker_clk           ( rcc_tim4_ker_clk            ),
    .rcc_tim3_pclk              ( rcc_tim3_pclk               ),
    .rcc_tim3_ker_clk           ( rcc_tim3_ker_clk            ),
    .rcc_tim2_pclk              ( rcc_tim2_pclk               ),
    .rcc_tim2_ker_clk           ( rcc_tim2_ker_clk            ),
    .rcc_fdcan_pclk             ( rcc_fdcan_pclk              ),
    .rcc_fdcan_ker_clk          ( rcc_fdcan_ker_clk           ),
    .rcc_mdios_pclk             ( rcc_mdios_pclk              ),
    .rcc_opamp_pclk             ( rcc_opamp_pclk              ),
    .rcc_swpmi_pclk             ( rcc_swpmi_pclk              ),
    .rcc_swpmi_ker_clk          ( rcc_swpmi_ker_clk           ),
    .rcc_crs_pclk               ( rcc_crs_pclk                ),
    .rcc_hrtim_pclk             ( rcc_hrtim_pclk              ),
    .rcc_hrtim_ker_clk          ( rcc_hrtim_ker_clk           ),
    .rcc_dfsdm1_pclk            ( rcc_dfsdm1_pclk             ),
    .rcc_dfsdm1_ker_clk_0       ( rcc_dfsdm1_ker_clk_0        ),
    .rcc_dfsdm1_ker_clk_1       ( rcc_dfsdm1_ker_clk_1        ),
    .rcc_sai3_pclk              ( rcc_sai3_pclk               ),
    .rcc_sai3_ker_clk           ( rcc_sai3_ker_clk            ),
    .rcc_sai2_pclk              ( rcc_sai2_pclk               ),
    .rcc_sai2_ker_clk           ( rcc_sai2_ker_clk            ),
    .rcc_sai1_pclk              ( rcc_sai1_pclk               ),
    .rcc_sai1_ker_clk           ( rcc_sai1_ker_clk            ),
    .rcc_spi5_pclk              ( rcc_spi5_pclk               ),
    .rcc_spi5_ker_clk           ( rcc_spi5_ker_clk            ),
    .rcc_tim17_pclk             ( rcc_tim17_pclk              ),
    .rcc_tim17_ker_clk          ( rcc_tim17_ker_clk           ),
    .rcc_tim16_pclk             ( rcc_tim16_pclk              ),
    .rcc_tim16_ker_clk          ( rcc_tim16_ker_clk           ),
    .rcc_tim15_pclk             ( rcc_tim15_pclk              ),
    .rcc_tim15_ker_clk          ( rcc_tim15_ker_clk           ),
    .rcc_spi4_pclk              ( rcc_spi4_pclk               ),
    .rcc_spi4_ker_clk           ( rcc_spi4_ker_clk            ),
    .rcc_spi1_pclk              ( rcc_spi1_pclk               ),
    .rcc_spi1_ker_clk           ( rcc_spi1_ker_clk            ),
    .rcc_usart6_pclk            ( rcc_usart6_pclk             ),
    .rcc_usart6_ker_clk         ( rcc_usart6_ker_clk          ),
    .rcc_usart1_pclk            ( rcc_usart1_pclk             ),
    .rcc_usart1_ker_clk         ( rcc_usart1_ker_clk          ),
    .rcc_tim8_pclk              ( rcc_tim8_pclk               ),
    .rcc_tim8_ker_clk           ( rcc_tim8_ker_clk            ),
    .rcc_tim1_pclk              ( rcc_tim1_pclk               ),
    .rcc_tim1_ker_clk           ( rcc_tim1_ker_clk            ),
    .rcc_sram4_hclk             ( rcc_sram4_hclk              ),
    .rcc_bkpram_hclk            ( rcc_bkpram_hclk             ),
    .rcc_ramecc3_hclk           ( rcc_ramecc3_hclk            ),
    .rcc_hsem_hclk              ( rcc_hsem_hclk               ),
    .rcc_adc3_hclk              ( rcc_adc3_hclk               ),
    .rcc_adc3_ker_clk           ( rcc_adc3_ker_clk            ),
    .rcc_bdma_hclk              ( rcc_bdma_hclk               ),
    .rcc_crc_hclk               ( rcc_crc_hclk                ),
    .rcc_gpiok_hclk             ( rcc_gpiok_hclk              ),
    .rcc_gpioj_hclk             ( rcc_gpioj_hclk              ),
    .rcc_gpioi_hclk             ( rcc_gpioi_hclk              ),
    .rcc_gpioh_hclk             ( rcc_gpioh_hclk              ),
    .rcc_gpiog_hclk             ( rcc_gpiog_hclk              ),
    .rcc_gpiof_hclk             ( rcc_gpiof_hclk              ),
    .rcc_gpioe_hclk             ( rcc_gpioe_hclk              ),
    .rcc_gpiod_hclk             ( rcc_gpiod_hclk              ),
    .rcc_gpioc_hclk             ( rcc_gpioc_hclk              ),
    .rcc_gpiob_hclk             ( rcc_gpiob_hclk              ),
    .rcc_gpioa_hclk             ( rcc_gpioa_hclk              ),
    .rcc_rcc_hclk               ( rcc_rcc_hclk                ),
    .rcc_pwr_hclk               ( rcc_pwr_hclk                ),
    .rcc_sai4_pclk              ( rcc_sai4_pclk               ),
    .rcc_sai4_ker_clk_0         ( rcc_sai4_ker_clk_0          ),
    .rcc_sai4_ker_clk_1         ( rcc_sai4_ker_clk_1          ),
    .rcc_vref_pclk              ( rcc_vref_pclk               ),
    .rcc_comp12_pclk            ( rcc_comp12_pclk             ),
    .rcc_lptim5_pclk            ( rcc_lptim5_pclk             ),
    .rcc_lptim5_ker_clk         ( rcc_lptim5_ker_clk          ),
    .rcc_lptim4_pclk            ( rcc_lptim4_pclk             ),
    .rcc_lptim4_ker_clk         ( rcc_lptim4_ker_clk          ),
    .rcc_lptim3_pclk            ( rcc_lptim3_pclk             ),
    .rcc_lptim3_ker_clk         ( rcc_lptim3_ker_clk          ),
    .rcc_lptim2_pclk            ( rcc_lptim2_pclk             ),
    .rcc_lptim2_ker_clk         ( rcc_lptim2_ker_clk          ),
    .rcc_i2c4_pclk              ( rcc_i2c4_pclk               ),
    .rcc_i2c4_ker_clk           ( rcc_i2c4_ker_clk            ),
    .rcc_spi6_pclk              ( rcc_spi6_pclk               ),
    .rcc_spi6_ker_clk           ( rcc_spi6_ker_clk            ),
    .rcc_lpuart1_pclk           ( rcc_lpuart1_pclk            ),
    .rcc_lpuart1_ker_clk        ( rcc_lpuart1_ker_clk         ),
    .rcc_syscfg_pclk            ( rcc_syscfg_pclk             ),
    .rcc_iwdg2_pclk             ( rcc_iwdg2_pclk              ),
    .rcc_iwdg1_pclk             ( rcc_iwdg1_pclk              ),
    .rcc_exti_pclk              ( rcc_exti_pclk               )
);
