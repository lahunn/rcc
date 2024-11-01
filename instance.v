// rcc_top Parameters
parameter CLK_ON_AFTER_PER_RST_RELEASE   = 8     ;
parameter CLK_ON_AFTER_SYS_RST_RELEASE   = 8     ;
parameter CLK_ON_AFTER_D1_RST_RELEASE    = 8     ;
parameter CLK_ON_AFTER_D2_RST_RELEASE    = 8     ;
parameter CLK_ON_AFTER_CPU1_RST_RELEASE  = 8     ;
parameter CLK_ON_AFTER_CPU2_RST_RELEASE  = 8     ;
parameter D2_RST_DURATION                = 10    ;
parameter D1_RST_DURATION                = 10    ;
parameter AW                             = 29    ;
parameter DW                             = 32    ;
parameter WW                             = DW / 8;

// rcc_top Inputs
reg   I2S_clk_IN;
reg   USB_PHY1;
reg   ahb1bridge_d2_busy;
reg   ahb2bridge_d2_busy;
reg   ahb3bridge_d1_busy;
reg   ahb4bridge_d3_busy;
reg   apb1bridge_d2_busy;
reg   apb2bridge_d2_busy;
reg   apb3bridge_d1_busy;
reg   apb4bridge_d3_busy;
reg   arcg_on;
reg   axibridge_d1_busy;
reg   backup_protect;
reg   c1_deepsleep;
reg   c1_sleep;
reg   c2_deepsleep;
reg   c2_sleep;
reg   cpu1_sftrst;
reg   cpu2_sftrst;
reg   [9:0]  crs_hsi48_trim;
reg   csi_origin_clk;
reg   csi_rdy;
reg   d1_rst;
reg   d2_rst;
reg   d3_deepsleep;
reg   eth_rcc_epis_2;
reg   eth_rcc_fes;
reg   flash_busy;
reg   [7:0]  flash_csi_opt;
reg   [11:0]  flash_hsi_opt;
reg   flash_obl_reload;
reg   flash_power_ok;
reg   [31:0]  haddr;
reg   hclk;
reg   hready;
reg   hresetn;
reg   hse_origin_clk;
reg   hse_rdy;
reg   hsecss_fail;
reg   hsel;
reg   hsi48_clk;
reg   hsi48_rdy;
reg   hsi_origin_clk;
reg   hsi_rdy;
reg   [2:0]  hsize;
reg   [1:0]  htrans;
reg   [DW-1:0]  hwdata;
reg   hwrite;
reg   i2c1_ker_clk_req;
reg   i2c2_ker_clk_req;
reg   i2c3_ker_clk_req;
reg   i2c4_ker_clk_req;
reg   iwdg1_out_rst;
reg   iwdg2_out_rst;
reg   lpuart1_ker_clk_req;
reg   lpwr1_rst;
reg   lpwr2_rst;
reg   lse_clk;
reg   lsecss_fail;
reg   lserdy;
reg   lsi_clk;
reg   lsi_rdy;
reg   nrst_in;
reg   obl_done;
reg   obl_rst;
reg   pad_rcc_eth_mii_rx_clk;
reg   pad_rcc_eth_mii_tx_clk;
reg   pll1_p_clk;
reg   pll1_q_clk;
reg   pll1_rdy;
reg   pll2_p_clk;
reg   pll2_q_clk;
reg   pll2_r_clk;
reg   pll2_rdy;
reg   pll3_p_clk;
reg   pll3_q_clk;
reg   pll3_r_clk;
reg   pll3_rdy;
reg   pwr_bor_rst;
reg   pwr_d1_ok;
reg   pwr_d1_wkup;
reg   pwr_d2_ok;
reg   pwr_d2_wkup;
reg   pwr_d3_wkup;
reg   pwr_por_rst;
reg   pwr_vcore_ok;
reg   pwr_vsw_rst;
reg   rcc_arcg_on;
reg   testmode;
reg   uart4_ker_clk_req;
reg   uart5_ker_clk_req;
reg   uart7_ker_clk_req;
reg   uart8_ker_clk_req;
reg   usart1_ker_clk_req;
reg   usart2_ker_clk_req;
reg   usart3_ker_clk_req;
reg   usart6_ker_clk_req;
reg   wwdg1_out_rst;
reg   wwdg2_out_rst;

