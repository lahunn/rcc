module rcc_sys_async_reset_clk_gate #(
    parameter CLK_ON_AFTER_PER_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_SYS_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_D1_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_D2_RST_RELEASE = 8
)(
    input rcc_arcg_on,
    input sys_clk,
    input sys_d1cpre_clk,
    input sys_hpre_clk,
    output d1_clk_arcg_en,
    output d2_clk_arcg_en,
    output sys_clk_arcg_en,
    output sys_arcg_rst_n,
    output d1_arcg_rst_n,
    output d2_arcg_rst_n,
    input rcc_flash_hclk,
    input rcc_qspi_hclk,
    input rcc_axisram_aclk,
    input rcc_fmc_hclk,
    input rcc_dma2d_hclk,
    input rcc_mdma_hclk,
    input rcc_ltdc_pclk,
    input rcc_ramecc1_hclk,
    input rcc_gpv_hclk,
    input rcc_itcm_hclk,
    input rcc_dtcm2_hclk,
    input rcc_dtcm1_hclk,
    input rcc_jpgdec_hclk,
    input rcc_sdmmc1_hclk,
    input rcc_wwdg1_pclk,
    input rcc_usb2ulpi_hclk,
    input rcc_usb2otg_hclk,
    input rcc_usb1ulpi_hclk,
    input rcc_usb1otg_hclk,
    input rcc_eth1rx_hclk,
    input rcc_eth1tx_hclk,
    input rcc_eth1mac_hclk,
    input rcc_adc12_hclk,
    input rcc_dma2_hclk,
    input rcc_dma1_hclk,
    input rcc_sram3_hclk,
    input rcc_sram2_hclk,
    input rcc_sram1_hclk,
    input rcc_sdmmc2_hclk,
    input rcc_rng_hclk,
    input rcc_hash_hclk,
    input rcc_crypt_hclk,
    input rcc_dcmi_hclk,
    input rcc_ramecc2_hclk,
    input rcc_uart8_pclk,
    input rcc_uart7_pclk,
    input rcc_dac12_pclk,
    input rcc_hdmicec_pclk,
    input rcc_i2c3_pclk,
    input rcc_i2c2_pclk,
    input rcc_i2c1_pclk,
    input rcc_uart5_pclk,
    input rcc_uart4_pclk,
    input rcc_usart3_pclk,
    input rcc_usart2_pclk,
    input rcc_spdifrx_pclk,
    input rcc_spi3_pclk,
    input rcc_spi2_pclk,
    input rcc_wwdg2_pclk,
    input rcc_lptim1_pclk,
    input rcc_tim14_pclk,
    input rcc_tim13_pclk,
    input rcc_tim12_pclk,
    input rcc_tim7_pclk,
    input rcc_tim6_pclk,
    input rcc_tim5_pclk,
    input rcc_tim4_pclk,
    input rcc_tim3_pclk,
    input rcc_tim2_pclk,
    input rcc_fdcan_pclk,
    input rcc_mdios_pclk,
    input rcc_opamp_pclk,
    input rcc_swpmi_pclk,
    input rcc_crs_pclk,
    input rcc_hrtim_pclk,
    input rcc_dfsdm1_pclk,
    input rcc_sai3_pclk,
    input rcc_sai2_pclk,
    input rcc_sai1_pclk,
    input rcc_spi5_pclk,
    input rcc_tim17_pclk,
    input rcc_tim16_pclk,
    input rcc_tim15_pclk,
    input rcc_spi4_pclk,
    input rcc_spi1_pclk,
    input rcc_usart6_pclk,
    input rcc_usart1_pclk,
    input rcc_tim8_pclk,
    input rcc_tim1_pclk,
    input rcc_sram4_hclk,
    input rcc_bkpram_hclk,
    input rcc_ramecc3_hclk,
    input rcc_hsem_hclk,
    input rcc_adc3_hclk,
    input rcc_bdma_hclk,
    input rcc_crc_hclk,
    input rcc_gpiok_hclk,
    input rcc_gpioj_hclk,
    input rcc_gpioi_hclk,
    input rcc_gpioh_hclk,
    input rcc_gpiog_hclk,
    input rcc_gpiof_hclk,
    input rcc_gpioe_hclk,
    input rcc_gpiod_hclk,
    input rcc_gpioc_hclk,
    input rcc_gpiob_hclk,
    input rcc_gpioa_hclk,
    input rcc_rcc_hclk,
    input rcc_pwr_hclk,
    input rcc_sai4_pclk,
    input rcc_rtc_pclk,
    input rcc_vref_pclk,
    input rcc_comp12_pclk,
    input rcc_lptim5_pclk,
    input rcc_lptim4_pclk,
    input rcc_lptim3_pclk,
    input rcc_lptim2_pclk,
    input rcc_i2c4_pclk,
    input rcc_spi6_pclk,
    input rcc_lpuart1_pclk,
    input rcc_syscfg_pclk,
    input rcc_iwdg2_pclk,
    input rcc_iwdg1_pclk,
    input rcc_exti_pclk,
    input rcc_flash_rst_n,
    input rcc_qspi_rst_n,
    input rcc_axisram_rst_n,
    input rcc_fmc_rst_n,
    input rcc_dma2d_rst_n,
    input rcc_mdma_rst_n,
    input rcc_ltdc_rst_n,
    input rcc_ramecc1_rst_n,
    input rcc_gpv_rst_n,
    input rcc_itcm_rst_n,
    input rcc_dtcm2_rst_n,
    input rcc_dtcm1_rst_n,
    input rcc_jpgdec_rst_n,
    input rcc_sdmmc1_rst_n,
    input rcc_wwdg1_rst_n,
    input rcc_usb2ulpi_rst_n,
    input rcc_usb2otg_rst_n,
    input rcc_usb1ulpi_rst_n,
    input rcc_usb1otg_rst_n,
    input rcc_eth1rx_rst_n,
    input rcc_eth1tx_rst_n,
    input rcc_eth1mac_rst_n,
    input rcc_adc12_rst_n,
    input rcc_dma2_rst_n,
    input rcc_dma1_rst_n,
    input rcc_sram3_rst_n,
    input rcc_sram2_rst_n,
    input rcc_sram1_rst_n,
    input rcc_sdmmc2_rst_n,
    input rcc_rng_rst_n,
    input rcc_hash_rst_n,
    input rcc_crypt_rst_n,
    input rcc_dcmi_rst_n,
    input rcc_ramecc2_rst_n,
    input rcc_uart8_rst_n,
    input rcc_uart7_rst_n,
    input rcc_dac12_rst_n,
    input rcc_hdmicec_rst_n,
    input rcc_i2c3_rst_n,
    input rcc_i2c2_rst_n,
    input rcc_i2c1_rst_n,
    input rcc_uart5_rst_n,
    input rcc_uart4_rst_n,
    input rcc_usart3_rst_n,
    input rcc_usart2_rst_n,
    input rcc_spdifrx_rst_n,
    input rcc_spi3_rst_n,
    input rcc_spi2_rst_n,
    input rcc_wwdg2_rst_n,
    input rcc_lptim1_rst_n,
    input rcc_tim14_rst_n,
    input rcc_tim13_rst_n,
    input rcc_tim12_rst_n,
    input rcc_tim7_rst_n,
    input rcc_tim6_rst_n,
    input rcc_tim5_rst_n,
    input rcc_tim4_rst_n,
    input rcc_tim3_rst_n,
    input rcc_tim2_rst_n,
    input rcc_fdcan_rst_n,
    input rcc_mdios_rst_n,
    input rcc_opamp_rst_n,
    input rcc_swpmi_rst_n,
    input rcc_crs_rst_n,
    input rcc_hrtim_rst_n,
    input rcc_dfsdm1_rst_n,
    input rcc_sai3_rst_n,
    input rcc_sai2_rst_n,
    input rcc_sai1_rst_n,
    input rcc_spi5_rst_n,
    input rcc_tim17_rst_n,
    input rcc_tim16_rst_n,
    input rcc_tim15_rst_n,
    input rcc_spi4_rst_n,
    input rcc_spi1_rst_n,
    input rcc_usart6_rst_n,
    input rcc_usart1_rst_n,
    input rcc_tim8_rst_n,
    input rcc_tim1_rst_n,
    input rcc_sram4_rst_n,
    input rcc_bkpram_rst_n,
    input rcc_ramecc3_rst_n,
    input rcc_hsem_rst_n,
    input rcc_adc3_rst_n,
    input rcc_bdma_rst_n,
    input rcc_crc_rst_n,
    input rcc_gpiok_rst_n,
    input rcc_gpioj_rst_n,
    input rcc_gpioi_rst_n,
    input rcc_gpioh_rst_n,
    input rcc_gpiog_rst_n,
    input rcc_gpiof_rst_n,
    input rcc_gpioe_rst_n,
    input rcc_gpiod_rst_n,
    input rcc_gpioc_rst_n,
    input rcc_gpiob_rst_n,
    input rcc_gpioa_rst_n,
    input rcc_rcc_rst_n,
    input rcc_pwr_rst_n,
    input rcc_sai4_rst_n,
    input rcc_rtc_rst_n,
    input rcc_vref_rst_n,
    input rcc_comp12_rst_n,
    input rcc_lptim5_rst_n,
    input rcc_lptim4_rst_n,
    input rcc_lptim3_rst_n,
    input rcc_lptim2_rst_n,
    input rcc_i2c4_rst_n,
    input rcc_spi6_rst_n,
    input rcc_lpuart1_rst_n,
    input rcc_syscfg_rst_n,
    input rcc_iwdg2_rst_n,
    input rcc_iwdg1_rst_n,
    input rcc_exti_rst_n,
    output rcc_flash_arcg_rst_n,
    output rcc_qspi_arcg_rst_n,
    output rcc_axisram_arcg_rst_n,
    output rcc_fmc_arcg_rst_n,
    output rcc_dma2d_arcg_rst_n,
    output rcc_mdma_arcg_rst_n,
    output rcc_ltdc_arcg_rst_n,
    output rcc_ramecc1_arcg_rst_n,
    output rcc_gpv_arcg_rst_n,
    output rcc_itcm_arcg_rst_n,
    output rcc_dtcm2_arcg_rst_n,
    output rcc_dtcm1_arcg_rst_n,
    output rcc_jpgdec_arcg_rst_n,
    output rcc_sdmmc1_arcg_rst_n,
    output rcc_wwdg1_arcg_rst_n,
    output rcc_usb2ulpi_arcg_rst_n,
    output rcc_usb2otg_arcg_rst_n,
    output rcc_usb1ulpi_arcg_rst_n,
    output rcc_usb1otg_arcg_rst_n,
    output rcc_eth1rx_arcg_rst_n,
    output rcc_eth1tx_arcg_rst_n,
    output rcc_eth1mac_arcg_rst_n,
    output rcc_adc12_arcg_rst_n,
    output rcc_dma2_arcg_rst_n,
    output rcc_dma1_arcg_rst_n,
    output rcc_sram3_arcg_rst_n,
    output rcc_sram2_arcg_rst_n,
    output rcc_sram1_arcg_rst_n,
    output rcc_sdmmc2_arcg_rst_n,
    output rcc_rng_arcg_rst_n,
    output rcc_hash_arcg_rst_n,
    output rcc_crypt_arcg_rst_n,
    output rcc_dcmi_arcg_rst_n,
    output rcc_ramecc2_arcg_rst_n,
    output rcc_uart8_arcg_rst_n,
    output rcc_uart7_arcg_rst_n,
    output rcc_dac12_arcg_rst_n,
    output rcc_hdmicec_arcg_rst_n,
    output rcc_i2c3_arcg_rst_n,
    output rcc_i2c2_arcg_rst_n,
    output rcc_i2c1_arcg_rst_n,
    output rcc_uart5_arcg_rst_n,
    output rcc_uart4_arcg_rst_n,
    output rcc_usart3_arcg_rst_n,
    output rcc_usart2_arcg_rst_n,
    output rcc_spdifrx_arcg_rst_n,
    output rcc_spi3_arcg_rst_n,
    output rcc_spi2_arcg_rst_n,
    output rcc_wwdg2_arcg_rst_n,
    output rcc_lptim1_arcg_rst_n,
    output rcc_tim14_arcg_rst_n,
    output rcc_tim13_arcg_rst_n,
    output rcc_tim12_arcg_rst_n,
    output rcc_tim7_arcg_rst_n,
    output rcc_tim6_arcg_rst_n,
    output rcc_tim5_arcg_rst_n,
    output rcc_tim4_arcg_rst_n,
    output rcc_tim3_arcg_rst_n,
    output rcc_tim2_arcg_rst_n,
    output rcc_fdcan_arcg_rst_n,
    output rcc_mdios_arcg_rst_n,
    output rcc_opamp_arcg_rst_n,
    output rcc_swpmi_arcg_rst_n,
    output rcc_crs_arcg_rst_n,
    output rcc_hrtim_arcg_rst_n,
    output rcc_dfsdm1_arcg_rst_n,
    output rcc_sai3_arcg_rst_n,
    output rcc_sai2_arcg_rst_n,
    output rcc_sai1_arcg_rst_n,
    output rcc_spi5_arcg_rst_n,
    output rcc_tim17_arcg_rst_n,
    output rcc_tim16_arcg_rst_n,
    output rcc_tim15_arcg_rst_n,
    output rcc_spi4_arcg_rst_n,
    output rcc_spi1_arcg_rst_n,
    output rcc_usart6_arcg_rst_n,
    output rcc_usart1_arcg_rst_n,
    output rcc_tim8_arcg_rst_n,
    output rcc_tim1_arcg_rst_n,
    output rcc_sram4_arcg_rst_n,
    output rcc_bkpram_arcg_rst_n,
    output rcc_ramecc3_arcg_rst_n,
    output rcc_hsem_arcg_rst_n,
    output rcc_adc3_arcg_rst_n,
    output rcc_bdma_arcg_rst_n,
    output rcc_crc_arcg_rst_n,
    output rcc_gpiok_arcg_rst_n,
    output rcc_gpioj_arcg_rst_n,
    output rcc_gpioi_arcg_rst_n,
    output rcc_gpioh_arcg_rst_n,
    output rcc_gpiog_arcg_rst_n,
    output rcc_gpiof_arcg_rst_n,
    output rcc_gpioe_arcg_rst_n,
    output rcc_gpiod_arcg_rst_n,
    output rcc_gpioc_arcg_rst_n,
    output rcc_gpiob_arcg_rst_n,
    output rcc_gpioa_arcg_rst_n,
    output rcc_rcc_arcg_rst_n,
    output rcc_pwr_arcg_rst_n,
    output rcc_sai4_arcg_rst_n,
    output rcc_rtc_arcg_rst_n,
    output rcc_vref_arcg_rst_n,
    output rcc_comp12_arcg_rst_n,
    output rcc_lptim5_arcg_rst_n,
    output rcc_lptim4_arcg_rst_n,
    output rcc_lptim3_arcg_rst_n,
    output rcc_lptim2_arcg_rst_n,
    output rcc_i2c4_arcg_rst_n,
    output rcc_spi6_arcg_rst_n,
    output rcc_lpuart1_arcg_rst_n,
    output rcc_syscfg_arcg_rst_n,
    output rcc_iwdg2_arcg_rst_n,
    output rcc_iwdg1_arcg_rst_n,
    output rcc_exti_arcg_rst_n,
    output rcc_flash_arcg_clk_en,
    output rcc_qspi_arcg_clk_en,
    output rcc_axisram_arcg_clk_en,
    output rcc_fmc_arcg_clk_en,
    output rcc_dma2d_arcg_clk_en,
    output rcc_mdma_arcg_clk_en,
    output rcc_ltdc_arcg_clk_en,
    output rcc_ramecc1_arcg_clk_en,
    output rcc_gpv_arcg_clk_en,
    output rcc_itcm_arcg_clk_en,
    output rcc_dtcm2_arcg_clk_en,
    output rcc_dtcm1_arcg_clk_en,
    output rcc_jpgdec_arcg_clk_en,
    output rcc_sdmmc1_arcg_clk_en,
    output rcc_wwdg1_arcg_clk_en,
    output rcc_usb2ulpi_arcg_clk_en,
    output rcc_usb2otg_arcg_clk_en,
    output rcc_usb1ulpi_arcg_clk_en,
    output rcc_usb1otg_arcg_clk_en,
    output rcc_eth1rx_arcg_clk_en,
    output rcc_eth1tx_arcg_clk_en,
    output rcc_eth1mac_arcg_clk_en,
    output rcc_adc12_arcg_clk_en,
    output rcc_dma2_arcg_clk_en,
    output rcc_dma1_arcg_clk_en,
    output rcc_sram3_arcg_clk_en,
    output rcc_sram2_arcg_clk_en,
    output rcc_sram1_arcg_clk_en,
    output rcc_sdmmc2_arcg_clk_en,
    output rcc_rng_arcg_clk_en,
    output rcc_hash_arcg_clk_en,
    output rcc_crypt_arcg_clk_en,
    output rcc_dcmi_arcg_clk_en,
    output rcc_ramecc2_arcg_clk_en,
    output rcc_uart8_arcg_clk_en,
    output rcc_uart7_arcg_clk_en,
    output rcc_dac12_arcg_clk_en,
    output rcc_hdmicec_arcg_clk_en,
    output rcc_i2c3_arcg_clk_en,
    output rcc_i2c2_arcg_clk_en,
    output rcc_i2c1_arcg_clk_en,
    output rcc_uart5_arcg_clk_en,
    output rcc_uart4_arcg_clk_en,
    output rcc_usart3_arcg_clk_en,
    output rcc_usart2_arcg_clk_en,
    output rcc_spdifrx_arcg_clk_en,
    output rcc_spi3_arcg_clk_en,
    output rcc_spi2_arcg_clk_en,
    output rcc_wwdg2_arcg_clk_en,
    output rcc_lptim1_arcg_clk_en,
    output rcc_tim14_arcg_clk_en,
    output rcc_tim13_arcg_clk_en,
    output rcc_tim12_arcg_clk_en,
    output rcc_tim7_arcg_clk_en,
    output rcc_tim6_arcg_clk_en,
    output rcc_tim5_arcg_clk_en,
    output rcc_tim4_arcg_clk_en,
    output rcc_tim3_arcg_clk_en,
    output rcc_tim2_arcg_clk_en,
    output rcc_fdcan_arcg_clk_en,
    output rcc_mdios_arcg_clk_en,
    output rcc_opamp_arcg_clk_en,
    output rcc_swpmi_arcg_clk_en,
    output rcc_crs_arcg_clk_en,
    output rcc_hrtim_arcg_clk_en,
    output rcc_dfsdm1_arcg_clk_en,
    output rcc_sai3_arcg_clk_en,
    output rcc_sai2_arcg_clk_en,
    output rcc_sai1_arcg_clk_en,
    output rcc_spi5_arcg_clk_en,
    output rcc_tim17_arcg_clk_en,
    output rcc_tim16_arcg_clk_en,
    output rcc_tim15_arcg_clk_en,
    output rcc_spi4_arcg_clk_en,
    output rcc_spi1_arcg_clk_en,
    output rcc_usart6_arcg_clk_en,
    output rcc_usart1_arcg_clk_en,
    output rcc_tim8_arcg_clk_en,
    output rcc_tim1_arcg_clk_en,
    output rcc_sram4_arcg_clk_en,
    output rcc_bkpram_arcg_clk_en,
    output rcc_ramecc3_arcg_clk_en,
    output rcc_hsem_arcg_clk_en,
    output rcc_adc3_arcg_clk_en,
    output rcc_bdma_arcg_clk_en,
    output rcc_crc_arcg_clk_en,
    output rcc_gpiok_arcg_clk_en,
    output rcc_gpioj_arcg_clk_en,
    output rcc_gpioi_arcg_clk_en,
    output rcc_gpioh_arcg_clk_en,
    output rcc_gpiog_arcg_clk_en,
    output rcc_gpiof_arcg_clk_en,
    output rcc_gpioe_arcg_clk_en,
    output rcc_gpiod_arcg_clk_en,
    output rcc_gpioc_arcg_clk_en,
    output rcc_gpiob_arcg_clk_en,
    output rcc_gpioa_arcg_clk_en,
    output rcc_rcc_arcg_clk_en,
    output rcc_pwr_arcg_clk_en,
    output rcc_sai4_arcg_clk_en,
    output rcc_rtc_arcg_clk_en,
    output rcc_vref_arcg_clk_en,
    output rcc_comp12_arcg_clk_en,
    output rcc_lptim5_arcg_clk_en,
    output rcc_lptim4_arcg_clk_en,
    output rcc_lptim3_arcg_clk_en,
    output rcc_lptim2_arcg_clk_en,
    output rcc_i2c4_arcg_clk_en,
    output rcc_spi6_arcg_clk_en,
    output rcc_lpuart1_arcg_clk_en,
    output rcc_syscfg_arcg_clk_en,
    output rcc_iwdg2_arcg_clk_en,
    output rcc_iwdg1_arcg_clk_en,
    output rcc_exti_arcg_clk_en,
// sys reset
    input sys_rst_n,
// dx reset
    input d1_rst_n,
    input d2_rst_n
);


