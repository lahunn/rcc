module rcc_per_clk_rst_control #(
    parameter CLK_ON_AFTER_PER_RST_RELEASE                  = 0
)  (
    // system reset
    input sys_rst_n,
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
    input rcc_axibridge_d1_clk,
    input rcc_ahb3bridge_d1_clk,
    input rcc_apb3bridge_d1_clk,
    input rcc_ahb1bridge_d2_clk,
    input rcc_ahb2bridge_d2_clk,
    input rcc_apb1bridge_d2_clk,
    input rcc_apb2bridge_d2_clk,
    input rcc_ahb4bridge_d3_clk,
    input rcc_apb4bridge_d3_clk,
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
    input rcc_flash_arcg_clk_en,
    input rcc_c2_flash_en,
    input rcc_c1_flash_lpen,
    input rcc_c2_flash_lpen,
    output rcc_flash_aclk,
    output rcc_flash_hclk,
// qspi control signals
    input rcc_qspi_arcg_clk_en,
    input rcc_c1_qspi_en,
    input rcc_c2_qspi_en,
    input rcc_c1_qspi_lpen,
    input rcc_c2_qspi_lpen,
    output rcc_qspi_aclk,
    output rcc_qspi_hclk,
    output rcc_qspi_ker_clk,
// axisram control signals
    input rcc_axisram_arcg_clk_en,
    input rcc_c2_axisram_en,
    input rcc_c1_axisram_lpen,
    input rcc_c2_axisram_lpen,
    output rcc_axisram_aclk,
// fmc control signals
    input rcc_fmc_arcg_clk_en,
    input rcc_c1_fmc_en,
    input rcc_c2_fmc_en,
    input rcc_c1_fmc_lpen,
    input rcc_c2_fmc_lpen,
    output rcc_fmc_aclk,
    output rcc_fmc_hclk,
    output rcc_fmc_ker_clk,
// dma2d control signals
    input rcc_dma2d_arcg_clk_en,
    input rcc_c1_dma2d_en,
    input rcc_c2_dma2d_en,
    input rcc_c1_dma2d_lpen,
    input rcc_c2_dma2d_lpen,
    output rcc_dma2d_aclk,
    output rcc_dma2d_hclk,
// mdma control signals
    input rcc_mdma_arcg_clk_en,
    input rcc_c1_mdma_en,
    input rcc_c2_mdma_en,
    input rcc_c1_mdma_lpen,
    input rcc_c2_mdma_lpen,
    output rcc_mdma_aclk,
    output rcc_mdma_hclk,
// ltdc control signals
    input rcc_ltdc_arcg_clk_en,
    input rcc_c1_ltdc_en,
    input rcc_c2_ltdc_en,
    input rcc_c1_ltdc_lpen,
    input rcc_c2_ltdc_lpen,
    output rcc_ltdc_aclk,
    output rcc_ltdc_pclk,
    output rcc_ltdc_ker_clk,
// ramecc1 control signals
    input rcc_ramecc1_arcg_clk_en,
    output rcc_ramecc1_hclk,
// gpv control signals
    input rcc_gpv_arcg_clk_en,
    output rcc_gpv_hclk,
// itcm control signals
    input rcc_itcm_arcg_clk_en,
    input rcc_c2_itcm_en,
    input rcc_c1_itcm_lpen,
    input rcc_c2_itcm_lpen,
    output rcc_itcm_hclk,
// dtcm2 control signals
    input rcc_dtcm2_arcg_clk_en,
    input rcc_c2_dtcm2_en,
    input rcc_c1_dtcm2_lpen,
    input rcc_c2_dtcm2_lpen,
    output rcc_dtcm2_hclk,
// dtcm1 control signals
    input rcc_dtcm1_arcg_clk_en,
    input rcc_c2_dtcm1_en,
    input rcc_c1_dtcm1_lpen,
    input rcc_c2_dtcm1_lpen,
    output rcc_dtcm1_hclk,
// jpgdec control signals
    input rcc_jpgdec_arcg_clk_en,
    input rcc_c1_jpgdec_en,
    input rcc_c2_jpgdec_en,
    input rcc_c1_jpgdec_lpen,
    input rcc_c2_jpgdec_lpen,
    output rcc_jpgdec_hclk,
// sdmmc1 control signals
    input rcc_sdmmc1_arcg_clk_en,
    input rcc_c1_sdmmc1_en,
    input rcc_c2_sdmmc1_en,
    input rcc_c1_sdmmc1_lpen,
    input rcc_c2_sdmmc1_lpen,
    output rcc_sdmmc1_hclk,
    output rcc_sdmmc1_ker_clk,
// wwdg1 control signals
    input rcc_wwdg1_arcg_clk_en,
    input rcc_c1_wwdg1_en,
    input rcc_c2_wwdg1_en,
    input rcc_c1_wwdg1_lpen,
    input rcc_c2_wwdg1_lpen,
    output rcc_wwdg1_pclk,
// usb2ulpi control signals
    input rcc_usb2ulpi_arcg_clk_en,
    input rcc_c1_usb2ulpi_en,
    input rcc_c2_usb2ulpi_en,
    input rcc_c1_usb2ulpi_lpen,
    input rcc_c2_usb2ulpi_lpen,
    output rcc_usb2ulpi_hclk,
// usb2otg control signals
    input rcc_usb2otg_arcg_clk_en,
    input rcc_c1_usb2otg_en,
    input rcc_c2_usb2otg_en,
    input rcc_c1_usb2otg_lpen,
    input rcc_c2_usb2otg_lpen,
    output rcc_usb2otg_hclk,
    output rcc_usb2otg_ker_clk,
// usb1ulpi control signals
    input rcc_usb1ulpi_arcg_clk_en,
    input rcc_c1_usb1ulpi_en,
    input rcc_c2_usb1ulpi_en,
    input rcc_c1_usb1ulpi_lpen,
    input rcc_c2_usb1ulpi_lpen,
    output rcc_usb1ulpi_hclk,
    output rcc_usb1ulpi_ker_clk,
// usb1otg control signals
    input rcc_usb1otg_arcg_clk_en,
    input rcc_c1_usb1otg_en,
    input rcc_c2_usb1otg_en,
    input rcc_c1_usb1otg_lpen,
    input rcc_c2_usb1otg_lpen,
    output rcc_usb1otg_hclk,
    output rcc_usb1otg_ker_clk,
// eth1rx control signals
    input rcc_eth1rx_arcg_clk_en,
    input rcc_c1_eth1rx_en,
    input rcc_c2_eth1rx_en,
    input rcc_c1_eth1rx_lpen,
    input rcc_c2_eth1rx_lpen,
    output rcc_eth1rx_hclk,
// eth1tx control signals
    input rcc_eth1tx_arcg_clk_en,
    input rcc_c1_eth1tx_en,
    input rcc_c2_eth1tx_en,
    input rcc_c1_eth1tx_lpen,
    input rcc_c2_eth1tx_lpen,
    output rcc_eth1tx_hclk,
// eth1mac control signals
    input rcc_eth1mac_arcg_clk_en,
    input rcc_c1_eth1mac_en,
    input rcc_c2_eth1mac_en,
    input rcc_c1_eth1mac_lpen,
    input rcc_c2_eth1mac_lpen,
    output rcc_eth1mac_hclk,
// adc12 control signals
    input rcc_adc12_arcg_clk_en,
    input rcc_c1_adc12_en,
    input rcc_c2_adc12_en,
    input rcc_c1_adc12_lpen,
    input rcc_c2_adc12_lpen,
    output rcc_adc12_hclk,
    output rcc_adc12_ker_clk,
// dma2 control signals
    input rcc_dma2_arcg_clk_en,
    input rcc_c1_dma2_en,
    input rcc_c2_dma2_en,
    input rcc_c1_dma2_lpen,
    input rcc_c2_dma2_lpen,
    output rcc_dma2_hclk,
// dma1 control signals
    input rcc_dma1_arcg_clk_en,
    input rcc_c1_dma1_en,
    input rcc_c2_dma1_en,
    input rcc_c1_dma1_lpen,
    input rcc_c2_dma1_lpen,
    output rcc_dma1_hclk,
// sram3 control signals
    input rcc_sram3_arcg_clk_en,
    input rcc_c1_sram3_en,
    input rcc_c1_sram3_lpen,
    input rcc_c2_sram3_lpen,
    output rcc_sram3_hclk,
// sram2 control signals
    input rcc_sram2_arcg_clk_en,
    input rcc_c1_sram2_en,
    input rcc_c1_sram2_lpen,
    input rcc_c2_sram2_lpen,
    output rcc_sram2_hclk,
// sram1 control signals
    input rcc_sram1_arcg_clk_en,
    input rcc_c1_sram1_en,
    input rcc_c1_sram1_lpen,
    input rcc_c2_sram1_lpen,
    output rcc_sram1_hclk,
// sdmmc2 control signals
    input rcc_sdmmc2_arcg_clk_en,
    input rcc_c1_sdmmc2_en,
    input rcc_c2_sdmmc2_en,
    input rcc_c1_sdmmc2_lpen,
    input rcc_c2_sdmmc2_lpen,
    output rcc_sdmmc2_hclk,
    output rcc_sdmmc2_ker_clk,
// rng control signals
    input rcc_rng_arcg_clk_en,
    input rcc_c1_rng_en,
    input rcc_c2_rng_en,
    input rcc_c1_rng_lpen,
    input rcc_c2_rng_lpen,
    output rcc_rng_hclk,
    output rcc_rng_ker_clk,
// hash control signals
    input rcc_hash_arcg_clk_en,
    input rcc_c1_hash_en,
    input rcc_c2_hash_en,
    input rcc_c1_hash_lpen,
    input rcc_c2_hash_lpen,
    output rcc_hash_hclk,
// crypt control signals
    input rcc_crypt_arcg_clk_en,
    input rcc_c1_crypt_en,
    input rcc_c2_crypt_en,
    input rcc_c1_crypt_lpen,
    input rcc_c2_crypt_lpen,
    output rcc_crypt_hclk,
// dcmi control signals
    input rcc_dcmi_arcg_clk_en,
    input rcc_c1_dcmi_en,
    input rcc_c2_dcmi_en,
    input rcc_c1_dcmi_lpen,
    input rcc_c2_dcmi_lpen,
    output rcc_dcmi_hclk,
// ramecc2 control signals
    input rcc_ramecc2_arcg_clk_en,
    output rcc_ramecc2_hclk,
// uart8 control signals
    input rcc_uart8_arcg_clk_en,
    input rcc_c1_uart8_en,
    input rcc_c2_uart8_en,
    input rcc_c1_uart8_lpen,
    input rcc_c2_uart8_lpen,
    input uart8_ker_clk_req,
    output rcc_uart8_pclk,
    output rcc_uart8_ker_clk,
// uart7 control signals
    input rcc_uart7_arcg_clk_en,
    input rcc_c1_uart7_en,
    input rcc_c2_uart7_en,
    input rcc_c1_uart7_lpen,
    input rcc_c2_uart7_lpen,
    input uart7_ker_clk_req,
    output rcc_uart7_pclk,
    output rcc_uart7_ker_clk,
// dac12 control signals
    input rcc_dac12_arcg_clk_en,
    input rcc_c1_dac12_en,
    input rcc_c2_dac12_en,
    input rcc_c1_dac12_lpen,
    input rcc_c2_dac12_lpen,
    output rcc_dac12_pclk,
// hdmicec control signals
    input rcc_hdmicec_arcg_clk_en,
    input rcc_c1_hdmicec_en,
    input rcc_c2_hdmicec_en,
    input rcc_c1_hdmicec_lpen,
    input rcc_c2_hdmicec_lpen,
    output rcc_hdmicec_pclk,
    output rcc_hdmicec_ker_clk,
// i2c3 control signals
    input rcc_i2c3_arcg_clk_en,
    input rcc_c1_i2c3_en,
    input rcc_c2_i2c3_en,
    input rcc_c1_i2c3_lpen,
    input rcc_c2_i2c3_lpen,
    input i2c3_ker_clk_req,
    output rcc_i2c3_pclk,
    output rcc_i2c3_ker_clk,
// i2c2 control signals
    input rcc_i2c2_arcg_clk_en,
    input rcc_c1_i2c2_en,
    input rcc_c2_i2c2_en,
    input rcc_c1_i2c2_lpen,
    input rcc_c2_i2c2_lpen,
    input i2c2_ker_clk_req,
    output rcc_i2c2_pclk,
    output rcc_i2c2_ker_clk,
// i2c1 control signals
    input rcc_i2c1_arcg_clk_en,
    input rcc_c1_i2c1_en,
    input rcc_c2_i2c1_en,
    input rcc_c1_i2c1_lpen,
    input rcc_c2_i2c1_lpen,
    input i2c1_ker_clk_req,
    output rcc_i2c1_pclk,
    output rcc_i2c1_ker_clk,
// uart5 control signals
    input rcc_uart5_arcg_clk_en,
    input rcc_c1_uart5_en,
    input rcc_c2_uart5_en,
    input rcc_c1_uart5_lpen,
    input rcc_c2_uart5_lpen,
    input uart5_ker_clk_req,
    output rcc_uart5_pclk,
    output rcc_uart5_ker_clk,
// uart4 control signals
    input rcc_uart4_arcg_clk_en,
    input rcc_c1_uart4_en,
    input rcc_c2_uart4_en,
    input rcc_c1_uart4_lpen,
    input rcc_c2_uart4_lpen,
    input uart4_ker_clk_req,
    output rcc_uart4_pclk,
    output rcc_uart4_ker_clk,
// usart3 control signals
    input rcc_usart3_arcg_clk_en,
    input rcc_c1_usart3_en,
    input rcc_c2_usart3_en,
    input rcc_c1_usart3_lpen,
    input rcc_c2_usart3_lpen,
    input usart3_ker_clk_req,
    output rcc_usart3_pclk,
    output rcc_usart3_ker_clk,
// usart2 control signals
    input rcc_usart2_arcg_clk_en,
    input rcc_c1_usart2_en,
    input rcc_c2_usart2_en,
    input rcc_c1_usart2_lpen,
    input rcc_c2_usart2_lpen,
    input usart2_ker_clk_req,
    output rcc_usart2_pclk,
    output rcc_usart2_ker_clk,
// spdifrx control signals
    input rcc_spdifrx_arcg_clk_en,
    input rcc_c1_spdifrx_en,
    input rcc_c2_spdifrx_en,
    input rcc_c1_spdifrx_lpen,
    input rcc_c2_spdifrx_lpen,
    output rcc_spdifrx_pclk,
    output rcc_spdifrx_ker_clk,
// spi3 control signals
    input rcc_spi3_arcg_clk_en,
    input rcc_c1_spi3_en,
    input rcc_c2_spi3_en,
    input rcc_c1_spi3_lpen,
    input rcc_c2_spi3_lpen,
    output rcc_spi3_pclk,
    output rcc_spi3_ker_clk,
// spi2 control signals
    input rcc_spi2_arcg_clk_en,
    input rcc_c1_spi2_en,
    input rcc_c2_spi2_en,
    input rcc_c1_spi2_lpen,
    input rcc_c2_spi2_lpen,
    output rcc_spi2_pclk,
    output rcc_spi2_ker_clk,
// wwdg2 control signals
    input rcc_wwdg2_arcg_clk_en,
    input rcc_c1_wwdg2_en,
    input rcc_c2_wwdg2_en,
    input rcc_c1_wwdg2_lpen,
    input rcc_c2_wwdg2_lpen,
    output rcc_wwdg2_pclk,
// lptim1 control signals
    input rcc_lptim1_arcg_clk_en,
    input rcc_c1_lptim1_en,
    input rcc_c2_lptim1_en,
    input rcc_c1_lptim1_lpen,
    input rcc_c2_lptim1_lpen,
    output rcc_lptim1_pclk,
    output rcc_lptim1_ker_clk,
// tim14 control signals
    input rcc_tim14_arcg_clk_en,
    input rcc_c1_tim14_en,
    input rcc_c2_tim14_en,
    input rcc_c1_tim14_lpen,
    input rcc_c2_tim14_lpen,
    output rcc_tim14_pclk,
    output rcc_tim14_ker_clk,
// tim13 control signals
    input rcc_tim13_arcg_clk_en,
    input rcc_c1_tim13_en,
    input rcc_c2_tim13_en,
    input rcc_c1_tim13_lpen,
    input rcc_c2_tim13_lpen,
    output rcc_tim13_pclk,
    output rcc_tim13_ker_clk,
// tim12 control signals
    input rcc_tim12_arcg_clk_en,
    input rcc_c1_tim12_en,
    input rcc_c2_tim12_en,
    input rcc_c1_tim12_lpen,
    input rcc_c2_tim12_lpen,
    output rcc_tim12_pclk,
    output rcc_tim12_ker_clk,
// tim7 control signals
    input rcc_tim7_arcg_clk_en,
    input rcc_c1_tim7_en,
    input rcc_c2_tim7_en,
    input rcc_c1_tim7_lpen,
    input rcc_c2_tim7_lpen,
    output rcc_tim7_pclk,
    output rcc_tim7_ker_clk,
// tim6 control signals
    input rcc_tim6_arcg_clk_en,
    input rcc_c1_tim6_en,
    input rcc_c2_tim6_en,
    input rcc_c1_tim6_lpen,
    input rcc_c2_tim6_lpen,
    output rcc_tim6_pclk,
    output rcc_tim6_ker_clk,
// tim5 control signals
    input rcc_tim5_arcg_clk_en,
    input rcc_c1_tim5_en,
    input rcc_c2_tim5_en,
    input rcc_c1_tim5_lpen,
    input rcc_c2_tim5_lpen,
    output rcc_tim5_pclk,
    output rcc_tim5_ker_clk,
// tim4 control signals
    input rcc_tim4_arcg_clk_en,
    input rcc_c1_tim4_en,
    input rcc_c2_tim4_en,
    input rcc_c1_tim4_lpen,
    input rcc_c2_tim4_lpen,
    output rcc_tim4_pclk,
    output rcc_tim4_ker_clk,
// tim3 control signals
    input rcc_tim3_arcg_clk_en,
    input rcc_c1_tim3_en,
    input rcc_c2_tim3_en,
    input rcc_c1_tim3_lpen,
    input rcc_c2_tim3_lpen,
    output rcc_tim3_pclk,
    output rcc_tim3_ker_clk,
// tim2 control signals
    input rcc_tim2_arcg_clk_en,
    input rcc_c1_tim2_en,
    input rcc_c2_tim2_en,
    input rcc_c1_tim2_lpen,
    input rcc_c2_tim2_lpen,
    output rcc_tim2_pclk,
    output rcc_tim2_ker_clk,
// fdcan control signals
    input rcc_fdcan_arcg_clk_en,
    input rcc_c1_fdcan_en,
    input rcc_c2_fdcan_en,
    input rcc_c1_fdcan_lpen,
    input rcc_c2_fdcan_lpen,
    output rcc_fdcan_pclk,
    output rcc_fdcan_ker_clk,
// mdios control signals
    input rcc_mdios_arcg_clk_en,
    input rcc_c1_mdios_en,
    input rcc_c2_mdios_en,
    input rcc_c1_mdios_lpen,
    input rcc_c2_mdios_lpen,
    output rcc_mdios_pclk,
// opamp control signals
    input rcc_opamp_arcg_clk_en,
    input rcc_c1_opamp_en,
    input rcc_c2_opamp_en,
    input rcc_c1_opamp_lpen,
    input rcc_c2_opamp_lpen,
    output rcc_opamp_pclk,
// swpmi control signals
    input rcc_swpmi_arcg_clk_en,
    input rcc_c1_swpmi_en,
    input rcc_c2_swpmi_en,
    input rcc_c1_swpmi_lpen,
    input rcc_c2_swpmi_lpen,
    output rcc_swpmi_pclk,
    output rcc_swpmi_ker_clk,
// crs control signals
    input rcc_crs_arcg_clk_en,
    input rcc_c1_crs_en,
    input rcc_c2_crs_en,
    input rcc_c1_crs_lpen,
    input rcc_c2_crs_lpen,
    output rcc_crs_pclk,
// hrtim control signals
    input rcc_hrtim_arcg_clk_en,
    input rcc_c1_hrtim_en,
    input rcc_c2_hrtim_en,
    input rcc_c1_hrtim_lpen,
    input rcc_c2_hrtim_lpen,
    output rcc_hrtim_pclk,
    output rcc_hrtim_ker_clk,
// dfsdm1 control signals
    input rcc_dfsdm1_arcg_clk_en,
    input rcc_c1_dfsdm1_en,
    input rcc_c2_dfsdm1_en,
    input rcc_c1_dfsdm1_lpen,
    input rcc_c2_dfsdm1_lpen,
    output rcc_dfsdm1_pclk,
    output rcc_dfsdm1_ker_clk_0,
    output rcc_dfsdm1_ker_clk_1,
// sai3 control signals
    input rcc_sai3_arcg_clk_en,
    input rcc_c1_sai3_en,
    input rcc_c2_sai3_en,
    input rcc_c1_sai3_lpen,
    input rcc_c2_sai3_lpen,
    output rcc_sai3_pclk,
    output rcc_sai3_ker_clk,
// sai2 control signals
    input rcc_sai2_arcg_clk_en,
    input rcc_c1_sai2_en,
    input rcc_c2_sai2_en,
    input rcc_c1_sai2_lpen,
    input rcc_c2_sai2_lpen,
    output rcc_sai2_pclk,
    output rcc_sai2_ker_clk,
// sai1 control signals
    input rcc_sai1_arcg_clk_en,
    input rcc_c1_sai1_en,
    input rcc_c2_sai1_en,
    input rcc_c1_sai1_lpen,
    input rcc_c2_sai1_lpen,
    output rcc_sai1_pclk,
    output rcc_sai1_ker_clk,
// spi5 control signals
    input rcc_spi5_arcg_clk_en,
    input rcc_c1_spi5_en,
    input rcc_c2_spi5_en,
    input rcc_c1_spi5_lpen,
    input rcc_c2_spi5_lpen,
    output rcc_spi5_pclk,
    output rcc_spi5_ker_clk,
// tim17 control signals
    input rcc_tim17_arcg_clk_en,
    input rcc_c1_tim17_en,
    input rcc_c2_tim17_en,
    input rcc_c1_tim17_lpen,
    input rcc_c2_tim17_lpen,
    output rcc_tim17_pclk,
    output rcc_tim17_ker_clk,
// tim16 control signals
    input rcc_tim16_arcg_clk_en,
    input rcc_c1_tim16_en,
    input rcc_c2_tim16_en,
    input rcc_c1_tim16_lpen,
    input rcc_c2_tim16_lpen,
    output rcc_tim16_pclk,
    output rcc_tim16_ker_clk,
// tim15 control signals
    input rcc_tim15_arcg_clk_en,
    input rcc_c1_tim15_en,
    input rcc_c2_tim15_en,
    input rcc_c1_tim15_lpen,
    input rcc_c2_tim15_lpen,
    output rcc_tim15_pclk,
    output rcc_tim15_ker_clk,
// spi4 control signals
    input rcc_spi4_arcg_clk_en,
    input rcc_c1_spi4_en,
    input rcc_c2_spi4_en,
    input rcc_c1_spi4_lpen,
    input rcc_c2_spi4_lpen,
    output rcc_spi4_pclk,
    output rcc_spi4_ker_clk,
// spi1 control signals
    input rcc_spi1_arcg_clk_en,
    input rcc_c1_spi1_en,
    input rcc_c2_spi1_en,
    input rcc_c1_spi1_lpen,
    input rcc_c2_spi1_lpen,
    output rcc_spi1_pclk,
    output rcc_spi1_ker_clk,
// usart6 control signals
    input rcc_usart6_arcg_clk_en,
    input rcc_c1_usart6_en,
    input rcc_c2_usart6_en,
    input rcc_c1_usart6_lpen,
    input rcc_c2_usart6_lpen,
    input usart6_ker_clk_req,
    output rcc_usart6_pclk,
    output rcc_usart6_ker_clk,
// usart1 control signals
    input rcc_usart1_arcg_clk_en,
    input rcc_c1_usart1_en,
    input rcc_c2_usart1_en,
    input rcc_c1_usart1_lpen,
    input rcc_c2_usart1_lpen,
    input usart1_ker_clk_req,
    output rcc_usart1_pclk,
    output rcc_usart1_ker_clk,
// tim8 control signals
    input rcc_tim8_arcg_clk_en,
    input rcc_c1_tim8_en,
    input rcc_c2_tim8_en,
    input rcc_c1_tim8_lpen,
    input rcc_c2_tim8_lpen,
    output rcc_tim8_pclk,
    output rcc_tim8_ker_clk,
// tim1 control signals
    input rcc_tim1_arcg_clk_en,
    input rcc_c1_tim1_en,
    input rcc_c2_tim1_en,
    input rcc_c1_tim1_lpen,
    input rcc_c2_tim1_lpen,
    output rcc_tim1_pclk,
    output rcc_tim1_ker_clk,
// sram4 control signals
    input rcc_sram4_arcg_clk_en,
    input rcc_c1_sram4_lpen,
    input rcc_c2_sram4_lpen,
    input rcc_sram4_amen,
    output rcc_sram4_hclk,
// bkpram control signals
    input rcc_bkpram_arcg_clk_en,
    input rcc_c1_bkpram_en,
    input rcc_c2_bkpram_en,
    input rcc_c1_bkpram_lpen,
    input rcc_c2_bkpram_lpen,
    input rcc_bkpram_amen,
    output rcc_bkpram_hclk,
// ramecc3 control signals
    input rcc_ramecc3_arcg_clk_en,
    output rcc_ramecc3_hclk,
// hsem control signals
    input rcc_hsem_arcg_clk_en,
    input rcc_c1_hsem_en,
    input rcc_c2_hsem_en,
    output rcc_hsem_hclk,
// adc3 control signals
    input rcc_adc3_arcg_clk_en,
    input rcc_c1_adc3_en,
    input rcc_c2_adc3_en,
    input rcc_c1_adc3_lpen,
    input rcc_c2_adc3_lpen,
    input rcc_adc3_amen,
    output rcc_adc3_hclk,
    output rcc_adc3_ker_clk,
// bdma control signals
    input rcc_bdma_arcg_clk_en,
    input rcc_c1_bdma_en,
    input rcc_c2_bdma_en,
    input rcc_c1_bdma_lpen,
    input rcc_c2_bdma_lpen,
    input rcc_bdma_amen,
    output rcc_bdma_hclk,
// crc control signals
    input rcc_crc_arcg_clk_en,
    input rcc_c1_crc_en,
    input rcc_c2_crc_en,
    input rcc_c1_crc_lpen,
    input rcc_c2_crc_lpen,
    input rcc_crc_amen,
    output rcc_crc_hclk,
// gpiok control signals
    input rcc_gpiok_arcg_clk_en,
    input rcc_c1_gpiok_en,
    input rcc_c2_gpiok_en,
    input rcc_c1_gpiok_lpen,
    input rcc_c2_gpiok_lpen,
    output rcc_gpiok_hclk,
// gpioj control signals
    input rcc_gpioj_arcg_clk_en,
    input rcc_c1_gpioj_en,
    input rcc_c2_gpioj_en,
    input rcc_c1_gpioj_lpen,
    input rcc_c2_gpioj_lpen,
    output rcc_gpioj_hclk,
// gpioi control signals
    input rcc_gpioi_arcg_clk_en,
    input rcc_c1_gpioi_en,
    input rcc_c2_gpioi_en,
    input rcc_c1_gpioi_lpen,
    input rcc_c2_gpioi_lpen,
    output rcc_gpioi_hclk,
// gpioh control signals
    input rcc_gpioh_arcg_clk_en,
    input rcc_c1_gpioh_en,
    input rcc_c2_gpioh_en,
    input rcc_c1_gpioh_lpen,
    input rcc_c2_gpioh_lpen,
    output rcc_gpioh_hclk,
// gpiog control signals
    input rcc_gpiog_arcg_clk_en,
    input rcc_c1_gpiog_en,
    input rcc_c2_gpiog_en,
    input rcc_c1_gpiog_lpen,
    input rcc_c2_gpiog_lpen,
    output rcc_gpiog_hclk,
// gpiof control signals
    input rcc_gpiof_arcg_clk_en,
    input rcc_c1_gpiof_en,
    input rcc_c2_gpiof_en,
    input rcc_c1_gpiof_lpen,
    input rcc_c2_gpiof_lpen,
    output rcc_gpiof_hclk,
// gpioe control signals
    input rcc_gpioe_arcg_clk_en,
    input rcc_c1_gpioe_en,
    input rcc_c2_gpioe_en,
    input rcc_c1_gpioe_lpen,
    input rcc_c2_gpioe_lpen,
    output rcc_gpioe_hclk,
// gpiod control signals
    input rcc_gpiod_arcg_clk_en,
    input rcc_c1_gpiod_en,
    input rcc_c2_gpiod_en,
    input rcc_c1_gpiod_lpen,
    input rcc_c2_gpiod_lpen,
    output rcc_gpiod_hclk,
// gpioc control signals
    input rcc_gpioc_arcg_clk_en,
    input rcc_c1_gpioc_en,
    input rcc_c2_gpioc_en,
    input rcc_c1_gpioc_lpen,
    input rcc_c2_gpioc_lpen,
    output rcc_gpioc_hclk,
// gpiob control signals
    input rcc_gpiob_arcg_clk_en,
    input rcc_c1_gpiob_en,
    input rcc_c2_gpiob_en,
    input rcc_c1_gpiob_lpen,
    input rcc_c2_gpiob_lpen,
    output rcc_gpiob_hclk,
// gpioa control signals
    input rcc_gpioa_arcg_clk_en,
    input rcc_c1_gpioa_en,
    input rcc_c2_gpioa_en,
    input rcc_c1_gpioa_lpen,
    input rcc_c2_gpioa_lpen,
    output rcc_gpioa_hclk,
// rcc control signals
    input rcc_rcc_arcg_clk_en,
    output rcc_rcc_hclk,
// pwr control signals
    input rcc_pwr_arcg_clk_en,
    output rcc_pwr_hclk,
// sai4 control signals
    input rcc_sai4_arcg_clk_en,
    input rcc_c1_sai4_en,
    input rcc_c2_sai4_en,
    input rcc_c1_sai4_lpen,
    input rcc_c2_sai4_lpen,
    input rcc_sai4_amen,
    output rcc_sai4_pclk,
    output rcc_sai4_ker_clk_0,
    output rcc_sai4_ker_clk_1,
// rtc control signals
    input rcc_rtc_arcg_clk_en,
    input rcc_c1_rtc_en,
    input rcc_c2_rtc_en,
    input rcc_c1_rtc_lpen,
    input rcc_c2_rtc_lpen,
    input rcc_rtc_amen,
    output rcc_rtc_pclk,
// vref control signals
    input rcc_vref_arcg_clk_en,
    input rcc_c1_vref_en,
    input rcc_c2_vref_en,
    input rcc_c1_vref_lpen,
    input rcc_c2_vref_lpen,
    input rcc_vref_amen,
    output rcc_vref_pclk,
// comp12 control signals
    input rcc_comp12_arcg_clk_en,
    input rcc_c1_comp12_en,
    input rcc_c2_comp12_en,
    input rcc_c1_comp12_lpen,
    input rcc_c2_comp12_lpen,
    input rcc_comp12_amen,
    output rcc_comp12_pclk,
// lptim5 control signals
    input rcc_lptim5_arcg_clk_en,
    input rcc_c1_lptim5_en,
    input rcc_c2_lptim5_en,
    input rcc_c1_lptim5_lpen,
    input rcc_c2_lptim5_lpen,
    input rcc_lptim5_amen,
    output rcc_lptim5_pclk,
    output rcc_lptim5_ker_clk,
// lptim4 control signals
    input rcc_lptim4_arcg_clk_en,
    input rcc_c1_lptim4_en,
    input rcc_c2_lptim4_en,
    input rcc_c1_lptim4_lpen,
    input rcc_c2_lptim4_lpen,
    input rcc_lptim4_amen,
    output rcc_lptim4_pclk,
    output rcc_lptim4_ker_clk,
// lptim3 control signals
    input rcc_lptim3_arcg_clk_en,
    input rcc_c1_lptim3_en,
    input rcc_c2_lptim3_en,
    input rcc_c1_lptim3_lpen,
    input rcc_c2_lptim3_lpen,
    input rcc_lptim3_amen,
    output rcc_lptim3_pclk,
    output rcc_lptim3_ker_clk,
// lptim2 control signals
    input rcc_lptim2_arcg_clk_en,
    input rcc_c1_lptim2_en,
    input rcc_c2_lptim2_en,
    input rcc_c1_lptim2_lpen,
    input rcc_c2_lptim2_lpen,
    input rcc_lptim2_amen,
    output rcc_lptim2_pclk,
    output rcc_lptim2_ker_clk,
// i2c4 control signals
    input rcc_i2c4_arcg_clk_en,
    input rcc_c1_i2c4_en,
    input rcc_c2_i2c4_en,
    input rcc_c1_i2c4_lpen,
    input rcc_c2_i2c4_lpen,
    input rcc_i2c4_amen,
    input i2c4_ker_clk_req,
    output rcc_i2c4_pclk,
    output rcc_i2c4_ker_clk,
// spi6 control signals
    input rcc_spi6_arcg_clk_en,
    input rcc_c1_spi6_en,
    input rcc_c2_spi6_en,
    input rcc_c1_spi6_lpen,
    input rcc_c2_spi6_lpen,
    input rcc_spi6_amen,
    output rcc_spi6_pclk,
    output rcc_spi6_ker_clk,
// lpuart1 control signals
    input rcc_lpuart1_arcg_clk_en,
    input rcc_c1_lpuart1_en,
    input rcc_c2_lpuart1_en,
    input rcc_c1_lpuart1_lpen,
    input rcc_c2_lpuart1_lpen,
    input rcc_lpuart1_amen,
    input lpuart1_ker_clk_req,
    output rcc_lpuart1_pclk,
    output rcc_lpuart1_ker_clk,
// syscfg control signals
    input rcc_syscfg_arcg_clk_en,
    input rcc_c1_syscfg_en,
    input rcc_c2_syscfg_en,
    input rcc_c1_syscfg_lpen,
    input rcc_c2_syscfg_lpen,
    output rcc_syscfg_pclk,
// iwdg2 control signals
    input rcc_iwdg2_arcg_clk_en,
    output rcc_iwdg2_pclk,
// iwdg1 control signals
    input rcc_iwdg1_arcg_clk_en,
    output rcc_iwdg1_pclk,
// exti control signals
    input rcc_exti_arcg_clk_en,
    output rcc_exti_pclk,
// ker clk control bits
    input [2:0] qspisel,
    input [2:0] fmcsel,
    input [2:0] sdmmcsel,
    input [2:0] usbsel,
    input [2:0] adcsel,
    input [2:0] rngsel,
    input [2:0] usart234578sel,
    input [2:0] cecsel,
    input [2:0] i2c123sel,
    input [2:0] spdifsel,
    input [2:0] spi123sel,
    input [2:0] lptim1sel,
    input [2:0] fdcansel,
    input [2:0] swpmisel,
    input [2:0] sai1sel,
    input [2:0] dfsdm1sel,
    input [2:0] sai23sel,
    input [2:0] spi45sel,
    input [2:0] usart16sel,
    input [2:0] sai4asel,
    input [2:0] sai4bsel,
    input [2:0] lptim345sel,
    input [2:0] lptim2sel,
    input [2:0] i2c4sel,
    input [2:0] spi6sel,
    input [2:0] lpuart1sel,
    output rcc_flash_rst_n,
    input qspirst,
    output rcc_qspi_rst_n,
    output rcc_axisram_rst_n,
    input fmcrst,
    output rcc_fmc_rst_n,
    input dma2drst,
    output rcc_dma2d_rst_n,
    input mdmarst,
    output rcc_mdma_rst_n,
    input ltdcrst,
    output rcc_ltdc_rst_n,
    output rcc_ramecc1_rst_n,
    output rcc_gpv_rst_n,
    output rcc_itcm_rst_n,
    output rcc_dtcm2_rst_n,
    output rcc_dtcm1_rst_n,
    input jpgdecrst,
    output rcc_jpgdec_rst_n,
    input sdmmc1rst,
    output rcc_sdmmc1_rst_n,
    output rcc_wwdg1_rst_n,
    output rcc_usb2ulpi_rst_n,
    input usb2otgrst,
    output rcc_usb2otg_rst_n,
    output rcc_usb1ulpi_rst_n,
    input usb1otgrst,
    output rcc_usb1otg_rst_n,
    output rcc_eth1rx_rst_n,
    output rcc_eth1tx_rst_n,
    input eth1macrst,
    output rcc_eth1mac_rst_n,
    input adc12rst,
    output rcc_adc12_rst_n,
    input dma2rst,
    output rcc_dma2_rst_n,
    input dma1rst,
    output rcc_dma1_rst_n,
    output rcc_sram3_rst_n,
    output rcc_sram2_rst_n,
    output rcc_sram1_rst_n,
    input sdmmc2rst,
    output rcc_sdmmc2_rst_n,
    input rngrst,
    output rcc_rng_rst_n,
    input hashrst,
    output rcc_hash_rst_n,
    input cryptrst,
    output rcc_crypt_rst_n,
    input dcmirst,
    output rcc_dcmi_rst_n,
    output rcc_ramecc2_rst_n,
    input uart8rst,
    output rcc_uart8_rst_n,
    input uart7rst,
    output rcc_uart7_rst_n,
    input dac12rst,
    output rcc_dac12_rst_n,
    input hdmicecrst,
    output rcc_hdmicec_rst_n,
    input i2c3rst,
    output rcc_i2c3_rst_n,
    input i2c2rst,
    output rcc_i2c2_rst_n,
    input i2c1rst,
    output rcc_i2c1_rst_n,
    input uart5rst,
    output rcc_uart5_rst_n,
    input uart4rst,
    output rcc_uart4_rst_n,
    input usart3rst,
    output rcc_usart3_rst_n,
    input usart2rst,
    output rcc_usart2_rst_n,
    input spdifrxrst,
    output rcc_spdifrx_rst_n,
    input spi3rst,
    output rcc_spi3_rst_n,
    input spi2rst,
    output rcc_spi2_rst_n,
    output rcc_wwdg2_rst_n,
    input lptim1rst,
    output rcc_lptim1_rst_n,
    input tim14rst,
    output rcc_tim14_rst_n,
    input tim13rst,
    output rcc_tim13_rst_n,
    input tim12rst,
    output rcc_tim12_rst_n,
    input tim7rst,
    output rcc_tim7_rst_n,
    input tim6rst,
    output rcc_tim6_rst_n,
    input tim5rst,
    output rcc_tim5_rst_n,
    input tim4rst,
    output rcc_tim4_rst_n,
    input tim3rst,
    output rcc_tim3_rst_n,
    input tim2rst,
    output rcc_tim2_rst_n,
    input fdcanrst,
    output rcc_fdcan_rst_n,
    input mdiosrst,
    output rcc_mdios_rst_n,
    input opamprst,
    output rcc_opamp_rst_n,
    input swpmirst,
    output rcc_swpmi_rst_n,
    input crsrst,
    output rcc_crs_rst_n,
    input hrtimrst,
    output rcc_hrtim_rst_n,
    input dfsdm1rst,
    output rcc_dfsdm1_rst_n,
    input sai3rst,
    output rcc_sai3_rst_n,
    input sai2rst,
    output rcc_sai2_rst_n,
    input sai1rst,
    output rcc_sai1_rst_n,
    input spi5rst,
    output rcc_spi5_rst_n,
    input tim17rst,
    output rcc_tim17_rst_n,
    input tim16rst,
    output rcc_tim16_rst_n,
    input tim15rst,
    output rcc_tim15_rst_n,
    input spi4rst,
    output rcc_spi4_rst_n,
    input spi1rst,
    output rcc_spi1_rst_n,
    input usart6rst,
    output rcc_usart6_rst_n,
    input usart1rst,
    output rcc_usart1_rst_n,
    input tim8rst,
    output rcc_tim8_rst_n,
    input tim1rst,
    output rcc_tim1_rst_n,
    output rcc_sram4_rst_n,
    output rcc_bkpram_rst_n,
    output rcc_ramecc3_rst_n,
    input hsemrst,
    output rcc_hsem_rst_n,
    input adc3rst,
    output rcc_adc3_rst_n,
    input bdmarst,
    output rcc_bdma_rst_n,
    input crcrst,
    output rcc_crc_rst_n,
    input gpiokrst,
    output rcc_gpiok_rst_n,
    input gpiojrst,
    output rcc_gpioj_rst_n,
    input gpioirst,
    output rcc_gpioi_rst_n,
    input gpiohrst,
    output rcc_gpioh_rst_n,
    input gpiogrst,
    output rcc_gpiog_rst_n,
    input gpiofrst,
    output rcc_gpiof_rst_n,
    input gpioerst,
    output rcc_gpioe_rst_n,
    input gpiodrst,
    output rcc_gpiod_rst_n,
    input gpiocrst,
    output rcc_gpioc_rst_n,
    input gpiobrst,
    output rcc_gpiob_rst_n,
    input gpioarst,
    output rcc_gpioa_rst_n,
    output rcc_rcc_rst_n,
    output rcc_pwr_rst_n,
    input sai4rst,
    output rcc_sai4_rst_n,
    output rcc_rtc_rst_n,
    input vrefrst,
    output rcc_vref_rst_n,
    input comp12rst,
    output rcc_comp12_rst_n,
    input lptim5rst,
    output rcc_lptim5_rst_n,
    input lptim4rst,
    output rcc_lptim4_rst_n,
    input lptim3rst,
    output rcc_lptim3_rst_n,
    input lptim2rst,
    output rcc_lptim2_rst_n,
    input i2c4rst,
    output rcc_i2c4_rst_n,
    input spi6rst,
    output rcc_spi6_rst_n,
    input lpuart1rst,
    output rcc_lpuart1_rst_n,
    input syscfgrst,
    output rcc_syscfg_rst_n,
    output rcc_iwdg2_rst_n,
    output rcc_iwdg1_rst_n,
    output rcc_exti_rst_n,
// dx reset
    input d1_rst_n,
    input d2_rst_n
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
    // usart234578sel ker clock source select
    wire rcc_usart234578sel_clk;
    // cecsel ker clock source select
    wire rcc_cecsel_clk;
    // i2c123sel ker clock source select
    wire rcc_i2c123sel_clk;
    // spdifsel ker clock source select
    wire rcc_spdifsel_clk;
    // spi123sel ker clock source select
    wire rcc_spi123sel_clk;
    // lptim1sel ker clock source select
    wire rcc_lptim1sel_clk;
    // fdcansel ker clock source select
    wire rcc_fdcansel_clk;
    // swpmisel ker clock source select
    wire rcc_swpmisel_clk;
    // sai1sel ker clock source select
    wire rcc_sai1sel_clk;
    // dfsdm1sel ker clock source select
    wire rcc_dfsdm1sel_clk;
    // sai23sel ker clock source select
    wire rcc_sai23sel_clk;
    // spi45sel ker clock source select
    wire rcc_spi45sel_clk;
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
wire [1:0] flash_src_bus_clks;
wire [1:0] flash_bus_clks;
wire [1:0] qspi_src_bus_clks;
wire [1:0] qspi_bus_clks;
wire [0:0] axisram_src_bus_clks;
wire [0:0] axisram_bus_clks;
wire [1:0] fmc_src_bus_clks;
wire [1:0] fmc_bus_clks;
wire [1:0] dma2d_src_bus_clks;
wire [1:0] dma2d_bus_clks;
wire [1:0] mdma_src_bus_clks;
wire [1:0] mdma_bus_clks;
wire [1:0] ltdc_src_bus_clks;
wire [1:0] ltdc_bus_clks;
wire [0:0] ramecc1_src_bus_clks;
wire [0:0] ramecc1_bus_clks;
wire [0:0] gpv_src_bus_clks;
wire [0:0] gpv_bus_clks;
wire [0:0] itcm_src_bus_clks;
wire [0:0] itcm_bus_clks;
wire [0:0] dtcm2_src_bus_clks;
wire [0:0] dtcm2_bus_clks;
wire [0:0] dtcm1_src_bus_clks;
wire [0:0] dtcm1_bus_clks;
wire [0:0] jpgdec_src_bus_clks;
wire [0:0] jpgdec_bus_clks;
wire [0:0] sdmmc1_src_bus_clks;
wire [0:0] sdmmc1_bus_clks;
wire [0:0] wwdg1_src_bus_clks;
wire [0:0] wwdg1_bus_clks;
wire [0:0] usb2ulpi_src_bus_clks;
wire [0:0] usb2ulpi_bus_clks;
wire [0:0] usb2otg_src_bus_clks;
wire [0:0] usb2otg_bus_clks;
wire [0:0] usb1ulpi_src_bus_clks;
wire [0:0] usb1ulpi_bus_clks;
wire [0:0] usb1otg_src_bus_clks;
wire [0:0] usb1otg_bus_clks;
wire [0:0] eth1rx_src_bus_clks;
wire [0:0] eth1rx_bus_clks;
wire [0:0] eth1tx_src_bus_clks;
wire [0:0] eth1tx_bus_clks;
wire [0:0] eth1mac_src_bus_clks;
wire [0:0] eth1mac_bus_clks;
wire [0:0] adc12_src_bus_clks;
wire [0:0] adc12_bus_clks;
wire [0:0] dma2_src_bus_clks;
wire [0:0] dma2_bus_clks;
wire [0:0] dma1_src_bus_clks;
wire [0:0] dma1_bus_clks;
wire [0:0] sram3_src_bus_clks;
wire [0:0] sram3_bus_clks;
wire [0:0] sram2_src_bus_clks;
wire [0:0] sram2_bus_clks;
wire [0:0] sram1_src_bus_clks;
wire [0:0] sram1_bus_clks;
wire [0:0] sdmmc2_src_bus_clks;
wire [0:0] sdmmc2_bus_clks;
wire [0:0] rng_src_bus_clks;
wire [0:0] rng_bus_clks;
wire [0:0] hash_src_bus_clks;
wire [0:0] hash_bus_clks;
wire [0:0] crypt_src_bus_clks;
wire [0:0] crypt_bus_clks;
wire [0:0] dcmi_src_bus_clks;
wire [0:0] dcmi_bus_clks;
wire [0:0] ramecc2_src_bus_clks;
wire [0:0] ramecc2_bus_clks;
wire [0:0] uart8_src_bus_clks;
wire [0:0] uart8_bus_clks;
wire [0:0] uart7_src_bus_clks;
wire [0:0] uart7_bus_clks;
wire [0:0] dac12_src_bus_clks;
wire [0:0] dac12_bus_clks;
wire [0:0] hdmicec_src_bus_clks;
wire [0:0] hdmicec_bus_clks;
wire [0:0] i2c3_src_bus_clks;
wire [0:0] i2c3_bus_clks;
wire [0:0] i2c2_src_bus_clks;
wire [0:0] i2c2_bus_clks;
wire [0:0] i2c1_src_bus_clks;
wire [0:0] i2c1_bus_clks;
wire [0:0] uart5_src_bus_clks;
wire [0:0] uart5_bus_clks;
wire [0:0] uart4_src_bus_clks;
wire [0:0] uart4_bus_clks;
wire [0:0] usart3_src_bus_clks;
wire [0:0] usart3_bus_clks;
wire [0:0] usart2_src_bus_clks;
wire [0:0] usart2_bus_clks;
wire [0:0] spdifrx_src_bus_clks;
wire [0:0] spdifrx_bus_clks;
wire [0:0] spi3_src_bus_clks;
wire [0:0] spi3_bus_clks;
wire [0:0] spi2_src_bus_clks;
wire [0:0] spi2_bus_clks;
wire [0:0] wwdg2_src_bus_clks;
wire [0:0] wwdg2_bus_clks;
wire [0:0] lptim1_src_bus_clks;
wire [0:0] lptim1_bus_clks;
wire [0:0] tim14_src_bus_clks;
wire [0:0] tim14_bus_clks;
wire [0:0] tim13_src_bus_clks;
wire [0:0] tim13_bus_clks;
wire [0:0] tim12_src_bus_clks;
wire [0:0] tim12_bus_clks;
wire [0:0] tim7_src_bus_clks;
wire [0:0] tim7_bus_clks;
wire [0:0] tim6_src_bus_clks;
wire [0:0] tim6_bus_clks;
wire [0:0] tim5_src_bus_clks;
wire [0:0] tim5_bus_clks;
wire [0:0] tim4_src_bus_clks;
wire [0:0] tim4_bus_clks;
wire [0:0] tim3_src_bus_clks;
wire [0:0] tim3_bus_clks;
wire [0:0] tim2_src_bus_clks;
wire [0:0] tim2_bus_clks;
wire [0:0] fdcan_src_bus_clks;
wire [0:0] fdcan_bus_clks;
wire [0:0] mdios_src_bus_clks;
wire [0:0] mdios_bus_clks;
wire [0:0] opamp_src_bus_clks;
wire [0:0] opamp_bus_clks;
wire [0:0] swpmi_src_bus_clks;
wire [0:0] swpmi_bus_clks;
wire [0:0] crs_src_bus_clks;
wire [0:0] crs_bus_clks;
wire [0:0] hrtim_src_bus_clks;
wire [0:0] hrtim_bus_clks;
wire [0:0] dfsdm1_src_bus_clks;
wire [0:0] dfsdm1_bus_clks;
wire [0:0] sai3_src_bus_clks;
wire [0:0] sai3_bus_clks;
wire [0:0] sai2_src_bus_clks;
wire [0:0] sai2_bus_clks;
wire [0:0] sai1_src_bus_clks;
wire [0:0] sai1_bus_clks;
wire [0:0] spi5_src_bus_clks;
wire [0:0] spi5_bus_clks;
wire [0:0] tim17_src_bus_clks;
wire [0:0] tim17_bus_clks;
wire [0:0] tim16_src_bus_clks;
wire [0:0] tim16_bus_clks;
wire [0:0] tim15_src_bus_clks;
wire [0:0] tim15_bus_clks;
wire [0:0] spi4_src_bus_clks;
wire [0:0] spi4_bus_clks;
wire [0:0] spi1_src_bus_clks;
wire [0:0] spi1_bus_clks;
wire [0:0] usart6_src_bus_clks;
wire [0:0] usart6_bus_clks;
wire [0:0] usart1_src_bus_clks;
wire [0:0] usart1_bus_clks;
wire [0:0] tim8_src_bus_clks;
wire [0:0] tim8_bus_clks;
wire [0:0] tim1_src_bus_clks;
wire [0:0] tim1_bus_clks;
wire [0:0] sram4_src_bus_clks;
wire [0:0] sram4_bus_clks;
wire [0:0] bkpram_src_bus_clks;
wire [0:0] bkpram_bus_clks;
wire [0:0] ramecc3_src_bus_clks;
wire [0:0] ramecc3_bus_clks;
wire [0:0] hsem_src_bus_clks;
wire [0:0] hsem_bus_clks;
wire [0:0] adc3_src_bus_clks;
wire [0:0] adc3_bus_clks;
wire [0:0] bdma_src_bus_clks;
wire [0:0] bdma_bus_clks;
wire [0:0] crc_src_bus_clks;
wire [0:0] crc_bus_clks;
wire [0:0] gpiok_src_bus_clks;
wire [0:0] gpiok_bus_clks;
wire [0:0] gpioj_src_bus_clks;
wire [0:0] gpioj_bus_clks;
wire [0:0] gpioi_src_bus_clks;
wire [0:0] gpioi_bus_clks;
wire [0:0] gpioh_src_bus_clks;
wire [0:0] gpioh_bus_clks;
wire [0:0] gpiog_src_bus_clks;
wire [0:0] gpiog_bus_clks;
wire [0:0] gpiof_src_bus_clks;
wire [0:0] gpiof_bus_clks;
wire [0:0] gpioe_src_bus_clks;
wire [0:0] gpioe_bus_clks;
wire [0:0] gpiod_src_bus_clks;
wire [0:0] gpiod_bus_clks;
wire [0:0] gpioc_src_bus_clks;
wire [0:0] gpioc_bus_clks;
wire [0:0] gpiob_src_bus_clks;
wire [0:0] gpiob_bus_clks;
wire [0:0] gpioa_src_bus_clks;
wire [0:0] gpioa_bus_clks;
wire [0:0] rcc_src_bus_clks;
wire [0:0] rcc_bus_clks;
wire [0:0] pwr_src_bus_clks;
wire [0:0] pwr_bus_clks;
wire [0:0] sai4_src_bus_clks;
wire [0:0] sai4_bus_clks;
wire [0:0] rtc_src_bus_clks;
wire [0:0] rtc_bus_clks;
wire [0:0] vref_src_bus_clks;
wire [0:0] vref_bus_clks;
wire [0:0] comp12_src_bus_clks;
wire [0:0] comp12_bus_clks;
wire [0:0] lptim5_src_bus_clks;
wire [0:0] lptim5_bus_clks;
wire [0:0] lptim4_src_bus_clks;
wire [0:0] lptim4_bus_clks;
wire [0:0] lptim3_src_bus_clks;
wire [0:0] lptim3_bus_clks;
wire [0:0] lptim2_src_bus_clks;
wire [0:0] lptim2_bus_clks;
wire [0:0] i2c4_src_bus_clks;
wire [0:0] i2c4_bus_clks;
wire [0:0] spi6_src_bus_clks;
wire [0:0] spi6_bus_clks;
wire [0:0] lpuart1_src_bus_clks;
wire [0:0] lpuart1_bus_clks;
wire [0:0] syscfg_src_bus_clks;
wire [0:0] syscfg_bus_clks;
wire [0:0] iwdg2_src_bus_clks;
wire [0:0] iwdg2_bus_clks;
wire [0:0] iwdg1_src_bus_clks;
wire [0:0] iwdg1_bus_clks;
wire [0:0] exti_src_bus_clks;
wire [0:0] exti_bus_clks;
    // flash clock and reset control
    assign rcc_flash_aclk = flash_bus_clks[0];
    assign  flash_src_bus_clks = {rcc_axibridge_d1_clk,rcc_ahb3bridge_d1_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (2),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (1),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_flash_per_clk_rst_control (
    .bus_clks                ( flash_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_flash_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_flash_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_flash_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_flash_lpen   ),
    .rcc_per_amen            ( rcc_flash_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (flashrst),
    .per_bus_clks            (flash_bus_clks ),
    .per_sync_rst_n          ( rcc_flash_rst_n    )
    );
    // qspi clock and reset control
    assign rcc_qspi_aclk = qspi_bus_clks[0];
    assign  qspi_src_bus_clks = {rcc_axibridge_d1_clk,rcc_ahb3bridge_d1_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 2 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 1 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_qspi_per_ker_clk_rst_control (
    .bus_clks                ( qspi_src_bus_clks ),
    .ker_src_clk             ( rcc_qspi_ker_clk ),
    .ker_clk_sel             (qspisel),
    .rcc_c1_per_en           ( rcc_c1_qspi_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_qspi_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_qspi_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_qspi_lpen   ),
    .rcc_per_amen            ( rcc_qspi_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( qspi_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( qspirst ),
    .per_bus_clks            ( qspi_bus_clks      ),
    .per_ker_clk             ( rcc_qspi_ker_clk  ),
    .per_sync_rst_n          ( rcc_qspi_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // axisram clock and reset control
    assign rcc_axisram_aclk = axisram_bus_clks[0];
    assign  axisram_src_bus_clks = {rcc_axibridge_d1_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (1),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_axisram_per_clk_rst_control (
    .bus_clks                ( axisram_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_axisram_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_axisram_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_axisram_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_axisram_lpen   ),
    .rcc_per_amen            ( rcc_axisram_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (axisramrst),
    .per_bus_clks            (axisram_bus_clks ),
    .per_sync_rst_n          ( rcc_axisram_rst_n    )
    );
    // fmc clock and reset control
    assign rcc_fmc_aclk = fmc_bus_clks[0];
    assign  fmc_src_bus_clks = {rcc_axibridge_d1_clk,rcc_ahb3bridge_d1_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 2 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 1 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_fmc_per_ker_clk_rst_control (
    .bus_clks                ( fmc_src_bus_clks ),
    .ker_src_clk             ( rcc_fmc_ker_clk ),
    .ker_clk_sel             (fmcsel),
    .rcc_c1_per_en           ( rcc_c1_fmc_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_fmc_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_fmc_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_fmc_lpen   ),
    .rcc_per_amen            ( rcc_fmc_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( fmc_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( fmcrst ),
    .per_bus_clks            ( fmc_bus_clks      ),
    .per_ker_clk             ( rcc_fmc_ker_clk  ),
    .per_sync_rst_n          ( rcc_fmc_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // dma2d clock and reset control
    assign rcc_dma2d_aclk = dma2d_bus_clks[0];
    assign  dma2d_src_bus_clks = {rcc_axibridge_d1_clk,rcc_ahb3bridge_d1_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (2),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (1),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_dma2d_per_clk_rst_control (
    .bus_clks                ( dma2d_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_dma2d_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_dma2d_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_dma2d_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_dma2d_lpen   ),
    .rcc_per_amen            ( rcc_dma2d_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (dma2drst),
    .per_bus_clks            (dma2d_bus_clks ),
    .per_sync_rst_n          ( rcc_dma2d_rst_n    )
    );
    // mdma clock and reset control
    assign rcc_mdma_aclk = mdma_bus_clks[0];
    assign  mdma_src_bus_clks = {rcc_axibridge_d1_clk,rcc_ahb3bridge_d1_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (2),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (1),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_mdma_per_clk_rst_control (
    .bus_clks                ( mdma_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_mdma_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_mdma_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_mdma_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_mdma_lpen   ),
    .rcc_per_amen            ( rcc_mdma_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (mdmarst),
    .per_bus_clks            (mdma_bus_clks ),
    .per_sync_rst_n          ( rcc_mdma_rst_n    )
    );
    // ltdc clock and reset control
    assign rcc_ltdc_aclk = ltdc_bus_clks[0];
    assign  ltdc_src_bus_clks = {rcc_axibridge_d1_clk,rcc_apb3bridge_d1_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 2 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 1 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_ltdc_per_ker_clk_rst_control (
    .bus_clks                ( ltdc_src_bus_clks ),
    .ker_src_clk             ( rcc_ltdc_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_ltdc_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_ltdc_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_ltdc_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_ltdc_lpen   ),
    .rcc_per_amen            ( rcc_ltdc_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( ltdc_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( ltdcrst ),
    .per_bus_clks            ( ltdc_bus_clks      ),
    .per_ker_clk             ( rcc_ltdc_ker_clk  ),
    .per_sync_rst_n          ( rcc_ltdc_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // ramecc1 clock and reset control
    assign  ramecc1_src_bus_clks = {rcc_ahb3bridge_d1_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (0),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (1),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (1),
    .DOMAIN                       (1),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_ramecc1_per_clk_rst_control (
    .bus_clks                ( ramecc1_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_ramecc1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_ramecc1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_ramecc1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_ramecc1_lpen   ),
    .rcc_per_amen            ( rcc_ramecc1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (ramecc1rst),
    .per_bus_clks            (ramecc1_bus_clks ),
    .per_sync_rst_n          ( rcc_ramecc1_rst_n    )
    );
    // gpv clock and reset control
    assign  gpv_src_bus_clks = {rcc_ahb3bridge_d1_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (0),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (1),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (1),
    .DOMAIN                       (1),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_gpv_per_clk_rst_control (
    .bus_clks                ( gpv_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_gpv_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_gpv_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_gpv_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_gpv_lpen   ),
    .rcc_per_amen            ( rcc_gpv_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (gpvrst),
    .per_bus_clks            (gpv_bus_clks ),
    .per_sync_rst_n          ( rcc_gpv_rst_n    )
    );
    // itcm clock and reset control
    assign  itcm_src_bus_clks = {rcc_ahb3bridge_d1_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (1),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_itcm_per_clk_rst_control (
    .bus_clks                ( itcm_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_itcm_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_itcm_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_itcm_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_itcm_lpen   ),
    .rcc_per_amen            ( rcc_itcm_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (itcmrst),
    .per_bus_clks            (itcm_bus_clks ),
    .per_sync_rst_n          ( rcc_itcm_rst_n    )
    );
    // dtcm2 clock and reset control
    assign  dtcm2_src_bus_clks = {rcc_ahb3bridge_d1_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (1),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_dtcm2_per_clk_rst_control (
    .bus_clks                ( dtcm2_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_dtcm2_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_dtcm2_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_dtcm2_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_dtcm2_lpen   ),
    .rcc_per_amen            ( rcc_dtcm2_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (dtcm2rst),
    .per_bus_clks            (dtcm2_bus_clks ),
    .per_sync_rst_n          ( rcc_dtcm2_rst_n    )
    );
    // dtcm1 clock and reset control
    assign  dtcm1_src_bus_clks = {rcc_ahb3bridge_d1_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (1),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_dtcm1_per_clk_rst_control (
    .bus_clks                ( dtcm1_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_dtcm1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_dtcm1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_dtcm1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_dtcm1_lpen   ),
    .rcc_per_amen            ( rcc_dtcm1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (dtcm1rst),
    .per_bus_clks            (dtcm1_bus_clks ),
    .per_sync_rst_n          ( rcc_dtcm1_rst_n    )
    );
    // jpgdec clock and reset control
    assign  jpgdec_src_bus_clks = {rcc_ahb3bridge_d1_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (1),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_jpgdec_per_clk_rst_control (
    .bus_clks                ( jpgdec_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_jpgdec_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_jpgdec_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_jpgdec_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_jpgdec_lpen   ),
    .rcc_per_amen            ( rcc_jpgdec_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (jpgdecrst),
    .per_bus_clks            (jpgdec_bus_clks ),
    .per_sync_rst_n          ( rcc_jpgdec_rst_n    )
    );
    // sdmmc1 clock and reset control
    assign  sdmmc1_src_bus_clks = {rcc_ahb3bridge_d1_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 1 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_sdmmc1_per_ker_clk_rst_control (
    .bus_clks                ( sdmmc1_src_bus_clks ),
    .ker_src_clk             ( rcc_sdmmc1_ker_clk ),
    .ker_clk_sel             (sdmmcsel),
    .rcc_c1_per_en           ( rcc_c1_sdmmc1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_sdmmc1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_sdmmc1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_sdmmc1_lpen   ),
    .rcc_per_amen            ( rcc_sdmmc1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( sdmmc1_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( sdmmc1rst ),
    .per_bus_clks            ( sdmmc1_bus_clks      ),
    .per_ker_clk             ( rcc_sdmmc1_ker_clk  ),
    .per_sync_rst_n          ( rcc_sdmmc1_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // wwdg1 clock and reset control
    assign  wwdg1_src_bus_clks = {rcc_apb3bridge_d1_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (1),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_wwdg1_per_clk_rst_control (
    .bus_clks                ( wwdg1_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_wwdg1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_wwdg1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_wwdg1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_wwdg1_lpen   ),
    .rcc_per_amen            ( rcc_wwdg1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (wwdg1rst),
    .per_bus_clks            (wwdg1_bus_clks ),
    .per_sync_rst_n          ( rcc_wwdg1_rst_n    )
    );
    // usb2ulpi clock and reset control
    assign  usb2ulpi_src_bus_clks = {rcc_ahb1bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_usb2ulpi_per_clk_rst_control (
    .bus_clks                ( usb2ulpi_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_usb2ulpi_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_usb2ulpi_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_usb2ulpi_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_usb2ulpi_lpen   ),
    .rcc_per_amen            ( rcc_usb2ulpi_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (usb2ulpirst),
    .per_bus_clks            (usb2ulpi_bus_clks ),
    .per_sync_rst_n          ( rcc_usb2ulpi_rst_n    )
    );
    // usb2otg clock and reset control
    assign  usb2otg_src_bus_clks = {rcc_ahb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_usb2otg_per_ker_clk_rst_control (
    .bus_clks                ( usb2otg_src_bus_clks ),
    .ker_src_clk             ( rcc_usb2otg_ker_clk ),
    .ker_clk_sel             (usbsel),
    .rcc_c1_per_en           ( rcc_c1_usb2otg_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_usb2otg_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_usb2otg_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_usb2otg_lpen   ),
    .rcc_per_amen            ( rcc_usb2otg_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( usb2otg_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( usb2otgrst ),
    .per_bus_clks            ( usb2otg_bus_clks      ),
    .per_ker_clk             ( rcc_usb2otg_ker_clk  ),
    .per_sync_rst_n          ( rcc_usb2otg_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // usb1ulpi clock and reset control
    assign  usb1ulpi_src_bus_clks = {rcc_ahb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_usb1ulpi_per_ker_clk_rst_control (
    .bus_clks                ( usb1ulpi_src_bus_clks ),
    .ker_src_clk             ( rcc_usb1ulpi_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_usb1ulpi_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_usb1ulpi_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_usb1ulpi_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_usb1ulpi_lpen   ),
    .rcc_per_amen            ( rcc_usb1ulpi_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( usb1ulpi_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( usb1ulpirst ),
    .per_bus_clks            ( usb1ulpi_bus_clks      ),
    .per_ker_clk             ( rcc_usb1ulpi_ker_clk  ),
    .per_sync_rst_n          ( rcc_usb1ulpi_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // usb1otg clock and reset control
    assign  usb1otg_src_bus_clks = {rcc_ahb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_usb1otg_per_ker_clk_rst_control (
    .bus_clks                ( usb1otg_src_bus_clks ),
    .ker_src_clk             ( rcc_usb1otg_ker_clk ),
    .ker_clk_sel             (usbsel),
    .rcc_c1_per_en           ( rcc_c1_usb1otg_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_usb1otg_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_usb1otg_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_usb1otg_lpen   ),
    .rcc_per_amen            ( rcc_usb1otg_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( usb1otg_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( usb1otgrst ),
    .per_bus_clks            ( usb1otg_bus_clks      ),
    .per_ker_clk             ( rcc_usb1otg_ker_clk  ),
    .per_sync_rst_n          ( rcc_usb1otg_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // eth1rx clock and reset control
    assign  eth1rx_src_bus_clks = {rcc_ahb1bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_eth1rx_per_clk_rst_control (
    .bus_clks                ( eth1rx_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_eth1rx_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_eth1rx_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_eth1rx_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_eth1rx_lpen   ),
    .rcc_per_amen            ( rcc_eth1rx_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (eth1rxrst),
    .per_bus_clks            (eth1rx_bus_clks ),
    .per_sync_rst_n          ( rcc_eth1rx_rst_n    )
    );
    // eth1tx clock and reset control
    assign  eth1tx_src_bus_clks = {rcc_ahb1bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_eth1tx_per_clk_rst_control (
    .bus_clks                ( eth1tx_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_eth1tx_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_eth1tx_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_eth1tx_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_eth1tx_lpen   ),
    .rcc_per_amen            ( rcc_eth1tx_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (eth1txrst),
    .per_bus_clks            (eth1tx_bus_clks ),
    .per_sync_rst_n          ( rcc_eth1tx_rst_n    )
    );
    // eth1mac clock and reset control
    assign  eth1mac_src_bus_clks = {rcc_ahb1bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_eth1mac_per_clk_rst_control (
    .bus_clks                ( eth1mac_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_eth1mac_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_eth1mac_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_eth1mac_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_eth1mac_lpen   ),
    .rcc_per_amen            ( rcc_eth1mac_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (eth1macrst),
    .per_bus_clks            (eth1mac_bus_clks ),
    .per_sync_rst_n          ( rcc_eth1mac_rst_n    )
    );
    // adc12 clock and reset control
    assign  adc12_src_bus_clks = {rcc_ahb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_adc12_per_ker_clk_rst_control (
    .bus_clks                ( adc12_src_bus_clks ),
    .ker_src_clk             ( rcc_adc12_ker_clk ),
    .ker_clk_sel             (adcsel),
    .rcc_c1_per_en           ( rcc_c1_adc12_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_adc12_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_adc12_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_adc12_lpen   ),
    .rcc_per_amen            ( rcc_adc12_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( adc12_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( adc12rst ),
    .per_bus_clks            ( adc12_bus_clks      ),
    .per_ker_clk             ( rcc_adc12_ker_clk  ),
    .per_sync_rst_n          ( rcc_adc12_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // dma2 clock and reset control
    assign  dma2_src_bus_clks = {rcc_ahb1bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_dma2_per_clk_rst_control (
    .bus_clks                ( dma2_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_dma2_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_dma2_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_dma2_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_dma2_lpen   ),
    .rcc_per_amen            ( rcc_dma2_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (dma2rst),
    .per_bus_clks            (dma2_bus_clks ),
    .per_sync_rst_n          ( rcc_dma2_rst_n    )
    );
    // dma1 clock and reset control
    assign  dma1_src_bus_clks = {rcc_ahb1bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_dma1_per_clk_rst_control (
    .bus_clks                ( dma1_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_dma1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_dma1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_dma1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_dma1_lpen   ),
    .rcc_per_amen            ( rcc_dma1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (dma1rst),
    .per_bus_clks            (dma1_bus_clks ),
    .per_sync_rst_n          ( rcc_dma1_rst_n    )
    );
    // sram3 clock and reset control
    assign  sram3_src_bus_clks = {rcc_ahb2bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (1),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_sram3_per_clk_rst_control (
    .bus_clks                ( sram3_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_sram3_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_sram3_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_sram3_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_sram3_lpen   ),
    .rcc_per_amen            ( rcc_sram3_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (sram3rst),
    .per_bus_clks            (sram3_bus_clks ),
    .per_sync_rst_n          ( rcc_sram3_rst_n    )
    );
    // sram2 clock and reset control
    assign  sram2_src_bus_clks = {rcc_ahb2bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (1),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_sram2_per_clk_rst_control (
    .bus_clks                ( sram2_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_sram2_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_sram2_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_sram2_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_sram2_lpen   ),
    .rcc_per_amen            ( rcc_sram2_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (sram2rst),
    .per_bus_clks            (sram2_bus_clks ),
    .per_sync_rst_n          ( rcc_sram2_rst_n    )
    );
    // sram1 clock and reset control
    assign  sram1_src_bus_clks = {rcc_ahb2bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (1),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_sram1_per_clk_rst_control (
    .bus_clks                ( sram1_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_sram1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_sram1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_sram1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_sram1_lpen   ),
    .rcc_per_amen            ( rcc_sram1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (sram1rst),
    .per_bus_clks            (sram1_bus_clks ),
    .per_sync_rst_n          ( rcc_sram1_rst_n    )
    );
    // sdmmc2 clock and reset control
    assign  sdmmc2_src_bus_clks = {rcc_ahb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_sdmmc2_per_ker_clk_rst_control (
    .bus_clks                ( sdmmc2_src_bus_clks ),
    .ker_src_clk             ( rcc_sdmmc2_ker_clk ),
    .ker_clk_sel             (sdmmcsel),
    .rcc_c1_per_en           ( rcc_c1_sdmmc2_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_sdmmc2_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_sdmmc2_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_sdmmc2_lpen   ),
    .rcc_per_amen            ( rcc_sdmmc2_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( sdmmc2_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( sdmmc2rst ),
    .per_bus_clks            ( sdmmc2_bus_clks      ),
    .per_ker_clk             ( rcc_sdmmc2_ker_clk  ),
    .per_sync_rst_n          ( rcc_sdmmc2_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // rng clock and reset control
    assign  rng_src_bus_clks = {rcc_ahb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_rng_per_ker_clk_rst_control (
    .bus_clks                ( rng_src_bus_clks ),
    .ker_src_clk             ( rcc_rng_ker_clk ),
    .ker_clk_sel             (rngsel),
    .rcc_c1_per_en           ( rcc_c1_rng_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_rng_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_rng_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_rng_lpen   ),
    .rcc_per_amen            ( rcc_rng_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( rng_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( rngrst ),
    .per_bus_clks            ( rng_bus_clks      ),
    .per_ker_clk             ( rcc_rng_ker_clk  ),
    .per_sync_rst_n          ( rcc_rng_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // hash clock and reset control
    assign  hash_src_bus_clks = {rcc_ahb2bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_hash_per_clk_rst_control (
    .bus_clks                ( hash_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_hash_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_hash_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_hash_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_hash_lpen   ),
    .rcc_per_amen            ( rcc_hash_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (hashrst),
    .per_bus_clks            (hash_bus_clks ),
    .per_sync_rst_n          ( rcc_hash_rst_n    )
    );
    // crypt clock and reset control
    assign  crypt_src_bus_clks = {rcc_ahb2bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_crypt_per_clk_rst_control (
    .bus_clks                ( crypt_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_crypt_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_crypt_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_crypt_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_crypt_lpen   ),
    .rcc_per_amen            ( rcc_crypt_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (cryptrst),
    .per_bus_clks            (crypt_bus_clks ),
    .per_sync_rst_n          ( rcc_crypt_rst_n    )
    );
    // dcmi clock and reset control
    assign  dcmi_src_bus_clks = {rcc_ahb2bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_dcmi_per_clk_rst_control (
    .bus_clks                ( dcmi_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_dcmi_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_dcmi_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_dcmi_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_dcmi_lpen   ),
    .rcc_per_amen            ( rcc_dcmi_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (dcmirst),
    .per_bus_clks            (dcmi_bus_clks ),
    .per_sync_rst_n          ( rcc_dcmi_rst_n    )
    );
    // ramecc2 clock and reset control
    assign  ramecc2_src_bus_clks = {rcc_ahb2bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (0),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (1),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (1),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_ramecc2_per_clk_rst_control (
    .bus_clks                ( ramecc2_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_ramecc2_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_ramecc2_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_ramecc2_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_ramecc2_lpen   ),
    .rcc_per_amen            ( rcc_ramecc2_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (ramecc2rst),
    .per_bus_clks            (ramecc2_bus_clks ),
    .per_sync_rst_n          ( rcc_ramecc2_rst_n    )
    );
    // uart8 clock and reset control
    assign  uart8_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 1 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 1 ),
    .HSI_INDEX                    ( 2 ),
    .IS_CSI                       ( 1 ),
    .CSI_INDEX                    ( 1 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_uart8_per_ker_clk_rst_control (
    .bus_clks                ( uart8_src_bus_clks ),
    .ker_src_clk             ( rcc_uart8_ker_clk ),
    .ker_clk_sel             (usart234578sel),
    .rcc_c1_per_en           ( rcc_c1_uart8_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_uart8_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_uart8_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_uart8_lpen   ),
    .rcc_per_amen            ( rcc_uart8_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( uart8_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( uart8rst ),
    .per_bus_clks            ( uart8_bus_clks      ),
    .per_ker_clk             ( rcc_uart8_ker_clk  ),
    .per_sync_rst_n          ( rcc_uart8_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // uart7 clock and reset control
    assign  uart7_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 1 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 1 ),
    .HSI_INDEX                    ( 2 ),
    .IS_CSI                       ( 1 ),
    .CSI_INDEX                    ( 1 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_uart7_per_ker_clk_rst_control (
    .bus_clks                ( uart7_src_bus_clks ),
    .ker_src_clk             ( rcc_uart7_ker_clk ),
    .ker_clk_sel             (usart234578sel),
    .rcc_c1_per_en           ( rcc_c1_uart7_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_uart7_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_uart7_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_uart7_lpen   ),
    .rcc_per_amen            ( rcc_uart7_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( uart7_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( uart7rst ),
    .per_bus_clks            ( uart7_bus_clks      ),
    .per_ker_clk             ( rcc_uart7_ker_clk  ),
    .per_sync_rst_n          ( rcc_uart7_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // dac12 clock and reset control
    assign  dac12_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_dac12_per_clk_rst_control (
    .bus_clks                ( dac12_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_dac12_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_dac12_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_dac12_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_dac12_lpen   ),
    .rcc_per_amen            ( rcc_dac12_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (dac12rst),
    .per_bus_clks            (dac12_bus_clks ),
    .per_sync_rst_n          ( rcc_dac12_rst_n    )
    );
    // hdmicec clock and reset control
    assign  hdmicec_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_hdmicec_per_ker_clk_rst_control (
    .bus_clks                ( hdmicec_src_bus_clks ),
    .ker_src_clk             ( rcc_hdmicec_ker_clk ),
    .ker_clk_sel             (cecsel),
    .rcc_c1_per_en           ( rcc_c1_hdmicec_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_hdmicec_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_hdmicec_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_hdmicec_lpen   ),
    .rcc_per_amen            ( rcc_hdmicec_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( hdmicec_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( hdmicecrst ),
    .per_bus_clks            ( hdmicec_bus_clks      ),
    .per_ker_clk             ( rcc_hdmicec_ker_clk  ),
    .per_sync_rst_n          ( rcc_hdmicec_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // i2c3 clock and reset control
    assign  i2c3_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 1 ),
    .HSI_INDEX                    ( 1 ),
    .IS_CSI                       ( 1 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_i2c3_per_ker_clk_rst_control (
    .bus_clks                ( i2c3_src_bus_clks ),
    .ker_src_clk             ( rcc_i2c3_ker_clk ),
    .ker_clk_sel             (i2c123sel),
    .rcc_c1_per_en           ( rcc_c1_i2c3_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_i2c3_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_i2c3_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_i2c3_lpen   ),
    .rcc_per_amen            ( rcc_i2c3_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( i2c3_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( i2c3rst ),
    .per_bus_clks            ( i2c3_bus_clks      ),
    .per_ker_clk             ( rcc_i2c3_ker_clk  ),
    .per_sync_rst_n          ( rcc_i2c3_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // i2c2 clock and reset control
    assign  i2c2_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 1 ),
    .HSI_INDEX                    ( 1 ),
    .IS_CSI                       ( 1 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_i2c2_per_ker_clk_rst_control (
    .bus_clks                ( i2c2_src_bus_clks ),
    .ker_src_clk             ( rcc_i2c2_ker_clk ),
    .ker_clk_sel             (i2c123sel),
    .rcc_c1_per_en           ( rcc_c1_i2c2_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_i2c2_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_i2c2_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_i2c2_lpen   ),
    .rcc_per_amen            ( rcc_i2c2_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( i2c2_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( i2c2rst ),
    .per_bus_clks            ( i2c2_bus_clks      ),
    .per_ker_clk             ( rcc_i2c2_ker_clk  ),
    .per_sync_rst_n          ( rcc_i2c2_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // i2c1 clock and reset control
    assign  i2c1_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 1 ),
    .HSI_INDEX                    ( 1 ),
    .IS_CSI                       ( 1 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_i2c1_per_ker_clk_rst_control (
    .bus_clks                ( i2c1_src_bus_clks ),
    .ker_src_clk             ( rcc_i2c1_ker_clk ),
    .ker_clk_sel             (i2c123sel),
    .rcc_c1_per_en           ( rcc_c1_i2c1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_i2c1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_i2c1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_i2c1_lpen   ),
    .rcc_per_amen            ( rcc_i2c1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( i2c1_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( i2c1rst ),
    .per_bus_clks            ( i2c1_bus_clks      ),
    .per_ker_clk             ( rcc_i2c1_ker_clk  ),
    .per_sync_rst_n          ( rcc_i2c1_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // uart5 clock and reset control
    assign  uart5_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 1 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 1 ),
    .HSI_INDEX                    ( 2 ),
    .IS_CSI                       ( 1 ),
    .CSI_INDEX                    ( 1 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_uart5_per_ker_clk_rst_control (
    .bus_clks                ( uart5_src_bus_clks ),
    .ker_src_clk             ( rcc_uart5_ker_clk ),
    .ker_clk_sel             (usart234578sel),
    .rcc_c1_per_en           ( rcc_c1_uart5_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_uart5_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_uart5_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_uart5_lpen   ),
    .rcc_per_amen            ( rcc_uart5_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( uart5_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( uart5rst ),
    .per_bus_clks            ( uart5_bus_clks      ),
    .per_ker_clk             ( rcc_uart5_ker_clk  ),
    .per_sync_rst_n          ( rcc_uart5_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // uart4 clock and reset control
    assign  uart4_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 1 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 1 ),
    .HSI_INDEX                    ( 2 ),
    .IS_CSI                       ( 1 ),
    .CSI_INDEX                    ( 1 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_uart4_per_ker_clk_rst_control (
    .bus_clks                ( uart4_src_bus_clks ),
    .ker_src_clk             ( rcc_uart4_ker_clk ),
    .ker_clk_sel             (usart234578sel),
    .rcc_c1_per_en           ( rcc_c1_uart4_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_uart4_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_uart4_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_uart4_lpen   ),
    .rcc_per_amen            ( rcc_uart4_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( uart4_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( uart4rst ),
    .per_bus_clks            ( uart4_bus_clks      ),
    .per_ker_clk             ( rcc_uart4_ker_clk  ),
    .per_sync_rst_n          ( rcc_uart4_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // usart3 clock and reset control
    assign  usart3_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 1 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 1 ),
    .HSI_INDEX                    ( 2 ),
    .IS_CSI                       ( 1 ),
    .CSI_INDEX                    ( 1 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_usart3_per_ker_clk_rst_control (
    .bus_clks                ( usart3_src_bus_clks ),
    .ker_src_clk             ( rcc_usart3_ker_clk ),
    .ker_clk_sel             (usart234578sel),
    .rcc_c1_per_en           ( rcc_c1_usart3_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_usart3_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_usart3_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_usart3_lpen   ),
    .rcc_per_amen            ( rcc_usart3_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( usart3_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( usart3rst ),
    .per_bus_clks            ( usart3_bus_clks      ),
    .per_ker_clk             ( rcc_usart3_ker_clk  ),
    .per_sync_rst_n          ( rcc_usart3_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // usart2 clock and reset control
    assign  usart2_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 1 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 1 ),
    .HSI_INDEX                    ( 2 ),
    .IS_CSI                       ( 1 ),
    .CSI_INDEX                    ( 1 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_usart2_per_ker_clk_rst_control (
    .bus_clks                ( usart2_src_bus_clks ),
    .ker_src_clk             ( rcc_usart2_ker_clk ),
    .ker_clk_sel             (usart234578sel),
    .rcc_c1_per_en           ( rcc_c1_usart2_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_usart2_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_usart2_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_usart2_lpen   ),
    .rcc_per_amen            ( rcc_usart2_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( usart2_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( usart2rst ),
    .per_bus_clks            ( usart2_bus_clks      ),
    .per_ker_clk             ( rcc_usart2_ker_clk  ),
    .per_sync_rst_n          ( rcc_usart2_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // spdifrx clock and reset control
    assign  spdifrx_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_spdifrx_per_ker_clk_rst_control (
    .bus_clks                ( spdifrx_src_bus_clks ),
    .ker_src_clk             ( rcc_spdifrx_ker_clk ),
    .ker_clk_sel             (spdifsel),
    .rcc_c1_per_en           ( rcc_c1_spdifrx_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_spdifrx_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_spdifrx_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_spdifrx_lpen   ),
    .rcc_per_amen            ( rcc_spdifrx_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( spdifrx_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( spdifrxrst ),
    .per_bus_clks            ( spdifrx_bus_clks      ),
    .per_ker_clk             ( rcc_spdifrx_ker_clk  ),
    .per_sync_rst_n          ( rcc_spdifrx_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // spi3 clock and reset control
    assign  spi3_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_spi3_per_ker_clk_rst_control (
    .bus_clks                ( spi3_src_bus_clks ),
    .ker_src_clk             ( rcc_spi3_ker_clk ),
    .ker_clk_sel             (spi123sel),
    .rcc_c1_per_en           ( rcc_c1_spi3_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_spi3_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_spi3_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_spi3_lpen   ),
    .rcc_per_amen            ( rcc_spi3_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( spi3_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( spi3rst ),
    .per_bus_clks            ( spi3_bus_clks      ),
    .per_ker_clk             ( rcc_spi3_ker_clk  ),
    .per_sync_rst_n          ( rcc_spi3_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // spi2 clock and reset control
    assign  spi2_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_spi2_per_ker_clk_rst_control (
    .bus_clks                ( spi2_src_bus_clks ),
    .ker_src_clk             ( rcc_spi2_ker_clk ),
    .ker_clk_sel             (spi123sel),
    .rcc_c1_per_en           ( rcc_c1_spi2_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_spi2_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_spi2_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_spi2_lpen   ),
    .rcc_per_amen            ( rcc_spi2_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( spi2_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( spi2rst ),
    .per_bus_clks            ( spi2_bus_clks      ),
    .per_ker_clk             ( rcc_spi2_ker_clk  ),
    .per_sync_rst_n          ( rcc_spi2_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // wwdg2 clock and reset control
    assign  wwdg2_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_wwdg2_per_clk_rst_control (
    .bus_clks                ( wwdg2_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_wwdg2_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_wwdg2_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_wwdg2_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_wwdg2_lpen   ),
    .rcc_per_amen            ( rcc_wwdg2_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (wwdg2rst),
    .per_bus_clks            (wwdg2_bus_clks ),
    .per_sync_rst_n          ( rcc_wwdg2_rst_n    )
    );
    // lptim1 clock and reset control
    assign  lptim1_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_lptim1_per_ker_clk_rst_control (
    .bus_clks                ( lptim1_src_bus_clks ),
    .ker_src_clk             ( rcc_lptim1_ker_clk ),
    .ker_clk_sel             (lptim1sel),
    .rcc_c1_per_en           ( rcc_c1_lptim1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_lptim1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_lptim1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_lptim1_lpen   ),
    .rcc_per_amen            ( rcc_lptim1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( lptim1_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( lptim1rst ),
    .per_bus_clks            ( lptim1_bus_clks      ),
    .per_ker_clk             ( rcc_lptim1_ker_clk  ),
    .per_sync_rst_n          ( rcc_lptim1_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // tim14 clock and reset control
    assign  tim14_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_tim14_per_ker_clk_rst_control (
    .bus_clks                ( tim14_src_bus_clks ),
    .ker_src_clk             ( rcc_tim14_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_tim14_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_tim14_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_tim14_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_tim14_lpen   ),
    .rcc_per_amen            ( rcc_tim14_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( tim14_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( tim14rst ),
    .per_bus_clks            ( tim14_bus_clks      ),
    .per_ker_clk             ( rcc_tim14_ker_clk  ),
    .per_sync_rst_n          ( rcc_tim14_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // tim13 clock and reset control
    assign  tim13_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_tim13_per_ker_clk_rst_control (
    .bus_clks                ( tim13_src_bus_clks ),
    .ker_src_clk             ( rcc_tim13_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_tim13_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_tim13_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_tim13_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_tim13_lpen   ),
    .rcc_per_amen            ( rcc_tim13_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( tim13_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( tim13rst ),
    .per_bus_clks            ( tim13_bus_clks      ),
    .per_ker_clk             ( rcc_tim13_ker_clk  ),
    .per_sync_rst_n          ( rcc_tim13_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // tim12 clock and reset control
    assign  tim12_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_tim12_per_ker_clk_rst_control (
    .bus_clks                ( tim12_src_bus_clks ),
    .ker_src_clk             ( rcc_tim12_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_tim12_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_tim12_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_tim12_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_tim12_lpen   ),
    .rcc_per_amen            ( rcc_tim12_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( tim12_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( tim12rst ),
    .per_bus_clks            ( tim12_bus_clks      ),
    .per_ker_clk             ( rcc_tim12_ker_clk  ),
    .per_sync_rst_n          ( rcc_tim12_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // tim7 clock and reset control
    assign  tim7_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_tim7_per_ker_clk_rst_control (
    .bus_clks                ( tim7_src_bus_clks ),
    .ker_src_clk             ( rcc_tim7_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_tim7_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_tim7_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_tim7_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_tim7_lpen   ),
    .rcc_per_amen            ( rcc_tim7_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( tim7_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( tim7rst ),
    .per_bus_clks            ( tim7_bus_clks      ),
    .per_ker_clk             ( rcc_tim7_ker_clk  ),
    .per_sync_rst_n          ( rcc_tim7_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // tim6 clock and reset control
    assign  tim6_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_tim6_per_ker_clk_rst_control (
    .bus_clks                ( tim6_src_bus_clks ),
    .ker_src_clk             ( rcc_tim6_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_tim6_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_tim6_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_tim6_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_tim6_lpen   ),
    .rcc_per_amen            ( rcc_tim6_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( tim6_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( tim6rst ),
    .per_bus_clks            ( tim6_bus_clks      ),
    .per_ker_clk             ( rcc_tim6_ker_clk  ),
    .per_sync_rst_n          ( rcc_tim6_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // tim5 clock and reset control
    assign  tim5_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_tim5_per_ker_clk_rst_control (
    .bus_clks                ( tim5_src_bus_clks ),
    .ker_src_clk             ( rcc_tim5_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_tim5_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_tim5_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_tim5_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_tim5_lpen   ),
    .rcc_per_amen            ( rcc_tim5_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( tim5_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( tim5rst ),
    .per_bus_clks            ( tim5_bus_clks      ),
    .per_ker_clk             ( rcc_tim5_ker_clk  ),
    .per_sync_rst_n          ( rcc_tim5_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // tim4 clock and reset control
    assign  tim4_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_tim4_per_ker_clk_rst_control (
    .bus_clks                ( tim4_src_bus_clks ),
    .ker_src_clk             ( rcc_tim4_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_tim4_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_tim4_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_tim4_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_tim4_lpen   ),
    .rcc_per_amen            ( rcc_tim4_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( tim4_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( tim4rst ),
    .per_bus_clks            ( tim4_bus_clks      ),
    .per_ker_clk             ( rcc_tim4_ker_clk  ),
    .per_sync_rst_n          ( rcc_tim4_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // tim3 clock and reset control
    assign  tim3_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_tim3_per_ker_clk_rst_control (
    .bus_clks                ( tim3_src_bus_clks ),
    .ker_src_clk             ( rcc_tim3_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_tim3_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_tim3_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_tim3_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_tim3_lpen   ),
    .rcc_per_amen            ( rcc_tim3_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( tim3_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( tim3rst ),
    .per_bus_clks            ( tim3_bus_clks      ),
    .per_ker_clk             ( rcc_tim3_ker_clk  ),
    .per_sync_rst_n          ( rcc_tim3_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // tim2 clock and reset control
    assign  tim2_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_tim2_per_ker_clk_rst_control (
    .bus_clks                ( tim2_src_bus_clks ),
    .ker_src_clk             ( rcc_tim2_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_tim2_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_tim2_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_tim2_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_tim2_lpen   ),
    .rcc_per_amen            ( rcc_tim2_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( tim2_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( tim2rst ),
    .per_bus_clks            ( tim2_bus_clks      ),
    .per_ker_clk             ( rcc_tim2_ker_clk  ),
    .per_sync_rst_n          ( rcc_tim2_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // fdcan clock and reset control
    assign  fdcan_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_fdcan_per_ker_clk_rst_control (
    .bus_clks                ( fdcan_src_bus_clks ),
    .ker_src_clk             ( rcc_fdcan_ker_clk ),
    .ker_clk_sel             (fdcansel),
    .rcc_c1_per_en           ( rcc_c1_fdcan_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_fdcan_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_fdcan_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_fdcan_lpen   ),
    .rcc_per_amen            ( rcc_fdcan_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( fdcan_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( fdcanrst ),
    .per_bus_clks            ( fdcan_bus_clks      ),
    .per_ker_clk             ( rcc_fdcan_ker_clk  ),
    .per_sync_rst_n          ( rcc_fdcan_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // mdios clock and reset control
    assign  mdios_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_mdios_per_clk_rst_control (
    .bus_clks                ( mdios_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_mdios_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_mdios_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_mdios_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_mdios_lpen   ),
    .rcc_per_amen            ( rcc_mdios_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (mdiosrst),
    .per_bus_clks            (mdios_bus_clks ),
    .per_sync_rst_n          ( rcc_mdios_rst_n    )
    );
    // opamp clock and reset control
    assign  opamp_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_opamp_per_clk_rst_control (
    .bus_clks                ( opamp_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_opamp_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_opamp_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_opamp_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_opamp_lpen   ),
    .rcc_per_amen            ( rcc_opamp_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (opamprst),
    .per_bus_clks            (opamp_bus_clks ),
    .per_sync_rst_n          ( rcc_opamp_rst_n    )
    );
    // swpmi clock and reset control
    assign  swpmi_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_swpmi_per_ker_clk_rst_control (
    .bus_clks                ( swpmi_src_bus_clks ),
    .ker_src_clk             ( rcc_swpmi_ker_clk ),
    .ker_clk_sel             (swpmisel),
    .rcc_c1_per_en           ( rcc_c1_swpmi_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_swpmi_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_swpmi_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_swpmi_lpen   ),
    .rcc_per_amen            ( rcc_swpmi_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( swpmi_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( swpmirst ),
    .per_bus_clks            ( swpmi_bus_clks      ),
    .per_ker_clk             ( rcc_swpmi_ker_clk  ),
    .per_sync_rst_n          ( rcc_swpmi_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // crs clock and reset control
    assign  crs_src_bus_clks = {rcc_apb1bridge_d2_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (2),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_crs_per_clk_rst_control (
    .bus_clks                ( crs_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_crs_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_crs_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_crs_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_crs_lpen   ),
    .rcc_per_amen            ( rcc_crs_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (crsrst),
    .per_bus_clks            (crs_bus_clks ),
    .per_sync_rst_n          ( rcc_crs_rst_n    )
    );
    // hrtim clock and reset control
    assign  hrtim_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_hrtim_per_ker_clk_rst_control (
    .bus_clks                ( hrtim_src_bus_clks ),
    .ker_src_clk             ( rcc_hrtim_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_hrtim_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_hrtim_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_hrtim_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_hrtim_lpen   ),
    .rcc_per_amen            ( rcc_hrtim_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( hrtim_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( hrtimrst ),
    .per_bus_clks            ( hrtim_bus_clks      ),
    .per_ker_clk             ( rcc_hrtim_ker_clk  ),
    .per_sync_rst_n          ( rcc_hrtim_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // dfsdm1 clock and reset control
    assign  dfsdm1_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 2 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_dfsdm1_per_ker_clk_rst_control (
    .bus_clks                ( dfsdm1_src_bus_clks ),
    .ker_src_clk             ( rcc_dfsdm1_ker_clk ),
    .ker_clk_sel             (sai1sel),
    .rcc_c1_per_en           ( rcc_c1_dfsdm1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_dfsdm1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_dfsdm1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_dfsdm1_lpen   ),
    .rcc_per_amen            ( rcc_dfsdm1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( dfsdm1_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( dfsdm1rst ),
    .per_bus_clks            ( dfsdm1_bus_clks      ),
    .per_ker_clk             ( rcc_dfsdm1_ker_clk  ),
    .per_sync_rst_n          ( rcc_dfsdm1_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // sai3 clock and reset control
    assign  sai3_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_sai3_per_ker_clk_rst_control (
    .bus_clks                ( sai3_src_bus_clks ),
    .ker_src_clk             ( rcc_sai3_ker_clk ),
    .ker_clk_sel             (sai23sel),
    .rcc_c1_per_en           ( rcc_c1_sai3_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_sai3_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_sai3_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_sai3_lpen   ),
    .rcc_per_amen            ( rcc_sai3_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( sai3_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( sai3rst ),
    .per_bus_clks            ( sai3_bus_clks      ),
    .per_ker_clk             ( rcc_sai3_ker_clk  ),
    .per_sync_rst_n          ( rcc_sai3_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // sai2 clock and reset control
    assign  sai2_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_sai2_per_ker_clk_rst_control (
    .bus_clks                ( sai2_src_bus_clks ),
    .ker_src_clk             ( rcc_sai2_ker_clk ),
    .ker_clk_sel             (sai23sel),
    .rcc_c1_per_en           ( rcc_c1_sai2_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_sai2_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_sai2_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_sai2_lpen   ),
    .rcc_per_amen            ( rcc_sai2_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( sai2_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( sai2rst ),
    .per_bus_clks            ( sai2_bus_clks      ),
    .per_ker_clk             ( rcc_sai2_ker_clk  ),
    .per_sync_rst_n          ( rcc_sai2_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // sai1 clock and reset control
    assign  sai1_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_sai1_per_ker_clk_rst_control (
    .bus_clks                ( sai1_src_bus_clks ),
    .ker_src_clk             ( rcc_sai1_ker_clk ),
    .ker_clk_sel             (sai1sel),
    .rcc_c1_per_en           ( rcc_c1_sai1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_sai1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_sai1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_sai1_lpen   ),
    .rcc_per_amen            ( rcc_sai1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( sai1_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( sai1rst ),
    .per_bus_clks            ( sai1_bus_clks      ),
    .per_ker_clk             ( rcc_sai1_ker_clk  ),
    .per_sync_rst_n          ( rcc_sai1_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // spi5 clock and reset control
    assign  spi5_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_spi5_per_ker_clk_rst_control (
    .bus_clks                ( spi5_src_bus_clks ),
    .ker_src_clk             ( rcc_spi5_ker_clk ),
    .ker_clk_sel             (spi45sel),
    .rcc_c1_per_en           ( rcc_c1_spi5_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_spi5_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_spi5_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_spi5_lpen   ),
    .rcc_per_amen            ( rcc_spi5_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( spi5_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( spi5rst ),
    .per_bus_clks            ( spi5_bus_clks      ),
    .per_ker_clk             ( rcc_spi5_ker_clk  ),
    .per_sync_rst_n          ( rcc_spi5_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // tim17 clock and reset control
    assign  tim17_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_tim17_per_ker_clk_rst_control (
    .bus_clks                ( tim17_src_bus_clks ),
    .ker_src_clk             ( rcc_tim17_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_tim17_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_tim17_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_tim17_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_tim17_lpen   ),
    .rcc_per_amen            ( rcc_tim17_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( tim17_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( tim17rst ),
    .per_bus_clks            ( tim17_bus_clks      ),
    .per_ker_clk             ( rcc_tim17_ker_clk  ),
    .per_sync_rst_n          ( rcc_tim17_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // tim16 clock and reset control
    assign  tim16_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_tim16_per_ker_clk_rst_control (
    .bus_clks                ( tim16_src_bus_clks ),
    .ker_src_clk             ( rcc_tim16_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_tim16_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_tim16_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_tim16_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_tim16_lpen   ),
    .rcc_per_amen            ( rcc_tim16_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( tim16_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( tim16rst ),
    .per_bus_clks            ( tim16_bus_clks      ),
    .per_ker_clk             ( rcc_tim16_ker_clk  ),
    .per_sync_rst_n          ( rcc_tim16_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // tim15 clock and reset control
    assign  tim15_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_tim15_per_ker_clk_rst_control (
    .bus_clks                ( tim15_src_bus_clks ),
    .ker_src_clk             ( rcc_tim15_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_tim15_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_tim15_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_tim15_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_tim15_lpen   ),
    .rcc_per_amen            ( rcc_tim15_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( tim15_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( tim15rst ),
    .per_bus_clks            ( tim15_bus_clks      ),
    .per_ker_clk             ( rcc_tim15_ker_clk  ),
    .per_sync_rst_n          ( rcc_tim15_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // spi4 clock and reset control
    assign  spi4_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_spi4_per_ker_clk_rst_control (
    .bus_clks                ( spi4_src_bus_clks ),
    .ker_src_clk             ( rcc_spi4_ker_clk ),
    .ker_clk_sel             (spi45sel),
    .rcc_c1_per_en           ( rcc_c1_spi4_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_spi4_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_spi4_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_spi4_lpen   ),
    .rcc_per_amen            ( rcc_spi4_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( spi4_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( spi4rst ),
    .per_bus_clks            ( spi4_bus_clks      ),
    .per_ker_clk             ( rcc_spi4_ker_clk  ),
    .per_sync_rst_n          ( rcc_spi4_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // spi1 clock and reset control
    assign  spi1_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_spi1_per_ker_clk_rst_control (
    .bus_clks                ( spi1_src_bus_clks ),
    .ker_src_clk             ( rcc_spi1_ker_clk ),
    .ker_clk_sel             (spi123sel),
    .rcc_c1_per_en           ( rcc_c1_spi1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_spi1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_spi1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_spi1_lpen   ),
    .rcc_per_amen            ( rcc_spi1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( spi1_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( spi1rst ),
    .per_bus_clks            ( spi1_bus_clks      ),
    .per_ker_clk             ( rcc_spi1_ker_clk  ),
    .per_sync_rst_n          ( rcc_spi1_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // usart6 clock and reset control
    assign  usart6_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 1 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 1 ),
    .HSI_INDEX                    ( 2 ),
    .IS_CSI                       ( 1 ),
    .CSI_INDEX                    ( 1 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_usart6_per_ker_clk_rst_control (
    .bus_clks                ( usart6_src_bus_clks ),
    .ker_src_clk             ( rcc_usart6_ker_clk ),
    .ker_clk_sel             (usart16sel),
    .rcc_c1_per_en           ( rcc_c1_usart6_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_usart6_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_usart6_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_usart6_lpen   ),
    .rcc_per_amen            ( rcc_usart6_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( usart6_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( usart6rst ),
    .per_bus_clks            ( usart6_bus_clks      ),
    .per_ker_clk             ( rcc_usart6_ker_clk  ),
    .per_sync_rst_n          ( rcc_usart6_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // usart1 clock and reset control
    assign  usart1_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 1 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 1 ),
    .HSI_INDEX                    ( 2 ),
    .IS_CSI                       ( 1 ),
    .CSI_INDEX                    ( 1 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_usart1_per_ker_clk_rst_control (
    .bus_clks                ( usart1_src_bus_clks ),
    .ker_src_clk             ( rcc_usart1_ker_clk ),
    .ker_clk_sel             (usart16sel),
    .rcc_c1_per_en           ( rcc_c1_usart1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_usart1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_usart1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_usart1_lpen   ),
    .rcc_per_amen            ( rcc_usart1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( usart1_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( usart1rst ),
    .per_bus_clks            ( usart1_bus_clks      ),
    .per_ker_clk             ( rcc_usart1_ker_clk  ),
    .per_sync_rst_n          ( rcc_usart1_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // tim8 clock and reset control
    assign  tim8_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_tim8_per_ker_clk_rst_control (
    .bus_clks                ( tim8_src_bus_clks ),
    .ker_src_clk             ( rcc_tim8_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_tim8_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_tim8_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_tim8_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_tim8_lpen   ),
    .rcc_per_amen            ( rcc_tim8_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( tim8_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( tim8rst ),
    .per_bus_clks            ( tim8_bus_clks      ),
    .per_ker_clk             ( rcc_tim8_ker_clk  ),
    .per_sync_rst_n          ( rcc_tim8_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // tim1 clock and reset control
    assign  tim1_src_bus_clks = {rcc_apb2bridge_d2_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 0 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 2 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_tim1_per_ker_clk_rst_control (
    .bus_clks                ( tim1_src_bus_clks ),
    .ker_src_clk             ( rcc_tim1_ker_clk ),
    .ker_clk_sel             (1'b0),
    .rcc_c1_per_en           ( rcc_c1_tim1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_tim1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_tim1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_tim1_lpen   ),
    .rcc_per_amen            ( rcc_tim1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( tim1_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( tim1rst ),
    .per_bus_clks            ( tim1_bus_clks      ),
    .per_ker_clk             ( rcc_tim1_ker_clk  ),
    .per_sync_rst_n          ( rcc_tim1_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // sram4 clock and reset control
    assign  sram4_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (1),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (1),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_sram4_per_clk_rst_control (
    .bus_clks                ( sram4_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_sram4_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_sram4_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_sram4_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_sram4_lpen   ),
    .rcc_per_amen            ( rcc_sram4_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (sram4rst),
    .per_bus_clks            (sram4_bus_clks ),
    .per_sync_rst_n          ( rcc_sram4_rst_n    )
    );
    // bkpram clock and reset control
    assign  bkpram_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (1),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_bkpram_per_clk_rst_control (
    .bus_clks                ( bkpram_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_bkpram_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_bkpram_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_bkpram_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_bkpram_lpen   ),
    .rcc_per_amen            ( rcc_bkpram_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (bkpramrst),
    .per_bus_clks            (bkpram_bus_clks ),
    .per_sync_rst_n          ( rcc_bkpram_rst_n    )
    );
    // ramecc3 clock and reset control
    assign  ramecc3_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (0),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (1),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (1),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_ramecc3_per_clk_rst_control (
    .bus_clks                ( ramecc3_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_ramecc3_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_ramecc3_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_ramecc3_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_ramecc3_lpen   ),
    .rcc_per_amen            ( rcc_ramecc3_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (ramecc3rst),
    .per_bus_clks            (ramecc3_bus_clks ),
    .per_sync_rst_n          ( rcc_ramecc3_rst_n    )
    );
    // hsem clock and reset control
    assign  hsem_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (0),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (1),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_hsem_per_clk_rst_control (
    .bus_clks                ( hsem_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_hsem_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_hsem_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_hsem_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_hsem_lpen   ),
    .rcc_per_amen            ( rcc_hsem_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (hsemrst),
    .per_bus_clks            (hsem_bus_clks ),
    .per_sync_rst_n          ( rcc_hsem_rst_n    )
    );
    // adc3 clock and reset control
    assign  adc3_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 1 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 3 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_adc3_per_ker_clk_rst_control (
    .bus_clks                ( adc3_src_bus_clks ),
    .ker_src_clk             ( rcc_adc3_ker_clk ),
    .ker_clk_sel             (adcsel),
    .rcc_c1_per_en           ( rcc_c1_adc3_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_adc3_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_adc3_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_adc3_lpen   ),
    .rcc_per_amen            ( rcc_adc3_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( adc3_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( adc3rst ),
    .per_bus_clks            ( adc3_bus_clks      ),
    .per_ker_clk             ( rcc_adc3_ker_clk  ),
    .per_sync_rst_n          ( rcc_adc3_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // bdma clock and reset control
    assign  bdma_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (1),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_bdma_per_clk_rst_control (
    .bus_clks                ( bdma_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_bdma_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_bdma_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_bdma_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_bdma_lpen   ),
    .rcc_per_amen            ( rcc_bdma_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (bdmarst),
    .per_bus_clks            (bdma_bus_clks ),
    .per_sync_rst_n          ( rcc_bdma_rst_n    )
    );
    // crc clock and reset control
    assign  crc_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (1),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_crc_per_clk_rst_control (
    .bus_clks                ( crc_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_crc_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_crc_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_crc_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_crc_lpen   ),
    .rcc_per_amen            ( rcc_crc_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (crcrst),
    .per_bus_clks            (crc_bus_clks ),
    .per_sync_rst_n          ( rcc_crc_rst_n    )
    );
    // gpiok clock and reset control
    assign  gpiok_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_gpiok_per_clk_rst_control (
    .bus_clks                ( gpiok_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_gpiok_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_gpiok_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_gpiok_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_gpiok_lpen   ),
    .rcc_per_amen            ( rcc_gpiok_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (gpiokrst),
    .per_bus_clks            (gpiok_bus_clks ),
    .per_sync_rst_n          ( rcc_gpiok_rst_n    )
    );
    // gpioj clock and reset control
    assign  gpioj_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_gpioj_per_clk_rst_control (
    .bus_clks                ( gpioj_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_gpioj_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_gpioj_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_gpioj_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_gpioj_lpen   ),
    .rcc_per_amen            ( rcc_gpioj_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (gpiojrst),
    .per_bus_clks            (gpioj_bus_clks ),
    .per_sync_rst_n          ( rcc_gpioj_rst_n    )
    );
    // gpioi clock and reset control
    assign  gpioi_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_gpioi_per_clk_rst_control (
    .bus_clks                ( gpioi_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_gpioi_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_gpioi_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_gpioi_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_gpioi_lpen   ),
    .rcc_per_amen            ( rcc_gpioi_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (gpioirst),
    .per_bus_clks            (gpioi_bus_clks ),
    .per_sync_rst_n          ( rcc_gpioi_rst_n    )
    );
    // gpioh clock and reset control
    assign  gpioh_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_gpioh_per_clk_rst_control (
    .bus_clks                ( gpioh_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_gpioh_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_gpioh_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_gpioh_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_gpioh_lpen   ),
    .rcc_per_amen            ( rcc_gpioh_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (gpiohrst),
    .per_bus_clks            (gpioh_bus_clks ),
    .per_sync_rst_n          ( rcc_gpioh_rst_n    )
    );
    // gpiog clock and reset control
    assign  gpiog_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_gpiog_per_clk_rst_control (
    .bus_clks                ( gpiog_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_gpiog_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_gpiog_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_gpiog_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_gpiog_lpen   ),
    .rcc_per_amen            ( rcc_gpiog_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (gpiogrst),
    .per_bus_clks            (gpiog_bus_clks ),
    .per_sync_rst_n          ( rcc_gpiog_rst_n    )
    );
    // gpiof clock and reset control
    assign  gpiof_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_gpiof_per_clk_rst_control (
    .bus_clks                ( gpiof_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_gpiof_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_gpiof_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_gpiof_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_gpiof_lpen   ),
    .rcc_per_amen            ( rcc_gpiof_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (gpiofrst),
    .per_bus_clks            (gpiof_bus_clks ),
    .per_sync_rst_n          ( rcc_gpiof_rst_n    )
    );
    // gpioe clock and reset control
    assign  gpioe_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_gpioe_per_clk_rst_control (
    .bus_clks                ( gpioe_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_gpioe_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_gpioe_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_gpioe_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_gpioe_lpen   ),
    .rcc_per_amen            ( rcc_gpioe_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (gpioerst),
    .per_bus_clks            (gpioe_bus_clks ),
    .per_sync_rst_n          ( rcc_gpioe_rst_n    )
    );
    // gpiod clock and reset control
    assign  gpiod_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_gpiod_per_clk_rst_control (
    .bus_clks                ( gpiod_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_gpiod_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_gpiod_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_gpiod_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_gpiod_lpen   ),
    .rcc_per_amen            ( rcc_gpiod_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (gpiodrst),
    .per_bus_clks            (gpiod_bus_clks ),
    .per_sync_rst_n          ( rcc_gpiod_rst_n    )
    );
    // gpioc clock and reset control
    assign  gpioc_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_gpioc_per_clk_rst_control (
    .bus_clks                ( gpioc_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_gpioc_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_gpioc_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_gpioc_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_gpioc_lpen   ),
    .rcc_per_amen            ( rcc_gpioc_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (gpiocrst),
    .per_bus_clks            (gpioc_bus_clks ),
    .per_sync_rst_n          ( rcc_gpioc_rst_n    )
    );
    // gpiob clock and reset control
    assign  gpiob_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_gpiob_per_clk_rst_control (
    .bus_clks                ( gpiob_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_gpiob_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_gpiob_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_gpiob_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_gpiob_lpen   ),
    .rcc_per_amen            ( rcc_gpiob_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (gpiobrst),
    .per_bus_clks            (gpiob_bus_clks ),
    .per_sync_rst_n          ( rcc_gpiob_rst_n    )
    );
    // gpioa clock and reset control
    assign  gpioa_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_gpioa_per_clk_rst_control (
    .bus_clks                ( gpioa_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_gpioa_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_gpioa_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_gpioa_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_gpioa_lpen   ),
    .rcc_per_amen            ( rcc_gpioa_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (gpioarst),
    .per_bus_clks            (gpioa_bus_clks ),
    .per_sync_rst_n          ( rcc_gpioa_rst_n    )
    );
    // rcc clock and reset control
    assign  rcc_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (0),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (1),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (1),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_rcc_per_clk_rst_control (
    .bus_clks                ( rcc_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_rcc_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_rcc_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_rcc_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_rcc_lpen   ),
    .rcc_per_amen            ( rcc_rcc_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (rccrst),
    .per_bus_clks            (rcc_bus_clks ),
    .per_sync_rst_n          ( rcc_rcc_rst_n    )
    );
    // pwr clock and reset control
    assign  pwr_src_bus_clks = {rcc_ahb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (0),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (1),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (1),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_pwr_per_clk_rst_control (
    .bus_clks                ( pwr_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_pwr_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_pwr_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_pwr_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_pwr_lpen   ),
    .rcc_per_amen            ( rcc_pwr_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (pwrrst),
    .per_bus_clks            (pwr_bus_clks ),
    .per_sync_rst_n          ( rcc_pwr_rst_n    )
    );
    // sai4 clock and reset control
    assign  sai4_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 2 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 1 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 3 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_sai4_per_ker_clk_rst_control (
    .bus_clks                ( sai4_src_bus_clks ),
    .ker_src_clk             ( rcc_sai4_ker_clk ),
    .ker_clk_sel             (sai4asel),
    .rcc_c1_per_en           ( rcc_c1_sai4_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_sai4_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_sai4_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_sai4_lpen   ),
    .rcc_per_amen            ( rcc_sai4_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( sai4_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( sai4rst ),
    .per_bus_clks            ( sai4_bus_clks      ),
    .per_ker_clk             ( rcc_sai4_ker_clk  ),
    .per_sync_rst_n          ( rcc_sai4_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // rtc clock and reset control
    assign  rtc_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (1),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_rtc_per_clk_rst_control (
    .bus_clks                ( rtc_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_rtc_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_rtc_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_rtc_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_rtc_lpen   ),
    .rcc_per_amen            ( rcc_rtc_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (rtcrst),
    .per_bus_clks            (rtc_bus_clks ),
    .per_sync_rst_n          ( rcc_rtc_rst_n    )
    );
    // vref clock and reset control
    assign  vref_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (1),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_vref_per_clk_rst_control (
    .bus_clks                ( vref_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_vref_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_vref_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_vref_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_vref_lpen   ),
    .rcc_per_amen            ( rcc_vref_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (vrefrst),
    .per_bus_clks            (vref_bus_clks ),
    .per_sync_rst_n          ( rcc_vref_rst_n    )
    );
    // comp12 clock and reset control
    assign  comp12_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (1),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_comp12_per_clk_rst_control (
    .bus_clks                ( comp12_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_comp12_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_comp12_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_comp12_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_comp12_lpen   ),
    .rcc_per_amen            ( rcc_comp12_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (comp12rst),
    .per_bus_clks            (comp12_bus_clks ),
    .per_sync_rst_n          ( rcc_comp12_rst_n    )
    );
    // lptim5 clock and reset control
    assign  lptim5_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 1 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 3 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_lptim5_per_ker_clk_rst_control (
    .bus_clks                ( lptim5_src_bus_clks ),
    .ker_src_clk             ( rcc_lptim5_ker_clk ),
    .ker_clk_sel             (lptim345sel),
    .rcc_c1_per_en           ( rcc_c1_lptim5_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_lptim5_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_lptim5_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_lptim5_lpen   ),
    .rcc_per_amen            ( rcc_lptim5_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( lptim5_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( lptim5rst ),
    .per_bus_clks            ( lptim5_bus_clks      ),
    .per_ker_clk             ( rcc_lptim5_ker_clk  ),
    .per_sync_rst_n          ( rcc_lptim5_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // lptim4 clock and reset control
    assign  lptim4_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 1 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 3 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_lptim4_per_ker_clk_rst_control (
    .bus_clks                ( lptim4_src_bus_clks ),
    .ker_src_clk             ( rcc_lptim4_ker_clk ),
    .ker_clk_sel             (lptim345sel),
    .rcc_c1_per_en           ( rcc_c1_lptim4_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_lptim4_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_lptim4_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_lptim4_lpen   ),
    .rcc_per_amen            ( rcc_lptim4_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( lptim4_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( lptim4rst ),
    .per_bus_clks            ( lptim4_bus_clks      ),
    .per_ker_clk             ( rcc_lptim4_ker_clk  ),
    .per_sync_rst_n          ( rcc_lptim4_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // lptim3 clock and reset control
    assign  lptim3_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 1 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 3 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_lptim3_per_ker_clk_rst_control (
    .bus_clks                ( lptim3_src_bus_clks ),
    .ker_src_clk             ( rcc_lptim3_ker_clk ),
    .ker_clk_sel             (lptim345sel),
    .rcc_c1_per_en           ( rcc_c1_lptim3_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_lptim3_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_lptim3_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_lptim3_lpen   ),
    .rcc_per_amen            ( rcc_lptim3_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( lptim3_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( lptim3rst ),
    .per_bus_clks            ( lptim3_bus_clks      ),
    .per_ker_clk             ( rcc_lptim3_ker_clk  ),
    .per_sync_rst_n          ( rcc_lptim3_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // lptim2 clock and reset control
    assign  lptim2_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 1 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 3 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_lptim2_per_ker_clk_rst_control (
    .bus_clks                ( lptim2_src_bus_clks ),
    .ker_src_clk             ( rcc_lptim2_ker_clk ),
    .ker_clk_sel             (lptim2sel),
    .rcc_c1_per_en           ( rcc_c1_lptim2_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_lptim2_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_lptim2_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_lptim2_lpen   ),
    .rcc_per_amen            ( rcc_lptim2_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( lptim2_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( lptim2rst ),
    .per_bus_clks            ( lptim2_bus_clks      ),
    .per_ker_clk             ( rcc_lptim2_ker_clk  ),
    .per_sync_rst_n          ( rcc_lptim2_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // i2c4 clock and reset control
    assign  i2c4_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 1 ),
    .HSI_INDEX                    ( 1 ),
    .IS_CSI                       ( 1 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 1 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 3 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_i2c4_per_ker_clk_rst_control (
    .bus_clks                ( i2c4_src_bus_clks ),
    .ker_src_clk             ( rcc_i2c4_ker_clk ),
    .ker_clk_sel             (i2c4sel),
    .rcc_c1_per_en           ( rcc_c1_i2c4_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_i2c4_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_i2c4_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_i2c4_lpen   ),
    .rcc_per_amen            ( rcc_i2c4_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( i2c4_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( i2c4rst ),
    .per_bus_clks            ( i2c4_bus_clks      ),
    .per_ker_clk             ( rcc_i2c4_ker_clk  ),
    .per_sync_rst_n          ( rcc_i2c4_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // spi6 clock and reset control
    assign  spi6_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 0 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 0 ),
    .HSI_INDEX                    ( 0 ),
    .IS_CSI                       ( 0 ),
    .CSI_INDEX                    ( 0 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 1 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 3 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_spi6_per_ker_clk_rst_control (
    .bus_clks                ( spi6_src_bus_clks ),
    .ker_src_clk             ( rcc_spi6_ker_clk ),
    .ker_clk_sel             (spi6sel),
    .rcc_c1_per_en           ( rcc_c1_spi6_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_spi6_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_spi6_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_spi6_lpen   ),
    .rcc_per_amen            ( rcc_spi6_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( spi6_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( spi6rst ),
    .per_bus_clks            ( spi6_bus_clks      ),
    .per_ker_clk             ( rcc_spi6_ker_clk  ),
    .per_sync_rst_n          ( rcc_spi6_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // lpuart1 clock and reset control
    assign  lpuart1_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_ker_clk_rst_control #(
    .KER_CLK_SRC_NUM              ( 1 ),
    .BUS_CLK_NUM                  ( 1 ),
    .IS_LSI                       ( 0 ),
    .LSI_INDEX                    ( 0 ),
    .IS_LSE                       ( 1 ),
    .LSE_INDEX                    ( 0 ),
    .IS_HSI                       ( 1 ),
    .HSI_INDEX                    ( 2 ),
    .IS_CSI                       ( 1 ),
    .CSI_INDEX                    ( 1 ),
    .SUPPORT_LPEN                 ( 1 ),
    .SUPPORT_AMEN                 ( 1 ),
    .D3_DEFAULT_NO_CLK            ( 0 ),
    .ASSIGNED_TO_CPU1             ( 0 ),
    .ASSIGNED_TO_CPU2             ( 0 ),
    .DOMAIN                       ( 3 ),
    .CLK_ON_AFTER_PER_RST_RELEASE ( 2 ))
    u_lpuart1_per_ker_clk_rst_control (
    .bus_clks                ( lpuart1_src_bus_clks ),
    .ker_src_clk             ( rcc_lpuart1_ker_clk ),
    .ker_clk_sel             (lpuart1sel),
    .rcc_c1_per_en           ( rcc_c1_lpuart1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_lpuart1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_lpuart1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_lpuart1_lpen   ),
    .rcc_per_amen            ( rcc_lpuart1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .per_ker_clk_req         ( lpuart1_ker_clk_req   ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               ( lpuart1rst ),
    .per_bus_clks            ( lpuart1_bus_clks      ),
    .per_ker_clk             ( rcc_lpuart1_ker_clk  ),
    .per_sync_rst_n          ( rcc_lpuart1_rst_n    ),
    .csi_ker_clk_req         ( csi_ker_clk_req   ),
    .hsi_ker_clk_req         ( hsi_ker_clk_req   )
    );
    // syscfg clock and reset control
    assign  syscfg_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (1),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (0),
    .ASSIGNED_TO_CPU1             (0),
    .ASSIGNED_TO_CPU2             (0),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_syscfg_per_clk_rst_control (
    .bus_clks                ( syscfg_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_syscfg_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_syscfg_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_syscfg_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_syscfg_lpen   ),
    .rcc_per_amen            ( rcc_syscfg_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (syscfgrst),
    .per_bus_clks            (syscfg_bus_clks ),
    .per_sync_rst_n          ( rcc_syscfg_rst_n    )
    );
    // iwdg2 clock and reset control
    assign  iwdg2_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (0),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (1),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (1),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_iwdg2_per_clk_rst_control (
    .bus_clks                ( iwdg2_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_iwdg2_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_iwdg2_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_iwdg2_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_iwdg2_lpen   ),
    .rcc_per_amen            ( rcc_iwdg2_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (iwdg2rst),
    .per_bus_clks            (iwdg2_bus_clks ),
    .per_sync_rst_n          ( rcc_iwdg2_rst_n    )
    );
    // iwdg1 clock and reset control
    assign  iwdg1_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (0),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (1),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (1),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_iwdg1_per_clk_rst_control (
    .bus_clks                ( iwdg1_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_iwdg1_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_iwdg1_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_iwdg1_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_iwdg1_lpen   ),
    .rcc_per_amen            ( rcc_iwdg1_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (iwdg1rst),
    .per_bus_clks            (iwdg1_bus_clks ),
    .per_sync_rst_n          ( rcc_iwdg1_rst_n    )
    );
    // exti clock and reset control
    assign  exti_src_bus_clks = {rcc_apb4bridge_d3_clk};
    per_clk_rst_control #(
    .BUS_CLK_NUM                  (1),
    .SUPPORT_LPEN                 (0),
    .SUPPORT_AMEN                 (0),
    .D3_DEFAULT_NO_CLK            (1),
    .ASSIGNED_TO_CPU1             (1),
    .ASSIGNED_TO_CPU2             (1),
    .DOMAIN                       (3),
    .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE))
    u_exti_per_clk_rst_control (
    .bus_clks                ( exti_src_bus_clks ),
    .rcc_c1_per_en           ( rcc_c1_exti_en     ),
    .rcc_c1_per_lpen         ( rcc_c1_exti_lpen   ),
    .rcc_c2_per_en           ( rcc_c2_exti_en     ),
    .rcc_c2_per_lpen         ( rcc_c2_exti_lpen   ),
    .rcc_per_amen            ( rcc_exti_amen      ),
    .c1_sleep                ( c1_sleep          ),
    .c1_deepsleep            ( c1_deepsleep      ),
    .c2_sleep                ( c2_sleep          ),
    .c2_deepsleep            ( c2_deepsleep      ),
    .d3_deepsleep            ( d3_deepsleep      ),
    .arcg_on                 ( arcg_on           ),
    .testmode                ( testmode          ),
    .sys_rst_n               ( sys_rst_n         ),
    .d1_rst_n                ( d1_rst_n          ),
    .d2_rst_n                ( d2_rst_n          ),
    .sft_rst_n               (extirst),
    .per_bus_clks            (exti_bus_clks ),
    .per_sync_rst_n          ( rcc_exti_rst_n    )
    );
    // csi_ker_clk_122_div
    div_even_stable #(
        .DIVISION(122)
    ) csi_ker_clk_122_divider(
        .clk_in(csi_ker_clk),
        .rst_n(sys_rst_n),
        .clk_out(csi_ker_clk_122_div)
    );
    // generate c2_per_alloc_d1 and c1_per_alloc_d2
    assign c2_per_alloc_d1 =  rcc_c1_qspi_en | rcc_c1_fmc_en | rcc_c1_dma2d_en | rcc_c1_mdma_en | rcc_c1_ltdc_en | rcc_c1_jpgdec_en | rcc_c1_sdmmc1_en | rcc_c1_wwdg1_en | rcc_c1_usb2ulpi_en | rcc_c1_usb2otg_en | rcc_c1_usb1ulpi_en | rcc_c1_usb1otg_en | rcc_c1_eth1rx_en | rcc_c1_eth1tx_en | rcc_c1_eth1mac_en | rcc_c1_adc12_en | rcc_c1_dma2_en | rcc_c1_dma1_en | rcc_c1_sram3_en | rcc_c1_sram2_en | rcc_c1_sram1_en | rcc_c1_sdmmc2_en | rcc_c1_rng_en | rcc_c1_hash_en | rcc_c1_crypt_en | rcc_c1_dcmi_en | rcc_c1_uart8_en | rcc_c1_uart7_en | rcc_c1_dac12_en | rcc_c1_hdmicec_en | rcc_c1_i2c3_en | rcc_c1_i2c2_en | rcc_c1_i2c1_en | rcc_c1_uart5_en | rcc_c1_uart4_en | rcc_c1_usart3_en | rcc_c1_usart2_en | rcc_c1_spdifrx_en | rcc_c1_spi3_en | rcc_c1_spi2_en | rcc_c1_wwdg2_en | rcc_c1_lptim1_en | rcc_c1_tim14_en | rcc_c1_tim13_en | rcc_c1_tim12_en | rcc_c1_tim7_en | rcc_c1_tim6_en | rcc_c1_tim5_en | rcc_c1_tim4_en | rcc_c1_tim3_en | rcc_c1_tim2_en | rcc_c1_fdcan_en | rcc_c1_mdios_en | rcc_c1_opamp_en | rcc_c1_swpmi_en | rcc_c1_crs_en | rcc_c1_hrtim_en | rcc_c1_dfsdm1_en | rcc_c1_sai3_en | rcc_c1_sai2_en | rcc_c1_sai1_en | rcc_c1_spi5_en | rcc_c1_tim17_en | rcc_c1_tim16_en | rcc_c1_tim15_en | rcc_c1_spi4_en | rcc_c1_spi1_en | rcc_c1_usart6_en | rcc_c1_usart1_en | rcc_c1_tim8_en | rcc_c1_tim1_en | rcc_c1_bkpram_en | rcc_c1_hsem_en | rcc_c1_adc3_en | rcc_c1_bdma_en | rcc_c1_crc_en | rcc_c1_gpiok_en | rcc_c1_gpioj_en | rcc_c1_gpioi_en | rcc_c1_gpioh_en | rcc_c1_gpiog_en | rcc_c1_gpiof_en | rcc_c1_gpioe_en | rcc_c1_gpiod_en | rcc_c1_gpioc_en | rcc_c1_gpiob_en | rcc_c1_gpioa_en | rcc_c1_sai4_en | rcc_c1_rtc_en | rcc_c1_vref_en | rcc_c1_comp12_en | rcc_c1_lptim5_en | rcc_c1_lptim4_en | rcc_c1_lptim3_en | rcc_c1_lptim2_en | rcc_c1_i2c4_en | rcc_c1_spi6_en | rcc_c1_lpuart1_en | rcc_c1_syscfg_en ;
    assign c1_per_alloc_d2 =  rcc_c2_flash_en | rcc_c2_qspi_en | rcc_c2_axisram_en | rcc_c2_fmc_en | rcc_c2_dma2d_en | rcc_c2_mdma_en | rcc_c2_ltdc_en | rcc_c2_itcm_en | rcc_c2_dtcm2_en | rcc_c2_dtcm1_en | rcc_c2_jpgdec_en | rcc_c2_sdmmc1_en | rcc_c2_wwdg1_en | rcc_c2_usb2ulpi_en | rcc_c2_usb2otg_en | rcc_c2_usb1ulpi_en | rcc_c2_usb1otg_en | rcc_c2_eth1rx_en | rcc_c2_eth1tx_en | rcc_c2_eth1mac_en | rcc_c2_adc12_en | rcc_c2_dma2_en | rcc_c2_dma1_en | rcc_c2_sdmmc2_en | rcc_c2_rng_en | rcc_c2_hash_en | rcc_c2_crypt_en | rcc_c2_dcmi_en | rcc_c2_uart8_en | rcc_c2_uart7_en | rcc_c2_dac12_en | rcc_c2_hdmicec_en | rcc_c2_i2c3_en | rcc_c2_i2c2_en | rcc_c2_i2c1_en | rcc_c2_uart5_en | rcc_c2_uart4_en | rcc_c2_usart3_en | rcc_c2_usart2_en | rcc_c2_spdifrx_en | rcc_c2_spi3_en | rcc_c2_spi2_en | rcc_c2_wwdg2_en | rcc_c2_lptim1_en | rcc_c2_tim14_en | rcc_c2_tim13_en | rcc_c2_tim12_en | rcc_c2_tim7_en | rcc_c2_tim6_en | rcc_c2_tim5_en | rcc_c2_tim4_en | rcc_c2_tim3_en | rcc_c2_tim2_en | rcc_c2_fdcan_en | rcc_c2_mdios_en | rcc_c2_opamp_en | rcc_c2_swpmi_en | rcc_c2_crs_en | rcc_c2_hrtim_en | rcc_c2_dfsdm1_en | rcc_c2_sai3_en | rcc_c2_sai2_en | rcc_c2_sai1_en | rcc_c2_spi5_en | rcc_c2_tim17_en | rcc_c2_tim16_en | rcc_c2_tim15_en | rcc_c2_spi4_en | rcc_c2_spi1_en | rcc_c2_usart6_en | rcc_c2_usart1_en | rcc_c2_tim8_en | rcc_c2_tim1_en | rcc_c2_bkpram_en | rcc_c2_hsem_en | rcc_c2_adc3_en | rcc_c2_bdma_en | rcc_c2_crc_en | rcc_c2_gpiok_en | rcc_c2_gpioj_en | rcc_c2_gpioi_en | rcc_c2_gpioh_en | rcc_c2_gpiog_en | rcc_c2_gpiof_en | rcc_c2_gpioe_en | rcc_c2_gpiod_en | rcc_c2_gpioc_en | rcc_c2_gpiob_en | rcc_c2_gpioa_en | rcc_c2_sai4_en | rcc_c2_rtc_en | rcc_c2_vref_en | rcc_c2_comp12_en | rcc_c2_lptim5_en | rcc_c2_lptim4_en | rcc_c2_lptim3_en | rcc_c2_lptim2_en | rcc_c2_i2c4_en | rcc_c2_spi6_en | rcc_c2_lpuart1_en | rcc_c2_syscfg_en ;
    assign c1_per_alloc_apb1 =  (rcc_c1_uart8_en & rcc_c1_uart8_lpen) | (rcc_c1_uart7_en & rcc_c1_uart7_lpen) | (rcc_c1_dac12_en & rcc_c1_dac12_lpen) | (rcc_c1_hdmicec_en & rcc_c1_hdmicec_lpen) | (rcc_c1_i2c3_en & rcc_c1_i2c3_lpen) | (rcc_c1_i2c2_en & rcc_c1_i2c2_lpen) | (rcc_c1_i2c1_en & rcc_c1_i2c1_lpen) | (rcc_c1_uart5_en & rcc_c1_uart5_lpen) | (rcc_c1_uart4_en & rcc_c1_uart4_lpen) | (rcc_c1_usart3_en & rcc_c1_usart3_lpen) | (rcc_c1_usart2_en & rcc_c1_usart2_lpen) | (rcc_c1_spdifrx_en & rcc_c1_spdifrx_lpen) | (rcc_c1_spi3_en & rcc_c1_spi3_lpen) | (rcc_c1_spi2_en & rcc_c1_spi2_lpen) | (rcc_c1_wwdg2_en & rcc_c1_wwdg2_lpen) | (rcc_c1_lptim1_en & rcc_c1_lptim1_lpen) | (rcc_c1_tim14_en & rcc_c1_tim14_lpen) | (rcc_c1_tim13_en & rcc_c1_tim13_lpen) | (rcc_c1_tim12_en & rcc_c1_tim12_lpen) | (rcc_c1_tim7_en & rcc_c1_tim7_lpen) | (rcc_c1_tim6_en & rcc_c1_tim6_lpen) | (rcc_c1_tim5_en & rcc_c1_tim5_lpen) | (rcc_c1_tim4_en & rcc_c1_tim4_lpen) | (rcc_c1_tim3_en & rcc_c1_tim3_lpen) | (rcc_c1_tim2_en & rcc_c1_tim2_lpen) | (rcc_c1_fdcan_en & rcc_c1_fdcan_lpen) | (rcc_c1_mdios_en & rcc_c1_mdios_lpen) | (rcc_c1_opamp_en & rcc_c1_opamp_lpen) | (rcc_c1_swpmi_en & rcc_c1_swpmi_lpen) | (rcc_c1_crs_en & rcc_c1_crs_lpen) ;
    assign c2_per_alloc_apb1 =  (rcc_c2_uart8_en & rcc_c2_uart8_lpen) | (rcc_c2_uart7_en & rcc_c2_uart7_lpen) | (rcc_c2_dac12_en & rcc_c2_dac12_lpen) | (rcc_c2_hdmicec_en & rcc_c2_hdmicec_lpen) | (rcc_c2_i2c3_en & rcc_c2_i2c3_lpen) | (rcc_c2_i2c2_en & rcc_c2_i2c2_lpen) | (rcc_c2_i2c1_en & rcc_c2_i2c1_lpen) | (rcc_c2_uart5_en & rcc_c2_uart5_lpen) | (rcc_c2_uart4_en & rcc_c2_uart4_lpen) | (rcc_c2_usart3_en & rcc_c2_usart3_lpen) | (rcc_c2_usart2_en & rcc_c2_usart2_lpen) | (rcc_c2_spdifrx_en & rcc_c2_spdifrx_lpen) | (rcc_c2_spi3_en & rcc_c2_spi3_lpen) | (rcc_c2_spi2_en & rcc_c2_spi2_lpen) | (rcc_c2_wwdg2_en & rcc_c2_wwdg2_lpen) | (rcc_c2_lptim1_en & rcc_c2_lptim1_lpen) | (rcc_c2_tim14_en & rcc_c2_tim14_lpen) | (rcc_c2_tim13_en & rcc_c2_tim13_lpen) | (rcc_c2_tim12_en & rcc_c2_tim12_lpen) | (rcc_c2_tim7_en & rcc_c2_tim7_lpen) | (rcc_c2_tim6_en & rcc_c2_tim6_lpen) | (rcc_c2_tim5_en & rcc_c2_tim5_lpen) | (rcc_c2_tim4_en & rcc_c2_tim4_lpen) | (rcc_c2_tim3_en & rcc_c2_tim3_lpen) | (rcc_c2_tim2_en & rcc_c2_tim2_lpen) | (rcc_c2_fdcan_en & rcc_c2_fdcan_lpen) | (rcc_c2_mdios_en & rcc_c2_mdios_lpen) | (rcc_c2_opamp_en & rcc_c2_opamp_lpen) | (rcc_c2_swpmi_en & rcc_c2_swpmi_lpen) | (rcc_c2_crs_en & rcc_c2_crs_lpen) ;
    assign c1_per_alloc_apb2 =  (rcc_c1_hrtim_en & rcc_c1_hrtim_lpen) | (rcc_c1_dfsdm1_en & rcc_c1_dfsdm1_lpen) | (rcc_c1_sai3_en & rcc_c1_sai3_lpen) | (rcc_c1_sai2_en & rcc_c1_sai2_lpen) | (rcc_c1_sai1_en & rcc_c1_sai1_lpen) | (rcc_c1_spi5_en & rcc_c1_spi5_lpen) | (rcc_c1_tim17_en & rcc_c1_tim17_lpen) | (rcc_c1_tim16_en & rcc_c1_tim16_lpen) | (rcc_c1_tim15_en & rcc_c1_tim15_lpen) | (rcc_c1_spi4_en & rcc_c1_spi4_lpen) | (rcc_c1_spi1_en & rcc_c1_spi1_lpen) | (rcc_c1_usart6_en & rcc_c1_usart6_lpen) | (rcc_c1_usart1_en & rcc_c1_usart1_lpen) | (rcc_c1_tim8_en & rcc_c1_tim8_lpen) | (rcc_c1_tim1_en & rcc_c1_tim1_lpen) ;
    assign c2_per_alloc_apb2 =  (rcc_c2_hrtim_en & rcc_c2_hrtim_lpen) | (rcc_c2_dfsdm1_en & rcc_c2_dfsdm1_lpen) | (rcc_c2_sai3_en & rcc_c2_sai3_lpen) | (rcc_c2_sai2_en & rcc_c2_sai2_lpen) | (rcc_c2_sai1_en & rcc_c2_sai1_lpen) | (rcc_c2_spi5_en & rcc_c2_spi5_lpen) | (rcc_c2_tim17_en & rcc_c2_tim17_lpen) | (rcc_c2_tim16_en & rcc_c2_tim16_lpen) | (rcc_c2_tim15_en & rcc_c2_tim15_lpen) | (rcc_c2_spi4_en & rcc_c2_spi4_lpen) | (rcc_c2_spi1_en & rcc_c2_spi1_lpen) | (rcc_c2_usart6_en & rcc_c2_usart6_lpen) | (rcc_c2_usart1_en & rcc_c2_usart1_lpen) | (rcc_c2_tim8_en & rcc_c2_tim8_lpen) | (rcc_c2_tim1_en & rcc_c2_tim1_lpen) ;
    assign c1_per_alloc_apb3 =  (rcc_c1_ltdc_en & rcc_c1_ltdc_lpen) | (rcc_c1_wwdg1_en & rcc_c1_wwdg1_lpen) ;
    assign c2_per_alloc_apb3 =  (rcc_c2_ltdc_en & rcc_c2_ltdc_lpen) | (rcc_c2_wwdg1_en & rcc_c2_wwdg1_lpen) ;
    assign c1_per_alloc_ahb1 =  (rcc_c1_usb2ulpi_en & rcc_c1_usb2ulpi_lpen) | (rcc_c1_usb2otg_en & rcc_c1_usb2otg_lpen) | (rcc_c1_usb1ulpi_en & rcc_c1_usb1ulpi_lpen) | (rcc_c1_usb1otg_en & rcc_c1_usb1otg_lpen) | (rcc_c1_eth1rx_en & rcc_c1_eth1rx_lpen) | (rcc_c1_eth1tx_en & rcc_c1_eth1tx_lpen) | (rcc_c1_eth1mac_en & rcc_c1_eth1mac_lpen) | (rcc_c1_adc12_en & rcc_c1_adc12_lpen) | (rcc_c1_dma2_en & rcc_c1_dma2_lpen) | (rcc_c1_dma1_en & rcc_c1_dma1_lpen) ;
    assign c2_per_alloc_ahb1 =  (rcc_c2_usb2ulpi_en & rcc_c2_usb2ulpi_lpen) | (rcc_c2_usb2otg_en & rcc_c2_usb2otg_lpen) | (rcc_c2_usb1ulpi_en & rcc_c2_usb1ulpi_lpen) | (rcc_c2_usb1otg_en & rcc_c2_usb1otg_lpen) | (rcc_c2_eth1rx_en & rcc_c2_eth1rx_lpen) | (rcc_c2_eth1tx_en & rcc_c2_eth1tx_lpen) | (rcc_c2_eth1mac_en & rcc_c2_eth1mac_lpen) | (rcc_c2_adc12_en & rcc_c2_adc12_lpen) | (rcc_c2_dma2_en & rcc_c2_dma2_lpen) | (rcc_c2_dma1_en & rcc_c2_dma1_lpen) ;
    assign c1_per_alloc_ahb2 =  (rcc_c1_sram3_en & rcc_c1_sram3_lpen) | (rcc_c1_sram2_en & rcc_c1_sram2_lpen) | (rcc_c1_sram1_en & rcc_c1_sram1_lpen) | (rcc_c1_sdmmc2_en & rcc_c1_sdmmc2_lpen) | (rcc_c1_rng_en & rcc_c1_rng_lpen) | (rcc_c1_hash_en & rcc_c1_hash_lpen) | (rcc_c1_crypt_en & rcc_c1_crypt_lpen) | (rcc_c1_dcmi_en & rcc_c1_dcmi_lpen) ;
    assign c2_per_alloc_ahb2 =  (rcc_c2_sdmmc2_en & rcc_c2_sdmmc2_lpen) | (rcc_c2_rng_en & rcc_c2_rng_lpen) | (rcc_c2_hash_en & rcc_c2_hash_lpen) | (rcc_c2_crypt_en & rcc_c2_crypt_lpen) | (rcc_c2_dcmi_en & rcc_c2_dcmi_lpen) ;
    assign c1_per_alloc_ahb3 =  (rcc_c1_qspi_en & rcc_c1_qspi_lpen) | (rcc_c1_fmc_en & rcc_c1_fmc_lpen) | (rcc_c1_dma2d_en & rcc_c1_dma2d_lpen) | (rcc_c1_mdma_en & rcc_c1_mdma_lpen) | (rcc_c1_jpgdec_en & rcc_c1_jpgdec_lpen) | (rcc_c1_sdmmc1_en & rcc_c1_sdmmc1_lpen) ;
    assign c2_per_alloc_ahb3 =  (rcc_c2_flash_en & rcc_c2_flash_lpen) | (rcc_c2_qspi_en & rcc_c2_qspi_lpen) | (rcc_c2_fmc_en & rcc_c2_fmc_lpen) | (rcc_c2_dma2d_en & rcc_c2_dma2d_lpen) | (rcc_c2_mdma_en & rcc_c2_mdma_lpen) | (rcc_c2_itcm_en & rcc_c2_itcm_lpen) | (rcc_c2_dtcm2_en & rcc_c2_dtcm2_lpen) | (rcc_c2_dtcm1_en & rcc_c2_dtcm1_lpen) | (rcc_c2_jpgdec_en & rcc_c2_jpgdec_lpen) | (rcc_c2_sdmmc1_en & rcc_c2_sdmmc1_lpen) ;
    // generate hsi_ker_clk_req and csi_ker_clk_req
    assign hsi_ker_clk_req =  (usart234578sel == 2 & uart8_ker_clk_req) | (usart234578sel == 2 & uart7_ker_clk_req) | (i2c123sel == 1 & i2c3_ker_clk_req) | (i2c123sel == 1 & i2c2_ker_clk_req) | (i2c123sel == 1 & i2c1_ker_clk_req) | (usart234578sel == 2 & uart5_ker_clk_req) | (usart234578sel == 2 & uart4_ker_clk_req) | (usart234578sel == 2 & usart3_ker_clk_req) | (usart234578sel == 2 & usart2_ker_clk_req) | (usart16sel == 2 & usart6_ker_clk_req) | (usart16sel == 2 & usart1_ker_clk_req) | (i2c4sel == 1 & i2c4_ker_clk_req) | (lpuart1sel == 2 & lpuart1_ker_clk_req) ;
    assign csi_ker_clk_req =  (usart234578sel == 1 & uart8_ker_clk_req) | (usart234578sel == 1 & uart7_ker_clk_req) | (i2c123sel == 0 & i2c3_ker_clk_req) | (i2c123sel == 0 & i2c2_ker_clk_req) | (i2c123sel == 0 & i2c1_ker_clk_req) | (usart234578sel == 1 & uart5_ker_clk_req) | (usart234578sel == 1 & uart4_ker_clk_req) | (usart234578sel == 1 & usart3_ker_clk_req) | (usart234578sel == 1 & usart2_ker_clk_req) | (usart16sel == 1 & usart6_ker_clk_req) | (usart16sel == 1 & usart1_ker_clk_req) | (i2c4sel == 0 & i2c4_ker_clk_req) | (lpuart1sel == 1 & lpuart1_ker_clk_req) ;



endmodule
