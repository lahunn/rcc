// rcc_vcore_clk_ctrl Inputs
reg   pad_rcc_eth_mii_tx_clk;
reg   pad_rcc_eth_mii_rx_clk;
reg   USB_PHY1;
reg   d3_deepsleep;
reg   c2_sleep;
reg   c2_deepsleep;
reg   c1_sleep;
reg   c1_deepsleep;
reg   rcc_d1_stop;
reg   rcc_d2_stop;
reg   rcc_sys_stop;
reg   hse_css_fail;
reg   hse_clk_pre;
reg   lse_clk;
reg   lsi_clk;
reg   hsi48_clk;
reg   csi_clk_pre;
reg   hsi_origin_clk;
reg   sys_rst_n;
reg   [1:0]  pll_src_sel;
reg   pll1_q_clk;
reg   pll1_p_clk;
reg   pll2_p_clk;
reg   pll2_q_clk;
reg   pll2_r_clk;
reg   pll3_p_clk;
reg   pll3_q_clk;
reg   pll3_r_clk;
reg   I2S_clk_IN;
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
reg   rcc_sram4_amen;
reg   rcc_bkpram_amen;
reg   rcc_adc3_amen;
reg   rcc_bdma_amen;
reg   rcc_crc_amen;
reg   rcc_gpiok_amen;
reg   rcc_gpioj_amen;
reg   rcc_gpioi_amen;
reg   rcc_gpioh_amen;
reg   rcc_gpiog_amen;
reg   rcc_gpiof_amen;
reg   rcc_gpioe_amen;
reg   rcc_gpiod_amen;
reg   rcc_gpioc_amen;
reg   rcc_gpiob_amen;
reg   rcc_gpioa_amen;
reg   rcc_sai4_amen;
reg   rcc_rtc_amen;
reg   rcc_vref_amen;
reg   rcc_comp12_amen;
reg   rcc_lptim5_amen;
reg   rcc_lptim4_amen;
reg   rcc_lptim3_amen;
reg   rcc_lptim2_amen;
reg   rcc_i2c4_amen;
reg   i2c4_ker_clk_req;
reg   rcc_spi6_amen;
reg   rcc_lpuart1_amen;
reg   lpuart1_ker_clk_req;
reg   rcc_syscfg_amen;
reg   [1:0]  qspisel;
reg   [1:0]  fmcsel;
reg   sdmmcsel;
reg   [1:0]  usbsel;
reg   [1:0]  adcsel;
reg   [1:0]  rngsel;
reg   [1:0]  cecsel;
reg   [1:0]  i2c123sel;
reg   [2:0]  usart234578sel;
reg   [1:0]  spdifsel;
reg   [2:0]  lptim1sel;
reg   [1:0]  fdcansel;
reg   swpmisel;
reg   [2:0]  sai1sel;
reg   dfsdm1sel;
reg   [2:0]  sai23sel;
reg   [2:0]  spi45sel;
reg   [2:0]  spi123sel;
reg   [2:0]  usart16sel;
reg   [2:0]  sai4asel;
reg   [2:0]  sai4bsel;
reg   [2:0]  lptim345sel;
reg   [2:0]  lptim2sel;
reg   [1:0]  i2c4sel;
reg   [2:0]  spi6sel;
reg   [2:0]  lpuart1sel;
reg   eth_rcc_fes;
reg   eth_rcc_epis_2;
reg   [2:0]  mco1sel;
reg   [2:0]  mco2sel;
reg   [3:0]  mco1pre;
reg   [3:0]  mco2pre;
reg   [5:0]  rtcpre;
reg   [2:0]  hsidiv;
reg   [1:0]  sys_clk_sw;
reg   [3:0]  d1cpre;
reg   [2:0]  d1ppre;
reg   [3:0]  hpre;
reg   [2:0]  d2ppre1;
reg   [2:0]  d2ppre2;
reg   [2:0]  d3ppre;
reg   timpre;
reg   hrtimsel;
reg   [1:0]  clkpersel;
reg   [5:0]  divm1;
reg   [5:0]  divm2;
reg   [5:0]  divm3;