// rcc_top Outputs
wire  c1_to_axi_div_en;
wire  cpu1_rst_n;
wire  cpu1_sync_rst_n;
wire  cpu2_rst_n;
wire  cpu2_sync_rst_n;
wire  csikeron;
wire  csion;
wire  d1_bus_sync_rst_n;
wire  d1_h2b_div_en;
wire  d2_bus_sync_rst_n;
wire  d2_h2b1_div_en;
wire  d2_h2b2_div_en;
wire  d3_bus_sync_rst_n;
wire  d3_h2b_div_en;
wire  [8:0]  divn1;
wire  [8:0]  divn2;
wire  [8:0]  divn3;
wire  [6:0]  divp1;
wire  divp1en;
wire  [6:0]  divp2;
wire  divp2en;
wire  [6:0]  divp3;
wire  divp3en;
wire  [6:0]  divq1;
wire  divq1en;
wire  [6:0]  divq2;
wire  divq2en;
wire  [6:0]  divq3;
wire  divq3en;
wire  [6:0]  divr1;
wire  divr1en;
wire  [6:0]  divr2;
wire  divr2en;
wire  [6:0]  divr3;
wire  divr3en;
wire  [12:0]  fracn1;
wire  [12:0]  fracn2;
wire  [12:0]  fracn3;
wire  [DW-1:0]  hrdata;
wire  hreadyout;
wire  hresp;
wire  hsebyp;
wire  hsecsson;
wire  hseon;
wire  hsi48on;
wire  hsikeron;
wire  hsion;
wire  lsebyp;
wire  lsecssd;
wire  lsecsson;
wire  [1:0]  lsedrv;
wire  lseon;
wire  mco1;
wire  mco2;
wire  nrst_out;
wire  pll1_src_clk;
wire  pll1fracen;
wire  pll1on;
wire  [1:0]  pll1rge;
wire  pll1vcosel;
wire  pll2_src_clk;
wire  pll2fracen;
wire  pll2on;
wire  [1:0]  pll2rge;
wire  pll2vcosel;
wire  pll3_src_clk;
wire  pll3fracen;
wire  pll3on;
wire  [1:0]  pll3rge;
wire  pll3vcosel;
wire  pre_sys_clk;
wire  pwr_por_rst_n;
wire  rcc_adc12_hclk;
wire  rcc_adc12_ker_clk;
wire  rcc_adc12_sync_rst_n;
wire  rcc_adc3_hclk;
wire  rcc_adc3_ker_clk;
wire  rcc_adc3_sync_rst_n;
wire  rcc_axisram_aclk;
wire  rcc_axisram_sync_rst_n;
wire  rcc_bdma_hclk;
wire  rcc_bdma_sync_rst_n;
wire  rcc_bkpram_hclk;
wire  rcc_bkpram_sync_rst_n;
wire  rcc_c1_clk;
wire  rcc_c1_systick_clk;
wire  rcc_c2_clk;
wire  rcc_c2_systick_clk;
wire  rcc_comp12_pclk;
wire  rcc_comp12_sync_rst_n;
wire  rcc_crc_hclk;
wire  rcc_crc_sync_rst_n;
wire  rcc_crs_pclk;
wire  rcc_crs_sync_rst_n;
wire  rcc_crypt_hclk;
wire  rcc_crypt_sync_rst_n;
wire  [7:0]  rcc_csi_triming;
wire  rcc_dac12_pclk;
wire  rcc_dac12_sync_rst_n;
wire  rcc_dcmi_hclk;
wire  rcc_dcmi_sync_rst_n;
wire  [1:0]  rcc_dfsdm1_ker_clks;
wire  rcc_dfsdm1_pclk;
wire  rcc_dfsdm1_sync_rst_n;
wire  rcc_dma1_hclk;
wire  rcc_dma1_sync_rst_n;
wire  rcc_dma2_hclk;
wire  rcc_dma2_sync_rst_n;
wire  rcc_dma2d_aclk;
wire  rcc_dma2d_hclk;
wire  rcc_dma2d_sync_rst_n;
wire  rcc_dtcm1_hclk;
wire  rcc_dtcm1_sync_rst_n;
wire  rcc_dtcm2_hclk;
wire  rcc_dtcm2_sync_rst_n;
wire  rcc_eth1mac_hclk;
wire  rcc_eth1mac_sync_rst_n;
wire  rcc_eth1rx_hclk;
wire  rcc_eth1rx_sync_rst_n;
wire  rcc_eth1tx_hclk;
wire  rcc_eth1tx_sync_rst_n;
wire  rcc_eth_mii_rx_clk;
wire  rcc_eth_mii_tx_clk;
wire  rcc_eth_rmii_ref_clk;
wire  rcc_exti_pclk;
wire  rcc_exti_sync_rst_n;
wire  rcc_fclk_c1;
wire  rcc_fclk_c2;
wire  rcc_fdcan_ker_clk;
wire  rcc_fdcan_pclk;
wire  rcc_fdcan_sync_rst_n;
wire  rcc_flash_aclk;
wire  rcc_flash_hclk;
wire  rcc_flash_sync_rst_n;
wire  rcc_fmc_aclk;
wire  rcc_fmc_hclk;
wire  rcc_fmc_ker_clk;
wire  rcc_fmc_sync_rst_n;
wire  rcc_gpioa_hclk;
wire  rcc_gpioa_sync_rst_n;
wire  rcc_gpiob_hclk;
wire  rcc_gpiob_sync_rst_n;
wire  rcc_gpioc_hclk;
wire  rcc_gpioc_sync_rst_n;
wire  rcc_gpiod_hclk;
wire  rcc_gpiod_sync_rst_n;
wire  rcc_gpioe_hclk;
wire  rcc_gpioe_sync_rst_n;
wire  rcc_gpiof_hclk;
wire  rcc_gpiof_sync_rst_n;
wire  rcc_gpiog_hclk;
wire  rcc_gpiog_sync_rst_n;
wire  rcc_gpioh_hclk;
wire  rcc_gpioh_sync_rst_n;
wire  rcc_gpioi_hclk;
wire  rcc_gpioi_sync_rst_n;
wire  rcc_gpioj_hclk;
wire  rcc_gpioj_sync_rst_n;
wire  rcc_gpiok_hclk;
wire  rcc_gpiok_sync_rst_n;
wire  rcc_gpv_hclk;
wire  rcc_gpv_sync_rst_n;
wire  rcc_hash_hclk;
wire  rcc_hash_sync_rst_n;
wire  rcc_hdmicec_ker_clk;
wire  rcc_hdmicec_pclk;
wire  rcc_hdmicec_sync_rst_n;
wire  rcc_hrtim_ker_clk;
wire  rcc_hrtim_pclk;
wire  rcc_hrtim_sync_rst_n;
wire  rcc_hrtimer_prescalar_clk;
wire  rcc_hsefail_it;
wire  rcc_hsem_hclk;
wire  rcc_hsem_sync_rst_n;
wire  [11:0]  rcc_hsi_triming;
wire  rcc_i2c1_ker_clk;
wire  rcc_i2c1_pclk;
wire  rcc_i2c1_sync_rst_n;
wire  rcc_i2c2_ker_clk;
wire  rcc_i2c2_pclk;
wire  rcc_i2c2_sync_rst_n;
wire  rcc_i2c3_ker_clk;
wire  rcc_i2c3_pclk;
wire  rcc_i2c3_sync_rst_n;
wire  rcc_i2c4_ker_clk;
wire  rcc_i2c4_pclk;
wire  rcc_i2c4_sync_rst_n;
wire  rcc_it;
wire  rcc_itcm_hclk;
wire  rcc_itcm_sync_rst_n;
wire  rcc_iwdg1_pclk;
wire  rcc_iwdg1_sync_rst_n;
wire  rcc_iwdg2_pclk;
wire  rcc_iwdg2_sync_rst_n;
wire  rcc_jpgdec_hclk;
wire  rcc_jpgdec_sync_rst_n;
wire  rcc_lptim1_ker_clk;
wire  rcc_lptim1_pclk;
wire  rcc_lptim1_sync_rst_n;
wire  rcc_lptim2_ker_clk;
wire  rcc_lptim2_pclk;
wire  rcc_lptim2_sync_rst_n;
wire  rcc_lptim3_ker_clk;
wire  rcc_lptim3_pclk;
wire  rcc_lptim3_sync_rst_n;
wire  rcc_lptim4_ker_clk;
wire  rcc_lptim4_pclk;
wire  rcc_lptim4_sync_rst_n;
wire  rcc_lptim5_ker_clk;
wire  rcc_lptim5_pclk;
wire  rcc_lptim5_sync_rst_n;
wire  rcc_lpuart1_ker_clk;
wire  rcc_lpuart1_pclk;
wire  rcc_lpuart1_sync_rst_n;
wire  rcc_lsefail_it;
wire  rcc_ltdc_aclk;
wire  rcc_ltdc_ker_clk;
wire  rcc_ltdc_pclk;
wire  rcc_ltdc_sync_rst_n;
wire  rcc_mdios_pclk;
wire  rcc_mdios_sync_rst_n;
wire  rcc_mdma_aclk;
wire  rcc_mdma_hclk;
wire  rcc_mdma_sync_rst_n;
wire  rcc_obl_clk;
wire  rcc_obl_rst_n;
wire  rcc_opamp_pclk;
wire  rcc_opamp_sync_rst_n;
wire  rcc_pwr_d1_req;
wire  rcc_pwr_d2_req;
wire  rcc_pwr_d3_req;
wire  rcc_pwr_hclk;
wire  rcc_pwr_sync_rst_n;
wire  rcc_qspi_aclk;
wire  rcc_qspi_hclk;
wire  rcc_qspi_ker_clk;
wire  rcc_qspi_sync_rst_n;
wire  rcc_ramecc1_hclk;
wire  rcc_ramecc1_sync_rst_n;
wire  rcc_ramecc2_hclk;
wire  rcc_ramecc2_sync_rst_n;
wire  rcc_ramecc3_hclk;
wire  rcc_ramecc3_sync_rst_n;
wire  rcc_rcc_hclk;
wire  rcc_rcc_sync_rst_n;
wire  rcc_rng_hclk;
wire  rcc_rng_ker_clk;
wire  rcc_rng_sync_rst_n;
wire  rcc_rtc_ker_clk;
wire  rcc_rtc_pclk;
wire  rcc_rtc_sync_rst_n;
wire  rcc_sai1_ker_clk;
wire  rcc_sai1_pclk;
wire  rcc_sai1_sync_rst_n;
wire  rcc_sai2_ker_clk;
wire  rcc_sai2_pclk;
wire  rcc_sai2_sync_rst_n;
wire  rcc_sai3_ker_clk;
wire  rcc_sai3_pclk;
wire  rcc_sai3_sync_rst_n;
wire  [1:0]  rcc_sai4_ker_clks;
wire  rcc_sai4_pclk;
wire  rcc_sai4_sync_rst_n;
wire  rcc_sdmmc1_hclk;
wire  rcc_sdmmc1_ker_clk;
wire  rcc_sdmmc1_sync_rst_n;
wire  rcc_sdmmc2_hclk;
wire  rcc_sdmmc2_ker_clk;
wire  rcc_sdmmc2_sync_rst_n;
wire  rcc_spdifrx_ker_clk;
wire  rcc_spdifrx_pclk;
wire  rcc_spdifrx_sync_rst_n;
wire  rcc_spi1_ker_clk;
wire  rcc_spi1_pclk;
wire  rcc_spi1_sync_rst_n;
wire  rcc_spi2_ker_clk;
wire  rcc_spi2_pclk;
wire  rcc_spi2_sync_rst_n;
wire  rcc_spi3_ker_clk;
wire  rcc_spi3_pclk;
wire  rcc_spi3_sync_rst_n;
wire  rcc_spi4_ker_clk;
wire  rcc_spi4_pclk;
wire  rcc_spi4_sync_rst_n;
wire  rcc_spi5_ker_clk;
wire  rcc_spi5_pclk;
wire  rcc_spi5_sync_rst_n;
wire  rcc_spi6_ker_clk;
wire  rcc_spi6_pclk;
wire  rcc_spi6_sync_rst_n;
wire  rcc_sram1_hclk;
wire  rcc_sram1_sync_rst_n;
wire  rcc_sram2_hclk;
wire  rcc_sram2_sync_rst_n;
wire  rcc_sram3_hclk;
wire  rcc_sram3_sync_rst_n;
wire  rcc_sram4_hclk;
wire  rcc_sram4_sync_rst_n;
wire  rcc_swpmi_ker_clk;
wire  rcc_swpmi_pclk;
wire  rcc_swpmi_sync_rst_n;
wire  rcc_syscfg_pclk;
wire  rcc_syscfg_sync_rst_n;
wire  rcc_tim12_ker_clk;
wire  rcc_tim12_pclk;
wire  rcc_tim12_sync_rst_n;
wire  rcc_tim13_ker_clk;
wire  rcc_tim13_pclk;
wire  rcc_tim13_sync_rst_n;
wire  rcc_tim14_ker_clk;
wire  rcc_tim14_pclk;
wire  rcc_tim14_sync_rst_n;
wire  rcc_tim15_ker_clk;
wire  rcc_tim15_pclk;
wire  rcc_tim15_sync_rst_n;
wire  rcc_tim16_ker_clk;
wire  rcc_tim16_pclk;
wire  rcc_tim16_sync_rst_n;
wire  rcc_tim17_ker_clk;
wire  rcc_tim17_pclk;
wire  rcc_tim17_sync_rst_n;
wire  rcc_tim1_ker_clk;
wire  rcc_tim1_pclk;
wire  rcc_tim1_sync_rst_n;
wire  rcc_tim2_ker_clk;
wire  rcc_tim2_pclk;
wire  rcc_tim2_sync_rst_n;
wire  rcc_tim3_ker_clk;
wire  rcc_tim3_pclk;
wire  rcc_tim3_sync_rst_n;
wire  rcc_tim4_ker_clk;
wire  rcc_tim4_pclk;
wire  rcc_tim4_sync_rst_n;
wire  rcc_tim5_ker_clk;
wire  rcc_tim5_pclk;
wire  rcc_tim5_sync_rst_n;
wire  rcc_tim6_ker_clk;
wire  rcc_tim6_pclk;
wire  rcc_tim6_sync_rst_n;
wire  rcc_tim7_ker_clk;
wire  rcc_tim7_pclk;
wire  rcc_tim7_sync_rst_n;
wire  rcc_tim8_ker_clk;
wire  rcc_tim8_pclk;
wire  rcc_tim8_sync_rst_n;
wire  rcc_timx_ker_clk;
wire  rcc_timy_ker_clk;
wire  rcc_uart4_ker_clk;
wire  rcc_uart4_pclk;
wire  rcc_uart4_sync_rst_n;
wire  rcc_uart5_ker_clk;
wire  rcc_uart5_pclk;
wire  rcc_uart5_sync_rst_n;
wire  rcc_uart7_ker_clk;
wire  rcc_uart7_pclk;
wire  rcc_uart7_sync_rst_n;
wire  rcc_uart8_ker_clk;
wire  rcc_uart8_pclk;
wire  rcc_uart8_sync_rst_n;
wire  rcc_usart1_ker_clk;
wire  rcc_usart1_pclk;
wire  rcc_usart1_sync_rst_n;
wire  rcc_usart2_ker_clk;
wire  rcc_usart2_pclk;
wire  rcc_usart2_sync_rst_n;
wire  rcc_usart3_ker_clk;
wire  rcc_usart3_pclk;
wire  rcc_usart3_sync_rst_n;
wire  rcc_usart6_ker_clk;
wire  rcc_usart6_pclk;
wire  rcc_usart6_sync_rst_n;
wire  rcc_usb1otg_hclk;
wire  rcc_usb1otg_ker_clk;
wire  rcc_usb1otg_sync_rst_n;
wire  rcc_usb1ulpi_hclk;
wire  rcc_usb1ulpi_ker_clk;
wire  rcc_usb1ulpi_sync_rst_n;
wire  rcc_usb2otg_hclk;
wire  rcc_usb2otg_ker_clk;
wire  rcc_usb2otg_sync_rst_n;
wire  rcc_usb2ulpi_hclk;
wire  rcc_usb2ulpi_sync_rst_n;
wire  rcc_vref_pclk;
wire  rcc_vref_sync_rst_n;
wire  rcc_wwdg1_pclk;
wire  rcc_wwdg1_sync_rst_n;
wire  rcc_wwdg2_pclk;
wire  rcc_wwdg2_sync_rst_n;
wire  stby_rst_n;
wire  sys_d1cpre_clk;
wire  sys_hpre_clk;

