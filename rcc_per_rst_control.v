module per_ker_rst_control (
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
// sys reset
    input sys_rst_n,
// dx reset
    input d1_rst_n,
    input d2_rst_n
);
// flash reset control logic
    assign rcc_flash_rst_n = sys_rst_n & d1_rst_n ;
// qspi reset control logic
    assign rcc_qspi_rst_n = sys_rst_n & d1_rst_n & ~qspirst;
// axisram reset control logic
    assign rcc_axisram_rst_n = sys_rst_n & d1_rst_n ;
// fmc reset control logic
    assign rcc_fmc_rst_n = sys_rst_n & d1_rst_n & ~fmcrst;
// dma2d reset control logic
    assign rcc_dma2d_rst_n = sys_rst_n & d1_rst_n & ~dma2drst;
// mdma reset control logic
    assign rcc_mdma_rst_n = sys_rst_n & d1_rst_n & ~mdmarst;
// ltdc reset control logic
    assign rcc_ltdc_rst_n = sys_rst_n & d1_rst_n & ~ltdcrst;
// ramecc1 reset control logic
    assign rcc_ramecc1_rst_n = sys_rst_n & d1_rst_n ;
// gpv reset control logic
    assign rcc_gpv_rst_n = sys_rst_n & d1_rst_n ;
// itcm reset control logic
    assign rcc_itcm_rst_n = sys_rst_n & d1_rst_n ;
// dtcm2 reset control logic
    assign rcc_dtcm2_rst_n = sys_rst_n & d1_rst_n ;
// dtcm1 reset control logic
    assign rcc_dtcm1_rst_n = sys_rst_n & d1_rst_n ;
// jpgdec reset control logic
    assign rcc_jpgdec_rst_n = sys_rst_n & d1_rst_n & ~jpgdecrst;
// sdmmc1 reset control logic
    assign rcc_sdmmc1_rst_n = sys_rst_n & d1_rst_n & ~sdmmc1rst;
// wwdg1 reset control logic
    assign rcc_wwdg1_rst_n = sys_rst_n & d1_rst_n ;
// usb2ulpi reset control logic
    assign rcc_usb2ulpi_rst_n = sys_rst_n & d2_rst_n ;
// usb2otg reset control logic
    assign rcc_usb2otg_rst_n = sys_rst_n & d2_rst_n & ~usb2otgrst;
// usb1ulpi reset control logic
    assign rcc_usb1ulpi_rst_n = sys_rst_n & d2_rst_n ;
// usb1otg reset control logic
    assign rcc_usb1otg_rst_n = sys_rst_n & d2_rst_n & ~usb1otgrst;
// eth1rx reset control logic
    assign rcc_eth1rx_rst_n = sys_rst_n & d2_rst_n ;
// eth1tx reset control logic
    assign rcc_eth1tx_rst_n = sys_rst_n & d2_rst_n ;
// eth1mac reset control logic
    assign rcc_eth1mac_rst_n = sys_rst_n & d2_rst_n & ~eth1macrst;
// adc12 reset control logic
    assign rcc_adc12_rst_n = sys_rst_n & d2_rst_n & ~adc12rst;
// dma2 reset control logic
    assign rcc_dma2_rst_n = sys_rst_n & d2_rst_n & ~dma2rst;
// dma1 reset control logic
    assign rcc_dma1_rst_n = sys_rst_n & d2_rst_n & ~dma1rst;
// sram3 reset control logic
    assign rcc_sram3_rst_n = sys_rst_n & d2_rst_n ;
// sram2 reset control logic
    assign rcc_sram2_rst_n = sys_rst_n & d2_rst_n ;
// sram1 reset control logic
    assign rcc_sram1_rst_n = sys_rst_n & d2_rst_n ;
// sdmmc2 reset control logic
    assign rcc_sdmmc2_rst_n = sys_rst_n & d2_rst_n & ~sdmmc2rst;
// rng reset control logic
    assign rcc_rng_rst_n = sys_rst_n & d2_rst_n & ~rngrst;
// hash reset control logic
    assign rcc_hash_rst_n = sys_rst_n & d2_rst_n & ~hashrst;
// crypt reset control logic
    assign rcc_crypt_rst_n = sys_rst_n & d2_rst_n & ~cryptrst;
// dcmi reset control logic
    assign rcc_dcmi_rst_n = sys_rst_n & d2_rst_n & ~dcmirst;
// ramecc2 reset control logic
    assign rcc_ramecc2_rst_n = sys_rst_n & d2_rst_n ;
// uart8 reset control logic
    assign rcc_uart8_rst_n = sys_rst_n & d2_rst_n & ~uart8rst;
// uart7 reset control logic
    assign rcc_uart7_rst_n = sys_rst_n & d2_rst_n & ~uart7rst;