// flash asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) flash_async_reset_clk_gate (
.rst_n_in(rcc_flash_rst_n),
.clk_in(rcc_flash_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_flash_arcg_clk_en),
.rst_n_clk_g(rcc_flash_arcg_rst_n)
);

// qspi asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) qspi_async_reset_clk_gate (
.rst_n_in(rcc_qspi_rst_n),
.clk_in(rcc_qspi_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_qspi_arcg_clk_en),
.rst_n_clk_g(rcc_qspi_arcg_rst_n)
);

// axisram asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) axisram_async_reset_clk_gate (
.rst_n_in(rcc_axisram_rst_n),
.clk_in(rcc_axisram_aclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_axisram_arcg_clk_en),
.rst_n_clk_g(rcc_axisram_arcg_rst_n)
);

// fmc asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) fmc_async_reset_clk_gate (
.rst_n_in(rcc_fmc_rst_n),
.clk_in(rcc_fmc_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_fmc_arcg_clk_en),
.rst_n_clk_g(rcc_fmc_arcg_rst_n)
);

// dma2d asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) dma2d_async_reset_clk_gate (
.rst_n_in(rcc_dma2d_rst_n),
.clk_in(rcc_dma2d_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_dma2d_arcg_clk_en),
.rst_n_clk_g(rcc_dma2d_arcg_rst_n)
);

