// rcc_per_clk_control Inputs
reg   sys_rst_n;
reg   rcc_axibridge_d1_clk;
reg   rcc_ahb3bridge_d1_clk;
reg   rcc_apb3bridge_d1_clk;
reg   rcc_ahb1bridge_d2_clk;
reg   rcc_ahb2bridge_d2_clk;
reg   rcc_apb1bridge_d2_clk;
reg   rcc_apb2bridge_d2_clk;
reg   rcc_ahb4bridge_d3_clk;
reg   rcc_apb4bridge_d3_clk;
reg   pll1_q_clk;
reg   pll2_p_clk;
reg   pll2_q_clk;
reg   pll2_r_clk;
reg   pll3_p_clk;
reg   pll3_q_clk;
reg   pll3_r_clk;
reg   sys_clk;
reg   hse_clk;
reg   hsi_ker_clk;
reg   csi_ker_clk;
reg   hsi48_clk;
reg   lse_clk;
reg   lsi_clk;
reg   per_clk;
reg   I2S_clk_IN;
reg   USB_PHY1;
reg   c1_sleep;
reg   c1_deepsleep;
reg   c2_sleep;
reg   c2_deepsleep;
reg   d3_deepsleep;

// rcc_per_clk_control Outputs
    reg   rcc_flash_arcg_clk_en;
    reg   rcc_c2_flash_en;
    reg   rcc_c1_flash_lpen;
    reg   rcc_c2_flash_lpen;
    reg   rcc_qspi_arcg_clk_en;
    reg   rcc_c1_qspi_en;
    reg   rcc_c2_qspi_en;
    reg   rcc_c1_qspi_lpen;
    reg   rcc_c2_qspi_lpen;
    reg   rcc_axisram_arcg_clk_en;
    reg   rcc_c2_axisram_en;
    reg   rcc_c1_axisram_lpen;
    reg   rcc_c2_axisram_lpen;
    reg   rcc_fmc_arcg_clk_en;
    reg   rcc_c1_fmc_en;
    reg   rcc_c2_fmc_en;
    reg   rcc_c1_fmc_lpen;
    reg   rcc_c2_fmc_lpen;
    reg   rcc_dma2d_arcg_clk_en;
    reg   rcc_c1_dma2d_en;
    reg   rcc_c2_dma2d_en;
    reg   rcc_c1_dma2d_lpen;
    reg   rcc_c2_dma2d_lpen;
    reg   rcc_mdma_arcg_clk_en;
    reg   rcc_c1_mdma_en;
    reg   rcc_c2_mdma_en;
    reg   rcc_c1_mdma_lpen;
    reg   rcc_c2_mdma_lpen;
    reg   rcc_ltdc_arcg_clk_en;
    reg   rcc_c1_ltdc_en;
    reg   rcc_c2_ltdc_en;
    reg   rcc_c1_ltdc_lpen;
    reg   rcc_c2_ltdc_lpen;
    reg   rcc_ramecc1_arcg_clk_en;
    reg   rcc_gpv_arcg_clk_en;
    reg   rcc_itcm_arcg_clk_en;
    reg   rcc_c2_itcm_en;
    reg   rcc_c1_itcm_lpen;
    reg   rcc_c2_itcm_lpen;
    reg   rcc_dtcm2_arcg_clk_en;
    reg   rcc_c2_dtcm2_en;
    reg   rcc_c1_dtcm2_lpen;
    reg   rcc_c2_dtcm2_lpen;
    reg   rcc_dtcm1_arcg_clk_en;
    reg   rcc_c2_dtcm1_en;
    reg   rcc_c1_dtcm1_lpen;
    reg   rcc_c2_dtcm1_lpen;
    reg   rcc_jpgdec_arcg_clk_en;
    reg   rcc_c1_jpgdec_en;
    reg   rcc_c2_jpgdec_en;
    reg   rcc_c1_jpgdec_lpen;
    reg   rcc_c2_jpgdec_lpen;
    reg   rcc_sdmmc1_arcg_clk_en;
    reg   rcc_c1_sdmmc1_en;
    reg   rcc_c2_sdmmc1_en;
    reg   rcc_c1_sdmmc1_lpen;
    reg   rcc_c2_sdmmc1_lpen;
    reg   rcc_wwdg1_arcg_clk_en;
    reg   rcc_c1_wwdg1_en;
    reg   rcc_c2_wwdg1_en;
    reg   rcc_c1_wwdg1_lpen;
    reg   rcc_c2_wwdg1_lpen;
    reg   rcc_usb2ulpi_arcg_clk_en;
    reg   rcc_c1_usb2ulpi_en;
    reg   rcc_c2_usb2ulpi_en;
    reg   rcc_c1_usb2ulpi_lpen;
    reg   rcc_c2_usb2ulpi_lpen;
    reg   rcc_usb2otg_arcg_clk_en;
    reg   rcc_c1_usb2otg_en;
    reg   rcc_c2_usb2otg_en;
    reg   rcc_c1_usb2otg_lpen;
    reg   rcc_c2_usb2otg_lpen;
    reg   rcc_usb1ulpi_arcg_clk_en;
    reg   rcc_c1_usb1ulpi_en;
    reg   rcc_c2_usb1ulpi_en;
    reg   rcc_c1_usb1ulpi_lpen;
    reg   rcc_c2_usb1ulpi_lpen;
    reg   rcc_usb1otg_arcg_clk_en;
    reg   rcc_c1_usb1otg_en;
    reg   rcc_c2_usb1otg_en;
    reg   rcc_c1_usb1otg_lpen;
    reg   rcc_c2_usb1otg_lpen;
    reg   rcc_eth1rx_arcg_clk_en;
    reg   rcc_c1_eth1rx_en;
    reg   rcc_c2_eth1rx_en;
    reg   rcc_c1_eth1rx_lpen;
    reg   rcc_c2_eth1rx_lpen;
    reg   rcc_eth1tx_arcg_clk_en;
    reg   rcc_c1_eth1tx_en;
    reg   rcc_c2_eth1tx_en;
    reg   rcc_c1_eth1tx_lpen;
    reg   rcc_c2_eth1tx_lpen;
    reg   rcc_eth1mac_arcg_clk_en;
    reg   rcc_c1_eth1mac_en;
    reg   rcc_c2_eth1mac_en;
    reg   rcc_c1_eth1mac_lpen;
    reg   rcc_c2_eth1mac_lpen;
    reg   rcc_adc12_arcg_clk_en;
    reg   rcc_c1_adc12_en;
    reg   rcc_c2_adc12_en;
    reg   rcc_c1_adc12_lpen;
    reg   rcc_c2_adc12_lpen;
    reg   rcc_dma2_arcg_clk_en;
    reg   rcc_c1_dma2_en;
    reg   rcc_c2_dma2_en;
    reg   rcc_c1_dma2_lpen;
    reg   rcc_c2_dma2_lpen;
    reg   rcc_dma1_arcg_clk_en;
    reg   rcc_c1_dma1_en;
    reg   rcc_c2_dma1_en;
    reg   rcc_c1_dma1_lpen;
    reg   rcc_c2_dma1_lpen;
    reg   rcc_sram3_arcg_clk_en;
    reg   rcc_c1_sram3_en;
    reg   rcc_c1_sram3_lpen;
    reg   rcc_c2_sram3_lpen;
    reg   rcc_sram2_arcg_clk_en;
    reg   rcc_c1_sram2_en;
    reg   rcc_c1_sram2_lpen;
    reg   rcc_c2_sram2_lpen;
    reg   rcc_sram1_arcg_clk_en;
    reg   rcc_c1_sram1_en;
    reg   rcc_c1_sram1_lpen;
    reg   rcc_c2_sram1_lpen;
    reg   rcc_sdmmc2_arcg_clk_en;
    reg   rcc_c1_sdmmc2_en;
    reg   rcc_c2_sdmmc2_en;
    reg   rcc_c1_sdmmc2_lpen;
    reg   rcc_c2_sdmmc2_lpen;
    reg   rcc_rng_arcg_clk_en;
    reg   rcc_c1_rng_en;
    reg   rcc_c2_rng_en;
    reg   rcc_c1_rng_lpen;
    reg   rcc_c2_rng_lpen;
    reg   rcc_hash_arcg_clk_en;
    reg   rcc_c1_hash_en;
    reg   rcc_c2_hash_en;
    reg   rcc_c1_hash_lpen;
    reg   rcc_c2_hash_lpen;
    reg   rcc_crypt_arcg_clk_en;
    reg   rcc_c1_crypt_en;
    reg   rcc_c2_crypt_en;
    reg   rcc_c1_crypt_lpen;
    reg   rcc_c2_crypt_lpen;
    reg   rcc_dcmi_arcg_clk_en;
    reg   rcc_c1_dcmi_en;
    reg   rcc_c2_dcmi_en;
    reg   rcc_c1_dcmi_lpen;
    reg   rcc_c2_dcmi_lpen;
    reg   rcc_ramecc2_arcg_clk_en;
    reg   rcc_uart8_arcg_clk_en;
    reg   rcc_c1_uart8_en;
    reg   rcc_c2_uart8_en;
    reg   rcc_c1_uart8_lpen;
    reg   rcc_c2_uart8_lpen;
    reg   uart8_ker_clk_req;
    reg   rcc_uart7_arcg_clk_en;
    reg   rcc_c1_uart7_en;
    reg   rcc_c2_uart7_en;
    reg   rcc_c1_uart7_lpen;
    reg   rcc_c2_uart7_lpen;
    reg   uart7_ker_clk_req;
    reg   rcc_dac12_arcg_clk_en;
    reg   rcc_c1_dac12_en;
    reg   rcc_c2_dac12_en;
    reg   rcc_c1_dac12_lpen;
    reg   rcc_c2_dac12_lpen;
    reg   rcc_hdmicec_arcg_clk_en;
    reg   rcc_c1_hdmicec_en;
    reg   rcc_c2_hdmicec_en;
    reg   rcc_c1_hdmicec_lpen;
    reg   rcc_c2_hdmicec_lpen;
    reg   rcc_i2c3_arcg_clk_en;
    reg   rcc_c1_i2c3_en;
    reg   rcc_c2_i2c3_en;
    reg   rcc_c1_i2c3_lpen;
    reg   rcc_c2_i2c3_lpen;
    reg   i2c3_ker_clk_req;
    reg   rcc_i2c2_arcg_clk_en;
    reg   rcc_c1_i2c2_en;
    reg   rcc_c2_i2c2_en;
    reg   rcc_c1_i2c2_lpen;
    reg   rcc_c2_i2c2_lpen;
    reg   i2c2_ker_clk_req;
    reg   rcc_i2c1_arcg_clk_en;
    reg   rcc_c1_i2c1_en;
    reg   rcc_c2_i2c1_en;
    reg   rcc_c1_i2c1_lpen;
    reg   rcc_c2_i2c1_lpen;
    reg   i2c1_ker_clk_req;
    reg   rcc_uart5_arcg_clk_en;
    reg   rcc_c1_uart5_en;
    reg   rcc_c2_uart5_en;
    reg   rcc_c1_uart5_lpen;
    reg   rcc_c2_uart5_lpen;
    reg   uart5_ker_clk_req;
    reg   rcc_uart4_arcg_clk_en;
    reg   rcc_c1_uart4_en;
    reg   rcc_c2_uart4_en;
    reg   rcc_c1_uart4_lpen;
    reg   rcc_c2_uart4_lpen;
    reg   uart4_ker_clk_req;
    reg   rcc_usart3_arcg_clk_en;
    reg   rcc_c1_usart3_en;
    reg   rcc_c2_usart3_en;
    reg   rcc_c1_usart3_lpen;
    reg   rcc_c2_usart3_lpen;
    reg   usart3_ker_clk_req;
    reg   rcc_usart2_arcg_clk_en;
    reg   rcc_c1_usart2_en;
    reg   rcc_c2_usart2_en;
    reg   rcc_c1_usart2_lpen;
    reg   rcc_c2_usart2_lpen;
    reg   usart2_ker_clk_req;
    reg   rcc_spdifrx_arcg_clk_en;
    reg   rcc_c1_spdifrx_en;
    reg   rcc_c2_spdifrx_en;
    reg   rcc_c1_spdifrx_lpen;
    reg   rcc_c2_spdifrx_lpen;
    reg   rcc_spi3_arcg_clk_en;
    reg   rcc_c1_spi3_en;
    reg   rcc_c2_spi3_en;
    reg   rcc_c1_spi3_lpen;
    reg   rcc_c2_spi3_lpen;
    reg   rcc_spi2_arcg_clk_en;
    reg   rcc_c1_spi2_en;
    reg   rcc_c2_spi2_en;
    reg   rcc_c1_spi2_lpen;
    reg   rcc_c2_spi2_lpen;
    reg   rcc_wwdg2_arcg_clk_en;
    reg   rcc_c1_wwdg2_en;
    reg   rcc_c2_wwdg2_en;
    reg   rcc_c1_wwdg2_lpen;
    reg   rcc_c2_wwdg2_lpen;
    reg   rcc_lptim1_arcg_clk_en;
    reg   rcc_c1_lptim1_en;
    reg   rcc_c2_lptim1_en;
    reg   rcc_c1_lptim1_lpen;
    reg   rcc_c2_lptim1_lpen;
    reg   rcc_tim14_arcg_clk_en;
    reg   rcc_c1_tim14_en;
    reg   rcc_c2_tim14_en;
    reg   rcc_c1_tim14_lpen;
    reg   rcc_c2_tim14_lpen;
    reg   rcc_tim13_arcg_clk_en;
    reg   rcc_c1_tim13_en;
    reg   rcc_c2_tim13_en;
    reg   rcc_c1_tim13_lpen;
    reg   rcc_c2_tim13_lpen;
    reg   rcc_tim12_arcg_clk_en;
    reg   rcc_c1_tim12_en;
    reg   rcc_c2_tim12_en;
    reg   rcc_c1_tim12_lpen;
    reg   rcc_c2_tim12_lpen;
    reg   rcc_tim7_arcg_clk_en;
    reg   rcc_c1_tim7_en;
    reg   rcc_c2_tim7_en;
    reg   rcc_c1_tim7_lpen;
    reg   rcc_c2_tim7_lpen;
    reg   rcc_tim6_arcg_clk_en;
    reg   rcc_c1_tim6_en;
    reg   rcc_c2_tim6_en;
    reg   rcc_c1_tim6_lpen;
    reg   rcc_c2_tim6_lpen;
    reg   rcc_tim5_arcg_clk_en;
    reg   rcc_c1_tim5_en;
    reg   rcc_c2_tim5_en;
    reg   rcc_c1_tim5_lpen;
    reg   rcc_c2_tim5_lpen;
    reg   rcc_tim4_arcg_clk_en;
    reg   rcc_c1_tim4_en;
    reg   rcc_c2_tim4_en;
    reg   rcc_c1_tim4_lpen;
    reg   rcc_c2_tim4_lpen;
    reg   rcc_tim3_arcg_clk_en;
    reg   rcc_c1_tim3_en;
    reg   rcc_c2_tim3_en;
    reg   rcc_c1_tim3_lpen;
    reg   rcc_c2_tim3_lpen;
    reg   rcc_tim2_arcg_clk_en;
    reg   rcc_c1_tim2_en;
    reg   rcc_c2_tim2_en;
    reg   rcc_c1_tim2_lpen;
    reg   rcc_c2_tim2_lpen;
    reg   rcc_fdcan_arcg_clk_en;
    reg   rcc_c1_fdcan_en;
    reg   rcc_c2_fdcan_en;
    reg   rcc_c1_fdcan_lpen;
    reg   rcc_c2_fdcan_lpen;
    reg   rcc_mdios_arcg_clk_en;
    reg   rcc_c1_mdios_en;
    reg   rcc_c2_mdios_en;
    reg   rcc_c1_mdios_lpen;
    reg   rcc_c2_mdios_lpen;
    reg   rcc_opamp_arcg_clk_en;
    reg   rcc_c1_opamp_en;
    reg   rcc_c2_opamp_en;
    reg   rcc_c1_opamp_lpen;
    reg   rcc_c2_opamp_lpen;
    reg   rcc_swpmi_arcg_clk_en;
    reg   rcc_c1_swpmi_en;
    reg   rcc_c2_swpmi_en;
    reg   rcc_c1_swpmi_lpen;
    reg   rcc_c2_swpmi_lpen;
    reg   rcc_crs_arcg_clk_en;
    reg   rcc_c1_crs_en;
    reg   rcc_c2_crs_en;
    reg   rcc_c1_crs_lpen;
    reg   rcc_c2_crs_lpen;
    reg   rcc_hrtim_arcg_clk_en;
    reg   rcc_c1_hrtim_en;
    reg   rcc_c2_hrtim_en;
    reg   rcc_c1_hrtim_lpen;
    reg   rcc_c2_hrtim_lpen;
    reg   rcc_dfsdm1_arcg_clk_en;
    reg   rcc_c1_dfsdm1_en;
    reg   rcc_c2_dfsdm1_en;
    reg   rcc_c1_dfsdm1_lpen;
    reg   rcc_c2_dfsdm1_lpen;
    reg   rcc_sai3_arcg_clk_en;
    reg   rcc_c1_sai3_en;
    reg   rcc_c2_sai3_en;
    reg   rcc_c1_sai3_lpen;
    reg   rcc_c2_sai3_lpen;
    reg   rcc_sai2_arcg_clk_en;
    reg   rcc_c1_sai2_en;
    reg   rcc_c2_sai2_en;
    reg   rcc_c1_sai2_lpen;
    reg   rcc_c2_sai2_lpen;
    reg   rcc_sai1_arcg_clk_en;
    reg   rcc_c1_sai1_en;
    reg   rcc_c2_sai1_en;
    reg   rcc_c1_sai1_lpen;
    reg   rcc_c2_sai1_lpen;
    reg   rcc_spi5_arcg_clk_en;
    reg   rcc_c1_spi5_en;
    reg   rcc_c2_spi5_en;
    reg   rcc_c1_spi5_lpen;
    reg   rcc_c2_spi5_lpen;
    reg   rcc_tim17_arcg_clk_en;
    reg   rcc_c1_tim17_en;
    reg   rcc_c2_tim17_en;
    reg   rcc_c1_tim17_lpen;
    reg   rcc_c2_tim17_lpen;
    reg   rcc_tim16_arcg_clk_en;
    reg   rcc_c1_tim16_en;
    reg   rcc_c2_tim16_en;
    reg   rcc_c1_tim16_lpen;
    reg   rcc_c2_tim16_lpen;
    reg   rcc_tim15_arcg_clk_en;
    reg   rcc_c1_tim15_en;
    reg   rcc_c2_tim15_en;
    reg   rcc_c1_tim15_lpen;
    reg   rcc_c2_tim15_lpen;
    reg   rcc_spi4_arcg_clk_en;
    reg   rcc_c1_spi4_en;
    reg   rcc_c2_spi4_en;
    reg   rcc_c1_spi4_lpen;
    reg   rcc_c2_spi4_lpen;
    reg   rcc_spi1_arcg_clk_en;
    reg   rcc_c1_spi1_en;
    reg   rcc_c2_spi1_en;
    reg   rcc_c1_spi1_lpen;
    reg   rcc_c2_spi1_lpen;
    reg   rcc_usart6_arcg_clk_en;
    reg   rcc_c1_usart6_en;
    reg   rcc_c2_usart6_en;
    reg   rcc_c1_usart6_lpen;
    reg   rcc_c2_usart6_lpen;
    reg   usart6_ker_clk_req;
    reg   rcc_usart1_arcg_clk_en;
    reg   rcc_c1_usart1_en;
    reg   rcc_c2_usart1_en;
    reg   rcc_c1_usart1_lpen;
    reg   rcc_c2_usart1_lpen;
    reg   usart1_ker_clk_req;
    reg   rcc_tim8_arcg_clk_en;
    reg   rcc_c1_tim8_en;
    reg   rcc_c2_tim8_en;
    reg   rcc_c1_tim8_lpen;
    reg   rcc_c2_tim8_lpen;
    reg   rcc_tim1_arcg_clk_en;
    reg   rcc_c1_tim1_en;
    reg   rcc_c2_tim1_en;
    reg   rcc_c1_tim1_lpen;
    reg   rcc_c2_tim1_lpen;
    reg   rcc_sram4_arcg_clk_en;
    reg   rcc_c1_sram4_lpen;
    reg   rcc_c2_sram4_lpen;
    reg   rcc_sram4_amen;
    reg   rcc_bkpram_arcg_clk_en;
    reg   rcc_c1_bkpram_en;
    reg   rcc_c2_bkpram_en;
    reg   rcc_c1_bkpram_lpen;
    reg   rcc_c2_bkpram_lpen;
    reg   rcc_bkpram_amen;
    reg   rcc_ramecc3_arcg_clk_en;
    reg   rcc_hsem_arcg_clk_en;
    reg   rcc_c1_hsem_en;
    reg   rcc_c2_hsem_en;
    reg   rcc_adc3_arcg_clk_en;
    reg   rcc_c1_adc3_en;
    reg   rcc_c2_adc3_en;
    reg   rcc_c1_adc3_lpen;
    reg   rcc_c2_adc3_lpen;
    reg   rcc_adc3_amen;
    reg   rcc_bdma_arcg_clk_en;
    reg   rcc_c1_bdma_en;
    reg   rcc_c2_bdma_en;
    reg   rcc_c1_bdma_lpen;
    reg   rcc_c2_bdma_lpen;
    reg   rcc_bdma_amen;
    reg   rcc_crc_arcg_clk_en;
    reg   rcc_c1_crc_en;
    reg   rcc_c2_crc_en;
    reg   rcc_c1_crc_lpen;
    reg   rcc_c2_crc_lpen;
    reg   rcc_crc_amen;
    reg   rcc_gpiok_arcg_clk_en;
    reg   rcc_c1_gpiok_en;
    reg   rcc_c2_gpiok_en;
    reg   rcc_c1_gpiok_lpen;
    reg   rcc_c2_gpiok_lpen;
    reg   rcc_gpiok_amen;
    reg   rcc_gpioj_arcg_clk_en;
    reg   rcc_c1_gpioj_en;
    reg   rcc_c2_gpioj_en;
    reg   rcc_c1_gpioj_lpen;
    reg   rcc_c2_gpioj_lpen;
    reg   rcc_gpioj_amen;
    reg   rcc_gpioi_arcg_clk_en;
    reg   rcc_c1_gpioi_en;
    reg   rcc_c2_gpioi_en;
    reg   rcc_c1_gpioi_lpen;
    reg   rcc_c2_gpioi_lpen;
    reg   rcc_gpioi_amen;
    reg   rcc_gpioh_arcg_clk_en;
    reg   rcc_c1_gpioh_en;
    reg   rcc_c2_gpioh_en;
    reg   rcc_c1_gpioh_lpen;
    reg   rcc_c2_gpioh_lpen;
    reg   rcc_gpioh_amen;
    reg   rcc_gpiog_arcg_clk_en;
    reg   rcc_c1_gpiog_en;
    reg   rcc_c2_gpiog_en;
    reg   rcc_c1_gpiog_lpen;
    reg   rcc_c2_gpiog_lpen;
    reg   rcc_gpiog_amen;
    reg   rcc_gpiof_arcg_clk_en;
    reg   rcc_c1_gpiof_en;
    reg   rcc_c2_gpiof_en;
    reg   rcc_c1_gpiof_lpen;
    reg   rcc_c2_gpiof_lpen;
    reg   rcc_gpiof_amen;
    reg   rcc_gpioe_arcg_clk_en;
    reg   rcc_c1_gpioe_en;
    reg   rcc_c2_gpioe_en;
    reg   rcc_c1_gpioe_lpen;
    reg   rcc_c2_gpioe_lpen;
    reg   rcc_gpioe_amen;
    reg   rcc_gpiod_arcg_clk_en;
    reg   rcc_c1_gpiod_en;
    reg   rcc_c2_gpiod_en;
    reg   rcc_c1_gpiod_lpen;
    reg   rcc_c2_gpiod_lpen;
    reg   rcc_gpiod_amen;
    reg   rcc_gpioc_arcg_clk_en;
    reg   rcc_c1_gpioc_en;
    reg   rcc_c2_gpioc_en;
    reg   rcc_c1_gpioc_lpen;
    reg   rcc_c2_gpioc_lpen;
    reg   rcc_gpioc_amen;
    reg   rcc_gpiob_arcg_clk_en;
    reg   rcc_c1_gpiob_en;
    reg   rcc_c2_gpiob_en;
    reg   rcc_c1_gpiob_lpen;
    reg   rcc_c2_gpiob_lpen;
    reg   rcc_gpiob_amen;
    reg   rcc_gpioa_arcg_clk_en;
    reg   rcc_c1_gpioa_en;
    reg   rcc_c2_gpioa_en;
    reg   rcc_c1_gpioa_lpen;
    reg   rcc_c2_gpioa_lpen;
    reg   rcc_gpioa_amen;
    reg   rcc_rcc_arcg_clk_en;
    reg   rcc_pwr_arcg_clk_en;
    reg   rcc_sai4_arcg_clk_en;
    reg   rcc_c1_sai4_en;
    reg   rcc_c2_sai4_en;
    reg   rcc_c1_sai4_lpen;
    reg   rcc_c2_sai4_lpen;
    reg   rcc_sai4_amen;
    reg   rcc_rtc_arcg_clk_en;
    reg   rcc_c1_rtc_en;
    reg   rcc_c2_rtc_en;
    reg   rcc_c1_rtc_lpen;
    reg   rcc_c2_rtc_lpen;
    reg   rcc_rtc_amen;
    reg   rcc_vref_arcg_clk_en;
    reg   rcc_c1_vref_en;
    reg   rcc_c2_vref_en;
    reg   rcc_c1_vref_lpen;
    reg   rcc_c2_vref_lpen;
    reg   rcc_vref_amen;
    reg   rcc_comp12_arcg_clk_en;
    reg   rcc_c1_comp12_en;
    reg   rcc_c2_comp12_en;
    reg   rcc_c1_comp12_lpen;
    reg   rcc_c2_comp12_lpen;
    reg   rcc_comp12_amen;
    reg   rcc_lptim5_arcg_clk_en;
    reg   rcc_c1_lptim5_en;
    reg   rcc_c2_lptim5_en;
    reg   rcc_c1_lptim5_lpen;
    reg   rcc_c2_lptim5_lpen;
    reg   rcc_lptim5_amen;
    reg   rcc_lptim4_arcg_clk_en;
    reg   rcc_c1_lptim4_en;
    reg   rcc_c2_lptim4_en;
    reg   rcc_c1_lptim4_lpen;
    reg   rcc_c2_lptim4_lpen;
    reg   rcc_lptim4_amen;
    reg   rcc_lptim3_arcg_clk_en;
    reg   rcc_c1_lptim3_en;
    reg   rcc_c2_lptim3_en;
    reg   rcc_c1_lptim3_lpen;
    reg   rcc_c2_lptim3_lpen;
    reg   rcc_lptim3_amen;
    reg   rcc_lptim2_arcg_clk_en;
    reg   rcc_c1_lptim2_en;
    reg   rcc_c2_lptim2_en;
    reg   rcc_c1_lptim2_lpen;
    reg   rcc_c2_lptim2_lpen;
    reg   rcc_lptim2_amen;
    reg   rcc_i2c4_arcg_clk_en;
    reg   rcc_c1_i2c4_en;
    reg   rcc_c2_i2c4_en;
    reg   rcc_c1_i2c4_lpen;
    reg   rcc_c2_i2c4_lpen;
    reg   rcc_i2c4_amen;
    reg   i2c4_ker_clk_req;
    reg   rcc_spi6_arcg_clk_en;
    reg   rcc_c1_spi6_en;
    reg   rcc_c2_spi6_en;
    reg   rcc_c1_spi6_lpen;
    reg   rcc_c2_spi6_lpen;
    reg   rcc_spi6_amen;
    reg   rcc_lpuart1_arcg_clk_en;
    reg   rcc_c1_lpuart1_en;
    reg   rcc_c2_lpuart1_en;
    reg   rcc_c1_lpuart1_lpen;
    reg   rcc_c2_lpuart1_lpen;
    reg   rcc_lpuart1_amen;
    reg   lpuart1_ker_clk_req;
    reg   rcc_syscfg_arcg_clk_en;
    reg   rcc_c1_syscfg_en;
    reg   rcc_c2_syscfg_en;
    reg   rcc_c1_syscfg_lpen;
    reg   rcc_c2_syscfg_lpen;
    reg   rcc_syscfg_amen;
    reg   rcc_iwdg2_arcg_clk_en;
    reg   rcc_iwdg1_arcg_clk_en;
    reg   rcc_exti_arcg_clk_en;