// dac12 reset control logic
    assign rcc_dac12_rst_n = sys_rst_n & d2_rst_n & ~dac12rst;
// hdmicec reset control logic
    assign rcc_hdmicec_rst_n = sys_rst_n & d2_rst_n & ~hdmicecrst;
// i2c3 reset control logic
    assign rcc_i2c3_rst_n = sys_rst_n & d2_rst_n & ~i2c3rst;
// i2c2 reset control logic
    assign rcc_i2c2_rst_n = sys_rst_n & d2_rst_n & ~i2c2rst;
// i2c1 reset control logic
    assign rcc_i2c1_rst_n = sys_rst_n & d2_rst_n & ~i2c1rst;
// uart5 reset control logic
    assign rcc_uart5_rst_n = sys_rst_n & d2_rst_n & ~uart5rst;
// uart4 reset control logic
    assign rcc_uart4_rst_n = sys_rst_n & d2_rst_n & ~uart4rst;
// usart3 reset control logic
    assign rcc_usart3_rst_n = sys_rst_n & d2_rst_n & ~usart3rst;
// usart2 reset control logic
    assign rcc_usart2_rst_n = sys_rst_n & d2_rst_n & ~usart2rst;
// spdifrx reset control logic
    assign rcc_spdifrx_rst_n = sys_rst_n & d2_rst_n & ~spdifrxrst;
// spi3 reset control logic
    assign rcc_spi3_rst_n = sys_rst_n & d2_rst_n & ~spi3rst;
// spi2 reset control logic
    assign rcc_spi2_rst_n = sys_rst_n & d2_rst_n & ~spi2rst;
// wwdg2 reset control logic
    assign rcc_wwdg2_rst_n = sys_rst_n & d2_rst_n ;
// lptim1 reset control logic
    assign rcc_lptim1_rst_n = sys_rst_n & d2_rst_n & ~lptim1rst;
// tim14 reset control logic
    assign rcc_tim14_rst_n = sys_rst_n & d2_rst_n & ~tim14rst;
// tim13 reset control logic
    assign rcc_tim13_rst_n = sys_rst_n & d2_rst_n & ~tim13rst;
// tim12 reset control logic
    assign rcc_tim12_rst_n = sys_rst_n & d2_rst_n & ~tim12rst;
// tim7 reset control logic
    assign rcc_tim7_rst_n = sys_rst_n & d2_rst_n & ~tim7rst;
// tim6 reset control logic
    assign rcc_tim6_rst_n = sys_rst_n & d2_rst_n & ~tim6rst;
// tim5 reset control logic
    assign rcc_tim5_rst_n = sys_rst_n & d2_rst_n & ~tim5rst;
// tim4 reset control logic
    assign rcc_tim4_rst_n = sys_rst_n & d2_rst_n & ~tim4rst;
// tim3 reset control logic
    assign rcc_tim3_rst_n = sys_rst_n & d2_rst_n & ~tim3rst;
// tim2 reset control logic
    assign rcc_tim2_rst_n = sys_rst_n & d2_rst_n & ~tim2rst;
// fdcan reset control logic
    assign rcc_fdcan_rst_n = sys_rst_n & d2_rst_n & ~fdcanrst;
// mdios reset control logic
    assign rcc_mdios_rst_n = sys_rst_n & d2_rst_n & ~mdiosrst;
// opamp reset control logic
    assign rcc_opamp_rst_n = sys_rst_n & d2_rst_n & ~opamprst;
// swpmi reset control logic
    assign rcc_swpmi_rst_n = sys_rst_n & d2_rst_n & ~swpmirst;
// crs reset control logic
    assign rcc_crs_rst_n = sys_rst_n & d2_rst_n & ~crsrst;
// hrtim reset control logic
    assign rcc_hrtim_rst_n = sys_rst_n & d2_rst_n & ~hrtimrst;
// dfsdm1 reset control logic
    assign rcc_dfsdm1_rst_n = sys_rst_n & d2_rst_n & ~dfsdm1rst;
// sai3 reset control logic
    assign rcc_sai3_rst_n = sys_rst_n & d2_rst_n & ~sai3rst;
// sai2 reset control logic
    assign rcc_sai2_rst_n = sys_rst_n & d2_rst_n & ~sai2rst;
// sai1 reset control logic
    assign rcc_sai1_rst_n = sys_rst_n & d2_rst_n & ~sai1rst;
// spi5 reset control logic
    assign rcc_spi5_rst_n = sys_rst_n & d2_rst_n & ~spi5rst;
// tim17 reset control logic
    assign rcc_tim17_rst_n = sys_rst_n & d2_rst_n & ~tim17rst;
// tim16 reset control logic
    assign rcc_tim16_rst_n = sys_rst_n & d2_rst_n & ~tim16rst;