// mdma asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) mdma_async_reset_clk_gate (
.rst_n_in(rcc_mdma_rst_n),
.clk_in(rcc_mdma_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_mdma_arcg_clk_en),
.rst_n_clk_g(rcc_mdma_arcg_rst_n)
);

// ltdc asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) ltdc_async_reset_clk_gate (
.rst_n_in(rcc_ltdc_rst_n),
.clk_in(rcc_ltdc_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_ltdc_arcg_clk_en),
.rst_n_clk_g(rcc_ltdc_arcg_rst_n)
);

// ramecc1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) ramecc1_async_reset_clk_gate (
.rst_n_in(rcc_ramecc1_rst_n),
.clk_in(rcc_ramecc1_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_ramecc1_arcg_clk_en),
.rst_n_clk_g(rcc_ramecc1_arcg_rst_n)
);

// gpv asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) gpv_async_reset_clk_gate (
.rst_n_in(rcc_gpv_rst_n),
.clk_in(rcc_gpv_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_gpv_arcg_clk_en),
.rst_n_clk_g(rcc_gpv_arcg_rst_n)
);

// itcm asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) itcm_async_reset_clk_gate (
.rst_n_in(rcc_itcm_rst_n),
.clk_in(rcc_itcm_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_itcm_arcg_clk_en),
.rst_n_clk_g(rcc_itcm_arcg_rst_n)
);

