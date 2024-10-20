// rcc_vcore_rst_ctrl Inputs
wire   qspirst;
wire   fmcrst;
wire   dma2drst;
wire   mdmarst;
wire   ltdcrst;
wire   jpgdecrst;
wire   sdmmc1rst;
wire   usb2otgrst;
wire   usb1otgrst;
wire   eth1macrst;
wire   adc12rst;
wire   dma2rst;
wire   dma1rst;
wire   sdmmc2rst;
wire   rngrst;
wire   hashrst;
wire   cryptrst;
wire   dcmirst;
wire   uart8rst;
wire   uart7rst;
wire   dac12rst;
wire   hdmicecrst;
wire   i2c3rst;
wire   i2c2rst;
wire   i2c1rst;
wire   uart5rst;
wire   uart4rst;
wire   usart3rst;
wire   usart2rst;
wire   spdifrxrst;
wire   spi3rst;
wire   spi2rst;
wire   lptim1rst;
wire   tim14rst;
wire   tim13rst;
wire   tim12rst;
wire   tim7rst;
wire   tim6rst;
wire   tim5rst;
wire   tim4rst;
wire   tim3rst;
wire   tim2rst;
wire   fdcanrst;
wire   mdiosrst;
wire   opamprst;
wire   swpmirst;
wire   crsrst;
wire   hrtimrst;
wire   dfsdm1rst;
wire   sai3rst;
wire   sai2rst;
wire   sai1rst;
wire   spi5rst;
wire   tim17rst;
wire   tim16rst;
wire   tim15rst;
wire   spi4rst;
wire   spi1rst;
wire   usart6rst;
wire   usart1rst;
wire   tim8rst;
wire   tim1rst;
wire   hsemrst;
wire   adc3rst;
wire   bdmarst;
wire   crcrst;
wire   gpiokrst;
wire   gpiojrst;
wire   gpioirst;
wire   gpiohrst;
wire   gpiogrst;
wire   gpiofrst;
wire   gpioerst;
wire   gpiodrst;
wire   gpiocrst;
wire   gpiobrst;
wire   gpioarst;
wire   sai4rst;
wire   vrefrst;
wire   comp12rst;
wire   lptim5rst;
wire   lptim4rst;
wire   lptim3rst;
wire   lptim2rst;
wire   i2c4rst;
wire   spi6rst;
wire   lpuart1rst;
wire   syscfgrst;