rcc_top #(
    .CLK_ON_AFTER_PER_RST_RELEASE  ( 8      ),
    .CLK_ON_AFTER_SYS_RST_RELEASE  ( 8      ),
    .CLK_ON_AFTER_D1_RST_RELEASE   ( 8      ),
    .CLK_ON_AFTER_D2_RST_RELEASE   ( 8      ),
    .CLK_ON_AFTER_CPU1_RST_RELEASE ( 8      ),
    .CLK_ON_AFTER_CPU2_RST_RELEASE ( 8      ),
    .D2_RST_DURATION               ( 10     ),
    .D1_RST_DURATION               ( 10     ),
    .AW                            ( 29     ),
    .DW                            ( 32     ),
    .WW                            ( DW / 8 ))
 u_rcc_top (
    .I2S_clk_IN                 ( I2S_clk_IN                  ),
    .USB_PHY1                   ( USB_PHY1                    ),
    .ahb1bridge_d2_busy         ( ahb1bridge_d2_busy          ),
    .ahb2bridge_d2_busy         ( ahb2bridge_d2_busy          ),
    .ahb3bridge_d1_busy         ( ahb3bridge_d1_busy          ),
    .ahb4bridge_d3_busy         ( ahb4bridge_d3_busy          ),
    .apb1bridge_d2_busy         ( apb1bridge_d2_busy          ),
    .apb2bridge_d2_busy         ( apb2bridge_d2_busy          ),
    .apb3bridge_d1_busy         ( apb3bridge_d1_busy          ),
    .apb4bridge_d3_busy         ( apb4bridge_d3_busy          ),
    .arcg_on                    ( arcg_on                     ),
    .axibridge_d1_busy          ( axibridge_d1_busy           ),
    .backup_protect             ( backup_protect              ),
    .c1_deepsleep               ( c1_deepsleep                ),
    .c1_sleep                   ( c1_sleep                    ),
    .c2_deepsleep               ( c2_deepsleep                ),
    .c2_sleep                   ( c2_sleep                    ),
    .cpu1_sftrst                ( cpu1_sftrst                 ),
    .cpu2_sftrst                ( cpu2_sftrst                 ),
    .crs_hsi48_trim             ( crs_hsi48_trim              ),
    .csi_origin_clk             ( csi_origin_clk              ),
    .csi_rdy                    ( csi_rdy                     ),
    .d1_rst                     ( d1_rst                      ),
    .d2_rst                     ( d2_rst                      ),
    .d3_deepsleep               ( d3_deepsleep                ),
    .eth_rcc_epis_2             ( eth_rcc_epis_2              ),
    .eth_rcc_fes                ( eth_rcc_fes                 ),
    .flash_busy                 ( flash_busy                  ),
    .flash_csi_opt              ( flash_csi_opt               ),
    .flash_hsi_opt              ( flash_hsi_opt               ),
    .flash_obl_reload           ( flash_obl_reload            ),
    .flash_power_ok             ( flash_power_ok              ),
    .haddr                      ( haddr                       ),
    .hclk                       ( hclk                        ),
    .hready                     ( hready                      ),
    .hresetn                    ( hresetn                     ),
    .hse_origin_clk             ( hse_origin_clk              ),
    .hse_rdy                    ( hse_rdy                     ),
    .hsecss_fail                ( hsecss_fail                 ),
    .hsel                       ( hsel                        ),
    .hsi48_clk                  ( hsi48_clk                   ),
    .hsi48_rdy                  ( hsi48_rdy                   ),
    .hsi_origin_clk             ( hsi_origin_clk              ),
    .hsi_rdy                    ( hsi_rdy                     ),
    .hsize                      ( hsize                       ),
    .htrans                     ( htrans                      ),
    .hwdata                     ( hwdata                      ),
    .hwrite                     ( hwrite                      ),
    .i2c1_ker_clk_req           ( i2c1_ker_clk_req            ),
    .i2c2_ker_clk_req           ( i2c2_ker_clk_req            ),
    .i2c3_ker_clk_req           ( i2c3_ker_clk_req            ),
    .i2c4_ker_clk_req           ( i2c4_ker_clk_req            ),
    .iwdg1_out_rst              ( iwdg1_out_rst               ),
    .iwdg2_out_rst              ( iwdg2_out_rst               ),
    .lpuart1_ker_clk_req        ( lpuart1_ker_clk_req         ),
    .lpwr1_rst                  ( lpwr1_rst                   ),
    .lpwr2_rst                  ( lpwr2_rst                   ),
    .lse_clk                    ( lse_clk                     ),
    .lsecss_fail                ( lsecss_fail                 ),
    .lserdy                     ( lserdy                      ),
    .lsi_clk                    ( lsi_clk                     ),
    .lsi_rdy                    ( lsi_rdy                     ),
    .nrst_in                    ( nrst_in                     ),
    .obl_done                   ( obl_done                    ),
    .obl_rst                    ( obl_rst                     ),
    .pad_rcc_eth_mii_rx_clk     ( pad_rcc_eth_mii_rx_clk      ),
    .pad_rcc_eth_mii_tx_clk     ( pad_rcc_eth_mii_tx_clk      ),
    .pll1_p_clk                 ( pll1_p_clk                  ),
    .pll1_q_clk                 ( pll1_q_clk                  ),
    .pll1_rdy                   ( pll1_rdy                    ),
    .pll2_p_clk                 ( pll2_p_clk                  ),
    .pll2_q_clk                 ( pll2_q_clk                  ),
    .pll2_r_clk                 ( pll2_r_clk                  ),
    .pll2_rdy                   ( pll2_rdy                    ),
    .pll3_p_clk                 ( pll3_p_clk                  ),
    .pll3_q_clk                 ( pll3_q_clk                  ),
    .pll3_r_clk                 ( pll3_r_clk                  ),
    .pll3_rdy                   ( pll3_rdy                    ),
    .pwr_bor_rst                ( pwr_bor_rst                 ),
    .pwr_d1_ok                  ( pwr_d1_ok                   ),
    .pwr_d1_wkup                ( pwr_d1_wkup                 ),
    .pwr_d2_ok                  ( pwr_d2_ok                   ),
    .pwr_d2_wkup                ( pwr_d2_wkup                 ),
    .pwr_d3_wkup                ( pwr_d3_wkup                 ),
    .pwr_por_rst                ( pwr_por_rst                 ),
    .pwr_vcore_ok               ( pwr_vcore_ok                ),
    .pwr_vsw_rst                ( pwr_vsw_rst                 ),
    .rcc_arcg_on                ( rcc_arcg_on                 ),
    .testmode                   ( testmode                    ),
    .uart4_ker_clk_req          ( uart4_ker_clk_req           ),
    .uart5_ker_clk_req          ( uart5_ker_clk_req           ),
    .uart7_ker_clk_req          ( uart7_ker_clk_req           ),
    .uart8_ker_clk_req          ( uart8_ker_clk_req           ),
    .usart1_ker_clk_req         ( usart1_ker_clk_req          ),
    .usart2_ker_clk_req         ( usart2_ker_clk_req          ),
    .usart3_ker_clk_req         ( usart3_ker_clk_req          ),
    .usart6_ker_clk_req         ( usart6_ker_clk_req          ),
    .wwdg1_out_rst              ( wwdg1_out_rst               ),
    .wwdg2_out_rst              ( wwdg2_out_rst               ),

    .c1_to_axi_div_en           ( c1_to_axi_div_en            ),
    .cpu1_rst_n                 ( cpu1_rst_n                  ),
    .cpu1_sync_rst_n            ( cpu1_sync_rst_n             ),
    .cpu2_rst_n                 ( cpu2_rst_n                  ),
    .cpu2_sync_rst_n            ( cpu2_sync_rst_n             ),
    .csikeron                   ( csikeron                    ),
    .csion                      ( csion                       ),
    .d1_bus_sync_rst_n          ( d1_bus_sync_rst_n           ),
    .d1_h2b_div_en              ( d1_h2b_div_en               ),
    .d2_bus_sync_rst_n          ( d2_bus_sync_rst_n           ),
    .d2_h2b1_div_en             ( d2_h2b1_div_en              ),
    .d2_h2b2_div_en             ( d2_h2b2_div_en              ),
    .d3_bus_sync_rst_n          ( d3_bus_sync_rst_n           ),
    .d3_h2b_div_en              ( d3_h2b_div_en               ),
    .divn1                      ( divn1                       ),
    .divn2                      ( divn2                       ),
    .divn3                      ( divn3                       ),
    .divp1                      ( divp1                       ),
    .divp1en                    ( divp1en                     ),
    .divp2                      ( divp2                       ),
    .divp2en                    ( divp2en                     ),
    .divp3                      ( divp3                       ),
    .divp3en                    ( divp3en                     ),
    .divq1                      ( divq1                       ),
    .divq1en                    ( divq1en                     ),
    .divq2                      ( divq2                       ),
    .divq2en                    ( divq2en                     ),
    .divq3                      ( divq3                       ),
    .divq3en                    ( divq3en                     ),
    .divr1                      ( divr1                       ),
    .divr1en                    ( divr1en                     ),
    .divr2                      ( divr2                       ),
    .divr2en                    ( divr2en                     ),
    .divr3                      ( divr3                       ),
    .divr3en                    ( divr3en                     ),
    .fracn1                     ( fracn1                      ),
    .fracn2                     ( fracn2                      ),
    .fracn3                     ( fracn3                      ),
    .hrdata                     ( hrdata                      ),
    .hreadyout                  ( hreadyout                   ),
    .hresp                      ( hresp                       ),
    .hsebyp                     ( hsebyp                      ),
    .hsecsson                   ( hsecsson                    ),
    .hseon                      ( hseon                       ),
    .hsi48on                    ( hsi48on                     ),
    .hsikeron                   ( hsikeron                    ),
    .hsion                      ( hsion                       ),
    .lsebyp                     ( lsebyp                      ),
    .lsecssd                    ( lsecssd                     ),
    .lsecsson                   ( lsecsson                    ),
    .lsedrv                     ( lsedrv                      ),
    .lseon                      ( lseon                       ),
    .mco1                       ( mco1                        ),
    .mco2                       ( mco2                        ),
    .nrst_out                   ( nrst_out                    ),
    .pll1_src_clk               ( pll1_src_clk                ),
    .pll1fracen                 ( pll1fracen                  ),
    .pll1on                     ( pll1on                      ),
    .pll1rge                    ( pll1rge                     ),
    .pll1vcosel                 ( pll1vcosel                  ),
    .pll2_src_clk               ( pll2_src_clk                ),
    .pll2fracen                 ( pll2fracen                  ),
    .pll2on                     ( pll2on                      ),
    .pll2rge                    ( pll2rge                     ),
    .pll2vcosel                 ( pll2vcosel                  ),
    .pll3_src_clk               ( pll3_src_clk                ),
    .pll3fracen                 ( pll3fracen                  ),
    .pll3on                     ( pll3on                      ),
    .pll3rge                    ( pll3rge                     ),
    .pll3vcosel                 ( pll3vcosel                  ),
    .pre_sys_clk                ( pre_sys_clk                 ),
    .pwr_por_rst_n              ( pwr_por_rst_n               ),
    .rcc_adc12_hclk             ( rcc_adc12_hclk              ),
    .rcc_adc12_ker_clk          ( rcc_adc12_ker_clk           ),
    .rcc_adc12_sync_rst_n       ( rcc_adc12_sync_rst_n        ),
    .rcc_adc3_hclk              ( rcc_adc3_hclk               ),
    .rcc_adc3_ker_clk           ( rcc_adc3_ker_clk            ),
    .rcc_adc3_sync_rst_n        ( rcc_adc3_sync_rst_n         ),
    .rcc_axisram_aclk           ( rcc_axisram_aclk            ),
    .rcc_axisram_sync_rst_n     ( rcc_axisram_sync_rst_n      ),
    .rcc_bdma_hclk              ( rcc_bdma_hclk               ),
    .rcc_bdma_sync_rst_n        ( rcc_bdma_sync_rst_n         ),
    .rcc_bkpram_hclk            ( rcc_bkpram_hclk             ),
    .rcc_bkpram_sync_rst_n      ( rcc_bkpram_sync_rst_n       ),
    .rcc_c1_clk                 ( rcc_c1_clk                  ),
    .rcc_c1_systick_clk         ( rcc_c1_systick_clk          ),
    .rcc_c2_clk                 ( rcc_c2_clk                  ),
    .rcc_c2_systick_clk         ( rcc_c2_systick_clk          ),
    .rcc_comp12_pclk            ( rcc_comp12_pclk             ),
    .rcc_comp12_sync_rst_n      ( rcc_comp12_sync_rst_n       ),
    .rcc_crc_hclk               ( rcc_crc_hclk                ),
    .rcc_crc_sync_rst_n         ( rcc_crc_sync_rst_n          ),
    .rcc_crs_pclk               ( rcc_crs_pclk                ),
    .rcc_crs_sync_rst_n         ( rcc_crs_sync_rst_n          ),
    .rcc_crypt_hclk             ( rcc_crypt_hclk              ),
    .rcc_crypt_sync_rst_n       ( rcc_crypt_sync_rst_n        ),
    .rcc_csi_triming            ( rcc_csi_triming             ),
    .rcc_dac12_pclk             ( rcc_dac12_pclk              ),
    .rcc_dac12_sync_rst_n       ( rcc_dac12_sync_rst_n        ),
    .rcc_dcmi_hclk              ( rcc_dcmi_hclk               ),
    .rcc_dcmi_sync_rst_n        ( rcc_dcmi_sync_rst_n         ),
    .rcc_dfsdm1_ker_clks        ( rcc_dfsdm1_ker_clks         ),
    .rcc_dfsdm1_pclk            ( rcc_dfsdm1_pclk             ),
    .rcc_dfsdm1_sync_rst_n      ( rcc_dfsdm1_sync_rst_n       ),
    .rcc_dma1_hclk              ( rcc_dma1_hclk               ),
    .rcc_dma1_sync_rst_n        ( rcc_dma1_sync_rst_n         ),
    .rcc_dma2_hclk              ( rcc_dma2_hclk               ),
    .rcc_dma2_sync_rst_n        ( rcc_dma2_sync_rst_n         ),
    .rcc_dma2d_aclk             ( rcc_dma2d_aclk              ),
    .rcc_dma2d_hclk             ( rcc_dma2d_hclk              ),
    .rcc_dma2d_sync_rst_n       ( rcc_dma2d_sync_rst_n        ),
    .rcc_dtcm1_hclk             ( rcc_dtcm1_hclk              ),
    .rcc_dtcm1_sync_rst_n       ( rcc_dtcm1_sync_rst_n        ),
    .rcc_dtcm2_hclk             ( rcc_dtcm2_hclk              ),
    .rcc_dtcm2_sync_rst_n       ( rcc_dtcm2_sync_rst_n        ),
    .rcc_eth1mac_hclk           ( rcc_eth1mac_hclk            ),
    .rcc_eth1mac_sync_rst_n     ( rcc_eth1mac_sync_rst_n      ),
    .rcc_eth1rx_hclk            ( rcc_eth1rx_hclk             ),
    .rcc_eth1rx_sync_rst_n      ( rcc_eth1rx_sync_rst_n       ),
    .rcc_eth1tx_hclk            ( rcc_eth1tx_hclk             ),
    .rcc_eth1tx_sync_rst_n      ( rcc_eth1tx_sync_rst_n       ),
    .rcc_eth_mii_rx_clk         ( rcc_eth_mii_rx_clk          ),
    .rcc_eth_mii_tx_clk         ( rcc_eth_mii_tx_clk          ),
    .rcc_eth_rmii_ref_clk       ( rcc_eth_rmii_ref_clk        ),
    .rcc_exti_pclk              ( rcc_exti_pclk               ),
    .rcc_exti_sync_rst_n        ( rcc_exti_sync_rst_n         ),
    .rcc_fclk_c1                ( rcc_fclk_c1                 ),
    .rcc_fclk_c2                ( rcc_fclk_c2                 ),
    .rcc_fdcan_ker_clk          ( rcc_fdcan_ker_clk           ),
    .rcc_fdcan_pclk             ( rcc_fdcan_pclk              ),
    .rcc_fdcan_sync_rst_n       ( rcc_fdcan_sync_rst_n        ),
    .rcc_flash_aclk             ( rcc_flash_aclk              ),
    .rcc_flash_hclk             ( rcc_flash_hclk              ),
    .rcc_flash_sync_rst_n       ( rcc_flash_sync_rst_n        ),
    .rcc_fmc_aclk               ( rcc_fmc_aclk                ),
    .rcc_fmc_hclk               ( rcc_fmc_hclk                ),
    .rcc_fmc_ker_clk            ( rcc_fmc_ker_clk             ),
    .rcc_fmc_sync_rst_n         ( rcc_fmc_sync_rst_n          ),
    .rcc_gpioa_hclk             ( rcc_gpioa_hclk              ),
    .rcc_gpioa_sync_rst_n       ( rcc_gpioa_sync_rst_n        ),
    .rcc_gpiob_hclk             ( rcc_gpiob_hclk              ),
    .rcc_gpiob_sync_rst_n       ( rcc_gpiob_sync_rst_n        ),
    .rcc_gpioc_hclk             ( rcc_gpioc_hclk              ),
    .rcc_gpioc_sync_rst_n       ( rcc_gpioc_sync_rst_n        ),
    .rcc_gpiod_hclk             ( rcc_gpiod_hclk              ),
    .rcc_gpiod_sync_rst_n       ( rcc_gpiod_sync_rst_n        ),
    .rcc_gpioe_hclk             ( rcc_gpioe_hclk              ),
    .rcc_gpioe_sync_rst_n       ( rcc_gpioe_sync_rst_n        ),
    .rcc_gpiof_hclk             ( rcc_gpiof_hclk              ),
    .rcc_gpiof_sync_rst_n       ( rcc_gpiof_sync_rst_n        ),
    .rcc_gpiog_hclk             ( rcc_gpiog_hclk              ),
    .rcc_gpiog_sync_rst_n       ( rcc_gpiog_sync_rst_n        ),
    .rcc_gpioh_hclk             ( rcc_gpioh_hclk              ),
    .rcc_gpioh_sync_rst_n       ( rcc_gpioh_sync_rst_n        ),
    .rcc_gpioi_hclk             ( rcc_gpioi_hclk              ),
    .rcc_gpioi_sync_rst_n       ( rcc_gpioi_sync_rst_n        ),
    .rcc_gpioj_hclk             ( rcc_gpioj_hclk              ),
    .rcc_gpioj_sync_rst_n       ( rcc_gpioj_sync_rst_n        ),
    .rcc_gpiok_hclk             ( rcc_gpiok_hclk              ),
    .rcc_gpiok_sync_rst_n       ( rcc_gpiok_sync_rst_n        ),
    .rcc_gpv_hclk               ( rcc_gpv_hclk                ),
    .rcc_gpv_sync_rst_n         ( rcc_gpv_sync_rst_n          ),
    .rcc_hash_hclk              ( rcc_hash_hclk               ),
    .rcc_hash_sync_rst_n        ( rcc_hash_sync_rst_n         ),
    .rcc_hdmicec_ker_clk        ( rcc_hdmicec_ker_clk         ),
    .rcc_hdmicec_pclk           ( rcc_hdmicec_pclk            ),
    .rcc_hdmicec_sync_rst_n     ( rcc_hdmicec_sync_rst_n      ),
    .rcc_hrtim_ker_clk          ( rcc_hrtim_ker_clk           ),
    .rcc_hrtim_pclk             ( rcc_hrtim_pclk              ),
    .rcc_hrtim_sync_rst_n       ( rcc_hrtim_sync_rst_n        ),
    .rcc_hrtimer_prescalar_clk  ( rcc_hrtimer_prescalar_clk   ),
    .rcc_hsefail_it             ( rcc_hsefail_it              ),
    .rcc_hsem_hclk              ( rcc_hsem_hclk               ),
    .rcc_hsem_sync_rst_n        ( rcc_hsem_sync_rst_n         ),
    .rcc_hsi_triming            ( rcc_hsi_triming             ),
    .rcc_i2c1_ker_clk           ( rcc_i2c1_ker_clk            ),
    .rcc_i2c1_pclk              ( rcc_i2c1_pclk               ),
    .rcc_i2c1_sync_rst_n        ( rcc_i2c1_sync_rst_n         ),
    .rcc_i2c2_ker_clk           ( rcc_i2c2_ker_clk            ),
    .rcc_i2c2_pclk              ( rcc_i2c2_pclk               ),
    .rcc_i2c2_sync_rst_n        ( rcc_i2c2_sync_rst_n         ),
    .rcc_i2c3_ker_clk           ( rcc_i2c3_ker_clk            ),
    .rcc_i2c3_pclk              ( rcc_i2c3_pclk               ),
    .rcc_i2c3_sync_rst_n        ( rcc_i2c3_sync_rst_n         ),
    .rcc_i2c4_ker_clk           ( rcc_i2c4_ker_clk            ),
    .rcc_i2c4_pclk              ( rcc_i2c4_pclk               ),
    .rcc_i2c4_sync_rst_n        ( rcc_i2c4_sync_rst_n         ),
    .rcc_it                     ( rcc_it                      ),
    .rcc_itcm_hclk              ( rcc_itcm_hclk               ),
    .rcc_itcm_sync_rst_n        ( rcc_itcm_sync_rst_n         ),
    .rcc_iwdg1_pclk             ( rcc_iwdg1_pclk              ),
    .rcc_iwdg1_sync_rst_n       ( rcc_iwdg1_sync_rst_n        ),
    .rcc_iwdg2_pclk             ( rcc_iwdg2_pclk              ),
    .rcc_iwdg2_sync_rst_n       ( rcc_iwdg2_sync_rst_n        ),
    .rcc_jpgdec_hclk            ( rcc_jpgdec_hclk             ),
    .rcc_jpgdec_sync_rst_n      ( rcc_jpgdec_sync_rst_n       ),
    .rcc_lptim1_ker_clk         ( rcc_lptim1_ker_clk          ),
    .rcc_lptim1_pclk            ( rcc_lptim1_pclk             ),
    .rcc_lptim1_sync_rst_n      ( rcc_lptim1_sync_rst_n       ),
    .rcc_lptim2_ker_clk         ( rcc_lptim2_ker_clk          ),
    .rcc_lptim2_pclk            ( rcc_lptim2_pclk             ),
    .rcc_lptim2_sync_rst_n      ( rcc_lptim2_sync_rst_n       ),
    .rcc_lptim3_ker_clk         ( rcc_lptim3_ker_clk          ),
    .rcc_lptim3_pclk            ( rcc_lptim3_pclk             ),
    .rcc_lptim3_sync_rst_n      ( rcc_lptim3_sync_rst_n       ),
    .rcc_lptim4_ker_clk         ( rcc_lptim4_ker_clk          ),
    .rcc_lptim4_pclk            ( rcc_lptim4_pclk             ),
    .rcc_lptim4_sync_rst_n      ( rcc_lptim4_sync_rst_n       ),
    .rcc_lptim5_ker_clk         ( rcc_lptim5_ker_clk          ),
    .rcc_lptim5_pclk            ( rcc_lptim5_pclk             ),
    .rcc_lptim5_sync_rst_n      ( rcc_lptim5_sync_rst_n       ),
    .rcc_lpuart1_ker_clk        ( rcc_lpuart1_ker_clk         ),
    .rcc_lpuart1_pclk           ( rcc_lpuart1_pclk            ),
    .rcc_lpuart1_sync_rst_n     ( rcc_lpuart1_sync_rst_n      ),
    .rcc_lsefail_it             ( rcc_lsefail_it              ),
    .rcc_ltdc_aclk              ( rcc_ltdc_aclk               ),
    .rcc_ltdc_ker_clk           ( rcc_ltdc_ker_clk            ),
    .rcc_ltdc_pclk              ( rcc_ltdc_pclk               ),
    .rcc_ltdc_sync_rst_n        ( rcc_ltdc_sync_rst_n         ),
    .rcc_mdios_pclk             ( rcc_mdios_pclk              ),
    .rcc_mdios_sync_rst_n       ( rcc_mdios_sync_rst_n        ),
    .rcc_mdma_aclk              ( rcc_mdma_aclk               ),
    .rcc_mdma_hclk              ( rcc_mdma_hclk               ),
    .rcc_mdma_sync_rst_n        ( rcc_mdma_sync_rst_n         ),
    .rcc_obl_clk                ( rcc_obl_clk                 ),
    .rcc_obl_rst_n              ( rcc_obl_rst_n               ),
    .rcc_opamp_pclk             ( rcc_opamp_pclk              ),
    .rcc_opamp_sync_rst_n       ( rcc_opamp_sync_rst_n        ),
    .rcc_pwr_d1_req             ( rcc_pwr_d1_req              ),
    .rcc_pwr_d2_req             ( rcc_pwr_d2_req              ),
    .rcc_pwr_d3_req             ( rcc_pwr_d3_req              ),
    .rcc_pwr_hclk               ( rcc_pwr_hclk                ),
    .rcc_pwr_sync_rst_n         ( rcc_pwr_sync_rst_n          ),
    .rcc_qspi_aclk              ( rcc_qspi_aclk               ),
    .rcc_qspi_hclk              ( rcc_qspi_hclk               ),
    .rcc_qspi_ker_clk           ( rcc_qspi_ker_clk            ),
    .rcc_qspi_sync_rst_n        ( rcc_qspi_sync_rst_n         ),
    .rcc_ramecc1_hclk           ( rcc_ramecc1_hclk            ),
    .rcc_ramecc1_sync_rst_n     ( rcc_ramecc1_sync_rst_n      ),
    .rcc_ramecc2_hclk           ( rcc_ramecc2_hclk            ),
    .rcc_ramecc2_sync_rst_n     ( rcc_ramecc2_sync_rst_n      ),
    .rcc_ramecc3_hclk           ( rcc_ramecc3_hclk            ),
    .rcc_ramecc3_sync_rst_n     ( rcc_ramecc3_sync_rst_n      ),
    .rcc_rcc_hclk               ( rcc_rcc_hclk                ),
    .rcc_rcc_sync_rst_n         ( rcc_rcc_sync_rst_n          ),
    .rcc_rng_hclk               ( rcc_rng_hclk                ),
    .rcc_rng_ker_clk            ( rcc_rng_ker_clk             ),
    .rcc_rng_sync_rst_n         ( rcc_rng_sync_rst_n          ),
    .rcc_rtc_ker_clk            ( rcc_rtc_ker_clk             ),
    .rcc_rtc_pclk               ( rcc_rtc_pclk                ),
    .rcc_rtc_sync_rst_n         ( rcc_rtc_sync_rst_n          ),
    .rcc_sai1_ker_clk           ( rcc_sai1_ker_clk            ),
    .rcc_sai1_pclk              ( rcc_sai1_pclk               ),
    .rcc_sai1_sync_rst_n        ( rcc_sai1_sync_rst_n         ),
    .rcc_sai2_ker_clk           ( rcc_sai2_ker_clk            ),
    .rcc_sai2_pclk              ( rcc_sai2_pclk               ),
    .rcc_sai2_sync_rst_n        ( rcc_sai2_sync_rst_n         ),
    .rcc_sai3_ker_clk           ( rcc_sai3_ker_clk            ),
    .rcc_sai3_pclk              ( rcc_sai3_pclk               ),
    .rcc_sai3_sync_rst_n        ( rcc_sai3_sync_rst_n         ),
    .rcc_sai4_ker_clks          ( rcc_sai4_ker_clks           ),
    .rcc_sai4_pclk              ( rcc_sai4_pclk               ),
    .rcc_sai4_sync_rst_n        ( rcc_sai4_sync_rst_n         ),
    .rcc_sdmmc1_hclk            ( rcc_sdmmc1_hclk             ),
    .rcc_sdmmc1_ker_clk         ( rcc_sdmmc1_ker_clk          ),
    .rcc_sdmmc1_sync_rst_n      ( rcc_sdmmc1_sync_rst_n       ),
    .rcc_sdmmc2_hclk            ( rcc_sdmmc2_hclk             ),
    .rcc_sdmmc2_ker_clk         ( rcc_sdmmc2_ker_clk          ),
    .rcc_sdmmc2_sync_rst_n      ( rcc_sdmmc2_sync_rst_n       ),
    .rcc_spdifrx_ker_clk        ( rcc_spdifrx_ker_clk         ),
    .rcc_spdifrx_pclk           ( rcc_spdifrx_pclk            ),
    .rcc_spdifrx_sync_rst_n     ( rcc_spdifrx_sync_rst_n      ),
    .rcc_spi1_ker_clk           ( rcc_spi1_ker_clk            ),
    .rcc_spi1_pclk              ( rcc_spi1_pclk               ),
    .rcc_spi1_sync_rst_n        ( rcc_spi1_sync_rst_n         ),
    .rcc_spi2_ker_clk           ( rcc_spi2_ker_clk            ),
    .rcc_spi2_pclk              ( rcc_spi2_pclk               ),
    .rcc_spi2_sync_rst_n        ( rcc_spi2_sync_rst_n         ),
    .rcc_spi3_ker_clk           ( rcc_spi3_ker_clk            ),
    .rcc_spi3_pclk              ( rcc_spi3_pclk               ),
    .rcc_spi3_sync_rst_n        ( rcc_spi3_sync_rst_n         ),
    .rcc_spi4_ker_clk           ( rcc_spi4_ker_clk            ),
    .rcc_spi4_pclk              ( rcc_spi4_pclk               ),
    .rcc_spi4_sync_rst_n        ( rcc_spi4_sync_rst_n         ),
    .rcc_spi5_ker_clk           ( rcc_spi5_ker_clk            ),
    .rcc_spi5_pclk              ( rcc_spi5_pclk               ),
    .rcc_spi5_sync_rst_n        ( rcc_spi5_sync_rst_n         ),
    .rcc_spi6_ker_clk           ( rcc_spi6_ker_clk            ),
    .rcc_spi6_pclk              ( rcc_spi6_pclk               ),
    .rcc_spi6_sync_rst_n        ( rcc_spi6_sync_rst_n         ),
    .rcc_sram1_hclk             ( rcc_sram1_hclk              ),
    .rcc_sram1_sync_rst_n       ( rcc_sram1_sync_rst_n        ),
    .rcc_sram2_hclk             ( rcc_sram2_hclk              ),
    .rcc_sram2_sync_rst_n       ( rcc_sram2_sync_rst_n        ),
    .rcc_sram3_hclk             ( rcc_sram3_hclk              ),
    .rcc_sram3_sync_rst_n       ( rcc_sram3_sync_rst_n        ),
    .rcc_sram4_hclk             ( rcc_sram4_hclk              ),
    .rcc_sram4_sync_rst_n       ( rcc_sram4_sync_rst_n        ),
    .rcc_swpmi_ker_clk          ( rcc_swpmi_ker_clk           ),
    .rcc_swpmi_pclk             ( rcc_swpmi_pclk              ),
    .rcc_swpmi_sync_rst_n       ( rcc_swpmi_sync_rst_n        ),
    .rcc_syscfg_pclk            ( rcc_syscfg_pclk             ),
    .rcc_syscfg_sync_rst_n      ( rcc_syscfg_sync_rst_n       ),
    .rcc_tim12_ker_clk          ( rcc_tim12_ker_clk           ),
    .rcc_tim12_pclk             ( rcc_tim12_pclk              ),
    .rcc_tim12_sync_rst_n       ( rcc_tim12_sync_rst_n        ),
    .rcc_tim13_ker_clk          ( rcc_tim13_ker_clk           ),
    .rcc_tim13_pclk             ( rcc_tim13_pclk              ),
    .rcc_tim13_sync_rst_n       ( rcc_tim13_sync_rst_n        ),
    .rcc_tim14_ker_clk          ( rcc_tim14_ker_clk           ),
    .rcc_tim14_pclk             ( rcc_tim14_pclk              ),
    .rcc_tim14_sync_rst_n       ( rcc_tim14_sync_rst_n        ),
    .rcc_tim15_ker_clk          ( rcc_tim15_ker_clk           ),
    .rcc_tim15_pclk             ( rcc_tim15_pclk              ),
    .rcc_tim15_sync_rst_n       ( rcc_tim15_sync_rst_n        ),
    .rcc_tim16_ker_clk          ( rcc_tim16_ker_clk           ),
    .rcc_tim16_pclk             ( rcc_tim16_pclk              ),
    .rcc_tim16_sync_rst_n       ( rcc_tim16_sync_rst_n        ),
    .rcc_tim17_ker_clk          ( rcc_tim17_ker_clk           ),
    .rcc_tim17_pclk             ( rcc_tim17_pclk              ),
    .rcc_tim17_sync_rst_n       ( rcc_tim17_sync_rst_n        ),
    .rcc_tim1_ker_clk           ( rcc_tim1_ker_clk            ),
    .rcc_tim1_pclk              ( rcc_tim1_pclk               ),
    .rcc_tim1_sync_rst_n        ( rcc_tim1_sync_rst_n         ),
    .rcc_tim2_ker_clk           ( rcc_tim2_ker_clk            ),
    .rcc_tim2_pclk              ( rcc_tim2_pclk               ),
    .rcc_tim2_sync_rst_n        ( rcc_tim2_sync_rst_n         ),
    .rcc_tim3_ker_clk           ( rcc_tim3_ker_clk            ),
    .rcc_tim3_pclk              ( rcc_tim3_pclk               ),
    .rcc_tim3_sync_rst_n        ( rcc_tim3_sync_rst_n         ),
    .rcc_tim4_ker_clk           ( rcc_tim4_ker_clk            ),
    .rcc_tim4_pclk              ( rcc_tim4_pclk               ),
    .rcc_tim4_sync_rst_n        ( rcc_tim4_sync_rst_n         ),
    .rcc_tim5_ker_clk           ( rcc_tim5_ker_clk            ),
    .rcc_tim5_pclk              ( rcc_tim5_pclk               ),
    .rcc_tim5_sync_rst_n        ( rcc_tim5_sync_rst_n         ),
    .rcc_tim6_ker_clk           ( rcc_tim6_ker_clk            ),
    .rcc_tim6_pclk              ( rcc_tim6_pclk               ),
    .rcc_tim6_sync_rst_n        ( rcc_tim6_sync_rst_n         ),
    .rcc_tim7_ker_clk           ( rcc_tim7_ker_clk            ),
    .rcc_tim7_pclk              ( rcc_tim7_pclk               ),
    .rcc_tim7_sync_rst_n        ( rcc_tim7_sync_rst_n         ),
    .rcc_tim8_ker_clk           ( rcc_tim8_ker_clk            ),
    .rcc_tim8_pclk              ( rcc_tim8_pclk               ),
    .rcc_tim8_sync_rst_n        ( rcc_tim8_sync_rst_n         ),
    .rcc_timx_ker_clk           ( rcc_timx_ker_clk            ),
    .rcc_timy_ker_clk           ( rcc_timy_ker_clk            ),
    .rcc_uart4_ker_clk          ( rcc_uart4_ker_clk           ),
    .rcc_uart4_pclk             ( rcc_uart4_pclk              ),
    .rcc_uart4_sync_rst_n       ( rcc_uart4_sync_rst_n        ),
    .rcc_uart5_ker_clk          ( rcc_uart5_ker_clk           ),
    .rcc_uart5_pclk             ( rcc_uart5_pclk              ),
    .rcc_uart5_sync_rst_n       ( rcc_uart5_sync_rst_n        ),
    .rcc_uart7_ker_clk          ( rcc_uart7_ker_clk           ),
    .rcc_uart7_pclk             ( rcc_uart7_pclk              ),
    .rcc_uart7_sync_rst_n       ( rcc_uart7_sync_rst_n        ),
    .rcc_uart8_ker_clk          ( rcc_uart8_ker_clk           ),
    .rcc_uart8_pclk             ( rcc_uart8_pclk              ),
    .rcc_uart8_sync_rst_n       ( rcc_uart8_sync_rst_n        ),
    .rcc_usart1_ker_clk         ( rcc_usart1_ker_clk          ),
    .rcc_usart1_pclk            ( rcc_usart1_pclk             ),
    .rcc_usart1_sync_rst_n      ( rcc_usart1_sync_rst_n       ),
    .rcc_usart2_ker_clk         ( rcc_usart2_ker_clk          ),
    .rcc_usart2_pclk            ( rcc_usart2_pclk             ),
    .rcc_usart2_sync_rst_n      ( rcc_usart2_sync_rst_n       ),
    .rcc_usart3_ker_clk         ( rcc_usart3_ker_clk          ),
    .rcc_usart3_pclk            ( rcc_usart3_pclk             ),
    .rcc_usart3_sync_rst_n      ( rcc_usart3_sync_rst_n       ),
    .rcc_usart6_ker_clk         ( rcc_usart6_ker_clk          ),
    .rcc_usart6_pclk            ( rcc_usart6_pclk             ),
    .rcc_usart6_sync_rst_n      ( rcc_usart6_sync_rst_n       ),
    .rcc_usb1otg_hclk           ( rcc_usb1otg_hclk            ),
    .rcc_usb1otg_ker_clk        ( rcc_usb1otg_ker_clk         ),
    .rcc_usb1otg_sync_rst_n     ( rcc_usb1otg_sync_rst_n      ),
    .rcc_usb1ulpi_hclk          ( rcc_usb1ulpi_hclk           ),
    .rcc_usb1ulpi_ker_clk       ( rcc_usb1ulpi_ker_clk        ),
    .rcc_usb1ulpi_sync_rst_n    ( rcc_usb1ulpi_sync_rst_n     ),
    .rcc_usb2otg_hclk           ( rcc_usb2otg_hclk            ),
    .rcc_usb2otg_ker_clk        ( rcc_usb2otg_ker_clk         ),
    .rcc_usb2otg_sync_rst_n     ( rcc_usb2otg_sync_rst_n      ),
    .rcc_usb2ulpi_hclk          ( rcc_usb2ulpi_hclk           ),
    .rcc_usb2ulpi_sync_rst_n    ( rcc_usb2ulpi_sync_rst_n     ),
    .rcc_vref_pclk              ( rcc_vref_pclk               ),
    .rcc_vref_sync_rst_n        ( rcc_vref_sync_rst_n         ),
    .rcc_wwdg1_pclk             ( rcc_wwdg1_pclk              ),
    .rcc_wwdg1_sync_rst_n       ( rcc_wwdg1_sync_rst_n        ),
    .rcc_wwdg2_pclk             ( rcc_wwdg2_pclk              ),
    .rcc_wwdg2_sync_rst_n       ( rcc_wwdg2_sync_rst_n        ),
    .stby_rst_n                 ( stby_rst_n                  ),
    .sys_d1cpre_clk             ( sys_d1cpre_clk              ),
    .sys_hpre_clk               ( sys_hpre_clk                )
);