// dtcm2 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) dtcm2_async_reset_clk_gate (
.rst_n_in(rcc_dtcm2_rst_n),
.clk_in(rcc_dtcm2_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_dtcm2_arcg_clk_en),
.rst_n_clk_g(rcc_dtcm2_arcg_rst_n)
);

// dtcm1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) dtcm1_async_reset_clk_gate (
.rst_n_in(rcc_dtcm1_rst_n),
.clk_in(rcc_dtcm1_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_dtcm1_arcg_clk_en),
.rst_n_clk_g(rcc_dtcm1_arcg_rst_n)
);

// jpgdec asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) jpgdec_async_reset_clk_gate (
.rst_n_in(rcc_jpgdec_rst_n),
.clk_in(rcc_jpgdec_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_jpgdec_arcg_clk_en),
.rst_n_clk_g(rcc_jpgdec_arcg_rst_n)
);

// sdmmc1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) sdmmc1_async_reset_clk_gate (
.rst_n_in(rcc_sdmmc1_rst_n),
.clk_in(rcc_sdmmc1_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_sdmmc1_arcg_clk_en),
.rst_n_clk_g(rcc_sdmmc1_arcg_rst_n)
);

// wwdg1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) wwdg1_async_reset_clk_gate (
.rst_n_in(rcc_wwdg1_rst_n),
.clk_in(rcc_wwdg1_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_wwdg1_arcg_clk_en),
.rst_n_clk_g(rcc_wwdg1_arcg_rst_n)
);

// usb2ulpi asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) usb2ulpi_async_reset_clk_gate (
.rst_n_in(rcc_usb2ulpi_rst_n),
.clk_in(rcc_usb2ulpi_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_usb2ulpi_arcg_clk_en),
.rst_n_clk_g(rcc_usb2ulpi_arcg_rst_n)
);

// usb2otg asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) usb2otg_async_reset_clk_gate (
.rst_n_in(rcc_usb2otg_rst_n),
.clk_in(rcc_usb2otg_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_usb2otg_arcg_clk_en),
.rst_n_clk_g(rcc_usb2otg_arcg_rst_n)
);

// usb1ulpi asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) usb1ulpi_async_reset_clk_gate (
.rst_n_in(rcc_usb1ulpi_rst_n),
.clk_in(rcc_usb1ulpi_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_usb1ulpi_arcg_clk_en),
.rst_n_clk_g(rcc_usb1ulpi_arcg_rst_n)
);

// usb1otg asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) usb1otg_async_reset_clk_gate (
.rst_n_in(rcc_usb1otg_rst_n),
.clk_in(rcc_usb1otg_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_usb1otg_arcg_clk_en),
.rst_n_clk_g(rcc_usb1otg_arcg_rst_n)
);