// rcc_vcore_rst_ctrl Outputs
wire  pwr_por_rst_n;
wire  sys_rst_n;
wire  d1_rst_n;
wire  d2_rst_n;
wire  stby_rst_n;
wire  nrst_out;
wire  rcc_flash_rst_n;
wire  rcc_qspi_rst_n;
wire  rcc_axisram_rst_n;
wire  rcc_fmc_rst_n;
wire  rcc_dma2d_rst_n;
wire  rcc_mdma_rst_n;
wire  rcc_ltdc_rst_n;
wire  rcc_ramecc1_rst_n;
wire  rcc_gpv_rst_n;
wire  rcc_itcm_rst_n;
wire  rcc_dtcm2_rst_n;
wire  rcc_dtcm1_rst_n;
wire  rcc_jpgdec_rst_n;
wire  rcc_sdmmc1_rst_n;
wire  rcc_wwdg1_rst_n;
wire  rcc_usb2ulpi_rst_n;
wire  rcc_usb2otg_rst_n;
wire  rcc_usb1ulpi_rst_n;
wire  rcc_usb1otg_rst_n;
wire  rcc_eth1rx_rst_n;
wire  rcc_eth1tx_rst_n;
wire  rcc_eth1mac_rst_n;
wire  rcc_adc12_rst_n;
wire  rcc_dma2_rst_n;
wire  rcc_dma1_rst_n;
wire  rcc_sram3_rst_n;
wire  rcc_sram2_rst_n;
wire  rcc_sram1_rst_n;
wire  rcc_sdmmc2_rst_n;
wire  rcc_rng_rst_n;
wire  rcc_hash_rst_n;
wire  rcc_crypt_rst_n;
wire  rcc_dcmi_rst_n;
wire  rcc_ramecc2_rst_n;
wire  rcc_uart8_rst_n;
wire  rcc_uart7_rst_n;
wire  rcc_dac12_rst_n;
wire  rcc_hdmicec_rst_n;
wire  rcc_i2c3_rst_n;
wire  rcc_i2c2_rst_n;
wire  rcc_i2c1_rst_n;
wire  rcc_uart5_rst_n;
wire  rcc_uart4_rst_n;
wire  rcc_usart3_rst_n;
wire  rcc_usart2_rst_n;
wire  rcc_spdifrx_rst_n;
wire  rcc_spi3_rst_n;
wire  rcc_spi2_rst_n;
wire  rcc_wwdg2_rst_n;
wire  rcc_lptim1_rst_n;
wire  rcc_tim14_rst_n;
wire  rcc_tim13_rst_n;
wire  rcc_tim12_rst_n;
wire  rcc_tim7_rst_n;
wire  rcc_tim6_rst_n;
wire  rcc_tim5_rst_n;
wire  rcc_tim4_rst_n;
wire  rcc_tim3_rst_n;
wire  rcc_tim2_rst_n;
wire  rcc_fdcan_rst_n;
wire  rcc_mdios_rst_n;
wire  rcc_opamp_rst_n;
wire  rcc_swpmi_rst_n;
wire  rcc_crs_rst_n;
wire  rcc_hrtim_rst_n;
wire  rcc_dfsdm1_rst_n;
wire  rcc_sai3_rst_n;
wire  rcc_sai2_rst_n;
wire  rcc_sai1_rst_n;
wire  rcc_spi5_rst_n;
wire  rcc_tim17_rst_n;
wire  rcc_tim16_rst_n;
wire  rcc_tim15_rst_n;
wire  rcc_spi4_rst_n;
wire  rcc_spi1_rst_n;
wire  rcc_usart6_rst_n;
wire  rcc_usart1_rst_n;
wire  rcc_tim8_rst_n;
wire  rcc_tim1_rst_n;
wire  rcc_sram4_rst_n;
wire  rcc_bkpram_rst_n;
wire  rcc_ramecc3_rst_n;
wire  rcc_hsem_rst_n;
wire  rcc_adc3_rst_n;
wire  rcc_bdma_rst_n;
wire  rcc_crc_rst_n;
wire  rcc_gpiok_rst_n;
wire  rcc_gpioj_rst_n;
wire  rcc_gpioi_rst_n;
wire  rcc_gpioh_rst_n;
wire  rcc_gpiog_rst_n;
wire  rcc_gpiof_rst_n;
wire  rcc_gpioe_rst_n;
wire  rcc_gpiod_rst_n;
wire  rcc_gpioc_rst_n;
wire  rcc_gpiob_rst_n;
wire  rcc_gpioa_rst_n;
wire  rcc_rcc_rst_n;
wire  rcc_pwr_rst_n;
wire  rcc_sai4_rst_n;
wire  rcc_rtc_rst_n;
wire  rcc_vref_rst_n;
wire  rcc_comp12_rst_n;
wire  rcc_lptim5_rst_n;
wire  rcc_lptim4_rst_n;
wire  rcc_lptim3_rst_n;
wire  rcc_lptim2_rst_n;
wire  rcc_i2c4_rst_n;
wire  rcc_spi6_rst_n;
wire  rcc_lpuart1_rst_n;
wire  rcc_syscfg_rst_n;
wire  rcc_iwdg2_rst_n;
wire  rcc_iwdg1_rst_n;
wire  rcc_exti_rst_n;

