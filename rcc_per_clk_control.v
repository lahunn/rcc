module per_ker_clk_control (
// bus clocks
    input rcc_axibridge_d1_clk,
    input rcc_ahb3bridge_d1_clk,
    input rcc_apb3bridge_d1_clk,
    input rcc_ahb1bridge_d2_clk,
    input rcc_ahb2bridge_d2_clk,
    input rcc_apb1bridge_d2_clk,
    input rcc_apb2bridge_d2_clk,
    input rcc_ahb4bridge_d3_clk,
    input rcc_apb4bridge_d3_clk,
//rst signal
    input sys_rst_n,
// kernel clock sources
    input pll1_q_clk,
    input pll2_p_clk,
    input pll2_q_clk,
    input pll2_r_clk,
    input pll3_p_clk,
    input pll3_q_clk,
    input pll3_r_clk,
    input sys_clk,
    input hse_clk,
    input hsi_ker_clk,
    input csi_ker_clk,
    input hsi48_clk,
    input lse_clk,
    input lsi_clk,
    input per_clk,
    input I2S_clk_IN,
    input USB_PHY1,
// control signals
    input c1_sleep,
    input c1_deepsleep,
    input c2_sleep,
    input c2_deepsleep,
    input d3_deepsleep,
// flash control signals
    input rcc_c2_flash_en,
    input rcc_c1_flash_lpen,
    input rcc_c2_flash_lpen,
    output rcc_flash_aclk,
    output rcc_flash_hclk,
// qspi control signals
    input rcc_c1_qspi_en,
    input rcc_c2_qspi_en,
    input rcc_c1_qspi_lpen,
    input rcc_c2_qspi_lpen,
    output rcc_qspi_aclk,
    output rcc_qspi_hclk,
    output rcc_qspi_ker_clk,
// axisram control signals
    input rcc_c2_axisram_en,
    input rcc_c1_axisram_lpen,
    input rcc_c2_axisram_lpen,
    output rcc_axisram_aclk,
// fmc control signals
    input rcc_c1_fmc_en,
    input rcc_c2_fmc_en,
    input rcc_c1_fmc_lpen,
    input rcc_c2_fmc_lpen,
    output rcc_fmc_aclk,
    output rcc_fmc_hclk,
    output rcc_fmc_ker_clk,
// dma2d control signals
    input rcc_c1_dma2d_en,
    input rcc_c2_dma2d_en,
    input rcc_c1_dma2d_lpen,
    input rcc_c2_dma2d_lpen,
    output rcc_dma2d_aclk,
    output rcc_dma2d_hclk,
// mdma control signals
    input rcc_c1_mdma_en,
    input rcc_c2_mdma_en,
    input rcc_c1_mdma_lpen,
    input rcc_c2_mdma_lpen,
    output rcc_mdma_aclk,
    output rcc_mdma_hclk,
// ltdc control signals
    input rcc_c1_ltdc_en,
    input rcc_c2_ltdc_en,
    input rcc_c1_ltdc_lpen,
    input rcc_c2_ltdc_lpen,
    output rcc_ltdc_aclk,
    output rcc_ltdc_pclk,
    output rcc_ltdc_ker_clk,
// ramecc1 control signals
    output rcc_ramecc1_hclk,
// gpv control signals
    output rcc_gpv_hclk,
// itcm control signals
    input rcc_c2_itcm_en,
    input rcc_c1_itcm_lpen,
    input rcc_c2_itcm_lpen,
    output rcc_itcm_hclk,
// dtcm2 control signals
    input rcc_c2_dtcm2_en,
    input rcc_c1_dtcm2_lpen,
    input rcc_c2_dtcm2_lpen,
    output rcc_dtcm2_hclk,
// dtcm1 control signals
    input rcc_c2_dtcm1_en,
    input rcc_c1_dtcm1_lpen,
    input rcc_c2_dtcm1_lpen,
    output rcc_dtcm1_hclk,
// jpgdec control signals
    input rcc_c1_jpgdec_en,
    input rcc_c2_jpgdec_en,
    input rcc_c1_jpgdec_lpen,
    input rcc_c2_jpgdec_lpen,
    output rcc_jpgdec_hclk,
// sdmmc1 control signals
    input rcc_c1_sdmmc1_en,
    input rcc_c2_sdmmc1_en,
    input rcc_c1_sdmmc1_lpen,
    input rcc_c2_sdmmc1_lpen,
    output rcc_sdmmc1_hclk,
    output rcc_sdmmc1_ker_clk,
// wwdg1 control signals
    input rcc_c1_wwdg1_en,
    input rcc_c2_wwdg1_en,
    input rcc_c1_wwdg1_lpen,
    input rcc_c2_wwdg1_lpen,
    output rcc_wwdg1_pclk,
// usb2ulpi control signals
    input rcc_c1_usb2ulpi_en,
    input rcc_c2_usb2ulpi_en,
    input rcc_c1_usb2ulpi_lpen,
    input rcc_c2_usb2ulpi_lpen,
    output rcc_usb2ulpi_hclk,
// usb2otg control signals
    input rcc_c1_usb2otg_en,
    input rcc_c2_usb2otg_en,
    input rcc_c1_usb2otg_lpen,
    input rcc_c2_usb2otg_lpen,
    output rcc_usb2otg_hclk,
    output rcc_usb2otg_ker_clk,
// usb1ulpi control signals
    input rcc_c1_usb1ulpi_en,
    input rcc_c2_usb1ulpi_en,
    input rcc_c1_usb1ulpi_lpen,
    input rcc_c2_usb1ulpi_lpen,
    output rcc_usb1ulpi_hclk,
    output rcc_usb1ulpi_ker_clk,
// usb1otg control signals
    input rcc_c1_usb1otg_en,
    input rcc_c2_usb1otg_en,
    input rcc_c1_usb1otg_lpen,
    input rcc_c2_usb1otg_lpen,
    output rcc_usb1otg_hclk,
    output rcc_usb1otg_ker_clk,
// eth1rx control signals
    input rcc_c1_eth1rx_en,
    input rcc_c2_eth1rx_en,
    input rcc_c1_eth1rx_lpen,
    input rcc_c2_eth1rx_lpen,
    output rcc_eth1rx_hclk,
// eth1tx control signals
    input rcc_c1_eth1tx_en,
    input rcc_c2_eth1tx_en,
    input rcc_c1_eth1tx_lpen,
    input rcc_c2_eth1tx_lpen,
    output rcc_eth1tx_hclk,
// eth1mac control signals
    input rcc_c1_eth1mac_en,
    input rcc_c2_eth1mac_en,
    input rcc_c1_eth1mac_lpen,
    input rcc_c2_eth1mac_lpen,
    output rcc_eth1mac_hclk,
// adc12 control signals
    input rcc_c1_adc12_en,
    input rcc_c2_adc12_en,
    input rcc_c1_adc12_lpen,
    input rcc_c2_adc12_lpen,
    output rcc_adc12_hclk,
    output rcc_adc12_ker_clk,
// dma2 control signals
    input rcc_c1_dma2_en,
    input rcc_c2_dma2_en,
    input rcc_c1_dma2_lpen,
    input rcc_c2_dma2_lpen,
    output rcc_dma2_hclk,
// dma1 control signals
    input rcc_c1_dma1_en,
    input rcc_c2_dma1_en,
    input rcc_c1_dma1_lpen,
    input rcc_c2_dma1_lpen,
    output rcc_dma1_hclk,
// sram3 control signals
    input rcc_c1_sram3_en,
    input rcc_c1_sram3_lpen,
    input rcc_c2_sram3_lpen,
    output rcc_sram3_hclk,
// sram2 control signals
    input rcc_c1_sram2_en,
    input rcc_c1_sram2_lpen,
    input rcc_c2_sram2_lpen,
    output rcc_sram2_hclk,
// sram1 control signals
    input rcc_c1_sram1_en,
    input rcc_c1_sram1_lpen,
    input rcc_c2_sram1_lpen,
    output rcc_sram1_hclk,
// sdmmc2 control signals
    input rcc_c1_sdmmc2_en,
    input rcc_c2_sdmmc2_en,
    input rcc_c1_sdmmc2_lpen,
    input rcc_c2_sdmmc2_lpen,
    output rcc_sdmmc2_hclk,
    output rcc_sdmmc2_ker_clk,
// rng control signals
    input rcc_c1_rng_en,
    input rcc_c2_rng_en,
    input rcc_c1_rng_lpen,
    input rcc_c2_rng_lpen,
    output rcc_rng_hclk,
    output rcc_rng_ker_clk,
// hash control signals
    input rcc_c1_hash_en,
    input rcc_c2_hash_en,
    input rcc_c1_hash_lpen,
    input rcc_c2_hash_lpen,
    output rcc_hash_hclk,
// crypt control signals
    input rcc_c1_crypt_en,
    input rcc_c2_crypt_en,
    input rcc_c1_crypt_lpen,
    input rcc_c2_crypt_lpen,
    output rcc_crypt_hclk,
// dcmi control signals
    input rcc_c1_dcmi_en,
    input rcc_c2_dcmi_en,
    input rcc_c1_dcmi_lpen,
    input rcc_c2_dcmi_lpen,
    output rcc_dcmi_hclk,
// ramecc2 control signals
    output rcc_ramecc2_hclk,
// uart8 control signals
    input rcc_c1_uart8_en,
    input rcc_c2_uart8_en,
    input rcc_c1_uart8_lpen,
    input rcc_c2_uart8_lpen,
    input uart8_ker_clk_req,
    output rcc_uart8_pclk,
    output rcc_uart8_ker_clk,
// uart7 control signals
    input rcc_c1_uart7_en,
    input rcc_c2_uart7_en,
    input rcc_c1_uart7_lpen,
    input rcc_c2_uart7_lpen,
    input uart7_ker_clk_req,
    output rcc_uart7_pclk,
    output rcc_uart7_ker_clk,
// dac12 control signals
    input rcc_c1_dac12_en,
    input rcc_c2_dac12_en,
    input rcc_c1_dac12_lpen,
    input rcc_c2_dac12_lpen,
    output rcc_dac12_pclk,
// hdmicec control signals
    input rcc_c1_hdmicec_en,
    input rcc_c2_hdmicec_en,
    input rcc_c1_hdmicec_lpen,
    input rcc_c2_hdmicec_lpen,
    output rcc_hdmicec_pclk,
    output rcc_hdmicec_ker_clk,
// i2c3 control signals
    input rcc_c1_i2c3_en,
    input rcc_c2_i2c3_en,
    input rcc_c1_i2c3_lpen,
    input rcc_c2_i2c3_lpen,
    input i2c3_ker_clk_req,
    output rcc_i2c3_pclk,
    output rcc_i2c3_ker_clk,
// i2c2 control signals
    input rcc_c1_i2c2_en,
    input rcc_c2_i2c2_en,
    input rcc_c1_i2c2_lpen,
    input rcc_c2_i2c2_lpen,
    input i2c2_ker_clk_req,
    output rcc_i2c2_pclk,
    output rcc_i2c2_ker_clk,
// i2c1 control signals
    input rcc_c1_i2c1_en,
    input rcc_c2_i2c1_en,
    input rcc_c1_i2c1_lpen,
    input rcc_c2_i2c1_lpen,
    input i2c1_ker_clk_req,
    output rcc_i2c1_pclk,
    output rcc_i2c1_ker_clk,
// uart5 control signals
    input rcc_c1_uart5_en,
    input rcc_c2_uart5_en,
    input rcc_c1_uart5_lpen,
    input rcc_c2_uart5_lpen,
    input uart5_ker_clk_req,
    output rcc_uart5_pclk,
    output rcc_uart5_ker_clk,
// uart4 control signals
    input rcc_c1_uart4_en,
    input rcc_c2_uart4_en,
    input rcc_c1_uart4_lpen,
    input rcc_c2_uart4_lpen,
    input uart4_ker_clk_req,
    output rcc_uart4_pclk,
    output rcc_uart4_ker_clk,
// usart3 control signals
    input rcc_c1_usart3_en,
    input rcc_c2_usart3_en,
    input rcc_c1_usart3_lpen,
    input rcc_c2_usart3_lpen,
    input usart3_ker_clk_req,
    output rcc_usart3_pclk,
    output rcc_usart3_ker_clk,
// usart2 control signals
    input rcc_c1_usart2_en,
    input rcc_c2_usart2_en,
    input rcc_c1_usart2_lpen,
    input rcc_c2_usart2_lpen,
    input usart2_ker_clk_req,
    output rcc_usart2_pclk,
    output rcc_usart2_ker_clk,
// spdifrx control signals
    input rcc_c1_spdifrx_en,
    input rcc_c2_spdifrx_en,
    input rcc_c1_spdifrx_lpen,
    input rcc_c2_spdifrx_lpen,
    output rcc_spdifrx_pclk,
    output rcc_spdifrx_ker_clk,
// spi3 control signals
    input rcc_c1_spi3_en,
    input rcc_c2_spi3_en,
    input rcc_c1_spi3_lpen,
    input rcc_c2_spi3_lpen,
    output rcc_spi3_pclk,
    output rcc_spi3_ker_clk,
// spi2 control signals
    input rcc_c1_spi2_en,
    input rcc_c2_spi2_en,
    input rcc_c1_spi2_lpen,
    input rcc_c2_spi2_lpen,
    output rcc_spi2_pclk,
    output rcc_spi2_ker_clk,
// wwdg2 control signals
    input rcc_c1_wwdg2_en,
    input rcc_c2_wwdg2_en,
    input rcc_c1_wwdg2_lpen,
    input rcc_c2_wwdg2_lpen,
    output rcc_wwdg2_pclk,
// lptim1 control signals
    input rcc_c1_lptim1_en,
    input rcc_c2_lptim1_en,
    input rcc_c1_lptim1_lpen,
    input rcc_c2_lptim1_lpen,
    output rcc_lptim1_pclk,
    output rcc_lptim1_ker_clk,
// tim14 control signals
    input rcc_c1_tim14_en,
    input rcc_c2_tim14_en,
    input rcc_c1_tim14_lpen,
    input rcc_c2_tim14_lpen,
    output rcc_tim14_pclk,
    output rcc_tim14_ker_clk,
// tim13 control signals
    input rcc_c1_tim13_en,
    input rcc_c2_tim13_en,
    input rcc_c1_tim13_lpen,
    input rcc_c2_tim13_lpen,
    output rcc_tim13_pclk,
    output rcc_tim13_ker_clk,
// tim12 control signals
    input rcc_c1_tim12_en,
    input rcc_c2_tim12_en,
    input rcc_c1_tim12_lpen,
    input rcc_c2_tim12_lpen,
    output rcc_tim12_pclk,
    output rcc_tim12_ker_clk,
// tim7 control signals
    input rcc_c1_tim7_en,
    input rcc_c2_tim7_en,
    input rcc_c1_tim7_lpen,
    input rcc_c2_tim7_lpen,
    output rcc_tim7_pclk,
    output rcc_tim7_ker_clk,
// tim6 control signals
    input rcc_c1_tim6_en,
    input rcc_c2_tim6_en,
    input rcc_c1_tim6_lpen,
    input rcc_c2_tim6_lpen,
    output rcc_tim6_pclk,
    output rcc_tim6_ker_clk,
// tim5 control signals
    input rcc_c1_tim5_en,
    input rcc_c2_tim5_en,
    input rcc_c1_tim5_lpen,
    input rcc_c2_tim5_lpen,
    output rcc_tim5_pclk,
    output rcc_tim5_ker_clk,
// tim4 control signals
    input rcc_c1_tim4_en,
    input rcc_c2_tim4_en,
    input rcc_c1_tim4_lpen,
    input rcc_c2_tim4_lpen,
    output rcc_tim4_pclk,
    output rcc_tim4_ker_clk,
// tim3 control signals
    input rcc_c1_tim3_en,
    input rcc_c2_tim3_en,
    input rcc_c1_tim3_lpen,
    input rcc_c2_tim3_lpen,
    output rcc_tim3_pclk,
    output rcc_tim3_ker_clk,
// tim2 control signals
    input rcc_c1_tim2_en,
    input rcc_c2_tim2_en,
    input rcc_c1_tim2_lpen,
    input rcc_c2_tim2_lpen,
    output rcc_tim2_pclk,
    output rcc_tim2_ker_clk,
// fdcan control signals
    input rcc_c1_fdcan_en,
    input rcc_c2_fdcan_en,
    input rcc_c1_fdcan_lpen,
    input rcc_c2_fdcan_lpen,
    output rcc_fdcan_pclk,
    output rcc_fdcan_ker_clk,
// mdios control signals
    input rcc_c1_mdios_en,
    input rcc_c2_mdios_en,
    input rcc_c1_mdios_lpen,
    input rcc_c2_mdios_lpen,
    output rcc_mdios_pclk,
// opamp control signals
    input rcc_c1_opamp_en,
    input rcc_c2_opamp_en,
    input rcc_c1_opamp_lpen,
    input rcc_c2_opamp_lpen,
    output rcc_opamp_pclk,
// swpmi control signals
    input rcc_c1_swpmi_en,
    input rcc_c2_swpmi_en,
    input rcc_c1_swpmi_lpen,
    input rcc_c2_swpmi_lpen,
    output rcc_swpmi_pclk,
    output rcc_swpmi_ker_clk,
// crs control signals
    input rcc_c1_crs_en,
    input rcc_c2_crs_en,
    input rcc_c1_crs_lpen,
    input rcc_c2_crs_lpen,
    output rcc_crs_pclk,
// hrtim control signals
    input rcc_c1_hrtim_en,
    input rcc_c2_hrtim_en,
    input rcc_c1_hrtim_lpen,
    input rcc_c2_hrtim_lpen,
    output rcc_hrtim_pclk,
    output rcc_hrtim_ker_clk,
// dfsdm1 control signals
    input rcc_c1_dfsdm1_en,
    input rcc_c2_dfsdm1_en,
    input rcc_c1_dfsdm1_lpen,
    input rcc_c2_dfsdm1_lpen,
    output rcc_dfsdm1_pclk,
    output rcc_dfsdm1_ker_clk_0,
    output rcc_dfsdm1_ker_clk_1,
// sai3 control signals
    input rcc_c1_sai3_en,
    input rcc_c2_sai3_en,
    input rcc_c1_sai3_lpen,
    input rcc_c2_sai3_lpen,
    output rcc_sai3_pclk,
    output rcc_sai3_ker_clk,
// sai2 control signals
    input rcc_c1_sai2_en,
    input rcc_c2_sai2_en,
    input rcc_c1_sai2_lpen,
    input rcc_c2_sai2_lpen,
    output rcc_sai2_pclk,
    output rcc_sai2_ker_clk,
// sai1 control signals
    input rcc_c1_sai1_en,
    input rcc_c2_sai1_en,
    input rcc_c1_sai1_lpen,
    input rcc_c2_sai1_lpen,
    output rcc_sai1_pclk,
    output rcc_sai1_ker_clk,
// spi5 control signals
    input rcc_c1_spi5_en,
    input rcc_c2_spi5_en,
    input rcc_c1_spi5_lpen,
    input rcc_c2_spi5_lpen,
    output rcc_spi5_pclk,
    output rcc_spi5_ker_clk,
// tim17 control signals
    input rcc_c1_tim17_en,
    input rcc_c2_tim17_en,
    input rcc_c1_tim17_lpen,
    input rcc_c2_tim17_lpen,
    output rcc_tim17_pclk,
    output rcc_tim17_ker_clk,
// tim16 control signals
    input rcc_c1_tim16_en,
    input rcc_c2_tim16_en,
    input rcc_c1_tim16_lpen,
    input rcc_c2_tim16_lpen,
    output rcc_tim16_pclk,
    output rcc_tim16_ker_clk,
// tim15 control signals
    input rcc_c1_tim15_en,
    input rcc_c2_tim15_en,
    input rcc_c1_tim15_lpen,
    input rcc_c2_tim15_lpen,
    output rcc_tim15_pclk,
    output rcc_tim15_ker_clk,
// spi4 control signals
    input rcc_c1_spi4_en,
    input rcc_c2_spi4_en,
    input rcc_c1_spi4_lpen,
    input rcc_c2_spi4_lpen,
    output rcc_spi4_pclk,
    output rcc_spi4_ker_clk,
// spi1 control signals
    input rcc_c1_spi1_en,
    input rcc_c2_spi1_en,
    input rcc_c1_spi1_lpen,
    input rcc_c2_spi1_lpen,
    output rcc_spi1_pclk,
    output rcc_spi1_ker_clk,
// usart6 control signals
    input rcc_c1_usart6_en,
    input rcc_c2_usart6_en,
    input rcc_c1_usart6_lpen,
    input rcc_c2_usart6_lpen,
    input usart6_ker_clk_req,
    output rcc_usart6_pclk,
    output rcc_usart6_ker_clk,
// usart1 control signals
    input rcc_c1_usart1_en,
    input rcc_c2_usart1_en,
    input rcc_c1_usart1_lpen,
    input rcc_c2_usart1_lpen,
    input usart1_ker_clk_req,
    output rcc_usart1_pclk,
    output rcc_usart1_ker_clk,
// tim8 control signals
    input rcc_c1_tim8_en,
    input rcc_c2_tim8_en,
    input rcc_c1_tim8_lpen,
    input rcc_c2_tim8_lpen,
    output rcc_tim8_pclk,
    output rcc_tim8_ker_clk,
// tim1 control signals
    input rcc_c1_tim1_en,
    input rcc_c2_tim1_en,
    input rcc_c1_tim1_lpen,
    input rcc_c2_tim1_lpen,
    output rcc_tim1_pclk,
    output rcc_tim1_ker_clk,
// sram4 control signals
    input rcc_c1_sram4_lpen,
    input rcc_c2_sram4_lpen,
    input rcc_sram4_amen,
    output rcc_sram4_hclk,
// bkpram control signals
    input rcc_c1_bkpram_en,
    input rcc_c2_bkpram_en,
    input rcc_c1_bkpram_lpen,
    input rcc_c2_bkpram_lpen,
    input rcc_bkpram_amen,
    output rcc_bkpram_hclk,
// ramecc3 control signals
    input rcc_ramecc3_amen,
    output rcc_ramecc3_hclk,
// hsem control signals
    input rcc_c1_hsem_en,
    input rcc_c2_hsem_en,
    input rcc_hsem_amen,
    output rcc_hsem_hclk,
// adc3 control signals
    input rcc_c1_adc3_en,
    input rcc_c2_adc3_en,
    input rcc_c1_adc3_lpen,
    input rcc_c2_adc3_lpen,
    input rcc_adc3_amen,
    output rcc_adc3_hclk,
    output rcc_adc3_ker_clk,
// bdma control signals
    input rcc_c1_bdma_en,
    input rcc_c2_bdma_en,
    input rcc_c1_bdma_lpen,
    input rcc_c2_bdma_lpen,
    input rcc_bdma_amen,
    output rcc_bdma_hclk,
// crc control signals
    input rcc_c1_crc_en,
    input rcc_c2_crc_en,
    input rcc_c1_crc_lpen,
    input rcc_c2_crc_lpen,
    input rcc_crc_amen,
    output rcc_crc_hclk,
// gpiok control signals
    input rcc_c1_gpiok_en,
    input rcc_c2_gpiok_en,
    input rcc_c1_gpiok_lpen,
    input rcc_c2_gpiok_lpen,
    input rcc_gpiok_amen,
    output rcc_gpiok_hclk,
// gpioj control signals
    input rcc_c1_gpioj_en,
    input rcc_c2_gpioj_en,
    input rcc_c1_gpioj_lpen,
    input rcc_c2_gpioj_lpen,
    input rcc_gpioj_amen,
    output rcc_gpioj_hclk,
// gpioi control signals
    input rcc_c1_gpioi_en,
    input rcc_c2_gpioi_en,
    input rcc_c1_gpioi_lpen,
    input rcc_c2_gpioi_lpen,
    input rcc_gpioi_amen,
    output rcc_gpioi_hclk,
// gpioh control signals
    input rcc_c1_gpioh_en,
    input rcc_c2_gpioh_en,
    input rcc_c1_gpioh_lpen,
    input rcc_c2_gpioh_lpen,
    input rcc_gpioh_amen,
    output rcc_gpioh_hclk,
// gpiog control signals
    input rcc_c1_gpiog_en,
    input rcc_c2_gpiog_en,
    input rcc_c1_gpiog_lpen,
    input rcc_c2_gpiog_lpen,
    input rcc_gpiog_amen,
    output rcc_gpiog_hclk,
// gpiof control signals
    input rcc_c1_gpiof_en,
    input rcc_c2_gpiof_en,
    input rcc_c1_gpiof_lpen,
    input rcc_c2_gpiof_lpen,
    input rcc_gpiof_amen,
    output rcc_gpiof_hclk,
// gpioe control signals
    input rcc_c1_gpioe_en,
    input rcc_c2_gpioe_en,
    input rcc_c1_gpioe_lpen,
    input rcc_c2_gpioe_lpen,
    input rcc_gpioe_amen,
    output rcc_gpioe_hclk,
// gpiod control signals
    input rcc_c1_gpiod_en,
    input rcc_c2_gpiod_en,
    input rcc_c1_gpiod_lpen,
    input rcc_c2_gpiod_lpen,
    input rcc_gpiod_amen,
    output rcc_gpiod_hclk,
// gpioc control signals
    input rcc_c1_gpioc_en,
    input rcc_c2_gpioc_en,
    input rcc_c1_gpioc_lpen,
    input rcc_c2_gpioc_lpen,
    input rcc_gpioc_amen,
    output rcc_gpioc_hclk,
// gpiob control signals
    input rcc_c1_gpiob_en,
    input rcc_c2_gpiob_en,
    input rcc_c1_gpiob_lpen,
    input rcc_c2_gpiob_lpen,
    input rcc_gpiob_amen,
    output rcc_gpiob_hclk,
// gpioa control signals
    input rcc_c1_gpioa_en,
    input rcc_c2_gpioa_en,
    input rcc_c1_gpioa_lpen,
    input rcc_c2_gpioa_lpen,
    input rcc_gpioa_amen,
    output rcc_gpioa_hclk,
// rcc control signals
    input rcc_rcc_amen,
    output rcc_rcc_hclk,
// pwr control signals
    input rcc_pwr_amen,
    output rcc_pwr_hclk,
// sai4 control signals
    input rcc_c1_sai4_en,
    input rcc_c2_sai4_en,
    input rcc_c1_sai4_lpen,
    input rcc_c2_sai4_lpen,
    input rcc_sai4_amen,
    output rcc_sai4_pclk,
    output rcc_sai4_ker_clk_0,
    output rcc_sai4_ker_clk_1,
// rtc control signals
    input rcc_c1_rtc_en,
    input rcc_c2_rtc_en,
    input rcc_c1_rtc_lpen,
    input rcc_c2_rtc_lpen,
    input rcc_rtc_amen,
// vref control signals
    input rcc_c1_vref_en,
    input rcc_c2_vref_en,
    input rcc_c1_vref_lpen,
    input rcc_c2_vref_lpen,
    input rcc_vref_amen,
    output rcc_vref_pclk,
// comp12 control signals
    input rcc_c1_comp12_en,
    input rcc_c2_comp12_en,
    input rcc_c1_comp12_lpen,
    input rcc_c2_comp12_lpen,
    input rcc_comp12_amen,
    output rcc_comp12_pclk,
// lptim5 control signals
    input rcc_c1_lptim5_en,
    input rcc_c2_lptim5_en,
    input rcc_c1_lptim5_lpen,
    input rcc_c2_lptim5_lpen,
    input rcc_lptim5_amen,
    output rcc_lptim5_pclk,
    output rcc_lptim5_ker_clk,
// lptim4 control signals
    input rcc_c1_lptim4_en,
    input rcc_c2_lptim4_en,
    input rcc_c1_lptim4_lpen,
    input rcc_c2_lptim4_lpen,
    input rcc_lptim4_amen,
    output rcc_lptim4_pclk,
    output rcc_lptim4_ker_clk,
// lptim3 control signals
    input rcc_c1_lptim3_en,
    input rcc_c2_lptim3_en,
    input rcc_c1_lptim3_lpen,
    input rcc_c2_lptim3_lpen,
    input rcc_lptim3_amen,
    output rcc_lptim3_pclk,
    output rcc_lptim3_ker_clk,
// lptim2 control signals
    input rcc_c1_lptim2_en,
    input rcc_c2_lptim2_en,
    input rcc_c1_lptim2_lpen,
    input rcc_c2_lptim2_lpen,
    input rcc_lptim2_amen,
    output rcc_lptim2_pclk,
    output rcc_lptim2_ker_clk,
// i2c4 control signals
    input rcc_c1_i2c4_en,
    input rcc_c2_i2c4_en,
    input rcc_c1_i2c4_lpen,
    input rcc_c2_i2c4_lpen,
    input rcc_i2c4_amen,
    input i2c4_ker_clk_req,
    output rcc_i2c4_pclk,
    output rcc_i2c4_ker_clk,
// spi6 control signals
    input rcc_c1_spi6_en,
    input rcc_c2_spi6_en,
    input rcc_c1_spi6_lpen,
    input rcc_c2_spi6_lpen,
    input rcc_spi6_amen,
    output rcc_spi6_pclk,
    output rcc_spi6_ker_clk,
// lpuart1 control signals
    input rcc_c1_lpuart1_en,
    input rcc_c2_lpuart1_en,
    input rcc_c1_lpuart1_lpen,
    input rcc_c2_lpuart1_lpen,
    input rcc_lpuart1_amen,
    input lpuart1_ker_clk_req,
    output rcc_lpuart1_pclk,
    output rcc_lpuart1_ker_clk,
// syscfg control signals
    input rcc_c1_syscfg_en,
    input rcc_c2_syscfg_en,
    input rcc_c1_syscfg_lpen,
    input rcc_c2_syscfg_lpen,
    input rcc_syscfg_amen,
    output rcc_syscfg_pclk,
// iwdg2 control signals
    input rcc_iwdg2_amen,
    output rcc_iwdg2_pclk,
// iwdg1 control signals
    input rcc_iwdg1_amen,
    output rcc_iwdg1_pclk,
// exti control signals
    input rcc_exti_amen,
    output rcc_exti_pclk,
// ker clk control bits
    input wire [1:0] qspisel,
    input wire [1:0] fmcsel,
    input wire [0:0] sdmmcsel,
    input wire [1:0] usbsel,
    input wire [1:0] adcsel,
    input wire [1:0] rngsel,
    input wire [1:0] cecsel,
    input wire [1:0] i2c123sel,
    input wire [2:0] usart234578sel,
    input wire [1:0] spdifsel,
    input wire [2:0] lptim1sel,
    input wire [1:0] fdcansel,
    input wire [0:0] swpsel,
    input wire [2:0] sai1sel,
    input wire [0:0] dfsdm1sel,
    input wire [2:0] sai23sel,
    input wire [2:0] spi45sel,
    input wire [2:0] spi123sel,
    input wire [2:0] usart16sel,
    input wire [2:0] sai4asel,
    input wire [2:0] sai4bsel,
    input wire [2:0] lptim345sel,
    input wire [2:0] lptim2sel,
    input wire [1:0] i2c4sel,
    input wire [2:0] spi6sel,
    input wire [2:0] lpuart1sel
);
    // flash bus clock , ker clock enable
    wire rcc_flash_bus_clk_en;
    // qspi bus clock , ker clock enable
    wire rcc_qspi_bus_clk_en;
    wire rcc_qspi_ker_clk_en;
    // axisram bus clock , ker clock enable
    wire rcc_axisram_bus_clk_en;
    // fmc bus clock , ker clock enable
    wire rcc_fmc_bus_clk_en;
    wire rcc_fmc_ker_clk_en;
    // dma2d bus clock , ker clock enable
    wire rcc_dma2d_bus_clk_en;
    // mdma bus clock , ker clock enable
    wire rcc_mdma_bus_clk_en;
    // ltdc bus clock , ker clock enable
    wire rcc_ltdc_bus_clk_en;
    wire rcc_ltdc_ker_clk_en;
    // ramecc1 bus clock , ker clock enable
    wire rcc_ramecc1_bus_clk_en;
    // gpv bus clock , ker clock enable
    wire rcc_gpv_bus_clk_en;
    // itcm bus clock , ker clock enable
    wire rcc_itcm_bus_clk_en;
    // dtcm2 bus clock , ker clock enable
    wire rcc_dtcm2_bus_clk_en;
    // dtcm1 bus clock , ker clock enable
    wire rcc_dtcm1_bus_clk_en;
    // jpgdec bus clock , ker clock enable
    wire rcc_jpgdec_bus_clk_en;
    // sdmmc1 bus clock , ker clock enable
    wire rcc_sdmmc1_bus_clk_en;
    wire rcc_sdmmc1_ker_clk_en;
    // wwdg1 bus clock , ker clock enable
    wire rcc_wwdg1_bus_clk_en;
    // usb2ulpi bus clock , ker clock enable
    wire rcc_usb2ulpi_bus_clk_en;
    // usb2otg bus clock , ker clock enable
    wire rcc_usb2otg_bus_clk_en;
    wire rcc_usb2otg_ker_clk_en;
    // usb1ulpi bus clock , ker clock enable
    wire rcc_usb1ulpi_bus_clk_en;
    wire rcc_usb1ulpi_ker_clk_en;
    // usb1otg bus clock , ker clock enable
    wire rcc_usb1otg_bus_clk_en;
    wire rcc_usb1otg_ker_clk_en;
    // eth1rx bus clock , ker clock enable
    wire rcc_eth1rx_bus_clk_en;
    // eth1tx bus clock , ker clock enable
    wire rcc_eth1tx_bus_clk_en;
    // eth1mac bus clock , ker clock enable
    wire rcc_eth1mac_bus_clk_en;
    // adc12 bus clock , ker clock enable
    wire rcc_adc12_bus_clk_en;
    wire rcc_adc12_ker_clk_en;
    // dma2 bus clock , ker clock enable
    wire rcc_dma2_bus_clk_en;
    // dma1 bus clock , ker clock enable
    wire rcc_dma1_bus_clk_en;
    // sram3 bus clock , ker clock enable
    wire rcc_sram3_bus_clk_en;
    // sram2 bus clock , ker clock enable
    wire rcc_sram2_bus_clk_en;
    // sram1 bus clock , ker clock enable
    wire rcc_sram1_bus_clk_en;
    // sdmmc2 bus clock , ker clock enable
    wire rcc_sdmmc2_bus_clk_en;
    wire rcc_sdmmc2_ker_clk_en;
    // rng bus clock , ker clock enable
    wire rcc_rng_bus_clk_en;
    wire rcc_rng_ker_clk_en;
    // hash bus clock , ker clock enable
    wire rcc_hash_bus_clk_en;
    // crypt bus clock , ker clock enable
    wire rcc_crypt_bus_clk_en;
    // dcmi bus clock , ker clock enable
    wire rcc_dcmi_bus_clk_en;
    // ramecc2 bus clock , ker clock enable
    wire rcc_ramecc2_bus_clk_en;
    // uart8 bus clock , ker clock enable
    wire rcc_uart8_bus_clk_en;
    wire rcc_uart8_ker_clk_en;
    // uart7 bus clock , ker clock enable
    wire rcc_uart7_bus_clk_en;
    wire rcc_uart7_ker_clk_en;
    // dac12 bus clock , ker clock enable
    wire rcc_dac12_bus_clk_en;
    // hdmicec bus clock , ker clock enable
    wire rcc_hdmicec_bus_clk_en;
    wire rcc_hdmicec_ker_clk_en;
    // i2c3 bus clock , ker clock enable
    wire rcc_i2c3_bus_clk_en;
    wire rcc_i2c3_ker_clk_en;
    // i2c2 bus clock , ker clock enable
    wire rcc_i2c2_bus_clk_en;
    wire rcc_i2c2_ker_clk_en;
    // i2c1 bus clock , ker clock enable
    wire rcc_i2c1_bus_clk_en;
    wire rcc_i2c1_ker_clk_en;
    // uart5 bus clock , ker clock enable
    wire rcc_uart5_bus_clk_en;
    wire rcc_uart5_ker_clk_en;
    // uart4 bus clock , ker clock enable
    wire rcc_uart4_bus_clk_en;
    wire rcc_uart4_ker_clk_en;
    // usart3 bus clock , ker clock enable
    wire rcc_usart3_bus_clk_en;
    wire rcc_usart3_ker_clk_en;
    // usart2 bus clock , ker clock enable
    wire rcc_usart2_bus_clk_en;
    wire rcc_usart2_ker_clk_en;
    // spdifrx bus clock , ker clock enable
    wire rcc_spdifrx_bus_clk_en;
    wire rcc_spdifrx_ker_clk_en;
    // spi3 bus clock , ker clock enable
    wire rcc_spi3_bus_clk_en;
    wire rcc_spi3_ker_clk_en;
    // spi2 bus clock , ker clock enable
    wire rcc_spi2_bus_clk_en;
    wire rcc_spi2_ker_clk_en;
    // wwdg2 bus clock , ker clock enable
    wire rcc_wwdg2_bus_clk_en;
    // lptim1 bus clock , ker clock enable
    wire rcc_lptim1_bus_clk_en;
    wire rcc_lptim1_ker_clk_en;
    // tim14 bus clock , ker clock enable
    wire rcc_tim14_bus_clk_en;
    wire rcc_tim14_ker_clk_en;
    // tim13 bus clock , ker clock enable
    wire rcc_tim13_bus_clk_en;
    wire rcc_tim13_ker_clk_en;
    // tim12 bus clock , ker clock enable
    wire rcc_tim12_bus_clk_en;
    wire rcc_tim12_ker_clk_en;
    // tim7 bus clock , ker clock enable
    wire rcc_tim7_bus_clk_en;
    wire rcc_tim7_ker_clk_en;
    // tim6 bus clock , ker clock enable
    wire rcc_tim6_bus_clk_en;
    wire rcc_tim6_ker_clk_en;
    // tim5 bus clock , ker clock enable
    wire rcc_tim5_bus_clk_en;
    wire rcc_tim5_ker_clk_en;
    // tim4 bus clock , ker clock enable
    wire rcc_tim4_bus_clk_en;
    wire rcc_tim4_ker_clk_en;
    // tim3 bus clock , ker clock enable
    wire rcc_tim3_bus_clk_en;
    wire rcc_tim3_ker_clk_en;
    // tim2 bus clock , ker clock enable
    wire rcc_tim2_bus_clk_en;
    wire rcc_tim2_ker_clk_en;
    // fdcan bus clock , ker clock enable
    wire rcc_fdcan_bus_clk_en;
    wire rcc_fdcan_ker_clk_en;
    // mdios bus clock , ker clock enable
    wire rcc_mdios_bus_clk_en;
    // opamp bus clock , ker clock enable
    wire rcc_opamp_bus_clk_en;
    // swpmi bus clock , ker clock enable
    wire rcc_swpmi_bus_clk_en;
    wire rcc_swpmi_ker_clk_en;
    // crs bus clock , ker clock enable
    wire rcc_crs_bus_clk_en;
    // hrtim bus clock , ker clock enable
    wire rcc_hrtim_bus_clk_en;
    wire rcc_hrtim_ker_clk_en;
    // dfsdm1 bus clock , ker clock enable
    wire rcc_dfsdm1_bus_clk_en;
    wire rcc_dfsdm1_ker_clk_en_0;
    wire rcc_dfsdm1_ker_clk_en_1;
    // sai3 bus clock , ker clock enable
    wire rcc_sai3_bus_clk_en;
    wire rcc_sai3_ker_clk_en;
    // sai2 bus clock , ker clock enable
    wire rcc_sai2_bus_clk_en;
    wire rcc_sai2_ker_clk_en;
    // sai1 bus clock , ker clock enable
    wire rcc_sai1_bus_clk_en;
    wire rcc_sai1_ker_clk_en;
    // spi5 bus clock , ker clock enable
    wire rcc_spi5_bus_clk_en;
    wire rcc_spi5_ker_clk_en;
    // tim17 bus clock , ker clock enable
    wire rcc_tim17_bus_clk_en;
    wire rcc_tim17_ker_clk_en;
    // tim16 bus clock , ker clock enable
    wire rcc_tim16_bus_clk_en;
    wire rcc_tim16_ker_clk_en;
    // tim15 bus clock , ker clock enable
    wire rcc_tim15_bus_clk_en;
    wire rcc_tim15_ker_clk_en;
    // spi4 bus clock , ker clock enable
    wire rcc_spi4_bus_clk_en;
    wire rcc_spi4_ker_clk_en;
    // spi1 bus clock , ker clock enable
    wire rcc_spi1_bus_clk_en;
    wire rcc_spi1_ker_clk_en;
    // usart6 bus clock , ker clock enable
    wire rcc_usart6_bus_clk_en;
    wire rcc_usart6_ker_clk_en;
    // usart1 bus clock , ker clock enable
    wire rcc_usart1_bus_clk_en;
    wire rcc_usart1_ker_clk_en;
    // tim8 bus clock , ker clock enable
    wire rcc_tim8_bus_clk_en;
    wire rcc_tim8_ker_clk_en;
    // tim1 bus clock , ker clock enable
    wire rcc_tim1_bus_clk_en;
    wire rcc_tim1_ker_clk_en;
    // sram4 bus clock , ker clock enable
    wire rcc_sram4_bus_clk_en;
    // bkpram bus clock , ker clock enable
    wire rcc_bkpram_bus_clk_en;
    // ramecc3 bus clock , ker clock enable
    wire rcc_ramecc3_bus_clk_en;
    // hsem bus clock , ker clock enable
    wire rcc_hsem_bus_clk_en;
    // adc3 bus clock , ker clock enable
    wire rcc_adc3_bus_clk_en;
    wire rcc_adc3_ker_clk_en;
    // bdma bus clock , ker clock enable
    wire rcc_bdma_bus_clk_en;
    // crc bus clock , ker clock enable
    wire rcc_crc_bus_clk_en;
    // gpiok bus clock , ker clock enable
    wire rcc_gpiok_bus_clk_en;
    // gpioj bus clock , ker clock enable
    wire rcc_gpioj_bus_clk_en;
    // gpioi bus clock , ker clock enable
    wire rcc_gpioi_bus_clk_en;
    // gpioh bus clock , ker clock enable
    wire rcc_gpioh_bus_clk_en;
    // gpiog bus clock , ker clock enable
    wire rcc_gpiog_bus_clk_en;
    // gpiof bus clock , ker clock enable
    wire rcc_gpiof_bus_clk_en;
    // gpioe bus clock , ker clock enable
    wire rcc_gpioe_bus_clk_en;
    // gpiod bus clock , ker clock enable
    wire rcc_gpiod_bus_clk_en;
    // gpioc bus clock , ker clock enable
    wire rcc_gpioc_bus_clk_en;
    // gpiob bus clock , ker clock enable
    wire rcc_gpiob_bus_clk_en;
    // gpioa bus clock , ker clock enable
    wire rcc_gpioa_bus_clk_en;
    // rcc bus clock , ker clock enable
    wire rcc_rcc_bus_clk_en;
    // pwr bus clock , ker clock enable
    wire rcc_pwr_bus_clk_en;
    // sai4 bus clock , ker clock enable
    wire rcc_sai4_bus_clk_en;
    wire rcc_sai4_ker_clk_en_0;
    wire rcc_sai4_ker_clk_en_1;
    // rtc bus clock , ker clock enable
    wire rcc_rtc_bus_clk_en;
    // vref bus clock , ker clock enable
    wire rcc_vref_bus_clk_en;
    // comp12 bus clock , ker clock enable
    wire rcc_comp12_bus_clk_en;
    // lptim5 bus clock , ker clock enable
    wire rcc_lptim5_bus_clk_en;
    wire rcc_lptim5_ker_clk_en;
    // lptim4 bus clock , ker clock enable
    wire rcc_lptim4_bus_clk_en;
    wire rcc_lptim4_ker_clk_en;
    // lptim3 bus clock , ker clock enable
    wire rcc_lptim3_bus_clk_en;
    wire rcc_lptim3_ker_clk_en;
    // lptim2 bus clock , ker clock enable
    wire rcc_lptim2_bus_clk_en;
    wire rcc_lptim2_ker_clk_en;
    // i2c4 bus clock , ker clock enable
    wire rcc_i2c4_bus_clk_en;
    wire rcc_i2c4_ker_clk_en;
    // spi6 bus clock , ker clock enable
    wire rcc_spi6_bus_clk_en;
    wire rcc_spi6_ker_clk_en;
    // lpuart1 bus clock , ker clock enable
    wire rcc_lpuart1_bus_clk_en;
    wire rcc_lpuart1_ker_clk_en;
    // syscfg bus clock , ker clock enable
    wire rcc_syscfg_bus_clk_en;
    // iwdg2 bus clock , ker clock enable
    wire rcc_iwdg2_bus_clk_en;
    // iwdg1 bus clock , ker clock enable
    wire rcc_iwdg1_bus_clk_en;
    // exti bus clock , ker clock enable
    wire rcc_exti_bus_clk_en;
    // qspisel ker clock source select
    wire rcc_qspisel_clk;
    // fmcsel ker clock source select
    wire rcc_fmcsel_clk;
    // sdmmcsel ker clock source select
    wire rcc_sdmmcsel_clk;
    // usbsel ker clock source select
    wire rcc_usbsel_clk;
    // adcsel ker clock source select
    wire rcc_adcsel_clk;
    // rngsel ker clock source select
    wire rcc_rngsel_clk;
    // cecsel ker clock source select
    wire rcc_cecsel_clk;
    // i2c123sel ker clock source select
    wire rcc_i2c123sel_clk;
    // usart234578sel ker clock source select
    wire rcc_usart234578sel_clk;
    // spdifsel ker clock source select
    wire rcc_spdifsel_clk;
    // lptim1sel ker clock source select
    wire rcc_lptim1sel_clk;
    // fdcansel ker clock source select
    wire rcc_fdcansel_clk;
    // swpsel ker clock source select
    wire rcc_swpsel_clk;
    // sai1sel ker clock source select
    wire rcc_sai1sel_clk;
    // dfsdm1sel ker clock source select
    wire rcc_dfsdm1sel_clk;
    // sai23sel ker clock source select
    wire rcc_sai23sel_clk;
    // spi45sel ker clock source select
    wire rcc_spi45sel_clk;
    // spi123sel ker clock source select
    wire rcc_spi123sel_clk;
    // usart16sel ker clock source select
    wire rcc_usart16sel_clk;
    // sai4asel ker clock source select
    wire rcc_sai4asel_clk;
    // sai4bsel ker clock source select
    wire rcc_sai4bsel_clk;
    // lptim345sel ker clock source select
    wire rcc_lptim345sel_clk;
    // lptim2sel ker clock source select
    wire rcc_lptim2sel_clk;
    // i2c4sel ker clock source select
    wire rcc_i2c4sel_clk;
    // spi6sel ker clock source select
    wire rcc_spi6sel_clk;
    // lpuart1sel ker clock source select
    wire rcc_lpuart1sel_clk;
    wire csi_ker_clk_122_div;
    // peripheral clock control logic
  



  // flash bus clock ker clock enable
    assign rcc_flash_bus_clk_en = ((~c1_sleep | rcc_c1_flash_lpen)& ~c1_deepsleep) | (rcc_c2_flash_en & (~c2_sleep | rcc_c2_flash_lpen) & ~c2_deepsleep);
    // flash bus clock gate
    rcc_clk_gate_cell_sync rcc_flash_hclk_gate (
        .clk_in(rcc_ahb3bridge_d1_clk),
        .clk_en(rcc_flash_bus_clk_en),
        .clk_out(rcc_flash_hclk)
    );
    rcc_clk_gate_cell_sync rcc_flash_aclk_gate (
        .clk_in(rcc_axibridge_d1_clk),
        .clk_en(rcc_flash_bus_clk_en),
        .clk_out(rcc_flash_aclk)
    );
  



  // qspi bus clock ker clock enable
    assign rcc_qspi_bus_clk_en = (rcc_c1_qspi_en & (~c1_sleep | rcc_c1_qspi_lpen) & ~c1_deepsleep) | (rcc_c2_qspi_en & (~c2_sleep | rcc_c2_qspi_lpen) & ~c2_deepsleep);
    // qspi ker clock enable logic
    assign rcc_qspi_ker_clk_en = rcc_qspi_bus_clk_en ;
    // qspi bus clock gate
    rcc_clk_gate_cell_sync rcc_qspi_hclk_gate (
        .clk_in(rcc_ahb3bridge_d1_clk),
        .clk_en(rcc_qspi_bus_clk_en),
        .clk_out(rcc_qspi_hclk)
    );
    rcc_clk_gate_cell_sync rcc_qspi_aclk_gate (
        .clk_in(rcc_axibridge_d1_clk),
        .clk_en(rcc_qspi_bus_clk_en),
        .clk_out(rcc_qspi_aclk)
    );
    // qspi ker clock gate
    rcc_clk_gate_cell_sync rcc_qspi_ker_clk_gate (
        .clk_in(rcc_qspisel_clk),
        .clk_en(rcc_qspi_ker_clk_en),
        .clk_out(rcc_qspi_ker_clk)
    );
  



  // axisram bus clock ker clock enable
    assign rcc_axisram_bus_clk_en = ((~c1_sleep | rcc_c1_axisram_lpen)& ~c1_deepsleep) | (rcc_c2_axisram_en & (~c2_sleep | rcc_c2_axisram_lpen) & ~c2_deepsleep);
    // axisram bus clock gate
    rcc_clk_gate_cell_sync rcc_axisram_aclk_gate (
        .clk_in(rcc_axibridge_d1_clk),
        .clk_en(rcc_axisram_bus_clk_en),
        .clk_out(rcc_axisram_aclk)
    );
  



  // fmc bus clock ker clock enable
    assign rcc_fmc_bus_clk_en = (rcc_c1_fmc_en & (~c1_sleep | rcc_c1_fmc_lpen) & ~c1_deepsleep) | (rcc_c2_fmc_en & (~c2_sleep | rcc_c2_fmc_lpen) & ~c2_deepsleep);
    // fmc ker clock enable logic
    assign rcc_fmc_ker_clk_en = rcc_fmc_bus_clk_en ;
    // fmc bus clock gate
    rcc_clk_gate_cell_sync rcc_fmc_hclk_gate (
        .clk_in(rcc_ahb3bridge_d1_clk),
        .clk_en(rcc_fmc_bus_clk_en),
        .clk_out(rcc_fmc_hclk)
    );
    rcc_clk_gate_cell_sync rcc_fmc_aclk_gate (
        .clk_in(rcc_axibridge_d1_clk),
        .clk_en(rcc_fmc_bus_clk_en),
        .clk_out(rcc_fmc_aclk)
    );
    // fmc ker clock gate
    rcc_clk_gate_cell_sync rcc_fmc_ker_clk_gate (
        .clk_in(rcc_fmcsel_clk),
        .clk_en(rcc_fmc_ker_clk_en),
        .clk_out(rcc_fmc_ker_clk)
    );
  



  // dma2d bus clock ker clock enable
    assign rcc_dma2d_bus_clk_en = (rcc_c1_dma2d_en & (~c1_sleep | rcc_c1_dma2d_lpen) & ~c1_deepsleep) | (rcc_c2_dma2d_en & (~c2_sleep | rcc_c2_dma2d_lpen) & ~c2_deepsleep);
    // dma2d bus clock gate
    rcc_clk_gate_cell_sync rcc_dma2d_hclk_gate (
        .clk_in(rcc_ahb3bridge_d1_clk),
        .clk_en(rcc_dma2d_bus_clk_en),
        .clk_out(rcc_dma2d_hclk)
    );
    rcc_clk_gate_cell_sync rcc_dma2d_aclk_gate (
        .clk_in(rcc_axibridge_d1_clk),
        .clk_en(rcc_dma2d_bus_clk_en),
        .clk_out(rcc_dma2d_aclk)
    );
  



  // mdma bus clock ker clock enable
    assign rcc_mdma_bus_clk_en = (rcc_c1_mdma_en & (~c1_sleep | rcc_c1_mdma_lpen) & ~c1_deepsleep) | (rcc_c2_mdma_en & (~c2_sleep | rcc_c2_mdma_lpen) & ~c2_deepsleep);
    // mdma bus clock gate
    rcc_clk_gate_cell_sync rcc_mdma_hclk_gate (
        .clk_in(rcc_ahb3bridge_d1_clk),
        .clk_en(rcc_mdma_bus_clk_en),
        .clk_out(rcc_mdma_hclk)
    );
    rcc_clk_gate_cell_sync rcc_mdma_aclk_gate (
        .clk_in(rcc_axibridge_d1_clk),
        .clk_en(rcc_mdma_bus_clk_en),
        .clk_out(rcc_mdma_aclk)
    );
  



  // ltdc bus clock ker clock enable
    assign rcc_ltdc_bus_clk_en = (rcc_c1_ltdc_en & (~c1_sleep | rcc_c1_ltdc_lpen) & ~c1_deepsleep) | (rcc_c2_ltdc_en & (~c2_sleep | rcc_c2_ltdc_lpen) & ~c2_deepsleep);
    // ltdc ker clock enable logic
    assign rcc_ltdc_ker_clk_en = rcc_ltdc_bus_clk_en ;
    // ltdc bus clock gate
    rcc_clk_gate_cell_sync rcc_ltdc_aclk_gate (
        .clk_in(rcc_axibridge_d1_clk),
        .clk_en(rcc_ltdc_bus_clk_en),
        .clk_out(rcc_ltdc_aclk)
    );
    rcc_clk_gate_cell_sync rcc_ltdc_pclk_gate (
        .clk_in(rcc_apb3bridge_d1_clk),
        .clk_en(rcc_ltdc_bus_clk_en),
        .clk_out(rcc_ltdc_pclk)
    );
    // ltdc ker clock gate
    rcc_clk_gate_cell_sync rcc_ltdc_ker_clk_gate (
        .clk_in(pll3_r_clk),
        .clk_en(rcc_ltdc_ker_clk_en),
        .clk_out(rcc_ltdc_ker_clk)
    );
  



  // ramecc1 bus clock ker clock enable
    assign rcc_ramecc1_bus_clk_en = ~c1_deepsleep | ~c2_deepsleep;
    // ramecc1 bus clock gate
    rcc_clk_gate_cell_sync rcc_ramecc1_hclk_gate (
        .clk_in(rcc_ahb3bridge_d1_clk),
        .clk_en(rcc_ramecc1_bus_clk_en),
        .clk_out(rcc_ramecc1_hclk)
    );
  



  // gpv bus clock ker clock enable
    assign rcc_gpv_bus_clk_en = ~c1_deepsleep | ~c2_deepsleep;
    // gpv bus clock gate
    rcc_clk_gate_cell_sync rcc_gpv_hclk_gate (
        .clk_in(rcc_ahb3bridge_d1_clk),
        .clk_en(rcc_gpv_bus_clk_en),
        .clk_out(rcc_gpv_hclk)
    );
  



  // itcm bus clock ker clock enable
    assign rcc_itcm_bus_clk_en = ((~c1_sleep | rcc_c1_itcm_lpen)& ~c1_deepsleep) | (rcc_c2_itcm_en & (~c2_sleep | rcc_c2_itcm_lpen) & ~c2_deepsleep);
    // itcm bus clock gate
    rcc_clk_gate_cell_sync rcc_itcm_hclk_gate (
        .clk_in(rcc_ahb3bridge_d1_clk),
        .clk_en(rcc_itcm_bus_clk_en),
        .clk_out(rcc_itcm_hclk)
    );
  



  // dtcm2 bus clock ker clock enable
    assign rcc_dtcm2_bus_clk_en = ((~c1_sleep | rcc_c1_dtcm2_lpen)& ~c1_deepsleep) | (rcc_c2_dtcm2_en & (~c2_sleep | rcc_c2_dtcm2_lpen) & ~c2_deepsleep);
    // dtcm2 bus clock gate
    rcc_clk_gate_cell_sync rcc_dtcm2_hclk_gate (
        .clk_in(rcc_ahb3bridge_d1_clk),
        .clk_en(rcc_dtcm2_bus_clk_en),
        .clk_out(rcc_dtcm2_hclk)
    );
  



  // dtcm1 bus clock ker clock enable
    assign rcc_dtcm1_bus_clk_en = ((~c1_sleep | rcc_c1_dtcm1_lpen)& ~c1_deepsleep) | (rcc_c2_dtcm1_en & (~c2_sleep | rcc_c2_dtcm1_lpen) & ~c2_deepsleep);
    // dtcm1 bus clock gate
    rcc_clk_gate_cell_sync rcc_dtcm1_hclk_gate (
        .clk_in(rcc_ahb3bridge_d1_clk),
        .clk_en(rcc_dtcm1_bus_clk_en),
        .clk_out(rcc_dtcm1_hclk)
    );
  



  // jpgdec bus clock ker clock enable
    assign rcc_jpgdec_bus_clk_en = (rcc_c1_jpgdec_en & (~c1_sleep | rcc_c1_jpgdec_lpen) & ~c1_deepsleep) | (rcc_c2_jpgdec_en & (~c2_sleep | rcc_c2_jpgdec_lpen) & ~c2_deepsleep);
    // jpgdec bus clock gate
    rcc_clk_gate_cell_sync rcc_jpgdec_hclk_gate (
        .clk_in(rcc_ahb3bridge_d1_clk),
        .clk_en(rcc_jpgdec_bus_clk_en),
        .clk_out(rcc_jpgdec_hclk)
    );
  



  // sdmmc1 bus clock ker clock enable
    assign rcc_sdmmc1_bus_clk_en = (rcc_c1_sdmmc1_en & (~c1_sleep | rcc_c1_sdmmc1_lpen) & ~c1_deepsleep) | (rcc_c2_sdmmc1_en & (~c2_sleep | rcc_c2_sdmmc1_lpen) & ~c2_deepsleep);
    // sdmmc1 ker clock enable logic
    assign rcc_sdmmc1_ker_clk_en = rcc_sdmmc1_bus_clk_en ;
    // sdmmc1 bus clock gate
    rcc_clk_gate_cell_sync rcc_sdmmc1_hclk_gate (
        .clk_in(rcc_ahb3bridge_d1_clk),
        .clk_en(rcc_sdmmc1_bus_clk_en),
        .clk_out(rcc_sdmmc1_hclk)
    );
    // sdmmc1 ker clock gate
    rcc_clk_gate_cell_sync rcc_sdmmc1_ker_clk_gate (
        .clk_in(rcc_sdmmcsel_clk),
        .clk_en(rcc_sdmmc1_ker_clk_en),
        .clk_out(rcc_sdmmc1_ker_clk)
    );
  



  // wwdg1 bus clock ker clock enable
    assign rcc_wwdg1_bus_clk_en = (rcc_c1_wwdg1_en & (~c1_sleep | rcc_c1_wwdg1_lpen) & ~c1_deepsleep) | (rcc_c2_wwdg1_en & (~c2_sleep | rcc_c2_wwdg1_lpen) & ~c2_deepsleep);
    // wwdg1 bus clock gate
    rcc_clk_gate_cell_sync rcc_wwdg1_pclk_gate (
        .clk_in(rcc_apb3bridge_d1_clk),
        .clk_en(rcc_wwdg1_bus_clk_en),
        .clk_out(rcc_wwdg1_pclk)
    );
  



  // usb2ulpi bus clock ker clock enable
    assign rcc_usb2ulpi_bus_clk_en = (rcc_c1_usb2ulpi_en & (~c1_sleep | rcc_c1_usb2ulpi_lpen) & ~c1_deepsleep) | (rcc_c2_usb2ulpi_en & (~c2_sleep | rcc_c2_usb2ulpi_lpen) & ~c2_deepsleep);
    // usb2ulpi bus clock gate
    rcc_clk_gate_cell_sync rcc_usb2ulpi_hclk_gate (
        .clk_in(rcc_ahb1bridge_d2_clk),
        .clk_en(rcc_usb2ulpi_bus_clk_en),
        .clk_out(rcc_usb2ulpi_hclk)
    );
  



  // usb2otg bus clock ker clock enable
    assign rcc_usb2otg_bus_clk_en = (rcc_c1_usb2otg_en & (~c1_sleep | rcc_c1_usb2otg_lpen) & ~c1_deepsleep) | (rcc_c2_usb2otg_en & (~c2_sleep | rcc_c2_usb2otg_lpen) & ~c2_deepsleep);
    // usb2otg ker clock enable logic
    assign rcc_usb2otg_ker_clk_en = rcc_usb2otg_bus_clk_en ;
    // usb2otg bus clock gate
    rcc_clk_gate_cell_sync rcc_usb2otg_hclk_gate (
        .clk_in(rcc_ahb1bridge_d2_clk),
        .clk_en(rcc_usb2otg_bus_clk_en),
        .clk_out(rcc_usb2otg_hclk)
    );
    // usb2otg ker clock gate
    rcc_clk_gate_cell_sync rcc_usb2otg_ker_clk_gate (
        .clk_in(rcc_usbsel_clk),
        .clk_en(rcc_usb2otg_ker_clk_en),
        .clk_out(rcc_usb2otg_ker_clk)
    );
  



  // usb1ulpi bus clock ker clock enable
    assign rcc_usb1ulpi_bus_clk_en = (rcc_c1_usb1ulpi_en & (~c1_sleep | rcc_c1_usb1ulpi_lpen) & ~c1_deepsleep) | (rcc_c2_usb1ulpi_en & (~c2_sleep | rcc_c2_usb1ulpi_lpen) & ~c2_deepsleep);
    // usb1ulpi ker clock enable logic
    assign rcc_usb1ulpi_ker_clk_en = rcc_usb1ulpi_bus_clk_en ;
    // usb1ulpi bus clock gate
    rcc_clk_gate_cell_sync rcc_usb1ulpi_hclk_gate (
        .clk_in(rcc_ahb1bridge_d2_clk),
        .clk_en(rcc_usb1ulpi_bus_clk_en),
        .clk_out(rcc_usb1ulpi_hclk)
    );
    // usb1ulpi ker clock gate
    rcc_clk_gate_cell_sync rcc_usb1ulpi_ker_clk_gate (
        .clk_in(USB_PHY1),
        .clk_en(rcc_usb1ulpi_ker_clk_en),
        .clk_out(rcc_usb1ulpi_ker_clk)
    );
  



  // usb1otg bus clock ker clock enable
    assign rcc_usb1otg_bus_clk_en = (rcc_c1_usb1otg_en & (~c1_sleep | rcc_c1_usb1otg_lpen) & ~c1_deepsleep) | (rcc_c2_usb1otg_en & (~c2_sleep | rcc_c2_usb1otg_lpen) & ~c2_deepsleep);
    // usb1otg ker clock enable logic
    assign rcc_usb1otg_ker_clk_en = rcc_usb1otg_bus_clk_en ;
    // usb1otg bus clock gate
    rcc_clk_gate_cell_sync rcc_usb1otg_hclk_gate (
        .clk_in(rcc_ahb1bridge_d2_clk),
        .clk_en(rcc_usb1otg_bus_clk_en),
        .clk_out(rcc_usb1otg_hclk)
    );
    // usb1otg ker clock gate
    rcc_clk_gate_cell_sync rcc_usb1otg_ker_clk_gate (
        .clk_in(rcc_usbsel_clk),
        .clk_en(rcc_usb1otg_ker_clk_en),
        .clk_out(rcc_usb1otg_ker_clk)
    );
  



  // eth1rx bus clock ker clock enable
    assign rcc_eth1rx_bus_clk_en = (rcc_c1_eth1rx_en & (~c1_sleep | rcc_c1_eth1rx_lpen) & ~c1_deepsleep) | (rcc_c2_eth1rx_en & (~c2_sleep | rcc_c2_eth1rx_lpen) & ~c2_deepsleep);
    // eth1rx bus clock gate
    rcc_clk_gate_cell_sync rcc_eth1rx_hclk_gate (
        .clk_in(rcc_ahb1bridge_d2_clk),
        .clk_en(rcc_eth1rx_bus_clk_en),
        .clk_out(rcc_eth1rx_hclk)
    );
  



  // eth1tx bus clock ker clock enable
    assign rcc_eth1tx_bus_clk_en = (rcc_c1_eth1tx_en & (~c1_sleep | rcc_c1_eth1tx_lpen) & ~c1_deepsleep) | (rcc_c2_eth1tx_en & (~c2_sleep | rcc_c2_eth1tx_lpen) & ~c2_deepsleep);
    // eth1tx bus clock gate
    rcc_clk_gate_cell_sync rcc_eth1tx_hclk_gate (
        .clk_in(rcc_ahb1bridge_d2_clk),
        .clk_en(rcc_eth1tx_bus_clk_en),
        .clk_out(rcc_eth1tx_hclk)
    );
  



  // eth1mac bus clock ker clock enable
    assign rcc_eth1mac_bus_clk_en = (rcc_c1_eth1mac_en & (~c1_sleep | rcc_c1_eth1mac_lpen) & ~c1_deepsleep) | (rcc_c2_eth1mac_en & (~c2_sleep | rcc_c2_eth1mac_lpen) & ~c2_deepsleep);
    // eth1mac bus clock gate
    rcc_clk_gate_cell_sync rcc_eth1mac_hclk_gate (
        .clk_in(rcc_ahb1bridge_d2_clk),
        .clk_en(rcc_eth1mac_bus_clk_en),
        .clk_out(rcc_eth1mac_hclk)
    );
  



  // adc12 bus clock ker clock enable
    assign rcc_adc12_bus_clk_en = (rcc_c1_adc12_en & (~c1_sleep | rcc_c1_adc12_lpen) & ~c1_deepsleep) | (rcc_c2_adc12_en & (~c2_sleep | rcc_c2_adc12_lpen) & ~c2_deepsleep);
    // adc12 ker clock enable logic
    assign rcc_adc12_ker_clk_en = rcc_adc12_bus_clk_en ;
    // adc12 bus clock gate
    rcc_clk_gate_cell_sync rcc_adc12_hclk_gate (
        .clk_in(rcc_ahb1bridge_d2_clk),
        .clk_en(rcc_adc12_bus_clk_en),
        .clk_out(rcc_adc12_hclk)
    );
    // adc12 ker clock gate
    rcc_clk_gate_cell_sync rcc_adc12_ker_clk_gate (
        .clk_in(rcc_adcsel_clk),
        .clk_en(rcc_adc12_ker_clk_en),
        .clk_out(rcc_adc12_ker_clk)
    );
  



  // dma2 bus clock ker clock enable
    assign rcc_dma2_bus_clk_en = (rcc_c1_dma2_en & (~c1_sleep | rcc_c1_dma2_lpen) & ~c1_deepsleep) | (rcc_c2_dma2_en & (~c2_sleep | rcc_c2_dma2_lpen) & ~c2_deepsleep);
    // dma2 bus clock gate
    rcc_clk_gate_cell_sync rcc_dma2_hclk_gate (
        .clk_in(rcc_ahb1bridge_d2_clk),
        .clk_en(rcc_dma2_bus_clk_en),
        .clk_out(rcc_dma2_hclk)
    );
  



  // dma1 bus clock ker clock enable
    assign rcc_dma1_bus_clk_en = (rcc_c1_dma1_en & (~c1_sleep | rcc_c1_dma1_lpen) & ~c1_deepsleep) | (rcc_c2_dma1_en & (~c2_sleep | rcc_c2_dma1_lpen) & ~c2_deepsleep);
    // dma1 bus clock gate
    rcc_clk_gate_cell_sync rcc_dma1_hclk_gate (
        .clk_in(rcc_ahb1bridge_d2_clk),
        .clk_en(rcc_dma1_bus_clk_en),
        .clk_out(rcc_dma1_hclk)
    );
  



  // sram3 bus clock ker clock enable
    assign rcc_sram3_bus_clk_en = (rcc_c1_sram3_en & (~c1_sleep | rcc_c1_sram3_lpen) & ~c1_deepsleep) | ((~c2_sleep | rcc_c2_sram3_lpen) & ~c2_deepsleep);
    // sram3 bus clock gate
    rcc_clk_gate_cell_sync rcc_sram3_hclk_gate (
        .clk_in(rcc_ahb2bridge_d2_clk),
        .clk_en(rcc_sram3_bus_clk_en),
        .clk_out(rcc_sram3_hclk)
    );
  



  // sram2 bus clock ker clock enable
    assign rcc_sram2_bus_clk_en = (rcc_c1_sram2_en & (~c1_sleep | rcc_c1_sram2_lpen) & ~c1_deepsleep) | ((~c2_sleep | rcc_c2_sram2_lpen) & ~c2_deepsleep);
    // sram2 bus clock gate
    rcc_clk_gate_cell_sync rcc_sram2_hclk_gate (
        .clk_in(rcc_ahb2bridge_d2_clk),
        .clk_en(rcc_sram2_bus_clk_en),
        .clk_out(rcc_sram2_hclk)
    );
  



  // sram1 bus clock ker clock enable
    assign rcc_sram1_bus_clk_en = (rcc_c1_sram1_en & (~c1_sleep | rcc_c1_sram1_lpen) & ~c1_deepsleep) | ((~c2_sleep | rcc_c2_sram1_lpen) & ~c2_deepsleep);
    // sram1 bus clock gate
    rcc_clk_gate_cell_sync rcc_sram1_hclk_gate (
        .clk_in(rcc_ahb2bridge_d2_clk),
        .clk_en(rcc_sram1_bus_clk_en),
        .clk_out(rcc_sram1_hclk)
    );
  



  // sdmmc2 bus clock ker clock enable
    assign rcc_sdmmc2_bus_clk_en = (rcc_c1_sdmmc2_en & (~c1_sleep | rcc_c1_sdmmc2_lpen) & ~c1_deepsleep) | (rcc_c2_sdmmc2_en & (~c2_sleep | rcc_c2_sdmmc2_lpen) & ~c2_deepsleep);
    // sdmmc2 ker clock enable logic
    assign rcc_sdmmc2_ker_clk_en = rcc_sdmmc2_bus_clk_en ;
    // sdmmc2 bus clock gate
    rcc_clk_gate_cell_sync rcc_sdmmc2_hclk_gate (
        .clk_in(rcc_ahb2bridge_d2_clk),
        .clk_en(rcc_sdmmc2_bus_clk_en),
        .clk_out(rcc_sdmmc2_hclk)
    );
    // sdmmc2 ker clock gate
    rcc_clk_gate_cell_sync rcc_sdmmc2_ker_clk_gate (
        .clk_in(rcc_sdmmcsel_clk),
        .clk_en(rcc_sdmmc2_ker_clk_en),
        .clk_out(rcc_sdmmc2_ker_clk)
    );
  



  // rng bus clock ker clock enable
    assign rcc_rng_bus_clk_en = (rcc_c1_rng_en & (~c1_sleep | rcc_c1_rng_lpen) & ~c1_deepsleep) | (rcc_c2_rng_en & (~c2_sleep | rcc_c2_rng_lpen) & ~c2_deepsleep);
    // rng ker clock enable logic
    assign rcc_rng_ker_clk_en = rcc_rng_bus_clk_en  | (((rcc_c1_rng_en & rcc_c1_rng_lpen)|(rcc_c2_rng_en & rcc_c2_rng_lpen)) & ((rngsel == 1) | (rngsel == 0)));
    // rng bus clock gate
    rcc_clk_gate_cell_sync rcc_rng_hclk_gate (
        .clk_in(rcc_ahb2bridge_d2_clk),
        .clk_en(rcc_rng_bus_clk_en),
        .clk_out(rcc_rng_hclk)
    );
    // rng ker clock gate
    rcc_clk_gate_cell_sync rcc_rng_ker_clk_gate (
        .clk_in(rcc_rngsel_clk),
        .clk_en(rcc_rng_ker_clk_en),
        .clk_out(rcc_rng_ker_clk)
    );
  



  // hash bus clock ker clock enable
    assign rcc_hash_bus_clk_en = (rcc_c1_hash_en & (~c1_sleep | rcc_c1_hash_lpen) & ~c1_deepsleep) | (rcc_c2_hash_en & (~c2_sleep | rcc_c2_hash_lpen) & ~c2_deepsleep);
    // hash bus clock gate
    rcc_clk_gate_cell_sync rcc_hash_hclk_gate (
        .clk_in(rcc_ahb2bridge_d2_clk),
        .clk_en(rcc_hash_bus_clk_en),
        .clk_out(rcc_hash_hclk)
    );
  



  // crypt bus clock ker clock enable
    assign rcc_crypt_bus_clk_en = (rcc_c1_crypt_en & (~c1_sleep | rcc_c1_crypt_lpen) & ~c1_deepsleep) | (rcc_c2_crypt_en & (~c2_sleep | rcc_c2_crypt_lpen) & ~c2_deepsleep);
    // crypt bus clock gate
    rcc_clk_gate_cell_sync rcc_crypt_hclk_gate (
        .clk_in(rcc_ahb2bridge_d2_clk),
        .clk_en(rcc_crypt_bus_clk_en),
        .clk_out(rcc_crypt_hclk)
    );
  



  // dcmi bus clock ker clock enable
    assign rcc_dcmi_bus_clk_en = (rcc_c1_dcmi_en & (~c1_sleep | rcc_c1_dcmi_lpen) & ~c1_deepsleep) | (rcc_c2_dcmi_en & (~c2_sleep | rcc_c2_dcmi_lpen) & ~c2_deepsleep);
    // dcmi bus clock gate
    rcc_clk_gate_cell_sync rcc_dcmi_hclk_gate (
        .clk_in(rcc_ahb2bridge_d2_clk),
        .clk_en(rcc_dcmi_bus_clk_en),
        .clk_out(rcc_dcmi_hclk)
    );
  



  // ramecc2 bus clock ker clock enable
    assign rcc_ramecc2_bus_clk_en = ~c1_deepsleep | ~c2_deepsleep;
    // ramecc2 bus clock gate
    rcc_clk_gate_cell_sync rcc_ramecc2_hclk_gate (
        .clk_in(rcc_ahb2bridge_d2_clk),
        .clk_en(rcc_ramecc2_bus_clk_en),
        .clk_out(rcc_ramecc2_hclk)
    );
  



  // uart8 bus clock ker clock enable
    assign rcc_uart8_bus_clk_en = (rcc_c1_uart8_en & (~c1_sleep | rcc_c1_uart8_lpen) & ~c1_deepsleep) | (rcc_c2_uart8_en & (~c2_sleep | rcc_c2_uart8_lpen) & ~c2_deepsleep);
    // uart8 ker clock enable logic
    assign rcc_uart8_ker_clk_en = rcc_uart8_bus_clk_en  | (((rcc_c1_uart8_en & rcc_c1_uart8_lpen)|(rcc_c2_uart8_en & rcc_c2_uart8_lpen)) & ((usart234578sel == 0) | (usart234578sel == 2 & uart8_ker_clk_req) | (usart234578sel == 1 & uart8_ker_clk_req)));
    // uart8 bus clock gate
    rcc_clk_gate_cell_sync rcc_uart8_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_uart8_bus_clk_en),
        .clk_out(rcc_uart8_pclk)
    );
    // uart8 ker clock gate
    rcc_clk_gate_cell_sync rcc_uart8_ker_clk_gate (
        .clk_in(rcc_usart234578sel_clk),
        .clk_en(rcc_uart8_ker_clk_en),
        .clk_out(rcc_uart8_ker_clk)
    );
  



  // uart7 bus clock ker clock enable
    assign rcc_uart7_bus_clk_en = (rcc_c1_uart7_en & (~c1_sleep | rcc_c1_uart7_lpen) & ~c1_deepsleep) | (rcc_c2_uart7_en & (~c2_sleep | rcc_c2_uart7_lpen) & ~c2_deepsleep);
    // uart7 ker clock enable logic
    assign rcc_uart7_ker_clk_en = rcc_uart7_bus_clk_en  | (((rcc_c1_uart7_en & rcc_c1_uart7_lpen)|(rcc_c2_uart7_en & rcc_c2_uart7_lpen)) & ((usart234578sel == 0) | (usart234578sel == 2 & uart7_ker_clk_req) | (usart234578sel == 1 & uart7_ker_clk_req)));
    // uart7 bus clock gate
    rcc_clk_gate_cell_sync rcc_uart7_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_uart7_bus_clk_en),
        .clk_out(rcc_uart7_pclk)
    );
    // uart7 ker clock gate
    rcc_clk_gate_cell_sync rcc_uart7_ker_clk_gate (
        .clk_in(rcc_usart234578sel_clk),
        .clk_en(rcc_uart7_ker_clk_en),
        .clk_out(rcc_uart7_ker_clk)
    );
  



  // dac12 bus clock ker clock enable
    assign rcc_dac12_bus_clk_en = (rcc_c1_dac12_en & (~c1_sleep | rcc_c1_dac12_lpen) & ~c1_deepsleep) | (rcc_c2_dac12_en & (~c2_sleep | rcc_c2_dac12_lpen) & ~c2_deepsleep);
    // dac12 bus clock gate
    rcc_clk_gate_cell_sync rcc_dac12_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_dac12_bus_clk_en),
        .clk_out(rcc_dac12_pclk)
    );
  



  // hdmicec bus clock ker clock enable
    assign rcc_hdmicec_bus_clk_en = (rcc_c1_hdmicec_en & (~c1_sleep | rcc_c1_hdmicec_lpen) & ~c1_deepsleep) | (rcc_c2_hdmicec_en & (~c2_sleep | rcc_c2_hdmicec_lpen) & ~c2_deepsleep);
    // hdmicec ker clock enable logic
    assign rcc_hdmicec_ker_clk_en = rcc_hdmicec_bus_clk_en  | (((rcc_c1_hdmicec_en & rcc_c1_hdmicec_lpen)|(rcc_c2_hdmicec_en & rcc_c2_hdmicec_lpen)) & ((cecsel == 2) | (cecsel == 1)));
    // hdmicec bus clock gate
    rcc_clk_gate_cell_sync rcc_hdmicec_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_hdmicec_bus_clk_en),
        .clk_out(rcc_hdmicec_pclk)
    );
    // hdmicec ker clock gate
    rcc_clk_gate_cell_sync rcc_hdmicec_ker_clk_gate (
        .clk_in(rcc_cecsel_clk),
        .clk_en(rcc_hdmicec_ker_clk_en),
        .clk_out(rcc_hdmicec_ker_clk)
    );
  



  // i2c3 bus clock ker clock enable
    assign rcc_i2c3_bus_clk_en = (rcc_c1_i2c3_en & (~c1_sleep | rcc_c1_i2c3_lpen) & ~c1_deepsleep) | (rcc_c2_i2c3_en & (~c2_sleep | rcc_c2_i2c3_lpen) & ~c2_deepsleep);
    // i2c3 ker clock enable logic
    assign rcc_i2c3_ker_clk_en = rcc_i2c3_bus_clk_en  | (((rcc_c1_i2c3_en & rcc_c1_i2c3_lpen)|(rcc_c2_i2c3_en & rcc_c2_i2c3_lpen)) & ((i2c123sel == 1 & i2c3_ker_clk_req) | (i2c123sel == 0 & i2c3_ker_clk_req)));
    // i2c3 bus clock gate
    rcc_clk_gate_cell_sync rcc_i2c3_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_i2c3_bus_clk_en),
        .clk_out(rcc_i2c3_pclk)
    );
    // i2c3 ker clock gate
    rcc_clk_gate_cell_sync rcc_i2c3_ker_clk_gate (
        .clk_in(rcc_i2c123sel_clk),
        .clk_en(rcc_i2c3_ker_clk_en),
        .clk_out(rcc_i2c3_ker_clk)
    );
  



  // i2c2 bus clock ker clock enable
    assign rcc_i2c2_bus_clk_en = (rcc_c1_i2c2_en & (~c1_sleep | rcc_c1_i2c2_lpen) & ~c1_deepsleep) | (rcc_c2_i2c2_en & (~c2_sleep | rcc_c2_i2c2_lpen) & ~c2_deepsleep);
    // i2c2 ker clock enable logic
    assign rcc_i2c2_ker_clk_en = rcc_i2c2_bus_clk_en  | (((rcc_c1_i2c2_en & rcc_c1_i2c2_lpen)|(rcc_c2_i2c2_en & rcc_c2_i2c2_lpen)) & ((i2c123sel == 1 & i2c2_ker_clk_req) | (i2c123sel == 0 & i2c2_ker_clk_req)));
    // i2c2 bus clock gate
    rcc_clk_gate_cell_sync rcc_i2c2_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_i2c2_bus_clk_en),
        .clk_out(rcc_i2c2_pclk)
    );
    // i2c2 ker clock gate
    rcc_clk_gate_cell_sync rcc_i2c2_ker_clk_gate (
        .clk_in(rcc_i2c123sel_clk),
        .clk_en(rcc_i2c2_ker_clk_en),
        .clk_out(rcc_i2c2_ker_clk)
    );
  



  // i2c1 bus clock ker clock enable
    assign rcc_i2c1_bus_clk_en = (rcc_c1_i2c1_en & (~c1_sleep | rcc_c1_i2c1_lpen) & ~c1_deepsleep) | (rcc_c2_i2c1_en & (~c2_sleep | rcc_c2_i2c1_lpen) & ~c2_deepsleep);
    // i2c1 ker clock enable logic
    assign rcc_i2c1_ker_clk_en = rcc_i2c1_bus_clk_en  | (((rcc_c1_i2c1_en & rcc_c1_i2c1_lpen)|(rcc_c2_i2c1_en & rcc_c2_i2c1_lpen)) & ((i2c123sel == 1 & i2c1_ker_clk_req) | (i2c123sel == 0 & i2c1_ker_clk_req)));
    // i2c1 bus clock gate
    rcc_clk_gate_cell_sync rcc_i2c1_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_i2c1_bus_clk_en),
        .clk_out(rcc_i2c1_pclk)
    );
    // i2c1 ker clock gate
    rcc_clk_gate_cell_sync rcc_i2c1_ker_clk_gate (
        .clk_in(rcc_i2c123sel_clk),
        .clk_en(rcc_i2c1_ker_clk_en),
        .clk_out(rcc_i2c1_ker_clk)
    );
  



  // uart5 bus clock ker clock enable
    assign rcc_uart5_bus_clk_en = (rcc_c1_uart5_en & (~c1_sleep | rcc_c1_uart5_lpen) & ~c1_deepsleep) | (rcc_c2_uart5_en & (~c2_sleep | rcc_c2_uart5_lpen) & ~c2_deepsleep);
    // uart5 ker clock enable logic
    assign rcc_uart5_ker_clk_en = rcc_uart5_bus_clk_en  | (((rcc_c1_uart5_en & rcc_c1_uart5_lpen)|(rcc_c2_uart5_en & rcc_c2_uart5_lpen)) & ((usart234578sel == 0) | (usart234578sel == 2 & uart5_ker_clk_req) | (usart234578sel == 1 & uart5_ker_clk_req)));
    // uart5 bus clock gate
    rcc_clk_gate_cell_sync rcc_uart5_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_uart5_bus_clk_en),
        .clk_out(rcc_uart5_pclk)
    );
    // uart5 ker clock gate
    rcc_clk_gate_cell_sync rcc_uart5_ker_clk_gate (
        .clk_in(rcc_usart234578sel_clk),
        .clk_en(rcc_uart5_ker_clk_en),
        .clk_out(rcc_uart5_ker_clk)
    );
  



  // uart4 bus clock ker clock enable
    assign rcc_uart4_bus_clk_en = (rcc_c1_uart4_en & (~c1_sleep | rcc_c1_uart4_lpen) & ~c1_deepsleep) | (rcc_c2_uart4_en & (~c2_sleep | rcc_c2_uart4_lpen) & ~c2_deepsleep);
    // uart4 ker clock enable logic
    assign rcc_uart4_ker_clk_en = rcc_uart4_bus_clk_en  | (((rcc_c1_uart4_en & rcc_c1_uart4_lpen)|(rcc_c2_uart4_en & rcc_c2_uart4_lpen)) & ((usart234578sel == 0) | (usart234578sel == 2 & uart4_ker_clk_req) | (usart234578sel == 1 & uart4_ker_clk_req)));
    // uart4 bus clock gate
    rcc_clk_gate_cell_sync rcc_uart4_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_uart4_bus_clk_en),
        .clk_out(rcc_uart4_pclk)
    );
    // uart4 ker clock gate
    rcc_clk_gate_cell_sync rcc_uart4_ker_clk_gate (
        .clk_in(rcc_usart234578sel_clk),
        .clk_en(rcc_uart4_ker_clk_en),
        .clk_out(rcc_uart4_ker_clk)
    );
  



  // usart3 bus clock ker clock enable
    assign rcc_usart3_bus_clk_en = (rcc_c1_usart3_en & (~c1_sleep | rcc_c1_usart3_lpen) & ~c1_deepsleep) | (rcc_c2_usart3_en & (~c2_sleep | rcc_c2_usart3_lpen) & ~c2_deepsleep);
    // usart3 ker clock enable logic
    assign rcc_usart3_ker_clk_en = rcc_usart3_bus_clk_en  | (((rcc_c1_usart3_en & rcc_c1_usart3_lpen)|(rcc_c2_usart3_en & rcc_c2_usart3_lpen)) & ((usart234578sel == 0) | (usart234578sel == 2 & usart3_ker_clk_req) | (usart234578sel == 1 & usart3_ker_clk_req)));
    // usart3 bus clock gate
    rcc_clk_gate_cell_sync rcc_usart3_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_usart3_bus_clk_en),
        .clk_out(rcc_usart3_pclk)
    );
    // usart3 ker clock gate
    rcc_clk_gate_cell_sync rcc_usart3_ker_clk_gate (
        .clk_in(rcc_usart234578sel_clk),
        .clk_en(rcc_usart3_ker_clk_en),
        .clk_out(rcc_usart3_ker_clk)
    );
  



  // usart2 bus clock ker clock enable
    assign rcc_usart2_bus_clk_en = (rcc_c1_usart2_en & (~c1_sleep | rcc_c1_usart2_lpen) & ~c1_deepsleep) | (rcc_c2_usart2_en & (~c2_sleep | rcc_c2_usart2_lpen) & ~c2_deepsleep);
    // usart2 ker clock enable logic
    assign rcc_usart2_ker_clk_en = rcc_usart2_bus_clk_en  | (((rcc_c1_usart2_en & rcc_c1_usart2_lpen)|(rcc_c2_usart2_en & rcc_c2_usart2_lpen)) & ((usart234578sel == 0) | (usart234578sel == 2 & usart2_ker_clk_req) | (usart234578sel == 1 & usart2_ker_clk_req)));
    // usart2 bus clock gate
    rcc_clk_gate_cell_sync rcc_usart2_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_usart2_bus_clk_en),
        .clk_out(rcc_usart2_pclk)
    );
    // usart2 ker clock gate
    rcc_clk_gate_cell_sync rcc_usart2_ker_clk_gate (
        .clk_in(rcc_usart234578sel_clk),
        .clk_en(rcc_usart2_ker_clk_en),
        .clk_out(rcc_usart2_ker_clk)
    );
  



  // spdifrx bus clock ker clock enable
    assign rcc_spdifrx_bus_clk_en = (rcc_c1_spdifrx_en & (~c1_sleep | rcc_c1_spdifrx_lpen) & ~c1_deepsleep) | (rcc_c2_spdifrx_en & (~c2_sleep | rcc_c2_spdifrx_lpen) & ~c2_deepsleep);
    // spdifrx ker clock enable logic
    assign rcc_spdifrx_ker_clk_en = rcc_spdifrx_bus_clk_en ;
    // spdifrx bus clock gate
    rcc_clk_gate_cell_sync rcc_spdifrx_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_spdifrx_bus_clk_en),
        .clk_out(rcc_spdifrx_pclk)
    );
    // spdifrx ker clock gate
    rcc_clk_gate_cell_sync rcc_spdifrx_ker_clk_gate (
        .clk_in(rcc_spdifsel_clk),
        .clk_en(rcc_spdifrx_ker_clk_en),
        .clk_out(rcc_spdifrx_ker_clk)
    );
  



  // spi3 bus clock ker clock enable
    assign rcc_spi3_bus_clk_en = (rcc_c1_spi3_en & (~c1_sleep | rcc_c1_spi3_lpen) & ~c1_deepsleep) | (rcc_c2_spi3_en & (~c2_sleep | rcc_c2_spi3_lpen) & ~c2_deepsleep);
    // spi3 ker clock enable logic
    assign rcc_spi3_ker_clk_en = rcc_spi3_bus_clk_en ;
    // spi3 bus clock gate
    rcc_clk_gate_cell_sync rcc_spi3_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_spi3_bus_clk_en),
        .clk_out(rcc_spi3_pclk)
    );
    // spi3 ker clock gate
    rcc_clk_gate_cell_sync rcc_spi3_ker_clk_gate (
        .clk_in(rcc_spi123sel_clk),
        .clk_en(rcc_spi3_ker_clk_en),
        .clk_out(rcc_spi3_ker_clk)
    );
  



  // spi2 bus clock ker clock enable
    assign rcc_spi2_bus_clk_en = (rcc_c1_spi2_en & (~c1_sleep | rcc_c1_spi2_lpen) & ~c1_deepsleep) | (rcc_c2_spi2_en & (~c2_sleep | rcc_c2_spi2_lpen) & ~c2_deepsleep);
    // spi2 ker clock enable logic
    assign rcc_spi2_ker_clk_en = rcc_spi2_bus_clk_en ;
    // spi2 bus clock gate
    rcc_clk_gate_cell_sync rcc_spi2_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_spi2_bus_clk_en),
        .clk_out(rcc_spi2_pclk)
    );
    // spi2 ker clock gate
    rcc_clk_gate_cell_sync rcc_spi2_ker_clk_gate (
        .clk_in(rcc_spi123sel_clk),
        .clk_en(rcc_spi2_ker_clk_en),
        .clk_out(rcc_spi2_ker_clk)
    );
  



  // wwdg2 bus clock ker clock enable
    assign rcc_wwdg2_bus_clk_en = (rcc_c1_wwdg2_en & (~c1_sleep | rcc_c1_wwdg2_lpen) & ~c1_deepsleep) | (rcc_c2_wwdg2_en & (~c2_sleep | rcc_c2_wwdg2_lpen) & ~c2_deepsleep);
    // wwdg2 bus clock gate
    rcc_clk_gate_cell_sync rcc_wwdg2_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_wwdg2_bus_clk_en),
        .clk_out(rcc_wwdg2_pclk)
    );
  



  // lptim1 bus clock ker clock enable
    assign rcc_lptim1_bus_clk_en = (rcc_c1_lptim1_en & (~c1_sleep | rcc_c1_lptim1_lpen) & ~c1_deepsleep) | (rcc_c2_lptim1_en & (~c2_sleep | rcc_c2_lptim1_lpen) & ~c2_deepsleep);
    // lptim1 ker clock enable logic
    assign rcc_lptim1_ker_clk_en = rcc_lptim1_bus_clk_en  | (((rcc_c1_lptim1_en & rcc_c1_lptim1_lpen)|(rcc_c2_lptim1_en & rcc_c2_lptim1_lpen)) & ((lptim1sel == 2) | (lptim1sel == 1)));
    // lptim1 bus clock gate
    rcc_clk_gate_cell_sync rcc_lptim1_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_lptim1_bus_clk_en),
        .clk_out(rcc_lptim1_pclk)
    );
    // lptim1 ker clock gate
    rcc_clk_gate_cell_sync rcc_lptim1_ker_clk_gate (
        .clk_in(rcc_lptim1sel_clk),
        .clk_en(rcc_lptim1_ker_clk_en),
        .clk_out(rcc_lptim1_ker_clk)
    );
  



  // tim14 bus clock ker clock enable
    assign rcc_tim14_bus_clk_en = (rcc_c1_tim14_en & (~c1_sleep | rcc_c1_tim14_lpen) & ~c1_deepsleep) | (rcc_c2_tim14_en & (~c2_sleep | rcc_c2_tim14_lpen) & ~c2_deepsleep);
    // tim14 ker clock enable logic
    assign rcc_tim14_ker_clk_en = rcc_tim14_bus_clk_en ;
    // tim14 bus clock gate
    rcc_clk_gate_cell_sync rcc_tim14_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_tim14_bus_clk_en),
        .clk_out(rcc_tim14_pclk)
    );
    // tim14 ker clock gate
    rcc_clk_gate_cell_sync rcc_tim14_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_tim14_ker_clk_en),
        .clk_out(rcc_tim14_ker_clk)
    );
  



  // tim13 bus clock ker clock enable
    assign rcc_tim13_bus_clk_en = (rcc_c1_tim13_en & (~c1_sleep | rcc_c1_tim13_lpen) & ~c1_deepsleep) | (rcc_c2_tim13_en & (~c2_sleep | rcc_c2_tim13_lpen) & ~c2_deepsleep);
    // tim13 ker clock enable logic
    assign rcc_tim13_ker_clk_en = rcc_tim13_bus_clk_en ;
    // tim13 bus clock gate
    rcc_clk_gate_cell_sync rcc_tim13_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_tim13_bus_clk_en),
        .clk_out(rcc_tim13_pclk)
    );
    // tim13 ker clock gate
    rcc_clk_gate_cell_sync rcc_tim13_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_tim13_ker_clk_en),
        .clk_out(rcc_tim13_ker_clk)
    );
  



  // tim12 bus clock ker clock enable
    assign rcc_tim12_bus_clk_en = (rcc_c1_tim12_en & (~c1_sleep | rcc_c1_tim12_lpen) & ~c1_deepsleep) | (rcc_c2_tim12_en & (~c2_sleep | rcc_c2_tim12_lpen) & ~c2_deepsleep);
    // tim12 ker clock enable logic
    assign rcc_tim12_ker_clk_en = rcc_tim12_bus_clk_en ;
    // tim12 bus clock gate
    rcc_clk_gate_cell_sync rcc_tim12_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_tim12_bus_clk_en),
        .clk_out(rcc_tim12_pclk)
    );
    // tim12 ker clock gate
    rcc_clk_gate_cell_sync rcc_tim12_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_tim12_ker_clk_en),
        .clk_out(rcc_tim12_ker_clk)
    );
  



  // tim7 bus clock ker clock enable
    assign rcc_tim7_bus_clk_en = (rcc_c1_tim7_en & (~c1_sleep | rcc_c1_tim7_lpen) & ~c1_deepsleep) | (rcc_c2_tim7_en & (~c2_sleep | rcc_c2_tim7_lpen) & ~c2_deepsleep);
    // tim7 ker clock enable logic
    assign rcc_tim7_ker_clk_en = rcc_tim7_bus_clk_en ;
    // tim7 bus clock gate
    rcc_clk_gate_cell_sync rcc_tim7_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_tim7_bus_clk_en),
        .clk_out(rcc_tim7_pclk)
    );
    // tim7 ker clock gate
    rcc_clk_gate_cell_sync rcc_tim7_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_tim7_ker_clk_en),
        .clk_out(rcc_tim7_ker_clk)
    );
  



  // tim6 bus clock ker clock enable
    assign rcc_tim6_bus_clk_en = (rcc_c1_tim6_en & (~c1_sleep | rcc_c1_tim6_lpen) & ~c1_deepsleep) | (rcc_c2_tim6_en & (~c2_sleep | rcc_c2_tim6_lpen) & ~c2_deepsleep);
    // tim6 ker clock enable logic
    assign rcc_tim6_ker_clk_en = rcc_tim6_bus_clk_en ;
    // tim6 bus clock gate
    rcc_clk_gate_cell_sync rcc_tim6_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_tim6_bus_clk_en),
        .clk_out(rcc_tim6_pclk)
    );
    // tim6 ker clock gate
    rcc_clk_gate_cell_sync rcc_tim6_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_tim6_ker_clk_en),
        .clk_out(rcc_tim6_ker_clk)
    );
  



  // tim5 bus clock ker clock enable
    assign rcc_tim5_bus_clk_en = (rcc_c1_tim5_en & (~c1_sleep | rcc_c1_tim5_lpen) & ~c1_deepsleep) | (rcc_c2_tim5_en & (~c2_sleep | rcc_c2_tim5_lpen) & ~c2_deepsleep);
    // tim5 ker clock enable logic
    assign rcc_tim5_ker_clk_en = rcc_tim5_bus_clk_en ;
    // tim5 bus clock gate
    rcc_clk_gate_cell_sync rcc_tim5_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_tim5_bus_clk_en),
        .clk_out(rcc_tim5_pclk)
    );
    // tim5 ker clock gate
    rcc_clk_gate_cell_sync rcc_tim5_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_tim5_ker_clk_en),
        .clk_out(rcc_tim5_ker_clk)
    );
  



  // tim4 bus clock ker clock enable
    assign rcc_tim4_bus_clk_en = (rcc_c1_tim4_en & (~c1_sleep | rcc_c1_tim4_lpen) & ~c1_deepsleep) | (rcc_c2_tim4_en & (~c2_sleep | rcc_c2_tim4_lpen) & ~c2_deepsleep);
    // tim4 ker clock enable logic
    assign rcc_tim4_ker_clk_en = rcc_tim4_bus_clk_en ;
    // tim4 bus clock gate
    rcc_clk_gate_cell_sync rcc_tim4_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_tim4_bus_clk_en),
        .clk_out(rcc_tim4_pclk)
    );
    // tim4 ker clock gate
    rcc_clk_gate_cell_sync rcc_tim4_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_tim4_ker_clk_en),
        .clk_out(rcc_tim4_ker_clk)
    );
  



  // tim3 bus clock ker clock enable
    assign rcc_tim3_bus_clk_en = (rcc_c1_tim3_en & (~c1_sleep | rcc_c1_tim3_lpen) & ~c1_deepsleep) | (rcc_c2_tim3_en & (~c2_sleep | rcc_c2_tim3_lpen) & ~c2_deepsleep);
    // tim3 ker clock enable logic
    assign rcc_tim3_ker_clk_en = rcc_tim3_bus_clk_en ;
    // tim3 bus clock gate
    rcc_clk_gate_cell_sync rcc_tim3_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_tim3_bus_clk_en),
        .clk_out(rcc_tim3_pclk)
    );
    // tim3 ker clock gate
    rcc_clk_gate_cell_sync rcc_tim3_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_tim3_ker_clk_en),
        .clk_out(rcc_tim3_ker_clk)
    );
  



  // tim2 bus clock ker clock enable
    assign rcc_tim2_bus_clk_en = (rcc_c1_tim2_en & (~c1_sleep | rcc_c1_tim2_lpen) & ~c1_deepsleep) | (rcc_c2_tim2_en & (~c2_sleep | rcc_c2_tim2_lpen) & ~c2_deepsleep);
    // tim2 ker clock enable logic
    assign rcc_tim2_ker_clk_en = rcc_tim2_bus_clk_en ;
    // tim2 bus clock gate
    rcc_clk_gate_cell_sync rcc_tim2_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_tim2_bus_clk_en),
        .clk_out(rcc_tim2_pclk)
    );
    // tim2 ker clock gate
    rcc_clk_gate_cell_sync rcc_tim2_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_tim2_ker_clk_en),
        .clk_out(rcc_tim2_ker_clk)
    );
  



  // fdcan bus clock ker clock enable
    assign rcc_fdcan_bus_clk_en = (rcc_c1_fdcan_en & (~c1_sleep | rcc_c1_fdcan_lpen) & ~c1_deepsleep) | (rcc_c2_fdcan_en & (~c2_sleep | rcc_c2_fdcan_lpen) & ~c2_deepsleep);
    // fdcan ker clock enable logic
    assign rcc_fdcan_ker_clk_en = rcc_fdcan_bus_clk_en ;
    // fdcan bus clock gate
    rcc_clk_gate_cell_sync rcc_fdcan_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_fdcan_bus_clk_en),
        .clk_out(rcc_fdcan_pclk)
    );
    // fdcan ker clock gate
    rcc_clk_gate_cell_sync rcc_fdcan_ker_clk_gate (
        .clk_in(rcc_fdcansel_clk),
        .clk_en(rcc_fdcan_ker_clk_en),
        .clk_out(rcc_fdcan_ker_clk)
    );
  



  // mdios bus clock ker clock enable
    assign rcc_mdios_bus_clk_en = (rcc_c1_mdios_en & (~c1_sleep | rcc_c1_mdios_lpen) & ~c1_deepsleep) | (rcc_c2_mdios_en & (~c2_sleep | rcc_c2_mdios_lpen) & ~c2_deepsleep);
    // mdios bus clock gate
    rcc_clk_gate_cell_sync rcc_mdios_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_mdios_bus_clk_en),
        .clk_out(rcc_mdios_pclk)
    );
  



  // opamp bus clock ker clock enable
    assign rcc_opamp_bus_clk_en = (rcc_c1_opamp_en & (~c1_sleep | rcc_c1_opamp_lpen) & ~c1_deepsleep) | (rcc_c2_opamp_en & (~c2_sleep | rcc_c2_opamp_lpen) & ~c2_deepsleep);
    // opamp bus clock gate
    rcc_clk_gate_cell_sync rcc_opamp_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_opamp_bus_clk_en),
        .clk_out(rcc_opamp_pclk)
    );
  



  // swpmi bus clock ker clock enable
    assign rcc_swpmi_bus_clk_en = (rcc_c1_swpmi_en & (~c1_sleep | rcc_c1_swpmi_lpen) & ~c1_deepsleep) | (rcc_c2_swpmi_en & (~c2_sleep | rcc_c2_swpmi_lpen) & ~c2_deepsleep);
    // swpmi ker clock enable logic
    assign rcc_swpmi_ker_clk_en = rcc_swpmi_bus_clk_en ;
    // swpmi bus clock gate
    rcc_clk_gate_cell_sync rcc_swpmi_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_swpmi_bus_clk_en),
        .clk_out(rcc_swpmi_pclk)
    );
    // swpmi ker clock gate
    rcc_clk_gate_cell_sync rcc_swpmi_ker_clk_gate (
        .clk_in(rcc_swpsel_clk),
        .clk_en(rcc_swpmi_ker_clk_en),
        .clk_out(rcc_swpmi_ker_clk)
    );
  



  // crs bus clock ker clock enable
    assign rcc_crs_bus_clk_en = (rcc_c1_crs_en & (~c1_sleep | rcc_c1_crs_lpen) & ~c1_deepsleep) | (rcc_c2_crs_en & (~c2_sleep | rcc_c2_crs_lpen) & ~c2_deepsleep);
    // crs bus clock gate
    rcc_clk_gate_cell_sync rcc_crs_pclk_gate (
        .clk_in(rcc_apb1bridge_d2_clk),
        .clk_en(rcc_crs_bus_clk_en),
        .clk_out(rcc_crs_pclk)
    );
  



  // hrtim bus clock ker clock enable
    assign rcc_hrtim_bus_clk_en = (rcc_c1_hrtim_en & (~c1_sleep | rcc_c1_hrtim_lpen) & ~c1_deepsleep) | (rcc_c2_hrtim_en & (~c2_sleep | rcc_c2_hrtim_lpen) & ~c2_deepsleep);
    // hrtim ker clock enable logic
    assign rcc_hrtim_ker_clk_en = rcc_hrtim_bus_clk_en ;
    // hrtim bus clock gate
    rcc_clk_gate_cell_sync rcc_hrtim_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_hrtim_bus_clk_en),
        .clk_out(rcc_hrtim_pclk)
    );
    // hrtim ker clock gate
    rcc_clk_gate_cell_sync rcc_hrtim_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_hrtim_ker_clk_en),
        .clk_out(rcc_hrtim_ker_clk)
    );
  



  // dfsdm1 bus clock ker clock enable
    assign rcc_dfsdm1_bus_clk_en = (rcc_c1_dfsdm1_en & (~c1_sleep | rcc_c1_dfsdm1_lpen) & ~c1_deepsleep) | (rcc_c2_dfsdm1_en & (~c2_sleep | rcc_c2_dfsdm1_lpen) & ~c2_deepsleep);
    // dfsdm1 ker clock enable logic
    assign rcc_dfsdm1_ker_clk_en_0 = rcc_dfsdm1_bus_clk_en ;
    assign rcc_dfsdm1_ker_clk_en_1 = rcc_dfsdm1_bus_clk_en ;
    // dfsdm1 bus clock gate
    rcc_clk_gate_cell_sync rcc_dfsdm1_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_dfsdm1_bus_clk_en),
        .clk_out(rcc_dfsdm1_pclk)
    );
    // dfsdm1 ker clock gate
    rcc_clk_gate_cell_sync rcc_dfsdm1_ker_clk_gate_0 (
        .clk_in(rcc_sai1sel_clk),
        .clk_en(rcc_dfsdm1_ker_clk_en_0),
        .clk_out(rcc_dfsdm1_ker_clk_0)
    );
    rcc_clk_gate_cell_sync rcc_dfsdm1_ker_clk_gate_1 (
        .clk_in(rcc_dfsdm1sel_clk),
        .clk_en(rcc_dfsdm1_ker_clk_en_1),
        .clk_out(rcc_dfsdm1_ker_clk_1)
    );
  



  // sai3 bus clock ker clock enable
    assign rcc_sai3_bus_clk_en = (rcc_c1_sai3_en & (~c1_sleep | rcc_c1_sai3_lpen) & ~c1_deepsleep) | (rcc_c2_sai3_en & (~c2_sleep | rcc_c2_sai3_lpen) & ~c2_deepsleep);
    // sai3 ker clock enable logic
    assign rcc_sai3_ker_clk_en = rcc_sai3_bus_clk_en ;
    // sai3 bus clock gate
    rcc_clk_gate_cell_sync rcc_sai3_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_sai3_bus_clk_en),
        .clk_out(rcc_sai3_pclk)
    );
    // sai3 ker clock gate
    rcc_clk_gate_cell_sync rcc_sai3_ker_clk_gate (
        .clk_in(rcc_sai23sel_clk),
        .clk_en(rcc_sai3_ker_clk_en),
        .clk_out(rcc_sai3_ker_clk)
    );
  



  // sai2 bus clock ker clock enable
    assign rcc_sai2_bus_clk_en = (rcc_c1_sai2_en & (~c1_sleep | rcc_c1_sai2_lpen) & ~c1_deepsleep) | (rcc_c2_sai2_en & (~c2_sleep | rcc_c2_sai2_lpen) & ~c2_deepsleep);
    // sai2 ker clock enable logic
    assign rcc_sai2_ker_clk_en = rcc_sai2_bus_clk_en ;
    // sai2 bus clock gate
    rcc_clk_gate_cell_sync rcc_sai2_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_sai2_bus_clk_en),
        .clk_out(rcc_sai2_pclk)
    );
    // sai2 ker clock gate
    rcc_clk_gate_cell_sync rcc_sai2_ker_clk_gate (
        .clk_in(rcc_sai23sel_clk),
        .clk_en(rcc_sai2_ker_clk_en),
        .clk_out(rcc_sai2_ker_clk)
    );
  



  // sai1 bus clock ker clock enable
    assign rcc_sai1_bus_clk_en = (rcc_c1_sai1_en & (~c1_sleep | rcc_c1_sai1_lpen) & ~c1_deepsleep) | (rcc_c2_sai1_en & (~c2_sleep | rcc_c2_sai1_lpen) & ~c2_deepsleep);
    // sai1 ker clock enable logic
    assign rcc_sai1_ker_clk_en = rcc_sai1_bus_clk_en ;
    // sai1 bus clock gate
    rcc_clk_gate_cell_sync rcc_sai1_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_sai1_bus_clk_en),
        .clk_out(rcc_sai1_pclk)
    );
    // sai1 ker clock gate
    rcc_clk_gate_cell_sync rcc_sai1_ker_clk_gate (
        .clk_in(rcc_sai1sel_clk),
        .clk_en(rcc_sai1_ker_clk_en),
        .clk_out(rcc_sai1_ker_clk)
    );
  



  // spi5 bus clock ker clock enable
    assign rcc_spi5_bus_clk_en = (rcc_c1_spi5_en & (~c1_sleep | rcc_c1_spi5_lpen) & ~c1_deepsleep) | (rcc_c2_spi5_en & (~c2_sleep | rcc_c2_spi5_lpen) & ~c2_deepsleep);
    // spi5 ker clock enable logic
    assign rcc_spi5_ker_clk_en = rcc_spi5_bus_clk_en ;
    // spi5 bus clock gate
    rcc_clk_gate_cell_sync rcc_spi5_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_spi5_bus_clk_en),
        .clk_out(rcc_spi5_pclk)
    );
    // spi5 ker clock gate
    rcc_clk_gate_cell_sync rcc_spi5_ker_clk_gate (
        .clk_in(rcc_spi45sel_clk),
        .clk_en(rcc_spi5_ker_clk_en),
        .clk_out(rcc_spi5_ker_clk)
    );
  



  // tim17 bus clock ker clock enable
    assign rcc_tim17_bus_clk_en = (rcc_c1_tim17_en & (~c1_sleep | rcc_c1_tim17_lpen) & ~c1_deepsleep) | (rcc_c2_tim17_en & (~c2_sleep | rcc_c2_tim17_lpen) & ~c2_deepsleep);
    // tim17 ker clock enable logic
    assign rcc_tim17_ker_clk_en = rcc_tim17_bus_clk_en ;
    // tim17 bus clock gate
    rcc_clk_gate_cell_sync rcc_tim17_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_tim17_bus_clk_en),
        .clk_out(rcc_tim17_pclk)
    );
    // tim17 ker clock gate
    rcc_clk_gate_cell_sync rcc_tim17_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_tim17_ker_clk_en),
        .clk_out(rcc_tim17_ker_clk)
    );
  



  // tim16 bus clock ker clock enable
    assign rcc_tim16_bus_clk_en = (rcc_c1_tim16_en & (~c1_sleep | rcc_c1_tim16_lpen) & ~c1_deepsleep) | (rcc_c2_tim16_en & (~c2_sleep | rcc_c2_tim16_lpen) & ~c2_deepsleep);
    // tim16 ker clock enable logic
    assign rcc_tim16_ker_clk_en = rcc_tim16_bus_clk_en ;
    // tim16 bus clock gate
    rcc_clk_gate_cell_sync rcc_tim16_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_tim16_bus_clk_en),
        .clk_out(rcc_tim16_pclk)
    );
    // tim16 ker clock gate
    rcc_clk_gate_cell_sync rcc_tim16_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_tim16_ker_clk_en),
        .clk_out(rcc_tim16_ker_clk)
    );
  



  // tim15 bus clock ker clock enable
    assign rcc_tim15_bus_clk_en = (rcc_c1_tim15_en & (~c1_sleep | rcc_c1_tim15_lpen) & ~c1_deepsleep) | (rcc_c2_tim15_en & (~c2_sleep | rcc_c2_tim15_lpen) & ~c2_deepsleep);
    // tim15 ker clock enable logic
    assign rcc_tim15_ker_clk_en = rcc_tim15_bus_clk_en ;
    // tim15 bus clock gate
    rcc_clk_gate_cell_sync rcc_tim15_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_tim15_bus_clk_en),
        .clk_out(rcc_tim15_pclk)
    );
    // tim15 ker clock gate
    rcc_clk_gate_cell_sync rcc_tim15_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_tim15_ker_clk_en),
        .clk_out(rcc_tim15_ker_clk)
    );
  



  // spi4 bus clock ker clock enable
    assign rcc_spi4_bus_clk_en = (rcc_c1_spi4_en & (~c1_sleep | rcc_c1_spi4_lpen) & ~c1_deepsleep) | (rcc_c2_spi4_en & (~c2_sleep | rcc_c2_spi4_lpen) & ~c2_deepsleep);
    // spi4 ker clock enable logic
    assign rcc_spi4_ker_clk_en = rcc_spi4_bus_clk_en ;
    // spi4 bus clock gate
    rcc_clk_gate_cell_sync rcc_spi4_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_spi4_bus_clk_en),
        .clk_out(rcc_spi4_pclk)
    );
    // spi4 ker clock gate
    rcc_clk_gate_cell_sync rcc_spi4_ker_clk_gate (
        .clk_in(rcc_spi45sel_clk),
        .clk_en(rcc_spi4_ker_clk_en),
        .clk_out(rcc_spi4_ker_clk)
    );
  



  // spi1 bus clock ker clock enable
    assign rcc_spi1_bus_clk_en = (rcc_c1_spi1_en & (~c1_sleep | rcc_c1_spi1_lpen) & ~c1_deepsleep) | (rcc_c2_spi1_en & (~c2_sleep | rcc_c2_spi1_lpen) & ~c2_deepsleep);
    // spi1 ker clock enable logic
    assign rcc_spi1_ker_clk_en = rcc_spi1_bus_clk_en ;
    // spi1 bus clock gate
    rcc_clk_gate_cell_sync rcc_spi1_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_spi1_bus_clk_en),
        .clk_out(rcc_spi1_pclk)
    );
    // spi1 ker clock gate
    rcc_clk_gate_cell_sync rcc_spi1_ker_clk_gate (
        .clk_in(rcc_spi123sel_clk),
        .clk_en(rcc_spi1_ker_clk_en),
        .clk_out(rcc_spi1_ker_clk)
    );
  



  // usart6 bus clock ker clock enable
    assign rcc_usart6_bus_clk_en = (rcc_c1_usart6_en & (~c1_sleep | rcc_c1_usart6_lpen) & ~c1_deepsleep) | (rcc_c2_usart6_en & (~c2_sleep | rcc_c2_usart6_lpen) & ~c2_deepsleep);
    // usart6 ker clock enable logic
    assign rcc_usart6_ker_clk_en = rcc_usart6_bus_clk_en  | (((rcc_c1_usart6_en & rcc_c1_usart6_lpen)|(rcc_c2_usart6_en & rcc_c2_usart6_lpen)) & ((usart16sel == 0) | (usart16sel == 2 & usart6_ker_clk_req) | (usart16sel == 1 & usart6_ker_clk_req)));
    // usart6 bus clock gate
    rcc_clk_gate_cell_sync rcc_usart6_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_usart6_bus_clk_en),
        .clk_out(rcc_usart6_pclk)
    );
    // usart6 ker clock gate
    rcc_clk_gate_cell_sync rcc_usart6_ker_clk_gate (
        .clk_in(rcc_usart16sel_clk),
        .clk_en(rcc_usart6_ker_clk_en),
        .clk_out(rcc_usart6_ker_clk)
    );
  



  // usart1 bus clock ker clock enable
    assign rcc_usart1_bus_clk_en = (rcc_c1_usart1_en & (~c1_sleep | rcc_c1_usart1_lpen) & ~c1_deepsleep) | (rcc_c2_usart1_en & (~c2_sleep | rcc_c2_usart1_lpen) & ~c2_deepsleep);
    // usart1 ker clock enable logic
    assign rcc_usart1_ker_clk_en = rcc_usart1_bus_clk_en  | (((rcc_c1_usart1_en & rcc_c1_usart1_lpen)|(rcc_c2_usart1_en & rcc_c2_usart1_lpen)) & ((usart16sel == 0) | (usart16sel == 2 & usart1_ker_clk_req) | (usart16sel == 1 & usart1_ker_clk_req)));
    // usart1 bus clock gate
    rcc_clk_gate_cell_sync rcc_usart1_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_usart1_bus_clk_en),
        .clk_out(rcc_usart1_pclk)
    );
    // usart1 ker clock gate
    rcc_clk_gate_cell_sync rcc_usart1_ker_clk_gate (
        .clk_in(rcc_usart16sel_clk),
        .clk_en(rcc_usart1_ker_clk_en),
        .clk_out(rcc_usart1_ker_clk)
    );
  



  // tim8 bus clock ker clock enable
    assign rcc_tim8_bus_clk_en = (rcc_c1_tim8_en & (~c1_sleep | rcc_c1_tim8_lpen) & ~c1_deepsleep) | (rcc_c2_tim8_en & (~c2_sleep | rcc_c2_tim8_lpen) & ~c2_deepsleep);
    // tim8 ker clock enable logic
    assign rcc_tim8_ker_clk_en = rcc_tim8_bus_clk_en ;
    // tim8 bus clock gate
    rcc_clk_gate_cell_sync rcc_tim8_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_tim8_bus_clk_en),
        .clk_out(rcc_tim8_pclk)
    );
    // tim8 ker clock gate
    rcc_clk_gate_cell_sync rcc_tim8_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_tim8_ker_clk_en),
        .clk_out(rcc_tim8_ker_clk)
    );
  



  // tim1 bus clock ker clock enable
    assign rcc_tim1_bus_clk_en = (rcc_c1_tim1_en & (~c1_sleep | rcc_c1_tim1_lpen) & ~c1_deepsleep) | (rcc_c2_tim1_en & (~c2_sleep | rcc_c2_tim1_lpen) & ~c2_deepsleep);
    // tim1 ker clock enable logic
    assign rcc_tim1_ker_clk_en = rcc_tim1_bus_clk_en ;
    // tim1 bus clock gate
    rcc_clk_gate_cell_sync rcc_tim1_pclk_gate (
        .clk_in(rcc_apb2bridge_d2_clk),
        .clk_en(rcc_tim1_bus_clk_en),
        .clk_out(rcc_tim1_pclk)
    );
    // tim1 ker clock gate
    rcc_clk_gate_cell_sync rcc_tim1_ker_clk_gate (
        .clk_in(busclocks),
        .clk_en(rcc_tim1_ker_clk_en),
        .clk_out(rcc_tim1_ker_clk)
    );
  



  // sram4 bus clock ker clock enable
    assign rcc_sram4_bus_clk_en = ((~c1_sleep | rcc_c1_sram4_lpen)& ~c1_deepsleep) | ((~c2_sleep | rcc_c2_sram4_lpen)& ~c2_deepsleep) | (rcc_sram4_amen & ~d3_deepsleep);
    // sram4 bus clock gate
    rcc_clk_gate_cell_sync rcc_sram4_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_sram4_bus_clk_en),
        .clk_out(rcc_sram4_hclk)
    );
  



  // bkpram bus clock ker clock enable
    assign rcc_bkpram_bus_clk_en = (rcc_c1_bkpram_en & (~c1_sleep | rcc_c1_bkpram_lpen) & ~c1_deepsleep) | (rcc_c2_bkpram_en & (~c2_sleep | rcc_c2_bkpram_lpen) & ~c2_deepsleep) | (rcc_bkpram_amen & ~d3_deepsleep);
    // bkpram bus clock gate
    rcc_clk_gate_cell_sync rcc_bkpram_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_bkpram_bus_clk_en),
        .clk_out(rcc_bkpram_hclk)
    );
  



  // ramecc3 bus clock ker clock enable
    assign rcc_ramecc3_bus_clk_en = ~c1_deepsleep | ~c2_deepsleep | ~d3_deepsleep;
    // ramecc3 bus clock gate
    rcc_clk_gate_cell_sync rcc_ramecc3_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_ramecc3_bus_clk_en),
        .clk_out(rcc_ramecc3_hclk)
    );
  



  // hsem bus clock ker clock enable
    assign rcc_hsem_bus_clk_en = (rcc_c1_hsem_en & ~c1_deepsleep) | (rcc_c2_hsem_en & ~c2_deepsleep) | ~d3_deepsleep;
    // hsem bus clock gate
    rcc_clk_gate_cell_sync rcc_hsem_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_hsem_bus_clk_en),
        .clk_out(rcc_hsem_hclk)
    );
  



  // adc3 bus clock ker clock enable
    assign rcc_adc3_bus_clk_en = (rcc_c1_adc3_en & (~c1_sleep | rcc_c1_adc3_lpen) & ~c1_deepsleep) | (rcc_c2_adc3_en & (~c2_sleep | rcc_c2_adc3_lpen) & ~c2_deepsleep) | (rcc_adc3_amen & ~d3_deepsleep);
    // adc3 ker clock enable logic
    assign rcc_adc3_ker_clk_en = rcc_adc3_bus_clk_en ;
    // adc3 bus clock gate
    rcc_clk_gate_cell_sync rcc_adc3_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_adc3_bus_clk_en),
        .clk_out(rcc_adc3_hclk)
    );
    // adc3 ker clock gate
    rcc_clk_gate_cell_sync rcc_adc3_ker_clk_gate (
        .clk_in(rcc_adcsel_clk),
        .clk_en(rcc_adc3_ker_clk_en),
        .clk_out(rcc_adc3_ker_clk)
    );
  



  // bdma bus clock ker clock enable
    assign rcc_bdma_bus_clk_en = (rcc_c1_bdma_en & (~c1_sleep | rcc_c1_bdma_lpen) & ~c1_deepsleep) | (rcc_c2_bdma_en & (~c2_sleep | rcc_c2_bdma_lpen) & ~c2_deepsleep) | (rcc_bdma_amen & ~d3_deepsleep);
    // bdma bus clock gate
    rcc_clk_gate_cell_sync rcc_bdma_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_bdma_bus_clk_en),
        .clk_out(rcc_bdma_hclk)
    );
  



  // crc bus clock ker clock enable
    assign rcc_crc_bus_clk_en = (rcc_c1_crc_en & (~c1_sleep | rcc_c1_crc_lpen) & ~c1_deepsleep) | (rcc_c2_crc_en & (~c2_sleep | rcc_c2_crc_lpen) & ~c2_deepsleep) | (rcc_crc_amen & ~d3_deepsleep);
    // crc bus clock gate
    rcc_clk_gate_cell_sync rcc_crc_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_crc_bus_clk_en),
        .clk_out(rcc_crc_hclk)
    );
  



  // gpiok bus clock ker clock enable
    assign rcc_gpiok_bus_clk_en = (rcc_c1_gpiok_en & (~c1_sleep | rcc_c1_gpiok_lpen) & ~c1_deepsleep) | (rcc_c2_gpiok_en & (~c2_sleep | rcc_c2_gpiok_lpen) & ~c2_deepsleep) | (rcc_gpiok_amen & ~d3_deepsleep);
    // gpiok bus clock gate
    rcc_clk_gate_cell_sync rcc_gpiok_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_gpiok_bus_clk_en),
        .clk_out(rcc_gpiok_hclk)
    );
  



  // gpioj bus clock ker clock enable
    assign rcc_gpioj_bus_clk_en = (rcc_c1_gpioj_en & (~c1_sleep | rcc_c1_gpioj_lpen) & ~c1_deepsleep) | (rcc_c2_gpioj_en & (~c2_sleep | rcc_c2_gpioj_lpen) & ~c2_deepsleep) | (rcc_gpioj_amen & ~d3_deepsleep);
    // gpioj bus clock gate
    rcc_clk_gate_cell_sync rcc_gpioj_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_gpioj_bus_clk_en),
        .clk_out(rcc_gpioj_hclk)
    );
  



  // gpioi bus clock ker clock enable
    assign rcc_gpioi_bus_clk_en = (rcc_c1_gpioi_en & (~c1_sleep | rcc_c1_gpioi_lpen) & ~c1_deepsleep) | (rcc_c2_gpioi_en & (~c2_sleep | rcc_c2_gpioi_lpen) & ~c2_deepsleep) | (rcc_gpioi_amen & ~d3_deepsleep);
    // gpioi bus clock gate
    rcc_clk_gate_cell_sync rcc_gpioi_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_gpioi_bus_clk_en),
        .clk_out(rcc_gpioi_hclk)
    );
  



  // gpioh bus clock ker clock enable
    assign rcc_gpioh_bus_clk_en = (rcc_c1_gpioh_en & (~c1_sleep | rcc_c1_gpioh_lpen) & ~c1_deepsleep) | (rcc_c2_gpioh_en & (~c2_sleep | rcc_c2_gpioh_lpen) & ~c2_deepsleep) | (rcc_gpioh_amen & ~d3_deepsleep);
    // gpioh bus clock gate
    rcc_clk_gate_cell_sync rcc_gpioh_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_gpioh_bus_clk_en),
        .clk_out(rcc_gpioh_hclk)
    );
  



  // gpiog bus clock ker clock enable
    assign rcc_gpiog_bus_clk_en = (rcc_c1_gpiog_en & (~c1_sleep | rcc_c1_gpiog_lpen) & ~c1_deepsleep) | (rcc_c2_gpiog_en & (~c2_sleep | rcc_c2_gpiog_lpen) & ~c2_deepsleep) | (rcc_gpiog_amen & ~d3_deepsleep);
    // gpiog bus clock gate
    rcc_clk_gate_cell_sync rcc_gpiog_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_gpiog_bus_clk_en),
        .clk_out(rcc_gpiog_hclk)
    );
  



  // gpiof bus clock ker clock enable
    assign rcc_gpiof_bus_clk_en = (rcc_c1_gpiof_en & (~c1_sleep | rcc_c1_gpiof_lpen) & ~c1_deepsleep) | (rcc_c2_gpiof_en & (~c2_sleep | rcc_c2_gpiof_lpen) & ~c2_deepsleep) | (rcc_gpiof_amen & ~d3_deepsleep);
    // gpiof bus clock gate
    rcc_clk_gate_cell_sync rcc_gpiof_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_gpiof_bus_clk_en),
        .clk_out(rcc_gpiof_hclk)
    );
  



  // gpioe bus clock ker clock enable
    assign rcc_gpioe_bus_clk_en = (rcc_c1_gpioe_en & (~c1_sleep | rcc_c1_gpioe_lpen) & ~c1_deepsleep) | (rcc_c2_gpioe_en & (~c2_sleep | rcc_c2_gpioe_lpen) & ~c2_deepsleep) | (rcc_gpioe_amen & ~d3_deepsleep);
    // gpioe bus clock gate
    rcc_clk_gate_cell_sync rcc_gpioe_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_gpioe_bus_clk_en),
        .clk_out(rcc_gpioe_hclk)
    );
  



  // gpiod bus clock ker clock enable
    assign rcc_gpiod_bus_clk_en = (rcc_c1_gpiod_en & (~c1_sleep | rcc_c1_gpiod_lpen) & ~c1_deepsleep) | (rcc_c2_gpiod_en & (~c2_sleep | rcc_c2_gpiod_lpen) & ~c2_deepsleep) | (rcc_gpiod_amen & ~d3_deepsleep);
    // gpiod bus clock gate
    rcc_clk_gate_cell_sync rcc_gpiod_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_gpiod_bus_clk_en),
        .clk_out(rcc_gpiod_hclk)
    );
  



  // gpioc bus clock ker clock enable
    assign rcc_gpioc_bus_clk_en = (rcc_c1_gpioc_en & (~c1_sleep | rcc_c1_gpioc_lpen) & ~c1_deepsleep) | (rcc_c2_gpioc_en & (~c2_sleep | rcc_c2_gpioc_lpen) & ~c2_deepsleep) | (rcc_gpioc_amen & ~d3_deepsleep);
    // gpioc bus clock gate
    rcc_clk_gate_cell_sync rcc_gpioc_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_gpioc_bus_clk_en),
        .clk_out(rcc_gpioc_hclk)
    );
  



  // gpiob bus clock ker clock enable
    assign rcc_gpiob_bus_clk_en = (rcc_c1_gpiob_en & (~c1_sleep | rcc_c1_gpiob_lpen) & ~c1_deepsleep) | (rcc_c2_gpiob_en & (~c2_sleep | rcc_c2_gpiob_lpen) & ~c2_deepsleep) | (rcc_gpiob_amen & ~d3_deepsleep);
    // gpiob bus clock gate
    rcc_clk_gate_cell_sync rcc_gpiob_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_gpiob_bus_clk_en),
        .clk_out(rcc_gpiob_hclk)
    );
  



  // gpioa bus clock ker clock enable
    assign rcc_gpioa_bus_clk_en = (rcc_c1_gpioa_en & (~c1_sleep | rcc_c1_gpioa_lpen) & ~c1_deepsleep) | (rcc_c2_gpioa_en & (~c2_sleep | rcc_c2_gpioa_lpen) & ~c2_deepsleep) | (rcc_gpioa_amen & ~d3_deepsleep);
    // gpioa bus clock gate
    rcc_clk_gate_cell_sync rcc_gpioa_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_gpioa_bus_clk_en),
        .clk_out(rcc_gpioa_hclk)
    );
  



  // rcc bus clock ker clock enable
    assign rcc_rcc_bus_clk_en = ~c1_deepsleep | ~c2_deepsleep | ~d3_deepsleep;
    // rcc bus clock gate
    rcc_clk_gate_cell_sync rcc_rcc_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_rcc_bus_clk_en),
        .clk_out(rcc_rcc_hclk)
    );
  



  // pwr bus clock ker clock enable
    assign rcc_pwr_bus_clk_en = ~c1_deepsleep | ~c2_deepsleep | ~d3_deepsleep;
    // pwr bus clock gate
    rcc_clk_gate_cell_sync rcc_pwr_hclk_gate (
        .clk_in(rcc_ahb4bridge_d3_clk),
        .clk_en(rcc_pwr_bus_clk_en),
        .clk_out(rcc_pwr_hclk)
    );
  



  // sai4 bus clock ker clock enable
    assign rcc_sai4_bus_clk_en = (rcc_c1_sai4_en & (~c1_sleep | rcc_c1_sai4_lpen) & ~c1_deepsleep) | (rcc_c2_sai4_en & (~c2_sleep | rcc_c2_sai4_lpen) & ~c2_deepsleep) | (rcc_sai4_amen & ~d3_deepsleep);
    // sai4 ker clock enable logic
    assign rcc_sai4_ker_clk_en_0 = rcc_sai4_bus_clk_en ;
    assign rcc_sai4_ker_clk_en_1 = rcc_sai4_bus_clk_en ;
    // sai4 bus clock gate
    rcc_clk_gate_cell_sync rcc_sai4_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_sai4_bus_clk_en),
        .clk_out(rcc_sai4_pclk)
    );
    // sai4 ker clock gate
    rcc_clk_gate_cell_sync rcc_sai4_ker_clk_gate_0 (
        .clk_in(rcc_sai4asel_clk),
        .clk_en(rcc_sai4_ker_clk_en_0),
        .clk_out(rcc_sai4_ker_clk_0)
    );
    rcc_clk_gate_cell_sync rcc_sai4_ker_clk_gate_1 (
        .clk_in(rcc_sai4bsel_clk),
        .clk_en(rcc_sai4_ker_clk_en_1),
        .clk_out(rcc_sai4_ker_clk_1)
    );
  



  // rtc bus clock ker clock enable
    assign rcc_rtc_bus_clk_en = (rcc_c1_rtc_en & (~c1_sleep | rcc_c1_rtc_lpen) & ~c1_deepsleep) | (rcc_c2_rtc_en & (~c2_sleep | rcc_c2_rtc_lpen) & ~c2_deepsleep) | (rcc_rtc_amen & ~d3_deepsleep);
    // rtc bus clock gate
    rcc_clk_gate_cell_sync rcc_rtc_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_rtc_bus_clk_en),
        .clk_out(rcc_rtc_pclk)
    );
  



  // vref bus clock ker clock enable
    assign rcc_vref_bus_clk_en = (rcc_c1_vref_en & (~c1_sleep | rcc_c1_vref_lpen) & ~c1_deepsleep) | (rcc_c2_vref_en & (~c2_sleep | rcc_c2_vref_lpen) & ~c2_deepsleep) | (rcc_vref_amen & ~d3_deepsleep);
    // vref bus clock gate
    rcc_clk_gate_cell_sync rcc_vref_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_vref_bus_clk_en),
        .clk_out(rcc_vref_pclk)
    );
  



  // comp12 bus clock ker clock enable
    assign rcc_comp12_bus_clk_en = (rcc_c1_comp12_en & (~c1_sleep | rcc_c1_comp12_lpen) & ~c1_deepsleep) | (rcc_c2_comp12_en & (~c2_sleep | rcc_c2_comp12_lpen) & ~c2_deepsleep) | (rcc_comp12_amen & ~d3_deepsleep);
    // comp12 bus clock gate
    rcc_clk_gate_cell_sync rcc_comp12_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_comp12_bus_clk_en),
        .clk_out(rcc_comp12_pclk)
    );
  



  // lptim5 bus clock ker clock enable
    assign rcc_lptim5_bus_clk_en = (rcc_c1_lptim5_en & (~c1_sleep | rcc_c1_lptim5_lpen) & ~c1_deepsleep) | (rcc_c2_lptim5_en & (~c2_sleep | rcc_c2_lptim5_lpen) & ~c2_deepsleep) | (rcc_lptim5_amen & ~d3_deepsleep);
    // lptim5 ker clock enable logic
    assign rcc_lptim5_ker_clk_en = rcc_lptim5_bus_clk_en  | (((rcc_c1_lptim5_en | rcc_c2_lptim5_en) & rcc_lptim5_amen) & ((lptim345sel == 2) | (lptim345sel == 1)));
    // lptim5 bus clock gate
    rcc_clk_gate_cell_sync rcc_lptim5_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_lptim5_bus_clk_en),
        .clk_out(rcc_lptim5_pclk)
    );
    // lptim5 ker clock gate
    rcc_clk_gate_cell_sync rcc_lptim5_ker_clk_gate (
        .clk_in(rcc_lptim345sel_clk),
        .clk_en(rcc_lptim5_ker_clk_en),
        .clk_out(rcc_lptim5_ker_clk)
    );
  



  // lptim4 bus clock ker clock enable
    assign rcc_lptim4_bus_clk_en = (rcc_c1_lptim4_en & (~c1_sleep | rcc_c1_lptim4_lpen) & ~c1_deepsleep) | (rcc_c2_lptim4_en & (~c2_sleep | rcc_c2_lptim4_lpen) & ~c2_deepsleep) | (rcc_lptim4_amen & ~d3_deepsleep);
    // lptim4 ker clock enable logic
    assign rcc_lptim4_ker_clk_en = rcc_lptim4_bus_clk_en  | (((rcc_c1_lptim4_en | rcc_c2_lptim4_en) & rcc_lptim4_amen) & ((lptim345sel == 2) | (lptim345sel == 1)));
    // lptim4 bus clock gate
    rcc_clk_gate_cell_sync rcc_lptim4_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_lptim4_bus_clk_en),
        .clk_out(rcc_lptim4_pclk)
    );
    // lptim4 ker clock gate
    rcc_clk_gate_cell_sync rcc_lptim4_ker_clk_gate (
        .clk_in(rcc_lptim345sel_clk),
        .clk_en(rcc_lptim4_ker_clk_en),
        .clk_out(rcc_lptim4_ker_clk)
    );
  



  // lptim3 bus clock ker clock enable
    assign rcc_lptim3_bus_clk_en = (rcc_c1_lptim3_en & (~c1_sleep | rcc_c1_lptim3_lpen) & ~c1_deepsleep) | (rcc_c2_lptim3_en & (~c2_sleep | rcc_c2_lptim3_lpen) & ~c2_deepsleep) | (rcc_lptim3_amen & ~d3_deepsleep);
    // lptim3 ker clock enable logic
    assign rcc_lptim3_ker_clk_en = rcc_lptim3_bus_clk_en  | (((rcc_c1_lptim3_en | rcc_c2_lptim3_en) & rcc_lptim3_amen) & ((lptim345sel == 2) | (lptim345sel == 1)));
    // lptim3 bus clock gate
    rcc_clk_gate_cell_sync rcc_lptim3_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_lptim3_bus_clk_en),
        .clk_out(rcc_lptim3_pclk)
    );
    // lptim3 ker clock gate
    rcc_clk_gate_cell_sync rcc_lptim3_ker_clk_gate (
        .clk_in(rcc_lptim345sel_clk),
        .clk_en(rcc_lptim3_ker_clk_en),
        .clk_out(rcc_lptim3_ker_clk)
    );
  



  // lptim2 bus clock ker clock enable
    assign rcc_lptim2_bus_clk_en = (rcc_c1_lptim2_en & (~c1_sleep | rcc_c1_lptim2_lpen) & ~c1_deepsleep) | (rcc_c2_lptim2_en & (~c2_sleep | rcc_c2_lptim2_lpen) & ~c2_deepsleep) | (rcc_lptim2_amen & ~d3_deepsleep);
    // lptim2 ker clock enable logic
    assign rcc_lptim2_ker_clk_en = rcc_lptim2_bus_clk_en  | (((rcc_c1_lptim2_en | rcc_c2_lptim2_en) & rcc_lptim2_amen) & ((lptim2sel == 2) | (lptim2sel == 1)));
    // lptim2 bus clock gate
    rcc_clk_gate_cell_sync rcc_lptim2_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_lptim2_bus_clk_en),
        .clk_out(rcc_lptim2_pclk)
    );
    // lptim2 ker clock gate
    rcc_clk_gate_cell_sync rcc_lptim2_ker_clk_gate (
        .clk_in(rcc_lptim2sel_clk),
        .clk_en(rcc_lptim2_ker_clk_en),
        .clk_out(rcc_lptim2_ker_clk)
    );
  



  // i2c4 bus clock ker clock enable
    assign rcc_i2c4_bus_clk_en = (rcc_c1_i2c4_en & (~c1_sleep | rcc_c1_i2c4_lpen) & ~c1_deepsleep) | (rcc_c2_i2c4_en & (~c2_sleep | rcc_c2_i2c4_lpen) & ~c2_deepsleep) | (rcc_i2c4_amen & ~d3_deepsleep);
    // i2c4 ker clock enable logic
    assign rcc_i2c4_ker_clk_en = rcc_i2c4_bus_clk_en  | (((rcc_c1_i2c4_en | rcc_c2_i2c4_en) & rcc_i2c4_amen) & ((i2c4sel == 1 & i2c4_ker_clk_req) | (i2c4sel == 0 & i2c4_ker_clk_req)));
    // i2c4 bus clock gate
    rcc_clk_gate_cell_sync rcc_i2c4_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_i2c4_bus_clk_en),
        .clk_out(rcc_i2c4_pclk)
    );
    // i2c4 ker clock gate
    rcc_clk_gate_cell_sync rcc_i2c4_ker_clk_gate (
        .clk_in(rcc_i2c4sel_clk),
        .clk_en(rcc_i2c4_ker_clk_en),
        .clk_out(rcc_i2c4_ker_clk)
    );
  



  // spi6 bus clock ker clock enable
    assign rcc_spi6_bus_clk_en = (rcc_c1_spi6_en & (~c1_sleep | rcc_c1_spi6_lpen) & ~c1_deepsleep) | (rcc_c2_spi6_en & (~c2_sleep | rcc_c2_spi6_lpen) & ~c2_deepsleep) | (rcc_spi6_amen & ~d3_deepsleep);
    // spi6 ker clock enable logic
    assign rcc_spi6_ker_clk_en = rcc_spi6_bus_clk_en ;
    // spi6 bus clock gate
    rcc_clk_gate_cell_sync rcc_spi6_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_spi6_bus_clk_en),
        .clk_out(rcc_spi6_pclk)
    );
    // spi6 ker clock gate
    rcc_clk_gate_cell_sync rcc_spi6_ker_clk_gate (
        .clk_in(rcc_spi6sel_clk),
        .clk_en(rcc_spi6_ker_clk_en),
        .clk_out(rcc_spi6_ker_clk)
    );
  



  // lpuart1 bus clock ker clock enable
    assign rcc_lpuart1_bus_clk_en = (rcc_c1_lpuart1_en & (~c1_sleep | rcc_c1_lpuart1_lpen) & ~c1_deepsleep) | (rcc_c2_lpuart1_en & (~c2_sleep | rcc_c2_lpuart1_lpen) & ~c2_deepsleep) | (rcc_lpuart1_amen & ~d3_deepsleep);
    // lpuart1 ker clock enable logic
    assign rcc_lpuart1_ker_clk_en = rcc_lpuart1_bus_clk_en  | (((rcc_c1_lpuart1_en | rcc_c2_lpuart1_en) & rcc_lpuart1_amen) & ((lpuart1sel == 0) | (lpuart1sel == 2 & lpuart1_ker_clk_req) | (lpuart1sel == 1 & lpuart1_ker_clk_req)));
    // lpuart1 bus clock gate
    rcc_clk_gate_cell_sync rcc_lpuart1_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_lpuart1_bus_clk_en),
        .clk_out(rcc_lpuart1_pclk)
    );
    // lpuart1 ker clock gate
    rcc_clk_gate_cell_sync rcc_lpuart1_ker_clk_gate (
        .clk_in(rcc_lpuart1sel_clk),
        .clk_en(rcc_lpuart1_ker_clk_en),
        .clk_out(rcc_lpuart1_ker_clk)
    );
  



  // syscfg bus clock ker clock enable
    assign rcc_syscfg_bus_clk_en = (rcc_c1_syscfg_en & (~c1_sleep | rcc_c1_syscfg_lpen) & ~c1_deepsleep) | (rcc_c2_syscfg_en & (~c2_sleep | rcc_c2_syscfg_lpen) & ~c2_deepsleep) | (rcc_syscfg_amen & ~d3_deepsleep);
    // syscfg bus clock gate
    rcc_clk_gate_cell_sync rcc_syscfg_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_syscfg_bus_clk_en),
        .clk_out(rcc_syscfg_pclk)
    );
  



  // iwdg2 bus clock ker clock enable
    assign rcc_iwdg2_bus_clk_en = ~c1_deepsleep | ~c2_deepsleep | ~d3_deepsleep;
    // iwdg2 bus clock gate
    rcc_clk_gate_cell_sync rcc_iwdg2_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_iwdg2_bus_clk_en),
        .clk_out(rcc_iwdg2_pclk)
    );
  



  // iwdg1 bus clock ker clock enable
    assign rcc_iwdg1_bus_clk_en = ~c1_deepsleep | ~c2_deepsleep | ~d3_deepsleep;
    // iwdg1 bus clock gate
    rcc_clk_gate_cell_sync rcc_iwdg1_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_iwdg1_bus_clk_en),
        .clk_out(rcc_iwdg1_pclk)
    );
  



  // exti bus clock ker clock enable
    assign rcc_exti_bus_clk_en = ~c1_deepsleep | ~c2_deepsleep | ~d3_deepsleep;
    // exti bus clock gate
    rcc_clk_gate_cell_sync rcc_exti_pclk_gate (
        .clk_in(rcc_apb4bridge_d3_clk),
        .clk_en(rcc_exti_bus_clk_en),
        .clk_out(rcc_exti_pclk)
    );
   






 // ker clock source select logic
    // csi_ker_clk_122_div
    div_even_stable #(
        .DIVISION(122)
    ) csi_ker_clk_122_divider(
        .clk_in(csi_ker_clk),
        .rst_n(sys_rst_n),
        .clk_out(csi_ker_clk_122_div)
    );
    // qspisel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(4)
    ) rcc_qspisel_clk_switch(
    .clk_in({per_clk,pll2_r_clk,pll1_q_clk,rcc_ahb3bridge_d1_clk}),
    .sel(qspisel),
    .clk_out(rcc_qspisel_clk)
    );
    // fmcsel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(4)
    ) rcc_fmcsel_clk_switch(
    .clk_in({per_clk,pll2_r_clk,pll1_q_clk,rcc_ahb3bridge_d1_clk}),
    .sel(fmcsel),
    .clk_out(rcc_fmcsel_clk)
    );
    // sdmmcsel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(2)
    ) rcc_sdmmcsel_clk_switch(
    .clk_in({pll2_r_clk,pll1_q_clk}),
    .sel(sdmmcsel),
    .clk_out(rcc_sdmmcsel_clk)
    );
    // usbsel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(4)
    ) rcc_usbsel_clk_switch(
    .clk_in({hsi48_clk,pll3_q_clk,pll1_q_clk,1'b0}),
    .sel(usbsel),
    .clk_out(rcc_usbsel_clk)
    );
    // adcsel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(3)
    ) rcc_adcsel_clk_switch(
    .clk_in({per_clk,pll3_r_clk,pll2_p_clk}),
    .sel(adcsel),
    .clk_out(rcc_adcsel_clk)
    );
    // rngsel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(4)
    ) rcc_rngsel_clk_switch(
    .clk_in({lsi_clk,lse_clk,pll1_q_clk,hsi48_clk}),
    .sel(rngsel),
    .clk_out(rcc_rngsel_clk)
    );
    // cecsel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(3)
    ) rcc_cecsel_clk_switch(
    .clk_in({csi_ker_clk_122_div,lsi_clk,lse_clk}),
    .sel(cecsel),
    .clk_out(rcc_cecsel_clk)
    );
    // i2c123sel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(4)
    ) rcc_i2c123sel_clk_switch(
    .clk_in({csi_ker_clk,hsi_ker_clk,pll3_r_clk,busclocks}),
    .sel(i2c123sel),
    .clk_out(rcc_i2c123sel_clk)
    );
    // usart234578sel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(6)
    ) rcc_usart234578sel_clk_switch(
    .clk_in({lse_clk,csi_ker_clk,hsi_ker_clk,pll3_q_clk,pll2_q_clk,busclocks}),
    .sel(usart234578sel),
    .clk_out(rcc_usart234578sel_clk)
    );
    // spdifsel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(4)
    ) rcc_spdifsel_clk_switch(
    .clk_in({hsi_ker_clk,pll3_r_clk,pll2_r_clk,pll1_q_clk}),
    .sel(spdifsel),
    .clk_out(rcc_spdifsel_clk)
    );
    // lptim1sel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(6)
    ) rcc_lptim1sel_clk_switch(
    .clk_in({per_clk,lsi_clk,lse_clk,pll3_r_clk,pll2_p_clk,busclocks}),
    .sel(lptim1sel),
    .clk_out(rcc_lptim1sel_clk)
    );
    // fdcansel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(3)
    ) rcc_fdcansel_clk_switch(
    .clk_in({pll2_q_clk,pll1_q_clk,hse_clk}),
    .sel(fdcansel),
    .clk_out(rcc_fdcansel_clk)
    );
    // swpsel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(2)
    ) rcc_swpsel_clk_switch(
    .clk_in({hsi_ker_clk,busclocks}),
    .sel(swpsel),
    .clk_out(rcc_swpsel_clk)
    );
    // sai1sel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(5)
    ) rcc_sai1sel_clk_switch(
    .clk_in({per_clk,I2S_clk_IN,pll3_p_clk,pll2_p_clk,pll1_q_clk}),
    .sel(sai1sel),
    .clk_out(rcc_sai1sel_clk)
    );
    // dfsdm1sel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(2)
    ) rcc_dfsdm1sel_clk_switch(
    .clk_in({sys_clk,busclocks}),
    .sel(dfsdm1sel),
    .clk_out(rcc_dfsdm1sel_clk)
    );
    // sai23sel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(5)
    ) rcc_sai23sel_clk_switch(
    .clk_in({per_clk,I2S_clk_IN,pll3_p_clk,pll2_p_clk,pll1_q_clk}),
    .sel(sai23sel),
    .clk_out(rcc_sai23sel_clk)
    );
    // spi45sel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(6)
    ) rcc_spi45sel_clk_switch(
    .clk_in({hse_clk,csi_ker_clk,hsi_ker_clk,pll3_q_clk,pll2_q_clk,busclocks}),
    .sel(spi45sel),
    .clk_out(rcc_spi45sel_clk)
    );
    // spi123sel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(5)
    ) rcc_spi123sel_clk_switch(
    .clk_in({per_clk,I2S_clk_IN,pll3_p_clk,pll2_p_clk,pll1_q_clk}),
    .sel(spi123sel),
    .clk_out(rcc_spi123sel_clk)
    );
    // usart16sel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(6)
    ) rcc_usart16sel_clk_switch(
    .clk_in({lse_clk,csi_ker_clk,hsi_ker_clk,pll3_q_clk,pll2_q_clk,busclocks}),
    .sel(usart16sel),
    .clk_out(rcc_usart16sel_clk)
    );
    // sai4asel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(5)
    ) rcc_sai4asel_clk_switch(
    .clk_in({per_clk,I2S_clk_IN,pll3_p_clk,pll2_p_clk,pll1_q_clk}),
    .sel(sai4asel),
    .clk_out(rcc_sai4asel_clk)
    );
    // sai4bsel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(5)
    ) rcc_sai4bsel_clk_switch(
    .clk_in({per_clk,I2S_clk_IN,pll3_p_clk,pll2_p_clk,pll1_q_clk}),
    .sel(sai4bsel),
    .clk_out(rcc_sai4bsel_clk)
    );
    // lptim345sel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(6)
    ) rcc_lptim345sel_clk_switch(
    .clk_in({per_clk,lsi_clk,lse_clk,pll3_r_clk,pll2_p_clk,busclocks}),
    .sel(lptim345sel),
    .clk_out(rcc_lptim345sel_clk)
    );
    // lptim2sel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(6)
    ) rcc_lptim2sel_clk_switch(
    .clk_in({per_clk,lsi_clk,lse_clk,pll3_r_clk,pll2_p_clk,busclocks}),
    .sel(lptim2sel),
    .clk_out(rcc_lptim2sel_clk)
    );
    // i2c4sel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(4)
    ) rcc_i2c4sel_clk_switch(
    .clk_in({csi_ker_clk,hsi_ker_clk,pll3_r_clk,busclocks}),
    .sel(i2c4sel),
    .clk_out(rcc_i2c4sel_clk)
    );
    // spi6sel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(6)
    ) rcc_spi6sel_clk_switch(
    .clk_in({hse_clk,csi_ker_clk,hsi_ker_clk,pll3_q_clk,pll2_q_clk,busclocks}),
    .sel(spi6sel),
    .clk_out(rcc_spi6sel_clk)
    );
    // lpuart1sel ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(6)
    ) rcc_lpuart1sel_clk_switch(
    .clk_in({lse_clk,csi_ker_clk,hsi_ker_clk,pll3_q_clk,pll2_q_clk,busclocks}),
    .sel(lpuart1sel),
    .clk_out(rcc_lpuart1sel_clk)
    );
    // generate c2_per_alloc_d1 and c1_per_alloc_d2
    assign c2_per_alloc_d1 =  rcc_c1_qspi_en | rcc_c1_fmc_en | rcc_c1_dma2d_en | rcc_c1_mdma_en | rcc_c1_ltdc_en | rcc_c1_jpgdec_en | rcc_c1_sdmmc1_en | rcc_c1_wwdg1_en | rcc_c1_usb2ulpi_en | rcc_c1_usb2otg_en | rcc_c1_usb1ulpi_en | rcc_c1_usb1otg_en | rcc_c1_eth1rx_en | rcc_c1_eth1tx_en | rcc_c1_eth1mac_en | rcc_c1_adc12_en | rcc_c1_dma2_en | rcc_c1_dma1_en | rcc_c1_sram3_en | rcc_c1_sram2_en | rcc_c1_sram1_en | rcc_c1_sdmmc2_en | rcc_c1_rng_en | rcc_c1_hash_en | rcc_c1_crypt_en | rcc_c1_dcmi_en | rcc_c1_uart8_en | rcc_c1_uart7_en | rcc_c1_dac12_en | rcc_c1_hdmicec_en | rcc_c1_i2c3_en | rcc_c1_i2c2_en | rcc_c1_i2c1_en | rcc_c1_uart5_en | rcc_c1_uart4_en | rcc_c1_usart3_en | rcc_c1_usart2_en | rcc_c1_spdifrx_en | rcc_c1_spi3_en | rcc_c1_spi2_en | rcc_c1_wwdg2_en | rcc_c1_lptim1_en | rcc_c1_tim14_en | rcc_c1_tim13_en | rcc_c1_tim12_en | rcc_c1_tim7_en | rcc_c1_tim6_en | rcc_c1_tim5_en | rcc_c1_tim4_en | rcc_c1_tim3_en | rcc_c1_tim2_en | rcc_c1_fdcan_en | rcc_c1_mdios_en | rcc_c1_opamp_en | rcc_c1_swpmi_en | rcc_c1_crs_en | rcc_c1_hrtim_en | rcc_c1_dfsdm1_en | rcc_c1_sai3_en | rcc_c1_sai2_en | rcc_c1_sai1_en | rcc_c1_spi5_en | rcc_c1_tim17_en | rcc_c1_tim16_en | rcc_c1_tim15_en | rcc_c1_spi4_en | rcc_c1_spi1_en | rcc_c1_usart6_en | rcc_c1_usart1_en | rcc_c1_tim8_en | rcc_c1_tim1_en | rcc_c1_bkpram_en | rcc_c1_hsem_en | rcc_c1_adc3_en | rcc_c1_bdma_en | rcc_c1_crc_en | rcc_c1_gpiok_en | rcc_c1_gpioj_en | rcc_c1_gpioi_en | rcc_c1_gpioh_en | rcc_c1_gpiog_en | rcc_c1_gpiof_en | rcc_c1_gpioe_en | rcc_c1_gpiod_en | rcc_c1_gpioc_en | rcc_c1_gpiob_en | rcc_c1_gpioa_en | rcc_c1_sai4_en | rcc_c1_rtc_en | rcc_c1_vref_en | rcc_c1_comp12_en | rcc_c1_lptim5_en | rcc_c1_lptim4_en | rcc_c1_lptim3_en | rcc_c1_lptim2_en | rcc_c1_i2c4_en | rcc_c1_spi6_en | rcc_c1_lpuart1_en | rcc_c1_syscfg_en ;
    assign c1_per_alloc_d2 =  rcc_c2_flash_en | rcc_c2_qspi_en | rcc_c2_axisram_en | rcc_c2_fmc_en | rcc_c2_dma2d_en | rcc_c2_mdma_en | rcc_c2_ltdc_en | rcc_c2_itcm_en | rcc_c2_dtcm2_en | rcc_c2_dtcm1_en | rcc_c2_jpgdec_en | rcc_c2_sdmmc1_en | rcc_c2_wwdg1_en | rcc_c2_usb2ulpi_en | rcc_c2_usb2otg_en | rcc_c2_usb1ulpi_en | rcc_c2_usb1otg_en | rcc_c2_eth1rx_en | rcc_c2_eth1tx_en | rcc_c2_eth1mac_en | rcc_c2_adc12_en | rcc_c2_dma2_en | rcc_c2_dma1_en | rcc_c2_sdmmc2_en | rcc_c2_rng_en | rcc_c2_hash_en | rcc_c2_crypt_en | rcc_c2_dcmi_en | rcc_c2_uart8_en | rcc_c2_uart7_en | rcc_c2_dac12_en | rcc_c2_hdmicec_en | rcc_c2_i2c3_en | rcc_c2_i2c2_en | rcc_c2_i2c1_en | rcc_c2_uart5_en | rcc_c2_uart4_en | rcc_c2_usart3_en | rcc_c2_usart2_en | rcc_c2_spdifrx_en | rcc_c2_spi3_en | rcc_c2_spi2_en | rcc_c2_wwdg2_en | rcc_c2_lptim1_en | rcc_c2_tim14_en | rcc_c2_tim13_en | rcc_c2_tim12_en | rcc_c2_tim7_en | rcc_c2_tim6_en | rcc_c2_tim5_en | rcc_c2_tim4_en | rcc_c2_tim3_en | rcc_c2_tim2_en | rcc_c2_fdcan_en | rcc_c2_mdios_en | rcc_c2_opamp_en | rcc_c2_swpmi_en | rcc_c2_crs_en | rcc_c2_hrtim_en | rcc_c2_dfsdm1_en | rcc_c2_sai3_en | rcc_c2_sai2_en | rcc_c2_sai1_en | rcc_c2_spi5_en | rcc_c2_tim17_en | rcc_c2_tim16_en | rcc_c2_tim15_en | rcc_c2_spi4_en | rcc_c2_spi1_en | rcc_c2_usart6_en | rcc_c2_usart1_en | rcc_c2_tim8_en | rcc_c2_tim1_en | rcc_c2_bkpram_en | rcc_c2_hsem_en | rcc_c2_adc3_en | rcc_c2_bdma_en | rcc_c2_crc_en | rcc_c2_gpiok_en | rcc_c2_gpioj_en | rcc_c2_gpioi_en | rcc_c2_gpioh_en | rcc_c2_gpiog_en | rcc_c2_gpiof_en | rcc_c2_gpioe_en | rcc_c2_gpiod_en | rcc_c2_gpioc_en | rcc_c2_gpiob_en | rcc_c2_gpioa_en | rcc_c2_sai4_en | rcc_c2_rtc_en | rcc_c2_vref_en | rcc_c2_comp12_en | rcc_c2_lptim5_en | rcc_c2_lptim4_en | rcc_c2_lptim3_en | rcc_c2_lptim2_en | rcc_c2_i2c4_en | rcc_c2_spi6_en | rcc_c2_lpuart1_en | rcc_c2_syscfg_en ;
    // generate hsi_ker_clk_req and csi_ker_clk_req
    assign hsi_ker_clk_req =  (usart234578sel == 2 & uart8_ker_clk_req) | (usart234578sel == 2 & uart7_ker_clk_req) | (i2c123sel == 1 & i2c3_ker_clk_req) | (i2c123sel == 1 & i2c2_ker_clk_req) | (i2c123sel == 1 & i2c1_ker_clk_req) | (usart234578sel == 2 & uart5_ker_clk_req) | (usart234578sel == 2 & uart4_ker_clk_req) | (usart234578sel == 2 & usart3_ker_clk_req) | (usart234578sel == 2 & usart2_ker_clk_req) | (usart16sel == 2 & usart6_ker_clk_req) | (usart16sel == 2 & usart1_ker_clk_req) | (i2c4sel == 1 & i2c4_ker_clk_req) | (lpuart1sel == 2 & lpuart1_ker_clk_req) ;
    assign csi_ker_clk_req =  (usart234578sel == 1 & uart8_ker_clk_req) | (usart234578sel == 1 & uart7_ker_clk_req) | (i2c123sel == 0 & i2c3_ker_clk_req) | (i2c123sel == 0 & i2c2_ker_clk_req) | (i2c123sel == 0 & i2c1_ker_clk_req) | (usart234578sel == 1 & uart5_ker_clk_req) | (usart234578sel == 1 & uart4_ker_clk_req) | (usart234578sel == 1 & usart3_ker_clk_req) | (usart234578sel == 1 & usart2_ker_clk_req) | (usart16sel == 1 & usart6_ker_clk_req) | (usart16sel == 1 & usart1_ker_clk_req) | (i2c4sel == 0 & i2c4_ker_clk_req) | (lpuart1sel == 1 & lpuart1_ker_clk_req) ;
endmodule