// eth1rx asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) eth1rx_async_reset_clk_gate (
.rst_n_in(rcc_eth1rx_rst_n),
.clk_in(rcc_eth1rx_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_eth1rx_arcg_clk_en),
.rst_n_clk_g(rcc_eth1rx_arcg_rst_n)
);

// eth1tx asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) eth1tx_async_reset_clk_gate (
.rst_n_in(rcc_eth1tx_rst_n),
.clk_in(rcc_eth1tx_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_eth1tx_arcg_clk_en),
.rst_n_clk_g(rcc_eth1tx_arcg_rst_n)
);

// eth1mac asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) eth1mac_async_reset_clk_gate (
.rst_n_in(rcc_eth1mac_rst_n),
.clk_in(rcc_eth1mac_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_eth1mac_arcg_clk_en),
.rst_n_clk_g(rcc_eth1mac_arcg_rst_n)
);

// adc12 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) adc12_async_reset_clk_gate (
.rst_n_in(rcc_adc12_rst_n),
.clk_in(rcc_adc12_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_adc12_arcg_clk_en),
.rst_n_clk_g(rcc_adc12_arcg_rst_n)
);

// dma2 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) dma2_async_reset_clk_gate (
.rst_n_in(rcc_dma2_rst_n),
.clk_in(rcc_dma2_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_dma2_arcg_clk_en),
.rst_n_clk_g(rcc_dma2_arcg_rst_n)
);

// dma1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) dma1_async_reset_clk_gate (
.rst_n_in(rcc_dma1_rst_n),
.clk_in(rcc_dma1_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_dma1_arcg_clk_en),
.rst_n_clk_g(rcc_dma1_arcg_rst_n)
);

// sram3 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) sram3_async_reset_clk_gate (
.rst_n_in(rcc_sram3_rst_n),
.clk_in(rcc_sram3_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_sram3_arcg_clk_en),
.rst_n_clk_g(rcc_sram3_arcg_rst_n)
);

// sram2 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) sram2_async_reset_clk_gate (
.rst_n_in(rcc_sram2_rst_n),
.clk_in(rcc_sram2_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_sram2_arcg_clk_en),
.rst_n_clk_g(rcc_sram2_arcg_rst_n)
);

// sram1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) sram1_async_reset_clk_gate (
.rst_n_in(rcc_sram1_rst_n),
.clk_in(rcc_sram1_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_sram1_arcg_clk_en),
.rst_n_clk_g(rcc_sram1_arcg_rst_n)
);

// sdmmc2 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) sdmmc2_async_reset_clk_gate (
.rst_n_in(rcc_sdmmc2_rst_n),
.clk_in(rcc_sdmmc2_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_sdmmc2_arcg_clk_en),
.rst_n_clk_g(rcc_sdmmc2_arcg_rst_n)
);

// rng asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) rng_async_reset_clk_gate (
.rst_n_in(rcc_rng_rst_n),
.clk_in(rcc_rng_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_rng_arcg_clk_en),
.rst_n_clk_g(rcc_rng_arcg_rst_n)
);

// hash asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) hash_async_reset_clk_gate (
.rst_n_in(rcc_hash_rst_n),
.clk_in(rcc_hash_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_hash_arcg_clk_en),
.rst_n_clk_g(rcc_hash_arcg_rst_n)
);

// crypt asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) crypt_async_reset_clk_gate (
.rst_n_in(rcc_crypt_rst_n),
.clk_in(rcc_crypt_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_crypt_arcg_clk_en),
.rst_n_clk_g(rcc_crypt_arcg_rst_n)
);

// dcmi asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) dcmi_async_reset_clk_gate (
.rst_n_in(rcc_dcmi_rst_n),
.clk_in(rcc_dcmi_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_dcmi_arcg_clk_en),
.rst_n_clk_g(rcc_dcmi_arcg_rst_n)
);

// ramecc2 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) ramecc2_async_reset_clk_gate (
.rst_n_in(rcc_ramecc2_rst_n),
.clk_in(rcc_ramecc2_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_ramecc2_arcg_clk_en),
.rst_n_clk_g(rcc_ramecc2_arcg_rst_n)
);

// uart8 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) uart8_async_reset_clk_gate (
.rst_n_in(rcc_uart8_rst_n),
.clk_in(rcc_uart8_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_uart8_arcg_clk_en),
.rst_n_clk_g(rcc_uart8_arcg_rst_n)
);

// uart7 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) uart7_async_reset_clk_gate (
.rst_n_in(rcc_uart7_rst_n),
.clk_in(rcc_uart7_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_uart7_arcg_clk_en),
.rst_n_clk_g(rcc_uart7_arcg_rst_n)
);

// dac12 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) dac12_async_reset_clk_gate (
.rst_n_in(rcc_dac12_rst_n),
.clk_in(rcc_dac12_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_dac12_arcg_clk_en),
.rst_n_clk_g(rcc_dac12_arcg_rst_n)
);

// hdmicec asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) hdmicec_async_reset_clk_gate (
.rst_n_in(rcc_hdmicec_rst_n),
.clk_in(rcc_hdmicec_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_hdmicec_arcg_clk_en),
.rst_n_clk_g(rcc_hdmicec_arcg_rst_n)
);

// i2c3 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) i2c3_async_reset_clk_gate (
.rst_n_in(rcc_i2c3_rst_n),
.clk_in(rcc_i2c3_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_i2c3_arcg_clk_en),
.rst_n_clk_g(rcc_i2c3_arcg_rst_n)
);

// i2c2 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) i2c2_async_reset_clk_gate (
.rst_n_in(rcc_i2c2_rst_n),
.clk_in(rcc_i2c2_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_i2c2_arcg_clk_en),
.rst_n_clk_g(rcc_i2c2_arcg_rst_n)
);

// i2c1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) i2c1_async_reset_clk_gate (
.rst_n_in(rcc_i2c1_rst_n),
.clk_in(rcc_i2c1_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_i2c1_arcg_clk_en),
.rst_n_clk_g(rcc_i2c1_arcg_rst_n)
);

// uart5 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) uart5_async_reset_clk_gate (
.rst_n_in(rcc_uart5_rst_n),
.clk_in(rcc_uart5_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_uart5_arcg_clk_en),
.rst_n_clk_g(rcc_uart5_arcg_rst_n)
);

// uart4 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) uart4_async_reset_clk_gate (
.rst_n_in(rcc_uart4_rst_n),
.clk_in(rcc_uart4_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_uart4_arcg_clk_en),
.rst_n_clk_g(rcc_uart4_arcg_rst_n)
);

// usart3 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) usart3_async_reset_clk_gate (
.rst_n_in(rcc_usart3_rst_n),
.clk_in(rcc_usart3_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_usart3_arcg_clk_en),
.rst_n_clk_g(rcc_usart3_arcg_rst_n)
);