// rcc_vcore_clk_ctrl Outputs
wire  mco1;
wire  mco2;
wire  c2_per_alloc_d1;
wire  c1_per_alloc_d2;
wire  rcc_c2_clk;
wire  rcc_fclk_c2;
wire  rcc_c2_systick_clk;
wire  rcc_c1_clk;
wire  rcc_fclk_c1;
wire  rcc_c1_systick_clk;
wire  rcc_timx_ker_clk;
wire  rcc_timy_ker_clk;
wire  rcc_hrtimer_prescalar_clk;
wire  sys_d1cpre_clk;
wire  sys_hpre_clk;
wire  hse_rtc_clk;
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
wire  rcc_eth_mii_tx_clk;
wire  rcc_eth_mii_rx_clk;
wire  rcc_eth_rmii_ref_clk;

rcc_vcore_clk_ctrl  u_rcc_vcore_clk_ctrl (
    .pad_rcc_eth_mii_tx_clk     ( pad_rcc_eth_mii_tx_clk      ),
    .pad_rcc_eth_mii_rx_clk     ( pad_rcc_eth_mii_rx_clk      ),
    .USB_PHY1                   ( USB_PHY1                    ),
    .d3_deepsleep               ( d3_deepsleep                ),
    .c2_sleep                   ( c2_sleep                    ),
    .c2_deepsleep               ( c2_deepsleep                ),
    .c1_sleep                   ( c1_sleep                    ),
    .c1_deepsleep               ( c1_deepsleep                ),
    .rcc_d1_stop                ( rcc_d1_stop                 ),
    .rcc_d2_stop                ( rcc_d2_stop                 ),
    .rcc_sys_stop               ( rcc_sys_stop                ),
    .hse_css_fail               ( hse_css_fail                ),
    .hse_clk_pre                ( hse_clk_pre                 ),
    .lse_clk                    ( lse_clk                     ),
    .lsi_clk                    ( lsi_clk                     ),
    .hsi48_clk                  ( hsi48_clk                   ),
    .csi_clk_pre                ( csi_clk_pre                 ),
    .hsi_origin_clk             ( hsi_origin_clk              ),
    .sys_rst_n                  ( sys_rst_n                   ),
    .pll_src_sel                ( pll_src_sel                 ),
    .pll1_q_clk                 ( pll1_q_clk                  ),
    .pll1_p_clk                 ( pll1_p_clk                  ),
    .pll2_p_clk                 ( pll2_p_clk                  ),
    .pll2_q_clk                 ( pll2_q_clk                  ),
    .pll2_r_clk                 ( pll2_r_clk                  ),
    .pll3_p_clk                 ( pll3_p_clk                  ),
    .pll3_q_clk                 ( pll3_q_clk                  ),
    .pll3_r_clk                 ( pll3_r_clk                  ),
    .I2S_clk_IN                 ( I2S_clk_IN                  ),
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
    .rcc_sram4_amen             ( rcc_sram4_amen              ),
    .rcc_bkpram_amen            ( rcc_bkpram_amen             ),
    .rcc_adc3_amen              ( rcc_adc3_amen               ),
    .rcc_bdma_amen              ( rcc_bdma_amen               ),
    .rcc_crc_amen               ( rcc_crc_amen                ),
    .rcc_gpiok_amen             ( rcc_gpiok_amen              ),
    .rcc_gpioj_amen             ( rcc_gpioj_amen              ),
    .rcc_gpioi_amen             ( rcc_gpioi_amen              ),
    .rcc_gpioh_amen             ( rcc_gpioh_amen              ),
    .rcc_gpiog_amen             ( rcc_gpiog_amen              ),
    .rcc_gpiof_amen             ( rcc_gpiof_amen              ),
    .rcc_gpioe_amen             ( rcc_gpioe_amen              ),
    .rcc_gpiod_amen             ( rcc_gpiod_amen              ),
    .rcc_gpioc_amen             ( rcc_gpioc_amen              ),
    .rcc_gpiob_amen             ( rcc_gpiob_amen              ),
    .rcc_gpioa_amen             ( rcc_gpioa_amen              ),
    .rcc_sai4_amen              ( rcc_sai4_amen               ),
    .rcc_rtc_amen               ( rcc_rtc_amen                ),
    .rcc_vref_amen              ( rcc_vref_amen               ),
    .rcc_comp12_amen            ( rcc_comp12_amen             ),
    .rcc_lptim5_amen            ( rcc_lptim5_amen             ),
    .rcc_lptim4_amen            ( rcc_lptim4_amen             ),
    .rcc_lptim3_amen            ( rcc_lptim3_amen             ),
    .rcc_lptim2_amen            ( rcc_lptim2_amen             ),
    .rcc_i2c4_amen              ( rcc_i2c4_amen               ),
    .i2c4_ker_clk_req           ( i2c4_ker_clk_req            ),
    .rcc_spi6_amen              ( rcc_spi6_amen               ),
    .rcc_lpuart1_amen           ( rcc_lpuart1_amen            ),
    .lpuart1_ker_clk_req        ( lpuart1_ker_clk_req         ),
    .rcc_syscfg_amen            ( rcc_syscfg_amen             ),
    .qspisel                    ( qspisel                     ),
    .fmcsel                     ( fmcsel                      ),
    .sdmmcsel                   ( sdmmcsel                    ),
    .usbsel                     ( usbsel                      ),
    .adcsel                     ( adcsel                      ),
    .rngsel                     ( rngsel                      ),
    .cecsel                     ( cecsel                      ),
    .i2c123sel                  ( i2c123sel                   ),
    .usart234578sel             ( usart234578sel              ),
    .spdifsel                   ( spdifsel                    ),
    .lptim1sel                  ( lptim1sel                   ),
    .fdcansel                   ( fdcansel                    ),
    .swpmisel                   ( swpmisel                    ),
    .sai1sel                    ( sai1sel                     ),
    .dfsdm1sel                  ( dfsdm1sel                   ),
    .sai23sel                   ( sai23sel                    ),
    .spi45sel                   ( spi45sel                    ),
    .spi123sel                  ( spi123sel                   ),
    .usart16sel                 ( usart16sel                  ),
    .sai4asel                   ( sai4asel                    ),
    .sai4bsel                   ( sai4bsel                    ),
    .lptim345sel                ( lptim345sel                 ),
    .lptim2sel                  ( lptim2sel                   ),
    .i2c4sel                    ( i2c4sel                     ),
    .spi6sel                    ( spi6sel                     ),
    .lpuart1sel                 ( lpuart1sel                  ),
    .eth_rcc_fes                ( eth_rcc_fes                 ),
    .eth_rcc_epis_2             ( eth_rcc_epis_2              ),
    .mco1sel                    ( mco1sel                     ),
    .mco2sel                    ( mco2sel                     ),
    .mco1pre                    ( mco1pre                     ),
    .mco2pre                    ( mco2pre                     ),
    .rtcpre                     ( rtcpre                      ),
    .hsidiv                     ( hsidiv                      ),
    .sys_clk_sw                 ( sys_clk_sw                  ),
    .d1cpre                     ( d1cpre                      ),
    .d1ppre                     ( d1ppre                      ),
    .hpre                       ( hpre                        ),
    .d2ppre1                    ( d2ppre1                     ),
    .d2ppre2                    ( d2ppre2                     ),
    .d3ppre                     ( d3ppre                      ),
    .timpre                     ( timpre                      ),
    .hrtimsel                   ( hrtimsel                    ),
    .clkpersel                  ( clkpersel                   ),
    .divm1                      ( divm1                       ),
    .divm2                      ( divm2                       ),
    .divm3                      ( divm3                       ),

    .mco1                       ( mco1                        ),
    .mco2                       ( mco2                        ),
    .c2_per_alloc_d1            ( c2_per_alloc_d1             ),
    .c1_per_alloc_d2            ( c1_per_alloc_d2             ),
    .rcc_c2_clk                 ( rcc_c2_clk                  ),
    .rcc_fclk_c2                ( rcc_fclk_c2                 ),
    .rcc_c2_systick_clk         ( rcc_c2_systick_clk          ),
    .rcc_c1_clk                 ( rcc_c1_clk                  ),
    .rcc_fclk_c1                ( rcc_fclk_c1                 ),
    .rcc_c1_systick_clk         ( rcc_c1_systick_clk          ),
    .rcc_timx_ker_clk           ( rcc_timx_ker_clk            ),
    .rcc_timy_ker_clk           ( rcc_timy_ker_clk            ),
    .rcc_hrtimer_prescalar_clk  ( rcc_hrtimer_prescalar_clk   ),
    .sys_d1cpre_clk             ( sys_d1cpre_clk              ),
    .sys_hpre_clk               ( sys_hpre_clk                ),
    .hse_rtc_clk                ( hse_rtc_clk                 ),
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
    .rcc_exti_pclk              ( rcc_exti_pclk               ),
    .rcc_eth_mii_tx_clk         ( rcc_eth_mii_tx_clk          ),
    .rcc_eth_mii_rx_clk         ( rcc_eth_mii_rx_clk          ),
    .rcc_eth_rmii_ref_clk       ( rcc_eth_rmii_ref_clk        )
);
