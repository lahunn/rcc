// per_ker_rst_control Inputs
reg   qspirst;
reg   fmcrst;
reg   dma2drst;
reg   mdmarst;
reg   ltdcrst;
reg   jpgdecrst;
reg   sdmmc1rst;
reg   usb2otgrst;
reg   usb1otgrst;
reg   eth1macrst;
reg   adc12rst;
reg   dma2rst;
reg   dma1rst;
reg   sdmmc2rst;
reg   rngrst;
reg   hashrst;
reg   cryptrst;
reg   dcmirst;
reg   uart8rst;
reg   uart7rst;
reg   dac12rst;
reg   hdmicecrst;
reg   i2c3rst;
reg   i2c2rst;
reg   i2c1rst;
reg   uart5rst;
reg   uart4rst;
reg   usart3rst;
reg   usart2rst;
reg   spdifrxrst;
reg   spi3rst;
reg   spi2rst;
reg   lptim1rst;
reg   tim14rst;
reg   tim13rst;
reg   tim12rst;
reg   tim7rst;
reg   tim6rst;
reg   tim5rst;
reg   tim4rst;
reg   tim3rst;
reg   tim2rst;
reg   fdcanrst;
reg   mdiosrst;
reg   opamprst;
reg   swpmirst;
reg   crsrst;
reg   hrtimrst;
reg   dfsdm1rst;
reg   sai3rst;
reg   sai2rst;
reg   sai1rst;
reg   spi5rst;
reg   tim17rst;
reg   tim16rst;
reg   tim15rst;
reg   spi4rst;
reg   spi1rst;
reg   usart6rst;
reg   usart1rst;
reg   tim8rst;
reg   tim1rst;
reg   hsemrst;
reg   adc3rst;
reg   bdmarst;
reg   crcrst;
reg   gpiokrst;
reg   gpiojrst;
reg   gpioirst;
reg   gpiohrst;
reg   gpiogrst;
reg   gpiofrst;
reg   gpioerst;
reg   gpiodrst;
reg   gpiocrst;
reg   gpiobrst;
reg   gpioarst;
reg   sai4rst;
reg   vrefrst;
reg   comp12rst;
reg   lptim5rst;
reg   lptim4rst;
reg   lptim3rst;
reg   lptim2rst;
reg   i2c4rst;
reg   spi6rst;
reg   lpuart1rst;
reg   syscfgrst;
reg   sys_rst_n;
reg   d1_rst_n;
reg   d2_rst_n;

// per_ker_rst_control Outputs
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

per_ker_rst_control  u_per_ker_rst_control (
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
    .sys_rst_n               ( sys_rst_n            ),
    .d1_rst_n                ( d1_rst_n             ),
    .d2_rst_n                ( d2_rst_n             ),

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