// usart2 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) usart2_async_reset_clk_gate (
.rst_n_in(rcc_usart2_rst_n),
.clk_in(rcc_usart2_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_usart2_arcg_clk_en),
.rst_n_clk_g(rcc_usart2_arcg_rst_n)
);

// spdifrx asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) spdifrx_async_reset_clk_gate (
.rst_n_in(rcc_spdifrx_rst_n),
.clk_in(rcc_spdifrx_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_spdifrx_arcg_clk_en),
.rst_n_clk_g(rcc_spdifrx_arcg_rst_n)
);

// spi3 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) spi3_async_reset_clk_gate (
.rst_n_in(rcc_spi3_rst_n),
.clk_in(rcc_spi3_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_spi3_arcg_clk_en),
.rst_n_clk_g(rcc_spi3_arcg_rst_n)
);

// spi2 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) spi2_async_reset_clk_gate (
.rst_n_in(rcc_spi2_rst_n),
.clk_in(rcc_spi2_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_spi2_arcg_clk_en),
.rst_n_clk_g(rcc_spi2_arcg_rst_n)
);

// wwdg2 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) wwdg2_async_reset_clk_gate (
.rst_n_in(rcc_wwdg2_rst_n),
.clk_in(rcc_wwdg2_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_wwdg2_arcg_clk_en),
.rst_n_clk_g(rcc_wwdg2_arcg_rst_n)
);

// lptim1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) lptim1_async_reset_clk_gate (
.rst_n_in(rcc_lptim1_rst_n),
.clk_in(rcc_lptim1_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_lptim1_arcg_clk_en),
.rst_n_clk_g(rcc_lptim1_arcg_rst_n)
);

// tim14 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) tim14_async_reset_clk_gate (
.rst_n_in(rcc_tim14_rst_n),
.clk_in(rcc_tim14_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_tim14_arcg_clk_en),
.rst_n_clk_g(rcc_tim14_arcg_rst_n)
);

// tim13 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) tim13_async_reset_clk_gate (
.rst_n_in(rcc_tim13_rst_n),
.clk_in(rcc_tim13_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_tim13_arcg_clk_en),
.rst_n_clk_g(rcc_tim13_arcg_rst_n)
);

// tim12 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) tim12_async_reset_clk_gate (
.rst_n_in(rcc_tim12_rst_n),
.clk_in(rcc_tim12_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_tim12_arcg_clk_en),
.rst_n_clk_g(rcc_tim12_arcg_rst_n)
);

// tim7 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) tim7_async_reset_clk_gate (
.rst_n_in(rcc_tim7_rst_n),
.clk_in(rcc_tim7_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_tim7_arcg_clk_en),
.rst_n_clk_g(rcc_tim7_arcg_rst_n)
);

// tim6 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) tim6_async_reset_clk_gate (
.rst_n_in(rcc_tim6_rst_n),
.clk_in(rcc_tim6_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_tim6_arcg_clk_en),
.rst_n_clk_g(rcc_tim6_arcg_rst_n)
);

// tim5 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) tim5_async_reset_clk_gate (
.rst_n_in(rcc_tim5_rst_n),
.clk_in(rcc_tim5_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_tim5_arcg_clk_en),
.rst_n_clk_g(rcc_tim5_arcg_rst_n)
);

// tim4 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) tim4_async_reset_clk_gate (
.rst_n_in(rcc_tim4_rst_n),
.clk_in(rcc_tim4_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_tim4_arcg_clk_en),
.rst_n_clk_g(rcc_tim4_arcg_rst_n)
);

// tim3 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) tim3_async_reset_clk_gate (
.rst_n_in(rcc_tim3_rst_n),
.clk_in(rcc_tim3_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_tim3_arcg_clk_en),
.rst_n_clk_g(rcc_tim3_arcg_rst_n)
);

// tim2 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) tim2_async_reset_clk_gate (
.rst_n_in(rcc_tim2_rst_n),
.clk_in(rcc_tim2_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_tim2_arcg_clk_en),
.rst_n_clk_g(rcc_tim2_arcg_rst_n)
);

// fdcan asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) fdcan_async_reset_clk_gate (
.rst_n_in(rcc_fdcan_rst_n),
.clk_in(rcc_fdcan_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_fdcan_arcg_clk_en),
.rst_n_clk_g(rcc_fdcan_arcg_rst_n)
);

// mdios asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) mdios_async_reset_clk_gate (
.rst_n_in(rcc_mdios_rst_n),
.clk_in(rcc_mdios_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_mdios_arcg_clk_en),
.rst_n_clk_g(rcc_mdios_arcg_rst_n)
);

// opamp asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) opamp_async_reset_clk_gate (
.rst_n_in(rcc_opamp_rst_n),
.clk_in(rcc_opamp_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_opamp_arcg_clk_en),
.rst_n_clk_g(rcc_opamp_arcg_rst_n)
);

// swpmi asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) swpmi_async_reset_clk_gate (
.rst_n_in(rcc_swpmi_rst_n),
.clk_in(rcc_swpmi_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_swpmi_arcg_clk_en),
.rst_n_clk_g(rcc_swpmi_arcg_rst_n)
);

// crs asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) crs_async_reset_clk_gate (
.rst_n_in(rcc_crs_rst_n),
.clk_in(rcc_crs_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_crs_arcg_clk_en),
.rst_n_clk_g(rcc_crs_arcg_rst_n)
);

// hrtim asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) hrtim_async_reset_clk_gate (
.rst_n_in(rcc_hrtim_rst_n),
.clk_in(rcc_hrtim_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_hrtim_arcg_clk_en),
.rst_n_clk_g(rcc_hrtim_arcg_rst_n)
);

// dfsdm1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) dfsdm1_async_reset_clk_gate (
.rst_n_in(rcc_dfsdm1_rst_n),
.clk_in(rcc_dfsdm1_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_dfsdm1_arcg_clk_en),
.rst_n_clk_g(rcc_dfsdm1_arcg_rst_n)
);

// sai3 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) sai3_async_reset_clk_gate (
.rst_n_in(rcc_sai3_rst_n),
.clk_in(rcc_sai3_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_sai3_arcg_clk_en),
.rst_n_clk_g(rcc_sai3_arcg_rst_n)
);

// sai2 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) sai2_async_reset_clk_gate (
.rst_n_in(rcc_sai2_rst_n),
.clk_in(rcc_sai2_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_sai2_arcg_clk_en),
.rst_n_clk_g(rcc_sai2_arcg_rst_n)
);

// sai1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) sai1_async_reset_clk_gate (
.rst_n_in(rcc_sai1_rst_n),
.clk_in(rcc_sai1_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_sai1_arcg_clk_en),
.rst_n_clk_g(rcc_sai1_arcg_rst_n)
);