// tim15 reset control logic
    assign rcc_tim15_rst_n = sys_rst_n & d2_rst_n & ~tim15rst;
// spi4 reset control logic
    assign rcc_spi4_rst_n = sys_rst_n & d2_rst_n & ~spi4rst;
// spi1 reset control logic
    assign rcc_spi1_rst_n = sys_rst_n & d2_rst_n & ~spi1rst;
// usart6 reset control logic
    assign rcc_usart6_rst_n = sys_rst_n & d2_rst_n & ~usart6rst;
// usart1 reset control logic
    assign rcc_usart1_rst_n = sys_rst_n & d2_rst_n & ~usart1rst;
// tim8 reset control logic
    assign rcc_tim8_rst_n = sys_rst_n & d2_rst_n & ~tim8rst;
// tim1 reset control logic
    assign rcc_tim1_rst_n = sys_rst_n & d2_rst_n & ~tim1rst;
// sram4 reset control logic
    assign rcc_sram4_rst_n = sys_rst_n ;
// bkpram reset control logic
    assign rcc_bkpram_rst_n = sys_rst_n ;
// ramecc3 reset control logic
    assign rcc_ramecc3_rst_n = sys_rst_n ;
// hsem reset control logic
    assign rcc_hsem_rst_n = sys_rst_n & ~hsemrst;
// adc3 reset control logic
    assign rcc_adc3_rst_n = sys_rst_n & ~adc3rst;
// bdma reset control logic
    assign rcc_bdma_rst_n = sys_rst_n & ~bdmarst;
// crc reset control logic
    assign rcc_crc_rst_n = sys_rst_n & ~crcrst;
// gpiok reset control logic
    assign rcc_gpiok_rst_n = sys_rst_n & ~gpiokrst;
// gpioj reset control logic
    assign rcc_gpioj_rst_n = sys_rst_n & ~gpiojrst;
// gpioi reset control logic
    assign rcc_gpioi_rst_n = sys_rst_n & ~gpioirst;
// gpioh reset control logic
    assign rcc_gpioh_rst_n = sys_rst_n & ~gpiohrst;
// gpiog reset control logic
    assign rcc_gpiog_rst_n = sys_rst_n & ~gpiogrst;
// gpiof reset control logic
    assign rcc_gpiof_rst_n = sys_rst_n & ~gpiofrst;
// gpioe reset control logic
    assign rcc_gpioe_rst_n = sys_rst_n & ~gpioerst;
// gpiod reset control logic
    assign rcc_gpiod_rst_n = sys_rst_n & ~gpiodrst;
// gpioc reset control logic
    assign rcc_gpioc_rst_n = sys_rst_n & ~gpiocrst;
// gpiob reset control logic
    assign rcc_gpiob_rst_n = sys_rst_n & ~gpiobrst;
// gpioa reset control logic
    assign rcc_gpioa_rst_n = sys_rst_n & ~gpioarst;
// rcc reset control logic
    assign rcc_rcc_rst_n = sys_rst_n ;
// pwr reset control logic
    assign rcc_pwr_rst_n = sys_rst_n ;
// sai4 reset control logic
    assign rcc_sai4_rst_n = sys_rst_n & ~sai4rst;
// rtc reset control logic
    assign rcc_rtc_rst_n = sys_rst_n ;
// vref reset control logic
    assign rcc_vref_rst_n = sys_rst_n & ~vrefrst;
// comp12 reset control logic
    assign rcc_comp12_rst_n = sys_rst_n & ~comp12rst;
// lptim5 reset control logic
    assign rcc_lptim5_rst_n = sys_rst_n & ~lptim5rst;
// lptim4 reset control logic
    assign rcc_lptim4_rst_n = sys_rst_n & ~lptim4rst;
// lptim3 reset control logic
    assign rcc_lptim3_rst_n = sys_rst_n & ~lptim3rst;
// lptim2 reset control logic
    assign rcc_lptim2_rst_n = sys_rst_n & ~lptim2rst;
// i2c4 reset control logic
    assign rcc_i2c4_rst_n = sys_rst_n & ~i2c4rst;
// spi6 reset control logic
    assign rcc_spi6_rst_n = sys_rst_n & ~spi6rst;
// lpuart1 reset control logic
    assign rcc_lpuart1_rst_n = sys_rst_n & ~lpuart1rst;
// syscfg reset control logic
    assign rcc_syscfg_rst_n = sys_rst_n & ~syscfgrst;
// iwdg2 reset control logic
    assign rcc_iwdg2_rst_n = sys_rst_n ;
// iwdg1 reset control logic
    assign rcc_iwdg1_rst_n = sys_rst_n ;
// exti reset control logic
    assign rcc_exti_rst_n = sys_rst_n ;
endmodule