rcc_vcore_rst_ctrl  u_rcc_vcore_rst_ctrl (
    .nrst_in                 ( nrst_in              ),
    .iwdg1_out_rst           ( iwdg1_out_rst        ),
    .wwdg1_out_rst           ( wwdg1_out_rst        ),
    .iwdg2_out_rst           ( iwdg2_out_rst        ),
    .wwdg2_out_rst           ( wwdg2_out_rst        ),
    .lpwr2_rst               ( lpwr2_rst            ),
    .lpwr1_rst               ( lpwr1_rst            ),
    .pwr_bor_rst             ( pwr_bor_rst          ),
    .pwr_por_rst             ( pwr_por_rst          ),
    .cpu2_sftrst             ( cpu2_sftrst          ),
    .cpu1_sftrst             ( cpu1_sftrst          ),
    .pwr_vcore_ok            ( pwr_vcore_ok         ),
    .pwr_d1_ok               ( pwr_d1_ok            ),
    .pwr_d2_ok               ( pwr_d2_ok            ),
    .flash_obl_reload        ( flash_obl_reload     ),
    .obl_done                ( obl_done             ),
    .sys_d1cpre_clk          ( sys_d1cpre_clk       ),
    .sys_hpre_clk            ( sys_hpre_clk         ),
    .qspirst                 ( qspirst              ),
    .fmcrst                  ( fmcrst               ),
    .dma2drst                ( dma2drst             ),
    .mdmarst                 ( mdmarst              ),
    .ltdcrst                 ( ltdcrst              ),
    .jpgdecrst               ( jpgdecrst            ),
    .sdmmc1rst               ( sdmmc1rst            ),
    .usb2otgrst              ( usb2otgrst           ),
    .usb1otgrst              ( usb1otgrst           ),
    .eth1macrst              ( eth1macrst           ),
    .adc12rst                ( adc12rst             ),
    .dma2rst                 ( dma2rst              ),
    .dma1rst                 ( dma1rst              ),
    .sdmmc2rst               ( sdmmc2rst            ),
    .rngrst                  ( rngrst               ),
    .hashrst                 ( hashrst              ),
    .cryptrst                ( cryptrst             ),
    .dcmirst                 ( dcmirst              ),
    .uart8rst                ( uart8rst             ),
    .uart7rst                ( uart7rst             ),
    .dac12rst                ( dac12rst             ),
    .hdmicecrst              ( hdmicecrst           ),
    .i2c3rst                 ( i2c3rst              ),
    .i2c2rst                 ( i2c2rst              ),
    .i2c1rst                 ( i2c1rst              ),
    .uart5rst                ( uart5rst             ),
    .uart4rst                ( uart4rst             ),
    .usart3rst               ( usart3rst            ),
    .usart2rst               ( usart2rst            ),
    .spdifrxrst              ( spdifrxrst           ),
    .spi3rst                 ( spi3rst              ),
    .spi2rst                 ( spi2rst              ),
    .lptim1rst               ( lptim1rst            ),
    .tim14rst                ( tim14rst             ),
    .tim13rst                ( tim13rst             ),
    .tim12rst                ( tim12rst             ),
    .tim7rst                 ( tim7rst              ),
    .tim6rst                 ( tim6rst              ),
    .tim5rst                 ( tim5rst              ),
    .tim4rst                 ( tim4rst              ),
    .tim3rst                 ( tim3rst              ),
    .tim2rst                 ( tim2rst              ),
    .fdcanrst                ( fdcanrst             ),
    .mdiosrst                ( mdiosrst             ),
    .opamprst                ( opamprst             ),
    .swpmirst                ( swpmirst             ),
    .crsrst                  ( crsrst               ),
    .hrtimrst                ( hrtimrst             ),
    .dfsdm1rst               ( dfsdm1rst            ),
    .sai3rst                 ( sai3rst              ),
    .sai2rst                 ( sai2rst              ),
    .sai1rst                 ( sai1rst              ),
    .spi5rst                 ( spi5rst              ),
    .tim17rst                ( tim17rst             ),
    .tim16rst                ( tim16rst             ),
    .tim15rst                ( tim15rst             ),
    .spi4rst                 ( spi4rst              ),
    .spi1rst                 ( spi1rst              ),
    .usart6rst               ( usart6rst            ),
    .usart1rst               ( usart1rst            ),
    .tim8rst                 ( tim8rst              ),
    .tim1rst                 ( tim1rst              ),
    .hsemrst                 ( hsemrst              ),
    .adc3rst                 ( adc3rst              ),
    .bdmarst                 ( bdmarst              ),
    .crcrst                  ( crcrst               ),
    .gpiokrst                ( gpiokrst             ),
    .gpiojrst                ( gpiojrst             ),
    .gpioirst                ( gpioirst             ),
    .gpiohrst                ( gpiohrst             ),
    .gpiogrst                ( gpiogrst             ),
    .gpiofrst                ( gpiofrst             ),
    .gpioerst                ( gpioerst             ),
    .gpiodrst                ( gpiodrst             ),
    .gpiocrst                ( gpiocrst             ),
    .gpiobrst                ( gpiobrst             ),
    .gpioarst                ( gpioarst             ),
    .sai4rst                 ( sai4rst              ),
    .vrefrst                 ( vrefrst              ),
    .comp12rst               ( comp12rst            ),
    .lptim5rst               ( lptim5rst            ),
    .lptim4rst               ( lptim4rst            ),
    .lptim3rst               ( lptim3rst            ),
    .lptim2rst               ( lptim2rst            ),
    .i2c4rst                 ( i2c4rst              ),
    .spi6rst                 ( spi6rst              ),
    .lpuart1rst              ( lpuart1rst           ),
    .syscfgrst               ( syscfgrst            ),

    .pwr_por_rst_n           ( pwr_por_rst_n        ),
    .sys_rst_n               ( sys_rst_n            ),
    .d1_rst_n                ( d1_rst_n             ),
    .d2_rst_n                ( d2_rst_n             ),
    .stby_rst_n              ( stby_rst_n           ),
    .nrst_out                ( nrst_out             ),
    .rcc_flash_rst_n         ( rcc_flash_rst_n      ),
    .rcc_qspi_rst_n          ( rcc_qspi_rst_n       ),
    .rcc_axisram_rst_n       ( rcc_axisram_rst_n    ),
    .rcc_fmc_rst_n           ( rcc_fmc_rst_n        ),
    .rcc_dma2d_rst_n         ( rcc_dma2d_rst_n      ),
    .rcc_mdma_rst_n          ( rcc_mdma_rst_n       ),
    .rcc_ltdc_rst_n          ( rcc_ltdc_rst_n       ),
    .rcc_ramecc1_rst_n       ( rcc_ramecc1_rst_n    ),
    .rcc_gpv_rst_n           ( rcc_gpv_rst_n        ),
    .rcc_itcm_rst_n          ( rcc_itcm_rst_n       ),
    .rcc_dtcm2_rst_n         ( rcc_dtcm2_rst_n      ),
    .rcc_dtcm1_rst_n         ( rcc_dtcm1_rst_n      ),
    .rcc_jpgdec_rst_n        ( rcc_jpgdec_rst_n     ),
    .rcc_sdmmc1_rst_n        ( rcc_sdmmc1_rst_n     ),
    .rcc_wwdg1_rst_n         ( rcc_wwdg1_rst_n      ),
    .rcc_usb2ulpi_rst_n      ( rcc_usb2ulpi_rst_n   ),
    .rcc_usb2otg_rst_n       ( rcc_usb2otg_rst_n    ),
    .rcc_usb1ulpi_rst_n      ( rcc_usb1ulpi_rst_n   ),
    .rcc_usb1otg_rst_n       ( rcc_usb1otg_rst_n    ),
    .rcc_eth1rx_rst_n        ( rcc_eth1rx_rst_n     ),
    .rcc_eth1tx_rst_n        ( rcc_eth1tx_rst_n     ),
    .rcc_eth1mac_rst_n       ( rcc_eth1mac_rst_n    ),
    .rcc_adc12_rst_n         ( rcc_adc12_rst_n      ),
    .rcc_dma2_rst_n          ( rcc_dma2_rst_n       ),
    .rcc_dma1_rst_n          ( rcc_dma1_rst_n       ),
    .rcc_sram3_rst_n         ( rcc_sram3_rst_n      ),
    .rcc_sram2_rst_n         ( rcc_sram2_rst_n      ),
    .rcc_sram1_rst_n         ( rcc_sram1_rst_n      ),
    .rcc_sdmmc2_rst_n        ( rcc_sdmmc2_rst_n     ),
    .rcc_rng_rst_n           ( rcc_rng_rst_n        ),
    .rcc_hash_rst_n          ( rcc_hash_rst_n       ),
    .rcc_crypt_rst_n         ( rcc_crypt_rst_n      ),
    .rcc_dcmi_rst_n          ( rcc_dcmi_rst_n       ),
    .rcc_ramecc2_rst_n       ( rcc_ramecc2_rst_n    ),
    .rcc_uart8_rst_n         ( rcc_uart8_rst_n      ),
    .rcc_uart7_rst_n         ( rcc_uart7_rst_n      ),
    .rcc_dac12_rst_n         ( rcc_dac12_rst_n      ),
    .rcc_hdmicec_rst_n       ( rcc_hdmicec_rst_n    ),
    .rcc_i2c3_rst_n          ( rcc_i2c3_rst_n       ),
    .rcc_i2c2_rst_n          ( rcc_i2c2_rst_n       ),
    .rcc_i2c1_rst_n          ( rcc_i2c1_rst_n       ),
    .rcc_uart5_rst_n         ( rcc_uart5_rst_n      ),
    .rcc_uart4_rst_n         ( rcc_uart4_rst_n      ),
    .rcc_usart3_rst_n        ( rcc_usart3_rst_n     ),
    .rcc_usart2_rst_n        ( rcc_usart2_rst_n     ),
    .rcc_spdifrx_rst_n       ( rcc_spdifrx_rst_n    ),
    .rcc_spi3_rst_n          ( rcc_spi3_rst_n       ),
    .rcc_spi2_rst_n          ( rcc_spi2_rst_n       ),
    .rcc_wwdg2_rst_n         ( rcc_wwdg2_rst_n      ),
    .rcc_lptim1_rst_n        ( rcc_lptim1_rst_n     ),
    .rcc_tim14_rst_n         ( rcc_tim14_rst_n      ),
    .rcc_tim13_rst_n         ( rcc_tim13_rst_n      ),
    .rcc_tim12_rst_n         ( rcc_tim12_rst_n      ),
    .rcc_tim7_rst_n          ( rcc_tim7_rst_n       ),
    .rcc_tim6_rst_n          ( rcc_tim6_rst_n       ),
    .rcc_tim5_rst_n          ( rcc_tim5_rst_n       ),
    .rcc_tim4_rst_n          ( rcc_tim4_rst_n       ),
    .rcc_tim3_rst_n          ( rcc_tim3_rst_n       ),
    .rcc_tim2_rst_n          ( rcc_tim2_rst_n       ),
    .rcc_fdcan_rst_n         ( rcc_fdcan_rst_n      ),
    .rcc_mdios_rst_n         ( rcc_mdios_rst_n      ),
    .rcc_opamp_rst_n         ( rcc_opamp_rst_n      ),
    .rcc_swpmi_rst_n         ( rcc_swpmi_rst_n      ),
    .rcc_crs_rst_n           ( rcc_crs_rst_n        ),
    .rcc_hrtim_rst_n         ( rcc_hrtim_rst_n      ),
    .rcc_dfsdm1_rst_n        ( rcc_dfsdm1_rst_n     ),
    .rcc_sai3_rst_n          ( rcc_sai3_rst_n       ),
    .rcc_sai2_rst_n          ( rcc_sai2_rst_n       ),
    .rcc_sai1_rst_n          ( rcc_sai1_rst_n       ),
    .rcc_spi5_rst_n          ( rcc_spi5_rst_n       ),
    .rcc_tim17_rst_n         ( rcc_tim17_rst_n      ),
    .rcc_tim16_rst_n         ( rcc_tim16_rst_n      ),
    .rcc_tim15_rst_n         ( rcc_tim15_rst_n      ),
    .rcc_spi4_rst_n          ( rcc_spi4_rst_n       ),
    .rcc_spi1_rst_n          ( rcc_spi1_rst_n       ),
    .rcc_usart6_rst_n        ( rcc_usart6_rst_n     ),
    .rcc_usart1_rst_n        ( rcc_usart1_rst_n     ),
    .rcc_tim8_rst_n          ( rcc_tim8_rst_n       ),
    .rcc_tim1_rst_n          ( rcc_tim1_rst_n       ),
    .rcc_sram4_rst_n         ( rcc_sram4_rst_n      ),
    .rcc_bkpram_rst_n        ( rcc_bkpram_rst_n     ),
    .rcc_ramecc3_rst_n       ( rcc_ramecc3_rst_n    ),
    .rcc_hsem_rst_n          ( rcc_hsem_rst_n       ),
    .rcc_adc3_rst_n          ( rcc_adc3_rst_n       ),
    .rcc_bdma_rst_n          ( rcc_bdma_rst_n       ),
    .rcc_crc_rst_n           ( rcc_crc_rst_n        ),
    .rcc_gpiok_rst_n         ( rcc_gpiok_rst_n      ),
    .rcc_gpioj_rst_n         ( rcc_gpioj_rst_n      ),
    .rcc_gpioi_rst_n         ( rcc_gpioi_rst_n      ),
    .rcc_gpioh_rst_n         ( rcc_gpioh_rst_n      ),
    .rcc_gpiog_rst_n         ( rcc_gpiog_rst_n      ),
    .rcc_gpiof_rst_n         ( rcc_gpiof_rst_n      ),
    .rcc_gpioe_rst_n         ( rcc_gpioe_rst_n      ),
    .rcc_gpiod_rst_n         ( rcc_gpiod_rst_n      ),
    .rcc_gpioc_rst_n         ( rcc_gpioc_rst_n      ),
    .rcc_gpiob_rst_n         ( rcc_gpiob_rst_n      ),
    .rcc_gpioa_rst_n         ( rcc_gpioa_rst_n      ),
    .rcc_rcc_rst_n           ( rcc_rcc_rst_n        ),
    .rcc_pwr_rst_n           ( rcc_pwr_rst_n        ),
    .rcc_sai4_rst_n          ( rcc_sai4_rst_n       ),
    .rcc_rtc_rst_n           ( rcc_rtc_rst_n        ),
    .rcc_vref_rst_n          ( rcc_vref_rst_n       ),
    .rcc_comp12_rst_n        ( rcc_comp12_rst_n     ),
    .rcc_lptim5_rst_n        ( rcc_lptim5_rst_n     ),
    .rcc_lptim4_rst_n        ( rcc_lptim4_rst_n     ),
    .rcc_lptim3_rst_n        ( rcc_lptim3_rst_n     ),
    .rcc_lptim2_rst_n        ( rcc_lptim2_rst_n     ),
    .rcc_i2c4_rst_n          ( rcc_i2c4_rst_n       ),
    .rcc_spi6_rst_n          ( rcc_spi6_rst_n       ),
    .rcc_lpuart1_rst_n       ( rcc_lpuart1_rst_n    ),
    .rcc_syscfg_rst_n        ( rcc_syscfg_rst_n     ),
    .rcc_iwdg2_rst_n         ( rcc_iwdg2_rst_n      ),
    .rcc_iwdg1_rst_n         ( rcc_iwdg1_rst_n      ),
    .rcc_exti_rst_n          ( rcc_exti_rst_n       )
);