// spi5 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) spi5_async_reset_clk_gate (
.rst_n_in(rcc_spi5_rst_n),
.clk_in(rcc_spi5_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_spi5_arcg_clk_en),
.rst_n_clk_g(rcc_spi5_arcg_rst_n)
);

// tim17 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) tim17_async_reset_clk_gate (
.rst_n_in(rcc_tim17_rst_n),
.clk_in(rcc_tim17_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_tim17_arcg_clk_en),
.rst_n_clk_g(rcc_tim17_arcg_rst_n)
);

// tim16 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) tim16_async_reset_clk_gate (
.rst_n_in(rcc_tim16_rst_n),
.clk_in(rcc_tim16_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_tim16_arcg_clk_en),
.rst_n_clk_g(rcc_tim16_arcg_rst_n)
);

// tim15 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) tim15_async_reset_clk_gate (
.rst_n_in(rcc_tim15_rst_n),
.clk_in(rcc_tim15_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_tim15_arcg_clk_en),
.rst_n_clk_g(rcc_tim15_arcg_rst_n)
);

// spi4 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) spi4_async_reset_clk_gate (
.rst_n_in(rcc_spi4_rst_n),
.clk_in(rcc_spi4_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_spi4_arcg_clk_en),
.rst_n_clk_g(rcc_spi4_arcg_rst_n)
);

// spi1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) spi1_async_reset_clk_gate (
.rst_n_in(rcc_spi1_rst_n),
.clk_in(rcc_spi1_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_spi1_arcg_clk_en),
.rst_n_clk_g(rcc_spi1_arcg_rst_n)
);

// usart6 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) usart6_async_reset_clk_gate (
.rst_n_in(rcc_usart6_rst_n),
.clk_in(rcc_usart6_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_usart6_arcg_clk_en),
.rst_n_clk_g(rcc_usart6_arcg_rst_n)
);

// usart1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) usart1_async_reset_clk_gate (
.rst_n_in(rcc_usart1_rst_n),
.clk_in(rcc_usart1_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_usart1_arcg_clk_en),
.rst_n_clk_g(rcc_usart1_arcg_rst_n)
);

// tim8 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) tim8_async_reset_clk_gate (
.rst_n_in(rcc_tim8_rst_n),
.clk_in(rcc_tim8_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_tim8_arcg_clk_en),
.rst_n_clk_g(rcc_tim8_arcg_rst_n)
);

// tim1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) tim1_async_reset_clk_gate (
.rst_n_in(rcc_tim1_rst_n),
.clk_in(rcc_tim1_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_tim1_arcg_clk_en),
.rst_n_clk_g(rcc_tim1_arcg_rst_n)
);

// sram4 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) sram4_async_reset_clk_gate (
.rst_n_in(rcc_sram4_rst_n),
.clk_in(rcc_sram4_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_sram4_arcg_clk_en),
.rst_n_clk_g(rcc_sram4_arcg_rst_n)
);

// bkpram asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) bkpram_async_reset_clk_gate (
.rst_n_in(rcc_bkpram_rst_n),
.clk_in(rcc_bkpram_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_bkpram_arcg_clk_en),
.rst_n_clk_g(rcc_bkpram_arcg_rst_n)
);

// ramecc3 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) ramecc3_async_reset_clk_gate (
.rst_n_in(rcc_ramecc3_rst_n),
.clk_in(rcc_ramecc3_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_ramecc3_arcg_clk_en),
.rst_n_clk_g(rcc_ramecc3_arcg_rst_n)
);

// hsem asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) hsem_async_reset_clk_gate (
.rst_n_in(rcc_hsem_rst_n),
.clk_in(rcc_hsem_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_hsem_arcg_clk_en),
.rst_n_clk_g(rcc_hsem_arcg_rst_n)
);

// adc3 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) adc3_async_reset_clk_gate (
.rst_n_in(rcc_adc3_rst_n),
.clk_in(rcc_adc3_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_adc3_arcg_clk_en),
.rst_n_clk_g(rcc_adc3_arcg_rst_n)
);

// bdma asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) bdma_async_reset_clk_gate (
.rst_n_in(rcc_bdma_rst_n),
.clk_in(rcc_bdma_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_bdma_arcg_clk_en),
.rst_n_clk_g(rcc_bdma_arcg_rst_n)
);

// crc asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) crc_async_reset_clk_gate (
.rst_n_in(rcc_crc_rst_n),
.clk_in(rcc_crc_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_crc_arcg_clk_en),
.rst_n_clk_g(rcc_crc_arcg_rst_n)
);

// gpiok asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) gpiok_async_reset_clk_gate (
.rst_n_in(rcc_gpiok_rst_n),
.clk_in(rcc_gpiok_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_gpiok_arcg_clk_en),
.rst_n_clk_g(rcc_gpiok_arcg_rst_n)
);

// gpioj asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) gpioj_async_reset_clk_gate (
.rst_n_in(rcc_gpioj_rst_n),
.clk_in(rcc_gpioj_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_gpioj_arcg_clk_en),
.rst_n_clk_g(rcc_gpioj_arcg_rst_n)
);

// gpioi asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) gpioi_async_reset_clk_gate (
.rst_n_in(rcc_gpioi_rst_n),
.clk_in(rcc_gpioi_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_gpioi_arcg_clk_en),
.rst_n_clk_g(rcc_gpioi_arcg_rst_n)
);

// gpioh asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) gpioh_async_reset_clk_gate (
.rst_n_in(rcc_gpioh_rst_n),
.clk_in(rcc_gpioh_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_gpioh_arcg_clk_en),
.rst_n_clk_g(rcc_gpioh_arcg_rst_n)
);

// gpiog asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) gpiog_async_reset_clk_gate (
.rst_n_in(rcc_gpiog_rst_n),
.clk_in(rcc_gpiog_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_gpiog_arcg_clk_en),
.rst_n_clk_g(rcc_gpiog_arcg_rst_n)
);

// gpiof asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) gpiof_async_reset_clk_gate (
.rst_n_in(rcc_gpiof_rst_n),
.clk_in(rcc_gpiof_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_gpiof_arcg_clk_en),
.rst_n_clk_g(rcc_gpiof_arcg_rst_n)
);

// gpioe asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) gpioe_async_reset_clk_gate (
.rst_n_in(rcc_gpioe_rst_n),
.clk_in(rcc_gpioe_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_gpioe_arcg_clk_en),
.rst_n_clk_g(rcc_gpioe_arcg_rst_n)
);

// gpiod asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) gpiod_async_reset_clk_gate (
.rst_n_in(rcc_gpiod_rst_n),
.clk_in(rcc_gpiod_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_gpiod_arcg_clk_en),
.rst_n_clk_g(rcc_gpiod_arcg_rst_n)
);