reg   [1:0]  qspisel;
reg   [1:0]  fmcsel;
reg   [0:0]  sdmmcsel;
reg   [1:0]  usbsel;
reg   [1:0]  adcsel;
reg   [1:0]  rngsel;
reg   [1:0]  cecsel;
reg   [1:0]  i2c123sel;
reg   [2:0]  usart234578sel;
reg   [1:0]  spdifsel;
reg   [2:0]  lptim1sel;
reg   [1:0]  fdcansel;
reg   [0:0]  swpsel;
reg   [2:0]  sai1sel;
reg   [0:0]  dfsdm1sel;
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

// rcc_per_clk_control Outputs
wire  c2_per_alloc_d1;
wire  c1_per_alloc_d2;
wire  hsi_ker_clk_req;
wire  csi_ker_clk_req;
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
wire  rcc_rtc_pclk;
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

rcc_per_clk_control  u_rcc_per_clk_control (
    .sys_rst_n                 ( sys_rst_n                  ),
    .rcc_axibridge_d1_clk      ( rcc_axibridge_d1_clk       ),
    .rcc_ahb3bridge_d1_clk     ( rcc_ahb3bridge_d1_clk      ),
    .rcc_apb3bridge_d1_clk     ( rcc_apb3bridge_d1_clk      ),
    .rcc_ahb1bridge_d2_clk     ( rcc_ahb1bridge_d2_clk      ),
    .rcc_ahb2bridge_d2_clk     ( rcc_ahb2bridge_d2_clk      ),
    .rcc_apb1bridge_d2_clk     ( rcc_apb1bridge_d2_clk      ),
    .rcc_apb2bridge_d2_clk     ( rcc_apb2bridge_d2_clk      ),
    .rcc_ahb4bridge_d3_clk     ( rcc_ahb4bridge_d3_clk      ),
    .rcc_apb4bridge_d3_clk     ( rcc_apb4bridge_d3_clk      ),
    .pll1_q_clk                ( pll1_q_clk                 ),
    .pll2_p_clk                ( pll2_p_clk                 ),
    .pll2_q_clk                ( pll2_q_clk                 ),
    .pll2_r_clk                ( pll2_r_clk                 ),
    .pll3_p_clk                ( pll3_p_clk                 ),
    .pll3_q_clk                ( pll3_q_clk                 ),
    .pll3_r_clk                ( pll3_r_clk                 ),
    .sys_clk                   ( sys_clk                    ),
    .hse_clk                   ( hse_clk                    ),
    .hsi_ker_clk               ( hsi_ker_clk                ),
    .csi_ker_clk               ( csi_ker_clk                ),
    .hsi48_clk                 ( hsi48_clk                  ),
    .lse_clk                   ( lse_clk                    ),
    .lsi_clk                   ( lsi_clk                    ),
    .per_clk                   ( per_clk                    ),
    .I2S_clk_IN                ( I2S_clk_IN                 ),
    .USB_PHY1                  ( USB_PHY1                   ),
    .c1_sleep                  ( c1_sleep                   ),
    .c1_deepsleep              ( c1_deepsleep               ),
    .c2_sleep                  ( c2_sleep                   ),
    .c2_deepsleep              ( c2_deepsleep               ),
    .d3_deepsleep              ( d3_deepsleep               ),
    .rcc_flash_arcg_clk_en     ( rcc_flash_arcg_clk_en      ),
    .rcc_c2_flash_en           ( rcc_c2_flash_en            ),
    .rcc_c1_flash_lpen         ( rcc_c1_flash_lpen          ),
    .rcc_c2_flash_lpen         ( rcc_c2_flash_lpen          ),
    .rcc_qspi_arcg_clk_en      ( rcc_qspi_arcg_clk_en       ),
    .rcc_c1_qspi_en            ( rcc_c1_qspi_en             ),
    .rcc_c2_qspi_en            ( rcc_c2_qspi_en             ),
    .rcc_c1_qspi_lpen          ( rcc_c1_qspi_lpen           ),
    .rcc_c2_qspi_lpen          ( rcc_c2_qspi_lpen           ),
    .rcc_axisram_arcg_clk_en   ( rcc_axisram_arcg_clk_en    ),
    .rcc_c2_axisram_en         ( rcc_c2_axisram_en          ),
    .rcc_c1_axisram_lpen       ( rcc_c1_axisram_lpen        ),
    .rcc_c2_axisram_lpen       ( rcc_c2_axisram_lpen        ),
    .rcc_fmc_arcg_clk_en       ( rcc_fmc_arcg_clk_en        ),
    .rcc_c1_fmc_en             ( rcc_c1_fmc_en              ),
    .rcc_c2_fmc_en             ( rcc_c2_fmc_en              ),
    .rcc_c1_fmc_lpen           ( rcc_c1_fmc_lpen            ),
    .rcc_c2_fmc_lpen           ( rcc_c2_fmc_lpen            ),
    .rcc_dma2d_arcg_clk_en     ( rcc_dma2d_arcg_clk_en      ),
    .rcc_c1_dma2d_en           ( rcc_c1_dma2d_en            ),
    .rcc_c2_dma2d_en           ( rcc_c2_dma2d_en            ),
    .rcc_c1_dma2d_lpen         ( rcc_c1_dma2d_lpen          ),
    .rcc_c2_dma2d_lpen         ( rcc_c2_dma2d_lpen          ),
    .rcc_mdma_arcg_clk_en      ( rcc_mdma_arcg_clk_en       ),
    .rcc_c1_mdma_en            ( rcc_c1_mdma_en             ),
    .rcc_c2_mdma_en            ( rcc_c2_mdma_en             ),
    .rcc_c1_mdma_lpen          ( rcc_c1_mdma_lpen           ),
    .rcc_c2_mdma_lpen          ( rcc_c2_mdma_lpen           ),
    .rcc_ltdc_arcg_clk_en      ( rcc_ltdc_arcg_clk_en       ),
    .rcc_c1_ltdc_en            ( rcc_c1_ltdc_en             ),
    .rcc_c2_ltdc_en            ( rcc_c2_ltdc_en             ),
    .rcc_c1_ltdc_lpen          ( rcc_c1_ltdc_lpen           ),
    .rcc_c2_ltdc_lpen          ( rcc_c2_ltdc_lpen           ),
    .rcc_ramecc1_arcg_clk_en   ( rcc_ramecc1_arcg_clk_en    ),
    .rcc_gpv_arcg_clk_en       ( rcc_gpv_arcg_clk_en        ),
    .rcc_itcm_arcg_clk_en      ( rcc_itcm_arcg_clk_en       ),
    .rcc_c2_itcm_en            ( rcc_c2_itcm_en             ),
    .rcc_c1_itcm_lpen          ( rcc_c1_itcm_lpen           ),
    .rcc_c2_itcm_lpen          ( rcc_c2_itcm_lpen           ),
    .rcc_dtcm2_arcg_clk_en     ( rcc_dtcm2_arcg_clk_en      ),
    .rcc_c2_dtcm2_en           ( rcc_c2_dtcm2_en            ),
    .rcc_c1_dtcm2_lpen         ( rcc_c1_dtcm2_lpen          ),
    .rcc_c2_dtcm2_lpen         ( rcc_c2_dtcm2_lpen          ),
    .rcc_dtcm1_arcg_clk_en     ( rcc_dtcm1_arcg_clk_en      ),
    .rcc_c2_dtcm1_en           ( rcc_c2_dtcm1_en            ),
    .rcc_c1_dtcm1_lpen         ( rcc_c1_dtcm1_lpen          ),
    .rcc_c2_dtcm1_lpen         ( rcc_c2_dtcm1_lpen          ),
    .rcc_jpgdec_arcg_clk_en    ( rcc_jpgdec_arcg_clk_en     ),
    .rcc_c1_jpgdec_en          ( rcc_c1_jpgdec_en           ),
    .rcc_c2_jpgdec_en          ( rcc_c2_jpgdec_en           ),
    .rcc_c1_jpgdec_lpen        ( rcc_c1_jpgdec_lpen         ),
    .rcc_c2_jpgdec_lpen        ( rcc_c2_jpgdec_lpen         ),
    .rcc_sdmmc1_arcg_clk_en    ( rcc_sdmmc1_arcg_clk_en     ),
    .rcc_c1_sdmmc1_en          ( rcc_c1_sdmmc1_en           ),
    .rcc_c2_sdmmc1_en          ( rcc_c2_sdmmc1_en           ),
    .rcc_c1_sdmmc1_lpen        ( rcc_c1_sdmmc1_lpen         ),
    .rcc_c2_sdmmc1_lpen        ( rcc_c2_sdmmc1_lpen         ),
    .rcc_wwdg1_arcg_clk_en     ( rcc_wwdg1_arcg_clk_en      ),
    .rcc_c1_wwdg1_en           ( rcc_c1_wwdg1_en            ),
    .rcc_c2_wwdg1_en           ( rcc_c2_wwdg1_en            ),
    .rcc_c1_wwdg1_lpen         ( rcc_c1_wwdg1_lpen          ),
    .rcc_c2_wwdg1_lpen         ( rcc_c2_wwdg1_lpen          ),
    .rcc_usb2ulpi_arcg_clk_en  ( rcc_usb2ulpi_arcg_clk_en   ),
    .rcc_c1_usb2ulpi_en        ( rcc_c1_usb2ulpi_en         ),
    .rcc_c2_usb2ulpi_en        ( rcc_c2_usb2ulpi_en         ),
    .rcc_c1_usb2ulpi_lpen      ( rcc_c1_usb2ulpi_lpen       ),
    .rcc_c2_usb2ulpi_lpen      ( rcc_c2_usb2ulpi_lpen       ),
    .rcc_usb2otg_arcg_clk_en   ( rcc_usb2otg_arcg_clk_en    ),
    .rcc_c1_usb2otg_en         ( rcc_c1_usb2otg_en          ),
    .rcc_c2_usb2otg_en         ( rcc_c2_usb2otg_en          ),
    .rcc_c1_usb2otg_lpen       ( rcc_c1_usb2otg_lpen        ),
    .rcc_c2_usb2otg_lpen       ( rcc_c2_usb2otg_lpen        ),
    .rcc_usb1ulpi_arcg_clk_en  ( rcc_usb1ulpi_arcg_clk_en   ),
    .rcc_c1_usb1ulpi_en        ( rcc_c1_usb1ulpi_en         ),
    .rcc_c2_usb1ulpi_en        ( rcc_c2_usb1ulpi_en         ),
    .rcc_c1_usb1ulpi_lpen      ( rcc_c1_usb1ulpi_lpen       ),
    .rcc_c2_usb1ulpi_lpen      ( rcc_c2_usb1ulpi_lpen       ),
    .rcc_usb1otg_arcg_clk_en   ( rcc_usb1otg_arcg_clk_en    ),
    .rcc_c1_usb1otg_en         ( rcc_c1_usb1otg_en          ),
    .rcc_c2_usb1otg_en         ( rcc_c2_usb1otg_en          ),
    .rcc_c1_usb1otg_lpen       ( rcc_c1_usb1otg_lpen        ),
    .rcc_c2_usb1otg_lpen       ( rcc_c2_usb1otg_lpen        ),
    .rcc_eth1rx_arcg_clk_en    ( rcc_eth1rx_arcg_clk_en     ),
    .rcc_c1_eth1rx_en          ( rcc_c1_eth1rx_en           ),
    .rcc_c2_eth1rx_en          ( rcc_c2_eth1rx_en           ),
    .rcc_c1_eth1rx_lpen        ( rcc_c1_eth1rx_lpen         ),
    .rcc_c2_eth1rx_lpen        ( rcc_c2_eth1rx_lpen         ),
    .rcc_eth1tx_arcg_clk_en    ( rcc_eth1tx_arcg_clk_en     ),
    .rcc_c1_eth1tx_en          ( rcc_c1_eth1tx_en           ),
    .rcc_c2_eth1tx_en          ( rcc_c2_eth1tx_en           ),
    .rcc_c1_eth1tx_lpen        ( rcc_c1_eth1tx_lpen         ),
    .rcc_c2_eth1tx_lpen        ( rcc_c2_eth1tx_lpen         ),
    .rcc_eth1mac_arcg_clk_en   ( rcc_eth1mac_arcg_clk_en    ),
    .rcc_c1_eth1mac_en         ( rcc_c1_eth1mac_en          ),
    .rcc_c2_eth1mac_en         ( rcc_c2_eth1mac_en          ),
    .rcc_c1_eth1mac_lpen       ( rcc_c1_eth1mac_lpen        ),
    .rcc_c2_eth1mac_lpen       ( rcc_c2_eth1mac_lpen        ),
    .rcc_adc12_arcg_clk_en     ( rcc_adc12_arcg_clk_en      ),
    .rcc_c1_adc12_en           ( rcc_c1_adc12_en            ),
    .rcc_c2_adc12_en           ( rcc_c2_adc12_en            ),
    .rcc_c1_adc12_lpen         ( rcc_c1_adc12_lpen          ),
    .rcc_c2_adc12_lpen         ( rcc_c2_adc12_lpen          ),
    .rcc_dma2_arcg_clk_en      ( rcc_dma2_arcg_clk_en       ),
    .rcc_c1_dma2_en            ( rcc_c1_dma2_en             ),
    .rcc_c2_dma2_en            ( rcc_c2_dma2_en             ),
    .rcc_c1_dma2_lpen          ( rcc_c1_dma2_lpen           ),
    .rcc_c2_dma2_lpen          ( rcc_c2_dma2_lpen           ),
    .rcc_dma1_arcg_clk_en      ( rcc_dma1_arcg_clk_en       ),
    .rcc_c1_dma1_en            ( rcc_c1_dma1_en             ),
    .rcc_c2_dma1_en            ( rcc_c2_dma1_en             ),
    .rcc_c1_dma1_lpen          ( rcc_c1_dma1_lpen           ),
    .rcc_c2_dma1_lpen          ( rcc_c2_dma1_lpen           ),
    .rcc_sram3_arcg_clk_en     ( rcc_sram3_arcg_clk_en      ),
    .rcc_c1_sram3_en           ( rcc_c1_sram3_en            ),
    .rcc_c1_sram3_lpen         ( rcc_c1_sram3_lpen          ),
    .rcc_c2_sram3_lpen         ( rcc_c2_sram3_lpen          ),
    .rcc_sram2_arcg_clk_en     ( rcc_sram2_arcg_clk_en      ),
    .rcc_c1_sram2_en           ( rcc_c1_sram2_en            ),
    .rcc_c1_sram2_lpen         ( rcc_c1_sram2_lpen          ),
    .rcc_c2_sram2_lpen         ( rcc_c2_sram2_lpen          ),
    .rcc_sram1_arcg_clk_en     ( rcc_sram1_arcg_clk_en      ),
    .rcc_c1_sram1_en           ( rcc_c1_sram1_en            ),
    .rcc_c1_sram1_lpen         ( rcc_c1_sram1_lpen          ),
    .rcc_c2_sram1_lpen         ( rcc_c2_sram1_lpen          ),
    .rcc_sdmmc2_arcg_clk_en    ( rcc_sdmmc2_arcg_clk_en     ),
    .rcc_c1_sdmmc2_en          ( rcc_c1_sdmmc2_en           ),
    .rcc_c2_sdmmc2_en          ( rcc_c2_sdmmc2_en           ),
    .rcc_c1_sdmmc2_lpen        ( rcc_c1_sdmmc2_lpen         ),
    .rcc_c2_sdmmc2_lpen        ( rcc_c2_sdmmc2_lpen         ),
    .rcc_rng_arcg_clk_en       ( rcc_rng_arcg_clk_en        ),
    .rcc_c1_rng_en             ( rcc_c1_rng_en              ),
    .rcc_c2_rng_en             ( rcc_c2_rng_en              ),
    .rcc_c1_rng_lpen           ( rcc_c1_rng_lpen            ),
    .rcc_c2_rng_lpen           ( rcc_c2_rng_lpen            ),
    .rcc_hash_arcg_clk_en      ( rcc_hash_arcg_clk_en       ),
    .rcc_c1_hash_en            ( rcc_c1_hash_en             ),
    .rcc_c2_hash_en            ( rcc_c2_hash_en             ),
    .rcc_c1_hash_lpen          ( rcc_c1_hash_lpen           ),
    .rcc_c2_hash_lpen          ( rcc_c2_hash_lpen           ),
    .rcc_crypt_arcg_clk_en     ( rcc_crypt_arcg_clk_en      ),
    .rcc_c1_crypt_en           ( rcc_c1_crypt_en            ),
    .rcc_c2_crypt_en           ( rcc_c2_crypt_en            ),
    .rcc_c1_crypt_lpen         ( rcc_c1_crypt_lpen          ),
    .rcc_c2_crypt_lpen         ( rcc_c2_crypt_lpen          ),
    .rcc_dcmi_arcg_clk_en      ( rcc_dcmi_arcg_clk_en       ),
    .rcc_c1_dcmi_en            ( rcc_c1_dcmi_en             ),
    .rcc_c2_dcmi_en            ( rcc_c2_dcmi_en             ),
    .rcc_c1_dcmi_lpen          ( rcc_c1_dcmi_lpen           ),
    .rcc_c2_dcmi_lpen          ( rcc_c2_dcmi_lpen           ),
    .rcc_ramecc2_arcg_clk_en   ( rcc_ramecc2_arcg_clk_en    ),
    .rcc_uart8_arcg_clk_en     ( rcc_uart8_arcg_clk_en      ),
    .rcc_c1_uart8_en           ( rcc_c1_uart8_en            ),
    .rcc_c2_uart8_en           ( rcc_c2_uart8_en            ),
    .rcc_c1_uart8_lpen         ( rcc_c1_uart8_lpen          ),
    .rcc_c2_uart8_lpen         ( rcc_c2_uart8_lpen          ),
    .uart8_ker_clk_req         ( uart8_ker_clk_req          ),
    .rcc_uart7_arcg_clk_en     ( rcc_uart7_arcg_clk_en      ),
    .rcc_c1_uart7_en           ( rcc_c1_uart7_en            ),
    .rcc_c2_uart7_en           ( rcc_c2_uart7_en            ),
    .rcc_c1_uart7_lpen         ( rcc_c1_uart7_lpen          ),
    .rcc_c2_uart7_lpen         ( rcc_c2_uart7_lpen          ),
    .uart7_ker_clk_req         ( uart7_ker_clk_req          ),
    .rcc_dac12_arcg_clk_en     ( rcc_dac12_arcg_clk_en      ),
    .rcc_c1_dac12_en           ( rcc_c1_dac12_en            ),
    .rcc_c2_dac12_en           ( rcc_c2_dac12_en            ),
    .rcc_c1_dac12_lpen         ( rcc_c1_dac12_lpen          ),
    .rcc_c2_dac12_lpen         ( rcc_c2_dac12_lpen          ),
    .rcc_hdmicec_arcg_clk_en   ( rcc_hdmicec_arcg_clk_en    ),
    .rcc_c1_hdmicec_en         ( rcc_c1_hdmicec_en          ),
    .rcc_c2_hdmicec_en         ( rcc_c2_hdmicec_en          ),
    .rcc_c1_hdmicec_lpen       ( rcc_c1_hdmicec_lpen        ),
    .rcc_c2_hdmicec_lpen       ( rcc_c2_hdmicec_lpen        ),
    .rcc_i2c3_arcg_clk_en      ( rcc_i2c3_arcg_clk_en       ),
    .rcc_c1_i2c3_en            ( rcc_c1_i2c3_en             ),
    .rcc_c2_i2c3_en            ( rcc_c2_i2c3_en             ),
    .rcc_c1_i2c3_lpen          ( rcc_c1_i2c3_lpen           ),
    .rcc_c2_i2c3_lpen          ( rcc_c2_i2c3_lpen           ),
    .i2c3_ker_clk_req          ( i2c3_ker_clk_req           ),
    .rcc_i2c2_arcg_clk_en      ( rcc_i2c2_arcg_clk_en       ),
    .rcc_c1_i2c2_en            ( rcc_c1_i2c2_en             ),
    .rcc_c2_i2c2_en            ( rcc_c2_i2c2_en             ),
    .rcc_c1_i2c2_lpen          ( rcc_c1_i2c2_lpen           ),
    .rcc_c2_i2c2_lpen          ( rcc_c2_i2c2_lpen           ),
    .i2c2_ker_clk_req          ( i2c2_ker_clk_req           ),
    .rcc_i2c1_arcg_clk_en      ( rcc_i2c1_arcg_clk_en       ),
    .rcc_c1_i2c1_en            ( rcc_c1_i2c1_en             ),
    .rcc_c2_i2c1_en            ( rcc_c2_i2c1_en             ),
    .rcc_c1_i2c1_lpen          ( rcc_c1_i2c1_lpen           ),
    .rcc_c2_i2c1_lpen          ( rcc_c2_i2c1_lpen           ),
    .i2c1_ker_clk_req          ( i2c1_ker_clk_req           ),
    .rcc_uart5_arcg_clk_en     ( rcc_uart5_arcg_clk_en      ),
    .rcc_c1_uart5_en           ( rcc_c1_uart5_en            ),
    .rcc_c2_uart5_en           ( rcc_c2_uart5_en            ),
    .rcc_c1_uart5_lpen         ( rcc_c1_uart5_lpen          ),
    .rcc_c2_uart5_lpen         ( rcc_c2_uart5_lpen          ),
    .uart5_ker_clk_req         ( uart5_ker_clk_req          ),
    .rcc_uart4_arcg_clk_en     ( rcc_uart4_arcg_clk_en      ),
    .rcc_c1_uart4_en           ( rcc_c1_uart4_en            ),
    .rcc_c2_uart4_en           ( rcc_c2_uart4_en            ),
    .rcc_c1_uart4_lpen         ( rcc_c1_uart4_lpen          ),
    .rcc_c2_uart4_lpen         ( rcc_c2_uart4_lpen          ),
    .uart4_ker_clk_req         ( uart4_ker_clk_req          ),
    .rcc_usart3_arcg_clk_en    ( rcc_usart3_arcg_clk_en     ),
    .rcc_c1_usart3_en          ( rcc_c1_usart3_en           ),
    .rcc_c2_usart3_en          ( rcc_c2_usart3_en           ),
    .rcc_c1_usart3_lpen        ( rcc_c1_usart3_lpen         ),
    .rcc_c2_usart3_lpen        ( rcc_c2_usart3_lpen         ),
    .usart3_ker_clk_req        ( usart3_ker_clk_req         ),
    .rcc_usart2_arcg_clk_en    ( rcc_usart2_arcg_clk_en     ),
    .rcc_c1_usart2_en          ( rcc_c1_usart2_en           ),
    .rcc_c2_usart2_en          ( rcc_c2_usart2_en           ),
    .rcc_c1_usart2_lpen        ( rcc_c1_usart2_lpen         ),
    .rcc_c2_usart2_lpen        ( rcc_c2_usart2_lpen         ),
    .usart2_ker_clk_req        ( usart2_ker_clk_req         ),
    .rcc_spdifrx_arcg_clk_en   ( rcc_spdifrx_arcg_clk_en    ),
    .rcc_c1_spdifrx_en         ( rcc_c1_spdifrx_en          ),
    .rcc_c2_spdifrx_en         ( rcc_c2_spdifrx_en          ),
    .rcc_c1_spdifrx_lpen       ( rcc_c1_spdifrx_lpen        ),
    .rcc_c2_spdifrx_lpen       ( rcc_c2_spdifrx_lpen        ),
    .rcc_spi3_arcg_clk_en      ( rcc_spi3_arcg_clk_en       ),
    .rcc_c1_spi3_en            ( rcc_c1_spi3_en             ),
    .rcc_c2_spi3_en            ( rcc_c2_spi3_en             ),
    .rcc_c1_spi3_lpen          ( rcc_c1_spi3_lpen           ),
    .rcc_c2_spi3_lpen          ( rcc_c2_spi3_lpen           ),
    .rcc_spi2_arcg_clk_en      ( rcc_spi2_arcg_clk_en       ),
    .rcc_c1_spi2_en            ( rcc_c1_spi2_en             ),
    .rcc_c2_spi2_en            ( rcc_c2_spi2_en             ),
    .rcc_c1_spi2_lpen          ( rcc_c1_spi2_lpen           ),
    .rcc_c2_spi2_lpen          ( rcc_c2_spi2_lpen           ),
    .rcc_wwdg2_arcg_clk_en     ( rcc_wwdg2_arcg_clk_en      ),
    .rcc_c1_wwdg2_en           ( rcc_c1_wwdg2_en            ),
    .rcc_c2_wwdg2_en           ( rcc_c2_wwdg2_en            ),
    .rcc_c1_wwdg2_lpen         ( rcc_c1_wwdg2_lpen          ),
    .rcc_c2_wwdg2_lpen         ( rcc_c2_wwdg2_lpen          ),
    .rcc_lptim1_arcg_clk_en    ( rcc_lptim1_arcg_clk_en     ),
    .rcc_c1_lptim1_en          ( rcc_c1_lptim1_en           ),
    .rcc_c2_lptim1_en          ( rcc_c2_lptim1_en           ),
    .rcc_c1_lptim1_lpen        ( rcc_c1_lptim1_lpen         ),
    .rcc_c2_lptim1_lpen        ( rcc_c2_lptim1_lpen         ),
    .rcc_tim14_arcg_clk_en     ( rcc_tim14_arcg_clk_en      ),
    .rcc_c1_tim14_en           ( rcc_c1_tim14_en            ),
    .rcc_c2_tim14_en           ( rcc_c2_tim14_en            ),
    .rcc_c1_tim14_lpen         ( rcc_c1_tim14_lpen          ),
    .rcc_c2_tim14_lpen         ( rcc_c2_tim14_lpen          ),
    .rcc_tim13_arcg_clk_en     ( rcc_tim13_arcg_clk_en      ),
    .rcc_c1_tim13_en           ( rcc_c1_tim13_en            ),
    .rcc_c2_tim13_en           ( rcc_c2_tim13_en            ),
    .rcc_c1_tim13_lpen         ( rcc_c1_tim13_lpen          ),
    .rcc_c2_tim13_lpen         ( rcc_c2_tim13_lpen          ),
    .rcc_tim12_arcg_clk_en     ( rcc_tim12_arcg_clk_en      ),
    .rcc_c1_tim12_en           ( rcc_c1_tim12_en            ),
    .rcc_c2_tim12_en           ( rcc_c2_tim12_en            ),
    .rcc_c1_tim12_lpen         ( rcc_c1_tim12_lpen          ),
    .rcc_c2_tim12_lpen         ( rcc_c2_tim12_lpen          ),
    .rcc_tim7_arcg_clk_en      ( rcc_tim7_arcg_clk_en       ),
    .rcc_c1_tim7_en            ( rcc_c1_tim7_en             ),
    .rcc_c2_tim7_en            ( rcc_c2_tim7_en             ),
    .rcc_c1_tim7_lpen          ( rcc_c1_tim7_lpen           ),
    .rcc_c2_tim7_lpen          ( rcc_c2_tim7_lpen           ),
    .rcc_tim6_arcg_clk_en      ( rcc_tim6_arcg_clk_en       ),
    .rcc_c1_tim6_en            ( rcc_c1_tim6_en             ),
    .rcc_c2_tim6_en            ( rcc_c2_tim6_en             ),
    .rcc_c1_tim6_lpen          ( rcc_c1_tim6_lpen           ),
    .rcc_c2_tim6_lpen          ( rcc_c2_tim6_lpen           ),
    .rcc_tim5_arcg_clk_en      ( rcc_tim5_arcg_clk_en       ),
    .rcc_c1_tim5_en            ( rcc_c1_tim5_en             ),
    .rcc_c2_tim5_en            ( rcc_c2_tim5_en             ),
    .rcc_c1_tim5_lpen          ( rcc_c1_tim5_lpen           ),
    .rcc_c2_tim5_lpen          ( rcc_c2_tim5_lpen           ),
    .rcc_tim4_arcg_clk_en      ( rcc_tim4_arcg_clk_en       ),
    .rcc_c1_tim4_en            ( rcc_c1_tim4_en             ),
    .rcc_c2_tim4_en            ( rcc_c2_tim4_en             ),
    .rcc_c1_tim4_lpen          ( rcc_c1_tim4_lpen           ),
    .rcc_c2_tim4_lpen          ( rcc_c2_tim4_lpen           ),
    .rcc_tim3_arcg_clk_en      ( rcc_tim3_arcg_clk_en       ),
    .rcc_c1_tim3_en            ( rcc_c1_tim3_en             ),
    .rcc_c2_tim3_en            ( rcc_c2_tim3_en             ),
    .rcc_c1_tim3_lpen          ( rcc_c1_tim3_lpen           ),
    .rcc_c2_tim3_lpen          ( rcc_c2_tim3_lpen           ),
    .rcc_tim2_arcg_clk_en      ( rcc_tim2_arcg_clk_en       ),
    .rcc_c1_tim2_en            ( rcc_c1_tim2_en             ),
    .rcc_c2_tim2_en            ( rcc_c2_tim2_en             ),
    .rcc_c1_tim2_lpen          ( rcc_c1_tim2_lpen           ),
    .rcc_c2_tim2_lpen          ( rcc_c2_tim2_lpen           ),
    .rcc_fdcan_arcg_clk_en     ( rcc_fdcan_arcg_clk_en      ),
    .rcc_c1_fdcan_en           ( rcc_c1_fdcan_en            ),
    .rcc_c2_fdcan_en           ( rcc_c2_fdcan_en            ),
    .rcc_c1_fdcan_lpen         ( rcc_c1_fdcan_lpen          ),
    .rcc_c2_fdcan_lpen         ( rcc_c2_fdcan_lpen          ),
    .rcc_mdios_arcg_clk_en     ( rcc_mdios_arcg_clk_en      ),
    .rcc_c1_mdios_en           ( rcc_c1_mdios_en            ),
    .rcc_c2_mdios_en           ( rcc_c2_mdios_en            ),
    .rcc_c1_mdios_lpen         ( rcc_c1_mdios_lpen          ),
    .rcc_c2_mdios_lpen         ( rcc_c2_mdios_lpen          ),
    .rcc_opamp_arcg_clk_en     ( rcc_opamp_arcg_clk_en      ),
    .rcc_c1_opamp_en           ( rcc_c1_opamp_en            ),
    .rcc_c2_opamp_en           ( rcc_c2_opamp_en            ),
    .rcc_c1_opamp_lpen         ( rcc_c1_opamp_lpen          ),
    .rcc_c2_opamp_lpen         ( rcc_c2_opamp_lpen          ),
    .rcc_swpmi_arcg_clk_en     ( rcc_swpmi_arcg_clk_en      ),
    .rcc_c1_swpmi_en           ( rcc_c1_swpmi_en            ),
    .rcc_c2_swpmi_en           ( rcc_c2_swpmi_en            ),
    .rcc_c1_swpmi_lpen         ( rcc_c1_swpmi_lpen          ),
    .rcc_c2_swpmi_lpen         ( rcc_c2_swpmi_lpen          ),
    .rcc_crs_arcg_clk_en       ( rcc_crs_arcg_clk_en        ),
    .rcc_c1_crs_en             ( rcc_c1_crs_en              ),
    .rcc_c2_crs_en             ( rcc_c2_crs_en              ),
    .rcc_c1_crs_lpen           ( rcc_c1_crs_lpen            ),
    .rcc_c2_crs_lpen           ( rcc_c2_crs_lpen            ),
    .rcc_hrtim_arcg_clk_en     ( rcc_hrtim_arcg_clk_en      ),
    .rcc_c1_hrtim_en           ( rcc_c1_hrtim_en            ),
    .rcc_c2_hrtim_en           ( rcc_c2_hrtim_en            ),
    .rcc_c1_hrtim_lpen         ( rcc_c1_hrtim_lpen          ),
    .rcc_c2_hrtim_lpen         ( rcc_c2_hrtim_lpen          ),
    .rcc_dfsdm1_arcg_clk_en    ( rcc_dfsdm1_arcg_clk_en     ),
    .rcc_c1_dfsdm1_en          ( rcc_c1_dfsdm1_en           ),
    .rcc_c2_dfsdm1_en          ( rcc_c2_dfsdm1_en           ),
    .rcc_c1_dfsdm1_lpen        ( rcc_c1_dfsdm1_lpen         ),
    .rcc_c2_dfsdm1_lpen        ( rcc_c2_dfsdm1_lpen         ),
    .rcc_sai3_arcg_clk_en      ( rcc_sai3_arcg_clk_en       ),
    .rcc_c1_sai3_en            ( rcc_c1_sai3_en             ),
    .rcc_c2_sai3_en            ( rcc_c2_sai3_en             ),
    .rcc_c1_sai3_lpen          ( rcc_c1_sai3_lpen           ),
    .rcc_c2_sai3_lpen          ( rcc_c2_sai3_lpen           ),
    .rcc_sai2_arcg_clk_en      ( rcc_sai2_arcg_clk_en       ),
    .rcc_c1_sai2_en            ( rcc_c1_sai2_en             ),
    .rcc_c2_sai2_en            ( rcc_c2_sai2_en             ),
    .rcc_c1_sai2_lpen          ( rcc_c1_sai2_lpen           ),
    .rcc_c2_sai2_lpen          ( rcc_c2_sai2_lpen           ),
    .rcc_sai1_arcg_clk_en      ( rcc_sai1_arcg_clk_en       ),
    .rcc_c1_sai1_en            ( rcc_c1_sai1_en             ),
    .rcc_c2_sai1_en            ( rcc_c2_sai1_en             ),
    .rcc_c1_sai1_lpen          ( rcc_c1_sai1_lpen           ),
    .rcc_c2_sai1_lpen          ( rcc_c2_sai1_lpen           ),
    .rcc_spi5_arcg_clk_en      ( rcc_spi5_arcg_clk_en       ),
    .rcc_c1_spi5_en            ( rcc_c1_spi5_en             ),
    .rcc_c2_spi5_en            ( rcc_c2_spi5_en             ),
    .rcc_c1_spi5_lpen          ( rcc_c1_spi5_lpen           ),
    .rcc_c2_spi5_lpen          ( rcc_c2_spi5_lpen           ),
    .rcc_tim17_arcg_clk_en     ( rcc_tim17_arcg_clk_en      ),
    .rcc_c1_tim17_en           ( rcc_c1_tim17_en            ),
    .rcc_c2_tim17_en           ( rcc_c2_tim17_en            ),
    .rcc_c1_tim17_lpen         ( rcc_c1_tim17_lpen          ),
    .rcc_c2_tim17_lpen         ( rcc_c2_tim17_lpen          ),
    .rcc_tim16_arcg_clk_en     ( rcc_tim16_arcg_clk_en      ),
    .rcc_c1_tim16_en           ( rcc_c1_tim16_en            ),
    .rcc_c2_tim16_en           ( rcc_c2_tim16_en            ),
    .rcc_c1_tim16_lpen         ( rcc_c1_tim16_lpen          ),
    .rcc_c2_tim16_lpen         ( rcc_c2_tim16_lpen          ),
    .rcc_tim15_arcg_clk_en     ( rcc_tim15_arcg_clk_en      ),
    .rcc_c1_tim15_en           ( rcc_c1_tim15_en            ),
    .rcc_c2_tim15_en           ( rcc_c2_tim15_en            ),
    .rcc_c1_tim15_lpen         ( rcc_c1_tim15_lpen          ),
    .rcc_c2_tim15_lpen         ( rcc_c2_tim15_lpen          ),
    .rcc_spi4_arcg_clk_en      ( rcc_spi4_arcg_clk_en       ),
    .rcc_c1_spi4_en            ( rcc_c1_spi4_en             ),
    .rcc_c2_spi4_en            ( rcc_c2_spi4_en             ),
    .rcc_c1_spi4_lpen          ( rcc_c1_spi4_lpen           ),
    .rcc_c2_spi4_lpen          ( rcc_c2_spi4_lpen           ),
    .rcc_spi1_arcg_clk_en      ( rcc_spi1_arcg_clk_en       ),
    .rcc_c1_spi1_en            ( rcc_c1_spi1_en             ),
    .rcc_c2_spi1_en            ( rcc_c2_spi1_en             ),
    .rcc_c1_spi1_lpen          ( rcc_c1_spi1_lpen           ),
    .rcc_c2_spi1_lpen          ( rcc_c2_spi1_lpen           ),
    .rcc_usart6_arcg_clk_en    ( rcc_usart6_arcg_clk_en     ),
    .rcc_c1_usart6_en          ( rcc_c1_usart6_en           ),
    .rcc_c2_usart6_en          ( rcc_c2_usart6_en           ),
    .rcc_c1_usart6_lpen        ( rcc_c1_usart6_lpen         ),
    .rcc_c2_usart6_lpen        ( rcc_c2_usart6_lpen         ),
    .usart6_ker_clk_req        ( usart6_ker_clk_req         ),
    .rcc_usart1_arcg_clk_en    ( rcc_usart1_arcg_clk_en     ),
    .rcc_c1_usart1_en          ( rcc_c1_usart1_en           ),
    .rcc_c2_usart1_en          ( rcc_c2_usart1_en           ),
    .rcc_c1_usart1_lpen        ( rcc_c1_usart1_lpen         ),
    .rcc_c2_usart1_lpen        ( rcc_c2_usart1_lpen         ),
    .usart1_ker_clk_req        ( usart1_ker_clk_req         ),
    .rcc_tim8_arcg_clk_en      ( rcc_tim8_arcg_clk_en       ),
    .rcc_c1_tim8_en            ( rcc_c1_tim8_en             ),
    .rcc_c2_tim8_en            ( rcc_c2_tim8_en             ),
    .rcc_c1_tim8_lpen          ( rcc_c1_tim8_lpen           ),
    .rcc_c2_tim8_lpen          ( rcc_c2_tim8_lpen           ),
    .rcc_tim1_arcg_clk_en      ( rcc_tim1_arcg_clk_en       ),
    .rcc_c1_tim1_en            ( rcc_c1_tim1_en             ),
    .rcc_c2_tim1_en            ( rcc_c2_tim1_en             ),
    .rcc_c1_tim1_lpen          ( rcc_c1_tim1_lpen           ),
    .rcc_c2_tim1_lpen          ( rcc_c2_tim1_lpen           ),
    .rcc_sram4_arcg_clk_en     ( rcc_sram4_arcg_clk_en      ),
    .rcc_c1_sram4_lpen         ( rcc_c1_sram4_lpen          ),
    .rcc_c2_sram4_lpen         ( rcc_c2_sram4_lpen          ),
    .rcc_sram4_amen            ( rcc_sram4_amen             ),
    .rcc_bkpram_arcg_clk_en    ( rcc_bkpram_arcg_clk_en     ),
    .rcc_c1_bkpram_en          ( rcc_c1_bkpram_en           ),
    .rcc_c2_bkpram_en          ( rcc_c2_bkpram_en           ),
    .rcc_c1_bkpram_lpen        ( rcc_c1_bkpram_lpen         ),
    .rcc_c2_bkpram_lpen        ( rcc_c2_bkpram_lpen         ),
    .rcc_bkpram_amen           ( rcc_bkpram_amen            ),
    .rcc_ramecc3_arcg_clk_en   ( rcc_ramecc3_arcg_clk_en    ),
    .rcc_hsem_arcg_clk_en      ( rcc_hsem_arcg_clk_en       ),
    .rcc_c1_hsem_en            ( rcc_c1_hsem_en             ),
    .rcc_c2_hsem_en            ( rcc_c2_hsem_en             ),
    .rcc_adc3_arcg_clk_en      ( rcc_adc3_arcg_clk_en       ),
    .rcc_c1_adc3_en            ( rcc_c1_adc3_en             ),
    .rcc_c2_adc3_en            ( rcc_c2_adc3_en             ),
    .rcc_c1_adc3_lpen          ( rcc_c1_adc3_lpen           ),
    .rcc_c2_adc3_lpen          ( rcc_c2_adc3_lpen           ),
    .rcc_adc3_amen             ( rcc_adc3_amen              ),
    .rcc_bdma_arcg_clk_en      ( rcc_bdma_arcg_clk_en       ),
    .rcc_c1_bdma_en            ( rcc_c1_bdma_en             ),
    .rcc_c2_bdma_en            ( rcc_c2_bdma_en             ),
    .rcc_c1_bdma_lpen          ( rcc_c1_bdma_lpen           ),
    .rcc_c2_bdma_lpen          ( rcc_c2_bdma_lpen           ),
    .rcc_bdma_amen             ( rcc_bdma_amen              ),
    .rcc_crc_arcg_clk_en       ( rcc_crc_arcg_clk_en        ),
    .rcc_c1_crc_en             ( rcc_c1_crc_en              ),
    .rcc_c2_crc_en             ( rcc_c2_crc_en              ),
    .rcc_c1_crc_lpen           ( rcc_c1_crc_lpen            ),
    .rcc_c2_crc_lpen           ( rcc_c2_crc_lpen            ),
    .rcc_crc_amen              ( rcc_crc_amen               ),
    .rcc_gpiok_arcg_clk_en     ( rcc_gpiok_arcg_clk_en      ),
    .rcc_c1_gpiok_en           ( rcc_c1_gpiok_en            ),
    .rcc_c2_gpiok_en           ( rcc_c2_gpiok_en            ),
    .rcc_c1_gpiok_lpen         ( rcc_c1_gpiok_lpen          ),
    .rcc_c2_gpiok_lpen         ( rcc_c2_gpiok_lpen          ),
    .rcc_gpiok_amen            ( rcc_gpiok_amen             ),
    .rcc_gpioj_arcg_clk_en     ( rcc_gpioj_arcg_clk_en      ),
    .rcc_c1_gpioj_en           ( rcc_c1_gpioj_en            ),
    .rcc_c2_gpioj_en           ( rcc_c2_gpioj_en            ),
    .rcc_c1_gpioj_lpen         ( rcc_c1_gpioj_lpen          ),
    .rcc_c2_gpioj_lpen         ( rcc_c2_gpioj_lpen          ),
    .rcc_gpioj_amen            ( rcc_gpioj_amen             ),
    .rcc_gpioi_arcg_clk_en     ( rcc_gpioi_arcg_clk_en      ),
    .rcc_c1_gpioi_en           ( rcc_c1_gpioi_en            ),
    .rcc_c2_gpioi_en           ( rcc_c2_gpioi_en            ),
    .rcc_c1_gpioi_lpen         ( rcc_c1_gpioi_lpen          ),
    .rcc_c2_gpioi_lpen         ( rcc_c2_gpioi_lpen          ),
    .rcc_gpioi_amen            ( rcc_gpioi_amen             ),
    .rcc_gpioh_arcg_clk_en     ( rcc_gpioh_arcg_clk_en      ),
    .rcc_c1_gpioh_en           ( rcc_c1_gpioh_en            ),
    .rcc_c2_gpioh_en           ( rcc_c2_gpioh_en            ),
    .rcc_c1_gpioh_lpen         ( rcc_c1_gpioh_lpen          ),
    .rcc_c2_gpioh_lpen         ( rcc_c2_gpioh_lpen          ),
    .rcc_gpioh_amen            ( rcc_gpioh_amen             ),
    .rcc_gpiog_arcg_clk_en     ( rcc_gpiog_arcg_clk_en      ),
    .rcc_c1_gpiog_en           ( rcc_c1_gpiog_en            ),
    .rcc_c2_gpiog_en           ( rcc_c2_gpiog_en            ),
    .rcc_c1_gpiog_lpen         ( rcc_c1_gpiog_lpen          ),
    .rcc_c2_gpiog_lpen         ( rcc_c2_gpiog_lpen          ),
    .rcc_gpiog_amen            ( rcc_gpiog_amen             ),
    .rcc_gpiof_arcg_clk_en     ( rcc_gpiof_arcg_clk_en      ),
    .rcc_c1_gpiof_en           ( rcc_c1_gpiof_en            ),
    .rcc_c2_gpiof_en           ( rcc_c2_gpiof_en            ),
    .rcc_c1_gpiof_lpen         ( rcc_c1_gpiof_lpen          ),
    .rcc_c2_gpiof_lpen         ( rcc_c2_gpiof_lpen          ),
    .rcc_gpiof_amen            ( rcc_gpiof_amen             ),
    .rcc_gpioe_arcg_clk_en     ( rcc_gpioe_arcg_clk_en      ),
    .rcc_c1_gpioe_en           ( rcc_c1_gpioe_en            ),
    .rcc_c2_gpioe_en           ( rcc_c2_gpioe_en            ),
    .rcc_c1_gpioe_lpen         ( rcc_c1_gpioe_lpen          ),
    .rcc_c2_gpioe_lpen         ( rcc_c2_gpioe_lpen          ),
    .rcc_gpioe_amen            ( rcc_gpioe_amen             ),
    .rcc_gpiod_arcg_clk_en     ( rcc_gpiod_arcg_clk_en      ),
    .rcc_c1_gpiod_en           ( rcc_c1_gpiod_en            ),
    .rcc_c2_gpiod_en           ( rcc_c2_gpiod_en            ),
    .rcc_c1_gpiod_lpen         ( rcc_c1_gpiod_lpen          ),
    .rcc_c2_gpiod_lpen         ( rcc_c2_gpiod_lpen          ),
    .rcc_gpiod_amen            ( rcc_gpiod_amen             ),
    .rcc_gpioc_arcg_clk_en     ( rcc_gpioc_arcg_clk_en      ),
    .rcc_c1_gpioc_en           ( rcc_c1_gpioc_en            ),
    .rcc_c2_gpioc_en           ( rcc_c2_gpioc_en            ),
    .rcc_c1_gpioc_lpen         ( rcc_c1_gpioc_lpen          ),
    .rcc_c2_gpioc_lpen         ( rcc_c2_gpioc_lpen          ),
    .rcc_gpioc_amen            ( rcc_gpioc_amen             ),
    .rcc_gpiob_arcg_clk_en     ( rcc_gpiob_arcg_clk_en      ),
    .rcc_c1_gpiob_en           ( rcc_c1_gpiob_en            ),
    .rcc_c2_gpiob_en           ( rcc_c2_gpiob_en            ),
    .rcc_c1_gpiob_lpen         ( rcc_c1_gpiob_lpen          ),
    .rcc_c2_gpiob_lpen         ( rcc_c2_gpiob_lpen          ),
    .rcc_gpiob_amen            ( rcc_gpiob_amen             ),
    .rcc_gpioa_arcg_clk_en     ( rcc_gpioa_arcg_clk_en      ),
    .rcc_c1_gpioa_en           ( rcc_c1_gpioa_en            ),
    .rcc_c2_gpioa_en           ( rcc_c2_gpioa_en            ),
    .rcc_c1_gpioa_lpen         ( rcc_c1_gpioa_lpen          ),
    .rcc_c2_gpioa_lpen         ( rcc_c2_gpioa_lpen          ),
    .rcc_gpioa_amen            ( rcc_gpioa_amen             ),
    .rcc_rcc_arcg_clk_en       ( rcc_rcc_arcg_clk_en        ),
    .rcc_pwr_arcg_clk_en       ( rcc_pwr_arcg_clk_en        ),
    .rcc_sai4_arcg_clk_en      ( rcc_sai4_arcg_clk_en       ),
    .rcc_c1_sai4_en            ( rcc_c1_sai4_en             ),
    .rcc_c2_sai4_en            ( rcc_c2_sai4_en             ),
    .rcc_c1_sai4_lpen          ( rcc_c1_sai4_lpen           ),
    .rcc_c2_sai4_lpen          ( rcc_c2_sai4_lpen           ),
    .rcc_sai4_amen             ( rcc_sai4_amen              ),
    .rcc_rtc_arcg_clk_en       ( rcc_rtc_arcg_clk_en        ),
    .rcc_c1_rtc_en             ( rcc_c1_rtc_en              ),
    .rcc_c2_rtc_en             ( rcc_c2_rtc_en              ),
    .rcc_c1_rtc_lpen           ( rcc_c1_rtc_lpen            ),
    .rcc_c2_rtc_lpen           ( rcc_c2_rtc_lpen            ),
    .rcc_rtc_amen              ( rcc_rtc_amen               ),
    .rcc_vref_arcg_clk_en      ( rcc_vref_arcg_clk_en       ),
    .rcc_c1_vref_en            ( rcc_c1_vref_en             ),
    .rcc_c2_vref_en            ( rcc_c2_vref_en             ),
    .rcc_c1_vref_lpen          ( rcc_c1_vref_lpen           ),
    .rcc_c2_vref_lpen          ( rcc_c2_vref_lpen           ),
    .rcc_vref_amen             ( rcc_vref_amen              ),
    .rcc_comp12_arcg_clk_en    ( rcc_comp12_arcg_clk_en     ),
    .rcc_c1_comp12_en          ( rcc_c1_comp12_en           ),
    .rcc_c2_comp12_en          ( rcc_c2_comp12_en           ),
    .rcc_c1_comp12_lpen        ( rcc_c1_comp12_lpen         ),
    .rcc_c2_comp12_lpen        ( rcc_c2_comp12_lpen         ),
    .rcc_comp12_amen           ( rcc_comp12_amen            ),
    .rcc_lptim5_arcg_clk_en    ( rcc_lptim5_arcg_clk_en     ),
    .rcc_c1_lptim5_en          ( rcc_c1_lptim5_en           ),
    .rcc_c2_lptim5_en          ( rcc_c2_lptim5_en           ),
    .rcc_c1_lptim5_lpen        ( rcc_c1_lptim5_lpen         ),
    .rcc_c2_lptim5_lpen        ( rcc_c2_lptim5_lpen         ),
    .rcc_lptim5_amen           ( rcc_lptim5_amen            ),
    .rcc_lptim4_arcg_clk_en    ( rcc_lptim4_arcg_clk_en     ),
    .rcc_c1_lptim4_en          ( rcc_c1_lptim4_en           ),
    .rcc_c2_lptim4_en          ( rcc_c2_lptim4_en           ),
    .rcc_c1_lptim4_lpen        ( rcc_c1_lptim4_lpen         ),
    .rcc_c2_lptim4_lpen        ( rcc_c2_lptim4_lpen         ),
    .rcc_lptim4_amen           ( rcc_lptim4_amen            ),
    .rcc_lptim3_arcg_clk_en    ( rcc_lptim3_arcg_clk_en     ),
    .rcc_c1_lptim3_en          ( rcc_c1_lptim3_en           ),
    .rcc_c2_lptim3_en          ( rcc_c2_lptim3_en           ),
    .rcc_c1_lptim3_lpen        ( rcc_c1_lptim3_lpen         ),
    .rcc_c2_lptim3_lpen        ( rcc_c2_lptim3_lpen         ),
    .rcc_lptim3_amen           ( rcc_lptim3_amen            ),
    .rcc_lptim2_arcg_clk_en    ( rcc_lptim2_arcg_clk_en     ),
    .rcc_c1_lptim2_en          ( rcc_c1_lptim2_en           ),
    .rcc_c2_lptim2_en          ( rcc_c2_lptim2_en           ),
    .rcc_c1_lptim2_lpen        ( rcc_c1_lptim2_lpen         ),
    .rcc_c2_lptim2_lpen        ( rcc_c2_lptim2_lpen         ),
    .rcc_lptim2_amen           ( rcc_lptim2_amen            ),
    .rcc_i2c4_arcg_clk_en      ( rcc_i2c4_arcg_clk_en       ),
    .rcc_c1_i2c4_en            ( rcc_c1_i2c4_en             ),
    .rcc_c2_i2c4_en            ( rcc_c2_i2c4_en             ),
    .rcc_c1_i2c4_lpen          ( rcc_c1_i2c4_lpen           ),
    .rcc_c2_i2c4_lpen          ( rcc_c2_i2c4_lpen           ),
    .rcc_i2c4_amen             ( rcc_i2c4_amen              ),
    .i2c4_ker_clk_req          ( i2c4_ker_clk_req           ),
    .rcc_spi6_arcg_clk_en      ( rcc_spi6_arcg_clk_en       ),
    .rcc_c1_spi6_en            ( rcc_c1_spi6_en             ),
    .rcc_c2_spi6_en            ( rcc_c2_spi6_en             ),
    .rcc_c1_spi6_lpen          ( rcc_c1_spi6_lpen           ),
    .rcc_c2_spi6_lpen          ( rcc_c2_spi6_lpen           ),
    .rcc_spi6_amen             ( rcc_spi6_amen              ),
    .rcc_lpuart1_arcg_clk_en   ( rcc_lpuart1_arcg_clk_en    ),
    .rcc_c1_lpuart1_en         ( rcc_c1_lpuart1_en          ),
    .rcc_c2_lpuart1_en         ( rcc_c2_lpuart1_en          ),
    .rcc_c1_lpuart1_lpen       ( rcc_c1_lpuart1_lpen        ),
    .rcc_c2_lpuart1_lpen       ( rcc_c2_lpuart1_lpen        ),
    .rcc_lpuart1_amen          ( rcc_lpuart1_amen           ),
    .lpuart1_ker_clk_req       ( lpuart1_ker_clk_req        ),
    .rcc_syscfg_arcg_clk_en    ( rcc_syscfg_arcg_clk_en     ),
    .rcc_c1_syscfg_en          ( rcc_c1_syscfg_en           ),
    .rcc_c2_syscfg_en          ( rcc_c2_syscfg_en           ),
    .rcc_c1_syscfg_lpen        ( rcc_c1_syscfg_lpen         ),
    .rcc_c2_syscfg_lpen        ( rcc_c2_syscfg_lpen         ),
    .rcc_syscfg_amen           ( rcc_syscfg_amen            ),
    .rcc_iwdg2_arcg_clk_en     ( rcc_iwdg2_arcg_clk_en      ),
    .rcc_iwdg1_arcg_clk_en     ( rcc_iwdg1_arcg_clk_en      ),
    .rcc_exti_arcg_clk_en      ( rcc_exti_arcg_clk_en       ),
    .qspisel                   ( qspisel                    ),
    .fmcsel                    ( fmcsel                     ),
    .sdmmcsel                  ( sdmmcsel                   ),
    .usbsel                    ( usbsel                     ),
    .adcsel                    ( adcsel                     ),
    .rngsel                    ( rngsel                     ),
    .cecsel                    ( cecsel                     ),
    .i2c123sel                 ( i2c123sel                  ),
    .usart234578sel            ( usart234578sel             ),
    .spdifsel                  ( spdifsel                   ),
    .lptim1sel                 ( lptim1sel                  ),
    .fdcansel                  ( fdcansel                   ),
    .swpsel                    ( swpsel                     ),
    .sai1sel                   ( sai1sel                    ),
    .dfsdm1sel                 ( dfsdm1sel                  ),
    .sai23sel                  ( sai23sel                   ),
    .spi45sel                  ( spi45sel                   ),
    .spi123sel                 ( spi123sel                  ),
    .usart16sel                ( usart16sel                 ),
    .sai4asel                  ( sai4asel                   ),
    .sai4bsel                  ( sai4bsel                   ),
    .lptim345sel               ( lptim345sel                ),
    .lptim2sel                 ( lptim2sel                  ),
    .i2c4sel                   ( i2c4sel                    ),
    .spi6sel                   ( spi6sel                    ),
    .lpuart1sel                ( lpuart1sel                 ),

    .c2_per_alloc_d1           ( c2_per_alloc_d1            ),
    .c1_per_alloc_d2           ( c1_per_alloc_d2            ),
    .hsi_ker_clk_req           ( hsi_ker_clk_req            ),
    .csi_ker_clk_req           ( csi_ker_clk_req            ),
    .rcc_flash_aclk            ( rcc_flash_aclk             ),
    .rcc_flash_hclk            ( rcc_flash_hclk             ),
    .rcc_qspi_aclk             ( rcc_qspi_aclk              ),
    .rcc_qspi_hclk             ( rcc_qspi_hclk              ),
    .rcc_qspi_ker_clk          ( rcc_qspi_ker_clk           ),
    .rcc_axisram_aclk          ( rcc_axisram_aclk           ),
    .rcc_fmc_aclk              ( rcc_fmc_aclk               ),
    .rcc_fmc_hclk              ( rcc_fmc_hclk               ),
    .rcc_fmc_ker_clk           ( rcc_fmc_ker_clk            ),
    .rcc_dma2d_aclk            ( rcc_dma2d_aclk             ),
    .rcc_dma2d_hclk            ( rcc_dma2d_hclk             ),
    .rcc_mdma_aclk             ( rcc_mdma_aclk              ),
    .rcc_mdma_hclk             ( rcc_mdma_hclk              ),
    .rcc_ltdc_aclk             ( rcc_ltdc_aclk              ),
    .rcc_ltdc_pclk             ( rcc_ltdc_pclk              ),
    .rcc_ltdc_ker_clk          ( rcc_ltdc_ker_clk           ),
    .rcc_ramecc1_hclk          ( rcc_ramecc1_hclk           ),
    .rcc_gpv_hclk              ( rcc_gpv_hclk               ),
    .rcc_itcm_hclk             ( rcc_itcm_hclk              ),
    .rcc_dtcm2_hclk            ( rcc_dtcm2_hclk             ),
    .rcc_dtcm1_hclk            ( rcc_dtcm1_hclk             ),
    .rcc_jpgdec_hclk           ( rcc_jpgdec_hclk            ),
    .rcc_sdmmc1_hclk           ( rcc_sdmmc1_hclk            ),
    .rcc_sdmmc1_ker_clk        ( rcc_sdmmc1_ker_clk         ),
    .rcc_wwdg1_pclk            ( rcc_wwdg1_pclk             ),
    .rcc_usb2ulpi_hclk         ( rcc_usb2ulpi_hclk          ),
    .rcc_usb2otg_hclk          ( rcc_usb2otg_hclk           ),
    .rcc_usb2otg_ker_clk       ( rcc_usb2otg_ker_clk        ),
    .rcc_usb1ulpi_hclk         ( rcc_usb1ulpi_hclk          ),
    .rcc_usb1ulpi_ker_clk      ( rcc_usb1ulpi_ker_clk       ),
    .rcc_usb1otg_hclk          ( rcc_usb1otg_hclk           ),
    .rcc_usb1otg_ker_clk       ( rcc_usb1otg_ker_clk        ),
    .rcc_eth1rx_hclk           ( rcc_eth1rx_hclk            ),
    .rcc_eth1tx_hclk           ( rcc_eth1tx_hclk            ),
    .rcc_eth1mac_hclk          ( rcc_eth1mac_hclk           ),
    .rcc_adc12_hclk            ( rcc_adc12_hclk             ),
    .rcc_adc12_ker_clk         ( rcc_adc12_ker_clk          ),
    .rcc_dma2_hclk             ( rcc_dma2_hclk              ),
    .rcc_dma1_hclk             ( rcc_dma1_hclk              ),
    .rcc_sram3_hclk            ( rcc_sram3_hclk             ),
    .rcc_sram2_hclk            ( rcc_sram2_hclk             ),
    .rcc_sram1_hclk            ( rcc_sram1_hclk             ),
    .rcc_sdmmc2_hclk           ( rcc_sdmmc2_hclk            ),
    .rcc_sdmmc2_ker_clk        ( rcc_sdmmc2_ker_clk         ),
    .rcc_rng_hclk              ( rcc_rng_hclk               ),
    .rcc_rng_ker_clk           ( rcc_rng_ker_clk            ),
    .rcc_hash_hclk             ( rcc_hash_hclk              ),
    .rcc_crypt_hclk            ( rcc_crypt_hclk             ),
    .rcc_dcmi_hclk             ( rcc_dcmi_hclk              ),
    .rcc_ramecc2_hclk          ( rcc_ramecc2_hclk           ),
    .rcc_uart8_pclk            ( rcc_uart8_pclk             ),
    .rcc_uart8_ker_clk         ( rcc_uart8_ker_clk          ),
    .rcc_uart7_pclk            ( rcc_uart7_pclk             ),
    .rcc_uart7_ker_clk         ( rcc_uart7_ker_clk          ),
    .rcc_dac12_pclk            ( rcc_dac12_pclk             ),
    .rcc_hdmicec_pclk          ( rcc_hdmicec_pclk           ),
    .rcc_hdmicec_ker_clk       ( rcc_hdmicec_ker_clk        ),
    .rcc_i2c3_pclk             ( rcc_i2c3_pclk              ),
    .rcc_i2c3_ker_clk          ( rcc_i2c3_ker_clk           ),
    .rcc_i2c2_pclk             ( rcc_i2c2_pclk              ),
    .rcc_i2c2_ker_clk          ( rcc_i2c2_ker_clk           ),
    .rcc_i2c1_pclk             ( rcc_i2c1_pclk              ),
    .rcc_i2c1_ker_clk          ( rcc_i2c1_ker_clk           ),
    .rcc_uart5_pclk            ( rcc_uart5_pclk             ),
    .rcc_uart5_ker_clk         ( rcc_uart5_ker_clk          ),
    .rcc_uart4_pclk            ( rcc_uart4_pclk             ),
    .rcc_uart4_ker_clk         ( rcc_uart4_ker_clk          ),
    .rcc_usart3_pclk           ( rcc_usart3_pclk            ),
    .rcc_usart3_ker_clk        ( rcc_usart3_ker_clk         ),
    .rcc_usart2_pclk           ( rcc_usart2_pclk            ),
    .rcc_usart2_ker_clk        ( rcc_usart2_ker_clk         ),
    .rcc_spdifrx_pclk          ( rcc_spdifrx_pclk           ),
    .rcc_spdifrx_ker_clk       ( rcc_spdifrx_ker_clk        ),
    .rcc_spi3_pclk             ( rcc_spi3_pclk              ),
    .rcc_spi3_ker_clk          ( rcc_spi3_ker_clk           ),
    .rcc_spi2_pclk             ( rcc_spi2_pclk              ),
    .rcc_spi2_ker_clk          ( rcc_spi2_ker_clk           ),
    .rcc_wwdg2_pclk            ( rcc_wwdg2_pclk             ),
    .rcc_lptim1_pclk           ( rcc_lptim1_pclk            ),
    .rcc_lptim1_ker_clk        ( rcc_lptim1_ker_clk         ),
    .rcc_tim14_pclk            ( rcc_tim14_pclk             ),
    .rcc_tim14_ker_clk         ( rcc_tim14_ker_clk          ),
    .rcc_tim13_pclk            ( rcc_tim13_pclk             ),
    .rcc_tim13_ker_clk         ( rcc_tim13_ker_clk          ),
    .rcc_tim12_pclk            ( rcc_tim12_pclk             ),
    .rcc_tim12_ker_clk         ( rcc_tim12_ker_clk          ),
    .rcc_tim7_pclk             ( rcc_tim7_pclk              ),
    .rcc_tim7_ker_clk          ( rcc_tim7_ker_clk           ),
    .rcc_tim6_pclk             ( rcc_tim6_pclk              ),
    .rcc_tim6_ker_clk          ( rcc_tim6_ker_clk           ),
    .rcc_tim5_pclk             ( rcc_tim5_pclk              ),
    .rcc_tim5_ker_clk          ( rcc_tim5_ker_clk           ),
    .rcc_tim4_pclk             ( rcc_tim4_pclk              ),
    .rcc_tim4_ker_clk          ( rcc_tim4_ker_clk           ),
    .rcc_tim3_pclk             ( rcc_tim3_pclk              ),
    .rcc_tim3_ker_clk          ( rcc_tim3_ker_clk           ),
    .rcc_tim2_pclk             ( rcc_tim2_pclk              ),
    .rcc_tim2_ker_clk          ( rcc_tim2_ker_clk           ),
    .rcc_fdcan_pclk            ( rcc_fdcan_pclk             ),
    .rcc_fdcan_ker_clk         ( rcc_fdcan_ker_clk          ),
    .rcc_mdios_pclk            ( rcc_mdios_pclk             ),
    .rcc_opamp_pclk            ( rcc_opamp_pclk             ),
    .rcc_swpmi_pclk            ( rcc_swpmi_pclk             ),
    .rcc_swpmi_ker_clk         ( rcc_swpmi_ker_clk          ),
    .rcc_crs_pclk              ( rcc_crs_pclk               ),
    .rcc_hrtim_pclk            ( rcc_hrtim_pclk             ),
    .rcc_hrtim_ker_clk         ( rcc_hrtim_ker_clk          ),
    .rcc_dfsdm1_pclk           ( rcc_dfsdm1_pclk            ),
    .rcc_dfsdm1_ker_clk_0      ( rcc_dfsdm1_ker_clk_0       ),
    .rcc_dfsdm1_ker_clk_1      ( rcc_dfsdm1_ker_clk_1       ),
    .rcc_sai3_pclk             ( rcc_sai3_pclk              ),
    .rcc_sai3_ker_clk          ( rcc_sai3_ker_clk           ),
    .rcc_sai2_pclk             ( rcc_sai2_pclk              ),
    .rcc_sai2_ker_clk          ( rcc_sai2_ker_clk           ),
    .rcc_sai1_pclk             ( rcc_sai1_pclk              ),
    .rcc_sai1_ker_clk          ( rcc_sai1_ker_clk           ),
    .rcc_spi5_pclk             ( rcc_spi5_pclk              ),
    .rcc_spi5_ker_clk          ( rcc_spi5_ker_clk           ),
    .rcc_tim17_pclk            ( rcc_tim17_pclk             ),
    .rcc_tim17_ker_clk         ( rcc_tim17_ker_clk          ),
    .rcc_tim16_pclk            ( rcc_tim16_pclk             ),
    .rcc_tim16_ker_clk         ( rcc_tim16_ker_clk          ),
    .rcc_tim15_pclk            ( rcc_tim15_pclk             ),
    .rcc_tim15_ker_clk         ( rcc_tim15_ker_clk          ),
    .rcc_spi4_pclk             ( rcc_spi4_pclk              ),
    .rcc_spi4_ker_clk          ( rcc_spi4_ker_clk           ),
    .rcc_spi1_pclk             ( rcc_spi1_pclk              ),
    .rcc_spi1_ker_clk          ( rcc_spi1_ker_clk           ),
    .rcc_usart6_pclk           ( rcc_usart6_pclk            ),
    .rcc_usart6_ker_clk        ( rcc_usart6_ker_clk         ),
    .rcc_usart1_pclk           ( rcc_usart1_pclk            ),
    .rcc_usart1_ker_clk        ( rcc_usart1_ker_clk         ),
    .rcc_tim8_pclk             ( rcc_tim8_pclk              ),
    .rcc_tim8_ker_clk          ( rcc_tim8_ker_clk           ),
    .rcc_tim1_pclk             ( rcc_tim1_pclk              ),
    .rcc_tim1_ker_clk          ( rcc_tim1_ker_clk           ),
    .rcc_sram4_hclk            ( rcc_sram4_hclk             ),
    .rcc_bkpram_hclk           ( rcc_bkpram_hclk            ),
    .rcc_ramecc3_hclk          ( rcc_ramecc3_hclk           ),
    .rcc_hsem_hclk             ( rcc_hsem_hclk              ),
    .rcc_adc3_hclk             ( rcc_adc3_hclk              ),
    .rcc_adc3_ker_clk          ( rcc_adc3_ker_clk           ),
    .rcc_bdma_hclk             ( rcc_bdma_hclk              ),
    .rcc_crc_hclk              ( rcc_crc_hclk               ),
    .rcc_gpiok_hclk            ( rcc_gpiok_hclk             ),
    .rcc_gpioj_hclk            ( rcc_gpioj_hclk             ),
    .rcc_gpioi_hclk            ( rcc_gpioi_hclk             ),
    .rcc_gpioh_hclk            ( rcc_gpioh_hclk             ),
    .rcc_gpiog_hclk            ( rcc_gpiog_hclk             ),
    .rcc_gpiof_hclk            ( rcc_gpiof_hclk             ),
    .rcc_gpioe_hclk            ( rcc_gpioe_hclk             ),
    .rcc_gpiod_hclk            ( rcc_gpiod_hclk             ),
    .rcc_gpioc_hclk            ( rcc_gpioc_hclk             ),
    .rcc_gpiob_hclk            ( rcc_gpiob_hclk             ),
    .rcc_gpioa_hclk            ( rcc_gpioa_hclk             ),
    .rcc_rcc_hclk              ( rcc_rcc_hclk               ),
    .rcc_pwr_hclk              ( rcc_pwr_hclk               ),
    .rcc_sai4_pclk             ( rcc_sai4_pclk              ),
    .rcc_sai4_ker_clk_0        ( rcc_sai4_ker_clk_0         ),
    .rcc_sai4_ker_clk_1        ( rcc_sai4_ker_clk_1         ),
    .rcc_rtc_pclk              ( rcc_rtc_pclk               ),
    .rcc_vref_pclk             ( rcc_vref_pclk              ),
    .rcc_comp12_pclk           ( rcc_comp12_pclk            ),
    .rcc_lptim5_pclk           ( rcc_lptim5_pclk            ),
    .rcc_lptim5_ker_clk        ( rcc_lptim5_ker_clk         ),
    .rcc_lptim4_pclk           ( rcc_lptim4_pclk            ),
    .rcc_lptim4_ker_clk        ( rcc_lptim4_ker_clk         ),
    .rcc_lptim3_pclk           ( rcc_lptim3_pclk            ),
    .rcc_lptim3_ker_clk        ( rcc_lptim3_ker_clk         ),
    .rcc_lptim2_pclk           ( rcc_lptim2_pclk            ),
    .rcc_lptim2_ker_clk        ( rcc_lptim2_ker_clk         ),
    .rcc_i2c4_pclk             ( rcc_i2c4_pclk              ),
    .rcc_i2c4_ker_clk          ( rcc_i2c4_ker_clk           ),
    .rcc_spi6_pclk             ( rcc_spi6_pclk              ),
    .rcc_spi6_ker_clk          ( rcc_spi6_ker_clk           ),
    .rcc_lpuart1_pclk          ( rcc_lpuart1_pclk           ),
    .rcc_lpuart1_ker_clk       ( rcc_lpuart1_ker_clk        ),
    .rcc_syscfg_pclk           ( rcc_syscfg_pclk            ),
    .rcc_iwdg2_pclk            ( rcc_iwdg2_pclk             ),
    .rcc_iwdg1_pclk            ( rcc_iwdg1_pclk             ),
    .rcc_exti_pclk             ( rcc_exti_pclk              )
);