// gpioc asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) gpioc_async_reset_clk_gate (
.rst_n_in(rcc_gpioc_rst_n),
.clk_in(rcc_gpioc_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_gpioc_arcg_clk_en),
.rst_n_clk_g(rcc_gpioc_arcg_rst_n)
);

// gpiob asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) gpiob_async_reset_clk_gate (
.rst_n_in(rcc_gpiob_rst_n),
.clk_in(rcc_gpiob_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_gpiob_arcg_clk_en),
.rst_n_clk_g(rcc_gpiob_arcg_rst_n)
);

// gpioa asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) gpioa_async_reset_clk_gate (
.rst_n_in(rcc_gpioa_rst_n),
.clk_in(rcc_gpioa_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_gpioa_arcg_clk_en),
.rst_n_clk_g(rcc_gpioa_arcg_rst_n)
);

// rcc asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) rcc_async_reset_clk_gate (
.rst_n_in(rcc_rcc_rst_n),
.clk_in(rcc_rcc_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_rcc_arcg_clk_en),
.rst_n_clk_g(rcc_rcc_arcg_rst_n)
);

// pwr asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) pwr_async_reset_clk_gate (
.rst_n_in(rcc_pwr_rst_n),
.clk_in(rcc_pwr_hclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_pwr_arcg_clk_en),
.rst_n_clk_g(rcc_pwr_arcg_rst_n)
);

// sai4 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) sai4_async_reset_clk_gate (
.rst_n_in(rcc_sai4_rst_n),
.clk_in(rcc_sai4_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_sai4_arcg_clk_en),
.rst_n_clk_g(rcc_sai4_arcg_rst_n)
);

// rtc asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) rtc_async_reset_clk_gate (
.rst_n_in(rcc_rtc_rst_n),
.clk_in(rcc_rtc_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_rtc_arcg_clk_en),
.rst_n_clk_g(rcc_rtc_arcg_rst_n)
);

// vref asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) vref_async_reset_clk_gate (
.rst_n_in(rcc_vref_rst_n),
.clk_in(rcc_vref_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_vref_arcg_clk_en),
.rst_n_clk_g(rcc_vref_arcg_rst_n)
);

// comp12 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) comp12_async_reset_clk_gate (
.rst_n_in(rcc_comp12_rst_n),
.clk_in(rcc_comp12_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_comp12_arcg_clk_en),
.rst_n_clk_g(rcc_comp12_arcg_rst_n)
);

// lptim5 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) lptim5_async_reset_clk_gate (
.rst_n_in(rcc_lptim5_rst_n),
.clk_in(rcc_lptim5_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_lptim5_arcg_clk_en),
.rst_n_clk_g(rcc_lptim5_arcg_rst_n)
);

// lptim4 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) lptim4_async_reset_clk_gate (
.rst_n_in(rcc_lptim4_rst_n),
.clk_in(rcc_lptim4_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_lptim4_arcg_clk_en),
.rst_n_clk_g(rcc_lptim4_arcg_rst_n)
);

// lptim3 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) lptim3_async_reset_clk_gate (
.rst_n_in(rcc_lptim3_rst_n),
.clk_in(rcc_lptim3_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_lptim3_arcg_clk_en),
.rst_n_clk_g(rcc_lptim3_arcg_rst_n)
);

// lptim2 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) lptim2_async_reset_clk_gate (
.rst_n_in(rcc_lptim2_rst_n),
.clk_in(rcc_lptim2_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_lptim2_arcg_clk_en),
.rst_n_clk_g(rcc_lptim2_arcg_rst_n)
);

// i2c4 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) i2c4_async_reset_clk_gate (
.rst_n_in(rcc_i2c4_rst_n),
.clk_in(rcc_i2c4_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_i2c4_arcg_clk_en),
.rst_n_clk_g(rcc_i2c4_arcg_rst_n)
);

// spi6 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) spi6_async_reset_clk_gate (
.rst_n_in(rcc_spi6_rst_n),
.clk_in(rcc_spi6_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_spi6_arcg_clk_en),
.rst_n_clk_g(rcc_spi6_arcg_rst_n)
);

// lpuart1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) lpuart1_async_reset_clk_gate (
.rst_n_in(rcc_lpuart1_rst_n),
.clk_in(rcc_lpuart1_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_lpuart1_arcg_clk_en),
.rst_n_clk_g(rcc_lpuart1_arcg_rst_n)
);

// syscfg asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) syscfg_async_reset_clk_gate (
.rst_n_in(rcc_syscfg_rst_n),
.clk_in(rcc_syscfg_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_syscfg_arcg_clk_en),
.rst_n_clk_g(rcc_syscfg_arcg_rst_n)
);

// iwdg2 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) iwdg2_async_reset_clk_gate (
.rst_n_in(rcc_iwdg2_rst_n),
.clk_in(rcc_iwdg2_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_iwdg2_arcg_clk_en),
.rst_n_clk_g(rcc_iwdg2_arcg_rst_n)
);

// iwdg1 asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) iwdg1_async_reset_clk_gate (
.rst_n_in(rcc_iwdg1_rst_n),
.clk_in(rcc_iwdg1_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_iwdg1_arcg_clk_en),
.rst_n_clk_g(rcc_iwdg1_arcg_rst_n)
);

// exti asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
) exti_async_reset_clk_gate (
.rst_n_in(rcc_exti_rst_n),
.clk_in(rcc_exti_pclk),
.arcg_on(rcc_arcg_on),
.clk_en(rcc_exti_arcg_clk_en),
.rst_n_clk_g(rcc_exti_arcg_rst_n)
);

// system clock asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_SYS_RST_RELEASE)
) sys_clk_async_reset_clk_gate (
.rst_n_in(sys_rst_n),
.clk_in(sys_clk),
.arcg_on(rcc_arcg_on),
.clk_en(sys_clk_arcg_en),
.rst_n_clk_g(sys_arcg_rst_n)
);

// d1 domain clock asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_D1_RST_RELEASE)
) d1_clk_async_reset_clk_gate (
.rst_n_in(d1_rst_n),
.clk_in(sys_d1cpre_clk),
.arcg_on(rcc_arcg_on),
.clk_en(d1_clk_arcg_en),
.rst_n_clk_g(d1_arcg_rst_n)
);

// d2 domain clock asynchoronous reset clock gating
async_reset_clk_gate #(
.DELAY(CLK_ON_AFTER_D2_RST_RELEASE)
) d2_clk_async_reset_clk_gate (
.rst_n_in(d2_rst_n),
.clk_in(sys_hpre_clk),
.arcg_on(rcc_arcg_on),
.clk_en(d2_clk_arcg_en),
.rst_n_clk_g(d2_arcg_rst_n)
);

endmodule
