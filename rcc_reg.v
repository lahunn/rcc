module RCC #(
// ================================================================================
// CONFIGURABLE PARAMETERS
// ================================================================================
  parameter AW = 29  ,
  parameter DW = 32  ,
  parameter WW = DW/8
) (
// ================================================================================
// PINS
// ================================================================================
  input           clk                 ,
  input           rst_n               ,
  input           req                 ,
  input  [WW-1:0] we                  ,
  input  [AW-1:0] addr                ,
  input  [DW-1:0] wdata               ,
  output [DW-1:0] rdata               ,
  output [1:0]    rsp                 ,
  input           pll3_rdy            ,
  output          pll3on              ,
  input           pll2_rdy            ,
  output          pll2on              ,
  input           pll1_rdy            ,
  output          pll1on              ,
  output          hsecsson            ,
  output          hsebyp              ,
  input           hse_rdy             ,
  output          hseon               ,
  input           d2_clk_rdy          ,
  input           d1_clk_rdy          ,
  input           hsi48_dry           ,
  output          hsi48on             ,
  output          csikeron            ,
  input           csi_rdy             ,
  output          csion               ,
  output [1:0]    hsidiv              ,
  input           hsi_rdy             ,
  output          hsikeron            ,
  output          hsion               ,
  output [4:0]    csitrim             ,
  input  [7:0]    flash_csi_opt       ,
  output [5:0]    hsitrim             ,
  input  [11:0]   flash_hsi_opt       ,
  input  [9:0]    crs_hsi48_trim      ,
  output [2:0]    mco2                ,
  output [3:0]    mco2pre             ,
  output [2:0]    mco1                ,
  output [3:0]    mco1pre             ,
  output          timpre              ,
  output          hrtimsel            ,
  output [5:0]    rtcpre              ,
  output          stopkerwuck         ,
  output          stopwuck            ,
  output [2:0]    sw                  ,
  output [3:0]    d1cpre              ,
  output [2:0]    d1ppre              ,
  output [3:0]    hpre                ,
  output [2:0]    d2ppre2             ,
  output [2:0]    d2ppre1             ,
  output [2:0]    d3ppre              ,
  output [5:0]    divm3               ,
  output [5:0]    divm2               ,
  output [5:0]    divm1               ,
  output [1:0]    pllsrc              ,
  output          divr3en             ,
  output          divq3en             ,
  output          divp3en             ,
  output          divr2en             ,
  output          divq2en             ,
  output          divp2en             ,
  output          divr1en             ,
  output          divq1en             ,
  output          divp1en             ,
  output [1:0]    pll3rge             ,
  output          pll3vcosel          ,
  output          pll3fracen          ,
  output [1:0]    pll2rge             ,
  output          pll2vcosel          ,
  output          pll2fracen          ,
  output [1:0]    pll1rge             ,
  output          pll1vcosel          ,
  output          pll1fracen          ,
  output [6:0]    divr1               ,
  output [6:0]    divq1               ,
  output [6:0]    divp1               ,
  output [8:0]    divn1               ,
  output [12:0]   fracn1              ,
  output [6:0]    divr2               ,
  output [6:0]    divq2               ,
  output [6:0]    divp2               ,
  output [8:0]    divn2               ,
  output [12:0]   fracn2              ,
  output [6:0]    divr3               ,
  output [6:0]    divq3               ,
  output [6:0]    divp3               ,
  output [8:0]    divn3               ,
  output [12:0]   fracn3              ,
  output [1:0]    clkpersel           ,
  output          sdmmcsel            ,
  output          dsisel              ,
  output [1:0]    qspisel             ,
  output [1:0]    fmcsel              ,
  output          swpsel              ,
  output [1:0]    fdcansel            ,
  output          dfsdm1sel           ,
  output [1:0]    spdifsel            ,
  output [2:0]    spi45sel            ,
  output [2:0]    spi123sel           ,
  output [2:0]    sai23sel            ,
  output [1:0]    sai1sel             ,
  output [2:0]    lptim1sel           ,
  output [1:0]    cecsel              ,
  output [1:0]    usbsel              ,
  output [1:0]    i2c123sel           ,
  output [1:0]    rngsel              ,
  output [2:0]    usart16sel          ,
  output [2:0]    usart234578sel      ,
  output [2:0]    spi6sel             ,
  output [2:0]    sai4bsel            ,
  output [2:0]    sai4asel            ,
  output [1:0]    adcsel              ,
  output [2:0]    lptim345sel         ,
  output [2:0]    lptim2sel           ,
  output [1:0]    i2c4sel             ,
  output [2:0]    lpuart1sel          ,
  output          lsecssie            ,
  output          pll3rdyie           ,
  output          pll2rdyie           ,
  output          pll1rdyie           ,
  output          hsi48rdyie          ,
  output          csirdyie            ,
  output          hserdyie            ,
  output          hsirdyie            ,
  output          lserdyie            ,
  output          lsirdyie            ,
  input           rcc_hsecss_fail_it  ,
  input           rcc_lsecss_fail_it  ,
  output          bdrst               ,
  output          rtcen               ,
  output [1:0]    rtcsel              ,
  output          lsecsson            ,
  output [1:0]    lsedrv              ,
  output          lsebyp              ,
  input           lse_rdy             ,
  output          lseon               ,
  input           lsi_rdy             ,
  output          lsion               ,
  output          sdmmc1rst           ,
  output          qspirst             ,
  output          fmcrst              ,
  output          jpgdecrst           ,
  output          dma2drst            ,
  output          mdmarst             ,
  output          usb2otgrst          ,
  output          usb1otgrst          ,
  output          eth1macrst          ,
  output          adc12rst            ,
  output          dma2rst             ,
  output          dma1rst             ,
  output          sdmmc2rst           ,
  output          rngrst              ,
  output          hashrst             ,
  output          cryptrst            ,
  output          dcmirst             ,
  output          hsemrst             ,
  output          adc3rst             ,
  output          bdmarst             ,
  output          crcrst              ,
  output          gpiokrst            ,
  output          gpiojrst            ,
  output          gpioirst            ,
  output          gpiohrst            ,
  output          gpiogrst            ,
  output          gpiofrst            ,
  output          gpioerst            ,
  output          gpiodrst            ,
  output          gpiocrst            ,
  output          gpiobrst            ,
  output          gpioarst            ,
  output          ltdcrst             ,
  output          uart8rst            ,
  output          uart7rst            ,
  output          dac12rst            ,
  output          hdmicecrst          ,
  output          i2c3rst             ,
  output          i2c2rst             ,
  output          i2c1rst             ,
  output          uart5rst            ,
  output          uart4rst            ,
  output          usart3rst           ,
  output          usart2rst           ,
  output          spdifrxrst          ,
  output          spi3rst             ,
  output          spi2rst             ,
  output          lptim1rst           ,
  output          tim14rst            ,
  output          tim13rst            ,
  output          tim12rst            ,
  output          tim7rst             ,
  output          tim6rst             ,
  output          tim5rst             ,
  output          tim4rst             ,
  output          tim3rst             ,
  output          tim2rst             ,
  output          fdcanrst            ,
  output          mdiosrst            ,
  output          opamprst            ,
  output          swprst              ,
  output          crsrst              ,
  output          hrtimrst            ,
  output          dfsdm1rst           ,
  output          sai3rst             ,
  output          sai2rst             ,
  output          sai1rst             ,
  output          spi5rst             ,
  output          tim17rst            ,
  output          tim16rst            ,
  output          tim15rst            ,
  output          spi4rst             ,
  output          spi1rst             ,
  output          usart6rst           ,
  output          usart1rst           ,
  output          tim8rst             ,
  output          tim1rst             ,
  output          sai4rst             ,
  output          vrefrst             ,
  output          comp12rst           ,
  output          lptim5rst           ,
  output          lptim4rst           ,
  output          lptim3rst           ,
  output          lptim2rst           ,
  output          i2c4rst             ,
  output          spi6rst             ,
  output          lpuart1rst          ,
  output          syscfgrst           ,
  output          ww2rsc              ,
  output          ww1rsc              ,
  output          sram4amen           ,
  output          bkpramamen          ,
  output          adc3amen            ,
  output          sai4amen            ,
  output          crcamen             ,
  output          rtcamen             ,
  output          vrefamen            ,
  output          comp12amen          ,
  output          lptim5amen          ,
  output          lptim4amen          ,
  output          lptim3amen          ,
  output          lptim2amen          ,
  output          i2c4amen            ,
  output          spi6amen            ,
  output          lpuart1amen         ,
  output          bdmaamen            ,
  output          rmvf                ,
  output          rcc_c1_axisram_en   ,
  output          rcc_c1_itcm_en      ,
  output          rcc_c1_dtcm2_en     ,
  output          rcc_c1_dtcm1_en     ,
  output          rcc_c1_sdmmc1_en    ,
  output          rcc_c1_qspi_en      ,
  output          rcc_c1_fmc_en       ,
  output          rcc_c1_flitf_en     ,
  output          rcc_c1_jpgdec_en    ,
  output          rcc_c1_dma2d_en     ,
  output          rcc_c1_mdma_en      ,
  output          rcc_c1_usb2ulpi_en  ,
  output          rcc_c1_usb2otg_en   ,
  output          rcc_c1_usb1ulpi_en  ,
  output          rcc_c1_usb1otg_en   ,
  output          rcc_c1_eth1rx_en    ,
  output          rcc_c1_eth1tx_en    ,
  output          rcc_c1_eth1mac_en   ,
  output          rcc_c1_adc12_en     ,
  output          rcc_c1_dma2_en      ,
  output          rcc_c1_dma1_en      ,
  output          rcc_c1_sram3_en     ,
  output          rcc_c1_sram2_en     ,
  output          rcc_c1_sram1_en     ,
  output          rcc_c1_sdmmc2_en    ,
  output          rcc_c1_rng_en       ,
  output          rcc_c1_hash_en      ,
  output          rcc_c1_crypt_en     ,
  output          rcc_c1_dcmi_en      ,
  output          rcc_c1_bkpram_en    ,
  output          rcc_c1_hsem_en      ,
  output          rcc_c1_adc3_en      ,
  output          rcc_c1_bdma_en      ,
  output          rcc_c1_crc_en       ,
  output          rcc_c1_gpiok_en     ,
  output          rcc_c1_gpioj_en     ,
  output          rcc_c1_gpioi_en     ,
  output          rcc_c1_gpioh_en     ,
  output          rcc_c1_gpiog_en     ,
  output          rcc_c1_gpiof_en     ,
  output          rcc_c1_gpioe_en     ,
  output          rcc_c1_gpiod_en     ,
  output          rcc_c1_gpioc_en     ,
  output          rcc_c1_gpiob_en     ,
  output          rcc_c1_gpioa_en     ,
  output          rcc_c1_wwdg1_en     ,
  output          rcc_c1_ltdc_en      ,
  output          rcc_c1_uart8_en     ,
  output          rcc_c1_uart7_en     ,
  output          rcc_c1_dac12_en     ,
  output          rcc_c1_hdmicec_en   ,
  output          rcc_c1_i2c3_en      ,
  output          rcc_c1_i2c2_en      ,
  output          rcc_c1_i2c1_en      ,
  output          rcc_c1_uart5_en     ,
  output          rcc_c1_uart4_en     ,
  output          rcc_c1_usart3_en    ,
  output          rcc_c1_usart2_en    ,
  output          rcc_c1_spdifrx_en   ,
  output          rcc_c1_spi3_en      ,
  output          rcc_c1_spi2_en      ,
  output          rcc_c1_wwdg2_en     ,
  output          rcc_c1_lptim1_en    ,
  output          rcc_c1_tim14_en     ,
  output          rcc_c1_tim13_en     ,
  output          rcc_c1_tim12_en     ,
  output          rcc_c1_tim7_en      ,
  output          rcc_c1_tim6_en      ,
  output          rcc_c1_tim5_en      ,
  output          rcc_c1_tim4_en      ,
  output          rcc_c1_tim3_en      ,
  output          rcc_c1_tim2_en      ,
  output          rcc_c1_fdcan_en     ,
  output          rcc_c1_mdios_en     ,
  output          rcc_c1_opamp_en     ,
  output          rcc_c1_swp_en       ,
  output          rcc_c1_crs_en       ,
  output          rcc_c1_hrtim_en     ,
  output          rcc_c1_dfsdm1_en    ,
  output          rcc_c1_sai3_en      ,
  output          rcc_c1_sai2_en      ,
  output          rcc_c1_sai1_en      ,
  output          rcc_c1_spi5_en      ,
  output          rcc_c1_tim17_en     ,
  output          rcc_c1_tim16_en     ,
  output          rcc_c1_tim15_en     ,
  output          rcc_c1_spi4_en      ,
  output          rcc_c1_spi1_en      ,
  output          rcc_c1_usart6_en    ,
  output          rcc_c1_usart1_en    ,
  output          rcc_c1_tim8_en      ,
  output          rcc_c1_tim1_en      ,
  output          rcc_c1_sai4_en      ,
  output          rcc_c1_rtcapb_en    ,
  output          rcc_c1_vref_en      ,
  output          rcc_c1_comp12_en    ,
  output          rcc_c1_lptim5_en    ,
  output          rcc_c1_lptim4_en    ,
  output          rcc_c1_lptim3_en    ,
  output          rcc_c1_lptim2_en    ,
  output          rcc_c1_i2c4_en      ,
  output          rcc_c1_spi6_en      ,
  output          rcc_c1_lpuart1_en   ,
  output          rcc_c1_syscfg_en    ,
  output          rcc_c1_axisramlp_en ,
  output          rcc_c1_itcmlp_en    ,
  output          rcc_c1_dtcm2lp_en   ,
  output          rcc_c1_dtcm1lp_en   ,
  output          rcc_c1_sdmmc1lp_en  ,
  output          rcc_c1_qspilp_en    ,
  output          rcc_c1_fmclp_en     ,
  output          rcc_c1_flitflp_en   ,
  output          rcc_c1_jpgdeclp_en  ,
  output          rcc_c1_dma2dlp_en   ,
  output          rcc_c1_mdmalp_en    ,
  output          rcc_c1_usb2ulpilp_en,
  output          rcc_c1_usb2otglp_en ,
  output          rcc_c1_usb1ulpilp_en,
  output          rcc_c1_usb1otglp_en ,
  output          rcc_c1_eth1rxlp_en  ,
  output          rcc_c1_eth1txlp_en  ,
  output          rcc_c1_eth1maclp_en ,
  output          rcc_c1_adc12lp_en   ,
  output          rcc_c1_dma2lp_en    ,
  output          rcc_c1_dma1lp_en    ,
  output          rcc_c1_sram3lp_en   ,
  output          rcc_c1_sram2lp_en   ,
  output          rcc_c1_sram1lp_en   ,
  output          rcc_c1_sdmmc2lp_en  ,
  output          rcc_c1_rnglp_en     ,
  output          rcc_c1_hashlp_en    ,
  output          rcc_c1_cryptlp_en   ,
  output          rcc_c1_dcmilp_en    ,
  output          rcc_c1_sram4lp_en   ,
  output          rcc_c1_bkpramlp_en  ,
  output          rcc_c1_adc3lp_en    ,
  output          rcc_c1_bdmalp_en    ,
  output          rcc_c1_crclp_en     ,
  output          rcc_c1_gpioklp_en   ,
  output          rcc_c1_gpiojlp_en   ,
  output          rcc_c1_gpioilp_en   ,
  output          rcc_c1_gpiohlp_en   ,
  output          rcc_c1_gpioglp_en   ,
  output          rcc_c1_gpioflp_en   ,
  output          rcc_c1_gpioelp_en   ,
  output          rcc_c1_gpiodlp_en   ,
  output          rcc_c1_gpioclp_en   ,
  output          rcc_c1_gpioblp_en   ,
  output          rcc_c1_gpioalp_en   ,
  output          rcc_c1_wwdg1lp_en   ,
  output          rcc_c1_ltdclp_en    ,
  output          rcc_c1_uart8lp_en   ,
  output          rcc_c1_uart7lp_en   ,
  output          rcc_c1_dac12lp_en   ,
  output          rcc_c1_hdmiceclp_en ,
  output          rcc_c1_i2c3lp_en    ,
  output          rcc_c1_i2c2lp_en    ,
  output          rcc_c1_i2c1lp_en    ,
  output          rcc_c1_uart5lp_en   ,
  output          rcc_c1_uart4lp_en   ,
  output          rcc_c1_usart3lp_en  ,
  output          rcc_c1_usart2lp_en  ,
  output          rcc_c1_spdifrxlp_en ,
  output          rcc_c1_spi3lp_en    ,
  output          rcc_c1_spi2lp_en    ,
  output          rcc_c1_wwdg2lp_en   ,
  output          rcc_c1_lptim1lp_en  ,
  output          rcc_c1_tim14lp_en   ,
  output          rcc_c1_tim13lp_en   ,
  output          rcc_c1_tim12lp_en   ,
  output          rcc_c1_tim7lp_en    ,
  output          rcc_c1_tim6lp_en    ,
  output          rcc_c1_tim5lp_en    ,
  output          rcc_c1_tim4lp_en    ,
  output          rcc_c1_tim3lp_en    ,
  output          rcc_c1_tim2lp_en    ,
  output          rcc_c1_fdcanlp_en   ,
  output          rcc_c1_mdioslp_en   ,
  output          rcc_c1_opamplp_en   ,
  output          rcc_c1_swplp_en     ,
  output          rcc_c1_crslp_en     ,
  output          rcc_c1_hrtimlp_en   ,
  output          rcc_c1_dfsdm1lp_en  ,
  output          rcc_c1_sai3lp_en    ,
  output          rcc_c1_sai2lp_en    ,
  output          rcc_c1_sai1lp_en    ,
  output          rcc_c1_spi5lp_en    ,
  output          rcc_c1_tim17lp_en   ,
  output          rcc_c1_tim16lp_en   ,
  output          rcc_c1_tim15lp_en   ,
  output          rcc_c1_spi4lp_en    ,
  output          rcc_c1_spi1lp_en    ,
  output          rcc_c1_usart6lp_en  ,
  output          rcc_c1_usart1lp_en  ,
  output          rcc_c1_tim8lp_en    ,
  output          rcc_c1_tim1lp_en    ,
  output          rcc_c1_sai4lp_en    ,
  output          rcc_c1_rtcapblp_en  ,
  output          rcc_c1_vreflp_en    ,
  output          rcc_c1_comp12lp_en  ,
  output          rcc_c1_lptim5lp_en  ,
  output          rcc_c1_lptim4lp_en  ,
  output          rcc_c1_lptim3lp_en  ,
  output          rcc_c1_lptim2lp_en  ,
  output          rcc_c1_i2c4lp_en    ,
  output          rcc_c1_spi6lp_en    ,
  output          rcc_c1_lpuart1lp_en ,
  output          rcc_c1_syscfglp_en  ,
  output          rcc_c2_axisram_en   ,
  output          rcc_c2_itcm_en      ,
  output          rcc_c2_dtcm2_en     ,
  output          rcc_c2_dtcm1_en     ,
  output          rcc_c2_sdmmc1_en    ,
  output          rcc_c2_qspi_en      ,
  output          rcc_c2_fmc_en       ,
  output          rcc_c2_flitf_en     ,
  output          rcc_c2_jpgdec_en    ,
  output          rcc_c2_dma2d_en     ,
  output          rcc_c2_mdma_en      ,
  output          rcc_c2_usb2ulpi_en  ,
  output          rcc_c2_usb2otg_en   ,
  output          rcc_c2_usb1ulpi_en  ,
  output          rcc_c2_usb1otg_en   ,
  output          rcc_c2_eth1rx_en    ,
  output          rcc_c2_eth1tx_en    ,
  output          rcc_c2_eth1mac_en   ,
  output          rcc_c2_adc12_en     ,
  output          rcc_c2_dma2_en      ,
  output          rcc_c2_dma1_en      ,
  output          rcc_c2_sram3_en     ,
  output          rcc_c2_sram2_en     ,
  output          rcc_c2_sram1_en     ,
  output          rcc_c2_sdmmc2_en    ,
  output          rcc_c2_rng_en       ,
  output          rcc_c2_hash_en      ,
  output          rcc_c2_crypt_en     ,
  output          rcc_c2_dcmi_en      ,
  output          rcc_c2_bkpram_en    ,
  output          rcc_c2_hsem_en      ,
  output          rcc_c2_adc3_en      ,
  output          rcc_c2_bdma_en      ,
  output          rcc_c2_crc_en       ,
  output          rcc_c2_gpiok_en     ,
  output          rcc_c2_gpioj_en     ,
  output          rcc_c2_gpioi_en     ,
  output          rcc_c2_gpioh_en     ,
  output          rcc_c2_gpiog_en     ,
  output          rcc_c2_gpiof_en     ,
  output          rcc_c2_gpioe_en     ,
  output          rcc_c2_gpiod_en     ,
  output          rcc_c2_gpioc_en     ,
  output          rcc_c2_gpiob_en     ,
  output          rcc_c2_gpioa_en     ,
  output          rcc_c2_wwdg1_en     ,
  output          rcc_c2_ltdc_en      ,
  output          rcc_c2_uart8_en     ,
  output          rcc_c2_uart7_en     ,
  output          rcc_c2_dac12_en     ,
  output          rcc_c2_hdmicec_en   ,
  output          rcc_c2_i2c3_en      ,
  output          rcc_c2_i2c2_en      ,
  output          rcc_c2_i2c1_en      ,
  output          rcc_c2_uart5_en     ,
  output          rcc_c2_uart4_en     ,
  output          rcc_c2_usart3_en    ,
  output          rcc_c2_usart2_en    ,
  output          rcc_c2_spdifrx_en   ,
  output          rcc_c2_spi3_en      ,
  output          rcc_c2_spi2_en      ,
  output          rcc_c2_wwdg2_en     ,
  output          rcc_c2_lptim1_en    ,
  output          rcc_c2_tim14_en     ,
  output          rcc_c2_tim13_en     ,
  output          rcc_c2_tim12_en     ,
  output          rcc_c2_tim7_en      ,
  output          rcc_c2_tim6_en      ,
  output          rcc_c2_tim5_en      ,
  output          rcc_c2_tim4_en      ,
  output          rcc_c2_tim3_en      ,
  output          rcc_c2_tim2_en      ,
  output          rcc_c2_fdcan_en     ,
  output          rcc_c2_mdios_en     ,
  output          rcc_c2_opamp_en     ,
  output          rcc_c2_swp_en       ,
  output          rcc_c2_crs_en       ,
  output          rcc_c2_hrtim_en     ,
  output          rcc_c2_dfsdm1_en    ,
  output          rcc_c2_sai3_en      ,
  output          rcc_c2_sai2_en      ,
  output          rcc_c2_sai1_en      ,
  output          rcc_c2_spi5_en      ,
  output          rcc_c2_tim17_en     ,
  output          rcc_c2_tim16_en     ,
  output          rcc_c2_tim15_en     ,
  output          rcc_c2_spi4_en      ,
  output          rcc_c2_spi1_en      ,
  output          rcc_c2_usart6_en    ,
  output          rcc_c2_usart1_en    ,
  output          rcc_c2_tim8_en      ,
  output          rcc_c2_tim1_en      ,
  output          rcc_c2_sai4_en      ,
  output          rcc_c2_rtcapb_en    ,
  output          rcc_c2_vref_en      ,
  output          rcc_c2_comp12_en    ,
  output          rcc_c2_lptim5_en    ,
  output          rcc_c2_lptim4_en    ,
  output          rcc_c2_lptim3_en    ,
  output          rcc_c2_lptim2_en    ,
  output          rcc_c2_i2c4_en      ,
  output          rcc_c2_spi6_en      ,
  output          rcc_c2_lpuart1_en   ,
  output          rcc_c2_syscfg_en    ,
  output          rcc_c2_axisramlp_en ,
  output          rcc_c2_itcmlp_en    ,
  output          rcc_c2_dtcm2lp_en   ,
  output          rcc_c2_dtcm1lp_en   ,
  output          rcc_c2_sdmmc1lp_en  ,
  output          rcc_c2_qspilp_en    ,
  output          rcc_c2_fmclp_en     ,
  output          rcc_c2_flitflp_en   ,
  output          rcc_c2_jpgdeclp_en  ,
  output          rcc_c2_dma2dlp_en   ,
  output          rcc_c2_mdmalp_en    ,
  output          rcc_c2_usb2ulpilp_en,
  output          rcc_c2_usb2otglp_en ,
  output          rcc_c2_usb1ulpilp_en,
  output          rcc_c2_usb1otglp_en ,
  output          rcc_c2_eth1rxlp_en  ,
  output          rcc_c2_eth1txlp_en  ,
  output          rcc_c2_eth1maclp_en ,
  output          rcc_c2_adc12lp_en   ,
  output          rcc_c2_dma2lp_en    ,
  output          rcc_c2_dma1lp_en    ,
  output          rcc_c2_sram3lp_en   ,
  output          rcc_c2_sram2lp_en   ,
  output          rcc_c2_sram1lp_en   ,
  output          rcc_c2_sdmmc2lp_en  ,
  output          rcc_c2_rnglp_en     ,
  output          rcc_c2_hashlp_en    ,
  output          rcc_c2_cryptlp_en   ,
  output          rcc_c2_dcmilp_en    ,
  output          rcc_c2_sram4lp_en   ,
  output          rcc_c2_bkpramlp_en  ,
  output          rcc_c2_adc3lp_en    ,
  output          rcc_c2_bdmalp_en    ,
  output          rcc_c2_crclp_en     ,
  output          rcc_c2_gpioklp_en   ,
  output          rcc_c2_gpiojlp_en   ,
  output          rcc_c2_gpioilp_en   ,
  output          rcc_c2_gpiohlp_en   ,
  output          rcc_c2_gpioglp_en   ,
  output          rcc_c2_gpioflp_en   ,
  output          rcc_c2_gpioelp_en   ,
  output          rcc_c2_gpiodlp_en   ,
  output          rcc_c2_gpioclp_en   ,
  output          rcc_c2_gpioblp_en   ,
  output          rcc_c2_gpioalp_en   ,
  output          rcc_c2_wwdg1lp_en   ,
  output          rcc_c2_ltdclp_en    ,
  output          rcc_c2_uart8lp_en   ,
  output          rcc_c2_uart7lp_en   ,
  output          rcc_c2_dac12lp_en   ,
  output          rcc_c2_hdmiceclp_en ,
  output          rcc_c2_i2c3lp_en    ,
  output          rcc_c2_i2c2lp_en    ,
  output          rcc_c2_i2c1lp_en    ,
  output          rcc_c2_uart5lp_en   ,
  output          rcc_c2_uart4lp_en   ,
  output          rcc_c2_usart3lp_en  ,
  output          rcc_c2_usart2lp_en  ,
  output          rcc_c2_spdifrxlp_en ,
  output          rcc_c2_spi3lp_en    ,
  output          rcc_c2_spi2lp_en    ,
  output          rcc_c2_wwdg2lp_en   ,
  output          rcc_c2_lptim1lp_en  ,
  output          rcc_c2_tim14lp_en   ,
  output          rcc_c2_tim13lp_en   ,
  output          rcc_c2_tim12lp_en   ,
  output          rcc_c2_tim7lp_en    ,
  output          rcc_c2_tim6lp_en    ,
  output          rcc_c2_tim5lp_en    ,
  output          rcc_c2_tim4lp_en    ,
  output          rcc_c2_tim3lp_en    ,
  output          rcc_c2_tim2lp_en    ,
  output          rcc_c2_fdcanlp_en   ,
  output          rcc_c2_mdioslp_en   ,
  output          rcc_c2_opamplp_en   ,
  output          rcc_c2_swplp_en     ,
  output          rcc_c2_crslp_en     ,
  output          rcc_c2_hrtimlp_en   ,
  output          rcc_c2_dfsdm1lp_en  ,
  output          rcc_c2_sai3lp_en    ,
  output          rcc_c2_sai2lp_en    ,
  output          rcc_c2_sai1lp_en    ,
  output          rcc_c2_spi5lp_en    ,
  output          rcc_c2_tim17lp_en   ,
  output          rcc_c2_tim16lp_en   ,
  output          rcc_c2_tim15lp_en   ,
  output          rcc_c2_spi4lp_en    ,
  output          rcc_c2_spi1lp_en    ,
  output          rcc_c2_usart6lp_en  ,
  output          rcc_c2_usart1lp_en  ,
  output          rcc_c2_tim8lp_en    ,
  output          rcc_c2_tim1lp_en    ,
  output          rcc_c2_sai4lp_en    ,
  output          rcc_c2_rtcapblp_en  ,
  output          rcc_c2_vreflp_en    ,
  output          rcc_c2_comp12lp_en  ,
  output          rcc_c2_lptim5lp_en  ,
  output          rcc_c2_lptim4lp_en  ,
  output          rcc_c2_lptim3lp_en  ,
  output          rcc_c2_lptim2lp_en  ,
  output          rcc_c2_i2c4lp_en    ,
  output          rcc_c2_spi6lp_en    ,
  output          rcc_c2_lpuart1lp_en ,
  output          rcc_c2_syscfglp_en  ,
  input           rcc_sys_stop        ,
  input           rcc_hsecss_fail     ,
  input           rcc_exit_sys_stop   ,
  input           rcc_lsecss_fail     
);
// ================================================================================
// LOCAL PARAMETERS
// ================================================================================
// RCC
localparam RCC               = 'h40000000        ;
localparam RCC_CR            = (RCC + 'h0) >> 2  ;
localparam RCC_ICSCR         = (RCC + 'h4) >> 2  ;
localparam RCC_CRRCR         = (RCC + 'h8) >> 2  ;
localparam RCC_CFGR          = (RCC + 'h10) >> 2 ;
localparam RCC_D1CFGR        = (RCC + 'h18) >> 2 ;
localparam RCC_D2CFGR        = (RCC + 'h1C) >> 2 ;
localparam RCC_D3CFGR        = (RCC + 'h20) >> 2 ;
localparam RCC_PLLCLKSELR    = (RCC + 'h28) >> 2 ;
localparam RCC_PLLCFGR       = (RCC + 'h2C) >> 2 ;
localparam RCC_PLL1DIVR      = (RCC + 'h30) >> 2 ;
localparam RCC_PLL1FRACR     = (RCC + 'h34) >> 2 ;
localparam RCC_PLL2DIVR      = (RCC + 'h38) >> 2 ;
localparam RCC_PLL2FRACR     = (RCC + 'h3C) >> 2 ;
localparam RCC_PLL3DIVR      = (RCC + 'h40) >> 2 ;
localparam RCC_PLL3FRACR     = (RCC + 'h44) >> 2 ;
localparam RCC_D1CCIPR       = (RCC + 'h4C) >> 2 ;
localparam RCC_D2CCIP1R      = (RCC + 'h50) >> 2 ;
localparam RCC_D2CCIP2R      = (RCC + 'h54) >> 2 ;
localparam RCC_D3CCIPR       = (RCC + 'h58) >> 2 ;
localparam RCC_CIER          = (RCC + 'h60) >> 2 ;
localparam RCC_CIFR          = (RCC + 'h64) >> 2 ;
localparam RCC_CICR          = (RCC + 'h68) >> 2 ;
localparam RCC_BDCR          = (RCC + 'h70) >> 2 ;
localparam RCC_CSR           = (RCC + 'h74) >> 2 ;
localparam RCC_AHB3RSTR      = (RCC + 'h7C) >> 2 ;
localparam RCC_AHB1RSTR      = (RCC + 'h80) >> 2 ;
localparam RCC_AHB2RSTR      = (RCC + 'h84) >> 2 ;
localparam RCC_AHB4RSTR      = (RCC + 'h88) >> 2 ;
localparam RCC_APB3RSTR      = (RCC + 'h8C) >> 2 ;
localparam RCC_APB1LRSTR     = (RCC + 'h90) >> 2 ;
localparam RCC_APB1HRSTR     = (RCC + 'h94) >> 2 ;
localparam RCC_APB2RSTR      = (RCC + 'h98) >> 2 ;
localparam RCC_APB4RSTR      = (RCC + 'h9C) >> 2 ;
localparam RCC_GCR           = (RCC + 'hA0) >> 2 ;
localparam RCC_D3AMR         = (RCC + 'hA8) >> 2 ;
localparam RCC_C1_RSR        = (RCC + 'h130) >> 2;
localparam RCC_C1_AHB3ENR    = (RCC + 'h134) >> 2;
localparam RCC_C1_AHB1ENR    = (RCC + 'h138) >> 2;
localparam RCC_C1_AHB2ENR    = (RCC + 'h13C) >> 2;
localparam RCC_C1_AHB4ENR    = (RCC + 'h140) >> 2;
localparam RCC_C1_APB3ENR    = (RCC + 'h144) >> 2;
localparam RCC_C1_APB1LENR   = (RCC + 'h148) >> 2;
localparam RCC_C1_APB1HENR   = (RCC + 'h14C) >> 2;
localparam RCC_C1_APB2ENR    = (RCC + 'h150) >> 2;
localparam RCC_C1_APB4ENR    = (RCC + 'h154) >> 2;
localparam RCC_C1_AHB3LPENR  = (RCC + 'h15C) >> 2;
localparam RCC_C1_AHB1LPENR  = (RCC + 'h160) >> 2;
localparam RCC_C1_AHB2LPENR  = (RCC + 'h164) >> 2;
localparam RCC_C1_AHB4LPENR  = (RCC + 'h168) >> 2;
localparam RCC_C1_APB3LPENR  = (RCC + 'h16C) >> 2;
localparam RCC_C1_APB1LLPENR = (RCC + 'h170) >> 2;
localparam RCC_C1_APB1HLPENR = (RCC + 'h174) >> 2;
localparam RCC_C1_APB2LPENR  = (RCC + 'h178) >> 2;
localparam RCC_C1_APB4LPENR  = (RCC + 'h17C) >> 2;
localparam RCC_C2_AHB3ENR    = (RCC + 'h194) >> 2;
localparam RCC_C2_AHB1ENR    = (RCC + 'h198) >> 2;
localparam RCC_C2_AHB2ENR    = (RCC + 'h19C) >> 2;
localparam RCC_C2_AHB4ENR    = (RCC + 'h1A0) >> 2;
localparam RCC_C2_APB3ENR    = (RCC + 'h1A4) >> 2;
localparam RCC_C2_APB1LENR   = (RCC + 'h1A8) >> 2;
localparam RCC_C2_APB1HENR   = (RCC + 'h1AC) >> 2;
localparam RCC_C2_APB2ENR    = (RCC + 'h1B0) >> 2;
localparam RCC_C2_APB4ENR    = (RCC + 'h1B4) >> 2;
localparam RCC_C2_AHB3LPENR  = (RCC + 'h1BC) >> 2;
localparam RCC_C2_AHB1LPENR  = (RCC + 'h1C0) >> 2;
localparam RCC_C2_AHB2LPENR  = (RCC + 'h1C4) >> 2;
localparam RCC_C2_AHB4LPENR  = (RCC + 'h1C8) >> 2;
localparam RCC_C2_APB3LPENR  = (RCC + 'h1CC) >> 2;
localparam RCC_C2_APB1LLPENR = (RCC + 'h1D0) >> 2;
localparam RCC_C2_APB1HLPENR = (RCC + 'h1D4) >> 2;
localparam RCC_C2_APB2LPENR  = (RCC + 'h1D8) >> 2;
localparam RCC_C2_APB4LPENR  = (RCC + 'h1DC) >> 2;
// other paramters

// ================================================================================
// INTERNAL SIGNAL DECLARATION
// ================================================================================
// read/write logic signal
wire          rd_req     ;
wire [WW-1:0] wr_req     ;
wire          rsv_reg_sel;
wire          rsv_acs_err;
wire [DW-1:0] rdata_tmp  ;
// RCC
// rcc_cr
wire [31:0] rcc_cr_read        ;
wire        rcc_cr_sel         ;
wire        cur_rcc_cr_pll3rdy ;
wire        cur_rcc_cr_pll3on  ;
wire        nxt_rcc_cr_pll3on  ;
wire        rcc_cr_pll3on_en   ;
wire        cur_rcc_cr_pll2rdy ;
wire        cur_rcc_cr_pll2on  ;
wire        nxt_rcc_cr_pll2on  ;
wire        rcc_cr_pll2on_en   ;
wire        cur_rcc_cr_pll1rdy ;
wire        cur_rcc_cr_pll1on  ;
wire        nxt_rcc_cr_pll1on  ;
wire        rcc_cr_pll1on_en   ;
wire        cur_rcc_cr_hsecsson;
wire        nxt_rcc_cr_hsecsson;
wire        rcc_cr_hsecsson_en ;
wire        cur_rcc_cr_hsebyp  ;
wire        nxt_rcc_cr_hsebyp  ;
wire        rcc_cr_hsebyp_en   ;
wire        cur_rcc_cr_hserdy  ;
wire        cur_rcc_cr_hseon   ;
wire        nxt_rcc_cr_hseon   ;
wire        rcc_cr_hseon_en    ;
wire        cur_rcc_cr_d2ckrdy ;
wire        cur_rcc_cr_d1ckrdy ;
wire        cur_rcc_cr_hsi48rdy;
wire        cur_rcc_cr_hsi48on ;
wire        nxt_rcc_cr_hsi48on ;
wire        rcc_cr_hsi48on_en  ;
wire        cur_rcc_cr_csikeron;
wire        nxt_rcc_cr_csikeron;
wire        rcc_cr_csikeron_en ;
wire        cur_rcc_cr_csirdy  ;
wire        cur_rcc_cr_csion   ;
wire        nxt_rcc_cr_csion   ;
wire        rcc_cr_csion_en    ;
wire        cur_rcc_cr_hsidivf ;
wire        nxt_rcc_cr_hsidivf ;
wire        rcc_cr_hsidivf_en  ;
wire        rcc_cr_hsidivf_clr ;
wire        rcc_cr_hsidivf_set ;
wire [1:0]  cur_rcc_cr_hsidiv  ;
wire [1:0]  nxt_rcc_cr_hsidiv  ;
wire        rcc_cr_hsidiv_en   ;
wire        cur_rcc_cr_hsirdy  ;
wire        cur_rcc_cr_hsikeron;
wire        nxt_rcc_cr_hsikeron;
wire        rcc_cr_hsikeron_en ;
wire        cur_rcc_cr_hsion   ;
wire        nxt_rcc_cr_hsion   ;
wire        rcc_cr_hsion_en    ;
// rcc_icscr
wire [31:0] rcc_icscr_read       ;
wire        rcc_icscr_sel        ;
wire [4:0]  cur_rcc_icscr_csitrim;
wire [4:0]  nxt_rcc_icscr_csitrim;
wire        rcc_icscr_csitrim_en ;
wire [7:0]  cur_rcc_icscr_csical ;
wire [5:0]  cur_rcc_icscr_hsitrim;
wire [5:0]  nxt_rcc_icscr_hsitrim;
wire        rcc_icscr_hsitrim_en ;
wire [11:0] cur_rcc_icscr_hsical ;
// rcc_crrcr
wire [31:0] rcc_crrcr_read        ;
wire        rcc_crrcr_sel         ;
wire [9:0]  cur_rcc_crrcr_hsi48cal;
// rcc_cfgr
wire [31:0] rcc_cfgr_read           ;
wire        rcc_cfgr_sel            ;
wire [2:0]  cur_rcc_cfgr_mco2       ;
wire [2:0]  nxt_rcc_cfgr_mco2       ;
wire        rcc_cfgr_mco2_en        ;
wire [3:0]  cur_rcc_cfgr_mco2pre    ;
wire [3:0]  nxt_rcc_cfgr_mco2pre    ;
wire        rcc_cfgr_mco2pre_en     ;
wire [2:0]  cur_rcc_cfgr_mco1       ;
wire [2:0]  nxt_rcc_cfgr_mco1       ;
wire        rcc_cfgr_mco1_en        ;
wire [3:0]  cur_rcc_cfgr_mco1pre    ;
wire [3:0]  nxt_rcc_cfgr_mco1pre    ;
wire        rcc_cfgr_mco1pre_en     ;
wire        cur_rcc_cfgr_timpre     ;
wire        nxt_rcc_cfgr_timpre     ;
wire        rcc_cfgr_timpre_en      ;
wire        cur_rcc_cfgr_hrtimsel   ;
wire        nxt_rcc_cfgr_hrtimsel   ;
wire        rcc_cfgr_hrtimsel_en    ;
wire [5:0]  cur_rcc_cfgr_rtcpre     ;
wire [5:0]  nxt_rcc_cfgr_rtcpre     ;
wire        rcc_cfgr_rtcpre_en      ;
wire        cur_rcc_cfgr_stopkerwuck;
wire        nxt_rcc_cfgr_stopkerwuck;
wire        rcc_cfgr_stopkerwuck_en ;
wire        cur_rcc_cfgr_stopwuck   ;
wire        nxt_rcc_cfgr_stopwuck   ;
wire        rcc_cfgr_stopwuck_en    ;
wire [2:0]  cur_rcc_cfgr_sws        ;
wire [2:0]  cur_rcc_cfgr_sw         ;
wire [2:0]  nxt_rcc_cfgr_sw         ;
wire        rcc_cfgr_sw_en          ;
// rcc_d1cfgr
wire [31:0] rcc_d1cfgr_read      ;
wire        rcc_d1cfgr_sel       ;
wire [3:0]  cur_rcc_d1cfgr_d1cpre;
wire [3:0]  nxt_rcc_d1cfgr_d1cpre;
wire        rcc_d1cfgr_d1cpre_en ;
wire [2:0]  cur_rcc_d1cfgr_d1ppre;
wire [2:0]  nxt_rcc_d1cfgr_d1ppre;
wire        rcc_d1cfgr_d1ppre_en ;
wire [3:0]  cur_rcc_d1cfgr_hpre  ;
wire [3:0]  nxt_rcc_d1cfgr_hpre  ;
wire        rcc_d1cfgr_hpre_en   ;
// rcc_d2cfgr
wire [31:0] rcc_d2cfgr_read       ;
wire        rcc_d2cfgr_sel        ;
wire [2:0]  cur_rcc_d2cfgr_d2ppre2;
wire [2:0]  nxt_rcc_d2cfgr_d2ppre2;
wire        rcc_d2cfgr_d2ppre2_en ;
wire [2:0]  cur_rcc_d2cfgr_d2ppre1;
wire [2:0]  nxt_rcc_d2cfgr_d2ppre1;
wire        rcc_d2cfgr_d2ppre1_en ;
// rcc_d3cfgr
wire [31:0] rcc_d3cfgr_read      ;
wire        rcc_d3cfgr_sel       ;
wire [2:0]  cur_rcc_d3cfgr_d3ppre;
wire [2:0]  nxt_rcc_d3cfgr_d3ppre;
wire        rcc_d3cfgr_d3ppre_en ;
// rcc_pllclkselr
wire [31:0] rcc_pllclkselr_read      ;
wire        rcc_pllclkselr_sel       ;
wire [5:0]  cur_rcc_pllclkselr_divm3 ;
wire [5:0]  nxt_rcc_pllclkselr_divm3 ;
wire        rcc_pllclkselr_divm3_en  ;
wire [5:0]  cur_rcc_pllclkselr_divm2 ;
wire [5:0]  nxt_rcc_pllclkselr_divm2 ;
wire        rcc_pllclkselr_divm2_en  ;
wire [5:0]  cur_rcc_pllclkselr_divm1 ;
wire [5:0]  nxt_rcc_pllclkselr_divm1 ;
wire        rcc_pllclkselr_divm1_en  ;
wire [1:0]  cur_rcc_pllclkselr_pllsrc;
wire [1:0]  nxt_rcc_pllclkselr_pllsrc;
wire        rcc_pllclkselr_pllsrc_en ;
// rcc_pllcfgr
wire [31:0] rcc_pllcfgr_read          ;
wire        rcc_pllcfgr_sel           ;
wire        cur_rcc_pllcfgr_divr3en   ;
wire        nxt_rcc_pllcfgr_divr3en   ;
wire        rcc_pllcfgr_divr3en_en    ;
wire        cur_rcc_pllcfgr_divq3en   ;
wire        nxt_rcc_pllcfgr_divq3en   ;
wire        rcc_pllcfgr_divq3en_en    ;
wire        cur_rcc_pllcfgr_divp3en   ;
wire        nxt_rcc_pllcfgr_divp3en   ;
wire        rcc_pllcfgr_divp3en_en    ;
wire        cur_rcc_pllcfgr_divr2en   ;
wire        nxt_rcc_pllcfgr_divr2en   ;
wire        rcc_pllcfgr_divr2en_en    ;
wire        cur_rcc_pllcfgr_divq2en   ;
wire        nxt_rcc_pllcfgr_divq2en   ;
wire        rcc_pllcfgr_divq2en_en    ;
wire        cur_rcc_pllcfgr_divp2en   ;
wire        nxt_rcc_pllcfgr_divp2en   ;
wire        rcc_pllcfgr_divp2en_en    ;
wire        cur_rcc_pllcfgr_divr1en   ;
wire        nxt_rcc_pllcfgr_divr1en   ;
wire        rcc_pllcfgr_divr1en_en    ;
wire        cur_rcc_pllcfgr_divq1en   ;
wire        nxt_rcc_pllcfgr_divq1en   ;
wire        rcc_pllcfgr_divq1en_en    ;
wire        cur_rcc_pllcfgr_divp1en   ;
wire        nxt_rcc_pllcfgr_divp1en   ;
wire        rcc_pllcfgr_divp1en_en    ;
wire [1:0]  cur_rcc_pllcfgr_pll3rge   ;
wire [1:0]  nxt_rcc_pllcfgr_pll3rge   ;
wire        rcc_pllcfgr_pll3rge_en    ;
wire        cur_rcc_pllcfgr_pll3vcosel;
wire        nxt_rcc_pllcfgr_pll3vcosel;
wire        rcc_pllcfgr_pll3vcosel_en ;
wire        cur_rcc_pllcfgr_pll3fracen;
wire        nxt_rcc_pllcfgr_pll3fracen;
wire        rcc_pllcfgr_pll3fracen_en ;
wire [1:0]  cur_rcc_pllcfgr_pll2rge   ;
wire [1:0]  nxt_rcc_pllcfgr_pll2rge   ;
wire        rcc_pllcfgr_pll2rge_en    ;
wire        cur_rcc_pllcfgr_pll2vcosel;
wire        nxt_rcc_pllcfgr_pll2vcosel;
wire        rcc_pllcfgr_pll2vcosel_en ;
wire        cur_rcc_pllcfgr_pll2fracen;
wire        nxt_rcc_pllcfgr_pll2fracen;
wire        rcc_pllcfgr_pll2fracen_en ;
wire [1:0]  cur_rcc_pllcfgr_pll1rge   ;
wire [1:0]  nxt_rcc_pllcfgr_pll1rge   ;
wire        rcc_pllcfgr_pll1rge_en    ;
wire        cur_rcc_pllcfgr_pll1vcosel;
wire        nxt_rcc_pllcfgr_pll1vcosel;
wire        rcc_pllcfgr_pll1vcosel_en ;
wire        cur_rcc_pllcfgr_pll1fracen;
wire        nxt_rcc_pllcfgr_pll1fracen;
wire        rcc_pllcfgr_pll1fracen_en ;
// rcc_pll1divr
wire [31:0] rcc_pll1divr_read     ;
wire        rcc_pll1divr_sel      ;
wire [6:0]  cur_rcc_pll1divr_divr1;
wire [6:0]  nxt_rcc_pll1divr_divr1;
wire        rcc_pll1divr_divr1_en ;
wire [6:0]  cur_rcc_pll1divr_divq1;
wire [6:0]  nxt_rcc_pll1divr_divq1;
wire        rcc_pll1divr_divq1_en ;
wire [6:0]  cur_rcc_pll1divr_divp1;
wire [6:0]  nxt_rcc_pll1divr_divp1;
wire        rcc_pll1divr_divp1_en ;
wire [8:0]  cur_rcc_pll1divr_divn1;
wire [8:0]  nxt_rcc_pll1divr_divn1;
wire        rcc_pll1divr_divn1_en ;
// rcc_pll1fracr
wire [31:0] rcc_pll1fracr_read      ;
wire        rcc_pll1fracr_sel       ;
wire [12:0] cur_rcc_pll1fracr_fracn1;
wire [12:0] nxt_rcc_pll1fracr_fracn1;
wire        rcc_pll1fracr_fracn1_en ;
// rcc_pll2divr
wire [31:0] rcc_pll2divr_read     ;
wire        rcc_pll2divr_sel      ;
wire [6:0]  cur_rcc_pll2divr_divr2;
wire [6:0]  nxt_rcc_pll2divr_divr2;
wire        rcc_pll2divr_divr2_en ;
wire [6:0]  cur_rcc_pll2divr_divq2;
wire [6:0]  nxt_rcc_pll2divr_divq2;
wire        rcc_pll2divr_divq2_en ;
wire [6:0]  cur_rcc_pll2divr_divp2;
wire [6:0]  nxt_rcc_pll2divr_divp2;
wire        rcc_pll2divr_divp2_en ;
wire [8:0]  cur_rcc_pll2divr_divn2;
wire [8:0]  nxt_rcc_pll2divr_divn2;
wire        rcc_pll2divr_divn2_en ;
// rcc_pll2fracr
wire [31:0] rcc_pll2fracr_read      ;
wire        rcc_pll2fracr_sel       ;
wire [12:0] cur_rcc_pll2fracr_fracn2;
wire [12:0] nxt_rcc_pll2fracr_fracn2;
wire        rcc_pll2fracr_fracn2_en ;
// rcc_pll3divr
wire [31:0] rcc_pll3divr_read     ;
wire        rcc_pll3divr_sel      ;
wire [6:0]  cur_rcc_pll3divr_divr3;
wire [6:0]  nxt_rcc_pll3divr_divr3;
wire        rcc_pll3divr_divr3_en ;
wire [6:0]  cur_rcc_pll3divr_divq3;
wire [6:0]  nxt_rcc_pll3divr_divq3;
wire        rcc_pll3divr_divq3_en ;
wire [6:0]  cur_rcc_pll3divr_divp3;
wire [6:0]  nxt_rcc_pll3divr_divp3;
wire        rcc_pll3divr_divp3_en ;
wire [8:0]  cur_rcc_pll3divr_divn3;
wire [8:0]  nxt_rcc_pll3divr_divn3;
wire        rcc_pll3divr_divn3_en ;
// rcc_pll3fracr
wire [31:0] rcc_pll3fracr_read      ;
wire        rcc_pll3fracr_sel       ;
wire [12:0] cur_rcc_pll3fracr_fracn3;
wire [12:0] nxt_rcc_pll3fracr_fracn3;
wire        rcc_pll3fracr_fracn3_en ;
// rcc_d1ccipr
wire [31:0] rcc_d1ccipr_read         ;
wire        rcc_d1ccipr_sel          ;
wire [1:0]  cur_rcc_d1ccipr_clkpersel;
wire [1:0]  nxt_rcc_d1ccipr_clkpersel;
wire        rcc_d1ccipr_clkpersel_en ;
wire        cur_rcc_d1ccipr_sdmmcsel ;
wire        nxt_rcc_d1ccipr_sdmmcsel ;
wire        rcc_d1ccipr_sdmmcsel_en  ;
wire        cur_rcc_d1ccipr_dsisel   ;
wire        nxt_rcc_d1ccipr_dsisel   ;
wire        rcc_d1ccipr_dsisel_en    ;
wire [1:0]  cur_rcc_d1ccipr_qspisel  ;
wire [1:0]  nxt_rcc_d1ccipr_qspisel  ;
wire        rcc_d1ccipr_qspisel_en   ;
wire [1:0]  cur_rcc_d1ccipr_fmcsel   ;
wire [1:0]  nxt_rcc_d1ccipr_fmcsel   ;
wire        rcc_d1ccipr_fmcsel_en    ;
// rcc_d2ccip1r
wire [31:0] rcc_d2ccip1r_read         ;
wire        rcc_d2ccip1r_sel          ;
wire        cur_rcc_d2ccip1r_swpsel   ;
wire        nxt_rcc_d2ccip1r_swpsel   ;
wire        rcc_d2ccip1r_swpsel_en    ;
wire [1:0]  cur_rcc_d2ccip1r_fdcansel ;
wire [1:0]  nxt_rcc_d2ccip1r_fdcansel ;
wire        rcc_d2ccip1r_fdcansel_en  ;
wire        cur_rcc_d2ccip1r_dfsdm1sel;
wire        nxt_rcc_d2ccip1r_dfsdm1sel;
wire        rcc_d2ccip1r_dfsdm1sel_en ;
wire [1:0]  cur_rcc_d2ccip1r_spdifsel ;
wire [1:0]  nxt_rcc_d2ccip1r_spdifsel ;
wire        rcc_d2ccip1r_spdifsel_en  ;
wire [2:0]  cur_rcc_d2ccip1r_spi45sel ;
wire [2:0]  nxt_rcc_d2ccip1r_spi45sel ;
wire        rcc_d2ccip1r_spi45sel_en  ;
wire [2:0]  cur_rcc_d2ccip1r_spi123sel;
wire [2:0]  nxt_rcc_d2ccip1r_spi123sel;
wire        rcc_d2ccip1r_spi123sel_en ;
wire [2:0]  cur_rcc_d2ccip1r_sai23sel ;
wire [2:0]  nxt_rcc_d2ccip1r_sai23sel ;
wire        rcc_d2ccip1r_sai23sel_en  ;
wire [1:0]  cur_rcc_d2ccip1r_sai1sel  ;
wire [1:0]  nxt_rcc_d2ccip1r_sai1sel  ;
wire        rcc_d2ccip1r_sai1sel_en   ;
// rcc_d2ccip2r
wire [31:0] rcc_d2ccip2r_read              ;
wire        rcc_d2ccip2r_sel               ;
wire [2:0]  cur_rcc_d2ccip2r_lptim1sel     ;
wire [2:0]  nxt_rcc_d2ccip2r_lptim1sel     ;
wire        rcc_d2ccip2r_lptim1sel_en      ;
wire [1:0]  cur_rcc_d2ccip2r_cecsel        ;
wire [1:0]  nxt_rcc_d2ccip2r_cecsel        ;
wire        rcc_d2ccip2r_cecsel_en         ;
wire [1:0]  cur_rcc_d2ccip2r_usbsel        ;
wire [1:0]  nxt_rcc_d2ccip2r_usbsel        ;
wire        rcc_d2ccip2r_usbsel_en         ;
wire [1:0]  cur_rcc_d2ccip2r_i2c123sel     ;
wire [1:0]  nxt_rcc_d2ccip2r_i2c123sel     ;
wire        rcc_d2ccip2r_i2c123sel_en      ;
wire [1:0]  cur_rcc_d2ccip2r_rngsel        ;
wire [1:0]  nxt_rcc_d2ccip2r_rngsel        ;
wire        rcc_d2ccip2r_rngsel_en         ;
wire [2:0]  cur_rcc_d2ccip2r_usart16sel    ;
wire [2:0]  nxt_rcc_d2ccip2r_usart16sel    ;
wire        rcc_d2ccip2r_usart16sel_en     ;
wire [2:0]  cur_rcc_d2ccip2r_usart234578sel;
wire [2:0]  nxt_rcc_d2ccip2r_usart234578sel;
wire        rcc_d2ccip2r_usart234578sel_en ;
// rcc_d3ccipr
wire [31:0] rcc_d3ccipr_read           ;
wire        rcc_d3ccipr_sel            ;
wire [2:0]  cur_rcc_d3ccipr_spi6sel    ;
wire [2:0]  nxt_rcc_d3ccipr_spi6sel    ;
wire        rcc_d3ccipr_spi6sel_en     ;
wire [2:0]  cur_rcc_d3ccipr_sai4bsel   ;
wire [2:0]  nxt_rcc_d3ccipr_sai4bsel   ;
wire        rcc_d3ccipr_sai4bsel_en    ;
wire [2:0]  cur_rcc_d3ccipr_sai4asel   ;
wire [2:0]  nxt_rcc_d3ccipr_sai4asel   ;
wire        rcc_d3ccipr_sai4asel_en    ;
wire [1:0]  cur_rcc_d3ccipr_adcsel     ;
wire [1:0]  nxt_rcc_d3ccipr_adcsel     ;
wire        rcc_d3ccipr_adcsel_en      ;
wire [2:0]  cur_rcc_d3ccipr_lptim345sel;
wire [2:0]  nxt_rcc_d3ccipr_lptim345sel;
wire        rcc_d3ccipr_lptim345sel_en ;
wire [2:0]  cur_rcc_d3ccipr_lptim2sel  ;
wire [2:0]  nxt_rcc_d3ccipr_lptim2sel  ;
wire        rcc_d3ccipr_lptim2sel_en   ;
wire [1:0]  cur_rcc_d3ccipr_i2c4sel    ;
wire [1:0]  nxt_rcc_d3ccipr_i2c4sel    ;
wire        rcc_d3ccipr_i2c4sel_en     ;
wire [2:0]  cur_rcc_d3ccipr_lpuart1sel ;
wire [2:0]  nxt_rcc_d3ccipr_lpuart1sel ;
wire        rcc_d3ccipr_lpuart1sel_en  ;
// rcc_cier
wire [31:0] rcc_cier_read          ;
wire        rcc_cier_sel           ;
wire        cur_rcc_cier_lsecssie  ;
wire        nxt_rcc_cier_lsecssie  ;
wire        rcc_cier_lsecssie_en   ;
wire        cur_rcc_cier_pll3rdyie ;
wire        nxt_rcc_cier_pll3rdyie ;
wire        rcc_cier_pll3rdyie_en  ;
wire        cur_rcc_cier_pll2rdyie ;
wire        nxt_rcc_cier_pll2rdyie ;
wire        rcc_cier_pll2rdyie_en  ;
wire        cur_rcc_cier_pll1rdyie ;
wire        nxt_rcc_cier_pll1rdyie ;
wire        rcc_cier_pll1rdyie_en  ;
wire        cur_rcc_cier_hsi48rdyie;
wire        nxt_rcc_cier_hsi48rdyie;
wire        rcc_cier_hsi48rdyie_en ;
wire        cur_rcc_cier_csirdyie  ;
wire        nxt_rcc_cier_csirdyie  ;
wire        rcc_cier_csirdyie_en   ;
wire        cur_rcc_cier_hserdyie  ;
wire        nxt_rcc_cier_hserdyie  ;
wire        rcc_cier_hserdyie_en   ;
wire        cur_rcc_cier_hsirdyie  ;
wire        nxt_rcc_cier_hsirdyie  ;
wire        rcc_cier_hsirdyie_en   ;
wire        cur_rcc_cier_lserdyie  ;
wire        nxt_rcc_cier_lserdyie  ;
wire        rcc_cier_lserdyie_en   ;
wire        cur_rcc_cier_lsirdyie  ;
wire        nxt_rcc_cier_lsirdyie  ;
wire        rcc_cier_lsirdyie_en   ;
// rcc_cifr
wire [31:0] rcc_cifr_read         ;
wire        rcc_cifr_sel          ;
wire        cur_rcc_cifr_hsecssf  ;
wire        nxt_rcc_cifr_hsecssf  ;
wire        rcc_cifr_hsecssf_en   ;
wire        rcc_cifr_hsecssf_clr  ;
wire        rcc_cifr_hsecssf_set  ;
wire        cur_rcc_cifr_lsecssf  ;
wire        nxt_rcc_cifr_lsecssf  ;
wire        rcc_cifr_lsecssf_en   ;
wire        rcc_cifr_lsecssf_clr  ;
wire        rcc_cifr_lsecssf_set  ;
wire        cur_rcc_cifr_pll3rdyf ;
wire        nxt_rcc_cifr_pll3rdyf ;
wire        rcc_cifr_pll3rdyf_en  ;
wire        rcc_cifr_pll3rdyf_clr ;
wire        rcc_cifr_pll3rdyf_set ;
wire        cur_rcc_cifr_pll2rdyf ;
wire        nxt_rcc_cifr_pll2rdyf ;
wire        rcc_cifr_pll2rdyf_en  ;
wire        rcc_cifr_pll2rdyf_clr ;
wire        rcc_cifr_pll2rdyf_set ;
wire        cur_rcc_cifr_pll1rdyf ;
wire        nxt_rcc_cifr_pll1rdyf ;
wire        rcc_cifr_pll1rdyf_en  ;
wire        rcc_cifr_pll1rdyf_clr ;
wire        rcc_cifr_pll1rdyf_set ;
wire        cur_rcc_cifr_hsi48rdyf;
wire        nxt_rcc_cifr_hsi48rdyf;
wire        rcc_cifr_hsi48rdyf_en ;
wire        rcc_cifr_hsi48rdyf_clr;
wire        rcc_cifr_hsi48rdyf_set;
wire        cur_rcc_cifr_csirdyf  ;
wire        nxt_rcc_cifr_csirdyf  ;
wire        rcc_cifr_csirdyf_en   ;
wire        rcc_cifr_csirdyf_clr  ;
wire        rcc_cifr_csirdyf_set  ;
wire        cur_rcc_cifr_hserdyf  ;
wire        nxt_rcc_cifr_hserdyf  ;
wire        rcc_cifr_hserdyf_en   ;
wire        rcc_cifr_hserdyf_clr  ;
wire        rcc_cifr_hserdyf_set  ;
wire        cur_rcc_cifr_hsirdyf  ;
wire        nxt_rcc_cifr_hsirdyf  ;
wire        rcc_cifr_hsirdyf_en   ;
wire        rcc_cifr_hsirdyf_clr  ;
wire        rcc_cifr_hsirdyf_set  ;
wire        cur_rcc_cifr_lserdyf  ;
wire        nxt_rcc_cifr_lserdyf  ;
wire        rcc_cifr_lserdyf_en   ;
wire        rcc_cifr_lserdyf_clr  ;
wire        rcc_cifr_lserdyf_set  ;
wire        cur_rcc_cifr_lsirdyf  ;
wire        nxt_rcc_cifr_lsirdyf  ;
wire        rcc_cifr_lsirdyf_en   ;
wire        rcc_cifr_lsirdyf_clr  ;
wire        rcc_cifr_lsirdyf_set  ;
// rcc_cicr
wire [31:0] rcc_cicr_read         ;
wire        rcc_cicr_sel          ;
wire        cur_rcc_cicr_hsecssc  ;
wire        nxt_rcc_cicr_hsecssc  ;
wire        rcc_cicr_hsecssc_en   ;
wire        cur_rcc_cicr_lsecssc  ;
wire        nxt_rcc_cicr_lsecssc  ;
wire        rcc_cicr_lsecssc_en   ;
wire        cur_rcc_cicr_pll3rdyc ;
wire        nxt_rcc_cicr_pll3rdyc ;
wire        rcc_cicr_pll3rdyc_en  ;
wire        cur_rcc_cicr_pll2rdyc ;
wire        nxt_rcc_cicr_pll2rdyc ;
wire        rcc_cicr_pll2rdyc_en  ;
wire        cur_rcc_cicr_pll1rdyc ;
wire        nxt_rcc_cicr_pll1rdyc ;
wire        rcc_cicr_pll1rdyc_en  ;
wire        cur_rcc_cicr_hsi48rdyc;
wire        nxt_rcc_cicr_hsi48rdyc;
wire        rcc_cicr_hsi48rdyc_en ;
wire        cur_rcc_cicr_csirdyc  ;
wire        nxt_rcc_cicr_csirdyc  ;
wire        rcc_cicr_csirdyc_en   ;
wire        cur_rcc_cicr_hserdyc  ;
wire        nxt_rcc_cicr_hserdyc  ;
wire        rcc_cicr_hserdyc_en   ;
wire        cur_rcc_cicr_hsirdyc  ;
wire        nxt_rcc_cicr_hsirdyc  ;
wire        rcc_cicr_hsirdyc_en   ;
wire        cur_rcc_cicr_lserdyc  ;
wire        nxt_rcc_cicr_lserdyc  ;
wire        rcc_cicr_lserdyc_en   ;
wire        cur_rcc_cicr_lsirdyc  ;
wire        nxt_rcc_cicr_lsirdyc  ;
wire        rcc_cicr_lsirdyc_en   ;
// rcc_bdcr
wire [31:0] rcc_bdcr_read        ;
wire        rcc_bdcr_sel         ;
wire        cur_rcc_bdcr_bdrst   ;
wire        nxt_rcc_bdcr_bdrst   ;
wire        rcc_bdcr_bdrst_en    ;
wire        cur_rcc_bdcr_rtcen   ;
wire        nxt_rcc_bdcr_rtcen   ;
wire        rcc_bdcr_rtcen_en    ;
wire [1:0]  cur_rcc_bdcr_rtcsel  ;
wire [1:0]  nxt_rcc_bdcr_rtcsel  ;
wire        rcc_bdcr_rtcsel_en   ;
wire        cur_rcc_bdcr_lsecssd ;
wire        nxt_rcc_bdcr_lsecssd ;
wire        rcc_bdcr_lsecssd_en  ;
wire        rcc_bdcr_lsecssd_clr ;
wire        rcc_bdcr_lsecssd_set ;
wire        cur_rcc_bdcr_lsecsson;
wire        nxt_rcc_bdcr_lsecsson;
wire        rcc_bdcr_lsecsson_en ;
wire [1:0]  cur_rcc_bdcr_lsedrv  ;
wire [1:0]  nxt_rcc_bdcr_lsedrv  ;
wire        rcc_bdcr_lsedrv_en   ;
wire        cur_rcc_bdcr_lsebyp  ;
wire        nxt_rcc_bdcr_lsebyp  ;
wire        rcc_bdcr_lsebyp_en   ;
wire        cur_rcc_bdcr_lserdy  ;
wire        cur_rcc_bdcr_lseon   ;
wire        nxt_rcc_bdcr_lseon   ;
wire        rcc_bdcr_lseon_en    ;
// rcc_csr
wire [31:0] rcc_csr_read      ;
wire        rcc_csr_sel       ;
wire        cur_rcc_csr_lsirdy;
wire        cur_rcc_csr_lsion ;
wire        nxt_rcc_csr_lsion ;
wire        rcc_csr_lsion_en  ;
// rcc_ahb3rstr
wire [31:0] rcc_ahb3rstr_read         ;
wire        rcc_ahb3rstr_sel          ;
wire        cur_rcc_ahb3rstr_sdmmc1rst;
wire        nxt_rcc_ahb3rstr_sdmmc1rst;
wire        rcc_ahb3rstr_sdmmc1rst_en ;
wire        cur_rcc_ahb3rstr_qspirst  ;
wire        nxt_rcc_ahb3rstr_qspirst  ;
wire        rcc_ahb3rstr_qspirst_en   ;
wire        cur_rcc_ahb3rstr_fmcrst   ;
wire        nxt_rcc_ahb3rstr_fmcrst   ;
wire        rcc_ahb3rstr_fmcrst_en    ;
wire        cur_rcc_ahb3rstr_jpgdecrst;
wire        nxt_rcc_ahb3rstr_jpgdecrst;
wire        rcc_ahb3rstr_jpgdecrst_en ;
wire        cur_rcc_ahb3rstr_dma2drst ;
wire        nxt_rcc_ahb3rstr_dma2drst ;
wire        rcc_ahb3rstr_dma2drst_en  ;
wire        cur_rcc_ahb3rstr_mdmarst  ;
wire        nxt_rcc_ahb3rstr_mdmarst  ;
wire        rcc_ahb3rstr_mdmarst_en   ;
// rcc_ahb1rstr
wire [31:0] rcc_ahb1rstr_read          ;
wire        rcc_ahb1rstr_sel           ;
wire        cur_rcc_ahb1rstr_usb2otgrst;
wire        nxt_rcc_ahb1rstr_usb2otgrst;
wire        rcc_ahb1rstr_usb2otgrst_en ;
wire        cur_rcc_ahb1rstr_usb1otgrst;
wire        nxt_rcc_ahb1rstr_usb1otgrst;
wire        rcc_ahb1rstr_usb1otgrst_en ;
wire        cur_rcc_ahb1rstr_eth1macrst;
wire        nxt_rcc_ahb1rstr_eth1macrst;
wire        rcc_ahb1rstr_eth1macrst_en ;
wire        cur_rcc_ahb1rstr_adc12rst  ;
wire        nxt_rcc_ahb1rstr_adc12rst  ;
wire        rcc_ahb1rstr_adc12rst_en   ;
wire        cur_rcc_ahb1rstr_dma2rst   ;
wire        nxt_rcc_ahb1rstr_dma2rst   ;
wire        rcc_ahb1rstr_dma2rst_en    ;
wire        cur_rcc_ahb1rstr_dma1rst   ;
wire        nxt_rcc_ahb1rstr_dma1rst   ;
wire        rcc_ahb1rstr_dma1rst_en    ;
// rcc_ahb2rstr
wire [31:0] rcc_ahb2rstr_read         ;
wire        rcc_ahb2rstr_sel          ;
wire        cur_rcc_ahb2rstr_sdmmc2rst;
wire        nxt_rcc_ahb2rstr_sdmmc2rst;
wire        rcc_ahb2rstr_sdmmc2rst_en ;
wire        cur_rcc_ahb2rstr_rngrst   ;
wire        nxt_rcc_ahb2rstr_rngrst   ;
wire        rcc_ahb2rstr_rngrst_en    ;
wire        cur_rcc_ahb2rstr_hashrst  ;
wire        nxt_rcc_ahb2rstr_hashrst  ;
wire        rcc_ahb2rstr_hashrst_en   ;
wire        cur_rcc_ahb2rstr_cryptrst ;
wire        nxt_rcc_ahb2rstr_cryptrst ;
wire        rcc_ahb2rstr_cryptrst_en  ;
wire        cur_rcc_ahb2rstr_dcmirst  ;
wire        nxt_rcc_ahb2rstr_dcmirst  ;
wire        rcc_ahb2rstr_dcmirst_en   ;
// rcc_ahb4rstr
wire [31:0] rcc_ahb4rstr_read        ;
wire        rcc_ahb4rstr_sel         ;
wire        cur_rcc_ahb4rstr_hsemrst ;
wire        nxt_rcc_ahb4rstr_hsemrst ;
wire        rcc_ahb4rstr_hsemrst_en  ;
wire        cur_rcc_ahb4rstr_adc3rst ;
wire        nxt_rcc_ahb4rstr_adc3rst ;
wire        rcc_ahb4rstr_adc3rst_en  ;
wire        cur_rcc_ahb4rstr_bdmarst ;
wire        nxt_rcc_ahb4rstr_bdmarst ;
wire        rcc_ahb4rstr_bdmarst_en  ;
wire        cur_rcc_ahb4rstr_crcrst  ;
wire        nxt_rcc_ahb4rstr_crcrst  ;
wire        rcc_ahb4rstr_crcrst_en   ;
wire        cur_rcc_ahb4rstr_gpiokrst;
wire        nxt_rcc_ahb4rstr_gpiokrst;
wire        rcc_ahb4rstr_gpiokrst_en ;
wire        cur_rcc_ahb4rstr_gpiojrst;
wire        nxt_rcc_ahb4rstr_gpiojrst;
wire        rcc_ahb4rstr_gpiojrst_en ;
wire        cur_rcc_ahb4rstr_gpioirst;
wire        nxt_rcc_ahb4rstr_gpioirst;
wire        rcc_ahb4rstr_gpioirst_en ;
wire        cur_rcc_ahb4rstr_gpiohrst;
wire        nxt_rcc_ahb4rstr_gpiohrst;
wire        rcc_ahb4rstr_gpiohrst_en ;
wire        cur_rcc_ahb4rstr_gpiogrst;
wire        nxt_rcc_ahb4rstr_gpiogrst;
wire        rcc_ahb4rstr_gpiogrst_en ;
wire        cur_rcc_ahb4rstr_gpiofrst;
wire        nxt_rcc_ahb4rstr_gpiofrst;
wire        rcc_ahb4rstr_gpiofrst_en ;
wire        cur_rcc_ahb4rstr_gpioerst;
wire        nxt_rcc_ahb4rstr_gpioerst;
wire        rcc_ahb4rstr_gpioerst_en ;
wire        cur_rcc_ahb4rstr_gpiodrst;
wire        nxt_rcc_ahb4rstr_gpiodrst;
wire        rcc_ahb4rstr_gpiodrst_en ;
wire        cur_rcc_ahb4rstr_gpiocrst;
wire        nxt_rcc_ahb4rstr_gpiocrst;
wire        rcc_ahb4rstr_gpiocrst_en ;
wire        cur_rcc_ahb4rstr_gpiobrst;
wire        nxt_rcc_ahb4rstr_gpiobrst;
wire        rcc_ahb4rstr_gpiobrst_en ;
wire        cur_rcc_ahb4rstr_gpioarst;
wire        nxt_rcc_ahb4rstr_gpioarst;
wire        rcc_ahb4rstr_gpioarst_en ;
// rcc_apb3rstr
wire [31:0] rcc_apb3rstr_read       ;
wire        rcc_apb3rstr_sel        ;
wire        cur_rcc_apb3rstr_ltdcrst;
wire        nxt_rcc_apb3rstr_ltdcrst;
wire        rcc_apb3rstr_ltdcrst_en ;
// rcc_apb1lrstr
wire [31:0] rcc_apb1lrstr_read          ;
wire        rcc_apb1lrstr_sel           ;
wire        cur_rcc_apb1lrstr_uart8rst  ;
wire        nxt_rcc_apb1lrstr_uart8rst  ;
wire        rcc_apb1lrstr_uart8rst_en   ;
wire        cur_rcc_apb1lrstr_uart7rst  ;
wire        nxt_rcc_apb1lrstr_uart7rst  ;
wire        rcc_apb1lrstr_uart7rst_en   ;
wire        cur_rcc_apb1lrstr_dac12rst  ;
wire        nxt_rcc_apb1lrstr_dac12rst  ;
wire        rcc_apb1lrstr_dac12rst_en   ;
wire        cur_rcc_apb1lrstr_hdmicecrst;
wire        nxt_rcc_apb1lrstr_hdmicecrst;
wire        rcc_apb1lrstr_hdmicecrst_en ;
wire        cur_rcc_apb1lrstr_i2c3rst   ;
wire        nxt_rcc_apb1lrstr_i2c3rst   ;
wire        rcc_apb1lrstr_i2c3rst_en    ;
wire        cur_rcc_apb1lrstr_i2c2rst   ;
wire        nxt_rcc_apb1lrstr_i2c2rst   ;
wire        rcc_apb1lrstr_i2c2rst_en    ;
wire        cur_rcc_apb1lrstr_i2c1rst   ;
wire        nxt_rcc_apb1lrstr_i2c1rst   ;
wire        rcc_apb1lrstr_i2c1rst_en    ;
wire        cur_rcc_apb1lrstr_uart5rst  ;
wire        nxt_rcc_apb1lrstr_uart5rst  ;
wire        rcc_apb1lrstr_uart5rst_en   ;
wire        cur_rcc_apb1lrstr_uart4rst  ;
wire        nxt_rcc_apb1lrstr_uart4rst  ;
wire        rcc_apb1lrstr_uart4rst_en   ;
wire        cur_rcc_apb1lrstr_usart3rst ;
wire        nxt_rcc_apb1lrstr_usart3rst ;
wire        rcc_apb1lrstr_usart3rst_en  ;
wire        cur_rcc_apb1lrstr_usart2rst ;
wire        nxt_rcc_apb1lrstr_usart2rst ;
wire        rcc_apb1lrstr_usart2rst_en  ;
wire        cur_rcc_apb1lrstr_spdifrxrst;
wire        nxt_rcc_apb1lrstr_spdifrxrst;
wire        rcc_apb1lrstr_spdifrxrst_en ;
wire        cur_rcc_apb1lrstr_spi3rst   ;
wire        nxt_rcc_apb1lrstr_spi3rst   ;
wire        rcc_apb1lrstr_spi3rst_en    ;
wire        cur_rcc_apb1lrstr_spi2rst   ;
wire        nxt_rcc_apb1lrstr_spi2rst   ;
wire        rcc_apb1lrstr_spi2rst_en    ;
wire        cur_rcc_apb1lrstr_lptim1rst ;
wire        nxt_rcc_apb1lrstr_lptim1rst ;
wire        rcc_apb1lrstr_lptim1rst_en  ;
wire        cur_rcc_apb1lrstr_tim14rst  ;
wire        nxt_rcc_apb1lrstr_tim14rst  ;
wire        rcc_apb1lrstr_tim14rst_en   ;
wire        cur_rcc_apb1lrstr_tim13rst  ;
wire        nxt_rcc_apb1lrstr_tim13rst  ;
wire        rcc_apb1lrstr_tim13rst_en   ;
wire        cur_rcc_apb1lrstr_tim12rst  ;
wire        nxt_rcc_apb1lrstr_tim12rst  ;
wire        rcc_apb1lrstr_tim12rst_en   ;
wire        cur_rcc_apb1lrstr_tim7rst   ;
wire        nxt_rcc_apb1lrstr_tim7rst   ;
wire        rcc_apb1lrstr_tim7rst_en    ;
wire        cur_rcc_apb1lrstr_tim6rst   ;
wire        nxt_rcc_apb1lrstr_tim6rst   ;
wire        rcc_apb1lrstr_tim6rst_en    ;
wire        cur_rcc_apb1lrstr_tim5rst   ;
wire        nxt_rcc_apb1lrstr_tim5rst   ;
wire        rcc_apb1lrstr_tim5rst_en    ;
wire        cur_rcc_apb1lrstr_tim4rst   ;
wire        nxt_rcc_apb1lrstr_tim4rst   ;
wire        rcc_apb1lrstr_tim4rst_en    ;
wire        cur_rcc_apb1lrstr_tim3rst   ;
wire        nxt_rcc_apb1lrstr_tim3rst   ;
wire        rcc_apb1lrstr_tim3rst_en    ;
wire        cur_rcc_apb1lrstr_tim2rst   ;
wire        nxt_rcc_apb1lrstr_tim2rst   ;
wire        rcc_apb1lrstr_tim2rst_en    ;
// rcc_apb1hrstr
wire [31:0] rcc_apb1hrstr_read        ;
wire        rcc_apb1hrstr_sel         ;
wire        cur_rcc_apb1hrstr_fdcanrst;
wire        nxt_rcc_apb1hrstr_fdcanrst;
wire        rcc_apb1hrstr_fdcanrst_en ;
wire        cur_rcc_apb1hrstr_mdiosrst;
wire        nxt_rcc_apb1hrstr_mdiosrst;
wire        rcc_apb1hrstr_mdiosrst_en ;
wire        cur_rcc_apb1hrstr_opamprst;
wire        nxt_rcc_apb1hrstr_opamprst;
wire        rcc_apb1hrstr_opamprst_en ;
wire        cur_rcc_apb1hrstr_swprst  ;
wire        nxt_rcc_apb1hrstr_swprst  ;
wire        rcc_apb1hrstr_swprst_en   ;
wire        cur_rcc_apb1hrstr_crsrst  ;
wire        nxt_rcc_apb1hrstr_crsrst  ;
wire        rcc_apb1hrstr_crsrst_en   ;
// rcc_apb2rstr
wire [31:0] rcc_apb2rstr_read         ;
wire        rcc_apb2rstr_sel          ;
wire        cur_rcc_apb2rstr_hrtimrst ;
wire        nxt_rcc_apb2rstr_hrtimrst ;
wire        rcc_apb2rstr_hrtimrst_en  ;
wire        cur_rcc_apb2rstr_dfsdm1rst;
wire        nxt_rcc_apb2rstr_dfsdm1rst;
wire        rcc_apb2rstr_dfsdm1rst_en ;
wire        cur_rcc_apb2rstr_sai3rst  ;
wire        nxt_rcc_apb2rstr_sai3rst  ;
wire        rcc_apb2rstr_sai3rst_en   ;
wire        cur_rcc_apb2rstr_sai2rst  ;
wire        nxt_rcc_apb2rstr_sai2rst  ;
wire        rcc_apb2rstr_sai2rst_en   ;
wire        cur_rcc_apb2rstr_sai1rst  ;
wire        nxt_rcc_apb2rstr_sai1rst  ;
wire        rcc_apb2rstr_sai1rst_en   ;
wire        cur_rcc_apb2rstr_spi5rst  ;
wire        nxt_rcc_apb2rstr_spi5rst  ;
wire        rcc_apb2rstr_spi5rst_en   ;
wire        cur_rcc_apb2rstr_tim17rst ;
wire        nxt_rcc_apb2rstr_tim17rst ;
wire        rcc_apb2rstr_tim17rst_en  ;
wire        cur_rcc_apb2rstr_tim16rst ;
wire        nxt_rcc_apb2rstr_tim16rst ;
wire        rcc_apb2rstr_tim16rst_en  ;
wire        cur_rcc_apb2rstr_tim15rst ;
wire        nxt_rcc_apb2rstr_tim15rst ;
wire        rcc_apb2rstr_tim15rst_en  ;
wire        cur_rcc_apb2rstr_spi4rst  ;
wire        nxt_rcc_apb2rstr_spi4rst  ;
wire        rcc_apb2rstr_spi4rst_en   ;
wire        cur_rcc_apb2rstr_spi1rst  ;
wire        nxt_rcc_apb2rstr_spi1rst  ;
wire        rcc_apb2rstr_spi1rst_en   ;
wire        cur_rcc_apb2rstr_usart6rst;
wire        nxt_rcc_apb2rstr_usart6rst;
wire        rcc_apb2rstr_usart6rst_en ;
wire        cur_rcc_apb2rstr_usart1rst;
wire        nxt_rcc_apb2rstr_usart1rst;
wire        rcc_apb2rstr_usart1rst_en ;
wire        cur_rcc_apb2rstr_tim8rst  ;
wire        nxt_rcc_apb2rstr_tim8rst  ;
wire        rcc_apb2rstr_tim8rst_en   ;
wire        cur_rcc_apb2rstr_tim1rst  ;
wire        nxt_rcc_apb2rstr_tim1rst  ;
wire        rcc_apb2rstr_tim1rst_en   ;
// rcc_apb4rstr
wire [31:0] rcc_apb4rstr_read          ;
wire        rcc_apb4rstr_sel           ;
wire        cur_rcc_apb4rstr_sai4rst   ;
wire        nxt_rcc_apb4rstr_sai4rst   ;
wire        rcc_apb4rstr_sai4rst_en    ;
wire        cur_rcc_apb4rstr_vrefrst   ;
wire        nxt_rcc_apb4rstr_vrefrst   ;
wire        rcc_apb4rstr_vrefrst_en    ;
wire        cur_rcc_apb4rstr_comp12rst ;
wire        nxt_rcc_apb4rstr_comp12rst ;
wire        rcc_apb4rstr_comp12rst_en  ;
wire        cur_rcc_apb4rstr_lptim5rst ;
wire        nxt_rcc_apb4rstr_lptim5rst ;
wire        rcc_apb4rstr_lptim5rst_en  ;
wire        cur_rcc_apb4rstr_lptim4rst ;
wire        nxt_rcc_apb4rstr_lptim4rst ;
wire        rcc_apb4rstr_lptim4rst_en  ;
wire        cur_rcc_apb4rstr_lptim3rst ;
wire        nxt_rcc_apb4rstr_lptim3rst ;
wire        rcc_apb4rstr_lptim3rst_en  ;
wire        cur_rcc_apb4rstr_lptim2rst ;
wire        nxt_rcc_apb4rstr_lptim2rst ;
wire        rcc_apb4rstr_lptim2rst_en  ;
wire        cur_rcc_apb4rstr_i2c4rst   ;
wire        nxt_rcc_apb4rstr_i2c4rst   ;
wire        rcc_apb4rstr_i2c4rst_en    ;
wire        cur_rcc_apb4rstr_spi6rst   ;
wire        nxt_rcc_apb4rstr_spi6rst   ;
wire        rcc_apb4rstr_spi6rst_en    ;
wire        cur_rcc_apb4rstr_lpuart1rst;
wire        nxt_rcc_apb4rstr_lpuart1rst;
wire        rcc_apb4rstr_lpuart1rst_en ;
wire        cur_rcc_apb4rstr_syscfgrst ;
wire        nxt_rcc_apb4rstr_syscfgrst ;
wire        rcc_apb4rstr_syscfgrst_en  ;
// rcc_gcr
wire [31:0] rcc_gcr_read      ;
wire        rcc_gcr_sel       ;
wire        cur_rcc_gcr_ww2rsc;
wire        nxt_rcc_gcr_ww2rsc;
wire        rcc_gcr_ww2rsc_en ;
wire        cur_rcc_gcr_ww1rsc;
wire        nxt_rcc_gcr_ww1rsc;
wire        rcc_gcr_ww1rsc_en ;
// rcc_d3amr
wire [31:0] rcc_d3amr_read           ;
wire        rcc_d3amr_sel            ;
wire        cur_rcc_d3amr_sram4amen  ;
wire        nxt_rcc_d3amr_sram4amen  ;
wire        rcc_d3amr_sram4amen_en   ;
wire        cur_rcc_d3amr_bkpramamen ;
wire        nxt_rcc_d3amr_bkpramamen ;
wire        rcc_d3amr_bkpramamen_en  ;
wire        cur_rcc_d3amr_adc3amen   ;
wire        nxt_rcc_d3amr_adc3amen   ;
wire        rcc_d3amr_adc3amen_en    ;
wire        cur_rcc_d3amr_sai4amen   ;
wire        nxt_rcc_d3amr_sai4amen   ;
wire        rcc_d3amr_sai4amen_en    ;
wire        cur_rcc_d3amr_crcamen    ;
wire        nxt_rcc_d3amr_crcamen    ;
wire        rcc_d3amr_crcamen_en     ;
wire        cur_rcc_d3amr_rtcamen    ;
wire        nxt_rcc_d3amr_rtcamen    ;
wire        rcc_d3amr_rtcamen_en     ;
wire        cur_rcc_d3amr_vrefamen   ;
wire        nxt_rcc_d3amr_vrefamen   ;
wire        rcc_d3amr_vrefamen_en    ;
wire        cur_rcc_d3amr_comp12amen ;
wire        nxt_rcc_d3amr_comp12amen ;
wire        rcc_d3amr_comp12amen_en  ;
wire        cur_rcc_d3amr_lptim5amen ;
wire        nxt_rcc_d3amr_lptim5amen ;
wire        rcc_d3amr_lptim5amen_en  ;
wire        cur_rcc_d3amr_lptim4amen ;
wire        nxt_rcc_d3amr_lptim4amen ;
wire        rcc_d3amr_lptim4amen_en  ;
wire        cur_rcc_d3amr_lptim3amen ;
wire        nxt_rcc_d3amr_lptim3amen ;
wire        rcc_d3amr_lptim3amen_en  ;
wire        cur_rcc_d3amr_lptim2amen ;
wire        nxt_rcc_d3amr_lptim2amen ;
wire        rcc_d3amr_lptim2amen_en  ;
wire        cur_rcc_d3amr_i2c4amen   ;
wire        nxt_rcc_d3amr_i2c4amen   ;
wire        rcc_d3amr_i2c4amen_en    ;
wire        cur_rcc_d3amr_spi6amen   ;
wire        nxt_rcc_d3amr_spi6amen   ;
wire        rcc_d3amr_spi6amen_en    ;
wire        cur_rcc_d3amr_lpuart1amen;
wire        nxt_rcc_d3amr_lpuart1amen;
wire        rcc_d3amr_lpuart1amen_en ;
wire        cur_rcc_d3amr_bdmaamen   ;
wire        nxt_rcc_d3amr_bdmaamen   ;
wire        rcc_d3amr_bdmaamen_en    ;
// rcc_c1_rsr
wire [31:0] rcc_c1_rsr_read         ;
wire        rcc_c1_rsr_sel          ;
wire        cur_rcc_c1_rsr_lpwr2rstf;
wire        nxt_rcc_c1_rsr_lpwr2rstf;
wire        rcc_c1_rsr_lpwr2rstf_en ;
wire        rcc_c1_rsr_lpwr2rstf_clr;
wire        rcc_c1_rsr_lpwr2rstf_set;
wire        cur_rcc_c1_rsr_lpwr1rstf;
wire        nxt_rcc_c1_rsr_lpwr1rstf;
wire        rcc_c1_rsr_lpwr1rstf_en ;
wire        rcc_c1_rsr_lpwr1rstf_clr;
wire        rcc_c1_rsr_lpwr1rstf_set;
wire        cur_rcc_c1_rsr_wwdg2rstf;
wire        nxt_rcc_c1_rsr_wwdg2rstf;
wire        rcc_c1_rsr_wwdg2rstf_en ;
wire        rcc_c1_rsr_wwdg2rstf_clr;
wire        rcc_c1_rsr_wwdg2rstf_set;
wire        cur_rcc_c1_rsr_wwdg1rstf;
wire        nxt_rcc_c1_rsr_wwdg1rstf;
wire        rcc_c1_rsr_wwdg1rstf_en ;
wire        rcc_c1_rsr_wwdg1rstf_clr;
wire        rcc_c1_rsr_wwdg1rstf_set;
wire        cur_rcc_c1_rsr_iwdg2rstf;
wire        nxt_rcc_c1_rsr_iwdg2rstf;
wire        rcc_c1_rsr_iwdg2rstf_en ;
wire        rcc_c1_rsr_iwdg2rstf_clr;
wire        rcc_c1_rsr_iwdg2rstf_set;
wire        cur_rcc_c1_rsr_iwdg1rstf;
wire        nxt_rcc_c1_rsr_iwdg1rstf;
wire        rcc_c1_rsr_iwdg1rstf_en ;
wire        rcc_c1_rsr_iwdg1rstf_clr;
wire        rcc_c1_rsr_iwdg1rstf_set;
wire        cur_rcc_c1_rsr_sft2rstf ;
wire        nxt_rcc_c1_rsr_sft2rstf ;
wire        rcc_c1_rsr_sft2rstf_en  ;
wire        rcc_c1_rsr_sft2rstf_clr ;
wire        rcc_c1_rsr_sft2rstf_set ;
wire        cur_rcc_c1_rsr_sft1rstf ;
wire        nxt_rcc_c1_rsr_sft1rstf ;
wire        rcc_c1_rsr_sft1rstf_en  ;
wire        rcc_c1_rsr_sft1rstf_clr ;
wire        rcc_c1_rsr_sft1rstf_set ;
wire        cur_rcc_c1_rsr_porrstf  ;
wire        nxt_rcc_c1_rsr_porrstf  ;
wire        rcc_c1_rsr_porrstf_en   ;
wire        rcc_c1_rsr_porrstf_clr  ;
wire        rcc_c1_rsr_porrstf_set  ;
wire        cur_rcc_c1_rsr_pinrstf  ;
wire        nxt_rcc_c1_rsr_pinrstf  ;
wire        rcc_c1_rsr_pinrstf_en   ;
wire        rcc_c1_rsr_pinrstf_clr  ;
wire        rcc_c1_rsr_pinrstf_set  ;
wire        cur_rcc_c1_rsr_borrstf  ;
wire        nxt_rcc_c1_rsr_borrstf  ;
wire        rcc_c1_rsr_borrstf_en   ;
wire        rcc_c1_rsr_borrstf_clr  ;
wire        rcc_c1_rsr_borrstf_set  ;
wire        cur_rcc_c1_rsr_d2rstf   ;
wire        nxt_rcc_c1_rsr_d2rstf   ;
wire        rcc_c1_rsr_d2rstf_en    ;
wire        rcc_c1_rsr_d2rstf_clr   ;
wire        rcc_c1_rsr_d2rstf_set   ;
wire        cur_rcc_c1_rsr_d1rstf   ;
wire        nxt_rcc_c1_rsr_d1rstf   ;
wire        rcc_c1_rsr_d1rstf_en    ;
wire        rcc_c1_rsr_d1rstf_clr   ;
wire        rcc_c1_rsr_d1rstf_set   ;
wire        cur_rcc_c1_rsr_oblrstf  ;
wire        nxt_rcc_c1_rsr_oblrstf  ;
wire        rcc_c1_rsr_oblrstf_en   ;
wire        rcc_c1_rsr_oblrstf_clr  ;
wire        rcc_c1_rsr_oblrstf_set  ;
wire        cur_rcc_c1_rsr_rmvf     ;
wire        nxt_rcc_c1_rsr_rmvf     ;
wire        rcc_c1_rsr_rmvf_en      ;
// rcc_c1_ahb3enr
wire [31:0] rcc_c1_ahb3enr_read         ;
wire        rcc_c1_ahb3enr_sel          ;
wire        cur_rcc_c1_ahb3enr_axisramen;
wire        nxt_rcc_c1_ahb3enr_axisramen;
wire        rcc_c1_ahb3enr_axisramen_en ;
wire        cur_rcc_c1_ahb3enr_itcmen   ;
wire        nxt_rcc_c1_ahb3enr_itcmen   ;
wire        rcc_c1_ahb3enr_itcmen_en    ;
wire        cur_rcc_c1_ahb3enr_dtcm2en  ;
wire        nxt_rcc_c1_ahb3enr_dtcm2en  ;
wire        rcc_c1_ahb3enr_dtcm2en_en   ;
wire        cur_rcc_c1_ahb3enr_dtcm1en  ;
wire        nxt_rcc_c1_ahb3enr_dtcm1en  ;
wire        rcc_c1_ahb3enr_dtcm1en_en   ;
wire        cur_rcc_c1_ahb3enr_sdmmc1en ;
wire        nxt_rcc_c1_ahb3enr_sdmmc1en ;
wire        rcc_c1_ahb3enr_sdmmc1en_en  ;
wire        cur_rcc_c1_ahb3enr_qspien   ;
wire        nxt_rcc_c1_ahb3enr_qspien   ;
wire        rcc_c1_ahb3enr_qspien_en    ;
wire        cur_rcc_c1_ahb3enr_fmcen    ;
wire        nxt_rcc_c1_ahb3enr_fmcen    ;
wire        rcc_c1_ahb3enr_fmcen_en     ;
wire        cur_rcc_c1_ahb3enr_flitfen  ;
wire        nxt_rcc_c1_ahb3enr_flitfen  ;
wire        rcc_c1_ahb3enr_flitfen_en   ;
wire        cur_rcc_c1_ahb3enr_jpgdecen ;
wire        nxt_rcc_c1_ahb3enr_jpgdecen ;
wire        rcc_c1_ahb3enr_jpgdecen_en  ;
wire        cur_rcc_c1_ahb3enr_dma2den  ;
wire        nxt_rcc_c1_ahb3enr_dma2den  ;
wire        rcc_c1_ahb3enr_dma2den_en   ;
wire        cur_rcc_c1_ahb3enr_mdmaen   ;
wire        nxt_rcc_c1_ahb3enr_mdmaen   ;
wire        rcc_c1_ahb3enr_mdmaen_en    ;
// rcc_c1_ahb1enr
wire [31:0] rcc_c1_ahb1enr_read          ;
wire        rcc_c1_ahb1enr_sel           ;
wire        cur_rcc_c1_ahb1enr_usb2ulpien;
wire        nxt_rcc_c1_ahb1enr_usb2ulpien;
wire        rcc_c1_ahb1enr_usb2ulpien_en ;
wire        cur_rcc_c1_ahb1enr_usb2otgen ;
wire        nxt_rcc_c1_ahb1enr_usb2otgen ;
wire        rcc_c1_ahb1enr_usb2otgen_en  ;
wire        cur_rcc_c1_ahb1enr_usb1ulpien;
wire        nxt_rcc_c1_ahb1enr_usb1ulpien;
wire        rcc_c1_ahb1enr_usb1ulpien_en ;
wire        cur_rcc_c1_ahb1enr_usb1otgen ;
wire        nxt_rcc_c1_ahb1enr_usb1otgen ;
wire        rcc_c1_ahb1enr_usb1otgen_en  ;
wire        cur_rcc_c1_ahb1enr_eth1rxen  ;
wire        nxt_rcc_c1_ahb1enr_eth1rxen  ;
wire        rcc_c1_ahb1enr_eth1rxen_en   ;
wire        cur_rcc_c1_ahb1enr_eth1txen  ;
wire        nxt_rcc_c1_ahb1enr_eth1txen  ;
wire        rcc_c1_ahb1enr_eth1txen_en   ;
wire        cur_rcc_c1_ahb1enr_eth1macen ;
wire        nxt_rcc_c1_ahb1enr_eth1macen ;
wire        rcc_c1_ahb1enr_eth1macen_en  ;
wire        cur_rcc_c1_ahb1enr_adc12en   ;
wire        nxt_rcc_c1_ahb1enr_adc12en   ;
wire        rcc_c1_ahb1enr_adc12en_en    ;
wire        cur_rcc_c1_ahb1enr_dma2en    ;
wire        nxt_rcc_c1_ahb1enr_dma2en    ;
wire        rcc_c1_ahb1enr_dma2en_en     ;
wire        cur_rcc_c1_ahb1enr_dma1en    ;
wire        nxt_rcc_c1_ahb1enr_dma1en    ;
wire        rcc_c1_ahb1enr_dma1en_en     ;
// rcc_c1_ahb2enr
wire [31:0] rcc_c1_ahb2enr_read        ;
wire        rcc_c1_ahb2enr_sel         ;
wire        cur_rcc_c1_ahb2enr_sram3en ;
wire        nxt_rcc_c1_ahb2enr_sram3en ;
wire        rcc_c1_ahb2enr_sram3en_en  ;
wire        cur_rcc_c1_ahb2enr_sram2en ;
wire        nxt_rcc_c1_ahb2enr_sram2en ;
wire        rcc_c1_ahb2enr_sram2en_en  ;
wire        cur_rcc_c1_ahb2enr_sram1en ;
wire        nxt_rcc_c1_ahb2enr_sram1en ;
wire        rcc_c1_ahb2enr_sram1en_en  ;
wire        cur_rcc_c1_ahb2enr_sdmmc2en;
wire        nxt_rcc_c1_ahb2enr_sdmmc2en;
wire        rcc_c1_ahb2enr_sdmmc2en_en ;
wire        cur_rcc_c1_ahb2enr_rngen   ;
wire        nxt_rcc_c1_ahb2enr_rngen   ;
wire        rcc_c1_ahb2enr_rngen_en    ;
wire        cur_rcc_c1_ahb2enr_hashen  ;
wire        nxt_rcc_c1_ahb2enr_hashen  ;
wire        rcc_c1_ahb2enr_hashen_en   ;
wire        cur_rcc_c1_ahb2enr_crypten ;
wire        nxt_rcc_c1_ahb2enr_crypten ;
wire        rcc_c1_ahb2enr_crypten_en  ;
wire        cur_rcc_c1_ahb2enr_dcmien  ;
wire        nxt_rcc_c1_ahb2enr_dcmien  ;
wire        rcc_c1_ahb2enr_dcmien_en   ;
// rcc_c1_ahb4enr
wire [31:0] rcc_c1_ahb4enr_read        ;
wire        rcc_c1_ahb4enr_sel         ;
wire        cur_rcc_c1_ahb4enr_bkpramen;
wire        nxt_rcc_c1_ahb4enr_bkpramen;
wire        rcc_c1_ahb4enr_bkpramen_en ;
wire        cur_rcc_c1_ahb4enr_hsemen  ;
wire        nxt_rcc_c1_ahb4enr_hsemen  ;
wire        rcc_c1_ahb4enr_hsemen_en   ;
wire        cur_rcc_c1_ahb4enr_adc3en  ;
wire        nxt_rcc_c1_ahb4enr_adc3en  ;
wire        rcc_c1_ahb4enr_adc3en_en   ;
wire        cur_rcc_c1_ahb4enr_bdmaen  ;
wire        nxt_rcc_c1_ahb4enr_bdmaen  ;
wire        rcc_c1_ahb4enr_bdmaen_en   ;
wire        cur_rcc_c1_ahb4enr_crcen   ;
wire        nxt_rcc_c1_ahb4enr_crcen   ;
wire        rcc_c1_ahb4enr_crcen_en    ;
wire        cur_rcc_c1_ahb4enr_gpioken ;
wire        nxt_rcc_c1_ahb4enr_gpioken ;
wire        rcc_c1_ahb4enr_gpioken_en  ;
wire        cur_rcc_c1_ahb4enr_gpiojen ;
wire        nxt_rcc_c1_ahb4enr_gpiojen ;
wire        rcc_c1_ahb4enr_gpiojen_en  ;
wire        cur_rcc_c1_ahb4enr_gpioien ;
wire        nxt_rcc_c1_ahb4enr_gpioien ;
wire        rcc_c1_ahb4enr_gpioien_en  ;
wire        cur_rcc_c1_ahb4enr_gpiohen ;
wire        nxt_rcc_c1_ahb4enr_gpiohen ;
wire        rcc_c1_ahb4enr_gpiohen_en  ;
wire        cur_rcc_c1_ahb4enr_gpiogen ;
wire        nxt_rcc_c1_ahb4enr_gpiogen ;
wire        rcc_c1_ahb4enr_gpiogen_en  ;
wire        cur_rcc_c1_ahb4enr_gpiofen ;
wire        nxt_rcc_c1_ahb4enr_gpiofen ;
wire        rcc_c1_ahb4enr_gpiofen_en  ;
wire        cur_rcc_c1_ahb4enr_gpioeen ;
wire        nxt_rcc_c1_ahb4enr_gpioeen ;
wire        rcc_c1_ahb4enr_gpioeen_en  ;
wire        cur_rcc_c1_ahb4enr_gpioden ;
wire        nxt_rcc_c1_ahb4enr_gpioden ;
wire        rcc_c1_ahb4enr_gpioden_en  ;
wire        cur_rcc_c1_ahb4enr_gpiocen ;
wire        nxt_rcc_c1_ahb4enr_gpiocen ;
wire        rcc_c1_ahb4enr_gpiocen_en  ;
wire        cur_rcc_c1_ahb4enr_gpioben ;
wire        nxt_rcc_c1_ahb4enr_gpioben ;
wire        rcc_c1_ahb4enr_gpioben_en  ;
wire        cur_rcc_c1_ahb4enr_gpioaen ;
wire        nxt_rcc_c1_ahb4enr_gpioaen ;
wire        rcc_c1_ahb4enr_gpioaen_en  ;
// rcc_c1_apb3enr
wire [31:0] rcc_c1_apb3enr_read       ;
wire        rcc_c1_apb3enr_sel        ;
wire        cur_rcc_c1_apb3enr_wwdg1en;
wire        nxt_rcc_c1_apb3enr_wwdg1en;
wire        rcc_c1_apb3enr_wwdg1en_en ;
wire        cur_rcc_c1_apb3enr_ltdcen ;
wire        nxt_rcc_c1_apb3enr_ltdcen ;
wire        rcc_c1_apb3enr_ltdcen_en  ;
// rcc_c1_apb1lenr
wire [31:0] rcc_c1_apb1lenr_read         ;
wire        rcc_c1_apb1lenr_sel          ;
wire        cur_rcc_c1_apb1lenr_uart8en  ;
wire        nxt_rcc_c1_apb1lenr_uart8en  ;
wire        rcc_c1_apb1lenr_uart8en_en   ;
wire        cur_rcc_c1_apb1lenr_uart7en  ;
wire        nxt_rcc_c1_apb1lenr_uart7en  ;
wire        rcc_c1_apb1lenr_uart7en_en   ;
wire        cur_rcc_c1_apb1lenr_dac12en  ;
wire        nxt_rcc_c1_apb1lenr_dac12en  ;
wire        rcc_c1_apb1lenr_dac12en_en   ;
wire        cur_rcc_c1_apb1lenr_hdmicecen;
wire        nxt_rcc_c1_apb1lenr_hdmicecen;
wire        rcc_c1_apb1lenr_hdmicecen_en ;
wire        cur_rcc_c1_apb1lenr_i2c3en   ;
wire        nxt_rcc_c1_apb1lenr_i2c3en   ;
wire        rcc_c1_apb1lenr_i2c3en_en    ;
wire        cur_rcc_c1_apb1lenr_i2c2en   ;
wire        nxt_rcc_c1_apb1lenr_i2c2en   ;
wire        rcc_c1_apb1lenr_i2c2en_en    ;
wire        cur_rcc_c1_apb1lenr_i2c1en   ;
wire        nxt_rcc_c1_apb1lenr_i2c1en   ;
wire        rcc_c1_apb1lenr_i2c1en_en    ;
wire        cur_rcc_c1_apb1lenr_uart5en  ;
wire        nxt_rcc_c1_apb1lenr_uart5en  ;
wire        rcc_c1_apb1lenr_uart5en_en   ;
wire        cur_rcc_c1_apb1lenr_uart4en  ;
wire        nxt_rcc_c1_apb1lenr_uart4en  ;
wire        rcc_c1_apb1lenr_uart4en_en   ;
wire        cur_rcc_c1_apb1lenr_usart3en ;
wire        nxt_rcc_c1_apb1lenr_usart3en ;
wire        rcc_c1_apb1lenr_usart3en_en  ;
wire        cur_rcc_c1_apb1lenr_usart2en ;
wire        nxt_rcc_c1_apb1lenr_usart2en ;
wire        rcc_c1_apb1lenr_usart2en_en  ;
wire        cur_rcc_c1_apb1lenr_spdifrxen;
wire        nxt_rcc_c1_apb1lenr_spdifrxen;
wire        rcc_c1_apb1lenr_spdifrxen_en ;
wire        cur_rcc_c1_apb1lenr_spi3en   ;
wire        nxt_rcc_c1_apb1lenr_spi3en   ;
wire        rcc_c1_apb1lenr_spi3en_en    ;
wire        cur_rcc_c1_apb1lenr_spi2en   ;
wire        nxt_rcc_c1_apb1lenr_spi2en   ;
wire        rcc_c1_apb1lenr_spi2en_en    ;
wire        cur_rcc_c1_apb1lenr_wwdg2en  ;
wire        nxt_rcc_c1_apb1lenr_wwdg2en  ;
wire        rcc_c1_apb1lenr_wwdg2en_en   ;
wire        cur_rcc_c1_apb1lenr_lptim1en ;
wire        nxt_rcc_c1_apb1lenr_lptim1en ;
wire        rcc_c1_apb1lenr_lptim1en_en  ;
wire        cur_rcc_c1_apb1lenr_tim14en  ;
wire        nxt_rcc_c1_apb1lenr_tim14en  ;
wire        rcc_c1_apb1lenr_tim14en_en   ;
wire        cur_rcc_c1_apb1lenr_tim13en  ;
wire        nxt_rcc_c1_apb1lenr_tim13en  ;
wire        rcc_c1_apb1lenr_tim13en_en   ;
wire        cur_rcc_c1_apb1lenr_tim12en  ;
wire        nxt_rcc_c1_apb1lenr_tim12en  ;
wire        rcc_c1_apb1lenr_tim12en_en   ;
wire        cur_rcc_c1_apb1lenr_tim7en   ;
wire        nxt_rcc_c1_apb1lenr_tim7en   ;
wire        rcc_c1_apb1lenr_tim7en_en    ;
wire        cur_rcc_c1_apb1lenr_tim6en   ;
wire        nxt_rcc_c1_apb1lenr_tim6en   ;
wire        rcc_c1_apb1lenr_tim6en_en    ;
wire        cur_rcc_c1_apb1lenr_tim5en   ;
wire        nxt_rcc_c1_apb1lenr_tim5en   ;
wire        rcc_c1_apb1lenr_tim5en_en    ;
wire        cur_rcc_c1_apb1lenr_tim4en   ;
wire        nxt_rcc_c1_apb1lenr_tim4en   ;
wire        rcc_c1_apb1lenr_tim4en_en    ;
wire        cur_rcc_c1_apb1lenr_tim3en   ;
wire        nxt_rcc_c1_apb1lenr_tim3en   ;
wire        rcc_c1_apb1lenr_tim3en_en    ;
wire        cur_rcc_c1_apb1lenr_tim2en   ;
wire        nxt_rcc_c1_apb1lenr_tim2en   ;
wire        rcc_c1_apb1lenr_tim2en_en    ;
// rcc_c1_apb1henr
wire [31:0] rcc_c1_apb1henr_read       ;
wire        rcc_c1_apb1henr_sel        ;
wire        cur_rcc_c1_apb1henr_fdcanen;
wire        nxt_rcc_c1_apb1henr_fdcanen;
wire        rcc_c1_apb1henr_fdcanen_en ;
wire        cur_rcc_c1_apb1henr_mdiosen;
wire        nxt_rcc_c1_apb1henr_mdiosen;
wire        rcc_c1_apb1henr_mdiosen_en ;
wire        cur_rcc_c1_apb1henr_opampen;
wire        nxt_rcc_c1_apb1henr_opampen;
wire        rcc_c1_apb1henr_opampen_en ;
wire        cur_rcc_c1_apb1henr_swpen  ;
wire        nxt_rcc_c1_apb1henr_swpen  ;
wire        rcc_c1_apb1henr_swpen_en   ;
wire        cur_rcc_c1_apb1henr_crsen  ;
wire        nxt_rcc_c1_apb1henr_crsen  ;
wire        rcc_c1_apb1henr_crsen_en   ;
// rcc_c1_apb2enr
wire [31:0] rcc_c1_apb2enr_read        ;
wire        rcc_c1_apb2enr_sel         ;
wire        cur_rcc_c1_apb2enr_hrtimen ;
wire        nxt_rcc_c1_apb2enr_hrtimen ;
wire        rcc_c1_apb2enr_hrtimen_en  ;
wire        cur_rcc_c1_apb2enr_dfsdm1en;
wire        nxt_rcc_c1_apb2enr_dfsdm1en;
wire        rcc_c1_apb2enr_dfsdm1en_en ;
wire        cur_rcc_c1_apb2enr_sai3en  ;
wire        nxt_rcc_c1_apb2enr_sai3en  ;
wire        rcc_c1_apb2enr_sai3en_en   ;
wire        cur_rcc_c1_apb2enr_sai2en  ;
wire        nxt_rcc_c1_apb2enr_sai2en  ;
wire        rcc_c1_apb2enr_sai2en_en   ;
wire        cur_rcc_c1_apb2enr_sai1en  ;
wire        nxt_rcc_c1_apb2enr_sai1en  ;
wire        rcc_c1_apb2enr_sai1en_en   ;
wire        cur_rcc_c1_apb2enr_spi5en  ;
wire        nxt_rcc_c1_apb2enr_spi5en  ;
wire        rcc_c1_apb2enr_spi5en_en   ;
wire        cur_rcc_c1_apb2enr_tim17en ;
wire        nxt_rcc_c1_apb2enr_tim17en ;
wire        rcc_c1_apb2enr_tim17en_en  ;
wire        cur_rcc_c1_apb2enr_tim16en ;
wire        nxt_rcc_c1_apb2enr_tim16en ;
wire        rcc_c1_apb2enr_tim16en_en  ;
wire        cur_rcc_c1_apb2enr_tim15en ;
wire        nxt_rcc_c1_apb2enr_tim15en ;
wire        rcc_c1_apb2enr_tim15en_en  ;
wire        cur_rcc_c1_apb2enr_spi4en  ;
wire        nxt_rcc_c1_apb2enr_spi4en  ;
wire        rcc_c1_apb2enr_spi4en_en   ;
wire        cur_rcc_c1_apb2enr_spi1en  ;
wire        nxt_rcc_c1_apb2enr_spi1en  ;
wire        rcc_c1_apb2enr_spi1en_en   ;
wire        cur_rcc_c1_apb2enr_usart6en;
wire        nxt_rcc_c1_apb2enr_usart6en;
wire        rcc_c1_apb2enr_usart6en_en ;
wire        cur_rcc_c1_apb2enr_usart1en;
wire        nxt_rcc_c1_apb2enr_usart1en;
wire        rcc_c1_apb2enr_usart1en_en ;
wire        cur_rcc_c1_apb2enr_tim8en  ;
wire        nxt_rcc_c1_apb2enr_tim8en  ;
wire        rcc_c1_apb2enr_tim8en_en   ;
wire        cur_rcc_c1_apb2enr_tim1en  ;
wire        nxt_rcc_c1_apb2enr_tim1en  ;
wire        rcc_c1_apb2enr_tim1en_en   ;
// rcc_c1_apb4enr
wire [31:0] rcc_c1_apb4enr_read         ;
wire        rcc_c1_apb4enr_sel          ;
wire        cur_rcc_c1_apb4enr_sai4en   ;
wire        nxt_rcc_c1_apb4enr_sai4en   ;
wire        rcc_c1_apb4enr_sai4en_en    ;
wire        cur_rcc_c1_apb4enr_rtcapben ;
wire        nxt_rcc_c1_apb4enr_rtcapben ;
wire        rcc_c1_apb4enr_rtcapben_en  ;
wire        cur_rcc_c1_apb4enr_vrefen   ;
wire        nxt_rcc_c1_apb4enr_vrefen   ;
wire        rcc_c1_apb4enr_vrefen_en    ;
wire        cur_rcc_c1_apb4enr_comp12en ;
wire        nxt_rcc_c1_apb4enr_comp12en ;
wire        rcc_c1_apb4enr_comp12en_en  ;
wire        cur_rcc_c1_apb4enr_lptim5en ;
wire        nxt_rcc_c1_apb4enr_lptim5en ;
wire        rcc_c1_apb4enr_lptim5en_en  ;
wire        cur_rcc_c1_apb4enr_lptim4en ;
wire        nxt_rcc_c1_apb4enr_lptim4en ;
wire        rcc_c1_apb4enr_lptim4en_en  ;
wire        cur_rcc_c1_apb4enr_lptim3en ;
wire        nxt_rcc_c1_apb4enr_lptim3en ;
wire        rcc_c1_apb4enr_lptim3en_en  ;
wire        cur_rcc_c1_apb4enr_lptim2en ;
wire        nxt_rcc_c1_apb4enr_lptim2en ;
wire        rcc_c1_apb4enr_lptim2en_en  ;
wire        cur_rcc_c1_apb4enr_i2c4en   ;
wire        nxt_rcc_c1_apb4enr_i2c4en   ;
wire        rcc_c1_apb4enr_i2c4en_en    ;
wire        cur_rcc_c1_apb4enr_spi6en   ;
wire        nxt_rcc_c1_apb4enr_spi6en   ;
wire        rcc_c1_apb4enr_spi6en_en    ;
wire        cur_rcc_c1_apb4enr_lpuart1en;
wire        nxt_rcc_c1_apb4enr_lpuart1en;
wire        rcc_c1_apb4enr_lpuart1en_en ;
wire        cur_rcc_c1_apb4enr_syscfgen ;
wire        nxt_rcc_c1_apb4enr_syscfgen ;
wire        rcc_c1_apb4enr_syscfgen_en  ;
// rcc_c1_ahb3lpenr
wire [31:0] rcc_c1_ahb3lpenr_read           ;
wire        rcc_c1_ahb3lpenr_sel            ;
wire        cur_rcc_c1_ahb3lpenr_axisramlpen;
wire        nxt_rcc_c1_ahb3lpenr_axisramlpen;
wire        rcc_c1_ahb3lpenr_axisramlpen_en ;
wire        cur_rcc_c1_ahb3lpenr_itcmlpen   ;
wire        nxt_rcc_c1_ahb3lpenr_itcmlpen   ;
wire        rcc_c1_ahb3lpenr_itcmlpen_en    ;
wire        cur_rcc_c1_ahb3lpenr_dtcm2lpen  ;
wire        nxt_rcc_c1_ahb3lpenr_dtcm2lpen  ;
wire        rcc_c1_ahb3lpenr_dtcm2lpen_en   ;
wire        cur_rcc_c1_ahb3lpenr_dtcm1lpen  ;
wire        nxt_rcc_c1_ahb3lpenr_dtcm1lpen  ;
wire        rcc_c1_ahb3lpenr_dtcm1lpen_en   ;
wire        cur_rcc_c1_ahb3lpenr_sdmmc1lpen ;
wire        nxt_rcc_c1_ahb3lpenr_sdmmc1lpen ;
wire        rcc_c1_ahb3lpenr_sdmmc1lpen_en  ;
wire        cur_rcc_c1_ahb3lpenr_qspilpen   ;
wire        nxt_rcc_c1_ahb3lpenr_qspilpen   ;
wire        rcc_c1_ahb3lpenr_qspilpen_en    ;
wire        cur_rcc_c1_ahb3lpenr_fmclpen    ;
wire        nxt_rcc_c1_ahb3lpenr_fmclpen    ;
wire        rcc_c1_ahb3lpenr_fmclpen_en     ;
wire        cur_rcc_c1_ahb3lpenr_flitflpen  ;
wire        nxt_rcc_c1_ahb3lpenr_flitflpen  ;
wire        rcc_c1_ahb3lpenr_flitflpen_en   ;
wire        cur_rcc_c1_ahb3lpenr_jpgdeclpen ;
wire        nxt_rcc_c1_ahb3lpenr_jpgdeclpen ;
wire        rcc_c1_ahb3lpenr_jpgdeclpen_en  ;
wire        cur_rcc_c1_ahb3lpenr_dma2dlpen  ;
wire        nxt_rcc_c1_ahb3lpenr_dma2dlpen  ;
wire        rcc_c1_ahb3lpenr_dma2dlpen_en   ;
wire        cur_rcc_c1_ahb3lpenr_mdmalpen   ;
wire        nxt_rcc_c1_ahb3lpenr_mdmalpen   ;
wire        rcc_c1_ahb3lpenr_mdmalpen_en    ;
// rcc_c1_ahb1lpenr
wire [31:0] rcc_c1_ahb1lpenr_read            ;
wire        rcc_c1_ahb1lpenr_sel             ;
wire        cur_rcc_c1_ahb1lpenr_usb2ulpilpen;
wire        nxt_rcc_c1_ahb1lpenr_usb2ulpilpen;
wire        rcc_c1_ahb1lpenr_usb2ulpilpen_en ;
wire        cur_rcc_c1_ahb1lpenr_usb2otglpen ;
wire        nxt_rcc_c1_ahb1lpenr_usb2otglpen ;
wire        rcc_c1_ahb1lpenr_usb2otglpen_en  ;
wire        cur_rcc_c1_ahb1lpenr_usb1ulpilpen;
wire        nxt_rcc_c1_ahb1lpenr_usb1ulpilpen;
wire        rcc_c1_ahb1lpenr_usb1ulpilpen_en ;
wire        cur_rcc_c1_ahb1lpenr_usb1otglpen ;
wire        nxt_rcc_c1_ahb1lpenr_usb1otglpen ;
wire        rcc_c1_ahb1lpenr_usb1otglpen_en  ;
wire        cur_rcc_c1_ahb1lpenr_eth1rxlpen  ;
wire        nxt_rcc_c1_ahb1lpenr_eth1rxlpen  ;
wire        rcc_c1_ahb1lpenr_eth1rxlpen_en   ;
wire        cur_rcc_c1_ahb1lpenr_eth1txlpen  ;
wire        nxt_rcc_c1_ahb1lpenr_eth1txlpen  ;
wire        rcc_c1_ahb1lpenr_eth1txlpen_en   ;
wire        cur_rcc_c1_ahb1lpenr_eth1maclpen ;
wire        nxt_rcc_c1_ahb1lpenr_eth1maclpen ;
wire        rcc_c1_ahb1lpenr_eth1maclpen_en  ;
wire        cur_rcc_c1_ahb1lpenr_adc12lpen   ;
wire        nxt_rcc_c1_ahb1lpenr_adc12lpen   ;
wire        rcc_c1_ahb1lpenr_adc12lpen_en    ;
wire        cur_rcc_c1_ahb1lpenr_dma2lpen    ;
wire        nxt_rcc_c1_ahb1lpenr_dma2lpen    ;
wire        rcc_c1_ahb1lpenr_dma2lpen_en     ;
wire        cur_rcc_c1_ahb1lpenr_dma1lpen    ;
wire        nxt_rcc_c1_ahb1lpenr_dma1lpen    ;
wire        rcc_c1_ahb1lpenr_dma1lpen_en     ;
// rcc_c1_ahb2lpenr
wire [31:0] rcc_c1_ahb2lpenr_read          ;
wire        rcc_c1_ahb2lpenr_sel           ;
wire        cur_rcc_c1_ahb2lpenr_sram3lpen ;
wire        nxt_rcc_c1_ahb2lpenr_sram3lpen ;
wire        rcc_c1_ahb2lpenr_sram3lpen_en  ;
wire        cur_rcc_c1_ahb2lpenr_sram2lpen ;
wire        nxt_rcc_c1_ahb2lpenr_sram2lpen ;
wire        rcc_c1_ahb2lpenr_sram2lpen_en  ;
wire        cur_rcc_c1_ahb2lpenr_sram1lpen ;
wire        nxt_rcc_c1_ahb2lpenr_sram1lpen ;
wire        rcc_c1_ahb2lpenr_sram1lpen_en  ;
wire        cur_rcc_c1_ahb2lpenr_sdmmc2lpen;
wire        nxt_rcc_c1_ahb2lpenr_sdmmc2lpen;
wire        rcc_c1_ahb2lpenr_sdmmc2lpen_en ;
wire        cur_rcc_c1_ahb2lpenr_rnglpen   ;
wire        nxt_rcc_c1_ahb2lpenr_rnglpen   ;
wire        rcc_c1_ahb2lpenr_rnglpen_en    ;
wire        cur_rcc_c1_ahb2lpenr_hashlpen  ;
wire        nxt_rcc_c1_ahb2lpenr_hashlpen  ;
wire        rcc_c1_ahb2lpenr_hashlpen_en   ;
wire        cur_rcc_c1_ahb2lpenr_cryptlpen ;
wire        nxt_rcc_c1_ahb2lpenr_cryptlpen ;
wire        rcc_c1_ahb2lpenr_cryptlpen_en  ;
wire        cur_rcc_c1_ahb2lpenr_dcmilpen  ;
wire        nxt_rcc_c1_ahb2lpenr_dcmilpen  ;
wire        rcc_c1_ahb2lpenr_dcmilpen_en   ;
// rcc_c1_ahb4lpenr
wire [31:0] rcc_c1_ahb4lpenr_read          ;
wire        rcc_c1_ahb4lpenr_sel           ;
wire        cur_rcc_c1_ahb4lpenr_sram4lpen ;
wire        nxt_rcc_c1_ahb4lpenr_sram4lpen ;
wire        rcc_c1_ahb4lpenr_sram4lpen_en  ;
wire        cur_rcc_c1_ahb4lpenr_bkpramlpen;
wire        nxt_rcc_c1_ahb4lpenr_bkpramlpen;
wire        rcc_c1_ahb4lpenr_bkpramlpen_en ;
wire        cur_rcc_c1_ahb4lpenr_adc3lpen  ;
wire        nxt_rcc_c1_ahb4lpenr_adc3lpen  ;
wire        rcc_c1_ahb4lpenr_adc3lpen_en   ;
wire        cur_rcc_c1_ahb4lpenr_bdmalpen  ;
wire        nxt_rcc_c1_ahb4lpenr_bdmalpen  ;
wire        rcc_c1_ahb4lpenr_bdmalpen_en   ;
wire        cur_rcc_c1_ahb4lpenr_crclpen   ;
wire        nxt_rcc_c1_ahb4lpenr_crclpen   ;
wire        rcc_c1_ahb4lpenr_crclpen_en    ;
wire        cur_rcc_c1_ahb4lpenr_gpioklpen ;
wire        nxt_rcc_c1_ahb4lpenr_gpioklpen ;
wire        rcc_c1_ahb4lpenr_gpioklpen_en  ;
wire        cur_rcc_c1_ahb4lpenr_gpiojlpen ;
wire        nxt_rcc_c1_ahb4lpenr_gpiojlpen ;
wire        rcc_c1_ahb4lpenr_gpiojlpen_en  ;
wire        cur_rcc_c1_ahb4lpenr_gpioilpen ;
wire        nxt_rcc_c1_ahb4lpenr_gpioilpen ;
wire        rcc_c1_ahb4lpenr_gpioilpen_en  ;
wire        cur_rcc_c1_ahb4lpenr_gpiohlpen ;
wire        nxt_rcc_c1_ahb4lpenr_gpiohlpen ;
wire        rcc_c1_ahb4lpenr_gpiohlpen_en  ;
wire        cur_rcc_c1_ahb4lpenr_gpioglpen ;
wire        nxt_rcc_c1_ahb4lpenr_gpioglpen ;
wire        rcc_c1_ahb4lpenr_gpioglpen_en  ;
wire        cur_rcc_c1_ahb4lpenr_gpioflpen ;
wire        nxt_rcc_c1_ahb4lpenr_gpioflpen ;
wire        rcc_c1_ahb4lpenr_gpioflpen_en  ;
wire        cur_rcc_c1_ahb4lpenr_gpioelpen ;
wire        nxt_rcc_c1_ahb4lpenr_gpioelpen ;
wire        rcc_c1_ahb4lpenr_gpioelpen_en  ;
wire        cur_rcc_c1_ahb4lpenr_gpiodlpen ;
wire        nxt_rcc_c1_ahb4lpenr_gpiodlpen ;
wire        rcc_c1_ahb4lpenr_gpiodlpen_en  ;
wire        cur_rcc_c1_ahb4lpenr_gpioclpen ;
wire        nxt_rcc_c1_ahb4lpenr_gpioclpen ;
wire        rcc_c1_ahb4lpenr_gpioclpen_en  ;
wire        cur_rcc_c1_ahb4lpenr_gpioblpen ;
wire        nxt_rcc_c1_ahb4lpenr_gpioblpen ;
wire        rcc_c1_ahb4lpenr_gpioblpen_en  ;
wire        cur_rcc_c1_ahb4lpenr_gpioalpen ;
wire        nxt_rcc_c1_ahb4lpenr_gpioalpen ;
wire        rcc_c1_ahb4lpenr_gpioalpen_en  ;
// rcc_c1_apb3lpenr
wire [31:0] rcc_c1_apb3lpenr_read         ;
wire        rcc_c1_apb3lpenr_sel          ;
wire        cur_rcc_c1_apb3lpenr_wwdg1lpen;
wire        nxt_rcc_c1_apb3lpenr_wwdg1lpen;
wire        rcc_c1_apb3lpenr_wwdg1lpen_en ;
wire        cur_rcc_c1_apb3lpenr_ltdclpen ;
wire        nxt_rcc_c1_apb3lpenr_ltdclpen ;
wire        rcc_c1_apb3lpenr_ltdclpen_en  ;
// rcc_c1_apb1llpenr
wire [31:0] rcc_c1_apb1llpenr_read           ;
wire        rcc_c1_apb1llpenr_sel            ;
wire        cur_rcc_c1_apb1llpenr_uart8lpen  ;
wire        nxt_rcc_c1_apb1llpenr_uart8lpen  ;
wire        rcc_c1_apb1llpenr_uart8lpen_en   ;
wire        cur_rcc_c1_apb1llpenr_uart7lpen  ;
wire        nxt_rcc_c1_apb1llpenr_uart7lpen  ;
wire        rcc_c1_apb1llpenr_uart7lpen_en   ;
wire        cur_rcc_c1_apb1llpenr_dac12lpen  ;
wire        nxt_rcc_c1_apb1llpenr_dac12lpen  ;
wire        rcc_c1_apb1llpenr_dac12lpen_en   ;
wire        cur_rcc_c1_apb1llpenr_hdmiceclpen;
wire        nxt_rcc_c1_apb1llpenr_hdmiceclpen;
wire        rcc_c1_apb1llpenr_hdmiceclpen_en ;
wire        cur_rcc_c1_apb1llpenr_i2c3lpen   ;
wire        nxt_rcc_c1_apb1llpenr_i2c3lpen   ;
wire        rcc_c1_apb1llpenr_i2c3lpen_en    ;
wire        cur_rcc_c1_apb1llpenr_i2c2lpen   ;
wire        nxt_rcc_c1_apb1llpenr_i2c2lpen   ;
wire        rcc_c1_apb1llpenr_i2c2lpen_en    ;
wire        cur_rcc_c1_apb1llpenr_i2c1lpen   ;
wire        nxt_rcc_c1_apb1llpenr_i2c1lpen   ;
wire        rcc_c1_apb1llpenr_i2c1lpen_en    ;
wire        cur_rcc_c1_apb1llpenr_uart5lpen  ;
wire        nxt_rcc_c1_apb1llpenr_uart5lpen  ;
wire        rcc_c1_apb1llpenr_uart5lpen_en   ;
wire        cur_rcc_c1_apb1llpenr_uart4lpen  ;
wire        nxt_rcc_c1_apb1llpenr_uart4lpen  ;
wire        rcc_c1_apb1llpenr_uart4lpen_en   ;
wire        cur_rcc_c1_apb1llpenr_usart3lpen ;
wire        nxt_rcc_c1_apb1llpenr_usart3lpen ;
wire        rcc_c1_apb1llpenr_usart3lpen_en  ;
wire        cur_rcc_c1_apb1llpenr_usart2lpen ;
wire        nxt_rcc_c1_apb1llpenr_usart2lpen ;
wire        rcc_c1_apb1llpenr_usart2lpen_en  ;
wire        cur_rcc_c1_apb1llpenr_spdifrxlpen;
wire        nxt_rcc_c1_apb1llpenr_spdifrxlpen;
wire        rcc_c1_apb1llpenr_spdifrxlpen_en ;
wire        cur_rcc_c1_apb1llpenr_spi3lpen   ;
wire        nxt_rcc_c1_apb1llpenr_spi3lpen   ;
wire        rcc_c1_apb1llpenr_spi3lpen_en    ;
wire        cur_rcc_c1_apb1llpenr_spi2lpen   ;
wire        nxt_rcc_c1_apb1llpenr_spi2lpen   ;
wire        rcc_c1_apb1llpenr_spi2lpen_en    ;
wire        cur_rcc_c1_apb1llpenr_wwdg2lpen  ;
wire        nxt_rcc_c1_apb1llpenr_wwdg2lpen  ;
wire        rcc_c1_apb1llpenr_wwdg2lpen_en   ;
wire        cur_rcc_c1_apb1llpenr_lptim1lpen ;
wire        nxt_rcc_c1_apb1llpenr_lptim1lpen ;
wire        rcc_c1_apb1llpenr_lptim1lpen_en  ;
wire        cur_rcc_c1_apb1llpenr_tim14lpen  ;
wire        nxt_rcc_c1_apb1llpenr_tim14lpen  ;
wire        rcc_c1_apb1llpenr_tim14lpen_en   ;
wire        cur_rcc_c1_apb1llpenr_tim13lpen  ;
wire        nxt_rcc_c1_apb1llpenr_tim13lpen  ;
wire        rcc_c1_apb1llpenr_tim13lpen_en   ;
wire        cur_rcc_c1_apb1llpenr_tim12lpen  ;
wire        nxt_rcc_c1_apb1llpenr_tim12lpen  ;
wire        rcc_c1_apb1llpenr_tim12lpen_en   ;
wire        cur_rcc_c1_apb1llpenr_tim7lpen   ;
wire        nxt_rcc_c1_apb1llpenr_tim7lpen   ;
wire        rcc_c1_apb1llpenr_tim7lpen_en    ;
wire        cur_rcc_c1_apb1llpenr_tim6lpen   ;
wire        nxt_rcc_c1_apb1llpenr_tim6lpen   ;
wire        rcc_c1_apb1llpenr_tim6lpen_en    ;
wire        cur_rcc_c1_apb1llpenr_tim5lpen   ;
wire        nxt_rcc_c1_apb1llpenr_tim5lpen   ;
wire        rcc_c1_apb1llpenr_tim5lpen_en    ;
wire        cur_rcc_c1_apb1llpenr_tim4lpen   ;
wire        nxt_rcc_c1_apb1llpenr_tim4lpen   ;
wire        rcc_c1_apb1llpenr_tim4lpen_en    ;
wire        cur_rcc_c1_apb1llpenr_tim3lpen   ;
wire        nxt_rcc_c1_apb1llpenr_tim3lpen   ;
wire        rcc_c1_apb1llpenr_tim3lpen_en    ;
wire        cur_rcc_c1_apb1llpenr_tim2lpen   ;
wire        nxt_rcc_c1_apb1llpenr_tim2lpen   ;
wire        rcc_c1_apb1llpenr_tim2lpen_en    ;
// rcc_c1_apb1hlpenr
wire [31:0] rcc_c1_apb1hlpenr_read         ;
wire        rcc_c1_apb1hlpenr_sel          ;
wire        cur_rcc_c1_apb1hlpenr_fdcanlpen;
wire        nxt_rcc_c1_apb1hlpenr_fdcanlpen;
wire        rcc_c1_apb1hlpenr_fdcanlpen_en ;
wire        cur_rcc_c1_apb1hlpenr_mdioslpen;
wire        nxt_rcc_c1_apb1hlpenr_mdioslpen;
wire        rcc_c1_apb1hlpenr_mdioslpen_en ;
wire        cur_rcc_c1_apb1hlpenr_opamplpen;
wire        nxt_rcc_c1_apb1hlpenr_opamplpen;
wire        rcc_c1_apb1hlpenr_opamplpen_en ;
wire        cur_rcc_c1_apb1hlpenr_swplpen  ;
wire        nxt_rcc_c1_apb1hlpenr_swplpen  ;
wire        rcc_c1_apb1hlpenr_swplpen_en   ;
wire        cur_rcc_c1_apb1hlpenr_crslpen  ;
wire        nxt_rcc_c1_apb1hlpenr_crslpen  ;
wire        rcc_c1_apb1hlpenr_crslpen_en   ;
// rcc_c1_apb2lpenr
wire [31:0] rcc_c1_apb2lpenr_read          ;
wire        rcc_c1_apb2lpenr_sel           ;
wire        cur_rcc_c1_apb2lpenr_hrtimlpen ;
wire        nxt_rcc_c1_apb2lpenr_hrtimlpen ;
wire        rcc_c1_apb2lpenr_hrtimlpen_en  ;
wire        cur_rcc_c1_apb2lpenr_dfsdm1lpen;
wire        nxt_rcc_c1_apb2lpenr_dfsdm1lpen;
wire        rcc_c1_apb2lpenr_dfsdm1lpen_en ;
wire        cur_rcc_c1_apb2lpenr_sai3lpen  ;
wire        nxt_rcc_c1_apb2lpenr_sai3lpen  ;
wire        rcc_c1_apb2lpenr_sai3lpen_en   ;
wire        cur_rcc_c1_apb2lpenr_sai2lpen  ;
wire        nxt_rcc_c1_apb2lpenr_sai2lpen  ;
wire        rcc_c1_apb2lpenr_sai2lpen_en   ;
wire        cur_rcc_c1_apb2lpenr_sai1lpen  ;
wire        nxt_rcc_c1_apb2lpenr_sai1lpen  ;
wire        rcc_c1_apb2lpenr_sai1lpen_en   ;
wire        cur_rcc_c1_apb2lpenr_spi5lpen  ;
wire        nxt_rcc_c1_apb2lpenr_spi5lpen  ;
wire        rcc_c1_apb2lpenr_spi5lpen_en   ;
wire        cur_rcc_c1_apb2lpenr_tim17lpen ;
wire        nxt_rcc_c1_apb2lpenr_tim17lpen ;
wire        rcc_c1_apb2lpenr_tim17lpen_en  ;
wire        cur_rcc_c1_apb2lpenr_tim16lpen ;
wire        nxt_rcc_c1_apb2lpenr_tim16lpen ;
wire        rcc_c1_apb2lpenr_tim16lpen_en  ;
wire        cur_rcc_c1_apb2lpenr_tim15lpen ;
wire        nxt_rcc_c1_apb2lpenr_tim15lpen ;
wire        rcc_c1_apb2lpenr_tim15lpen_en  ;
wire        cur_rcc_c1_apb2lpenr_spi4lpen  ;
wire        nxt_rcc_c1_apb2lpenr_spi4lpen  ;
wire        rcc_c1_apb2lpenr_spi4lpen_en   ;
wire        cur_rcc_c1_apb2lpenr_spi1lpen  ;
wire        nxt_rcc_c1_apb2lpenr_spi1lpen  ;
wire        rcc_c1_apb2lpenr_spi1lpen_en   ;
wire        cur_rcc_c1_apb2lpenr_usart6lpen;
wire        nxt_rcc_c1_apb2lpenr_usart6lpen;
wire        rcc_c1_apb2lpenr_usart6lpen_en ;
wire        cur_rcc_c1_apb2lpenr_usart1lpen;
wire        nxt_rcc_c1_apb2lpenr_usart1lpen;
wire        rcc_c1_apb2lpenr_usart1lpen_en ;
wire        cur_rcc_c1_apb2lpenr_tim8lpen  ;
wire        nxt_rcc_c1_apb2lpenr_tim8lpen  ;
wire        rcc_c1_apb2lpenr_tim8lpen_en   ;
wire        cur_rcc_c1_apb2lpenr_tim1lpen  ;
wire        nxt_rcc_c1_apb2lpenr_tim1lpen  ;
wire        rcc_c1_apb2lpenr_tim1lpen_en   ;
// rcc_c1_apb4lpenr
wire [31:0] rcc_c1_apb4lpenr_read           ;
wire        rcc_c1_apb4lpenr_sel            ;
wire        cur_rcc_c1_apb4lpenr_sai4lpen   ;
wire        nxt_rcc_c1_apb4lpenr_sai4lpen   ;
wire        rcc_c1_apb4lpenr_sai4lpen_en    ;
wire        cur_rcc_c1_apb4lpenr_rtcapblpen ;
wire        nxt_rcc_c1_apb4lpenr_rtcapblpen ;
wire        rcc_c1_apb4lpenr_rtcapblpen_en  ;
wire        cur_rcc_c1_apb4lpenr_vreflpen   ;
wire        nxt_rcc_c1_apb4lpenr_vreflpen   ;
wire        rcc_c1_apb4lpenr_vreflpen_en    ;
wire        cur_rcc_c1_apb4lpenr_comp12lpen ;
wire        nxt_rcc_c1_apb4lpenr_comp12lpen ;
wire        rcc_c1_apb4lpenr_comp12lpen_en  ;
wire        cur_rcc_c1_apb4lpenr_lptim5lpen ;
wire        nxt_rcc_c1_apb4lpenr_lptim5lpen ;
wire        rcc_c1_apb4lpenr_lptim5lpen_en  ;
wire        cur_rcc_c1_apb4lpenr_lptim4lpen ;
wire        nxt_rcc_c1_apb4lpenr_lptim4lpen ;
wire        rcc_c1_apb4lpenr_lptim4lpen_en  ;
wire        cur_rcc_c1_apb4lpenr_lptim3lpen ;
wire        nxt_rcc_c1_apb4lpenr_lptim3lpen ;
wire        rcc_c1_apb4lpenr_lptim3lpen_en  ;
wire        cur_rcc_c1_apb4lpenr_lptim2lpen ;
wire        nxt_rcc_c1_apb4lpenr_lptim2lpen ;
wire        rcc_c1_apb4lpenr_lptim2lpen_en  ;
wire        cur_rcc_c1_apb4lpenr_i2c4lpen   ;
wire        nxt_rcc_c1_apb4lpenr_i2c4lpen   ;
wire        rcc_c1_apb4lpenr_i2c4lpen_en    ;
wire        cur_rcc_c1_apb4lpenr_spi6lpen   ;
wire        nxt_rcc_c1_apb4lpenr_spi6lpen   ;
wire        rcc_c1_apb4lpenr_spi6lpen_en    ;
wire        cur_rcc_c1_apb4lpenr_lpuart1lpen;
wire        nxt_rcc_c1_apb4lpenr_lpuart1lpen;
wire        rcc_c1_apb4lpenr_lpuart1lpen_en ;
wire        cur_rcc_c1_apb4lpenr_syscfglpen ;
wire        nxt_rcc_c1_apb4lpenr_syscfglpen ;
wire        rcc_c1_apb4lpenr_syscfglpen_en  ;
// rcc_c2_ahb3enr
wire [31:0] rcc_c2_ahb3enr_read         ;
wire        rcc_c2_ahb3enr_sel          ;
wire        cur_rcc_c2_ahb3enr_axisramen;
wire        nxt_rcc_c2_ahb3enr_axisramen;
wire        rcc_c2_ahb3enr_axisramen_en ;
wire        cur_rcc_c2_ahb3enr_itcmen   ;
wire        nxt_rcc_c2_ahb3enr_itcmen   ;
wire        rcc_c2_ahb3enr_itcmen_en    ;
wire        cur_rcc_c2_ahb3enr_dtcm2en  ;
wire        nxt_rcc_c2_ahb3enr_dtcm2en  ;
wire        rcc_c2_ahb3enr_dtcm2en_en   ;
wire        cur_rcc_c2_ahb3enr_dtcm1en  ;
wire        nxt_rcc_c2_ahb3enr_dtcm1en  ;
wire        rcc_c2_ahb3enr_dtcm1en_en   ;
wire        cur_rcc_c2_ahb3enr_sdmmc1en ;
wire        nxt_rcc_c2_ahb3enr_sdmmc1en ;
wire        rcc_c2_ahb3enr_sdmmc1en_en  ;
wire        cur_rcc_c2_ahb3enr_qspien   ;
wire        nxt_rcc_c2_ahb3enr_qspien   ;
wire        rcc_c2_ahb3enr_qspien_en    ;
wire        cur_rcc_c2_ahb3enr_fmcen    ;
wire        nxt_rcc_c2_ahb3enr_fmcen    ;
wire        rcc_c2_ahb3enr_fmcen_en     ;
wire        cur_rcc_c2_ahb3enr_flitfen  ;
wire        nxt_rcc_c2_ahb3enr_flitfen  ;
wire        rcc_c2_ahb3enr_flitfen_en   ;
wire        cur_rcc_c2_ahb3enr_jpgdecen ;
wire        nxt_rcc_c2_ahb3enr_jpgdecen ;
wire        rcc_c2_ahb3enr_jpgdecen_en  ;
wire        cur_rcc_c2_ahb3enr_dma2den  ;
wire        nxt_rcc_c2_ahb3enr_dma2den  ;
wire        rcc_c2_ahb3enr_dma2den_en   ;
wire        cur_rcc_c2_ahb3enr_mdmaen   ;
wire        nxt_rcc_c2_ahb3enr_mdmaen   ;
wire        rcc_c2_ahb3enr_mdmaen_en    ;
// rcc_c2_ahb1enr
wire [31:0] rcc_c2_ahb1enr_read          ;
wire        rcc_c2_ahb1enr_sel           ;
wire        cur_rcc_c2_ahb1enr_usb2ulpien;
wire        nxt_rcc_c2_ahb1enr_usb2ulpien;
wire        rcc_c2_ahb1enr_usb2ulpien_en ;
wire        cur_rcc_c2_ahb1enr_usb2otgen ;
wire        nxt_rcc_c2_ahb1enr_usb2otgen ;
wire        rcc_c2_ahb1enr_usb2otgen_en  ;
wire        cur_rcc_c2_ahb1enr_usb1ulpien;
wire        nxt_rcc_c2_ahb1enr_usb1ulpien;
wire        rcc_c2_ahb1enr_usb1ulpien_en ;
wire        cur_rcc_c2_ahb1enr_usb1otgen ;
wire        nxt_rcc_c2_ahb1enr_usb1otgen ;
wire        rcc_c2_ahb1enr_usb1otgen_en  ;
wire        cur_rcc_c2_ahb1enr_eth1rxen  ;
wire        nxt_rcc_c2_ahb1enr_eth1rxen  ;
wire        rcc_c2_ahb1enr_eth1rxen_en   ;
wire        cur_rcc_c2_ahb1enr_eth1txen  ;
wire        nxt_rcc_c2_ahb1enr_eth1txen  ;
wire        rcc_c2_ahb1enr_eth1txen_en   ;
wire        cur_rcc_c2_ahb1enr_eth1macen ;
wire        nxt_rcc_c2_ahb1enr_eth1macen ;
wire        rcc_c2_ahb1enr_eth1macen_en  ;
wire        cur_rcc_c2_ahb1enr_adc12en   ;
wire        nxt_rcc_c2_ahb1enr_adc12en   ;
wire        rcc_c2_ahb1enr_adc12en_en    ;
wire        cur_rcc_c2_ahb1enr_dma2en    ;
wire        nxt_rcc_c2_ahb1enr_dma2en    ;
wire        rcc_c2_ahb1enr_dma2en_en     ;
wire        cur_rcc_c2_ahb1enr_dma1en    ;
wire        nxt_rcc_c2_ahb1enr_dma1en    ;
wire        rcc_c2_ahb1enr_dma1en_en     ;
// rcc_c2_ahb2enr
wire [31:0] rcc_c2_ahb2enr_read        ;
wire        rcc_c2_ahb2enr_sel         ;
wire        cur_rcc_c2_ahb2enr_sram3en ;
wire        nxt_rcc_c2_ahb2enr_sram3en ;
wire        rcc_c2_ahb2enr_sram3en_en  ;
wire        cur_rcc_c2_ahb2enr_sram2en ;
wire        nxt_rcc_c2_ahb2enr_sram2en ;
wire        rcc_c2_ahb2enr_sram2en_en  ;
wire        cur_rcc_c2_ahb2enr_sram1en ;
wire        nxt_rcc_c2_ahb2enr_sram1en ;
wire        rcc_c2_ahb2enr_sram1en_en  ;
wire        cur_rcc_c2_ahb2enr_sdmmc2en;
wire        nxt_rcc_c2_ahb2enr_sdmmc2en;
wire        rcc_c2_ahb2enr_sdmmc2en_en ;
wire        cur_rcc_c2_ahb2enr_rngen   ;
wire        nxt_rcc_c2_ahb2enr_rngen   ;
wire        rcc_c2_ahb2enr_rngen_en    ;
wire        cur_rcc_c2_ahb2enr_hashen  ;
wire        nxt_rcc_c2_ahb2enr_hashen  ;
wire        rcc_c2_ahb2enr_hashen_en   ;
wire        cur_rcc_c2_ahb2enr_crypten ;
wire        nxt_rcc_c2_ahb2enr_crypten ;
wire        rcc_c2_ahb2enr_crypten_en  ;
wire        cur_rcc_c2_ahb2enr_dcmien  ;
wire        nxt_rcc_c2_ahb2enr_dcmien  ;
wire        rcc_c2_ahb2enr_dcmien_en   ;
// rcc_c2_ahb4enr
wire [31:0] rcc_c2_ahb4enr_read        ;
wire        rcc_c2_ahb4enr_sel         ;
wire        cur_rcc_c2_ahb4enr_bkpramen;
wire        nxt_rcc_c2_ahb4enr_bkpramen;
wire        rcc_c2_ahb4enr_bkpramen_en ;
wire        cur_rcc_c2_ahb4enr_hsemen  ;
wire        nxt_rcc_c2_ahb4enr_hsemen  ;
wire        rcc_c2_ahb4enr_hsemen_en   ;
wire        cur_rcc_c2_ahb4enr_adc3en  ;
wire        nxt_rcc_c2_ahb4enr_adc3en  ;
wire        rcc_c2_ahb4enr_adc3en_en   ;
wire        cur_rcc_c2_ahb4enr_bdmaen  ;
wire        nxt_rcc_c2_ahb4enr_bdmaen  ;
wire        rcc_c2_ahb4enr_bdmaen_en   ;
wire        cur_rcc_c2_ahb4enr_crcen   ;
wire        nxt_rcc_c2_ahb4enr_crcen   ;
wire        rcc_c2_ahb4enr_crcen_en    ;
wire        cur_rcc_c2_ahb4enr_gpioken ;
wire        nxt_rcc_c2_ahb4enr_gpioken ;
wire        rcc_c2_ahb4enr_gpioken_en  ;
wire        cur_rcc_c2_ahb4enr_gpiojen ;
wire        nxt_rcc_c2_ahb4enr_gpiojen ;
wire        rcc_c2_ahb4enr_gpiojen_en  ;
wire        cur_rcc_c2_ahb4enr_gpioien ;
wire        nxt_rcc_c2_ahb4enr_gpioien ;
wire        rcc_c2_ahb4enr_gpioien_en  ;
wire        cur_rcc_c2_ahb4enr_gpiohen ;
wire        nxt_rcc_c2_ahb4enr_gpiohen ;
wire        rcc_c2_ahb4enr_gpiohen_en  ;
wire        cur_rcc_c2_ahb4enr_gpiogen ;
wire        nxt_rcc_c2_ahb4enr_gpiogen ;
wire        rcc_c2_ahb4enr_gpiogen_en  ;
wire        cur_rcc_c2_ahb4enr_gpiofen ;
wire        nxt_rcc_c2_ahb4enr_gpiofen ;
wire        rcc_c2_ahb4enr_gpiofen_en  ;
wire        cur_rcc_c2_ahb4enr_gpioeen ;
wire        nxt_rcc_c2_ahb4enr_gpioeen ;
wire        rcc_c2_ahb4enr_gpioeen_en  ;
wire        cur_rcc_c2_ahb4enr_gpioden ;
wire        nxt_rcc_c2_ahb4enr_gpioden ;
wire        rcc_c2_ahb4enr_gpioden_en  ;
wire        cur_rcc_c2_ahb4enr_gpiocen ;
wire        nxt_rcc_c2_ahb4enr_gpiocen ;
wire        rcc_c2_ahb4enr_gpiocen_en  ;
wire        cur_rcc_c2_ahb4enr_gpioben ;
wire        nxt_rcc_c2_ahb4enr_gpioben ;
wire        rcc_c2_ahb4enr_gpioben_en  ;
wire        cur_rcc_c2_ahb4enr_gpioaen ;
wire        nxt_rcc_c2_ahb4enr_gpioaen ;
wire        rcc_c2_ahb4enr_gpioaen_en  ;
// rcc_c2_apb3enr
wire [31:0] rcc_c2_apb3enr_read       ;
wire        rcc_c2_apb3enr_sel        ;
wire        cur_rcc_c2_apb3enr_wwdg1en;
wire        nxt_rcc_c2_apb3enr_wwdg1en;
wire        rcc_c2_apb3enr_wwdg1en_en ;
wire        cur_rcc_c2_apb3enr_ltdcen ;
wire        nxt_rcc_c2_apb3enr_ltdcen ;
wire        rcc_c2_apb3enr_ltdcen_en  ;
// rcc_c2_apb1lenr
wire [31:0] rcc_c2_apb1lenr_read         ;
wire        rcc_c2_apb1lenr_sel          ;
wire        cur_rcc_c2_apb1lenr_uart8en  ;
wire        nxt_rcc_c2_apb1lenr_uart8en  ;
wire        rcc_c2_apb1lenr_uart8en_en   ;
wire        cur_rcc_c2_apb1lenr_uart7en  ;
wire        nxt_rcc_c2_apb1lenr_uart7en  ;
wire        rcc_c2_apb1lenr_uart7en_en   ;
wire        cur_rcc_c2_apb1lenr_dac12en  ;
wire        nxt_rcc_c2_apb1lenr_dac12en  ;
wire        rcc_c2_apb1lenr_dac12en_en   ;
wire        cur_rcc_c2_apb1lenr_hdmicecen;
wire        nxt_rcc_c2_apb1lenr_hdmicecen;
wire        rcc_c2_apb1lenr_hdmicecen_en ;
wire        cur_rcc_c2_apb1lenr_i2c3en   ;
wire        nxt_rcc_c2_apb1lenr_i2c3en   ;
wire        rcc_c2_apb1lenr_i2c3en_en    ;
wire        cur_rcc_c2_apb1lenr_i2c2en   ;
wire        nxt_rcc_c2_apb1lenr_i2c2en   ;
wire        rcc_c2_apb1lenr_i2c2en_en    ;
wire        cur_rcc_c2_apb1lenr_i2c1en   ;
wire        nxt_rcc_c2_apb1lenr_i2c1en   ;
wire        rcc_c2_apb1lenr_i2c1en_en    ;
wire        cur_rcc_c2_apb1lenr_uart5en  ;
wire        nxt_rcc_c2_apb1lenr_uart5en  ;
wire        rcc_c2_apb1lenr_uart5en_en   ;
wire        cur_rcc_c2_apb1lenr_uart4en  ;
wire        nxt_rcc_c2_apb1lenr_uart4en  ;
wire        rcc_c2_apb1lenr_uart4en_en   ;
wire        cur_rcc_c2_apb1lenr_usart3en ;
wire        nxt_rcc_c2_apb1lenr_usart3en ;
wire        rcc_c2_apb1lenr_usart3en_en  ;
wire        cur_rcc_c2_apb1lenr_usart2en ;
wire        nxt_rcc_c2_apb1lenr_usart2en ;
wire        rcc_c2_apb1lenr_usart2en_en  ;
wire        cur_rcc_c2_apb1lenr_spdifrxen;
wire        nxt_rcc_c2_apb1lenr_spdifrxen;
wire        rcc_c2_apb1lenr_spdifrxen_en ;
wire        cur_rcc_c2_apb1lenr_spi3en   ;
wire        nxt_rcc_c2_apb1lenr_spi3en   ;
wire        rcc_c2_apb1lenr_spi3en_en    ;
wire        cur_rcc_c2_apb1lenr_spi2en   ;
wire        nxt_rcc_c2_apb1lenr_spi2en   ;
wire        rcc_c2_apb1lenr_spi2en_en    ;
wire        cur_rcc_c2_apb1lenr_wwdg2en  ;
wire        nxt_rcc_c2_apb1lenr_wwdg2en  ;
wire        rcc_c2_apb1lenr_wwdg2en_en   ;
wire        cur_rcc_c2_apb1lenr_lptim1en ;
wire        nxt_rcc_c2_apb1lenr_lptim1en ;
wire        rcc_c2_apb1lenr_lptim1en_en  ;
wire        cur_rcc_c2_apb1lenr_tim14en  ;
wire        nxt_rcc_c2_apb1lenr_tim14en  ;
wire        rcc_c2_apb1lenr_tim14en_en   ;
wire        cur_rcc_c2_apb1lenr_tim13en  ;
wire        nxt_rcc_c2_apb1lenr_tim13en  ;
wire        rcc_c2_apb1lenr_tim13en_en   ;
wire        cur_rcc_c2_apb1lenr_tim12en  ;
wire        nxt_rcc_c2_apb1lenr_tim12en  ;
wire        rcc_c2_apb1lenr_tim12en_en   ;
wire        cur_rcc_c2_apb1lenr_tim7en   ;
wire        nxt_rcc_c2_apb1lenr_tim7en   ;
wire        rcc_c2_apb1lenr_tim7en_en    ;
wire        cur_rcc_c2_apb1lenr_tim6en   ;
wire        nxt_rcc_c2_apb1lenr_tim6en   ;
wire        rcc_c2_apb1lenr_tim6en_en    ;
wire        cur_rcc_c2_apb1lenr_tim5en   ;
wire        nxt_rcc_c2_apb1lenr_tim5en   ;
wire        rcc_c2_apb1lenr_tim5en_en    ;
wire        cur_rcc_c2_apb1lenr_tim4en   ;
wire        nxt_rcc_c2_apb1lenr_tim4en   ;
wire        rcc_c2_apb1lenr_tim4en_en    ;
wire        cur_rcc_c2_apb1lenr_tim3en   ;
wire        nxt_rcc_c2_apb1lenr_tim3en   ;
wire        rcc_c2_apb1lenr_tim3en_en    ;
wire        cur_rcc_c2_apb1lenr_tim2en   ;
wire        nxt_rcc_c2_apb1lenr_tim2en   ;
wire        rcc_c2_apb1lenr_tim2en_en    ;
// rcc_c2_apb1henr
wire [31:0] rcc_c2_apb1henr_read       ;
wire        rcc_c2_apb1henr_sel        ;
wire        cur_rcc_c2_apb1henr_fdcanen;
wire        nxt_rcc_c2_apb1henr_fdcanen;
wire        rcc_c2_apb1henr_fdcanen_en ;
wire        cur_rcc_c2_apb1henr_mdiosen;
wire        nxt_rcc_c2_apb1henr_mdiosen;
wire        rcc_c2_apb1henr_mdiosen_en ;
wire        cur_rcc_c2_apb1henr_opampen;
wire        nxt_rcc_c2_apb1henr_opampen;
wire        rcc_c2_apb1henr_opampen_en ;
wire        cur_rcc_c2_apb1henr_swpen  ;
wire        nxt_rcc_c2_apb1henr_swpen  ;
wire        rcc_c2_apb1henr_swpen_en   ;
wire        cur_rcc_c2_apb1henr_crsen  ;
wire        nxt_rcc_c2_apb1henr_crsen  ;
wire        rcc_c2_apb1henr_crsen_en   ;
// rcc_c2_apb2enr
wire [31:0] rcc_c2_apb2enr_read        ;
wire        rcc_c2_apb2enr_sel         ;
wire        cur_rcc_c2_apb2enr_hrtimen ;
wire        nxt_rcc_c2_apb2enr_hrtimen ;
wire        rcc_c2_apb2enr_hrtimen_en  ;
wire        cur_rcc_c2_apb2enr_dfsdm1en;
wire        nxt_rcc_c2_apb2enr_dfsdm1en;
wire        rcc_c2_apb2enr_dfsdm1en_en ;
wire        cur_rcc_c2_apb2enr_sai3en  ;
wire        nxt_rcc_c2_apb2enr_sai3en  ;
wire        rcc_c2_apb2enr_sai3en_en   ;
wire        cur_rcc_c2_apb2enr_sai2en  ;
wire        nxt_rcc_c2_apb2enr_sai2en  ;
wire        rcc_c2_apb2enr_sai2en_en   ;
wire        cur_rcc_c2_apb2enr_sai1en  ;
wire        nxt_rcc_c2_apb2enr_sai1en  ;
wire        rcc_c2_apb2enr_sai1en_en   ;
wire        cur_rcc_c2_apb2enr_spi5en  ;
wire        nxt_rcc_c2_apb2enr_spi5en  ;
wire        rcc_c2_apb2enr_spi5en_en   ;
wire        cur_rcc_c2_apb2enr_tim17en ;
wire        nxt_rcc_c2_apb2enr_tim17en ;
wire        rcc_c2_apb2enr_tim17en_en  ;
wire        cur_rcc_c2_apb2enr_tim16en ;
wire        nxt_rcc_c2_apb2enr_tim16en ;
wire        rcc_c2_apb2enr_tim16en_en  ;
wire        cur_rcc_c2_apb2enr_tim15en ;
wire        nxt_rcc_c2_apb2enr_tim15en ;
wire        rcc_c2_apb2enr_tim15en_en  ;
wire        cur_rcc_c2_apb2enr_spi4en  ;
wire        nxt_rcc_c2_apb2enr_spi4en  ;
wire        rcc_c2_apb2enr_spi4en_en   ;
wire        cur_rcc_c2_apb2enr_spi1en  ;
wire        nxt_rcc_c2_apb2enr_spi1en  ;
wire        rcc_c2_apb2enr_spi1en_en   ;
wire        cur_rcc_c2_apb2enr_usart6en;
wire        nxt_rcc_c2_apb2enr_usart6en;
wire        rcc_c2_apb2enr_usart6en_en ;
wire        cur_rcc_c2_apb2enr_usart1en;
wire        nxt_rcc_c2_apb2enr_usart1en;
wire        rcc_c2_apb2enr_usart1en_en ;
wire        cur_rcc_c2_apb2enr_tim8en  ;
wire        nxt_rcc_c2_apb2enr_tim8en  ;
wire        rcc_c2_apb2enr_tim8en_en   ;
wire        cur_rcc_c2_apb2enr_tim1en  ;
wire        nxt_rcc_c2_apb2enr_tim1en  ;
wire        rcc_c2_apb2enr_tim1en_en   ;
// rcc_c2_apb4enr
wire [31:0] rcc_c2_apb4enr_read         ;
wire        rcc_c2_apb4enr_sel          ;
wire        cur_rcc_c2_apb4enr_sai4en   ;
wire        nxt_rcc_c2_apb4enr_sai4en   ;
wire        rcc_c2_apb4enr_sai4en_en    ;
wire        cur_rcc_c2_apb4enr_rtcapben ;
wire        nxt_rcc_c2_apb4enr_rtcapben ;
wire        rcc_c2_apb4enr_rtcapben_en  ;
wire        cur_rcc_c2_apb4enr_vrefen   ;
wire        nxt_rcc_c2_apb4enr_vrefen   ;
wire        rcc_c2_apb4enr_vrefen_en    ;
wire        cur_rcc_c2_apb4enr_comp12en ;
wire        nxt_rcc_c2_apb4enr_comp12en ;
wire        rcc_c2_apb4enr_comp12en_en  ;
wire        cur_rcc_c2_apb4enr_lptim5en ;
wire        nxt_rcc_c2_apb4enr_lptim5en ;
wire        rcc_c2_apb4enr_lptim5en_en  ;
wire        cur_rcc_c2_apb4enr_lptim4en ;
wire        nxt_rcc_c2_apb4enr_lptim4en ;
wire        rcc_c2_apb4enr_lptim4en_en  ;
wire        cur_rcc_c2_apb4enr_lptim3en ;
wire        nxt_rcc_c2_apb4enr_lptim3en ;
wire        rcc_c2_apb4enr_lptim3en_en  ;
wire        cur_rcc_c2_apb4enr_lptim2en ;
wire        nxt_rcc_c2_apb4enr_lptim2en ;
wire        rcc_c2_apb4enr_lptim2en_en  ;
wire        cur_rcc_c2_apb4enr_i2c4en   ;
wire        nxt_rcc_c2_apb4enr_i2c4en   ;
wire        rcc_c2_apb4enr_i2c4en_en    ;
wire        cur_rcc_c2_apb4enr_spi6en   ;
wire        nxt_rcc_c2_apb4enr_spi6en   ;
wire        rcc_c2_apb4enr_spi6en_en    ;
wire        cur_rcc_c2_apb4enr_lpuart1en;
wire        nxt_rcc_c2_apb4enr_lpuart1en;
wire        rcc_c2_apb4enr_lpuart1en_en ;
wire        cur_rcc_c2_apb4enr_syscfgen ;
wire        nxt_rcc_c2_apb4enr_syscfgen ;
wire        rcc_c2_apb4enr_syscfgen_en  ;
// rcc_c2_ahb3lpenr
wire [31:0] rcc_c2_ahb3lpenr_read           ;
wire        rcc_c2_ahb3lpenr_sel            ;
wire        cur_rcc_c2_ahb3lpenr_axisramlpen;
wire        nxt_rcc_c2_ahb3lpenr_axisramlpen;
wire        rcc_c2_ahb3lpenr_axisramlpen_en ;
wire        cur_rcc_c2_ahb3lpenr_itcmlpen   ;
wire        nxt_rcc_c2_ahb3lpenr_itcmlpen   ;
wire        rcc_c2_ahb3lpenr_itcmlpen_en    ;
wire        cur_rcc_c2_ahb3lpenr_dtcm2lpen  ;
wire        nxt_rcc_c2_ahb3lpenr_dtcm2lpen  ;
wire        rcc_c2_ahb3lpenr_dtcm2lpen_en   ;
wire        cur_rcc_c2_ahb3lpenr_dtcm1lpen  ;
wire        nxt_rcc_c2_ahb3lpenr_dtcm1lpen  ;
wire        rcc_c2_ahb3lpenr_dtcm1lpen_en   ;
wire        cur_rcc_c2_ahb3lpenr_sdmmc1lpen ;
wire        nxt_rcc_c2_ahb3lpenr_sdmmc1lpen ;
wire        rcc_c2_ahb3lpenr_sdmmc1lpen_en  ;
wire        cur_rcc_c2_ahb3lpenr_qspilpen   ;
wire        nxt_rcc_c2_ahb3lpenr_qspilpen   ;
wire        rcc_c2_ahb3lpenr_qspilpen_en    ;
wire        cur_rcc_c2_ahb3lpenr_fmclpen    ;
wire        nxt_rcc_c2_ahb3lpenr_fmclpen    ;
wire        rcc_c2_ahb3lpenr_fmclpen_en     ;
wire        cur_rcc_c2_ahb3lpenr_flitflpen  ;
wire        nxt_rcc_c2_ahb3lpenr_flitflpen  ;
wire        rcc_c2_ahb3lpenr_flitflpen_en   ;
wire        cur_rcc_c2_ahb3lpenr_jpgdeclpen ;
wire        nxt_rcc_c2_ahb3lpenr_jpgdeclpen ;
wire        rcc_c2_ahb3lpenr_jpgdeclpen_en  ;
wire        cur_rcc_c2_ahb3lpenr_dma2dlpen  ;
wire        nxt_rcc_c2_ahb3lpenr_dma2dlpen  ;
wire        rcc_c2_ahb3lpenr_dma2dlpen_en   ;
wire        cur_rcc_c2_ahb3lpenr_mdmalpen   ;
wire        nxt_rcc_c2_ahb3lpenr_mdmalpen   ;
wire        rcc_c2_ahb3lpenr_mdmalpen_en    ;
// rcc_c2_ahb1lpenr
wire [31:0] rcc_c2_ahb1lpenr_read            ;
wire        rcc_c2_ahb1lpenr_sel             ;
wire        cur_rcc_c2_ahb1lpenr_usb2ulpilpen;
wire        nxt_rcc_c2_ahb1lpenr_usb2ulpilpen;
wire        rcc_c2_ahb1lpenr_usb2ulpilpen_en ;
wire        cur_rcc_c2_ahb1lpenr_usb2otglpen ;
wire        nxt_rcc_c2_ahb1lpenr_usb2otglpen ;
wire        rcc_c2_ahb1lpenr_usb2otglpen_en  ;
wire        cur_rcc_c2_ahb1lpenr_usb1ulpilpen;
wire        nxt_rcc_c2_ahb1lpenr_usb1ulpilpen;
wire        rcc_c2_ahb1lpenr_usb1ulpilpen_en ;
wire        cur_rcc_c2_ahb1lpenr_usb1otglpen ;
wire        nxt_rcc_c2_ahb1lpenr_usb1otglpen ;
wire        rcc_c2_ahb1lpenr_usb1otglpen_en  ;
wire        cur_rcc_c2_ahb1lpenr_eth1rxlpen  ;
wire        nxt_rcc_c2_ahb1lpenr_eth1rxlpen  ;
wire        rcc_c2_ahb1lpenr_eth1rxlpen_en   ;
wire        cur_rcc_c2_ahb1lpenr_eth1txlpen  ;
wire        nxt_rcc_c2_ahb1lpenr_eth1txlpen  ;
wire        rcc_c2_ahb1lpenr_eth1txlpen_en   ;
wire        cur_rcc_c2_ahb1lpenr_eth1maclpen ;
wire        nxt_rcc_c2_ahb1lpenr_eth1maclpen ;
wire        rcc_c2_ahb1lpenr_eth1maclpen_en  ;
wire        cur_rcc_c2_ahb1lpenr_adc12lpen   ;
wire        nxt_rcc_c2_ahb1lpenr_adc12lpen   ;
wire        rcc_c2_ahb1lpenr_adc12lpen_en    ;
wire        cur_rcc_c2_ahb1lpenr_dma2lpen    ;
wire        nxt_rcc_c2_ahb1lpenr_dma2lpen    ;
wire        rcc_c2_ahb1lpenr_dma2lpen_en     ;
wire        cur_rcc_c2_ahb1lpenr_dma1lpen    ;
wire        nxt_rcc_c2_ahb1lpenr_dma1lpen    ;
wire        rcc_c2_ahb1lpenr_dma1lpen_en     ;
// rcc_c2_ahb2lpenr
wire [31:0] rcc_c2_ahb2lpenr_read          ;
wire        rcc_c2_ahb2lpenr_sel           ;
wire        cur_rcc_c2_ahb2lpenr_sram3lpen ;
wire        nxt_rcc_c2_ahb2lpenr_sram3lpen ;
wire        rcc_c2_ahb2lpenr_sram3lpen_en  ;
wire        cur_rcc_c2_ahb2lpenr_sram2lpen ;
wire        nxt_rcc_c2_ahb2lpenr_sram2lpen ;
wire        rcc_c2_ahb2lpenr_sram2lpen_en  ;
wire        cur_rcc_c2_ahb2lpenr_sram1lpen ;
wire        nxt_rcc_c2_ahb2lpenr_sram1lpen ;
wire        rcc_c2_ahb2lpenr_sram1lpen_en  ;
wire        cur_rcc_c2_ahb2lpenr_sdmmc2lpen;
wire        nxt_rcc_c2_ahb2lpenr_sdmmc2lpen;
wire        rcc_c2_ahb2lpenr_sdmmc2lpen_en ;
wire        cur_rcc_c2_ahb2lpenr_rnglpen   ;
wire        nxt_rcc_c2_ahb2lpenr_rnglpen   ;
wire        rcc_c2_ahb2lpenr_rnglpen_en    ;
wire        cur_rcc_c2_ahb2lpenr_hashlpen  ;
wire        nxt_rcc_c2_ahb2lpenr_hashlpen  ;
wire        rcc_c2_ahb2lpenr_hashlpen_en   ;
wire        cur_rcc_c2_ahb2lpenr_cryptlpen ;
wire        nxt_rcc_c2_ahb2lpenr_cryptlpen ;
wire        rcc_c2_ahb2lpenr_cryptlpen_en  ;
wire        cur_rcc_c2_ahb2lpenr_dcmilpen  ;
wire        nxt_rcc_c2_ahb2lpenr_dcmilpen  ;
wire        rcc_c2_ahb2lpenr_dcmilpen_en   ;
// rcc_c2_ahb4lpenr
wire [31:0] rcc_c2_ahb4lpenr_read          ;
wire        rcc_c2_ahb4lpenr_sel           ;
wire        cur_rcc_c2_ahb4lpenr_sram4lpen ;
wire        nxt_rcc_c2_ahb4lpenr_sram4lpen ;
wire        rcc_c2_ahb4lpenr_sram4lpen_en  ;
wire        cur_rcc_c2_ahb4lpenr_bkpramlpen;
wire        nxt_rcc_c2_ahb4lpenr_bkpramlpen;
wire        rcc_c2_ahb4lpenr_bkpramlpen_en ;
wire        cur_rcc_c2_ahb4lpenr_adc3lpen  ;
wire        nxt_rcc_c2_ahb4lpenr_adc3lpen  ;
wire        rcc_c2_ahb4lpenr_adc3lpen_en   ;
wire        cur_rcc_c2_ahb4lpenr_bdmalpen  ;
wire        nxt_rcc_c2_ahb4lpenr_bdmalpen  ;
wire        rcc_c2_ahb4lpenr_bdmalpen_en   ;
wire        cur_rcc_c2_ahb4lpenr_crclpen   ;
wire        nxt_rcc_c2_ahb4lpenr_crclpen   ;
wire        rcc_c2_ahb4lpenr_crclpen_en    ;
wire        cur_rcc_c2_ahb4lpenr_gpioklpen ;
wire        nxt_rcc_c2_ahb4lpenr_gpioklpen ;
wire        rcc_c2_ahb4lpenr_gpioklpen_en  ;
wire        cur_rcc_c2_ahb4lpenr_gpiojlpen ;
wire        nxt_rcc_c2_ahb4lpenr_gpiojlpen ;
wire        rcc_c2_ahb4lpenr_gpiojlpen_en  ;
wire        cur_rcc_c2_ahb4lpenr_gpioilpen ;
wire        nxt_rcc_c2_ahb4lpenr_gpioilpen ;
wire        rcc_c2_ahb4lpenr_gpioilpen_en  ;
wire        cur_rcc_c2_ahb4lpenr_gpiohlpen ;
wire        nxt_rcc_c2_ahb4lpenr_gpiohlpen ;
wire        rcc_c2_ahb4lpenr_gpiohlpen_en  ;
wire        cur_rcc_c2_ahb4lpenr_gpioglpen ;
wire        nxt_rcc_c2_ahb4lpenr_gpioglpen ;
wire        rcc_c2_ahb4lpenr_gpioglpen_en  ;
wire        cur_rcc_c2_ahb4lpenr_gpioflpen ;
wire        nxt_rcc_c2_ahb4lpenr_gpioflpen ;
wire        rcc_c2_ahb4lpenr_gpioflpen_en  ;
wire        cur_rcc_c2_ahb4lpenr_gpioelpen ;
wire        nxt_rcc_c2_ahb4lpenr_gpioelpen ;
wire        rcc_c2_ahb4lpenr_gpioelpen_en  ;
wire        cur_rcc_c2_ahb4lpenr_gpiodlpen ;
wire        nxt_rcc_c2_ahb4lpenr_gpiodlpen ;
wire        rcc_c2_ahb4lpenr_gpiodlpen_en  ;
wire        cur_rcc_c2_ahb4lpenr_gpioclpen ;
wire        nxt_rcc_c2_ahb4lpenr_gpioclpen ;
wire        rcc_c2_ahb4lpenr_gpioclpen_en  ;
wire        cur_rcc_c2_ahb4lpenr_gpioblpen ;
wire        nxt_rcc_c2_ahb4lpenr_gpioblpen ;
wire        rcc_c2_ahb4lpenr_gpioblpen_en  ;
wire        cur_rcc_c2_ahb4lpenr_gpioalpen ;
wire        nxt_rcc_c2_ahb4lpenr_gpioalpen ;
wire        rcc_c2_ahb4lpenr_gpioalpen_en  ;
// rcc_c2_apb3lpenr
wire [31:0] rcc_c2_apb3lpenr_read         ;
wire        rcc_c2_apb3lpenr_sel          ;
wire        cur_rcc_c2_apb3lpenr_wwdg1lpen;
wire        nxt_rcc_c2_apb3lpenr_wwdg1lpen;
wire        rcc_c2_apb3lpenr_wwdg1lpen_en ;
wire        cur_rcc_c2_apb3lpenr_ltdclpen ;
wire        nxt_rcc_c2_apb3lpenr_ltdclpen ;
wire        rcc_c2_apb3lpenr_ltdclpen_en  ;
// rcc_c2_apb1llpenr
wire [31:0] rcc_c2_apb1llpenr_read           ;
wire        rcc_c2_apb1llpenr_sel            ;
wire        cur_rcc_c2_apb1llpenr_uart8lpen  ;
wire        nxt_rcc_c2_apb1llpenr_uart8lpen  ;
wire        rcc_c2_apb1llpenr_uart8lpen_en   ;
wire        cur_rcc_c2_apb1llpenr_uart7lpen  ;
wire        nxt_rcc_c2_apb1llpenr_uart7lpen  ;
wire        rcc_c2_apb1llpenr_uart7lpen_en   ;
wire        cur_rcc_c2_apb1llpenr_dac12lpen  ;
wire        nxt_rcc_c2_apb1llpenr_dac12lpen  ;
wire        rcc_c2_apb1llpenr_dac12lpen_en   ;
wire        cur_rcc_c2_apb1llpenr_hdmiceclpen;
wire        nxt_rcc_c2_apb1llpenr_hdmiceclpen;
wire        rcc_c2_apb1llpenr_hdmiceclpen_en ;
wire        cur_rcc_c2_apb1llpenr_i2c3lpen   ;
wire        nxt_rcc_c2_apb1llpenr_i2c3lpen   ;
wire        rcc_c2_apb1llpenr_i2c3lpen_en    ;
wire        cur_rcc_c2_apb1llpenr_i2c2lpen   ;
wire        nxt_rcc_c2_apb1llpenr_i2c2lpen   ;
wire        rcc_c2_apb1llpenr_i2c2lpen_en    ;
wire        cur_rcc_c2_apb1llpenr_i2c1lpen   ;
wire        nxt_rcc_c2_apb1llpenr_i2c1lpen   ;
wire        rcc_c2_apb1llpenr_i2c1lpen_en    ;
wire        cur_rcc_c2_apb1llpenr_uart5lpen  ;
wire        nxt_rcc_c2_apb1llpenr_uart5lpen  ;
wire        rcc_c2_apb1llpenr_uart5lpen_en   ;
wire        cur_rcc_c2_apb1llpenr_uart4lpen  ;
wire        nxt_rcc_c2_apb1llpenr_uart4lpen  ;
wire        rcc_c2_apb1llpenr_uart4lpen_en   ;
wire        cur_rcc_c2_apb1llpenr_usart3lpen ;
wire        nxt_rcc_c2_apb1llpenr_usart3lpen ;
wire        rcc_c2_apb1llpenr_usart3lpen_en  ;
wire        cur_rcc_c2_apb1llpenr_usart2lpen ;
wire        nxt_rcc_c2_apb1llpenr_usart2lpen ;
wire        rcc_c2_apb1llpenr_usart2lpen_en  ;
wire        cur_rcc_c2_apb1llpenr_spdifrxlpen;
wire        nxt_rcc_c2_apb1llpenr_spdifrxlpen;
wire        rcc_c2_apb1llpenr_spdifrxlpen_en ;
wire        cur_rcc_c2_apb1llpenr_spi3lpen   ;
wire        nxt_rcc_c2_apb1llpenr_spi3lpen   ;
wire        rcc_c2_apb1llpenr_spi3lpen_en    ;
wire        cur_rcc_c2_apb1llpenr_spi2lpen   ;
wire        nxt_rcc_c2_apb1llpenr_spi2lpen   ;
wire        rcc_c2_apb1llpenr_spi2lpen_en    ;
wire        cur_rcc_c2_apb1llpenr_wwdg2lpen  ;
wire        nxt_rcc_c2_apb1llpenr_wwdg2lpen  ;
wire        rcc_c2_apb1llpenr_wwdg2lpen_en   ;
wire        cur_rcc_c2_apb1llpenr_lptim1lpen ;
wire        nxt_rcc_c2_apb1llpenr_lptim1lpen ;
wire        rcc_c2_apb1llpenr_lptim1lpen_en  ;
wire        cur_rcc_c2_apb1llpenr_tim14lpen  ;
wire        nxt_rcc_c2_apb1llpenr_tim14lpen  ;
wire        rcc_c2_apb1llpenr_tim14lpen_en   ;
wire        cur_rcc_c2_apb1llpenr_tim13lpen  ;
wire        nxt_rcc_c2_apb1llpenr_tim13lpen  ;
wire        rcc_c2_apb1llpenr_tim13lpen_en   ;
wire        cur_rcc_c2_apb1llpenr_tim12lpen  ;
wire        nxt_rcc_c2_apb1llpenr_tim12lpen  ;
wire        rcc_c2_apb1llpenr_tim12lpen_en   ;
wire        cur_rcc_c2_apb1llpenr_tim7lpen   ;
wire        nxt_rcc_c2_apb1llpenr_tim7lpen   ;
wire        rcc_c2_apb1llpenr_tim7lpen_en    ;
wire        cur_rcc_c2_apb1llpenr_tim6lpen   ;
wire        nxt_rcc_c2_apb1llpenr_tim6lpen   ;
wire        rcc_c2_apb1llpenr_tim6lpen_en    ;
wire        cur_rcc_c2_apb1llpenr_tim5lpen   ;
wire        nxt_rcc_c2_apb1llpenr_tim5lpen   ;
wire        rcc_c2_apb1llpenr_tim5lpen_en    ;
wire        cur_rcc_c2_apb1llpenr_tim4lpen   ;
wire        nxt_rcc_c2_apb1llpenr_tim4lpen   ;
wire        rcc_c2_apb1llpenr_tim4lpen_en    ;
wire        cur_rcc_c2_apb1llpenr_tim3lpen   ;
wire        nxt_rcc_c2_apb1llpenr_tim3lpen   ;
wire        rcc_c2_apb1llpenr_tim3lpen_en    ;
wire        cur_rcc_c2_apb1llpenr_tim2lpen   ;
wire        nxt_rcc_c2_apb1llpenr_tim2lpen   ;
wire        rcc_c2_apb1llpenr_tim2lpen_en    ;
// rcc_c2_apb1hlpenr
wire [31:0] rcc_c2_apb1hlpenr_read         ;
wire        rcc_c2_apb1hlpenr_sel          ;
wire        cur_rcc_c2_apb1hlpenr_fdcanlpen;
wire        nxt_rcc_c2_apb1hlpenr_fdcanlpen;
wire        rcc_c2_apb1hlpenr_fdcanlpen_en ;
wire        cur_rcc_c2_apb1hlpenr_mdioslpen;
wire        nxt_rcc_c2_apb1hlpenr_mdioslpen;
wire        rcc_c2_apb1hlpenr_mdioslpen_en ;
wire        cur_rcc_c2_apb1hlpenr_opamplpen;
wire        nxt_rcc_c2_apb1hlpenr_opamplpen;
wire        rcc_c2_apb1hlpenr_opamplpen_en ;
wire        cur_rcc_c2_apb1hlpenr_swplpen  ;
wire        nxt_rcc_c2_apb1hlpenr_swplpen  ;
wire        rcc_c2_apb1hlpenr_swplpen_en   ;
wire        cur_rcc_c2_apb1hlpenr_crslpen  ;
wire        nxt_rcc_c2_apb1hlpenr_crslpen  ;
wire        rcc_c2_apb1hlpenr_crslpen_en   ;
// rcc_c2_apb2lpenr
wire [31:0] rcc_c2_apb2lpenr_read          ;
wire        rcc_c2_apb2lpenr_sel           ;
wire        cur_rcc_c2_apb2lpenr_hrtimlpen ;
wire        nxt_rcc_c2_apb2lpenr_hrtimlpen ;
wire        rcc_c2_apb2lpenr_hrtimlpen_en  ;
wire        cur_rcc_c2_apb2lpenr_dfsdm1lpen;
wire        nxt_rcc_c2_apb2lpenr_dfsdm1lpen;
wire        rcc_c2_apb2lpenr_dfsdm1lpen_en ;
wire        cur_rcc_c2_apb2lpenr_sai3lpen  ;
wire        nxt_rcc_c2_apb2lpenr_sai3lpen  ;
wire        rcc_c2_apb2lpenr_sai3lpen_en   ;
wire        cur_rcc_c2_apb2lpenr_sai2lpen  ;
wire        nxt_rcc_c2_apb2lpenr_sai2lpen  ;
wire        rcc_c2_apb2lpenr_sai2lpen_en   ;
wire        cur_rcc_c2_apb2lpenr_sai1lpen  ;
wire        nxt_rcc_c2_apb2lpenr_sai1lpen  ;
wire        rcc_c2_apb2lpenr_sai1lpen_en   ;
wire        cur_rcc_c2_apb2lpenr_spi5lpen  ;
wire        nxt_rcc_c2_apb2lpenr_spi5lpen  ;
wire        rcc_c2_apb2lpenr_spi5lpen_en   ;
wire        cur_rcc_c2_apb2lpenr_tim17lpen ;
wire        nxt_rcc_c2_apb2lpenr_tim17lpen ;
wire        rcc_c2_apb2lpenr_tim17lpen_en  ;
wire        cur_rcc_c2_apb2lpenr_tim16lpen ;
wire        nxt_rcc_c2_apb2lpenr_tim16lpen ;
wire        rcc_c2_apb2lpenr_tim16lpen_en  ;
wire        cur_rcc_c2_apb2lpenr_tim15lpen ;
wire        nxt_rcc_c2_apb2lpenr_tim15lpen ;
wire        rcc_c2_apb2lpenr_tim15lpen_en  ;
wire        cur_rcc_c2_apb2lpenr_spi4lpen  ;
wire        nxt_rcc_c2_apb2lpenr_spi4lpen  ;
wire        rcc_c2_apb2lpenr_spi4lpen_en   ;
wire        cur_rcc_c2_apb2lpenr_spi1lpen  ;
wire        nxt_rcc_c2_apb2lpenr_spi1lpen  ;
wire        rcc_c2_apb2lpenr_spi1lpen_en   ;
wire        cur_rcc_c2_apb2lpenr_usart6lpen;
wire        nxt_rcc_c2_apb2lpenr_usart6lpen;
wire        rcc_c2_apb2lpenr_usart6lpen_en ;
wire        cur_rcc_c2_apb2lpenr_usart1lpen;
wire        nxt_rcc_c2_apb2lpenr_usart1lpen;
wire        rcc_c2_apb2lpenr_usart1lpen_en ;
wire        cur_rcc_c2_apb2lpenr_tim8lpen  ;
wire        nxt_rcc_c2_apb2lpenr_tim8lpen  ;
wire        rcc_c2_apb2lpenr_tim8lpen_en   ;
wire        cur_rcc_c2_apb2lpenr_tim1lpen  ;
wire        nxt_rcc_c2_apb2lpenr_tim1lpen  ;
wire        rcc_c2_apb2lpenr_tim1lpen_en   ;
// rcc_c2_apb4lpenr
wire [31:0] rcc_c2_apb4lpenr_read           ;
wire        rcc_c2_apb4lpenr_sel            ;
wire        cur_rcc_c2_apb4lpenr_sai4lpen   ;
wire        nxt_rcc_c2_apb4lpenr_sai4lpen   ;
wire        rcc_c2_apb4lpenr_sai4lpen_en    ;
wire        cur_rcc_c2_apb4lpenr_rtcapblpen ;
wire        nxt_rcc_c2_apb4lpenr_rtcapblpen ;
wire        rcc_c2_apb4lpenr_rtcapblpen_en  ;
wire        cur_rcc_c2_apb4lpenr_vreflpen   ;
wire        nxt_rcc_c2_apb4lpenr_vreflpen   ;
wire        rcc_c2_apb4lpenr_vreflpen_en    ;
wire        cur_rcc_c2_apb4lpenr_comp12lpen ;
wire        nxt_rcc_c2_apb4lpenr_comp12lpen ;
wire        rcc_c2_apb4lpenr_comp12lpen_en  ;
wire        cur_rcc_c2_apb4lpenr_lptim5lpen ;
wire        nxt_rcc_c2_apb4lpenr_lptim5lpen ;
wire        rcc_c2_apb4lpenr_lptim5lpen_en  ;
wire        cur_rcc_c2_apb4lpenr_lptim4lpen ;
wire        nxt_rcc_c2_apb4lpenr_lptim4lpen ;
wire        rcc_c2_apb4lpenr_lptim4lpen_en  ;
wire        cur_rcc_c2_apb4lpenr_lptim3lpen ;
wire        nxt_rcc_c2_apb4lpenr_lptim3lpen ;
wire        rcc_c2_apb4lpenr_lptim3lpen_en  ;
wire        cur_rcc_c2_apb4lpenr_lptim2lpen ;
wire        nxt_rcc_c2_apb4lpenr_lptim2lpen ;
wire        rcc_c2_apb4lpenr_lptim2lpen_en  ;
wire        cur_rcc_c2_apb4lpenr_i2c4lpen   ;
wire        nxt_rcc_c2_apb4lpenr_i2c4lpen   ;
wire        rcc_c2_apb4lpenr_i2c4lpen_en    ;
wire        cur_rcc_c2_apb4lpenr_spi6lpen   ;
wire        nxt_rcc_c2_apb4lpenr_spi6lpen   ;
wire        rcc_c2_apb4lpenr_spi6lpen_en    ;
wire        cur_rcc_c2_apb4lpenr_lpuart1lpen;
wire        nxt_rcc_c2_apb4lpenr_lpuart1lpen;
wire        rcc_c2_apb4lpenr_lpuart1lpen_en ;
wire        cur_rcc_c2_apb4lpenr_syscfglpen ;
wire        nxt_rcc_c2_apb4lpenr_syscfglpen ;
wire        rcc_c2_apb4lpenr_syscfglpen_en  ;

wire pllxon_clr_n;
wire hseon_clr_n;
wire hsi48on_clr_n;
wire [1:0]  eff_hsidiv;
wire rcc_eff_hsidiv_en;

// ================================================================================
// R/W INDICATOR
// ================================================================================
assign rd_req = req && !(|we) ;
assign wr_req = {WW{req}} & we;

// ================================================================================
// ADDRESS DECODER
// ================================================================================
// RCC
assign rcc_cr_sel            = (addr == RCC_CR)           ;
assign rcc_icscr_sel         = (addr == RCC_ICSCR)        ;
assign rcc_crrcr_sel         = (addr == RCC_CRRCR)        ;
assign rcc_cfgr_sel          = (addr == RCC_CFGR)         ;
assign rcc_d1cfgr_sel        = (addr == RCC_D1CFGR)       ;
assign rcc_d2cfgr_sel        = (addr == RCC_D2CFGR)       ;
assign rcc_d3cfgr_sel        = (addr == RCC_D3CFGR)       ;
assign rcc_pllclkselr_sel    = (addr == RCC_PLLCLKSELR)   ;
assign rcc_pllcfgr_sel       = (addr == RCC_PLLCFGR)      ;
assign rcc_pll1divr_sel      = (addr == RCC_PLL1DIVR)     ;
assign rcc_pll1fracr_sel     = (addr == RCC_PLL1FRACR)    ;
assign rcc_pll2divr_sel      = (addr == RCC_PLL2DIVR)     ;
assign rcc_pll2fracr_sel     = (addr == RCC_PLL2FRACR)    ;
assign rcc_pll3divr_sel      = (addr == RCC_PLL3DIVR)     ;
assign rcc_pll3fracr_sel     = (addr == RCC_PLL3FRACR)    ;
assign rcc_d1ccipr_sel       = (addr == RCC_D1CCIPR)      ;
assign rcc_d2ccip1r_sel      = (addr == RCC_D2CCIP1R)     ;
assign rcc_d2ccip2r_sel      = (addr == RCC_D2CCIP2R)     ;
assign rcc_d3ccipr_sel       = (addr == RCC_D3CCIPR)      ;
assign rcc_cier_sel          = (addr == RCC_CIER)         ;
assign rcc_cifr_sel          = (addr == RCC_CIFR)         ;
assign rcc_cicr_sel          = (addr == RCC_CICR)         ;
assign rcc_bdcr_sel          = (addr == RCC_BDCR)         ;
assign rcc_csr_sel           = (addr == RCC_CSR)          ;
assign rcc_ahb3rstr_sel      = (addr == RCC_AHB3RSTR)     ;
assign rcc_ahb1rstr_sel      = (addr == RCC_AHB1RSTR)     ;
assign rcc_ahb2rstr_sel      = (addr == RCC_AHB2RSTR)     ;
assign rcc_ahb4rstr_sel      = (addr == RCC_AHB4RSTR)     ;
assign rcc_apb3rstr_sel      = (addr == RCC_APB3RSTR)     ;
assign rcc_apb1lrstr_sel     = (addr == RCC_APB1LRSTR)    ;
assign rcc_apb1hrstr_sel     = (addr == RCC_APB1HRSTR)    ;
assign rcc_apb2rstr_sel      = (addr == RCC_APB2RSTR)     ;
assign rcc_apb4rstr_sel      = (addr == RCC_APB4RSTR)     ;
assign rcc_gcr_sel           = (addr == RCC_GCR)          ;
assign rcc_d3amr_sel         = (addr == RCC_D3AMR)        ;
assign rcc_c1_rsr_sel        = (addr == RCC_C1_RSR)       ;
assign rcc_c1_ahb3enr_sel    = (addr == RCC_C1_AHB3ENR)   ;
assign rcc_c1_ahb1enr_sel    = (addr == RCC_C1_AHB1ENR)   ;
assign rcc_c1_ahb2enr_sel    = (addr == RCC_C1_AHB2ENR)   ;
assign rcc_c1_ahb4enr_sel    = (addr == RCC_C1_AHB4ENR)   ;
assign rcc_c1_apb3enr_sel    = (addr == RCC_C1_APB3ENR)   ;
assign rcc_c1_apb1lenr_sel   = (addr == RCC_C1_APB1LENR)  ;
assign rcc_c1_apb1henr_sel   = (addr == RCC_C1_APB1HENR)  ;
assign rcc_c1_apb2enr_sel    = (addr == RCC_C1_APB2ENR)   ;
assign rcc_c1_apb4enr_sel    = (addr == RCC_C1_APB4ENR)   ;
assign rcc_c1_ahb3lpenr_sel  = (addr == RCC_C1_AHB3LPENR) ;
assign rcc_c1_ahb1lpenr_sel  = (addr == RCC_C1_AHB1LPENR) ;
assign rcc_c1_ahb2lpenr_sel  = (addr == RCC_C1_AHB2LPENR) ;
assign rcc_c1_ahb4lpenr_sel  = (addr == RCC_C1_AHB4LPENR) ;
assign rcc_c1_apb3lpenr_sel  = (addr == RCC_C1_APB3LPENR) ;
assign rcc_c1_apb1llpenr_sel = (addr == RCC_C1_APB1LLPENR);
assign rcc_c1_apb1hlpenr_sel = (addr == RCC_C1_APB1HLPENR);
assign rcc_c1_apb2lpenr_sel  = (addr == RCC_C1_APB2LPENR) ;
assign rcc_c1_apb4lpenr_sel  = (addr == RCC_C1_APB4LPENR) ;
assign rcc_c2_ahb3enr_sel    = (addr == RCC_C2_AHB3ENR)   ;
assign rcc_c2_ahb1enr_sel    = (addr == RCC_C2_AHB1ENR)   ;
assign rcc_c2_ahb2enr_sel    = (addr == RCC_C2_AHB2ENR)   ;
assign rcc_c2_ahb4enr_sel    = (addr == RCC_C2_AHB4ENR)   ;
assign rcc_c2_apb3enr_sel    = (addr == RCC_C2_APB3ENR)   ;
assign rcc_c2_apb1lenr_sel   = (addr == RCC_C2_APB1LENR)  ;
assign rcc_c2_apb1henr_sel   = (addr == RCC_C2_APB1HENR)  ;
assign rcc_c2_apb2enr_sel    = (addr == RCC_C2_APB2ENR)   ;
assign rcc_c2_apb4enr_sel    = (addr == RCC_C2_APB4ENR)   ;
assign rcc_c2_ahb3lpenr_sel  = (addr == RCC_C2_AHB3LPENR) ;
assign rcc_c2_ahb1lpenr_sel  = (addr == RCC_C2_AHB1LPENR) ;
assign rcc_c2_ahb2lpenr_sel  = (addr == RCC_C2_AHB2LPENR) ;
assign rcc_c2_ahb4lpenr_sel  = (addr == RCC_C2_AHB4LPENR) ;
assign rcc_c2_apb3lpenr_sel  = (addr == RCC_C2_APB3LPENR) ;
assign rcc_c2_apb1llpenr_sel = (addr == RCC_C2_APB1LLPENR);
assign rcc_c2_apb1hlpenr_sel = (addr == RCC_C2_APB1HLPENR);
assign rcc_c2_apb2lpenr_sel  = (addr == RCC_C2_APB2LPENR) ;
assign rcc_c2_apb4lpenr_sel  = (addr == RCC_C2_APB4LPENR) ;

// ================================================================================
// REG ACCESS ERROR
// ================================================================================
assign rsv_reg_sel = (addr < RCC_CR)
                  || ((addr > RCC_CRRCR) && (addr < RCC_CFGR))
                  || ((addr > RCC_CFGR) && (addr < RCC_D1CFGR))
                  || ((addr > RCC_D3CFGR) && (addr < RCC_PLLCLKSELR))
                  || ((addr > RCC_PLL3FRACR) && (addr < RCC_D1CCIPR))
                  || ((addr > RCC_D3CCIPR) && (addr < RCC_CIER))
                  || ((addr > RCC_CICR) && (addr < RCC_BDCR))
                  || ((addr > RCC_CSR) && (addr < RCC_AHB3RSTR))
                  || ((addr > RCC_GCR) && (addr < RCC_D3AMR))
                  || ((addr > RCC_D3AMR) && (addr < RCC_C1_RSR))
                  || ((addr > RCC_C1_APB4ENR) && (addr < RCC_C1_AHB3LPENR))
                  || ((addr > RCC_C1_APB4LPENR) && (addr < RCC_C2_RSR))
                  || ((addr > RCC_C2_APB4ENR) && (addr < RCC_C2_AHB3LPENR))
                  || (addr > RCC_C2_APB4LPENR);

assign rsv_acs_err = rsv_reg_sel && req;
assign rsp         = {1'b0,rsv_acs_err};

// ================================================================================
// DATA READ
// ================================================================================
assign rdata_tmp = ({DW{rcc_cr_sel}} & rcc_cr_read)
                 | ({DW{rcc_icscr_sel}} & rcc_icscr_read)
                 | ({DW{rcc_crrcr_sel}} & rcc_crrcr_read)
                 | ({DW{rcc_cfgr_sel}} & rcc_cfgr_read)
                 | ({DW{rcc_d1cfgr_sel}} & rcc_d1cfgr_read)
                 | ({DW{rcc_d2cfgr_sel}} & rcc_d2cfgr_read)
                 | ({DW{rcc_d3cfgr_sel}} & rcc_d3cfgr_read)
                 | ({DW{rcc_pllclkselr_sel}} & rcc_pllclkselr_read)
                 | ({DW{rcc_pllcfgr_sel}} & rcc_pllcfgr_read)
                 | ({DW{rcc_pll1divr_sel}} & rcc_pll1divr_read)
                 | ({DW{rcc_pll1fracr_sel}} & rcc_pll1fracr_read)
                 | ({DW{rcc_pll2divr_sel}} & rcc_pll2divr_read)
                 | ({DW{rcc_pll2fracr_sel}} & rcc_pll2fracr_read)
                 | ({DW{rcc_pll3divr_sel}} & rcc_pll3divr_read)
                 | ({DW{rcc_pll3fracr_sel}} & rcc_pll3fracr_read)
                 | ({DW{rcc_d1ccipr_sel}} & rcc_d1ccipr_read)
                 | ({DW{rcc_d2ccip1r_sel}} & rcc_d2ccip1r_read)
                 | ({DW{rcc_d2ccip2r_sel}} & rcc_d2ccip2r_read)
                 | ({DW{rcc_d3ccipr_sel}} & rcc_d3ccipr_read)
                 | ({DW{rcc_cier_sel}} & rcc_cier_read)
                 | ({DW{rcc_cifr_sel}} & rcc_cifr_read)
                 | ({DW{rcc_cicr_sel}} & rcc_cicr_read)
                 | ({DW{rcc_bdcr_sel}} & rcc_bdcr_read)
                 | ({DW{rcc_csr_sel}} & rcc_csr_read)
                 | ({DW{rcc_ahb3rstr_sel}} & rcc_ahb3rstr_read)
                 | ({DW{rcc_ahb1rstr_sel}} & rcc_ahb1rstr_read)
                 | ({DW{rcc_ahb2rstr_sel}} & rcc_ahb2rstr_read)
                 | ({DW{rcc_ahb4rstr_sel}} & rcc_ahb4rstr_read)
                 | ({DW{rcc_apb3rstr_sel}} & rcc_apb3rstr_read)
                 | ({DW{rcc_apb1lrstr_sel}} & rcc_apb1lrstr_read)
                 | ({DW{rcc_apb1hrstr_sel}} & rcc_apb1hrstr_read)
                 | ({DW{rcc_apb2rstr_sel}} & rcc_apb2rstr_read)
                 | ({DW{rcc_apb4rstr_sel}} & rcc_apb4rstr_read)
                 | ({DW{rcc_gcr_sel}} & rcc_gcr_read)
                 | ({DW{rcc_d3amr_sel}} & rcc_d3amr_read)
                 | ({DW{rcc_c1_rsr_sel}} & rcc_c1_rsr_read)
                 | ({DW{rcc_c1_ahb3enr_sel}} & rcc_c1_ahb3enr_read)
                 | ({DW{rcc_c1_ahb1enr_sel}} & rcc_c1_ahb1enr_read)
                 | ({DW{rcc_c1_ahb2enr_sel}} & rcc_c1_ahb2enr_read)
                 | ({DW{rcc_c1_ahb4enr_sel}} & rcc_c1_ahb4enr_read)
                 | ({DW{rcc_c1_apb3enr_sel}} & rcc_c1_apb3enr_read)
                 | ({DW{rcc_c1_apb1lenr_sel}} & rcc_c1_apb1lenr_read)
                 | ({DW{rcc_c1_apb1henr_sel}} & rcc_c1_apb1henr_read)
                 | ({DW{rcc_c1_apb2enr_sel}} & rcc_c1_apb2enr_read)
                 | ({DW{rcc_c1_apb4enr_sel}} & rcc_c1_apb4enr_read)
                 | ({DW{rcc_c1_ahb3lpenr_sel}} & rcc_c1_ahb3lpenr_read)
                 | ({DW{rcc_c1_ahb1lpenr_sel}} & rcc_c1_ahb1lpenr_read)
                 | ({DW{rcc_c1_ahb2lpenr_sel}} & rcc_c1_ahb2lpenr_read)
                 | ({DW{rcc_c1_ahb4lpenr_sel}} & rcc_c1_ahb4lpenr_read)
                 | ({DW{rcc_c1_apb3lpenr_sel}} & rcc_c1_apb3lpenr_read)
                 | ({DW{rcc_c1_apb1llpenr_sel}} & rcc_c1_apb1llpenr_read)
                 | ({DW{rcc_c1_apb1hlpenr_sel}} & rcc_c1_apb1hlpenr_read)
                 | ({DW{rcc_c1_apb2lpenr_sel}} & rcc_c1_apb2lpenr_read)
                 | ({DW{rcc_c1_apb4lpenr_sel}} & rcc_c1_apb4lpenr_read)
                 | ({DW{rcc_c2_rsr_sel}} & rcc_c2_rsr_read)
                 | ({DW{rcc_c2_ahb3enr_sel}} & rcc_c2_ahb3enr_read)
                 | ({DW{rcc_c2_ahb1enr_sel}} & rcc_c2_ahb1enr_read)
                 | ({DW{rcc_c2_ahb2enr_sel}} & rcc_c2_ahb2enr_read)
                 | ({DW{rcc_c2_ahb4enr_sel}} & rcc_c2_ahb4enr_read)
                 | ({DW{rcc_c2_apb3enr_sel}} & rcc_c2_apb3enr_read)
                 | ({DW{rcc_c2_apb1lenr_sel}} & rcc_c2_apb1lenr_read)
                 | ({DW{rcc_c2_apb1henr_sel}} & rcc_c2_apb1henr_read)
                 | ({DW{rcc_c2_apb2enr_sel}} & rcc_c2_apb2enr_read)
                 | ({DW{rcc_c2_apb4enr_sel}} & rcc_c2_apb4enr_read)
                 | ({DW{rcc_c2_ahb3lpenr_sel}} & rcc_c2_ahb3lpenr_read)
                 | ({DW{rcc_c2_ahb1lpenr_sel}} & rcc_c2_ahb1lpenr_read)
                 | ({DW{rcc_c2_ahb2lpenr_sel}} & rcc_c2_ahb2lpenr_read)
                 | ({DW{rcc_c2_ahb4lpenr_sel}} & rcc_c2_ahb4lpenr_read)
                 | ({DW{rcc_c2_apb3lpenr_sel}} & rcc_c2_apb3lpenr_read)
                 | ({DW{rcc_c2_apb1llpenr_sel}} & rcc_c2_apb1llpenr_read)
                 | ({DW{rcc_c2_apb1hlpenr_sel}} & rcc_c2_apb1hlpenr_read)
                 | ({DW{rcc_c2_apb2lpenr_sel}} & rcc_c2_apb2lpenr_read)
                 | ({DW{rcc_c2_apb4lpenr_sel}} & rcc_c2_apb4lpenr_read);

BB_dfflr #(
  .DW     (DW),
  .RST_VAL(0 )
) U_rdata_flop (
  .clk  (clk      ),
  .rst_n(rst_n    ),
  .en   (rd_req   ),
  .din  (rdata_tmp),
  .dout (rdata    )
);

// ================================================================================
// REGISTER LOGIC
// ================================================================================

// --------------------------------------------------------------------------------
// rcc_cr                                  0x0                                     
// --------------------------------------------------------------------------------
// 29:29               pll3rdy             RO                  0b0                 
// --------------------------------------------------------------------------------
// 28:28               pll3on              RW                  0b0                 
// --------------------------------------------------------------------------------
// 27:27               pll2rdy             RO                  0b0                 
// --------------------------------------------------------------------------------
// 26:26               pll2on              RW                  0b0                 
// --------------------------------------------------------------------------------
// 25:25               pll1rdy             RO                  0b0                 
// --------------------------------------------------------------------------------
// 24:24               pll1on              RW                  0b0                 
// --------------------------------------------------------------------------------
// 19:19               hsecsson            W1S                 0b0                 
// --------------------------------------------------------------------------------
// 18:18               hsebyp              RW                  0b0                 
// --------------------------------------------------------------------------------
// 17:17               hserdy              RO                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               hseon               RW                  0b0                 
// --------------------------------------------------------------------------------
// 15:15               d2ckrdy             RO                  0b0                 
// --------------------------------------------------------------------------------
// 14:14               d1ckrdy             RO                  0b0                 
// --------------------------------------------------------------------------------
// 13:13               hsi48rdy            RO                  0b0                 
// --------------------------------------------------------------------------------
// 12:12               hsi48on             RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 csikeron            RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 csirdy              RO                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 csion               RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 hsidivf             RO                  0b0                 
// --------------------------------------------------------------------------------
// 4:3                 hsidiv              RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 hsirdy              RO                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 hsikeron            RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 hsion               RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_cr read data
// --------------------------------------------------------------------------------
assign rcc_cr_read = {{2{1'b0}}
                   , cur_rcc_cr_pll3rdy
                   , cur_rcc_cr_pll3on
                   , cur_rcc_cr_pll2rdy
                   , cur_rcc_cr_pll2on
                   , cur_rcc_cr_pll1rdy
                   , cur_rcc_cr_pll1on
                   , {4{1'b0}}
                   , cur_rcc_cr_hsecsson
                   , cur_rcc_cr_hsebyp
                   , cur_rcc_cr_hserdy
                   , cur_rcc_cr_hseon
                   , cur_rcc_cr_d2ckrdy
                   , cur_rcc_cr_d1ckrdy
                   , cur_rcc_cr_hsi48rdy
                   , cur_rcc_cr_hsi48on
                   , {2{1'b0}}
                   , cur_rcc_cr_csikeron
                   , cur_rcc_cr_csirdy
                   , cur_rcc_cr_csion
                   , {1{1'b0}}
                   , cur_rcc_cr_hsidivf
                   , cur_rcc_cr_hsidiv
                   , cur_rcc_cr_hsirdy
                   , cur_rcc_cr_hsikeron
                   , cur_rcc_cr_hsion};

// --------------------------------------------------------------------------------
// 29:29               pll3rdy             RO                  0b0                 
// --------------------------------------------------------------------------------

assign pllxon_clr = rst_n & ~(rcc_sys_stop | (rcc_hsecss_fail & cur_rcc_pllclkselr_pllsrc == 2'b10));
assign cur_rcc_cr_pll3rdy = pll3_rdy;

// --------------------------------------------------------------------------------
// 28:28               pll3on              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cr_pll3on_en  = (|wr_req & rcc_cr_sel);
assign nxt_rcc_cr_pll3on = wdata[28:28]          ;
assign pll3on            = cur_rcc_cr_pll3on     ;

BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cr_pll3on (
  .clk  (clk              ),
  .rst_n(pll3on_clr_n     ),
  .en   (rcc_cr_pll3on_en ),
  .din  (nxt_rcc_cr_pll3on),
  .dout (cur_rcc_cr_pll3on)
);

// --------------------------------------------------------------------------------
// 27:27               pll2rdy             RO                  0b0                 
// --------------------------------------------------------------------------------

assign cur_rcc_cr_pll2rdy = pll2_rdy;


// --------------------------------------------------------------------------------
// 26:26               pll2on              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cr_pll2on_en  = (|wr_req & rcc_cr_sel);
assign nxt_rcc_cr_pll2on = wdata[26:26]          ;
assign pll2on            = cur_rcc_cr_pll2on     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cr_pll2on (
  .clk  (clk              ),
  .rst_n(pllxon_clr       ),
  .en   (rcc_cr_pll2on_en ),
  .din  (nxt_rcc_cr_pll2on),
  .dout (cur_rcc_cr_pll2on)
);

// --------------------------------------------------------------------------------
// 25:25               pll1rdy             RO                  0b0                 
// --------------------------------------------------------------------------------
assign cur_rcc_cr_pll1rdy = pll1_rdy;

// --------------------------------------------------------------------------------
// 24:24               pll1on              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cr_pll1on_en  = (|wr_req & rcc_cr_sel);
assign nxt_rcc_cr_pll1on = wdata[24:24]          ;
assign pll1on            = cur_rcc_cr_pll1on     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cr_pll1on (
  .clk  (clk              ),
  .rst_n(pllxon_clr       ),
  .en   (rcc_cr_pll1on_en ),
  .din  (nxt_rcc_cr_pll1on),
  .dout (cur_rcc_cr_pll1on)
);

// --------------------------------------------------------------------------------
// 19:19               hsecsson            W1S                 0b0                 
// --------------------------------------------------------------------------------
assign rcc_cr_hsecsson_en  = (|wr_req & rcc_cr_sel);
assign nxt_rcc_cr_hsecsson = wdata[19:19]          ;
assign hsecsson            = cur_rcc_cr_hsecsson   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cr_hsecsson (
  .clk  (clk                ),
  .rst_n(rst_n              ),
  .en   (rcc_cr_hsecsson_en ),
  .din  (nxt_rcc_cr_hsecsson),
  .dout (cur_rcc_cr_hsecsson)
);

// --------------------------------------------------------------------------------
// 18:18               hsebyp              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cr_hsebyp_en  = (|wr_req & rcc_cr_sel);
assign nxt_rcc_cr_hsebyp = wdata[18:18]          ;
assign hsebyp            = cur_rcc_cr_hsebyp     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cr_hsebyp (
  .clk  (clk              ),
  .rst_n(rst_n            ),
  .en   (rcc_cr_hsebyp_en ),
  .din  (nxt_rcc_cr_hsebyp),
  .dout (cur_rcc_cr_hsebyp)
);

// --------------------------------------------------------------------------------
// 17:17               hserdy              RO                  0b0                 
// --------------------------------------------------------------------------------

assign hseon_clr_n = rst_n & ~(rcc_hsecss_fail | rcc_sys_stop);
assign cur_rcc_cr_hserdy = hse_rdy;

// --------------------------------------------------------------------------------
// 16:16               hseon               RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cr_hseon_en  = ~((cur_rcc_cfgr_sws == 3'b010)|(cur_rcc_cr_pll1on & cur_rcc_pllclkselr_pllsrc == 2'b10));
assign nxt_rcc_cr_hseon = wdata[16:16]                                                                            ;
assign hseon            = cur_rcc_cr_hseon                                                                        ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cr_hseon (
  .clk  (clk             ),
  .rst_n(hseon_clr_n     ),
  .en   (rcc_cr_hseon_en ),
  .din  (nxt_rcc_cr_hseon),
  .dout (cur_rcc_cr_hseon)
);

// --------------------------------------------------------------------------------
// 15:15               d2ckrdy             RO                  0b0                 
// --------------------------------------------------------------------------------
assign cur_rcc_cr_d2ckrdy = d2_clk_rdy;

// --------------------------------------------------------------------------------
// 14:14               d1ckrdy             RO                  0b0                 
// --------------------------------------------------------------------------------
assign cur_rcc_cr_d1ckrdy = d1_clk_rdy;

// --------------------------------------------------------------------------------
// 13:13               hsi48rdy            RO                  0b0                 
// --------------------------------------------------------------------------------
assign cur_rcc_cr_hsi48rdy = hsi48_dry;

// --------------------------------------------------------------------------------
// 12:12               hsi48on             RW                  0b0                 
// --------------------------------------------------------------------------------

assign hsi48on_clr =  rst_n & ~rcc_sys_stop;

assign rcc_cr_hsi48on_en  = (|wr_req & rcc_cr_sel);
assign nxt_rcc_cr_hsi48on = wdata[12:12]          ;
assign hsi48on            = cur_rcc_cr_hsi48on    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cr_hsi48on (
  .clk  (clk               ),
  .rst_n(hsi48on_clr       ),
  .en   (rcc_cr_hsi48on_en ),
  .din  (nxt_rcc_cr_hsi48on),
  .dout (cur_rcc_cr_hsi48on)
);

// --------------------------------------------------------------------------------
// 9:9                 csikeron            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cr_csikeron_en  = (|wr_req & rcc_cr_sel);
assign nxt_rcc_cr_csikeron = wdata[9:9]            ;
assign csikeron            = cur_rcc_cr_csikeron   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cr_csikeron (
  .clk  (clk                ),
  .rst_n(rst_n              ),
  .en   (rcc_cr_csikeron_en ),
  .din  (nxt_rcc_cr_csikeron),
  .dout (cur_rcc_cr_csikeron)
);

// --------------------------------------------------------------------------------
// 8:8                 csirdy              RO                  0b0                 
// --------------------------------------------------------------------------------
assign cur_rcc_cr_csirdy = csi_rdy;

// --------------------------------------------------------------------------------
// 7:7                 csion               RW                  0b0                 
// --------------------------------------------------------------------------------


wire csion_clr_n;
wire csion_set_n;

assign csion_clr_n =  rst_n;
assign csion_set_n = rcc_exit_sys_stop & (cur_rcc_cfgr_stopwuck ==1 | cur_rcc_cfgr_stopkerwuck == 1);

assign rcc_cr_csion_en  = ~((cur_rcc_cfgr_sws == 3'b001)|(cur_rcc_cr_pll1on & cur_rcc_pllclkselr_pllsrc == 2'b01));
assign nxt_rcc_cr_csion = wdata[7:7]                                                                              ;
assign csion            = cur_rcc_cr_csion                                                                        ;
BB_dfflrs #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cr_csion (
  .clk  (clk             ),
  .rst_n(csion_clr_n     ),
  .set_n(csion_set_n     ),
  .en   (rcc_cr_csion_en ),
  .din  (nxt_rcc_cr_csion),
  .dout (cur_rcc_cr_csion)
);

// --------------------------------------------------------------------------------
// 5:5                 hsidivf             RO                  0b0                 
// --------------------------------------------------------------------------------

assign rcc_cr_hsidivf_set = cur_rcc_cr_hsidiv == eff_hsidiv        ;
assign rcc_cr_hsidivf_clr = cur_rcc_cr_hsidiv != eff_hsidiv        ;
assign rcc_cr_hsidivf_en  = rcc_cr_hsidivf_set | rcc_cr_hsidivf_clr;
assign nxt_rcc_cr_hsidivf = rcc_cr_hsidivf_set                     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cr_hsidivf (
  .clk  (clk               ),
  .rst_n(rst_n             ),
  .en   (rcc_cr_hsidivf_en ),
  .din  (nxt_rcc_cr_hsidivf),
  .dout (cur_rcc_cr_hsidivf)
);

assign rcc_eff_hsidiv_en = ~(cur_rcc_pllclkselr_pllsrc == 2'b00 & (pll1on | pll2on | pll3on));

BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cr_eff_hsidiv (
  .clk  (clk               ),
  .rst_n(rst_n             ),
  .en   (rcc_eff_hsidiv_en ),
  .din  (cur_rcc_cr_hsidiv),
  .dout (eff_hsidiv)
);


// --------------------------------------------------------------------------------
// 4:3                 hsidiv              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cr_hsidiv_en  = (|wr_req & rcc_cr_sel);
assign nxt_rcc_cr_hsidiv = wdata[4:3]            ;
assign hsidiv            = eff_hsidiv            ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_cr_hsidiv (
  .clk  (clk              ),
  .rst_n(rst_n            ),
  .en   (rcc_cr_hsidiv_en ),
  .din  (nxt_rcc_cr_hsidiv),
  .dout (cur_rcc_cr_hsidiv)
);

// --------------------------------------------------------------------------------
// 2:2                 hsirdy              RO                  0b0                 
// --------------------------------------------------------------------------------
assign cur_rcc_cr_hsirdy = hsi_rdy;

// --------------------------------------------------------------------------------
// 1:1                 hsikeron            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cr_hsikeron_en  = (|wr_req & rcc_cr_sel);
assign nxt_rcc_cr_hsikeron = wdata[1:1]            ;
assign hsikeron            = cur_rcc_cr_hsikeron   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cr_hsikeron (
  .clk  (clk                ),
  .rst_n(rst_n              ),
  .en   (rcc_cr_hsikeron_en ),
  .din  (nxt_rcc_cr_hsikeron),
  .dout (cur_rcc_cr_hsikeron)
);

// --------------------------------------------------------------------------------
// 0:0                 hsion               RW                  0b1                 
// --------------------------------------------------------------------------------
wire hsion_set_n = ~((rcc_exit_sys_stop & (cur_rcc_cfgr_stopwuck ==0 | cur_rcc_cfgr_stopkerwuck ==0)) | rcc_hsecss_fail);

assign rcc_cr_hsion_en  = ~((cur_rcc_cfgr_sws == 3'b000)|(cur_rcc_cr_pll1on & cur_rcc_pllclkselr_pllsrc == 2'b00));
assign nxt_rcc_cr_hsion = wdata[0:0]                                                                              ;
assign hsion            = cur_rcc_cr_hsion                                                                        ;
BB_dfflrs #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_cr_hsion (
  .clk  (clk             ),
  .rst_n(rst_n           ),
  .set_n(hsion_set_n     ),
  .en   (rcc_cr_hsion_en ),
  .din  (nxt_rcc_cr_hsion),
  .dout (cur_rcc_cr_hsion)
);


// --------------------------------------------------------------------------------
// rcc_icscr                               0x4                                     
// --------------------------------------------------------------------------------
// 30:26               csitrim             RW                  0b10000             
// --------------------------------------------------------------------------------
// 25:18               csical              RO                  flash_csi_opt       
// --------------------------------------------------------------------------------
// 17:12               hsitrim             RW                  0b100000            
// --------------------------------------------------------------------------------
// 11:0                hsical              RO                  flash_hsi_opt       
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_icscr read data
// --------------------------------------------------------------------------------
assign rcc_icscr_read = {{1{1'b0}}
                      , cur_rcc_icscr_csitrim
                      , cur_rcc_icscr_csical
                      , cur_rcc_icscr_hsitrim
                      , cur_rcc_icscr_hsical};

// --------------------------------------------------------------------------------
// 30:26               csitrim             RW                  0b10000             
// --------------------------------------------------------------------------------
assign rcc_icscr_csitrim_en  = (|wr_req & rcc_icscr_sel);
assign nxt_rcc_icscr_csitrim = wdata[30:26]             ;
assign csitrim               = cur_rcc_icscr_csitrim    ;
BB_dfflr #(
  .DW     (5   ),
  .RST_VAL('h10)
) U_rcc_icscr_csitrim (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_icscr_csitrim_en ),
  .din  (nxt_rcc_icscr_csitrim),
  .dout (cur_rcc_icscr_csitrim)
);

// --------------------------------------------------------------------------------
// 25:18               csical              RO                  flash_csi_opt       
// --------------------------------------------------------------------------------
assign cur_rcc_icscr_csical = flash_csi_opt;

// --------------------------------------------------------------------------------
// 17:12               hsitrim             RW                  0b100000            
// --------------------------------------------------------------------------------
assign rcc_icscr_hsitrim_en  = (|wr_req & rcc_icscr_sel);
assign nxt_rcc_icscr_hsitrim = wdata[17:12]             ;
assign hsitrim               = cur_rcc_icscr_hsitrim    ;
BB_dfflr #(
  .DW     (6   ),
  .RST_VAL('h20)
) U_rcc_icscr_hsitrim (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_icscr_hsitrim_en ),
  .din  (nxt_rcc_icscr_hsitrim),
  .dout (cur_rcc_icscr_hsitrim)
);

// --------------------------------------------------------------------------------
// 11:0                hsical              RO                  flash_hsi_opt       
// --------------------------------------------------------------------------------
assign cur_rcc_icscr_hsical = flash_hsi_opt;


// --------------------------------------------------------------------------------
// rcc_crrcr                               0x8                                     
// --------------------------------------------------------------------------------
// 9:0                 hsi48cal            RO                  crs_hsi48_trim      
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_crrcr read data
// --------------------------------------------------------------------------------
assign rcc_crrcr_read = {{22{1'b0}}
                      , cur_rcc_crrcr_hsi48cal};

// --------------------------------------------------------------------------------
// 9:0                 hsi48cal            RO                  crs_hsi48_trim      
// --------------------------------------------------------------------------------
assign cur_rcc_crrcr_hsi48cal = crs_hsi48_trim;


// --------------------------------------------------------------------------------
// rcc_cfgr                                0x10                                    
// --------------------------------------------------------------------------------
// 31:29               mco2                RW                  0b0                 
// --------------------------------------------------------------------------------
// 28:25               mco2pre             RW                  0b0                 
// --------------------------------------------------------------------------------
// 24:22               mco1                RW                  0b0                 
// --------------------------------------------------------------------------------
// 21:18               mco1pre             RW                  0b0                 
// --------------------------------------------------------------------------------
// 15:15               timpre              RW                  0b0                 
// --------------------------------------------------------------------------------
// 14:14               hrtimsel            RW                  0b0                 
// --------------------------------------------------------------------------------
// 13:8                rtcpre              RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 stopkerwuck         RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:6                 stopwuck            RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:3                 sws                 RO                  0b0                 
// --------------------------------------------------------------------------------
// 2:0                 sw                  RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_cfgr read data
// --------------------------------------------------------------------------------
assign rcc_cfgr_read = {cur_rcc_cfgr_mco2
                     , cur_rcc_cfgr_mco2pre
                     , cur_rcc_cfgr_mco1
                     , cur_rcc_cfgr_mco1pre
                     , {2{1'b0}}
                     , cur_rcc_cfgr_timpre
                     , cur_rcc_cfgr_hrtimsel
                     , cur_rcc_cfgr_rtcpre
                     , cur_rcc_cfgr_stopkerwuck
                     , cur_rcc_cfgr_stopwuck
                     , cur_rcc_cfgr_sws
                     , cur_rcc_cfgr_sw};

// --------------------------------------------------------------------------------
// 31:29               mco2                RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cfgr_mco2_en  = (|wr_req & rcc_cfgr_sel);
assign nxt_rcc_cfgr_mco2 = wdata[31:29]            ;
assign mco2              = cur_rcc_cfgr_mco2       ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_cfgr_mco2 (
  .clk  (clk              ),
  .rst_n(rst_n            ),
  .en   (rcc_cfgr_mco2_en ),
  .din  (nxt_rcc_cfgr_mco2),
  .dout (cur_rcc_cfgr_mco2)
);

// --------------------------------------------------------------------------------
// 28:25               mco2pre             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cfgr_mco2pre_en  = (|wr_req & rcc_cfgr_sel);
assign nxt_rcc_cfgr_mco2pre = wdata[28:25]            ;
assign mco2pre              = cur_rcc_cfgr_mco2pre    ;
BB_dfflr #(
  .DW     (4  ),
  .RST_VAL('h0)
) U_rcc_cfgr_mco2pre (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cfgr_mco2pre_en ),
  .din  (nxt_rcc_cfgr_mco2pre),
  .dout (cur_rcc_cfgr_mco2pre)
);

// --------------------------------------------------------------------------------
// 24:22               mco1                RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cfgr_mco1_en  = (|wr_req & rcc_cfgr_sel);
assign nxt_rcc_cfgr_mco1 = wdata[24:22]            ;
assign mco1              = cur_rcc_cfgr_mco1       ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_cfgr_mco1 (
  .clk  (clk              ),
  .rst_n(rst_n            ),
  .en   (rcc_cfgr_mco1_en ),
  .din  (nxt_rcc_cfgr_mco1),
  .dout (cur_rcc_cfgr_mco1)
);

// --------------------------------------------------------------------------------
// 21:18               mco1pre             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cfgr_mco1pre_en  = (|wr_req & rcc_cfgr_sel);
assign nxt_rcc_cfgr_mco1pre = wdata[21:18]            ;
assign mco1pre              = cur_rcc_cfgr_mco1pre    ;
BB_dfflr #(
  .DW     (4  ),
  .RST_VAL('h0)
) U_rcc_cfgr_mco1pre (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cfgr_mco1pre_en ),
  .din  (nxt_rcc_cfgr_mco1pre),
  .dout (cur_rcc_cfgr_mco1pre)
);

// --------------------------------------------------------------------------------
// 15:15               timpre              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cfgr_timpre_en  = (|wr_req & rcc_cfgr_sel);
assign nxt_rcc_cfgr_timpre = wdata[15:15]            ;
assign timpre              = cur_rcc_cfgr_timpre     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cfgr_timpre (
  .clk  (clk                ),
  .rst_n(rst_n              ),
  .en   (rcc_cfgr_timpre_en ),
  .din  (nxt_rcc_cfgr_timpre),
  .dout (cur_rcc_cfgr_timpre)
);

// --------------------------------------------------------------------------------
// 14:14               hrtimsel            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cfgr_hrtimsel_en  = (|wr_req & rcc_cfgr_sel);
assign nxt_rcc_cfgr_hrtimsel = wdata[14:14]            ;
assign hrtimsel              = cur_rcc_cfgr_hrtimsel   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cfgr_hrtimsel (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_cfgr_hrtimsel_en ),
  .din  (nxt_rcc_cfgr_hrtimsel),
  .dout (cur_rcc_cfgr_hrtimsel)
);

// --------------------------------------------------------------------------------
// 13:8                rtcpre              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cfgr_rtcpre_en  = (|wr_req & rcc_cfgr_sel);
assign nxt_rcc_cfgr_rtcpre = wdata[13:8]             ;
assign rtcpre              = cur_rcc_cfgr_rtcpre     ;
BB_dfflr #(
  .DW     (6  ),
  .RST_VAL('h0)
) U_rcc_cfgr_rtcpre (
  .clk  (clk                ),
  .rst_n(rst_n              ),
  .en   (rcc_cfgr_rtcpre_en ),
  .din  (nxt_rcc_cfgr_rtcpre),
  .dout (cur_rcc_cfgr_rtcpre)
);

// --------------------------------------------------------------------------------
// 7:7                 stopkerwuck         RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cfgr_stopkerwuck_en  = (|wr_req & rcc_cfgr_sel);
assign nxt_rcc_cfgr_stopkerwuck = wdata[7:7]              ;
assign stopkerwuck              = cur_rcc_cfgr_stopkerwuck;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cfgr_stopkerwuck (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_cfgr_stopkerwuck_en ),
  .din  (nxt_rcc_cfgr_stopkerwuck),
  .dout (cur_rcc_cfgr_stopkerwuck)
);

// --------------------------------------------------------------------------------
// 6:6                 stopwuck            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cfgr_stopwuck_en  = (|wr_req & rcc_cfgr_sel);
assign nxt_rcc_cfgr_stopwuck = wdata[6:6]              ;
assign stopwuck              = cur_rcc_cfgr_stopwuck   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cfgr_stopwuck (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_cfgr_stopwuck_en ),
  .din  (nxt_rcc_cfgr_stopwuck),
  .dout (cur_rcc_cfgr_stopwuck)
);

// --------------------------------------------------------------------------------
// 5:3                 sws                 RO                  0b0                 
// --------------------------------------------------------------------------------
assign cur_rcc_cfgr_sws = cur_rcc_cfgr_sw;

// --------------------------------------------------------------------------------
// 2:0                 sw                  RW                  0b0                 
// --------------------------------------------------------------------------------
wire sw_clr_n[2:0];
wire sw_set_n[2:0];

assign sw_clr_n = (~{2{ rcc_hse_fail|rcc_exit_sys_stop },rcc_hse_fail | (rcc_exit_sys_stop & cur_rcc_cfgr_stopwuck ==0)}) & {3{rst_n}};
assign sw_set_n = ~{2'b0,(rcc_exit_sys_stop & cur_rcc_cfgr_stopwuck ==1)};

assign rcc_cfgr_sw_en  = (|wr_req & rcc_cfgr_sel);
assign nxt_rcc_cfgr_sw = wdata[2:0]              ;
assign sw              = cur_rcc_cfgr_sw         ;


generate 
  genvar i;
  for(i=0;i<=2;i=i+1) begin: blk_rcc_cfgr_sw_field
    BB_dfflr #(
      .DW     (1  ),
      .RST_VAL('h0)
    ) U_rcc_cfgr_sw (
      .clk  (clk            ),
      .rst_n(rst_n          ),
      .en   (rcc_cfgr_sw_en ),
      .din  (nxt_rcc_cfgr_sw[i]),
      .dout (cur_rcc_cfgr_sw[i])
    );
  end
endgenerate


// --------------------------------------------------------------------------------
// rcc_d1cfgr                              0x18                                    
// --------------------------------------------------------------------------------
// 11:8                d1cpre              RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:4                 d1ppre              RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:0                 hpre                RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_d1cfgr read data
// --------------------------------------------------------------------------------
assign rcc_d1cfgr_read = {{20{1'b0}}
                       , cur_rcc_d1cfgr_d1cpre
                       , {1{1'b0}}
                       , cur_rcc_d1cfgr_d1ppre
                       , cur_rcc_d1cfgr_hpre};

// --------------------------------------------------------------------------------
// 11:8                d1cpre              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d1cfgr_d1cpre_en  = (|wr_req & rcc_d1cfgr_sel);
assign nxt_rcc_d1cfgr_d1cpre = wdata[11:8]               ;
assign d1cpre                = cur_rcc_d1cfgr_d1cpre     ;
BB_dfflr #(
  .DW     (4  ),
  .RST_VAL('h0)
) U_rcc_d1cfgr_d1cpre (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_d1cfgr_d1cpre_en ),
  .din  (nxt_rcc_d1cfgr_d1cpre),
  .dout (cur_rcc_d1cfgr_d1cpre)
);

// --------------------------------------------------------------------------------
// 6:4                 d1ppre              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d1cfgr_d1ppre_en  = (|wr_req & rcc_d1cfgr_sel);
assign nxt_rcc_d1cfgr_d1ppre = wdata[6:4]                ;
assign d1ppre                = cur_rcc_d1cfgr_d1ppre     ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d1cfgr_d1ppre (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_d1cfgr_d1ppre_en ),
  .din  (nxt_rcc_d1cfgr_d1ppre),
  .dout (cur_rcc_d1cfgr_d1ppre)
);

// --------------------------------------------------------------------------------
// 3:0                 hpre                RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d1cfgr_hpre_en  = (|wr_req & rcc_d1cfgr_sel);
assign nxt_rcc_d1cfgr_hpre = wdata[3:0]                ;
assign hpre                = cur_rcc_d1cfgr_hpre       ;
BB_dfflr #(
  .DW     (4  ),
  .RST_VAL('h0)
) U_rcc_d1cfgr_hpre (
  .clk  (clk                ),
  .rst_n(rst_n              ),
  .en   (rcc_d1cfgr_hpre_en ),
  .din  (nxt_rcc_d1cfgr_hpre),
  .dout (cur_rcc_d1cfgr_hpre)
);


// --------------------------------------------------------------------------------
// rcc_d2cfgr                              0x1c                                    
// --------------------------------------------------------------------------------
// 10:8                d2ppre2             RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:4                 d2ppre1             RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_d2cfgr read data
// --------------------------------------------------------------------------------
assign rcc_d2cfgr_read = {{21{1'b0}}
                       , cur_rcc_d2cfgr_d2ppre2
                       , {1{1'b0}}
                       , cur_rcc_d2cfgr_d2ppre1
                       , {4{1'b0}}};

// --------------------------------------------------------------------------------
// 10:8                d2ppre2             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2cfgr_d2ppre2_en  = (|wr_req & rcc_d2cfgr_sel);
assign nxt_rcc_d2cfgr_d2ppre2 = wdata[10:8]               ;
assign d2ppre2                = cur_rcc_d2cfgr_d2ppre2    ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d2cfgr_d2ppre2 (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_d2cfgr_d2ppre2_en ),
  .din  (nxt_rcc_d2cfgr_d2ppre2),
  .dout (cur_rcc_d2cfgr_d2ppre2)
);

// --------------------------------------------------------------------------------
// 6:4                 d2ppre1             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2cfgr_d2ppre1_en  = (|wr_req & rcc_d2cfgr_sel);
assign nxt_rcc_d2cfgr_d2ppre1 = wdata[6:4]                ;
assign d2ppre1                = cur_rcc_d2cfgr_d2ppre1    ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d2cfgr_d2ppre1 (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_d2cfgr_d2ppre1_en ),
  .din  (nxt_rcc_d2cfgr_d2ppre1),
  .dout (cur_rcc_d2cfgr_d2ppre1)
);


// --------------------------------------------------------------------------------
// rcc_d3cfgr                              0x20                                    
// --------------------------------------------------------------------------------
// 6:4                 d3ppre              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_d3cfgr read data
// --------------------------------------------------------------------------------
assign rcc_d3cfgr_read = {{25{1'b0}}
                       , cur_rcc_d3cfgr_d3ppre
                       , {4{1'b0}}};

// --------------------------------------------------------------------------------
// 6:4                 d3ppre              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3cfgr_d3ppre_en  = (|wr_req & rcc_d3cfgr_sel);
assign nxt_rcc_d3cfgr_d3ppre = wdata[6:4]                ;
assign d3ppre                = cur_rcc_d3cfgr_d3ppre     ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d3cfgr_d3ppre (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_d3cfgr_d3ppre_en ),
  .din  (nxt_rcc_d3cfgr_d3ppre),
  .dout (cur_rcc_d3cfgr_d3ppre)
);


// --------------------------------------------------------------------------------
// rcc_pllclkselr                          0x28                                    
// --------------------------------------------------------------------------------
// 25:20               divm3               RW                  0b100000            
// --------------------------------------------------------------------------------
// 17:12               divm2               RW                  0b100000            
// --------------------------------------------------------------------------------
// 9:4                 divm1               RW                  0b100000            
// --------------------------------------------------------------------------------
// 1:0                 pllsrc              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_pllclkselr read data
// --------------------------------------------------------------------------------
assign rcc_pllclkselr_read = {{6{1'b0}}
                           , cur_rcc_pllclkselr_divm3
                           , {2{1'b0}}
                           , cur_rcc_pllclkselr_divm2
                           , {2{1'b0}}
                           , cur_rcc_pllclkselr_divm1
                           , {2{1'b0}}
                           , cur_rcc_pllclkselr_pllsrc};

// --------------------------------------------------------------------------------
// 25:20               divm3               RW                  0b100000            
// --------------------------------------------------------------------------------
assign rcc_pllclkselr_divm3_en  = (|wr_req & rcc_pllclkselr_sel);
assign nxt_rcc_pllclkselr_divm3 = wdata[25:20]                  ;
assign divm3                    = cur_rcc_pllclkselr_divm3      ;
BB_dfflr #(
  .DW     (6   ),
  .RST_VAL('h20)
) U_rcc_pllclkselr_divm3 (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_pllclkselr_divm3_en ),
  .din  (nxt_rcc_pllclkselr_divm3),
  .dout (cur_rcc_pllclkselr_divm3)
);

// --------------------------------------------------------------------------------
// 17:12               divm2               RW                  0b100000            
// --------------------------------------------------------------------------------
assign rcc_pllclkselr_divm2_en  = (|wr_req & rcc_pllclkselr_sel);
assign nxt_rcc_pllclkselr_divm2 = wdata[17:12]                  ;
assign divm2                    = cur_rcc_pllclkselr_divm2      ;
BB_dfflr #(
  .DW     (6   ),
  .RST_VAL('h20)
) U_rcc_pllclkselr_divm2 (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_pllclkselr_divm2_en ),
  .din  (nxt_rcc_pllclkselr_divm2),
  .dout (cur_rcc_pllclkselr_divm2)
);

// --------------------------------------------------------------------------------
// 9:4                 divm1               RW                  0b100000            
// --------------------------------------------------------------------------------
assign rcc_pllclkselr_divm1_en  = (|wr_req & rcc_pllclkselr_sel);
assign nxt_rcc_pllclkselr_divm1 = wdata[9:4]                    ;
assign divm1                    = cur_rcc_pllclkselr_divm1      ;
BB_dfflr #(
  .DW     (6   ),
  .RST_VAL('h20)
) U_rcc_pllclkselr_divm1 (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_pllclkselr_divm1_en ),
  .din  (nxt_rcc_pllclkselr_divm1),
  .dout (cur_rcc_pllclkselr_divm1)
);

// --------------------------------------------------------------------------------
// 1:0                 pllsrc              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_pllclkselr_pllsrc_en  = (|wr_req & rcc_pllclkselr_sel);
assign nxt_rcc_pllclkselr_pllsrc = wdata[1:0]                    ;
assign pllsrc                    = cur_rcc_pllclkselr_pllsrc     ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_pllclkselr_pllsrc (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_pllclkselr_pllsrc_en ),
  .din  (nxt_rcc_pllclkselr_pllsrc),
  .dout (cur_rcc_pllclkselr_pllsrc)
);


// --------------------------------------------------------------------------------
// rcc_pllcfgr                             0x2c                                    
// --------------------------------------------------------------------------------
// 24:24               divr3en             RW                  0b1                 
// --------------------------------------------------------------------------------
// 23:23               divq3en             RW                  0b1                 
// --------------------------------------------------------------------------------
// 22:22               divp3en             RW                  0b1                 
// --------------------------------------------------------------------------------
// 21:21               divr2en             RW                  0b1                 
// --------------------------------------------------------------------------------
// 20:20               divq2en             RW                  0b1                 
// --------------------------------------------------------------------------------
// 19:19               divp2en             RW                  0b1                 
// --------------------------------------------------------------------------------
// 18:18               divr1en             RW                  0b1                 
// --------------------------------------------------------------------------------
// 17:17               divq1en             RW                  0b1                 
// --------------------------------------------------------------------------------
// 16:16               divp1en             RW                  0b1                 
// --------------------------------------------------------------------------------
// 11:10               pll3rge             RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 pll3vcosel          RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 pll3fracen          RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:6                 pll2rge             RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 pll2vcosel          RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 pll2fracen          RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:2                 pll1rge             RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 pll1vcosel          RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 pll1fracen          RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_pllcfgr read data
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_read = {{7{1'b0}}
                        , cur_rcc_pllcfgr_divr3en
                        , cur_rcc_pllcfgr_divq3en
                        , cur_rcc_pllcfgr_divp3en
                        , cur_rcc_pllcfgr_divr2en
                        , cur_rcc_pllcfgr_divq2en
                        , cur_rcc_pllcfgr_divp2en
                        , cur_rcc_pllcfgr_divr1en
                        , cur_rcc_pllcfgr_divq1en
                        , cur_rcc_pllcfgr_divp1en
                        , {4{1'b0}}
                        , cur_rcc_pllcfgr_pll3rge
                        , cur_rcc_pllcfgr_pll3vcosel
                        , cur_rcc_pllcfgr_pll3fracen
                        , cur_rcc_pllcfgr_pll2rge
                        , cur_rcc_pllcfgr_pll2vcosel
                        , cur_rcc_pllcfgr_pll2fracen
                        , cur_rcc_pllcfgr_pll1rge
                        , cur_rcc_pllcfgr_pll1vcosel
                        , cur_rcc_pllcfgr_pll1fracen};

// --------------------------------------------------------------------------------
// 24:24               divr3en             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_divr3en_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_divr3en = wdata[24:24]               ;
assign divr3en                 = cur_rcc_pllcfgr_divr3en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_pllcfgr_divr3en (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_pllcfgr_divr3en_en ),
  .din  (nxt_rcc_pllcfgr_divr3en),
  .dout (cur_rcc_pllcfgr_divr3en)
);

// --------------------------------------------------------------------------------
// 23:23               divq3en             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_divq3en_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_divq3en = wdata[23:23]               ;
assign divq3en                 = cur_rcc_pllcfgr_divq3en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_pllcfgr_divq3en (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_pllcfgr_divq3en_en ),
  .din  (nxt_rcc_pllcfgr_divq3en),
  .dout (cur_rcc_pllcfgr_divq3en)
);

// --------------------------------------------------------------------------------
// 22:22               divp3en             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_divp3en_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_divp3en = wdata[22:22]               ;
assign divp3en                 = cur_rcc_pllcfgr_divp3en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_pllcfgr_divp3en (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_pllcfgr_divp3en_en ),
  .din  (nxt_rcc_pllcfgr_divp3en),
  .dout (cur_rcc_pllcfgr_divp3en)
);

// --------------------------------------------------------------------------------
// 21:21               divr2en             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_divr2en_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_divr2en = wdata[21:21]               ;
assign divr2en                 = cur_rcc_pllcfgr_divr2en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_pllcfgr_divr2en (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_pllcfgr_divr2en_en ),
  .din  (nxt_rcc_pllcfgr_divr2en),
  .dout (cur_rcc_pllcfgr_divr2en)
);

// --------------------------------------------------------------------------------
// 20:20               divq2en             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_divq2en_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_divq2en = wdata[20:20]               ;
assign divq2en                 = cur_rcc_pllcfgr_divq2en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_pllcfgr_divq2en (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_pllcfgr_divq2en_en ),
  .din  (nxt_rcc_pllcfgr_divq2en),
  .dout (cur_rcc_pllcfgr_divq2en)
);

// --------------------------------------------------------------------------------
// 19:19               divp2en             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_divp2en_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_divp2en = wdata[19:19]               ;
assign divp2en                 = cur_rcc_pllcfgr_divp2en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_pllcfgr_divp2en (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_pllcfgr_divp2en_en ),
  .din  (nxt_rcc_pllcfgr_divp2en),
  .dout (cur_rcc_pllcfgr_divp2en)
);

// --------------------------------------------------------------------------------
// 18:18               divr1en             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_divr1en_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_divr1en = wdata[18:18]               ;
assign divr1en                 = cur_rcc_pllcfgr_divr1en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_pllcfgr_divr1en (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_pllcfgr_divr1en_en ),
  .din  (nxt_rcc_pllcfgr_divr1en),
  .dout (cur_rcc_pllcfgr_divr1en)
);

// --------------------------------------------------------------------------------
// 17:17               divq1en             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_divq1en_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_divq1en = wdata[17:17]               ;
assign divq1en                 = cur_rcc_pllcfgr_divq1en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_pllcfgr_divq1en (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_pllcfgr_divq1en_en ),
  .din  (nxt_rcc_pllcfgr_divq1en),
  .dout (cur_rcc_pllcfgr_divq1en)
);

// --------------------------------------------------------------------------------
// 16:16               divp1en             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_divp1en_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_divp1en = wdata[16:16]               ;
assign divp1en                 = cur_rcc_pllcfgr_divp1en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_pllcfgr_divp1en (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_pllcfgr_divp1en_en ),
  .din  (nxt_rcc_pllcfgr_divp1en),
  .dout (cur_rcc_pllcfgr_divp1en)
);

// --------------------------------------------------------------------------------
// 11:10               pll3rge             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_pll3rge_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_pll3rge = wdata[11:10]               ;
assign pll3rge                 = cur_rcc_pllcfgr_pll3rge    ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_pllcfgr_pll3rge (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_pllcfgr_pll3rge_en ),
  .din  (nxt_rcc_pllcfgr_pll3rge),
  .dout (cur_rcc_pllcfgr_pll3rge)
);

// --------------------------------------------------------------------------------
// 9:9                 pll3vcosel          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_pll3vcosel_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_pll3vcosel = wdata[9:9]                 ;
assign pll3vcosel                 = cur_rcc_pllcfgr_pll3vcosel ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_pllcfgr_pll3vcosel (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_pllcfgr_pll3vcosel_en ),
  .din  (nxt_rcc_pllcfgr_pll3vcosel),
  .dout (cur_rcc_pllcfgr_pll3vcosel)
);

// --------------------------------------------------------------------------------
// 8:8                 pll3fracen          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_pll3fracen_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_pll3fracen = wdata[8:8]                 ;
assign pll3fracen                 = cur_rcc_pllcfgr_pll3fracen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_pllcfgr_pll3fracen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_pllcfgr_pll3fracen_en ),
  .din  (nxt_rcc_pllcfgr_pll3fracen),
  .dout (cur_rcc_pllcfgr_pll3fracen)
);

// --------------------------------------------------------------------------------
// 7:6                 pll2rge             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_pll2rge_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_pll2rge = wdata[7:6]                 ;
assign pll2rge                 = cur_rcc_pllcfgr_pll2rge    ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_pllcfgr_pll2rge (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_pllcfgr_pll2rge_en ),
  .din  (nxt_rcc_pllcfgr_pll2rge),
  .dout (cur_rcc_pllcfgr_pll2rge)
);

// --------------------------------------------------------------------------------
// 5:5                 pll2vcosel          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_pll2vcosel_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_pll2vcosel = wdata[5:5]                 ;
assign pll2vcosel                 = cur_rcc_pllcfgr_pll2vcosel ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_pllcfgr_pll2vcosel (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_pllcfgr_pll2vcosel_en ),
  .din  (nxt_rcc_pllcfgr_pll2vcosel),
  .dout (cur_rcc_pllcfgr_pll2vcosel)
);

// --------------------------------------------------------------------------------
// 4:4                 pll2fracen          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_pll2fracen_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_pll2fracen = wdata[4:4]                 ;
assign pll2fracen                 = cur_rcc_pllcfgr_pll2fracen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_pllcfgr_pll2fracen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_pllcfgr_pll2fracen_en ),
  .din  (nxt_rcc_pllcfgr_pll2fracen),
  .dout (cur_rcc_pllcfgr_pll2fracen)
);

// --------------------------------------------------------------------------------
// 3:2                 pll1rge             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_pll1rge_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_pll1rge = wdata[3:2]                 ;
assign pll1rge                 = cur_rcc_pllcfgr_pll1rge    ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_pllcfgr_pll1rge (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_pllcfgr_pll1rge_en ),
  .din  (nxt_rcc_pllcfgr_pll1rge),
  .dout (cur_rcc_pllcfgr_pll1rge)
);

// --------------------------------------------------------------------------------
// 1:1                 pll1vcosel          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_pll1vcosel_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_pll1vcosel = wdata[1:1]                 ;
assign pll1vcosel                 = cur_rcc_pllcfgr_pll1vcosel ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_pllcfgr_pll1vcosel (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_pllcfgr_pll1vcosel_en ),
  .din  (nxt_rcc_pllcfgr_pll1vcosel),
  .dout (cur_rcc_pllcfgr_pll1vcosel)
);

// --------------------------------------------------------------------------------
// 0:0                 pll1fracen          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_pllcfgr_pll1fracen_en  = (|wr_req & rcc_pllcfgr_sel);
assign nxt_rcc_pllcfgr_pll1fracen = wdata[0:0]                 ;
assign pll1fracen                 = cur_rcc_pllcfgr_pll1fracen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_pllcfgr_pll1fracen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_pllcfgr_pll1fracen_en ),
  .din  (nxt_rcc_pllcfgr_pll1fracen),
  .dout (cur_rcc_pllcfgr_pll1fracen)
);


// --------------------------------------------------------------------------------
// rcc_pll1divr                            0x30                                    
// --------------------------------------------------------------------------------
// 30:24               divr1               RW                  0b1                 
// --------------------------------------------------------------------------------
// 22:16               divq1               RW                  0b1                 
// --------------------------------------------------------------------------------
// 15:9                divp1               RW                  0b1                 
// --------------------------------------------------------------------------------
// 8:0                 divn1               RW                  0b10000000          
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_pll1divr read data
// --------------------------------------------------------------------------------
assign rcc_pll1divr_read = {{1{1'b0}}
                         , cur_rcc_pll1divr_divr1
                         , {1{1'b0}}
                         , cur_rcc_pll1divr_divq1
                         , cur_rcc_pll1divr_divp1
                         , cur_rcc_pll1divr_divn1};

// --------------------------------------------------------------------------------
// 30:24               divr1               RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pll1divr_divr1_en  = (|wr_req & rcc_pll1divr_sel);
assign nxt_rcc_pll1divr_divr1 = wdata[30:24]                ;
assign divr1                  = cur_rcc_pll1divr_divr1      ;
BB_dfflr #(
  .DW     (7  ),
  .RST_VAL('h1)
) U_rcc_pll1divr_divr1 (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_pll1divr_divr1_en ),
  .din  (nxt_rcc_pll1divr_divr1),
  .dout (cur_rcc_pll1divr_divr1)
);

// --------------------------------------------------------------------------------
// 22:16               divq1               RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pll1divr_divq1_en  = (|wr_req & rcc_pll1divr_sel);
assign nxt_rcc_pll1divr_divq1 = wdata[22:16]                ;
assign divq1                  = cur_rcc_pll1divr_divq1      ;
BB_dfflr #(
  .DW     (7  ),
  .RST_VAL('h1)
) U_rcc_pll1divr_divq1 (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_pll1divr_divq1_en ),
  .din  (nxt_rcc_pll1divr_divq1),
  .dout (cur_rcc_pll1divr_divq1)
);

// --------------------------------------------------------------------------------
// 15:9                divp1               RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pll1divr_divp1_en  = (|wr_req & rcc_pll1divr_sel);
assign nxt_rcc_pll1divr_divp1 = wdata[15:9]                 ;
assign divp1                  = cur_rcc_pll1divr_divp1      ;
BB_dfflr #(
  .DW     (7  ),
  .RST_VAL('h1)
) U_rcc_pll1divr_divp1 (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_pll1divr_divp1_en ),
  .din  (nxt_rcc_pll1divr_divp1),
  .dout (cur_rcc_pll1divr_divp1)
);

// --------------------------------------------------------------------------------
// 8:0                 divn1               RW                  0b10000000          
// --------------------------------------------------------------------------------
assign rcc_pll1divr_divn1_en  = (|wr_req & rcc_pll1divr_sel);
assign nxt_rcc_pll1divr_divn1 = wdata[8:0]                  ;
assign divn1                  = cur_rcc_pll1divr_divn1      ;
BB_dfflr #(
  .DW     (9   ),
  .RST_VAL('h80)
) U_rcc_pll1divr_divn1 (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_pll1divr_divn1_en ),
  .din  (nxt_rcc_pll1divr_divn1),
  .dout (cur_rcc_pll1divr_divn1)
);


// --------------------------------------------------------------------------------
// rcc_pll1fracr                           0x34                                    
// --------------------------------------------------------------------------------
// 15:3                fracn1              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_pll1fracr read data
// --------------------------------------------------------------------------------
assign rcc_pll1fracr_read = {{16{1'b0}}
                          , cur_rcc_pll1fracr_fracn1
                          , {3{1'b0}}};

// --------------------------------------------------------------------------------
// 15:3                fracn1              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_pll1fracr_fracn1_en  = (|wr_req & rcc_pll1fracr_sel);
assign nxt_rcc_pll1fracr_fracn1 = wdata[15:3]                  ;
assign fracn1                   = cur_rcc_pll1fracr_fracn1     ;
BB_dfflr #(
  .DW     (13 ),
  .RST_VAL('h0)
) U_rcc_pll1fracr_fracn1 (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_pll1fracr_fracn1_en ),
  .din  (nxt_rcc_pll1fracr_fracn1),
  .dout (cur_rcc_pll1fracr_fracn1)
);


// --------------------------------------------------------------------------------
// rcc_pll2divr                            0x38                                    
// --------------------------------------------------------------------------------
// 30:24               divr2               RW                  0b1                 
// --------------------------------------------------------------------------------
// 22:16               divq2               RW                  0b1                 
// --------------------------------------------------------------------------------
// 15:9                divp2               RW                  0b1                 
// --------------------------------------------------------------------------------
// 8:0                 divn2               RW                  0b10000000          
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_pll2divr read data
// --------------------------------------------------------------------------------
assign rcc_pll2divr_read = {{1{1'b0}}
                         , cur_rcc_pll2divr_divr2
                         , {1{1'b0}}
                         , cur_rcc_pll2divr_divq2
                         , cur_rcc_pll2divr_divp2
                         , cur_rcc_pll2divr_divn2};

// --------------------------------------------------------------------------------
// 30:24               divr2               RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pll2divr_divr2_en  = (|wr_req & rcc_pll2divr_sel);
assign nxt_rcc_pll2divr_divr2 = wdata[30:24]                ;
assign divr2                  = cur_rcc_pll2divr_divr2      ;
BB_dfflr #(
  .DW     (7  ),
  .RST_VAL('h1)
) U_rcc_pll2divr_divr2 (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_pll2divr_divr2_en ),
  .din  (nxt_rcc_pll2divr_divr2),
  .dout (cur_rcc_pll2divr_divr2)
);

// --------------------------------------------------------------------------------
// 22:16               divq2               RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pll2divr_divq2_en  = (|wr_req & rcc_pll2divr_sel);
assign nxt_rcc_pll2divr_divq2 = wdata[22:16]                ;
assign divq2                  = cur_rcc_pll2divr_divq2      ;
BB_dfflr #(
  .DW     (7  ),
  .RST_VAL('h1)
) U_rcc_pll2divr_divq2 (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_pll2divr_divq2_en ),
  .din  (nxt_rcc_pll2divr_divq2),
  .dout (cur_rcc_pll2divr_divq2)
);

// --------------------------------------------------------------------------------
// 15:9                divp2               RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pll2divr_divp2_en  = (|wr_req & rcc_pll2divr_sel);
assign nxt_rcc_pll2divr_divp2 = wdata[15:9]                 ;
assign divp2                  = cur_rcc_pll2divr_divp2      ;
BB_dfflr #(
  .DW     (7  ),
  .RST_VAL('h1)
) U_rcc_pll2divr_divp2 (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_pll2divr_divp2_en ),
  .din  (nxt_rcc_pll2divr_divp2),
  .dout (cur_rcc_pll2divr_divp2)
);

// --------------------------------------------------------------------------------
// 8:0                 divn2               RW                  0b10000000          
// --------------------------------------------------------------------------------
assign rcc_pll2divr_divn2_en  = (|wr_req & rcc_pll2divr_sel);
assign nxt_rcc_pll2divr_divn2 = wdata[8:0]                  ;
assign divn2                  = cur_rcc_pll2divr_divn2      ;
BB_dfflr #(
  .DW     (9   ),
  .RST_VAL('h80)
) U_rcc_pll2divr_divn2 (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_pll2divr_divn2_en ),
  .din  (nxt_rcc_pll2divr_divn2),
  .dout (cur_rcc_pll2divr_divn2)
);


// --------------------------------------------------------------------------------
// rcc_pll2fracr                           0x3c                                    
// --------------------------------------------------------------------------------
// 15:3                fracn2              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_pll2fracr read data
// --------------------------------------------------------------------------------
assign rcc_pll2fracr_read = {{16{1'b0}}
                          , cur_rcc_pll2fracr_fracn2
                          , {3{1'b0}}};

// --------------------------------------------------------------------------------
// 15:3                fracn2              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_pll2fracr_fracn2_en  = (|wr_req & rcc_pll2fracr_sel);
assign nxt_rcc_pll2fracr_fracn2 = wdata[15:3]                  ;
assign fracn2                   = cur_rcc_pll2fracr_fracn2     ;
BB_dfflr #(
  .DW     (13 ),
  .RST_VAL('h0)
) U_rcc_pll2fracr_fracn2 (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_pll2fracr_fracn2_en ),
  .din  (nxt_rcc_pll2fracr_fracn2),
  .dout (cur_rcc_pll2fracr_fracn2)
);


// --------------------------------------------------------------------------------
// rcc_pll3divr                            0x40                                    
// --------------------------------------------------------------------------------
// 30:24               divr3               RW                  0b1                 
// --------------------------------------------------------------------------------
// 22:16               divq3               RW                  0b1                 
// --------------------------------------------------------------------------------
// 15:9                divp3               RW                  0b1                 
// --------------------------------------------------------------------------------
// 8:0                 divn3               RW                  0b10000000          
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_pll3divr read data
// --------------------------------------------------------------------------------
assign rcc_pll3divr_read = {{1{1'b0}}
                         , cur_rcc_pll3divr_divr3
                         , {1{1'b0}}
                         , cur_rcc_pll3divr_divq3
                         , cur_rcc_pll3divr_divp3
                         , cur_rcc_pll3divr_divn3};

// --------------------------------------------------------------------------------
// 30:24               divr3               RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pll3divr_divr3_en  = (|wr_req & rcc_pll3divr_sel);
assign nxt_rcc_pll3divr_divr3 = wdata[30:24]                ;
assign divr3                  = cur_rcc_pll3divr_divr3      ;
BB_dfflr #(
  .DW     (7  ),
  .RST_VAL('h1)
) U_rcc_pll3divr_divr3 (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_pll3divr_divr3_en ),
  .din  (nxt_rcc_pll3divr_divr3),
  .dout (cur_rcc_pll3divr_divr3)
);

// --------------------------------------------------------------------------------
// 22:16               divq3               RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pll3divr_divq3_en  = (|wr_req & rcc_pll3divr_sel);
assign nxt_rcc_pll3divr_divq3 = wdata[22:16]                ;
assign divq3                  = cur_rcc_pll3divr_divq3      ;
BB_dfflr #(
  .DW     (7  ),
  .RST_VAL('h1)
) U_rcc_pll3divr_divq3 (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_pll3divr_divq3_en ),
  .din  (nxt_rcc_pll3divr_divq3),
  .dout (cur_rcc_pll3divr_divq3)
);

// --------------------------------------------------------------------------------
// 15:9                divp3               RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_pll3divr_divp3_en  = (|wr_req & rcc_pll3divr_sel);
assign nxt_rcc_pll3divr_divp3 = wdata[15:9]                 ;
assign divp3                  = cur_rcc_pll3divr_divp3      ;
BB_dfflr #(
  .DW     (7  ),
  .RST_VAL('h1)
) U_rcc_pll3divr_divp3 (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_pll3divr_divp3_en ),
  .din  (nxt_rcc_pll3divr_divp3),
  .dout (cur_rcc_pll3divr_divp3)
);

// --------------------------------------------------------------------------------
// 8:0                 divn3               RW                  0b10000000          
// --------------------------------------------------------------------------------
assign rcc_pll3divr_divn3_en  = (|wr_req & rcc_pll3divr_sel);
assign nxt_rcc_pll3divr_divn3 = wdata[8:0]                  ;
assign divn3                  = cur_rcc_pll3divr_divn3      ;
BB_dfflr #(
  .DW     (9   ),
  .RST_VAL('h80)
) U_rcc_pll3divr_divn3 (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_pll3divr_divn3_en ),
  .din  (nxt_rcc_pll3divr_divn3),
  .dout (cur_rcc_pll3divr_divn3)
);


// --------------------------------------------------------------------------------
// rcc_pll3fracr                           0x44                                    
// --------------------------------------------------------------------------------
// 15:3                fracn3              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_pll3fracr read data
// --------------------------------------------------------------------------------
assign rcc_pll3fracr_read = {{16{1'b0}}
                          , cur_rcc_pll3fracr_fracn3
                          , {3{1'b0}}};

// --------------------------------------------------------------------------------
// 15:3                fracn3              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_pll3fracr_fracn3_en  = (|wr_req & rcc_pll3fracr_sel);
assign nxt_rcc_pll3fracr_fracn3 = wdata[15:3]                  ;
assign fracn3                   = cur_rcc_pll3fracr_fracn3     ;
BB_dfflr #(
  .DW     (13 ),
  .RST_VAL('h0)
) U_rcc_pll3fracr_fracn3 (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_pll3fracr_fracn3_en ),
  .din  (nxt_rcc_pll3fracr_fracn3),
  .dout (cur_rcc_pll3fracr_fracn3)
);


// --------------------------------------------------------------------------------
// rcc_d1ccipr                             0x4c                                    
// --------------------------------------------------------------------------------
// 29:28               clkpersel           RW                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               sdmmcsel            RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 dsisel              RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:4                 qspisel             RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:0                 fmcsel              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_d1ccipr read data
// --------------------------------------------------------------------------------
assign rcc_d1ccipr_read = {{2{1'b0}}
                        , cur_rcc_d1ccipr_clkpersel
                        , {11{1'b0}}
                        , cur_rcc_d1ccipr_sdmmcsel
                        , {7{1'b0}}
                        , cur_rcc_d1ccipr_dsisel
                        , {2{1'b0}}
                        , cur_rcc_d1ccipr_qspisel
                        , {2{1'b0}}
                        , cur_rcc_d1ccipr_fmcsel};

// --------------------------------------------------------------------------------
// 29:28               clkpersel           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d1ccipr_clkpersel_en  = (|wr_req & rcc_d1ccipr_sel);
assign nxt_rcc_d1ccipr_clkpersel = wdata[29:28]               ;
assign clkpersel                 = cur_rcc_d1ccipr_clkpersel  ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_d1ccipr_clkpersel (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_d1ccipr_clkpersel_en ),
  .din  (nxt_rcc_d1ccipr_clkpersel),
  .dout (cur_rcc_d1ccipr_clkpersel)
);

// --------------------------------------------------------------------------------
// 16:16               sdmmcsel            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d1ccipr_sdmmcsel_en  = (|wr_req & rcc_d1ccipr_sel);
assign nxt_rcc_d1ccipr_sdmmcsel = wdata[16:16]               ;
assign sdmmcsel                 = cur_rcc_d1ccipr_sdmmcsel   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d1ccipr_sdmmcsel (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_d1ccipr_sdmmcsel_en ),
  .din  (nxt_rcc_d1ccipr_sdmmcsel),
  .dout (cur_rcc_d1ccipr_sdmmcsel)
);

// --------------------------------------------------------------------------------
// 8:8                 dsisel              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d1ccipr_dsisel_en  = (|wr_req & rcc_d1ccipr_sel);
assign nxt_rcc_d1ccipr_dsisel = wdata[8:8]                 ;
assign dsisel                 = cur_rcc_d1ccipr_dsisel     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d1ccipr_dsisel (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_d1ccipr_dsisel_en ),
  .din  (nxt_rcc_d1ccipr_dsisel),
  .dout (cur_rcc_d1ccipr_dsisel)
);

// --------------------------------------------------------------------------------
// 5:4                 qspisel             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d1ccipr_qspisel_en  = (|wr_req & rcc_d1ccipr_sel);
assign nxt_rcc_d1ccipr_qspisel = wdata[5:4]                 ;
assign qspisel                 = cur_rcc_d1ccipr_qspisel    ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_d1ccipr_qspisel (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_d1ccipr_qspisel_en ),
  .din  (nxt_rcc_d1ccipr_qspisel),
  .dout (cur_rcc_d1ccipr_qspisel)
);

// --------------------------------------------------------------------------------
// 1:0                 fmcsel              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d1ccipr_fmcsel_en  = (|wr_req & rcc_d1ccipr_sel);
assign nxt_rcc_d1ccipr_fmcsel = wdata[1:0]                 ;
assign fmcsel                 = cur_rcc_d1ccipr_fmcsel     ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_d1ccipr_fmcsel (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_d1ccipr_fmcsel_en ),
  .din  (nxt_rcc_d1ccipr_fmcsel),
  .dout (cur_rcc_d1ccipr_fmcsel)
);


// --------------------------------------------------------------------------------
// rcc_d2ccip1r                            0x50                                    
// --------------------------------------------------------------------------------
// 31:31               swpsel              RW                  0b0                 
// --------------------------------------------------------------------------------
// 29:28               fdcansel            RW                  0b0                 
// --------------------------------------------------------------------------------
// 24:24               dfsdm1sel           RW                  0b0                 
// --------------------------------------------------------------------------------
// 21:20               spdifsel            RW                  0b0                 
// --------------------------------------------------------------------------------
// 18:16               spi45sel            RW                  0b0                 
// --------------------------------------------------------------------------------
// 14:12               spi123sel           RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:6                 sai23sel            RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:0                 sai1sel             RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_d2ccip1r read data
// --------------------------------------------------------------------------------
assign rcc_d2ccip1r_read = {cur_rcc_d2ccip1r_swpsel
                         , {1{1'b0}}
                         , cur_rcc_d2ccip1r_fdcansel
                         , {3{1'b0}}
                         , cur_rcc_d2ccip1r_dfsdm1sel
                         , {2{1'b0}}
                         , cur_rcc_d2ccip1r_spdifsel
                         , {1{1'b0}}
                         , cur_rcc_d2ccip1r_spi45sel
                         , {1{1'b0}}
                         , cur_rcc_d2ccip1r_spi123sel
                         , {3{1'b0}}
                         , cur_rcc_d2ccip1r_sai23sel
                         , {4{1'b0}}
                         , cur_rcc_d2ccip1r_sai1sel};

// --------------------------------------------------------------------------------
// 31:31               swpsel              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip1r_swpsel_en  = (|wr_req & rcc_d2ccip1r_sel);
assign nxt_rcc_d2ccip1r_swpsel = wdata[31:31]                ;
assign swpsel                  = cur_rcc_d2ccip1r_swpsel     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d2ccip1r_swpsel (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_d2ccip1r_swpsel_en ),
  .din  (nxt_rcc_d2ccip1r_swpsel),
  .dout (cur_rcc_d2ccip1r_swpsel)
);

// --------------------------------------------------------------------------------
// 29:28               fdcansel            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip1r_fdcansel_en  = (|wr_req & rcc_d2ccip1r_sel);
assign nxt_rcc_d2ccip1r_fdcansel = wdata[29:28]                ;
assign fdcansel                  = cur_rcc_d2ccip1r_fdcansel   ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_d2ccip1r_fdcansel (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_d2ccip1r_fdcansel_en ),
  .din  (nxt_rcc_d2ccip1r_fdcansel),
  .dout (cur_rcc_d2ccip1r_fdcansel)
);

// --------------------------------------------------------------------------------
// 24:24               dfsdm1sel           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip1r_dfsdm1sel_en  = (|wr_req & rcc_d2ccip1r_sel);
assign nxt_rcc_d2ccip1r_dfsdm1sel = wdata[24:24]                ;
assign dfsdm1sel                  = cur_rcc_d2ccip1r_dfsdm1sel  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d2ccip1r_dfsdm1sel (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_d2ccip1r_dfsdm1sel_en ),
  .din  (nxt_rcc_d2ccip1r_dfsdm1sel),
  .dout (cur_rcc_d2ccip1r_dfsdm1sel)
);

// --------------------------------------------------------------------------------
// 21:20               spdifsel            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip1r_spdifsel_en  = (|wr_req & rcc_d2ccip1r_sel);
assign nxt_rcc_d2ccip1r_spdifsel = wdata[21:20]                ;
assign spdifsel                  = cur_rcc_d2ccip1r_spdifsel   ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_d2ccip1r_spdifsel (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_d2ccip1r_spdifsel_en ),
  .din  (nxt_rcc_d2ccip1r_spdifsel),
  .dout (cur_rcc_d2ccip1r_spdifsel)
);

// --------------------------------------------------------------------------------
// 18:16               spi45sel            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip1r_spi45sel_en  = (|wr_req & rcc_d2ccip1r_sel);
assign nxt_rcc_d2ccip1r_spi45sel = wdata[18:16]                ;
assign spi45sel                  = cur_rcc_d2ccip1r_spi45sel   ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d2ccip1r_spi45sel (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_d2ccip1r_spi45sel_en ),
  .din  (nxt_rcc_d2ccip1r_spi45sel),
  .dout (cur_rcc_d2ccip1r_spi45sel)
);

// --------------------------------------------------------------------------------
// 14:12               spi123sel           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip1r_spi123sel_en  = (|wr_req & rcc_d2ccip1r_sel);
assign nxt_rcc_d2ccip1r_spi123sel = wdata[14:12]                ;
assign spi123sel                  = cur_rcc_d2ccip1r_spi123sel  ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d2ccip1r_spi123sel (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_d2ccip1r_spi123sel_en ),
  .din  (nxt_rcc_d2ccip1r_spi123sel),
  .dout (cur_rcc_d2ccip1r_spi123sel)
);

// --------------------------------------------------------------------------------
// 8:6                 sai23sel            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip1r_sai23sel_en  = (|wr_req & rcc_d2ccip1r_sel);
assign nxt_rcc_d2ccip1r_sai23sel = wdata[8:6]                  ;
assign sai23sel                  = cur_rcc_d2ccip1r_sai23sel   ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d2ccip1r_sai23sel (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_d2ccip1r_sai23sel_en ),
  .din  (nxt_rcc_d2ccip1r_sai23sel),
  .dout (cur_rcc_d2ccip1r_sai23sel)
);

// --------------------------------------------------------------------------------
// 1:0                 sai1sel             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip1r_sai1sel_en  = (|wr_req & rcc_d2ccip1r_sel);
assign nxt_rcc_d2ccip1r_sai1sel = wdata[1:0]                  ;
assign sai1sel                  = cur_rcc_d2ccip1r_sai1sel    ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_d2ccip1r_sai1sel (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_d2ccip1r_sai1sel_en ),
  .din  (nxt_rcc_d2ccip1r_sai1sel),
  .dout (cur_rcc_d2ccip1r_sai1sel)
);


// --------------------------------------------------------------------------------
// rcc_d2ccip2r                            0x54                                    
// --------------------------------------------------------------------------------
// 30:28               lptim1sel           RW                  0b0                 
// --------------------------------------------------------------------------------
// 23:22               cecsel              RW                  0b0                 
// --------------------------------------------------------------------------------
// 21:20               usbsel              RW                  0b0                 
// --------------------------------------------------------------------------------
// 13:12               i2c123sel           RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:8                 rngsel              RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:3                 usart16sel          RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:0                 usart234578sel      RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_d2ccip2r read data
// --------------------------------------------------------------------------------
assign rcc_d2ccip2r_read = {{1{1'b0}}
                         , cur_rcc_d2ccip2r_lptim1sel
                         , {4{1'b0}}
                         , cur_rcc_d2ccip2r_cecsel
                         , cur_rcc_d2ccip2r_usbsel
                         , {6{1'b0}}
                         , cur_rcc_d2ccip2r_i2c123sel
                         , {2{1'b0}}
                         , cur_rcc_d2ccip2r_rngsel
                         , {2{1'b0}}
                         , cur_rcc_d2ccip2r_usart16sel
                         , cur_rcc_d2ccip2r_usart234578sel};

// --------------------------------------------------------------------------------
// 30:28               lptim1sel           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip2r_lptim1sel_en  = (|wr_req & rcc_d2ccip2r_sel);
assign nxt_rcc_d2ccip2r_lptim1sel = wdata[30:28]                ;
assign lptim1sel                  = cur_rcc_d2ccip2r_lptim1sel  ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d2ccip2r_lptim1sel (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_d2ccip2r_lptim1sel_en ),
  .din  (nxt_rcc_d2ccip2r_lptim1sel),
  .dout (cur_rcc_d2ccip2r_lptim1sel)
);

// --------------------------------------------------------------------------------
// 23:22               cecsel              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip2r_cecsel_en  = (|wr_req & rcc_d2ccip2r_sel);
assign nxt_rcc_d2ccip2r_cecsel = wdata[23:22]                ;
assign cecsel                  = cur_rcc_d2ccip2r_cecsel     ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_d2ccip2r_cecsel (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_d2ccip2r_cecsel_en ),
  .din  (nxt_rcc_d2ccip2r_cecsel),
  .dout (cur_rcc_d2ccip2r_cecsel)
);

// --------------------------------------------------------------------------------
// 21:20               usbsel              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip2r_usbsel_en  = (|wr_req & rcc_d2ccip2r_sel);
assign nxt_rcc_d2ccip2r_usbsel = wdata[21:20]                ;
assign usbsel                  = cur_rcc_d2ccip2r_usbsel     ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_d2ccip2r_usbsel (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_d2ccip2r_usbsel_en ),
  .din  (nxt_rcc_d2ccip2r_usbsel),
  .dout (cur_rcc_d2ccip2r_usbsel)
);

// --------------------------------------------------------------------------------
// 13:12               i2c123sel           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip2r_i2c123sel_en  = (|wr_req & rcc_d2ccip2r_sel);
assign nxt_rcc_d2ccip2r_i2c123sel = wdata[13:12]                ;
assign i2c123sel                  = cur_rcc_d2ccip2r_i2c123sel  ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_d2ccip2r_i2c123sel (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_d2ccip2r_i2c123sel_en ),
  .din  (nxt_rcc_d2ccip2r_i2c123sel),
  .dout (cur_rcc_d2ccip2r_i2c123sel)
);

// --------------------------------------------------------------------------------
// 9:8                 rngsel              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip2r_rngsel_en  = (|wr_req & rcc_d2ccip2r_sel);
assign nxt_rcc_d2ccip2r_rngsel = wdata[9:8]                  ;
assign rngsel                  = cur_rcc_d2ccip2r_rngsel     ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_d2ccip2r_rngsel (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_d2ccip2r_rngsel_en ),
  .din  (nxt_rcc_d2ccip2r_rngsel),
  .dout (cur_rcc_d2ccip2r_rngsel)
);

// --------------------------------------------------------------------------------
// 5:3                 usart16sel          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip2r_usart16sel_en  = (|wr_req & rcc_d2ccip2r_sel);
assign nxt_rcc_d2ccip2r_usart16sel = wdata[5:3]                  ;
assign usart16sel                  = cur_rcc_d2ccip2r_usart16sel ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d2ccip2r_usart16sel (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_d2ccip2r_usart16sel_en ),
  .din  (nxt_rcc_d2ccip2r_usart16sel),
  .dout (cur_rcc_d2ccip2r_usart16sel)
);

// --------------------------------------------------------------------------------
// 2:0                 usart234578sel      RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d2ccip2r_usart234578sel_en  = (|wr_req & rcc_d2ccip2r_sel)   ;
assign nxt_rcc_d2ccip2r_usart234578sel = wdata[2:0]                     ;
assign usart234578sel                  = cur_rcc_d2ccip2r_usart234578sel;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d2ccip2r_usart234578sel (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_d2ccip2r_usart234578sel_en ),
  .din  (nxt_rcc_d2ccip2r_usart234578sel),
  .dout (cur_rcc_d2ccip2r_usart234578sel)
);


// --------------------------------------------------------------------------------
// rcc_d3ccipr                             0x58                                    
// --------------------------------------------------------------------------------
// 30:28               spi6sel             RW                  0b0                 
// --------------------------------------------------------------------------------
// 26:24               sai4bsel            RW                  0b0                 
// --------------------------------------------------------------------------------
// 23:21               sai4asel            RW                  0b0                 
// --------------------------------------------------------------------------------
// 17:16               adcsel              RW                  0b0                 
// --------------------------------------------------------------------------------
// 15:13               lptim345sel         RW                  0b0                 
// --------------------------------------------------------------------------------
// 12:10               lptim2sel           RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:8                 i2c4sel             RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:0                 lpuart1sel          RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_d3ccipr read data
// --------------------------------------------------------------------------------
assign rcc_d3ccipr_read = {{1{1'b0}}
                        , cur_rcc_d3ccipr_spi6sel
                        , {1{1'b0}}
                        , cur_rcc_d3ccipr_sai4bsel
                        , cur_rcc_d3ccipr_sai4asel
                        , {3{1'b0}}
                        , cur_rcc_d3ccipr_adcsel
                        , cur_rcc_d3ccipr_lptim345sel
                        , cur_rcc_d3ccipr_lptim2sel
                        , cur_rcc_d3ccipr_i2c4sel
                        , {5{1'b0}}
                        , cur_rcc_d3ccipr_lpuart1sel};

// --------------------------------------------------------------------------------
// 30:28               spi6sel             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3ccipr_spi6sel_en  = (|wr_req & rcc_d3ccipr_sel);
assign nxt_rcc_d3ccipr_spi6sel = wdata[30:28]               ;
assign spi6sel                 = cur_rcc_d3ccipr_spi6sel    ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d3ccipr_spi6sel (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_d3ccipr_spi6sel_en ),
  .din  (nxt_rcc_d3ccipr_spi6sel),
  .dout (cur_rcc_d3ccipr_spi6sel)
);

// --------------------------------------------------------------------------------
// 26:24               sai4bsel            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3ccipr_sai4bsel_en  = (|wr_req & rcc_d3ccipr_sel);
assign nxt_rcc_d3ccipr_sai4bsel = wdata[26:24]               ;
assign sai4bsel                 = cur_rcc_d3ccipr_sai4bsel   ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d3ccipr_sai4bsel (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_d3ccipr_sai4bsel_en ),
  .din  (nxt_rcc_d3ccipr_sai4bsel),
  .dout (cur_rcc_d3ccipr_sai4bsel)
);

// --------------------------------------------------------------------------------
// 23:21               sai4asel            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3ccipr_sai4asel_en  = (|wr_req & rcc_d3ccipr_sel);
assign nxt_rcc_d3ccipr_sai4asel = wdata[23:21]               ;
assign sai4asel                 = cur_rcc_d3ccipr_sai4asel   ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d3ccipr_sai4asel (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_d3ccipr_sai4asel_en ),
  .din  (nxt_rcc_d3ccipr_sai4asel),
  .dout (cur_rcc_d3ccipr_sai4asel)
);

// --------------------------------------------------------------------------------
// 17:16               adcsel              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3ccipr_adcsel_en  = (|wr_req & rcc_d3ccipr_sel);
assign nxt_rcc_d3ccipr_adcsel = wdata[17:16]               ;
assign adcsel                 = cur_rcc_d3ccipr_adcsel     ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_d3ccipr_adcsel (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_d3ccipr_adcsel_en ),
  .din  (nxt_rcc_d3ccipr_adcsel),
  .dout (cur_rcc_d3ccipr_adcsel)
);

// --------------------------------------------------------------------------------
// 15:13               lptim345sel         RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3ccipr_lptim345sel_en  = (|wr_req & rcc_d3ccipr_sel);
assign nxt_rcc_d3ccipr_lptim345sel = wdata[15:13]               ;
assign lptim345sel                 = cur_rcc_d3ccipr_lptim345sel;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d3ccipr_lptim345sel (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_d3ccipr_lptim345sel_en ),
  .din  (nxt_rcc_d3ccipr_lptim345sel),
  .dout (cur_rcc_d3ccipr_lptim345sel)
);

// --------------------------------------------------------------------------------
// 12:10               lptim2sel           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3ccipr_lptim2sel_en  = (|wr_req & rcc_d3ccipr_sel);
assign nxt_rcc_d3ccipr_lptim2sel = wdata[12:10]               ;
assign lptim2sel                 = cur_rcc_d3ccipr_lptim2sel  ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d3ccipr_lptim2sel (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_d3ccipr_lptim2sel_en ),
  .din  (nxt_rcc_d3ccipr_lptim2sel),
  .dout (cur_rcc_d3ccipr_lptim2sel)
);

// --------------------------------------------------------------------------------
// 9:8                 i2c4sel             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3ccipr_i2c4sel_en  = (|wr_req & rcc_d3ccipr_sel);
assign nxt_rcc_d3ccipr_i2c4sel = wdata[9:8]                 ;
assign i2c4sel                 = cur_rcc_d3ccipr_i2c4sel    ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_d3ccipr_i2c4sel (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_d3ccipr_i2c4sel_en ),
  .din  (nxt_rcc_d3ccipr_i2c4sel),
  .dout (cur_rcc_d3ccipr_i2c4sel)
);

// --------------------------------------------------------------------------------
// 2:0                 lpuart1sel          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3ccipr_lpuart1sel_en  = (|wr_req & rcc_d3ccipr_sel);
assign nxt_rcc_d3ccipr_lpuart1sel = wdata[2:0]                 ;
assign lpuart1sel                 = cur_rcc_d3ccipr_lpuart1sel ;
BB_dfflr #(
  .DW     (3  ),
  .RST_VAL('h0)
) U_rcc_d3ccipr_lpuart1sel (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_d3ccipr_lpuart1sel_en ),
  .din  (nxt_rcc_d3ccipr_lpuart1sel),
  .dout (cur_rcc_d3ccipr_lpuart1sel)
);


// --------------------------------------------------------------------------------
// rcc_cier                                0x60                                    
// --------------------------------------------------------------------------------
// 9:9                 lsecssie            RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 pll3rdyie           RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 pll2rdyie           RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:6                 pll1rdyie           RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 hsi48rdyie          RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 csirdyie            RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 hserdyie            RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 hsirdyie            RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 lserdyie            RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 lsirdyie            RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_cier read data
// --------------------------------------------------------------------------------
assign rcc_cier_read = {{22{1'b0}}
                     , cur_rcc_cier_lsecssie
                     , cur_rcc_cier_pll3rdyie
                     , cur_rcc_cier_pll2rdyie
                     , cur_rcc_cier_pll1rdyie
                     , cur_rcc_cier_hsi48rdyie
                     , cur_rcc_cier_csirdyie
                     , cur_rcc_cier_hserdyie
                     , cur_rcc_cier_hsirdyie
                     , cur_rcc_cier_lserdyie
                     , cur_rcc_cier_lsirdyie};

// --------------------------------------------------------------------------------
// 9:9                 lsecssie            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cier_lsecssie_en  = (|wr_req & rcc_cier_sel);
assign nxt_rcc_cier_lsecssie = wdata[9:9]              ;
assign lsecssie              = cur_rcc_cier_lsecssie   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cier_lsecssie (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_cier_lsecssie_en ),
  .din  (nxt_rcc_cier_lsecssie),
  .dout (cur_rcc_cier_lsecssie)
);

// --------------------------------------------------------------------------------
// 8:8                 pll3rdyie           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cier_pll3rdyie_en  = (|wr_req & rcc_cier_sel);
assign nxt_rcc_cier_pll3rdyie = wdata[8:8]              ;
assign pll3rdyie              = cur_rcc_cier_pll3rdyie  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cier_pll3rdyie (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_cier_pll3rdyie_en ),
  .din  (nxt_rcc_cier_pll3rdyie),
  .dout (cur_rcc_cier_pll3rdyie)
);

// --------------------------------------------------------------------------------
// 7:7                 pll2rdyie           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cier_pll2rdyie_en  = (|wr_req & rcc_cier_sel);
assign nxt_rcc_cier_pll2rdyie = wdata[7:7]              ;
assign pll2rdyie              = cur_rcc_cier_pll2rdyie  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cier_pll2rdyie (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_cier_pll2rdyie_en ),
  .din  (nxt_rcc_cier_pll2rdyie),
  .dout (cur_rcc_cier_pll2rdyie)
);

// --------------------------------------------------------------------------------
// 6:6                 pll1rdyie           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cier_pll1rdyie_en  = (|wr_req & rcc_cier_sel);
assign nxt_rcc_cier_pll1rdyie = wdata[6:6]              ;
assign pll1rdyie              = cur_rcc_cier_pll1rdyie  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cier_pll1rdyie (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_cier_pll1rdyie_en ),
  .din  (nxt_rcc_cier_pll1rdyie),
  .dout (cur_rcc_cier_pll1rdyie)
);

// --------------------------------------------------------------------------------
// 5:5                 hsi48rdyie          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cier_hsi48rdyie_en  = (|wr_req & rcc_cier_sel);
assign nxt_rcc_cier_hsi48rdyie = wdata[5:5]              ;
assign hsi48rdyie              = cur_rcc_cier_hsi48rdyie ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cier_hsi48rdyie (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_cier_hsi48rdyie_en ),
  .din  (nxt_rcc_cier_hsi48rdyie),
  .dout (cur_rcc_cier_hsi48rdyie)
);

// --------------------------------------------------------------------------------
// 4:4                 csirdyie            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cier_csirdyie_en  = (|wr_req & rcc_cier_sel);
assign nxt_rcc_cier_csirdyie = wdata[4:4]              ;
assign csirdyie              = cur_rcc_cier_csirdyie   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cier_csirdyie (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_cier_csirdyie_en ),
  .din  (nxt_rcc_cier_csirdyie),
  .dout (cur_rcc_cier_csirdyie)
);

// --------------------------------------------------------------------------------
// 3:3                 hserdyie            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cier_hserdyie_en  = (|wr_req & rcc_cier_sel);
assign nxt_rcc_cier_hserdyie = wdata[3:3]              ;
assign hserdyie              = cur_rcc_cier_hserdyie   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cier_hserdyie (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_cier_hserdyie_en ),
  .din  (nxt_rcc_cier_hserdyie),
  .dout (cur_rcc_cier_hserdyie)
);

// --------------------------------------------------------------------------------
// 2:2                 hsirdyie            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cier_hsirdyie_en  = (|wr_req & rcc_cier_sel);
assign nxt_rcc_cier_hsirdyie = wdata[2:2]              ;
assign hsirdyie              = cur_rcc_cier_hsirdyie   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cier_hsirdyie (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_cier_hsirdyie_en ),
  .din  (nxt_rcc_cier_hsirdyie),
  .dout (cur_rcc_cier_hsirdyie)
);

// --------------------------------------------------------------------------------
// 1:1                 lserdyie            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cier_lserdyie_en  = (|wr_req & rcc_cier_sel);
assign nxt_rcc_cier_lserdyie = wdata[1:1]              ;
assign lserdyie              = cur_rcc_cier_lserdyie   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cier_lserdyie (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_cier_lserdyie_en ),
  .din  (nxt_rcc_cier_lserdyie),
  .dout (cur_rcc_cier_lserdyie)
);

// --------------------------------------------------------------------------------
// 0:0                 lsirdyie            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cier_lsirdyie_en  = (|wr_req & rcc_cier_sel);
assign nxt_rcc_cier_lsirdyie = wdata[0:0]              ;
assign lsirdyie              = cur_rcc_cier_lsirdyie   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cier_lsirdyie (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_cier_lsirdyie_en ),
  .din  (nxt_rcc_cier_lsirdyie),
  .dout (cur_rcc_cier_lsirdyie)
);


// --------------------------------------------------------------------------------
// rcc_cifr                                0x64                                    
// --------------------------------------------------------------------------------
// 10:10               hsecssf             RO                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 lsecssf             RO                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 pll3rdyf            RO                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 pll2rdyf            RO                  0b0                 
// --------------------------------------------------------------------------------
// 6:6                 pll1rdyf            RO                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 hsi48rdyf           RO                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 csirdyf             RO                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 hserdyf             RO                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 hsirdyf             RO                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 lserdyf             RO                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 lsirdyf             RO                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_cifr read data
// --------------------------------------------------------------------------------
assign rcc_cifr_read = {{21{1'b0}}
                     , cur_rcc_cifr_hsecssf
                     , cur_rcc_cifr_lsecssf
                     , cur_rcc_cifr_pll3rdyf
                     , cur_rcc_cifr_pll2rdyf
                     , cur_rcc_cifr_pll1rdyf
                     , cur_rcc_cifr_hsi48rdyf
                     , cur_rcc_cifr_csirdyf
                     , cur_rcc_cifr_hserdyf
                     , cur_rcc_cifr_hsirdyf
                     , cur_rcc_cifr_lserdyf
                     , cur_rcc_cifr_lsirdyf};

// --------------------------------------------------------------------------------
// 10:10               hsecssf             RO                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cifr_hsecssf_set = rcc_hsecss_fail                            ;
assign rcc_cifr_hsecssf_clr = cur_rcc_cicr_hsecssc                       ;
assign rcc_cifr_hsecssf_en  = rcc_cifr_hsecssf_set | rcc_cifr_hsecssf_clr;
assign nxt_rcc_cifr_hsecssf = rcc_cifr_hsecssf_set                       ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cifr_hsecssf (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cifr_hsecssf_en ),
  .din  (nxt_rcc_cifr_hsecssf),
  .dout (cur_rcc_cifr_hsecssf)
);

// --------------------------------------------------------------------------------
// 9:9                 lsecssf             RO                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cifr_lsecssf_set = rcc_lsecss_fail                            ;
assign rcc_cifr_lsecssf_clr = cur_rcc_cicr_lsecssc                       ;
assign rcc_cifr_lsecssf_en  = rcc_cifr_lsecssf_set | rcc_cifr_lsecssf_clr;
assign nxt_rcc_cifr_lsecssf = rcc_cifr_lsecssf_set                       ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cifr_lsecssf (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cifr_lsecssf_en ),
  .din  (nxt_rcc_cifr_lsecssf),
  .dout (cur_rcc_cifr_lsecssf)
);

// --------------------------------------------------------------------------------
// 8:8                 pll3rdyf            RO                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cifr_pll3rdyf_set = pll3_rdy                                     ;
assign rcc_cifr_pll3rdyf_clr = cur_rcc_cicr_pll3rdyc                        ;
assign rcc_cifr_pll3rdyf_en  = rcc_cifr_pll3rdyf_set | rcc_cifr_pll3rdyf_clr;
assign nxt_rcc_cifr_pll3rdyf = rcc_cifr_pll3rdyf_set                        ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cifr_pll3rdyf (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_cifr_pll3rdyf_en ),
  .din  (nxt_rcc_cifr_pll3rdyf),
  .dout (cur_rcc_cifr_pll3rdyf)
);

// --------------------------------------------------------------------------------
// 7:7                 pll2rdyf            RO                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cifr_pll2rdyf_set = pll2_rdy                                     ;
assign rcc_cifr_pll2rdyf_clr = cur_rcc_cicr_pll3rdyc                        ;
assign rcc_cifr_pll2rdyf_en  = rcc_cifr_pll2rdyf_set | rcc_cifr_pll2rdyf_clr;
assign nxt_rcc_cifr_pll2rdyf = rcc_cifr_pll2rdyf_set                        ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cifr_pll2rdyf (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_cifr_pll2rdyf_en ),
  .din  (nxt_rcc_cifr_pll2rdyf),
  .dout (cur_rcc_cifr_pll2rdyf)
);

// --------------------------------------------------------------------------------
// 6:6                 pll1rdyf            RO                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cifr_pll1rdyf_set = pll1_rdy                                     ;
assign rcc_cifr_pll1rdyf_clr = cur_rcc_cicr_pll2rdyc                        ;
assign rcc_cifr_pll1rdyf_en  = rcc_cifr_pll1rdyf_set | rcc_cifr_pll1rdyf_clr;
assign nxt_rcc_cifr_pll1rdyf = rcc_cifr_pll1rdyf_set                        ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cifr_pll1rdyf (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_cifr_pll1rdyf_en ),
  .din  (nxt_rcc_cifr_pll1rdyf),
  .dout (cur_rcc_cifr_pll1rdyf)
);

// --------------------------------------------------------------------------------
// 5:5                 hsi48rdyf           RO                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cifr_hsi48rdyf_set = hsi48_rdy                                      ;
assign rcc_cifr_hsi48rdyf_clr = cur_rcc_cicr_pll1rdyc                          ;
assign rcc_cifr_hsi48rdyf_en  = rcc_cifr_hsi48rdyf_set | rcc_cifr_hsi48rdyf_clr;
assign nxt_rcc_cifr_hsi48rdyf = rcc_cifr_hsi48rdyf_set                         ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cifr_hsi48rdyf (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_cifr_hsi48rdyf_en ),
  .din  (nxt_rcc_cifr_hsi48rdyf),
  .dout (cur_rcc_cifr_hsi48rdyf)
);

// --------------------------------------------------------------------------------
// 4:4                 csirdyf             RO                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cifr_csirdyf_set = csi_rdy                                    ;
assign rcc_cifr_csirdyf_clr = cur_rcc_cicr_hsi48rdyc                     ;
assign rcc_cifr_csirdyf_en  = rcc_cifr_csirdyf_set | rcc_cifr_csirdyf_clr;
assign nxt_rcc_cifr_csirdyf = rcc_cifr_csirdyf_set                       ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cifr_csirdyf (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cifr_csirdyf_en ),
  .din  (nxt_rcc_cifr_csirdyf),
  .dout (cur_rcc_cifr_csirdyf)
);

// --------------------------------------------------------------------------------
// 3:3                 hserdyf             RO                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cifr_hserdyf_set = hse_rdy                                    ;
assign rcc_cifr_hserdyf_clr = cur_rcc_cicr_csirdyc                       ;
assign rcc_cifr_hserdyf_en  = rcc_cifr_hserdyf_set | rcc_cifr_hserdyf_clr;
assign nxt_rcc_cifr_hserdyf = rcc_cifr_hserdyf_set                       ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cifr_hserdyf (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cifr_hserdyf_en ),
  .din  (nxt_rcc_cifr_hserdyf),
  .dout (cur_rcc_cifr_hserdyf)
);

// --------------------------------------------------------------------------------
// 2:2                 hsirdyf             RO                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cifr_hsirdyf_set = hsi_rdy                                    ;
assign rcc_cifr_hsirdyf_clr = cur_rcc_cicr_hserdyc                       ;
assign rcc_cifr_hsirdyf_en  = rcc_cifr_hsirdyf_set | rcc_cifr_hsirdyf_clr;
assign nxt_rcc_cifr_hsirdyf = rcc_cifr_hsirdyf_set                       ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cifr_hsirdyf (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cifr_hsirdyf_en ),
  .din  (nxt_rcc_cifr_hsirdyf),
  .dout (cur_rcc_cifr_hsirdyf)
);

// --------------------------------------------------------------------------------
// 1:1                 lserdyf             RO                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cifr_lserdyf_set = lse_rdy                                    ;
assign rcc_cifr_lserdyf_clr = cur_rcc_cicr_hsirdyc                       ;
assign rcc_cifr_lserdyf_en  = rcc_cifr_lserdyf_set | rcc_cifr_lserdyf_clr;
assign nxt_rcc_cifr_lserdyf = rcc_cifr_lserdyf_set                       ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cifr_lserdyf (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cifr_lserdyf_en ),
  .din  (nxt_rcc_cifr_lserdyf),
  .dout (cur_rcc_cifr_lserdyf)
);

// --------------------------------------------------------------------------------
// 0:0                 lsirdyf             RO                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_cifr_lsirdyf_set = lsi_rdy                                    ;
assign rcc_cifr_lsirdyf_clr = cur_rcc_cicr_lserdyc                       ;
assign rcc_cifr_lsirdyf_en  = rcc_cifr_lsirdyf_set | rcc_cifr_lsirdyf_clr;
assign nxt_rcc_cifr_lsirdyf = rcc_cifr_lsirdyf_set                       ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cifr_lsirdyf (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cifr_lsirdyf_en ),
  .din  (nxt_rcc_cifr_lsirdyf),
  .dout (cur_rcc_cifr_lsirdyf)
);


// --------------------------------------------------------------------------------
// rcc_cicr                                0x68                                    
// --------------------------------------------------------------------------------
// 10:10               hsecssc             W1C                 0b0                 
// --------------------------------------------------------------------------------
// 9:9                 lsecssc             W1C                 0b0                 
// --------------------------------------------------------------------------------
// 8:8                 pll3rdyc            W1C                 0b0                 
// --------------------------------------------------------------------------------
// 7:7                 pll2rdyc            W1C                 0b0                 
// --------------------------------------------------------------------------------
// 6:6                 pll1rdyc            W1C                 0b0                 
// --------------------------------------------------------------------------------
// 5:5                 hsi48rdyc           W1C                 0b0                 
// --------------------------------------------------------------------------------
// 4:4                 csirdyc             W1C                 0b0                 
// --------------------------------------------------------------------------------
// 3:3                 hserdyc             W1C                 0b0                 
// --------------------------------------------------------------------------------
// 2:2                 hsirdyc             W1C                 0b0                 
// --------------------------------------------------------------------------------
// 1:1                 lserdyc             W1C                 0b0                 
// --------------------------------------------------------------------------------
// 0:0                 lsirdyc             W1C                 0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_cicr read data
// --------------------------------------------------------------------------------
assign rcc_cicr_read = {{21{1'b0}}
                     , cur_rcc_cicr_hsecssc
                     , cur_rcc_cicr_lsecssc
                     , cur_rcc_cicr_pll3rdyc
                     , cur_rcc_cicr_pll2rdyc
                     , cur_rcc_cicr_pll1rdyc
                     , cur_rcc_cicr_hsi48rdyc
                     , cur_rcc_cicr_csirdyc
                     , cur_rcc_cicr_hserdyc
                     , cur_rcc_cicr_hsirdyc
                     , cur_rcc_cicr_lserdyc
                     , cur_rcc_cicr_lsirdyc};

// --------------------------------------------------------------------------------
// 10:10               hsecssc             W1C                 0b0                 
// --------------------------------------------------------------------------------
assign rcc_cicr_hsecssc_en  = (|wr_req & rcc_cicr_sel);
assign nxt_rcc_cicr_hsecssc = wdata[10:10]            ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cicr_hsecssc (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cicr_hsecssc_en ),
  .din  (nxt_rcc_cicr_hsecssc),
  .dout (cur_rcc_cicr_hsecssc)
);

// --------------------------------------------------------------------------------
// 9:9                 lsecssc             W1C                 0b0                 
// --------------------------------------------------------------------------------
assign rcc_cicr_lsecssc_en  = (|wr_req & rcc_cicr_sel);
assign nxt_rcc_cicr_lsecssc = wdata[9:9]              ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cicr_lsecssc (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cicr_lsecssc_en ),
  .din  (nxt_rcc_cicr_lsecssc),
  .dout (cur_rcc_cicr_lsecssc)
);

// --------------------------------------------------------------------------------
// 8:8                 pll3rdyc            W1C                 0b0                 
// --------------------------------------------------------------------------------
assign rcc_cicr_pll3rdyc_en  = (|wr_req & rcc_cicr_sel);
assign nxt_rcc_cicr_pll3rdyc = wdata[8:8]              ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cicr_pll3rdyc (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_cicr_pll3rdyc_en ),
  .din  (nxt_rcc_cicr_pll3rdyc),
  .dout (cur_rcc_cicr_pll3rdyc)
);

// --------------------------------------------------------------------------------
// 7:7                 pll2rdyc            W1C                 0b0                 
// --------------------------------------------------------------------------------
assign rcc_cicr_pll2rdyc_en  = (|wr_req & rcc_cicr_sel);
assign nxt_rcc_cicr_pll2rdyc = wdata[7:7]              ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cicr_pll2rdyc (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_cicr_pll2rdyc_en ),
  .din  (nxt_rcc_cicr_pll2rdyc),
  .dout (cur_rcc_cicr_pll2rdyc)
);

// --------------------------------------------------------------------------------
// 6:6                 pll1rdyc            W1C                 0b0                 
// --------------------------------------------------------------------------------
assign rcc_cicr_pll1rdyc_en  = (|wr_req & rcc_cicr_sel);
assign nxt_rcc_cicr_pll1rdyc = wdata[6:6]              ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cicr_pll1rdyc (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_cicr_pll1rdyc_en ),
  .din  (nxt_rcc_cicr_pll1rdyc),
  .dout (cur_rcc_cicr_pll1rdyc)
);

// --------------------------------------------------------------------------------
// 5:5                 hsi48rdyc           W1C                 0b0                 
// --------------------------------------------------------------------------------
assign rcc_cicr_hsi48rdyc_en  = (|wr_req & rcc_cicr_sel);
assign nxt_rcc_cicr_hsi48rdyc = wdata[5:5]              ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cicr_hsi48rdyc (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_cicr_hsi48rdyc_en ),
  .din  (nxt_rcc_cicr_hsi48rdyc),
  .dout (cur_rcc_cicr_hsi48rdyc)
);

// --------------------------------------------------------------------------------
// 4:4                 csirdyc             W1C                 0b0                 
// --------------------------------------------------------------------------------
assign rcc_cicr_csirdyc_en  = (|wr_req & rcc_cicr_sel);
assign nxt_rcc_cicr_csirdyc = wdata[4:4]              ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cicr_csirdyc (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cicr_csirdyc_en ),
  .din  (nxt_rcc_cicr_csirdyc),
  .dout (cur_rcc_cicr_csirdyc)
);

// --------------------------------------------------------------------------------
// 3:3                 hserdyc             W1C                 0b0                 
// --------------------------------------------------------------------------------
assign rcc_cicr_hserdyc_en  = (|wr_req & rcc_cicr_sel);
assign nxt_rcc_cicr_hserdyc = wdata[3:3]              ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cicr_hserdyc (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cicr_hserdyc_en ),
  .din  (nxt_rcc_cicr_hserdyc),
  .dout (cur_rcc_cicr_hserdyc)
);

// --------------------------------------------------------------------------------
// 2:2                 hsirdyc             W1C                 0b0                 
// --------------------------------------------------------------------------------
assign rcc_cicr_hsirdyc_en  = (|wr_req & rcc_cicr_sel);
assign nxt_rcc_cicr_hsirdyc = wdata[2:2]              ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cicr_hsirdyc (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cicr_hsirdyc_en ),
  .din  (nxt_rcc_cicr_hsirdyc),
  .dout (cur_rcc_cicr_hsirdyc)
);

// --------------------------------------------------------------------------------
// 1:1                 lserdyc             W1C                 0b0                 
// --------------------------------------------------------------------------------
assign rcc_cicr_lserdyc_en  = (|wr_req & rcc_cicr_sel);
assign nxt_rcc_cicr_lserdyc = wdata[1:1]              ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cicr_lserdyc (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cicr_lserdyc_en ),
  .din  (nxt_rcc_cicr_lserdyc),
  .dout (cur_rcc_cicr_lserdyc)
);

// --------------------------------------------------------------------------------
// 0:0                 lsirdyc             W1C                 0b0                 
// --------------------------------------------------------------------------------
assign rcc_cicr_lsirdyc_en  = (|wr_req & rcc_cicr_sel);
assign nxt_rcc_cicr_lsirdyc = wdata[0:0]              ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_cicr_lsirdyc (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_cicr_lsirdyc_en ),
  .din  (nxt_rcc_cicr_lsirdyc),
  .dout (cur_rcc_cicr_lsirdyc)
);


// --------------------------------------------------------------------------------
// rcc_bdcr                                0x70                                    
// --------------------------------------------------------------------------------
// 16:16               bdrst               RW                  0b0                 
// --------------------------------------------------------------------------------
// 15:15               rtcen               RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:8                 rtcsel              RWOnce              0b0                 
// --------------------------------------------------------------------------------
// 6:6                 lsecssd             RO                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 lsecsson            W1S                 0b0                 
// --------------------------------------------------------------------------------
// 4:3                 lsedrv              RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 lsebyp              RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 lserdy              RO                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 lseon               RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_bdcr read data
// --------------------------------------------------------------------------------
assign rcc_bdcr_read = {{15{1'b0}}
                     , cur_rcc_bdcr_bdrst
                     , cur_rcc_bdcr_rtcen
                     , {5{1'b0}}
                     , cur_rcc_bdcr_rtcsel
                     , {1{1'b0}}
                     , cur_rcc_bdcr_lsecssd
                     , cur_rcc_bdcr_lsecsson
                     , cur_rcc_bdcr_lsedrv
                     , cur_rcc_bdcr_lsebyp
                     , cur_rcc_bdcr_lserdy
                     , cur_rcc_bdcr_lseon};

// --------------------------------------------------------------------------------
// 16:16               bdrst               RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_bdcr_bdrst_en  = (wr_req[2] & rcc_bdcr_sel);
assign nxt_rcc_bdcr_bdrst = wdata[16:16]              ;
assign bdrst              = cur_rcc_bdcr_bdrst        ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_bdcr_bdrst (
  .clk  (clk               ),
  .rst_n(rst_n             ),
  .en   (rcc_bdcr_bdrst_en ),
  .din  (nxt_rcc_bdcr_bdrst),
  .dout (cur_rcc_bdcr_bdrst)
);

// --------------------------------------------------------------------------------
// 15:15               rtcen               RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_bdcr_rtcen_en  = (wr_req[1] & rcc_bdcr_sel);
assign nxt_rcc_bdcr_rtcen = wdata[15:15]              ;
assign rtcen              = cur_rcc_bdcr_rtcen        ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_bdcr_rtcen (
  .clk  (clk               ),
  .rst_n(rst_n             ),
  .en   (rcc_bdcr_rtcen_en ),
  .din  (nxt_rcc_bdcr_rtcen),
  .dout (cur_rcc_bdcr_rtcen)
);

// --------------------------------------------------------------------------------
// 9:8                 rtcsel              RWOnce              0b0                 
// --------------------------------------------------------------------------------
assign rcc_bdcr_rtcsel_en  = (wr_req[1] & rcc_bdcr_sel);
assign nxt_rcc_bdcr_rtcsel = wdata[9:8]                ;
assign rtcsel              = cur_rcc_bdcr_rtcsel       ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_bdcr_rtcsel (
  .clk  (clk                ),
  .rst_n(rst_n              ),
  .en   (rcc_bdcr_rtcsel_en ),
  .din  (nxt_rcc_bdcr_rtcsel),
  .dout (cur_rcc_bdcr_rtcsel)
);

// --------------------------------------------------------------------------------
// 6:6                 lsecssd             RO                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_bdcr_lsecssd_set = rcc_lsecss_fail                            ;
assign rcc_bdcr_lsecssd_clr = 1'b0                                       ;
assign rcc_bdcr_lsecssd_en  = rcc_bdcr_lsecssd_set | rcc_bdcr_lsecssd_clr;
assign nxt_rcc_bdcr_lsecssd = rcc_bdcr_lsecssd_set                       ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_bdcr_lsecssd (
  .clk  (clk                 ),
  .rst_n(rst_n               ),
  .en   (rcc_bdcr_lsecssd_en ),
  .din  (nxt_rcc_bdcr_lsecssd),
  .dout (cur_rcc_bdcr_lsecssd)
);

// --------------------------------------------------------------------------------
// 5:5                 lsecsson            W1S                 0b0                 
// --------------------------------------------------------------------------------
assign rcc_bdcr_lsecsson_en  = (wr_req[0] & rcc_bdcr_sel);
assign nxt_rcc_bdcr_lsecsson = wdata[5:5]                ;
assign lsecsson              = cur_rcc_bdcr_lsecsson     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_bdcr_lsecsson (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_bdcr_lsecsson_en ),
  .din  (nxt_rcc_bdcr_lsecsson),
  .dout (cur_rcc_bdcr_lsecsson)
);

// --------------------------------------------------------------------------------
// 4:3                 lsedrv              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_bdcr_lsedrv_en  = (wr_req[0] & rcc_bdcr_sel);
assign nxt_rcc_bdcr_lsedrv = wdata[4:3]                ;
assign lsedrv              = cur_rcc_bdcr_lsedrv       ;
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_bdcr_lsedrv (
  .clk  (clk                ),
  .rst_n(rst_n              ),
  .en   (rcc_bdcr_lsedrv_en ),
  .din  (nxt_rcc_bdcr_lsedrv),
  .dout (cur_rcc_bdcr_lsedrv)
);

// --------------------------------------------------------------------------------
// 2:2                 lsebyp              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_bdcr_lsebyp_en  = (wr_req[0] & rcc_bdcr_sel);
assign nxt_rcc_bdcr_lsebyp = wdata[2:2]                ;
assign lsebyp              = cur_rcc_bdcr_lsebyp       ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_bdcr_lsebyp (
  .clk  (clk                ),
  .rst_n(rst_n              ),
  .en   (rcc_bdcr_lsebyp_en ),
  .din  (nxt_rcc_bdcr_lsebyp),
  .dout (cur_rcc_bdcr_lsebyp)
);

// --------------------------------------------------------------------------------
// 1:1                 lserdy              RO                  0b0                 
// --------------------------------------------------------------------------------
assign cur_rcc_bdcr_lserdy = lse_rdy;

// --------------------------------------------------------------------------------
// 0:0                 lseon               RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_bdcr_lseon_en  = (wr_req[0] & rcc_bdcr_sel);
assign nxt_rcc_bdcr_lseon = wdata[0:0]                ;
assign lseon              = cur_rcc_bdcr_lseon        ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_bdcr_lseon (
  .clk  (clk               ),
  .rst_n(rst_n             ),
  .en   (rcc_bdcr_lseon_en ),
  .din  (nxt_rcc_bdcr_lseon),
  .dout (cur_rcc_bdcr_lseon)
);



// --------------------------------------------------------------------------------
// rcc_ahb3rstr                            0x7c                                    
// --------------------------------------------------------------------------------
// 16:16               sdmmc1rst           RW                  0b0                 
// --------------------------------------------------------------------------------
// 14:14               qspirst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 12:12               fmcrst              RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 jpgdecrst           RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 dma2drst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 mdmarst             RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_ahb3rstr read data
// --------------------------------------------------------------------------------
assign rcc_ahb3rstr_read = {{15{1'b0}}
                         , cur_rcc_ahb3rstr_sdmmc1rst
                         , {1{1'b0}}
                         , cur_rcc_ahb3rstr_qspirst
                         , {1{1'b0}}
                         , cur_rcc_ahb3rstr_fmcrst
                         , {6{1'b0}}
                         , cur_rcc_ahb3rstr_jpgdecrst
                         , cur_rcc_ahb3rstr_dma2drst
                         , {3{1'b0}}
                         , cur_rcc_ahb3rstr_mdmarst};

// --------------------------------------------------------------------------------
// 16:16               sdmmc1rst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb3rstr_sdmmc1rst_en  = (|wr_req & rcc_ahb3rstr_sel);
assign nxt_rcc_ahb3rstr_sdmmc1rst = wdata[16:16]                ;
assign sdmmc1rst                  = cur_rcc_ahb3rstr_sdmmc1rst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb3rstr_sdmmc1rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_ahb3rstr_sdmmc1rst_en ),
  .din  (nxt_rcc_ahb3rstr_sdmmc1rst),
  .dout (cur_rcc_ahb3rstr_sdmmc1rst)
);

// --------------------------------------------------------------------------------
// 14:14               qspirst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb3rstr_qspirst_en  = (|wr_req & rcc_ahb3rstr_sel);
assign nxt_rcc_ahb3rstr_qspirst = wdata[14:14]                ;
assign qspirst                  = cur_rcc_ahb3rstr_qspirst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb3rstr_qspirst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_ahb3rstr_qspirst_en ),
  .din  (nxt_rcc_ahb3rstr_qspirst),
  .dout (cur_rcc_ahb3rstr_qspirst)
);

// --------------------------------------------------------------------------------
// 12:12               fmcrst              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb3rstr_fmcrst_en  = (|wr_req & rcc_ahb3rstr_sel);
assign nxt_rcc_ahb3rstr_fmcrst = wdata[12:12]                ;
assign fmcrst                  = cur_rcc_ahb3rstr_fmcrst     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb3rstr_fmcrst (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_ahb3rstr_fmcrst_en ),
  .din  (nxt_rcc_ahb3rstr_fmcrst),
  .dout (cur_rcc_ahb3rstr_fmcrst)
);

// --------------------------------------------------------------------------------
// 5:5                 jpgdecrst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb3rstr_jpgdecrst_en  = (|wr_req & rcc_ahb3rstr_sel);
assign nxt_rcc_ahb3rstr_jpgdecrst = wdata[5:5]                  ;
assign jpgdecrst                  = cur_rcc_ahb3rstr_jpgdecrst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb3rstr_jpgdecrst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_ahb3rstr_jpgdecrst_en ),
  .din  (nxt_rcc_ahb3rstr_jpgdecrst),
  .dout (cur_rcc_ahb3rstr_jpgdecrst)
);

// --------------------------------------------------------------------------------
// 4:4                 dma2drst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb3rstr_dma2drst_en  = (|wr_req & rcc_ahb3rstr_sel);
assign nxt_rcc_ahb3rstr_dma2drst = wdata[4:4]                  ;
assign dma2drst                  = cur_rcc_ahb3rstr_dma2drst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb3rstr_dma2drst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_ahb3rstr_dma2drst_en ),
  .din  (nxt_rcc_ahb3rstr_dma2drst),
  .dout (cur_rcc_ahb3rstr_dma2drst)
);

// --------------------------------------------------------------------------------
// 0:0                 mdmarst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb3rstr_mdmarst_en  = (|wr_req & rcc_ahb3rstr_sel);
assign nxt_rcc_ahb3rstr_mdmarst = wdata[0:0]                  ;
assign mdmarst                  = cur_rcc_ahb3rstr_mdmarst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb3rstr_mdmarst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_ahb3rstr_mdmarst_en ),
  .din  (nxt_rcc_ahb3rstr_mdmarst),
  .dout (cur_rcc_ahb3rstr_mdmarst)
);


// --------------------------------------------------------------------------------
// rcc_ahb1rstr                            0x80                                    
// --------------------------------------------------------------------------------
// 27:27               usb2otgrst          RW                  0b0                 
// --------------------------------------------------------------------------------
// 25:25               usb1otgrst          RW                  0b0                 
// --------------------------------------------------------------------------------
// 15:15               eth1macrst          RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 adc12rst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 dma2rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 dma1rst             RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_ahb1rstr read data
// --------------------------------------------------------------------------------
assign rcc_ahb1rstr_read = {{4{1'b0}}
                         , cur_rcc_ahb1rstr_usb2otgrst
                         , {1{1'b0}}
                         , cur_rcc_ahb1rstr_usb1otgrst
                         , {9{1'b0}}
                         , cur_rcc_ahb1rstr_eth1macrst
                         , {9{1'b0}}
                         , cur_rcc_ahb1rstr_adc12rst
                         , {3{1'b0}}
                         , cur_rcc_ahb1rstr_dma2rst
                         , cur_rcc_ahb1rstr_dma1rst};

// --------------------------------------------------------------------------------
// 27:27               usb2otgrst          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb1rstr_usb2otgrst_en  = (|wr_req & rcc_ahb1rstr_sel);
assign nxt_rcc_ahb1rstr_usb2otgrst = wdata[27:27]                ;
assign usb2otgrst                  = cur_rcc_ahb1rstr_usb2otgrst ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb1rstr_usb2otgrst (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_ahb1rstr_usb2otgrst_en ),
  .din  (nxt_rcc_ahb1rstr_usb2otgrst),
  .dout (cur_rcc_ahb1rstr_usb2otgrst)
);

// --------------------------------------------------------------------------------
// 25:25               usb1otgrst          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb1rstr_usb1otgrst_en  = (|wr_req & rcc_ahb1rstr_sel);
assign nxt_rcc_ahb1rstr_usb1otgrst = wdata[25:25]                ;
assign usb1otgrst                  = cur_rcc_ahb1rstr_usb1otgrst ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb1rstr_usb1otgrst (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_ahb1rstr_usb1otgrst_en ),
  .din  (nxt_rcc_ahb1rstr_usb1otgrst),
  .dout (cur_rcc_ahb1rstr_usb1otgrst)
);

// --------------------------------------------------------------------------------
// 15:15               eth1macrst          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb1rstr_eth1macrst_en  = (|wr_req & rcc_ahb1rstr_sel);
assign nxt_rcc_ahb1rstr_eth1macrst = wdata[15:15]                ;
assign eth1macrst                  = cur_rcc_ahb1rstr_eth1macrst ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb1rstr_eth1macrst (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_ahb1rstr_eth1macrst_en ),
  .din  (nxt_rcc_ahb1rstr_eth1macrst),
  .dout (cur_rcc_ahb1rstr_eth1macrst)
);

// --------------------------------------------------------------------------------
// 5:5                 adc12rst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb1rstr_adc12rst_en  = (|wr_req & rcc_ahb1rstr_sel);
assign nxt_rcc_ahb1rstr_adc12rst = wdata[5:5]                  ;
assign adc12rst                  = cur_rcc_ahb1rstr_adc12rst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb1rstr_adc12rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_ahb1rstr_adc12rst_en ),
  .din  (nxt_rcc_ahb1rstr_adc12rst),
  .dout (cur_rcc_ahb1rstr_adc12rst)
);

// --------------------------------------------------------------------------------
// 1:1                 dma2rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb1rstr_dma2rst_en  = (|wr_req & rcc_ahb1rstr_sel);
assign nxt_rcc_ahb1rstr_dma2rst = wdata[1:1]                  ;
assign dma2rst                  = cur_rcc_ahb1rstr_dma2rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb1rstr_dma2rst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_ahb1rstr_dma2rst_en ),
  .din  (nxt_rcc_ahb1rstr_dma2rst),
  .dout (cur_rcc_ahb1rstr_dma2rst)
);

// --------------------------------------------------------------------------------
// 0:0                 dma1rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb1rstr_dma1rst_en  = (|wr_req & rcc_ahb1rstr_sel);
assign nxt_rcc_ahb1rstr_dma1rst = wdata[0:0]                  ;
assign dma1rst                  = cur_rcc_ahb1rstr_dma1rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb1rstr_dma1rst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_ahb1rstr_dma1rst_en ),
  .din  (nxt_rcc_ahb1rstr_dma1rst),
  .dout (cur_rcc_ahb1rstr_dma1rst)
);


// --------------------------------------------------------------------------------
// rcc_ahb2rstr                            0x84                                    
// --------------------------------------------------------------------------------
// 9:9                 sdmmc2rst           RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:6                 rngrst              RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 hashrst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 cryptrst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 dcmirst             RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_ahb2rstr read data
// --------------------------------------------------------------------------------
assign rcc_ahb2rstr_read = {{22{1'b0}}
                         , cur_rcc_ahb2rstr_sdmmc2rst
                         , {2{1'b0}}
                         , cur_rcc_ahb2rstr_rngrst
                         , cur_rcc_ahb2rstr_hashrst
                         , cur_rcc_ahb2rstr_cryptrst
                         , {3{1'b0}}
                         , cur_rcc_ahb2rstr_dcmirst};

// --------------------------------------------------------------------------------
// 9:9                 sdmmc2rst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb2rstr_sdmmc2rst_en  = (|wr_req & rcc_ahb2rstr_sel);
assign nxt_rcc_ahb2rstr_sdmmc2rst = wdata[9:9]                  ;
assign sdmmc2rst                  = cur_rcc_ahb2rstr_sdmmc2rst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb2rstr_sdmmc2rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_ahb2rstr_sdmmc2rst_en ),
  .din  (nxt_rcc_ahb2rstr_sdmmc2rst),
  .dout (cur_rcc_ahb2rstr_sdmmc2rst)
);

// --------------------------------------------------------------------------------
// 6:6                 rngrst              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb2rstr_rngrst_en  = (|wr_req & rcc_ahb2rstr_sel);
assign nxt_rcc_ahb2rstr_rngrst = wdata[6:6]                  ;
assign rngrst                  = cur_rcc_ahb2rstr_rngrst     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb2rstr_rngrst (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_ahb2rstr_rngrst_en ),
  .din  (nxt_rcc_ahb2rstr_rngrst),
  .dout (cur_rcc_ahb2rstr_rngrst)
);

// --------------------------------------------------------------------------------
// 5:5                 hashrst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb2rstr_hashrst_en  = (|wr_req & rcc_ahb2rstr_sel);
assign nxt_rcc_ahb2rstr_hashrst = wdata[5:5]                  ;
assign hashrst                  = cur_rcc_ahb2rstr_hashrst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb2rstr_hashrst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_ahb2rstr_hashrst_en ),
  .din  (nxt_rcc_ahb2rstr_hashrst),
  .dout (cur_rcc_ahb2rstr_hashrst)
);

// --------------------------------------------------------------------------------
// 4:4                 cryptrst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb2rstr_cryptrst_en  = (|wr_req & rcc_ahb2rstr_sel);
assign nxt_rcc_ahb2rstr_cryptrst = wdata[4:4]                  ;
assign cryptrst                  = cur_rcc_ahb2rstr_cryptrst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb2rstr_cryptrst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_ahb2rstr_cryptrst_en ),
  .din  (nxt_rcc_ahb2rstr_cryptrst),
  .dout (cur_rcc_ahb2rstr_cryptrst)
);

// --------------------------------------------------------------------------------
// 0:0                 dcmirst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb2rstr_dcmirst_en  = (|wr_req & rcc_ahb2rstr_sel);
assign nxt_rcc_ahb2rstr_dcmirst = wdata[0:0]                  ;
assign dcmirst                  = cur_rcc_ahb2rstr_dcmirst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb2rstr_dcmirst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_ahb2rstr_dcmirst_en ),
  .din  (nxt_rcc_ahb2rstr_dcmirst),
  .dout (cur_rcc_ahb2rstr_dcmirst)
);


// --------------------------------------------------------------------------------
// rcc_ahb4rstr                            0x88                                    
// --------------------------------------------------------------------------------
// 25:25               hsemrst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 24:24               adc3rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 21:21               bdmarst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 19:19               crcrst              RW                  0b0                 
// --------------------------------------------------------------------------------
// 10:10               gpiokrst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 gpiojrst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 gpioirst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 gpiohrst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:6                 gpiogrst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 gpiofrst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 gpioerst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 gpiodrst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 gpiocrst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 gpiobrst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 gpioarst            RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_ahb4rstr read data
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_read = {{6{1'b0}}
                         , cur_rcc_ahb4rstr_hsemrst
                         , cur_rcc_ahb4rstr_adc3rst
                         , {2{1'b0}}
                         , cur_rcc_ahb4rstr_bdmarst
                         , {1{1'b0}}
                         , cur_rcc_ahb4rstr_crcrst
                         , {8{1'b0}}
                         , cur_rcc_ahb4rstr_gpiokrst
                         , cur_rcc_ahb4rstr_gpiojrst
                         , cur_rcc_ahb4rstr_gpioirst
                         , cur_rcc_ahb4rstr_gpiohrst
                         , cur_rcc_ahb4rstr_gpiogrst
                         , cur_rcc_ahb4rstr_gpiofrst
                         , cur_rcc_ahb4rstr_gpioerst
                         , cur_rcc_ahb4rstr_gpiodrst
                         , cur_rcc_ahb4rstr_gpiocrst
                         , cur_rcc_ahb4rstr_gpiobrst
                         , cur_rcc_ahb4rstr_gpioarst};

// --------------------------------------------------------------------------------
// 25:25               hsemrst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_hsemrst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_hsemrst = wdata[25:25]                ;
assign hsemrst                  = cur_rcc_ahb4rstr_hsemrst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_hsemrst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_ahb4rstr_hsemrst_en ),
  .din  (nxt_rcc_ahb4rstr_hsemrst),
  .dout (cur_rcc_ahb4rstr_hsemrst)
);

// --------------------------------------------------------------------------------
// 24:24               adc3rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_adc3rst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_adc3rst = wdata[24:24]                ;
assign adc3rst                  = cur_rcc_ahb4rstr_adc3rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_adc3rst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_ahb4rstr_adc3rst_en ),
  .din  (nxt_rcc_ahb4rstr_adc3rst),
  .dout (cur_rcc_ahb4rstr_adc3rst)
);

// --------------------------------------------------------------------------------
// 21:21               bdmarst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_bdmarst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_bdmarst = wdata[21:21]                ;
assign bdmarst                  = cur_rcc_ahb4rstr_bdmarst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_bdmarst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_ahb4rstr_bdmarst_en ),
  .din  (nxt_rcc_ahb4rstr_bdmarst),
  .dout (cur_rcc_ahb4rstr_bdmarst)
);

// --------------------------------------------------------------------------------
// 19:19               crcrst              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_crcrst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_crcrst = wdata[19:19]                ;
assign crcrst                  = cur_rcc_ahb4rstr_crcrst     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_crcrst (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_ahb4rstr_crcrst_en ),
  .din  (nxt_rcc_ahb4rstr_crcrst),
  .dout (cur_rcc_ahb4rstr_crcrst)
);

// --------------------------------------------------------------------------------
// 10:10               gpiokrst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_gpiokrst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_gpiokrst = wdata[10:10]                ;
assign gpiokrst                  = cur_rcc_ahb4rstr_gpiokrst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_gpiokrst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_ahb4rstr_gpiokrst_en ),
  .din  (nxt_rcc_ahb4rstr_gpiokrst),
  .dout (cur_rcc_ahb4rstr_gpiokrst)
);

// --------------------------------------------------------------------------------
// 9:9                 gpiojrst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_gpiojrst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_gpiojrst = wdata[9:9]                  ;
assign gpiojrst                  = cur_rcc_ahb4rstr_gpiojrst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_gpiojrst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_ahb4rstr_gpiojrst_en ),
  .din  (nxt_rcc_ahb4rstr_gpiojrst),
  .dout (cur_rcc_ahb4rstr_gpiojrst)
);

// --------------------------------------------------------------------------------
// 8:8                 gpioirst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_gpioirst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_gpioirst = wdata[8:8]                  ;
assign gpioirst                  = cur_rcc_ahb4rstr_gpioirst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_gpioirst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_ahb4rstr_gpioirst_en ),
  .din  (nxt_rcc_ahb4rstr_gpioirst),
  .dout (cur_rcc_ahb4rstr_gpioirst)
);

// --------------------------------------------------------------------------------
// 7:7                 gpiohrst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_gpiohrst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_gpiohrst = wdata[7:7]                  ;
assign gpiohrst                  = cur_rcc_ahb4rstr_gpiohrst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_gpiohrst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_ahb4rstr_gpiohrst_en ),
  .din  (nxt_rcc_ahb4rstr_gpiohrst),
  .dout (cur_rcc_ahb4rstr_gpiohrst)
);

// --------------------------------------------------------------------------------
// 6:6                 gpiogrst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_gpiogrst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_gpiogrst = wdata[6:6]                  ;
assign gpiogrst                  = cur_rcc_ahb4rstr_gpiogrst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_gpiogrst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_ahb4rstr_gpiogrst_en ),
  .din  (nxt_rcc_ahb4rstr_gpiogrst),
  .dout (cur_rcc_ahb4rstr_gpiogrst)
);

// --------------------------------------------------------------------------------
// 5:5                 gpiofrst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_gpiofrst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_gpiofrst = wdata[5:5]                  ;
assign gpiofrst                  = cur_rcc_ahb4rstr_gpiofrst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_gpiofrst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_ahb4rstr_gpiofrst_en ),
  .din  (nxt_rcc_ahb4rstr_gpiofrst),
  .dout (cur_rcc_ahb4rstr_gpiofrst)
);

// --------------------------------------------------------------------------------
// 4:4                 gpioerst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_gpioerst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_gpioerst = wdata[4:4]                  ;
assign gpioerst                  = cur_rcc_ahb4rstr_gpioerst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_gpioerst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_ahb4rstr_gpioerst_en ),
  .din  (nxt_rcc_ahb4rstr_gpioerst),
  .dout (cur_rcc_ahb4rstr_gpioerst)
);

// --------------------------------------------------------------------------------
// 3:3                 gpiodrst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_gpiodrst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_gpiodrst = wdata[3:3]                  ;
assign gpiodrst                  = cur_rcc_ahb4rstr_gpiodrst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_gpiodrst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_ahb4rstr_gpiodrst_en ),
  .din  (nxt_rcc_ahb4rstr_gpiodrst),
  .dout (cur_rcc_ahb4rstr_gpiodrst)
);

// --------------------------------------------------------------------------------
// 2:2                 gpiocrst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_gpiocrst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_gpiocrst = wdata[2:2]                  ;
assign gpiocrst                  = cur_rcc_ahb4rstr_gpiocrst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_gpiocrst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_ahb4rstr_gpiocrst_en ),
  .din  (nxt_rcc_ahb4rstr_gpiocrst),
  .dout (cur_rcc_ahb4rstr_gpiocrst)
);

// --------------------------------------------------------------------------------
// 1:1                 gpiobrst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_gpiobrst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_gpiobrst = wdata[1:1]                  ;
assign gpiobrst                  = cur_rcc_ahb4rstr_gpiobrst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_gpiobrst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_ahb4rstr_gpiobrst_en ),
  .din  (nxt_rcc_ahb4rstr_gpiobrst),
  .dout (cur_rcc_ahb4rstr_gpiobrst)
);

// --------------------------------------------------------------------------------
// 0:0                 gpioarst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_ahb4rstr_gpioarst_en  = (|wr_req & rcc_ahb4rstr_sel);
assign nxt_rcc_ahb4rstr_gpioarst = wdata[0:0]                  ;
assign gpioarst                  = cur_rcc_ahb4rstr_gpioarst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_ahb4rstr_gpioarst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_ahb4rstr_gpioarst_en ),
  .din  (nxt_rcc_ahb4rstr_gpioarst),
  .dout (cur_rcc_ahb4rstr_gpioarst)
);


// --------------------------------------------------------------------------------
// rcc_apb3rstr                            0x8c                                    
// --------------------------------------------------------------------------------
// 3:3                 ltdcrst             RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_apb3rstr read data
// --------------------------------------------------------------------------------
assign rcc_apb3rstr_read = {{28{1'b0}}
                         , cur_rcc_apb3rstr_ltdcrst
                         , {3{1'b0}}};

// --------------------------------------------------------------------------------
// 3:3                 ltdcrst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb3rstr_ltdcrst_en  = (|wr_req & rcc_apb3rstr_sel);
assign nxt_rcc_apb3rstr_ltdcrst = wdata[3:3]                  ;
assign ltdcrst                  = cur_rcc_apb3rstr_ltdcrst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb3rstr_ltdcrst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb3rstr_ltdcrst_en ),
  .din  (nxt_rcc_apb3rstr_ltdcrst),
  .dout (cur_rcc_apb3rstr_ltdcrst)
);


// --------------------------------------------------------------------------------
// rcc_apb1lrstr                           0x90                                    
// --------------------------------------------------------------------------------
// 31:31               uart8rst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 30:30               uart7rst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 29:29               dac12rst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 27:27               hdmicecrst          RW                  0b0                 
// --------------------------------------------------------------------------------
// 23:23               i2c3rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 22:22               i2c2rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 21:21               i2c1rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 20:20               uart5rst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 19:19               uart4rst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 18:18               usart3rst           RW                  0b0                 
// --------------------------------------------------------------------------------
// 17:17               usart2rst           RW                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               spdifrxrst          RW                  0b0                 
// --------------------------------------------------------------------------------
// 15:15               spi3rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 14:14               spi2rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 lptim1rst           RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 tim14rst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 tim13rst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:6                 tim12rst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 tim7rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 tim6rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 tim5rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 tim4rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 tim3rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 tim2rst             RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_apb1lrstr read data
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_read = {cur_rcc_apb1lrstr_uart8rst
                          , cur_rcc_apb1lrstr_uart7rst
                          , cur_rcc_apb1lrstr_dac12rst
                          , {1{1'b0}}
                          , cur_rcc_apb1lrstr_hdmicecrst
                          , {3{1'b0}}
                          , cur_rcc_apb1lrstr_i2c3rst
                          , cur_rcc_apb1lrstr_i2c2rst
                          , cur_rcc_apb1lrstr_i2c1rst
                          , cur_rcc_apb1lrstr_uart5rst
                          , cur_rcc_apb1lrstr_uart4rst
                          , cur_rcc_apb1lrstr_usart3rst
                          , cur_rcc_apb1lrstr_usart2rst
                          , cur_rcc_apb1lrstr_spdifrxrst
                          , cur_rcc_apb1lrstr_spi3rst
                          , cur_rcc_apb1lrstr_spi2rst
                          , {4{1'b0}}
                          , cur_rcc_apb1lrstr_lptim1rst
                          , cur_rcc_apb1lrstr_tim14rst
                          , cur_rcc_apb1lrstr_tim13rst
                          , cur_rcc_apb1lrstr_tim12rst
                          , cur_rcc_apb1lrstr_tim7rst
                          , cur_rcc_apb1lrstr_tim6rst
                          , cur_rcc_apb1lrstr_tim5rst
                          , cur_rcc_apb1lrstr_tim4rst
                          , cur_rcc_apb1lrstr_tim3rst
                          , cur_rcc_apb1lrstr_tim2rst};

// --------------------------------------------------------------------------------
// 31:31               uart8rst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_uart8rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_uart8rst = wdata[31:31]                 ;
assign uart8rst                   = cur_rcc_apb1lrstr_uart8rst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_uart8rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb1lrstr_uart8rst_en ),
  .din  (nxt_rcc_apb1lrstr_uart8rst),
  .dout (cur_rcc_apb1lrstr_uart8rst)
);

// --------------------------------------------------------------------------------
// 30:30               uart7rst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_uart7rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_uart7rst = wdata[30:30]                 ;
assign uart7rst                   = cur_rcc_apb1lrstr_uart7rst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_uart7rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb1lrstr_uart7rst_en ),
  .din  (nxt_rcc_apb1lrstr_uart7rst),
  .dout (cur_rcc_apb1lrstr_uart7rst)
);

// --------------------------------------------------------------------------------
// 29:29               dac12rst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_dac12rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_dac12rst = wdata[29:29]                 ;
assign dac12rst                   = cur_rcc_apb1lrstr_dac12rst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_dac12rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb1lrstr_dac12rst_en ),
  .din  (nxt_rcc_apb1lrstr_dac12rst),
  .dout (cur_rcc_apb1lrstr_dac12rst)
);

// --------------------------------------------------------------------------------
// 27:27               hdmicecrst          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_hdmicecrst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_hdmicecrst = wdata[27:27]                 ;
assign hdmicecrst                   = cur_rcc_apb1lrstr_hdmicecrst ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_hdmicecrst (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_apb1lrstr_hdmicecrst_en ),
  .din  (nxt_rcc_apb1lrstr_hdmicecrst),
  .dout (cur_rcc_apb1lrstr_hdmicecrst)
);

// --------------------------------------------------------------------------------
// 23:23               i2c3rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_i2c3rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_i2c3rst = wdata[23:23]                 ;
assign i2c3rst                   = cur_rcc_apb1lrstr_i2c3rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_i2c3rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb1lrstr_i2c3rst_en ),
  .din  (nxt_rcc_apb1lrstr_i2c3rst),
  .dout (cur_rcc_apb1lrstr_i2c3rst)
);

// --------------------------------------------------------------------------------
// 22:22               i2c2rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_i2c2rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_i2c2rst = wdata[22:22]                 ;
assign i2c2rst                   = cur_rcc_apb1lrstr_i2c2rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_i2c2rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb1lrstr_i2c2rst_en ),
  .din  (nxt_rcc_apb1lrstr_i2c2rst),
  .dout (cur_rcc_apb1lrstr_i2c2rst)
);

// --------------------------------------------------------------------------------
// 21:21               i2c1rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_i2c1rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_i2c1rst = wdata[21:21]                 ;
assign i2c1rst                   = cur_rcc_apb1lrstr_i2c1rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_i2c1rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb1lrstr_i2c1rst_en ),
  .din  (nxt_rcc_apb1lrstr_i2c1rst),
  .dout (cur_rcc_apb1lrstr_i2c1rst)
);

// --------------------------------------------------------------------------------
// 20:20               uart5rst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_uart5rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_uart5rst = wdata[20:20]                 ;
assign uart5rst                   = cur_rcc_apb1lrstr_uart5rst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_uart5rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb1lrstr_uart5rst_en ),
  .din  (nxt_rcc_apb1lrstr_uart5rst),
  .dout (cur_rcc_apb1lrstr_uart5rst)
);

// --------------------------------------------------------------------------------
// 19:19               uart4rst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_uart4rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_uart4rst = wdata[19:19]                 ;
assign uart4rst                   = cur_rcc_apb1lrstr_uart4rst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_uart4rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb1lrstr_uart4rst_en ),
  .din  (nxt_rcc_apb1lrstr_uart4rst),
  .dout (cur_rcc_apb1lrstr_uart4rst)
);

// --------------------------------------------------------------------------------
// 18:18               usart3rst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_usart3rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_usart3rst = wdata[18:18]                 ;
assign usart3rst                   = cur_rcc_apb1lrstr_usart3rst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_usart3rst (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_apb1lrstr_usart3rst_en ),
  .din  (nxt_rcc_apb1lrstr_usart3rst),
  .dout (cur_rcc_apb1lrstr_usart3rst)
);

// --------------------------------------------------------------------------------
// 17:17               usart2rst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_usart2rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_usart2rst = wdata[17:17]                 ;
assign usart2rst                   = cur_rcc_apb1lrstr_usart2rst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_usart2rst (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_apb1lrstr_usart2rst_en ),
  .din  (nxt_rcc_apb1lrstr_usart2rst),
  .dout (cur_rcc_apb1lrstr_usart2rst)
);

// --------------------------------------------------------------------------------
// 16:16               spdifrxrst          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_spdifrxrst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_spdifrxrst = wdata[16:16]                 ;
assign spdifrxrst                   = cur_rcc_apb1lrstr_spdifrxrst ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_spdifrxrst (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_apb1lrstr_spdifrxrst_en ),
  .din  (nxt_rcc_apb1lrstr_spdifrxrst),
  .dout (cur_rcc_apb1lrstr_spdifrxrst)
);

// --------------------------------------------------------------------------------
// 15:15               spi3rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_spi3rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_spi3rst = wdata[15:15]                 ;
assign spi3rst                   = cur_rcc_apb1lrstr_spi3rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_spi3rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb1lrstr_spi3rst_en ),
  .din  (nxt_rcc_apb1lrstr_spi3rst),
  .dout (cur_rcc_apb1lrstr_spi3rst)
);

// --------------------------------------------------------------------------------
// 14:14               spi2rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_spi2rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_spi2rst = wdata[14:14]                 ;
assign spi2rst                   = cur_rcc_apb1lrstr_spi2rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_spi2rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb1lrstr_spi2rst_en ),
  .din  (nxt_rcc_apb1lrstr_spi2rst),
  .dout (cur_rcc_apb1lrstr_spi2rst)
);

// --------------------------------------------------------------------------------
// 9:9                 lptim1rst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_lptim1rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_lptim1rst = wdata[9:9]                   ;
assign lptim1rst                   = cur_rcc_apb1lrstr_lptim1rst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_lptim1rst (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_apb1lrstr_lptim1rst_en ),
  .din  (nxt_rcc_apb1lrstr_lptim1rst),
  .dout (cur_rcc_apb1lrstr_lptim1rst)
);

// --------------------------------------------------------------------------------
// 8:8                 tim14rst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_tim14rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_tim14rst = wdata[8:8]                   ;
assign tim14rst                   = cur_rcc_apb1lrstr_tim14rst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_tim14rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb1lrstr_tim14rst_en ),
  .din  (nxt_rcc_apb1lrstr_tim14rst),
  .dout (cur_rcc_apb1lrstr_tim14rst)
);

// --------------------------------------------------------------------------------
// 7:7                 tim13rst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_tim13rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_tim13rst = wdata[7:7]                   ;
assign tim13rst                   = cur_rcc_apb1lrstr_tim13rst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_tim13rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb1lrstr_tim13rst_en ),
  .din  (nxt_rcc_apb1lrstr_tim13rst),
  .dout (cur_rcc_apb1lrstr_tim13rst)
);

// --------------------------------------------------------------------------------
// 6:6                 tim12rst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_tim12rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_tim12rst = wdata[6:6]                   ;
assign tim12rst                   = cur_rcc_apb1lrstr_tim12rst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_tim12rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb1lrstr_tim12rst_en ),
  .din  (nxt_rcc_apb1lrstr_tim12rst),
  .dout (cur_rcc_apb1lrstr_tim12rst)
);

// --------------------------------------------------------------------------------
// 5:5                 tim7rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_tim7rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_tim7rst = wdata[5:5]                   ;
assign tim7rst                   = cur_rcc_apb1lrstr_tim7rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_tim7rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb1lrstr_tim7rst_en ),
  .din  (nxt_rcc_apb1lrstr_tim7rst),
  .dout (cur_rcc_apb1lrstr_tim7rst)
);

// --------------------------------------------------------------------------------
// 4:4                 tim6rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_tim6rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_tim6rst = wdata[4:4]                   ;
assign tim6rst                   = cur_rcc_apb1lrstr_tim6rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_tim6rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb1lrstr_tim6rst_en ),
  .din  (nxt_rcc_apb1lrstr_tim6rst),
  .dout (cur_rcc_apb1lrstr_tim6rst)
);

// --------------------------------------------------------------------------------
// 3:3                 tim5rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_tim5rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_tim5rst = wdata[3:3]                   ;
assign tim5rst                   = cur_rcc_apb1lrstr_tim5rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_tim5rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb1lrstr_tim5rst_en ),
  .din  (nxt_rcc_apb1lrstr_tim5rst),
  .dout (cur_rcc_apb1lrstr_tim5rst)
);

// --------------------------------------------------------------------------------
// 2:2                 tim4rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_tim4rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_tim4rst = wdata[2:2]                   ;
assign tim4rst                   = cur_rcc_apb1lrstr_tim4rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_tim4rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb1lrstr_tim4rst_en ),
  .din  (nxt_rcc_apb1lrstr_tim4rst),
  .dout (cur_rcc_apb1lrstr_tim4rst)
);

// --------------------------------------------------------------------------------
// 1:1                 tim3rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_tim3rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_tim3rst = wdata[1:1]                   ;
assign tim3rst                   = cur_rcc_apb1lrstr_tim3rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_tim3rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb1lrstr_tim3rst_en ),
  .din  (nxt_rcc_apb1lrstr_tim3rst),
  .dout (cur_rcc_apb1lrstr_tim3rst)
);

// --------------------------------------------------------------------------------
// 0:0                 tim2rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1lrstr_tim2rst_en  = (|wr_req & rcc_apb1lrstr_sel);
assign nxt_rcc_apb1lrstr_tim2rst = wdata[0:0]                   ;
assign tim2rst                   = cur_rcc_apb1lrstr_tim2rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1lrstr_tim2rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb1lrstr_tim2rst_en ),
  .din  (nxt_rcc_apb1lrstr_tim2rst),
  .dout (cur_rcc_apb1lrstr_tim2rst)
);


// --------------------------------------------------------------------------------
// rcc_apb1hrstr                           0x94                                    
// --------------------------------------------------------------------------------
// 8:8                 fdcanrst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 mdiosrst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 opamprst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 swprst              RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 crsrst              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_apb1hrstr read data
// --------------------------------------------------------------------------------
assign rcc_apb1hrstr_read = {{23{1'b0}}
                          , cur_rcc_apb1hrstr_fdcanrst
                          , {2{1'b0}}
                          , cur_rcc_apb1hrstr_mdiosrst
                          , cur_rcc_apb1hrstr_opamprst
                          , {1{1'b0}}
                          , cur_rcc_apb1hrstr_swprst
                          , cur_rcc_apb1hrstr_crsrst
                          , {1{1'b0}}};

// --------------------------------------------------------------------------------
// 8:8                 fdcanrst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1hrstr_fdcanrst_en  = (|wr_req & rcc_apb1hrstr_sel);
assign nxt_rcc_apb1hrstr_fdcanrst = wdata[8:8]                   ;
assign fdcanrst                   = cur_rcc_apb1hrstr_fdcanrst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1hrstr_fdcanrst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb1hrstr_fdcanrst_en ),
  .din  (nxt_rcc_apb1hrstr_fdcanrst),
  .dout (cur_rcc_apb1hrstr_fdcanrst)
);

// --------------------------------------------------------------------------------
// 5:5                 mdiosrst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1hrstr_mdiosrst_en  = (|wr_req & rcc_apb1hrstr_sel);
assign nxt_rcc_apb1hrstr_mdiosrst = wdata[5:5]                   ;
assign mdiosrst                   = cur_rcc_apb1hrstr_mdiosrst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1hrstr_mdiosrst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb1hrstr_mdiosrst_en ),
  .din  (nxt_rcc_apb1hrstr_mdiosrst),
  .dout (cur_rcc_apb1hrstr_mdiosrst)
);

// --------------------------------------------------------------------------------
// 4:4                 opamprst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1hrstr_opamprst_en  = (|wr_req & rcc_apb1hrstr_sel);
assign nxt_rcc_apb1hrstr_opamprst = wdata[4:4]                   ;
assign opamprst                   = cur_rcc_apb1hrstr_opamprst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1hrstr_opamprst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb1hrstr_opamprst_en ),
  .din  (nxt_rcc_apb1hrstr_opamprst),
  .dout (cur_rcc_apb1hrstr_opamprst)
);

// --------------------------------------------------------------------------------
// 2:2                 swprst              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1hrstr_swprst_en  = (|wr_req & rcc_apb1hrstr_sel);
assign nxt_rcc_apb1hrstr_swprst = wdata[2:2]                   ;
assign swprst                   = cur_rcc_apb1hrstr_swprst     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1hrstr_swprst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb1hrstr_swprst_en ),
  .din  (nxt_rcc_apb1hrstr_swprst),
  .dout (cur_rcc_apb1hrstr_swprst)
);

// --------------------------------------------------------------------------------
// 1:1                 crsrst              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb1hrstr_crsrst_en  = (|wr_req & rcc_apb1hrstr_sel);
assign nxt_rcc_apb1hrstr_crsrst = wdata[1:1]                   ;
assign crsrst                   = cur_rcc_apb1hrstr_crsrst     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb1hrstr_crsrst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb1hrstr_crsrst_en ),
  .din  (nxt_rcc_apb1hrstr_crsrst),
  .dout (cur_rcc_apb1hrstr_crsrst)
);


// --------------------------------------------------------------------------------
// rcc_apb2rstr                            0x98                                    
// --------------------------------------------------------------------------------
// 29:29               hrtimrst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 28:28               dfsdm1rst           RW                  0b0                 
// --------------------------------------------------------------------------------
// 24:24               sai3rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 23:23               sai2rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 22:22               sai1rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 20:20               spi5rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 18:18               tim17rst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 17:17               tim16rst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               tim15rst            RW                  0b0                 
// --------------------------------------------------------------------------------
// 13:13               spi4rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 12:12               spi1rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 usart6rst           RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 usart1rst           RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 tim8rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 tim1rst             RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_apb2rstr read data
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_read = {{2{1'b0}}
                         , cur_rcc_apb2rstr_hrtimrst
                         , cur_rcc_apb2rstr_dfsdm1rst
                         , {3{1'b0}}
                         , cur_rcc_apb2rstr_sai3rst
                         , cur_rcc_apb2rstr_sai2rst
                         , cur_rcc_apb2rstr_sai1rst
                         , {1{1'b0}}
                         , cur_rcc_apb2rstr_spi5rst
                         , {1{1'b0}}
                         , cur_rcc_apb2rstr_tim17rst
                         , cur_rcc_apb2rstr_tim16rst
                         , cur_rcc_apb2rstr_tim15rst
                         , {2{1'b0}}
                         , cur_rcc_apb2rstr_spi4rst
                         , cur_rcc_apb2rstr_spi1rst
                         , {6{1'b0}}
                         , cur_rcc_apb2rstr_usart6rst
                         , cur_rcc_apb2rstr_usart1rst
                         , {2{1'b0}}
                         , cur_rcc_apb2rstr_tim8rst
                         , cur_rcc_apb2rstr_tim1rst};

// --------------------------------------------------------------------------------
// 29:29               hrtimrst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_hrtimrst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_hrtimrst = wdata[29:29]                ;
assign hrtimrst                  = cur_rcc_apb2rstr_hrtimrst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_hrtimrst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb2rstr_hrtimrst_en ),
  .din  (nxt_rcc_apb2rstr_hrtimrst),
  .dout (cur_rcc_apb2rstr_hrtimrst)
);

// --------------------------------------------------------------------------------
// 28:28               dfsdm1rst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_dfsdm1rst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_dfsdm1rst = wdata[28:28]                ;
assign dfsdm1rst                  = cur_rcc_apb2rstr_dfsdm1rst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_dfsdm1rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb2rstr_dfsdm1rst_en ),
  .din  (nxt_rcc_apb2rstr_dfsdm1rst),
  .dout (cur_rcc_apb2rstr_dfsdm1rst)
);

// --------------------------------------------------------------------------------
// 24:24               sai3rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_sai3rst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_sai3rst = wdata[24:24]                ;
assign sai3rst                  = cur_rcc_apb2rstr_sai3rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_sai3rst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb2rstr_sai3rst_en ),
  .din  (nxt_rcc_apb2rstr_sai3rst),
  .dout (cur_rcc_apb2rstr_sai3rst)
);

// --------------------------------------------------------------------------------
// 23:23               sai2rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_sai2rst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_sai2rst = wdata[23:23]                ;
assign sai2rst                  = cur_rcc_apb2rstr_sai2rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_sai2rst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb2rstr_sai2rst_en ),
  .din  (nxt_rcc_apb2rstr_sai2rst),
  .dout (cur_rcc_apb2rstr_sai2rst)
);

// --------------------------------------------------------------------------------
// 22:22               sai1rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_sai1rst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_sai1rst = wdata[22:22]                ;
assign sai1rst                  = cur_rcc_apb2rstr_sai1rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_sai1rst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb2rstr_sai1rst_en ),
  .din  (nxt_rcc_apb2rstr_sai1rst),
  .dout (cur_rcc_apb2rstr_sai1rst)
);

// --------------------------------------------------------------------------------
// 20:20               spi5rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_spi5rst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_spi5rst = wdata[20:20]                ;
assign spi5rst                  = cur_rcc_apb2rstr_spi5rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_spi5rst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb2rstr_spi5rst_en ),
  .din  (nxt_rcc_apb2rstr_spi5rst),
  .dout (cur_rcc_apb2rstr_spi5rst)
);

// --------------------------------------------------------------------------------
// 18:18               tim17rst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_tim17rst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_tim17rst = wdata[18:18]                ;
assign tim17rst                  = cur_rcc_apb2rstr_tim17rst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_tim17rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb2rstr_tim17rst_en ),
  .din  (nxt_rcc_apb2rstr_tim17rst),
  .dout (cur_rcc_apb2rstr_tim17rst)
);

// --------------------------------------------------------------------------------
// 17:17               tim16rst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_tim16rst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_tim16rst = wdata[17:17]                ;
assign tim16rst                  = cur_rcc_apb2rstr_tim16rst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_tim16rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb2rstr_tim16rst_en ),
  .din  (nxt_rcc_apb2rstr_tim16rst),
  .dout (cur_rcc_apb2rstr_tim16rst)
);

// --------------------------------------------------------------------------------
// 16:16               tim15rst            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_tim15rst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_tim15rst = wdata[16:16]                ;
assign tim15rst                  = cur_rcc_apb2rstr_tim15rst   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_tim15rst (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_apb2rstr_tim15rst_en ),
  .din  (nxt_rcc_apb2rstr_tim15rst),
  .dout (cur_rcc_apb2rstr_tim15rst)
);

// --------------------------------------------------------------------------------
// 13:13               spi4rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_spi4rst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_spi4rst = wdata[13:13]                ;
assign spi4rst                  = cur_rcc_apb2rstr_spi4rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_spi4rst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb2rstr_spi4rst_en ),
  .din  (nxt_rcc_apb2rstr_spi4rst),
  .dout (cur_rcc_apb2rstr_spi4rst)
);

// --------------------------------------------------------------------------------
// 12:12               spi1rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_spi1rst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_spi1rst = wdata[12:12]                ;
assign spi1rst                  = cur_rcc_apb2rstr_spi1rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_spi1rst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb2rstr_spi1rst_en ),
  .din  (nxt_rcc_apb2rstr_spi1rst),
  .dout (cur_rcc_apb2rstr_spi1rst)
);

// --------------------------------------------------------------------------------
// 5:5                 usart6rst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_usart6rst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_usart6rst = wdata[5:5]                  ;
assign usart6rst                  = cur_rcc_apb2rstr_usart6rst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_usart6rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb2rstr_usart6rst_en ),
  .din  (nxt_rcc_apb2rstr_usart6rst),
  .dout (cur_rcc_apb2rstr_usart6rst)
);

// --------------------------------------------------------------------------------
// 4:4                 usart1rst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_usart1rst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_usart1rst = wdata[4:4]                  ;
assign usart1rst                  = cur_rcc_apb2rstr_usart1rst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_usart1rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb2rstr_usart1rst_en ),
  .din  (nxt_rcc_apb2rstr_usart1rst),
  .dout (cur_rcc_apb2rstr_usart1rst)
);

// --------------------------------------------------------------------------------
// 1:1                 tim8rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_tim8rst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_tim8rst = wdata[1:1]                  ;
assign tim8rst                  = cur_rcc_apb2rstr_tim8rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_tim8rst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb2rstr_tim8rst_en ),
  .din  (nxt_rcc_apb2rstr_tim8rst),
  .dout (cur_rcc_apb2rstr_tim8rst)
);

// --------------------------------------------------------------------------------
// 0:0                 tim1rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb2rstr_tim1rst_en  = (|wr_req & rcc_apb2rstr_sel);
assign nxt_rcc_apb2rstr_tim1rst = wdata[0:0]                  ;
assign tim1rst                  = cur_rcc_apb2rstr_tim1rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb2rstr_tim1rst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb2rstr_tim1rst_en ),
  .din  (nxt_rcc_apb2rstr_tim1rst),
  .dout (cur_rcc_apb2rstr_tim1rst)
);


// --------------------------------------------------------------------------------
// rcc_apb4rstr                            0x9c                                    
// --------------------------------------------------------------------------------
// 21:21               sai4rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 15:15               vrefrst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 14:14               comp12rst           RW                  0b0                 
// --------------------------------------------------------------------------------
// 12:12               lptim5rst           RW                  0b0                 
// --------------------------------------------------------------------------------
// 11:11               lptim4rst           RW                  0b0                 
// --------------------------------------------------------------------------------
// 10:10               lptim3rst           RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 lptim2rst           RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 i2c4rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 spi6rst             RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 lpuart1rst          RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 syscfgrst           RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_apb4rstr read data
// --------------------------------------------------------------------------------
assign rcc_apb4rstr_read = {{10{1'b0}}
                         , cur_rcc_apb4rstr_sai4rst
                         , {5{1'b0}}
                         , cur_rcc_apb4rstr_vrefrst
                         , cur_rcc_apb4rstr_comp12rst
                         , {1{1'b0}}
                         , cur_rcc_apb4rstr_lptim5rst
                         , cur_rcc_apb4rstr_lptim4rst
                         , cur_rcc_apb4rstr_lptim3rst
                         , cur_rcc_apb4rstr_lptim2rst
                         , {1{1'b0}}
                         , cur_rcc_apb4rstr_i2c4rst
                         , {1{1'b0}}
                         , cur_rcc_apb4rstr_spi6rst
                         , {1{1'b0}}
                         , cur_rcc_apb4rstr_lpuart1rst
                         , {1{1'b0}}
                         , cur_rcc_apb4rstr_syscfgrst
                         , {1{1'b0}}};

// --------------------------------------------------------------------------------
// 21:21               sai4rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb4rstr_sai4rst_en  = (|wr_req & rcc_apb4rstr_sel);
assign nxt_rcc_apb4rstr_sai4rst = wdata[21:21]                ;
assign sai4rst                  = cur_rcc_apb4rstr_sai4rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb4rstr_sai4rst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb4rstr_sai4rst_en ),
  .din  (nxt_rcc_apb4rstr_sai4rst),
  .dout (cur_rcc_apb4rstr_sai4rst)
);

// --------------------------------------------------------------------------------
// 15:15               vrefrst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb4rstr_vrefrst_en  = (|wr_req & rcc_apb4rstr_sel);
assign nxt_rcc_apb4rstr_vrefrst = wdata[15:15]                ;
assign vrefrst                  = cur_rcc_apb4rstr_vrefrst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb4rstr_vrefrst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb4rstr_vrefrst_en ),
  .din  (nxt_rcc_apb4rstr_vrefrst),
  .dout (cur_rcc_apb4rstr_vrefrst)
);

// --------------------------------------------------------------------------------
// 14:14               comp12rst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb4rstr_comp12rst_en  = (|wr_req & rcc_apb4rstr_sel);
assign nxt_rcc_apb4rstr_comp12rst = wdata[14:14]                ;
assign comp12rst                  = cur_rcc_apb4rstr_comp12rst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb4rstr_comp12rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb4rstr_comp12rst_en ),
  .din  (nxt_rcc_apb4rstr_comp12rst),
  .dout (cur_rcc_apb4rstr_comp12rst)
);

// --------------------------------------------------------------------------------
// 12:12               lptim5rst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb4rstr_lptim5rst_en  = (|wr_req & rcc_apb4rstr_sel);
assign nxt_rcc_apb4rstr_lptim5rst = wdata[12:12]                ;
assign lptim5rst                  = cur_rcc_apb4rstr_lptim5rst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb4rstr_lptim5rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb4rstr_lptim5rst_en ),
  .din  (nxt_rcc_apb4rstr_lptim5rst),
  .dout (cur_rcc_apb4rstr_lptim5rst)
);

// --------------------------------------------------------------------------------
// 11:11               lptim4rst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb4rstr_lptim4rst_en  = (|wr_req & rcc_apb4rstr_sel);
assign nxt_rcc_apb4rstr_lptim4rst = wdata[11:11]                ;
assign lptim4rst                  = cur_rcc_apb4rstr_lptim4rst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb4rstr_lptim4rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb4rstr_lptim4rst_en ),
  .din  (nxt_rcc_apb4rstr_lptim4rst),
  .dout (cur_rcc_apb4rstr_lptim4rst)
);

// --------------------------------------------------------------------------------
// 10:10               lptim3rst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb4rstr_lptim3rst_en  = (|wr_req & rcc_apb4rstr_sel);
assign nxt_rcc_apb4rstr_lptim3rst = wdata[10:10]                ;
assign lptim3rst                  = cur_rcc_apb4rstr_lptim3rst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb4rstr_lptim3rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb4rstr_lptim3rst_en ),
  .din  (nxt_rcc_apb4rstr_lptim3rst),
  .dout (cur_rcc_apb4rstr_lptim3rst)
);

// --------------------------------------------------------------------------------
// 9:9                 lptim2rst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb4rstr_lptim2rst_en  = (|wr_req & rcc_apb4rstr_sel);
assign nxt_rcc_apb4rstr_lptim2rst = wdata[9:9]                  ;
assign lptim2rst                  = cur_rcc_apb4rstr_lptim2rst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb4rstr_lptim2rst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb4rstr_lptim2rst_en ),
  .din  (nxt_rcc_apb4rstr_lptim2rst),
  .dout (cur_rcc_apb4rstr_lptim2rst)
);

// --------------------------------------------------------------------------------
// 7:7                 i2c4rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb4rstr_i2c4rst_en  = (|wr_req & rcc_apb4rstr_sel);
assign nxt_rcc_apb4rstr_i2c4rst = wdata[7:7]                  ;
assign i2c4rst                  = cur_rcc_apb4rstr_i2c4rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb4rstr_i2c4rst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb4rstr_i2c4rst_en ),
  .din  (nxt_rcc_apb4rstr_i2c4rst),
  .dout (cur_rcc_apb4rstr_i2c4rst)
);

// --------------------------------------------------------------------------------
// 5:5                 spi6rst             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb4rstr_spi6rst_en  = (|wr_req & rcc_apb4rstr_sel);
assign nxt_rcc_apb4rstr_spi6rst = wdata[5:5]                  ;
assign spi6rst                  = cur_rcc_apb4rstr_spi6rst    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb4rstr_spi6rst (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_apb4rstr_spi6rst_en ),
  .din  (nxt_rcc_apb4rstr_spi6rst),
  .dout (cur_rcc_apb4rstr_spi6rst)
);

// --------------------------------------------------------------------------------
// 3:3                 lpuart1rst          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb4rstr_lpuart1rst_en  = (|wr_req & rcc_apb4rstr_sel);
assign nxt_rcc_apb4rstr_lpuart1rst = wdata[3:3]                  ;
assign lpuart1rst                  = cur_rcc_apb4rstr_lpuart1rst ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb4rstr_lpuart1rst (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_apb4rstr_lpuart1rst_en ),
  .din  (nxt_rcc_apb4rstr_lpuart1rst),
  .dout (cur_rcc_apb4rstr_lpuart1rst)
);

// --------------------------------------------------------------------------------
// 1:1                 syscfgrst           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_apb4rstr_syscfgrst_en  = (|wr_req & rcc_apb4rstr_sel);
assign nxt_rcc_apb4rstr_syscfgrst = wdata[1:1]                  ;
assign syscfgrst                  = cur_rcc_apb4rstr_syscfgrst  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_apb4rstr_syscfgrst (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_apb4rstr_syscfgrst_en ),
  .din  (nxt_rcc_apb4rstr_syscfgrst),
  .dout (cur_rcc_apb4rstr_syscfgrst)
);


// --------------------------------------------------------------------------------
// rcc_gcr                                 0xa0                                    
// --------------------------------------------------------------------------------
// 1:1                 ww2rsc              RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 ww1rsc              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_gcr read data
// --------------------------------------------------------------------------------
assign rcc_gcr_read = {{30{1'b0}}
                    , cur_rcc_gcr_ww2rsc
                    , cur_rcc_gcr_ww1rsc};

// --------------------------------------------------------------------------------
// 1:1                 ww2rsc              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_gcr_ww2rsc_en  = (|wr_req & rcc_gcr_sel);
assign nxt_rcc_gcr_ww2rsc = wdata[1:1]             ;
assign ww2rsc             = cur_rcc_gcr_ww2rsc     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_gcr_ww2rsc (
  .clk  (clk               ),
  .rst_n(rst_n             ),
  .en   (rcc_gcr_ww2rsc_en ),
  .din  (nxt_rcc_gcr_ww2rsc),
  .dout (cur_rcc_gcr_ww2rsc)
);

// --------------------------------------------------------------------------------
// 0:0                 ww1rsc              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_gcr_ww1rsc_en  = (|wr_req & rcc_gcr_sel);
assign nxt_rcc_gcr_ww1rsc = wdata[0:0]             ;
assign ww1rsc             = cur_rcc_gcr_ww1rsc     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_gcr_ww1rsc (
  .clk  (clk               ),
  .rst_n(rst_n             ),
  .en   (rcc_gcr_ww1rsc_en ),
  .din  (nxt_rcc_gcr_ww1rsc),
  .dout (cur_rcc_gcr_ww1rsc)
);


// --------------------------------------------------------------------------------
// rcc_d3amr                               0xa8                                    
// --------------------------------------------------------------------------------
// 29:29               sram4amen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 28:28               bkpramamen          RW                  0b0                 
// --------------------------------------------------------------------------------
// 24:24               adc3amen            RW                  0b0                 
// --------------------------------------------------------------------------------
// 21:21               sai4amen            RW                  0b0                 
// --------------------------------------------------------------------------------
// 19:19               crcamen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               rtcamen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 15:15               vrefamen            RW                  0b0                 
// --------------------------------------------------------------------------------
// 14:14               comp12amen          RW                  0b0                 
// --------------------------------------------------------------------------------
// 12:12               lptim5amen          RW                  0b0                 
// --------------------------------------------------------------------------------
// 11:11               lptim4amen          RW                  0b0                 
// --------------------------------------------------------------------------------
// 10:10               lptim3amen          RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 lptim2amen          RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 i2c4amen            RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 spi6amen            RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 lpuart1amen         RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 bdmaamen            RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_d3amr read data
// --------------------------------------------------------------------------------
assign rcc_d3amr_read = {{2{1'b0}}
                      , cur_rcc_d3amr_sram4amen
                      , cur_rcc_d3amr_bkpramamen
                      , {3{1'b0}}
                      , cur_rcc_d3amr_adc3amen
                      , {2{1'b0}}
                      , cur_rcc_d3amr_sai4amen
                      , {1{1'b0}}
                      , cur_rcc_d3amr_crcamen
                      , {2{1'b0}}
                      , cur_rcc_d3amr_rtcamen
                      , cur_rcc_d3amr_vrefamen
                      , cur_rcc_d3amr_comp12amen
                      , {1{1'b0}}
                      , cur_rcc_d3amr_lptim5amen
                      , cur_rcc_d3amr_lptim4amen
                      , cur_rcc_d3amr_lptim3amen
                      , cur_rcc_d3amr_lptim2amen
                      , {1{1'b0}}
                      , cur_rcc_d3amr_i2c4amen
                      , {1{1'b0}}
                      , cur_rcc_d3amr_spi6amen
                      , {1{1'b0}}
                      , cur_rcc_d3amr_lpuart1amen
                      , {2{1'b0}}
                      , cur_rcc_d3amr_bdmaamen};

// --------------------------------------------------------------------------------
// 29:29               sram4amen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_sram4amen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_sram4amen = wdata[29:29]             ;
assign sram4amen               = cur_rcc_d3amr_sram4amen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_sram4amen (
  .clk  (clk                    ),
  .rst_n(rst_n                  ),
  .en   (rcc_d3amr_sram4amen_en ),
  .din  (nxt_rcc_d3amr_sram4amen),
  .dout (cur_rcc_d3amr_sram4amen)
);

// --------------------------------------------------------------------------------
// 28:28               bkpramamen          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_bkpramamen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_bkpramamen = wdata[28:28]             ;
assign bkpramamen               = cur_rcc_d3amr_bkpramamen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_bkpramamen (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_d3amr_bkpramamen_en ),
  .din  (nxt_rcc_d3amr_bkpramamen),
  .dout (cur_rcc_d3amr_bkpramamen)
);

// --------------------------------------------------------------------------------
// 24:24               adc3amen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_adc3amen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_adc3amen = wdata[24:24]             ;
assign adc3amen               = cur_rcc_d3amr_adc3amen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_adc3amen (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_d3amr_adc3amen_en ),
  .din  (nxt_rcc_d3amr_adc3amen),
  .dout (cur_rcc_d3amr_adc3amen)
);

// --------------------------------------------------------------------------------
// 21:21               sai4amen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_sai4amen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_sai4amen = wdata[21:21]             ;
assign sai4amen               = cur_rcc_d3amr_sai4amen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_sai4amen (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_d3amr_sai4amen_en ),
  .din  (nxt_rcc_d3amr_sai4amen),
  .dout (cur_rcc_d3amr_sai4amen)
);

// --------------------------------------------------------------------------------
// 19:19               crcamen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_crcamen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_crcamen = wdata[19:19]             ;
assign crcamen               = cur_rcc_d3amr_crcamen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_crcamen (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_d3amr_crcamen_en ),
  .din  (nxt_rcc_d3amr_crcamen),
  .dout (cur_rcc_d3amr_crcamen)
);

// --------------------------------------------------------------------------------
// 16:16               rtcamen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_rtcamen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_rtcamen = wdata[16:16]             ;
assign rtcamen               = cur_rcc_d3amr_rtcamen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_rtcamen (
  .clk  (clk                  ),
  .rst_n(rst_n                ),
  .en   (rcc_d3amr_rtcamen_en ),
  .din  (nxt_rcc_d3amr_rtcamen),
  .dout (cur_rcc_d3amr_rtcamen)
);

// --------------------------------------------------------------------------------
// 15:15               vrefamen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_vrefamen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_vrefamen = wdata[15:15]             ;
assign vrefamen               = cur_rcc_d3amr_vrefamen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_vrefamen (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_d3amr_vrefamen_en ),
  .din  (nxt_rcc_d3amr_vrefamen),
  .dout (cur_rcc_d3amr_vrefamen)
);

// --------------------------------------------------------------------------------
// 14:14               comp12amen          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_comp12amen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_comp12amen = wdata[14:14]             ;
assign comp12amen               = cur_rcc_d3amr_comp12amen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_comp12amen (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_d3amr_comp12amen_en ),
  .din  (nxt_rcc_d3amr_comp12amen),
  .dout (cur_rcc_d3amr_comp12amen)
);

// --------------------------------------------------------------------------------
// 12:12               lptim5amen          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_lptim5amen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_lptim5amen = wdata[12:12]             ;
assign lptim5amen               = cur_rcc_d3amr_lptim5amen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_lptim5amen (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_d3amr_lptim5amen_en ),
  .din  (nxt_rcc_d3amr_lptim5amen),
  .dout (cur_rcc_d3amr_lptim5amen)
);

// --------------------------------------------------------------------------------
// 11:11               lptim4amen          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_lptim4amen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_lptim4amen = wdata[11:11]             ;
assign lptim4amen               = cur_rcc_d3amr_lptim4amen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_lptim4amen (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_d3amr_lptim4amen_en ),
  .din  (nxt_rcc_d3amr_lptim4amen),
  .dout (cur_rcc_d3amr_lptim4amen)
);

// --------------------------------------------------------------------------------
// 10:10               lptim3amen          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_lptim3amen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_lptim3amen = wdata[10:10]             ;
assign lptim3amen               = cur_rcc_d3amr_lptim3amen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_lptim3amen (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_d3amr_lptim3amen_en ),
  .din  (nxt_rcc_d3amr_lptim3amen),
  .dout (cur_rcc_d3amr_lptim3amen)
);

// --------------------------------------------------------------------------------
// 9:9                 lptim2amen          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_lptim2amen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_lptim2amen = wdata[9:9]               ;
assign lptim2amen               = cur_rcc_d3amr_lptim2amen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_lptim2amen (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_d3amr_lptim2amen_en ),
  .din  (nxt_rcc_d3amr_lptim2amen),
  .dout (cur_rcc_d3amr_lptim2amen)
);

// --------------------------------------------------------------------------------
// 7:7                 i2c4amen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_i2c4amen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_i2c4amen = wdata[7:7]               ;
assign i2c4amen               = cur_rcc_d3amr_i2c4amen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_i2c4amen (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_d3amr_i2c4amen_en ),
  .din  (nxt_rcc_d3amr_i2c4amen),
  .dout (cur_rcc_d3amr_i2c4amen)
);

// --------------------------------------------------------------------------------
// 5:5                 spi6amen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_spi6amen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_spi6amen = wdata[5:5]               ;
assign spi6amen               = cur_rcc_d3amr_spi6amen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_spi6amen (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_d3amr_spi6amen_en ),
  .din  (nxt_rcc_d3amr_spi6amen),
  .dout (cur_rcc_d3amr_spi6amen)
);

// --------------------------------------------------------------------------------
// 3:3                 lpuart1amen         RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_lpuart1amen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_lpuart1amen = wdata[3:3]               ;
assign lpuart1amen               = cur_rcc_d3amr_lpuart1amen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_lpuart1amen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_d3amr_lpuart1amen_en ),
  .din  (nxt_rcc_d3amr_lpuart1amen),
  .dout (cur_rcc_d3amr_lpuart1amen)
);

// --------------------------------------------------------------------------------
// 0:0                 bdmaamen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_d3amr_bdmaamen_en  = (|wr_req & rcc_d3amr_sel);
assign nxt_rcc_d3amr_bdmaamen = wdata[0:0]               ;
assign bdmaamen               = cur_rcc_d3amr_bdmaamen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_d3amr_bdmaamen (
  .clk  (clk                   ),
  .rst_n(rst_n                 ),
  .en   (rcc_d3amr_bdmaamen_en ),
  .din  (nxt_rcc_d3amr_bdmaamen),
  .dout (cur_rcc_d3amr_bdmaamen)
);




// --------------------------------------------------------------------------------
// rcc_c1_ahb3enr                          0x134                                   
// --------------------------------------------------------------------------------
// 31:31               axisramen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 30:30               itcmen              RW                  0b0                 
// --------------------------------------------------------------------------------
// 29:29               dtcm2en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 28:28               dtcm1en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               sdmmc1en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 14:14               qspien              RW                  0b0                 
// --------------------------------------------------------------------------------
// 12:12               fmcen               RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 flitfen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 jpgdecen            RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 dma2den             RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 mdmaen              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_ahb3enr read data
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3enr_read = {cur_rcc_c1_ahb3enr_axisramen
                           , cur_rcc_c1_ahb3enr_itcmen
                           , cur_rcc_c1_ahb3enr_dtcm2en
                           , cur_rcc_c1_ahb3enr_dtcm1en
                           , {11{1'b0}}
                           , cur_rcc_c1_ahb3enr_sdmmc1en
                           , {1{1'b0}}
                           , cur_rcc_c1_ahb3enr_qspien
                           , {1{1'b0}}
                           , cur_rcc_c1_ahb3enr_fmcen
                           , {3{1'b0}}
                           , cur_rcc_c1_ahb3enr_flitfen
                           , {2{1'b0}}
                           , cur_rcc_c1_ahb3enr_jpgdecen
                           , cur_rcc_c1_ahb3enr_dma2den
                           , {3{1'b0}}
                           , cur_rcc_c1_ahb3enr_mdmaen};

// --------------------------------------------------------------------------------
// 31:31               axisramen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3enr_axisramen_en  = (|wr_req & rcc_c1_ahb3enr_sel);
assign nxt_rcc_c1_ahb3enr_axisramen = wdata[31:31]                  ;
assign rcc_c1_axisram_en            = cur_rcc_c1_ahb3enr_axisramen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb3enr_axisramen (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c1_ahb3enr_axisramen_en ),
  .din  (nxt_rcc_c1_ahb3enr_axisramen),
  .dout (cur_rcc_c1_ahb3enr_axisramen)
);

// --------------------------------------------------------------------------------
// 30:30               itcmen              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3enr_itcmen_en  = (|wr_req & rcc_c1_ahb3enr_sel);
assign nxt_rcc_c1_ahb3enr_itcmen = wdata[30:30]                  ;
assign rcc_c1_itcm_en            = cur_rcc_c1_ahb3enr_itcmen     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb3enr_itcmen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_ahb3enr_itcmen_en ),
  .din  (nxt_rcc_c1_ahb3enr_itcmen),
  .dout (cur_rcc_c1_ahb3enr_itcmen)
);

// --------------------------------------------------------------------------------
// 29:29               dtcm2en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3enr_dtcm2en_en  = (|wr_req & rcc_c1_ahb3enr_sel);
assign nxt_rcc_c1_ahb3enr_dtcm2en = wdata[29:29]                  ;
assign rcc_c1_dtcm2_en            = cur_rcc_c1_ahb3enr_dtcm2en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb3enr_dtcm2en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb3enr_dtcm2en_en ),
  .din  (nxt_rcc_c1_ahb3enr_dtcm2en),
  .dout (cur_rcc_c1_ahb3enr_dtcm2en)
);

// --------------------------------------------------------------------------------
// 28:28               dtcm1en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3enr_dtcm1en_en  = (|wr_req & rcc_c1_ahb3enr_sel);
assign nxt_rcc_c1_ahb3enr_dtcm1en = wdata[28:28]                  ;
assign rcc_c1_dtcm1_en            = cur_rcc_c1_ahb3enr_dtcm1en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb3enr_dtcm1en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb3enr_dtcm1en_en ),
  .din  (nxt_rcc_c1_ahb3enr_dtcm1en),
  .dout (cur_rcc_c1_ahb3enr_dtcm1en)
);

// --------------------------------------------------------------------------------
// 16:16               sdmmc1en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3enr_sdmmc1en_en  = (|wr_req & rcc_c1_ahb3enr_sel);
assign nxt_rcc_c1_ahb3enr_sdmmc1en = wdata[16:16]                  ;
assign rcc_c1_sdmmc1_en            = cur_rcc_c1_ahb3enr_sdmmc1en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb3enr_sdmmc1en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_ahb3enr_sdmmc1en_en ),
  .din  (nxt_rcc_c1_ahb3enr_sdmmc1en),
  .dout (cur_rcc_c1_ahb3enr_sdmmc1en)
);

// --------------------------------------------------------------------------------
// 14:14               qspien              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3enr_qspien_en  = (|wr_req & rcc_c1_ahb3enr_sel);
assign nxt_rcc_c1_ahb3enr_qspien = wdata[14:14]                  ;
assign rcc_c1_qspi_en            = cur_rcc_c1_ahb3enr_qspien     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb3enr_qspien (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_ahb3enr_qspien_en ),
  .din  (nxt_rcc_c1_ahb3enr_qspien),
  .dout (cur_rcc_c1_ahb3enr_qspien)
);

// --------------------------------------------------------------------------------
// 12:12               fmcen               RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3enr_fmcen_en  = (|wr_req & rcc_c1_ahb3enr_sel);
assign nxt_rcc_c1_ahb3enr_fmcen = wdata[12:12]                  ;
assign rcc_c1_fmc_en            = cur_rcc_c1_ahb3enr_fmcen      ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb3enr_fmcen (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_c1_ahb3enr_fmcen_en ),
  .din  (nxt_rcc_c1_ahb3enr_fmcen),
  .dout (cur_rcc_c1_ahb3enr_fmcen)
);

// --------------------------------------------------------------------------------
// 8:8                 flitfen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3enr_flitfen_en  = (|wr_req & rcc_c1_ahb3enr_sel);
assign nxt_rcc_c1_ahb3enr_flitfen = wdata[8:8]                    ;
assign rcc_c1_flitf_en            = cur_rcc_c1_ahb3enr_flitfen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb3enr_flitfen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb3enr_flitfen_en ),
  .din  (nxt_rcc_c1_ahb3enr_flitfen),
  .dout (cur_rcc_c1_ahb3enr_flitfen)
);

// --------------------------------------------------------------------------------
// 5:5                 jpgdecen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3enr_jpgdecen_en  = (|wr_req & rcc_c1_ahb3enr_sel);
assign nxt_rcc_c1_ahb3enr_jpgdecen = wdata[5:5]                    ;
assign rcc_c1_jpgdec_en            = cur_rcc_c1_ahb3enr_jpgdecen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb3enr_jpgdecen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_ahb3enr_jpgdecen_en ),
  .din  (nxt_rcc_c1_ahb3enr_jpgdecen),
  .dout (cur_rcc_c1_ahb3enr_jpgdecen)
);

// --------------------------------------------------------------------------------
// 4:4                 dma2den             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3enr_dma2den_en  = (|wr_req & rcc_c1_ahb3enr_sel);
assign nxt_rcc_c1_ahb3enr_dma2den = wdata[4:4]                    ;
assign rcc_c1_dma2d_en            = cur_rcc_c1_ahb3enr_dma2den    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb3enr_dma2den (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb3enr_dma2den_en ),
  .din  (nxt_rcc_c1_ahb3enr_dma2den),
  .dout (cur_rcc_c1_ahb3enr_dma2den)
);

// --------------------------------------------------------------------------------
// 0:0                 mdmaen              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3enr_mdmaen_en  = (|wr_req & rcc_c1_ahb3enr_sel);
assign nxt_rcc_c1_ahb3enr_mdmaen = wdata[0:0]                    ;
assign rcc_c1_mdma_en            = cur_rcc_c1_ahb3enr_mdmaen     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb3enr_mdmaen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_ahb3enr_mdmaen_en ),
  .din  (nxt_rcc_c1_ahb3enr_mdmaen),
  .dout (cur_rcc_c1_ahb3enr_mdmaen)
);


// --------------------------------------------------------------------------------
// rcc_c1_ahb1enr                          0x138                                   
// --------------------------------------------------------------------------------
// 28:28               usb2ulpien          RW                  0b0                 
// --------------------------------------------------------------------------------
// 27:27               usb2otgen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 26:26               usb1ulpien          RW                  0b0                 
// --------------------------------------------------------------------------------
// 25:25               usb1otgen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 17:17               eth1rxen            RW                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               eth1txen            RW                  0b0                 
// --------------------------------------------------------------------------------
// 15:15               eth1macen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 adc12en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 dma2en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 dma1en              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_ahb1enr read data
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1enr_read = {{3{1'b0}}
                           , cur_rcc_c1_ahb1enr_usb2ulpien
                           , cur_rcc_c1_ahb1enr_usb2otgen
                           , cur_rcc_c1_ahb1enr_usb1ulpien
                           , cur_rcc_c1_ahb1enr_usb1otgen
                           , {7{1'b0}}
                           , cur_rcc_c1_ahb1enr_eth1rxen
                           , cur_rcc_c1_ahb1enr_eth1txen
                           , cur_rcc_c1_ahb1enr_eth1macen
                           , {9{1'b0}}
                           , cur_rcc_c1_ahb1enr_adc12en
                           , {3{1'b0}}
                           , cur_rcc_c1_ahb1enr_dma2en
                           , cur_rcc_c1_ahb1enr_dma1en};

// --------------------------------------------------------------------------------
// 28:28               usb2ulpien          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1enr_usb2ulpien_en  = (|wr_req & rcc_c1_ahb1enr_sel);
assign nxt_rcc_c1_ahb1enr_usb2ulpien = wdata[28:28]                  ;
assign rcc_c1_usb2ulpi_en            = cur_rcc_c1_ahb1enr_usb2ulpien ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb1enr_usb2ulpien (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_ahb1enr_usb2ulpien_en ),
  .din  (nxt_rcc_c1_ahb1enr_usb2ulpien),
  .dout (cur_rcc_c1_ahb1enr_usb2ulpien)
);

// --------------------------------------------------------------------------------
// 27:27               usb2otgen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1enr_usb2otgen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
assign nxt_rcc_c1_ahb1enr_usb2otgen = wdata[27:27]                  ;
assign rcc_c1_usb2otg_en            = cur_rcc_c1_ahb1enr_usb2otgen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb1enr_usb2otgen (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c1_ahb1enr_usb2otgen_en ),
  .din  (nxt_rcc_c1_ahb1enr_usb2otgen),
  .dout (cur_rcc_c1_ahb1enr_usb2otgen)
);

// --------------------------------------------------------------------------------
// 26:26               usb1ulpien          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1enr_usb1ulpien_en  = (|wr_req & rcc_c1_ahb1enr_sel);
assign nxt_rcc_c1_ahb1enr_usb1ulpien = wdata[26:26]                  ;
assign rcc_c1_usb1ulpi_en            = cur_rcc_c1_ahb1enr_usb1ulpien ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb1enr_usb1ulpien (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_ahb1enr_usb1ulpien_en ),
  .din  (nxt_rcc_c1_ahb1enr_usb1ulpien),
  .dout (cur_rcc_c1_ahb1enr_usb1ulpien)
);

// --------------------------------------------------------------------------------
// 25:25               usb1otgen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1enr_usb1otgen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
assign nxt_rcc_c1_ahb1enr_usb1otgen = wdata[25:25]                  ;
assign rcc_c1_usb1otg_en            = cur_rcc_c1_ahb1enr_usb1otgen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb1enr_usb1otgen (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c1_ahb1enr_usb1otgen_en ),
  .din  (nxt_rcc_c1_ahb1enr_usb1otgen),
  .dout (cur_rcc_c1_ahb1enr_usb1otgen)
);

// --------------------------------------------------------------------------------
// 17:17               eth1rxen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1enr_eth1rxen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
assign nxt_rcc_c1_ahb1enr_eth1rxen = wdata[17:17]                  ;
assign rcc_c1_eth1rx_en            = cur_rcc_c1_ahb1enr_eth1rxen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb1enr_eth1rxen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_ahb1enr_eth1rxen_en ),
  .din  (nxt_rcc_c1_ahb1enr_eth1rxen),
  .dout (cur_rcc_c1_ahb1enr_eth1rxen)
);

// --------------------------------------------------------------------------------
// 16:16               eth1txen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1enr_eth1txen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
assign nxt_rcc_c1_ahb1enr_eth1txen = wdata[16:16]                  ;
assign rcc_c1_eth1tx_en            = cur_rcc_c1_ahb1enr_eth1txen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb1enr_eth1txen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_ahb1enr_eth1txen_en ),
  .din  (nxt_rcc_c1_ahb1enr_eth1txen),
  .dout (cur_rcc_c1_ahb1enr_eth1txen)
);

// --------------------------------------------------------------------------------
// 15:15               eth1macen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1enr_eth1macen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
assign nxt_rcc_c1_ahb1enr_eth1macen = wdata[15:15]                  ;
assign rcc_c1_eth1mac_en            = cur_rcc_c1_ahb1enr_eth1macen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb1enr_eth1macen (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c1_ahb1enr_eth1macen_en ),
  .din  (nxt_rcc_c1_ahb1enr_eth1macen),
  .dout (cur_rcc_c1_ahb1enr_eth1macen)
);

// --------------------------------------------------------------------------------
// 5:5                 adc12en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1enr_adc12en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
assign nxt_rcc_c1_ahb1enr_adc12en = wdata[5:5]                    ;
assign rcc_c1_adc12_en            = cur_rcc_c1_ahb1enr_adc12en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb1enr_adc12en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb1enr_adc12en_en ),
  .din  (nxt_rcc_c1_ahb1enr_adc12en),
  .dout (cur_rcc_c1_ahb1enr_adc12en)
);

// --------------------------------------------------------------------------------
// 1:1                 dma2en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1enr_dma2en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
assign nxt_rcc_c1_ahb1enr_dma2en = wdata[1:1]                    ;
assign rcc_c1_dma2_en            = cur_rcc_c1_ahb1enr_dma2en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb1enr_dma2en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_ahb1enr_dma2en_en ),
  .din  (nxt_rcc_c1_ahb1enr_dma2en),
  .dout (cur_rcc_c1_ahb1enr_dma2en)
);

// --------------------------------------------------------------------------------
// 0:0                 dma1en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1enr_dma1en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
assign nxt_rcc_c1_ahb1enr_dma1en = wdata[0:0]                    ;
assign rcc_c1_dma1_en            = cur_rcc_c1_ahb1enr_dma1en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb1enr_dma1en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_ahb1enr_dma1en_en ),
  .din  (nxt_rcc_c1_ahb1enr_dma1en),
  .dout (cur_rcc_c1_ahb1enr_dma1en)
);


// --------------------------------------------------------------------------------
// rcc_c1_ahb2enr                          0x13c                                   
// --------------------------------------------------------------------------------
// 31:31               sram3en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 30:30               sram2en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 29:29               sram1en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 sdmmc2en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:6                 rngen               RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 hashen              RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 crypten             RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 dcmien              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_ahb2enr read data
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2enr_read = {cur_rcc_c1_ahb2enr_sram3en
                           , cur_rcc_c1_ahb2enr_sram2en
                           , cur_rcc_c1_ahb2enr_sram1en
                           , {19{1'b0}}
                           , cur_rcc_c1_ahb2enr_sdmmc2en
                           , {2{1'b0}}
                           , cur_rcc_c1_ahb2enr_rngen
                           , cur_rcc_c1_ahb2enr_hashen
                           , cur_rcc_c1_ahb2enr_crypten
                           , {3{1'b0}}
                           , cur_rcc_c1_ahb2enr_dcmien};

// --------------------------------------------------------------------------------
// 31:31               sram3en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2enr_sram3en_en  = (|wr_req & rcc_c1_ahb2enr_sel);
assign nxt_rcc_c1_ahb2enr_sram3en = wdata[31:31]                  ;
assign rcc_c1_sram3_en            = cur_rcc_c1_ahb2enr_sram3en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb2enr_sram3en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb2enr_sram3en_en ),
  .din  (nxt_rcc_c1_ahb2enr_sram3en),
  .dout (cur_rcc_c1_ahb2enr_sram3en)
);

// --------------------------------------------------------------------------------
// 30:30               sram2en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2enr_sram2en_en  = (|wr_req & rcc_c1_ahb2enr_sel);
assign nxt_rcc_c1_ahb2enr_sram2en = wdata[30:30]                  ;
assign rcc_c1_sram2_en            = cur_rcc_c1_ahb2enr_sram2en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb2enr_sram2en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb2enr_sram2en_en ),
  .din  (nxt_rcc_c1_ahb2enr_sram2en),
  .dout (cur_rcc_c1_ahb2enr_sram2en)
);

// --------------------------------------------------------------------------------
// 29:29               sram1en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2enr_sram1en_en  = (|wr_req & rcc_c1_ahb2enr_sel);
assign nxt_rcc_c1_ahb2enr_sram1en = wdata[29:29]                  ;
assign rcc_c1_sram1_en            = cur_rcc_c1_ahb2enr_sram1en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb2enr_sram1en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb2enr_sram1en_en ),
  .din  (nxt_rcc_c1_ahb2enr_sram1en),
  .dout (cur_rcc_c1_ahb2enr_sram1en)
);

// --------------------------------------------------------------------------------
// 9:9                 sdmmc2en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2enr_sdmmc2en_en  = (|wr_req & rcc_c1_ahb2enr_sel);
assign nxt_rcc_c1_ahb2enr_sdmmc2en = wdata[9:9]                    ;
assign rcc_c1_sdmmc2_en            = cur_rcc_c1_ahb2enr_sdmmc2en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb2enr_sdmmc2en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_ahb2enr_sdmmc2en_en ),
  .din  (nxt_rcc_c1_ahb2enr_sdmmc2en),
  .dout (cur_rcc_c1_ahb2enr_sdmmc2en)
);

// --------------------------------------------------------------------------------
// 6:6                 rngen               RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2enr_rngen_en  = (|wr_req & rcc_c1_ahb2enr_sel);
assign nxt_rcc_c1_ahb2enr_rngen = wdata[6:6]                    ;
assign rcc_c1_rng_en            = cur_rcc_c1_ahb2enr_rngen      ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb2enr_rngen (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_c1_ahb2enr_rngen_en ),
  .din  (nxt_rcc_c1_ahb2enr_rngen),
  .dout (cur_rcc_c1_ahb2enr_rngen)
);

// --------------------------------------------------------------------------------
// 5:5                 hashen              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2enr_hashen_en  = (|wr_req & rcc_c1_ahb2enr_sel);
assign nxt_rcc_c1_ahb2enr_hashen = wdata[5:5]                    ;
assign rcc_c1_hash_en            = cur_rcc_c1_ahb2enr_hashen     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb2enr_hashen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_ahb2enr_hashen_en ),
  .din  (nxt_rcc_c1_ahb2enr_hashen),
  .dout (cur_rcc_c1_ahb2enr_hashen)
);

// --------------------------------------------------------------------------------
// 4:4                 crypten             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2enr_crypten_en  = (|wr_req & rcc_c1_ahb2enr_sel);
assign nxt_rcc_c1_ahb2enr_crypten = wdata[4:4]                    ;
assign rcc_c1_crypt_en            = cur_rcc_c1_ahb2enr_crypten    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb2enr_crypten (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb2enr_crypten_en ),
  .din  (nxt_rcc_c1_ahb2enr_crypten),
  .dout (cur_rcc_c1_ahb2enr_crypten)
);

// --------------------------------------------------------------------------------
// 0:0                 dcmien              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2enr_dcmien_en  = (|wr_req & rcc_c1_ahb2enr_sel);
assign nxt_rcc_c1_ahb2enr_dcmien = wdata[0:0]                    ;
assign rcc_c1_dcmi_en            = cur_rcc_c1_ahb2enr_dcmien     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb2enr_dcmien (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_ahb2enr_dcmien_en ),
  .din  (nxt_rcc_c1_ahb2enr_dcmien),
  .dout (cur_rcc_c1_ahb2enr_dcmien)
);


// --------------------------------------------------------------------------------
// rcc_c1_ahb4enr                          0x140                                   
// --------------------------------------------------------------------------------
// 28:28               bkpramen            RW                  0b0                 
// --------------------------------------------------------------------------------
// 25:25               hsemen              RW                  0b0                 
// --------------------------------------------------------------------------------
// 24:24               adc3en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 21:21               bdmaen              RW                  0b0                 
// --------------------------------------------------------------------------------
// 19:19               crcen               RW                  0b0                 
// --------------------------------------------------------------------------------
// 10:10               gpioken             RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 gpiojen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 gpioien             RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 gpiohen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:6                 gpiogen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 gpiofen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 gpioeen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 gpioden             RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 gpiocen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 gpioben             RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 gpioaen             RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_ahb4enr read data
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_read = {{3{1'b0}}
                           , cur_rcc_c1_ahb4enr_bkpramen
                           , {2{1'b0}}
                           , cur_rcc_c1_ahb4enr_hsemen
                           , cur_rcc_c1_ahb4enr_adc3en
                           , {2{1'b0}}
                           , cur_rcc_c1_ahb4enr_bdmaen
                           , {1{1'b0}}
                           , cur_rcc_c1_ahb4enr_crcen
                           , {8{1'b0}}
                           , cur_rcc_c1_ahb4enr_gpioken
                           , cur_rcc_c1_ahb4enr_gpiojen
                           , cur_rcc_c1_ahb4enr_gpioien
                           , cur_rcc_c1_ahb4enr_gpiohen
                           , cur_rcc_c1_ahb4enr_gpiogen
                           , cur_rcc_c1_ahb4enr_gpiofen
                           , cur_rcc_c1_ahb4enr_gpioeen
                           , cur_rcc_c1_ahb4enr_gpioden
                           , cur_rcc_c1_ahb4enr_gpiocen
                           , cur_rcc_c1_ahb4enr_gpioben
                           , cur_rcc_c1_ahb4enr_gpioaen};

// --------------------------------------------------------------------------------
// 28:28               bkpramen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_bkpramen_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_bkpramen = wdata[28:28]                  ;
assign rcc_c1_bkpram_en            = cur_rcc_c1_ahb4enr_bkpramen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_bkpramen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_ahb4enr_bkpramen_en ),
  .din  (nxt_rcc_c1_ahb4enr_bkpramen),
  .dout (cur_rcc_c1_ahb4enr_bkpramen)
);

// --------------------------------------------------------------------------------
// 25:25               hsemen              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_hsemen_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_hsemen = wdata[25:25]                  ;
assign rcc_c1_hsem_en            = cur_rcc_c1_ahb4enr_hsemen     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_hsemen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_ahb4enr_hsemen_en ),
  .din  (nxt_rcc_c1_ahb4enr_hsemen),
  .dout (cur_rcc_c1_ahb4enr_hsemen)
);

// --------------------------------------------------------------------------------
// 24:24               adc3en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_adc3en_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_adc3en = wdata[24:24]                  ;
assign rcc_c1_adc3_en            = cur_rcc_c1_ahb4enr_adc3en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_adc3en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_ahb4enr_adc3en_en ),
  .din  (nxt_rcc_c1_ahb4enr_adc3en),
  .dout (cur_rcc_c1_ahb4enr_adc3en)
);

// --------------------------------------------------------------------------------
// 21:21               bdmaen              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_bdmaen_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_bdmaen = wdata[21:21]                  ;
assign rcc_c1_bdma_en            = cur_rcc_c1_ahb4enr_bdmaen     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_bdmaen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_ahb4enr_bdmaen_en ),
  .din  (nxt_rcc_c1_ahb4enr_bdmaen),
  .dout (cur_rcc_c1_ahb4enr_bdmaen)
);

// --------------------------------------------------------------------------------
// 19:19               crcen               RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_crcen_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_crcen = wdata[19:19]                  ;
assign rcc_c1_crc_en            = cur_rcc_c1_ahb4enr_crcen      ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_crcen (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_c1_ahb4enr_crcen_en ),
  .din  (nxt_rcc_c1_ahb4enr_crcen),
  .dout (cur_rcc_c1_ahb4enr_crcen)
);

// --------------------------------------------------------------------------------
// 10:10               gpioken             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_gpioken_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_gpioken = wdata[10:10]                  ;
assign rcc_c1_gpiok_en            = cur_rcc_c1_ahb4enr_gpioken    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_gpioken (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb4enr_gpioken_en ),
  .din  (nxt_rcc_c1_ahb4enr_gpioken),
  .dout (cur_rcc_c1_ahb4enr_gpioken)
);

// --------------------------------------------------------------------------------
// 9:9                 gpiojen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_gpiojen_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_gpiojen = wdata[9:9]                    ;
assign rcc_c1_gpioj_en            = cur_rcc_c1_ahb4enr_gpiojen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_gpiojen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb4enr_gpiojen_en ),
  .din  (nxt_rcc_c1_ahb4enr_gpiojen),
  .dout (cur_rcc_c1_ahb4enr_gpiojen)
);

// --------------------------------------------------------------------------------
// 8:8                 gpioien             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_gpioien_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_gpioien = wdata[8:8]                    ;
assign rcc_c1_gpioi_en            = cur_rcc_c1_ahb4enr_gpioien    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_gpioien (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb4enr_gpioien_en ),
  .din  (nxt_rcc_c1_ahb4enr_gpioien),
  .dout (cur_rcc_c1_ahb4enr_gpioien)
);

// --------------------------------------------------------------------------------
// 7:7                 gpiohen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_gpiohen_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_gpiohen = wdata[7:7]                    ;
assign rcc_c1_gpioh_en            = cur_rcc_c1_ahb4enr_gpiohen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_gpiohen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb4enr_gpiohen_en ),
  .din  (nxt_rcc_c1_ahb4enr_gpiohen),
  .dout (cur_rcc_c1_ahb4enr_gpiohen)
);

// --------------------------------------------------------------------------------
// 6:6                 gpiogen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_gpiogen_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_gpiogen = wdata[6:6]                    ;
assign rcc_c1_gpiog_en            = cur_rcc_c1_ahb4enr_gpiogen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_gpiogen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb4enr_gpiogen_en ),
  .din  (nxt_rcc_c1_ahb4enr_gpiogen),
  .dout (cur_rcc_c1_ahb4enr_gpiogen)
);

// --------------------------------------------------------------------------------
// 5:5                 gpiofen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_gpiofen_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_gpiofen = wdata[5:5]                    ;
assign rcc_c1_gpiof_en            = cur_rcc_c1_ahb4enr_gpiofen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_gpiofen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb4enr_gpiofen_en ),
  .din  (nxt_rcc_c1_ahb4enr_gpiofen),
  .dout (cur_rcc_c1_ahb4enr_gpiofen)
);

// --------------------------------------------------------------------------------
// 4:4                 gpioeen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_gpioeen_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_gpioeen = wdata[4:4]                    ;
assign rcc_c1_gpioe_en            = cur_rcc_c1_ahb4enr_gpioeen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_gpioeen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb4enr_gpioeen_en ),
  .din  (nxt_rcc_c1_ahb4enr_gpioeen),
  .dout (cur_rcc_c1_ahb4enr_gpioeen)
);

// --------------------------------------------------------------------------------
// 3:3                 gpioden             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_gpioden_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_gpioden = wdata[3:3]                    ;
assign rcc_c1_gpiod_en            = cur_rcc_c1_ahb4enr_gpioden    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_gpioden (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb4enr_gpioden_en ),
  .din  (nxt_rcc_c1_ahb4enr_gpioden),
  .dout (cur_rcc_c1_ahb4enr_gpioden)
);

// --------------------------------------------------------------------------------
// 2:2                 gpiocen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_gpiocen_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_gpiocen = wdata[2:2]                    ;
assign rcc_c1_gpioc_en            = cur_rcc_c1_ahb4enr_gpiocen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_gpiocen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb4enr_gpiocen_en ),
  .din  (nxt_rcc_c1_ahb4enr_gpiocen),
  .dout (cur_rcc_c1_ahb4enr_gpiocen)
);

// --------------------------------------------------------------------------------
// 1:1                 gpioben             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_gpioben_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_gpioben = wdata[1:1]                    ;
assign rcc_c1_gpiob_en            = cur_rcc_c1_ahb4enr_gpioben    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_gpioben (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb4enr_gpioben_en ),
  .din  (nxt_rcc_c1_ahb4enr_gpioben),
  .dout (cur_rcc_c1_ahb4enr_gpioben)
);

// --------------------------------------------------------------------------------
// 0:0                 gpioaen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4enr_gpioaen_en  = (|wr_req & rcc_c1_ahb4enr_sel);
assign nxt_rcc_c1_ahb4enr_gpioaen = wdata[0:0]                    ;
assign rcc_c1_gpioa_en            = cur_rcc_c1_ahb4enr_gpioaen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4enr_gpioaen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_ahb4enr_gpioaen_en ),
  .din  (nxt_rcc_c1_ahb4enr_gpioaen),
  .dout (cur_rcc_c1_ahb4enr_gpioaen)
);


// --------------------------------------------------------------------------------
// rcc_c1_apb3enr                          0x144                                   
// --------------------------------------------------------------------------------
// 6:6                 wwdg1en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 ltdcen              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_apb3enr read data
// --------------------------------------------------------------------------------
assign rcc_c1_apb3enr_read = {{25{1'b0}}
                           , cur_rcc_c1_apb3enr_wwdg1en
                           , {2{1'b0}}
                           , cur_rcc_c1_apb3enr_ltdcen
                           , {3{1'b0}}};

// --------------------------------------------------------------------------------
// 6:6                 wwdg1en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb3enr_wwdg1en_en  = (|wr_req & rcc_c1_apb3enr_sel);
assign nxt_rcc_c1_apb3enr_wwdg1en = wdata[6:6]                    ;
assign rcc_c1_wwdg1_en            = cur_rcc_c1_apb3enr_wwdg1en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb3enr_wwdg1en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb3enr_wwdg1en_en ),
  .din  (nxt_rcc_c1_apb3enr_wwdg1en),
  .dout (cur_rcc_c1_apb3enr_wwdg1en)
);

// --------------------------------------------------------------------------------
// 3:3                 ltdcen              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb3enr_ltdcen_en  = (|wr_req & rcc_c1_apb3enr_sel);
assign nxt_rcc_c1_apb3enr_ltdcen = wdata[3:3]                    ;
assign rcc_c1_ltdc_en            = cur_rcc_c1_apb3enr_ltdcen     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb3enr_ltdcen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb3enr_ltdcen_en ),
  .din  (nxt_rcc_c1_apb3enr_ltdcen),
  .dout (cur_rcc_c1_apb3enr_ltdcen)
);


// --------------------------------------------------------------------------------
// rcc_c1_apb1lenr                         0x148                                   
// --------------------------------------------------------------------------------
// 31:31               uart8en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 30:30               uart7en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 29:29               dac12en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 27:27               hdmicecen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 23:23               i2c3en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 22:22               i2c2en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 21:21               i2c1en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 20:20               uart5en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 19:19               uart4en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 18:18               usart3en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 17:17               usart2en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               spdifrxen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 15:15               spi3en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 14:14               spi2en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 11:11               wwdg2en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 lptim1en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 tim14en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 tim13en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:6                 tim12en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 tim7en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 tim6en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 tim5en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 tim4en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 tim3en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 tim2en              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_apb1lenr read data
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_read = {cur_rcc_c1_apb1lenr_uart8en
                            , cur_rcc_c1_apb1lenr_uart7en
                            , cur_rcc_c1_apb1lenr_dac12en
                            , {1{1'b0}}
                            , cur_rcc_c1_apb1lenr_hdmicecen
                            , {3{1'b0}}
                            , cur_rcc_c1_apb1lenr_i2c3en
                            , cur_rcc_c1_apb1lenr_i2c2en
                            , cur_rcc_c1_apb1lenr_i2c1en
                            , cur_rcc_c1_apb1lenr_uart5en
                            , cur_rcc_c1_apb1lenr_uart4en
                            , cur_rcc_c1_apb1lenr_usart3en
                            , cur_rcc_c1_apb1lenr_usart2en
                            , cur_rcc_c1_apb1lenr_spdifrxen
                            , cur_rcc_c1_apb1lenr_spi3en
                            , cur_rcc_c1_apb1lenr_spi2en
                            , {2{1'b0}}
                            , cur_rcc_c1_apb1lenr_wwdg2en
                            , {1{1'b0}}
                            , cur_rcc_c1_apb1lenr_lptim1en
                            , cur_rcc_c1_apb1lenr_tim14en
                            , cur_rcc_c1_apb1lenr_tim13en
                            , cur_rcc_c1_apb1lenr_tim12en
                            , cur_rcc_c1_apb1lenr_tim7en
                            , cur_rcc_c1_apb1lenr_tim6en
                            , cur_rcc_c1_apb1lenr_tim5en
                            , cur_rcc_c1_apb1lenr_tim4en
                            , cur_rcc_c1_apb1lenr_tim3en
                            , cur_rcc_c1_apb1lenr_tim2en};

// --------------------------------------------------------------------------------
// 31:31               uart8en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_uart8en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_uart8en = wdata[31:31]                   ;
assign rcc_c1_uart8_en             = cur_rcc_c1_apb1lenr_uart8en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_uart8en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb1lenr_uart8en_en ),
  .din  (nxt_rcc_c1_apb1lenr_uart8en),
  .dout (cur_rcc_c1_apb1lenr_uart8en)
);

// --------------------------------------------------------------------------------
// 30:30               uart7en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_uart7en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_uart7en = wdata[30:30]                   ;
assign rcc_c1_uart7_en             = cur_rcc_c1_apb1lenr_uart7en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_uart7en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb1lenr_uart7en_en ),
  .din  (nxt_rcc_c1_apb1lenr_uart7en),
  .dout (cur_rcc_c1_apb1lenr_uart7en)
);

// --------------------------------------------------------------------------------
// 29:29               dac12en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_dac12en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_dac12en = wdata[29:29]                   ;
assign rcc_c1_dac12_en             = cur_rcc_c1_apb1lenr_dac12en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_dac12en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb1lenr_dac12en_en ),
  .din  (nxt_rcc_c1_apb1lenr_dac12en),
  .dout (cur_rcc_c1_apb1lenr_dac12en)
);

// --------------------------------------------------------------------------------
// 27:27               hdmicecen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_hdmicecen_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_hdmicecen = wdata[27:27]                   ;
assign rcc_c1_hdmicec_en             = cur_rcc_c1_apb1lenr_hdmicecen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_hdmicecen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb1lenr_hdmicecen_en ),
  .din  (nxt_rcc_c1_apb1lenr_hdmicecen),
  .dout (cur_rcc_c1_apb1lenr_hdmicecen)
);

// --------------------------------------------------------------------------------
// 23:23               i2c3en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_i2c3en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_i2c3en = wdata[23:23]                   ;
assign rcc_c1_i2c3_en             = cur_rcc_c1_apb1lenr_i2c3en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_i2c3en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb1lenr_i2c3en_en ),
  .din  (nxt_rcc_c1_apb1lenr_i2c3en),
  .dout (cur_rcc_c1_apb1lenr_i2c3en)
);

// --------------------------------------------------------------------------------
// 22:22               i2c2en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_i2c2en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_i2c2en = wdata[22:22]                   ;
assign rcc_c1_i2c2_en             = cur_rcc_c1_apb1lenr_i2c2en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_i2c2en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb1lenr_i2c2en_en ),
  .din  (nxt_rcc_c1_apb1lenr_i2c2en),
  .dout (cur_rcc_c1_apb1lenr_i2c2en)
);

// --------------------------------------------------------------------------------
// 21:21               i2c1en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_i2c1en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_i2c1en = wdata[21:21]                   ;
assign rcc_c1_i2c1_en             = cur_rcc_c1_apb1lenr_i2c1en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_i2c1en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb1lenr_i2c1en_en ),
  .din  (nxt_rcc_c1_apb1lenr_i2c1en),
  .dout (cur_rcc_c1_apb1lenr_i2c1en)
);

// --------------------------------------------------------------------------------
// 20:20               uart5en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_uart5en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_uart5en = wdata[20:20]                   ;
assign rcc_c1_uart5_en             = cur_rcc_c1_apb1lenr_uart5en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_uart5en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb1lenr_uart5en_en ),
  .din  (nxt_rcc_c1_apb1lenr_uart5en),
  .dout (cur_rcc_c1_apb1lenr_uart5en)
);

// --------------------------------------------------------------------------------
// 19:19               uart4en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_uart4en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_uart4en = wdata[19:19]                   ;
assign rcc_c1_uart4_en             = cur_rcc_c1_apb1lenr_uart4en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_uart4en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb1lenr_uart4en_en ),
  .din  (nxt_rcc_c1_apb1lenr_uart4en),
  .dout (cur_rcc_c1_apb1lenr_uart4en)
);

// --------------------------------------------------------------------------------
// 18:18               usart3en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_usart3en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_usart3en = wdata[18:18]                   ;
assign rcc_c1_usart3_en             = cur_rcc_c1_apb1lenr_usart3en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_usart3en (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c1_apb1lenr_usart3en_en ),
  .din  (nxt_rcc_c1_apb1lenr_usart3en),
  .dout (cur_rcc_c1_apb1lenr_usart3en)
);

// --------------------------------------------------------------------------------
// 17:17               usart2en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_usart2en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_usart2en = wdata[17:17]                   ;
assign rcc_c1_usart2_en             = cur_rcc_c1_apb1lenr_usart2en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_usart2en (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c1_apb1lenr_usart2en_en ),
  .din  (nxt_rcc_c1_apb1lenr_usart2en),
  .dout (cur_rcc_c1_apb1lenr_usart2en)
);

// --------------------------------------------------------------------------------
// 16:16               spdifrxen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_spdifrxen_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_spdifrxen = wdata[16:16]                   ;
assign rcc_c1_spdifrx_en             = cur_rcc_c1_apb1lenr_spdifrxen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_spdifrxen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb1lenr_spdifrxen_en ),
  .din  (nxt_rcc_c1_apb1lenr_spdifrxen),
  .dout (cur_rcc_c1_apb1lenr_spdifrxen)
);

// --------------------------------------------------------------------------------
// 15:15               spi3en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_spi3en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_spi3en = wdata[15:15]                   ;
assign rcc_c1_spi3_en             = cur_rcc_c1_apb1lenr_spi3en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_spi3en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb1lenr_spi3en_en ),
  .din  (nxt_rcc_c1_apb1lenr_spi3en),
  .dout (cur_rcc_c1_apb1lenr_spi3en)
);

// --------------------------------------------------------------------------------
// 14:14               spi2en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_spi2en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_spi2en = wdata[14:14]                   ;
assign rcc_c1_spi2_en             = cur_rcc_c1_apb1lenr_spi2en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_spi2en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb1lenr_spi2en_en ),
  .din  (nxt_rcc_c1_apb1lenr_spi2en),
  .dout (cur_rcc_c1_apb1lenr_spi2en)
);

// --------------------------------------------------------------------------------
// 11:11               wwdg2en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_wwdg2en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_wwdg2en = wdata[11:11]                   ;
assign rcc_c1_wwdg2_en             = cur_rcc_c1_apb1lenr_wwdg2en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_wwdg2en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb1lenr_wwdg2en_en ),
  .din  (nxt_rcc_c1_apb1lenr_wwdg2en),
  .dout (cur_rcc_c1_apb1lenr_wwdg2en)
);

// --------------------------------------------------------------------------------
// 9:9                 lptim1en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_lptim1en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_lptim1en = wdata[9:9]                     ;
assign rcc_c1_lptim1_en             = cur_rcc_c1_apb1lenr_lptim1en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_lptim1en (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c1_apb1lenr_lptim1en_en ),
  .din  (nxt_rcc_c1_apb1lenr_lptim1en),
  .dout (cur_rcc_c1_apb1lenr_lptim1en)
);

// --------------------------------------------------------------------------------
// 8:8                 tim14en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_tim14en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_tim14en = wdata[8:8]                     ;
assign rcc_c1_tim14_en             = cur_rcc_c1_apb1lenr_tim14en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_tim14en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb1lenr_tim14en_en ),
  .din  (nxt_rcc_c1_apb1lenr_tim14en),
  .dout (cur_rcc_c1_apb1lenr_tim14en)
);

// --------------------------------------------------------------------------------
// 7:7                 tim13en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_tim13en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_tim13en = wdata[7:7]                     ;
assign rcc_c1_tim13_en             = cur_rcc_c1_apb1lenr_tim13en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_tim13en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb1lenr_tim13en_en ),
  .din  (nxt_rcc_c1_apb1lenr_tim13en),
  .dout (cur_rcc_c1_apb1lenr_tim13en)
);

// --------------------------------------------------------------------------------
// 6:6                 tim12en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_tim12en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_tim12en = wdata[6:6]                     ;
assign rcc_c1_tim12_en             = cur_rcc_c1_apb1lenr_tim12en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_tim12en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb1lenr_tim12en_en ),
  .din  (nxt_rcc_c1_apb1lenr_tim12en),
  .dout (cur_rcc_c1_apb1lenr_tim12en)
);

// --------------------------------------------------------------------------------
// 5:5                 tim7en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_tim7en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_tim7en = wdata[5:5]                     ;
assign rcc_c1_tim7_en             = cur_rcc_c1_apb1lenr_tim7en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_tim7en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb1lenr_tim7en_en ),
  .din  (nxt_rcc_c1_apb1lenr_tim7en),
  .dout (cur_rcc_c1_apb1lenr_tim7en)
);

// --------------------------------------------------------------------------------
// 4:4                 tim6en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_tim6en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_tim6en = wdata[4:4]                     ;
assign rcc_c1_tim6_en             = cur_rcc_c1_apb1lenr_tim6en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_tim6en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb1lenr_tim6en_en ),
  .din  (nxt_rcc_c1_apb1lenr_tim6en),
  .dout (cur_rcc_c1_apb1lenr_tim6en)
);

// --------------------------------------------------------------------------------
// 3:3                 tim5en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_tim5en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_tim5en = wdata[3:3]                     ;
assign rcc_c1_tim5_en             = cur_rcc_c1_apb1lenr_tim5en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_tim5en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb1lenr_tim5en_en ),
  .din  (nxt_rcc_c1_apb1lenr_tim5en),
  .dout (cur_rcc_c1_apb1lenr_tim5en)
);

// --------------------------------------------------------------------------------
// 2:2                 tim4en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_tim4en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_tim4en = wdata[2:2]                     ;
assign rcc_c1_tim4_en             = cur_rcc_c1_apb1lenr_tim4en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_tim4en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb1lenr_tim4en_en ),
  .din  (nxt_rcc_c1_apb1lenr_tim4en),
  .dout (cur_rcc_c1_apb1lenr_tim4en)
);

// --------------------------------------------------------------------------------
// 1:1                 tim3en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_tim3en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_tim3en = wdata[1:1]                     ;
assign rcc_c1_tim3_en             = cur_rcc_c1_apb1lenr_tim3en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_tim3en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb1lenr_tim3en_en ),
  .din  (nxt_rcc_c1_apb1lenr_tim3en),
  .dout (cur_rcc_c1_apb1lenr_tim3en)
);

// --------------------------------------------------------------------------------
// 0:0                 tim2en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1lenr_tim2en_en  = (|wr_req & rcc_c1_apb1lenr_sel);
assign nxt_rcc_c1_apb1lenr_tim2en = wdata[0:0]                     ;
assign rcc_c1_tim2_en             = cur_rcc_c1_apb1lenr_tim2en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1lenr_tim2en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb1lenr_tim2en_en ),
  .din  (nxt_rcc_c1_apb1lenr_tim2en),
  .dout (cur_rcc_c1_apb1lenr_tim2en)
);


// --------------------------------------------------------------------------------
// rcc_c1_apb1henr                         0x14c                                   
// --------------------------------------------------------------------------------
// 8:8                 fdcanen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 mdiosen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 opampen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 swpen               RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 crsen               RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_apb1henr read data
// --------------------------------------------------------------------------------
assign rcc_c1_apb1henr_read = {{23{1'b0}}
                            , cur_rcc_c1_apb1henr_fdcanen
                            , {2{1'b0}}
                            , cur_rcc_c1_apb1henr_mdiosen
                            , cur_rcc_c1_apb1henr_opampen
                            , {1{1'b0}}
                            , cur_rcc_c1_apb1henr_swpen
                            , cur_rcc_c1_apb1henr_crsen
                            , {1{1'b0}}};

// --------------------------------------------------------------------------------
// 8:8                 fdcanen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1henr_fdcanen_en  = (|wr_req & rcc_c1_apb1henr_sel);
assign nxt_rcc_c1_apb1henr_fdcanen = wdata[8:8]                     ;
assign rcc_c1_fdcan_en             = cur_rcc_c1_apb1henr_fdcanen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1henr_fdcanen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb1henr_fdcanen_en ),
  .din  (nxt_rcc_c1_apb1henr_fdcanen),
  .dout (cur_rcc_c1_apb1henr_fdcanen)
);

// --------------------------------------------------------------------------------
// 5:5                 mdiosen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1henr_mdiosen_en  = (|wr_req & rcc_c1_apb1henr_sel);
assign nxt_rcc_c1_apb1henr_mdiosen = wdata[5:5]                     ;
assign rcc_c1_mdios_en             = cur_rcc_c1_apb1henr_mdiosen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1henr_mdiosen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb1henr_mdiosen_en ),
  .din  (nxt_rcc_c1_apb1henr_mdiosen),
  .dout (cur_rcc_c1_apb1henr_mdiosen)
);

// --------------------------------------------------------------------------------
// 4:4                 opampen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1henr_opampen_en  = (|wr_req & rcc_c1_apb1henr_sel);
assign nxt_rcc_c1_apb1henr_opampen = wdata[4:4]                     ;
assign rcc_c1_opamp_en             = cur_rcc_c1_apb1henr_opampen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1henr_opampen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb1henr_opampen_en ),
  .din  (nxt_rcc_c1_apb1henr_opampen),
  .dout (cur_rcc_c1_apb1henr_opampen)
);

// --------------------------------------------------------------------------------
// 2:2                 swpen               RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1henr_swpen_en  = (|wr_req & rcc_c1_apb1henr_sel);
assign nxt_rcc_c1_apb1henr_swpen = wdata[2:2]                     ;
assign rcc_c1_swp_en             = cur_rcc_c1_apb1henr_swpen      ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1henr_swpen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb1henr_swpen_en ),
  .din  (nxt_rcc_c1_apb1henr_swpen),
  .dout (cur_rcc_c1_apb1henr_swpen)
);

// --------------------------------------------------------------------------------
// 1:1                 crsen               RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1henr_crsen_en  = (|wr_req & rcc_c1_apb1henr_sel);
assign nxt_rcc_c1_apb1henr_crsen = wdata[1:1]                     ;
assign rcc_c1_crs_en             = cur_rcc_c1_apb1henr_crsen      ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb1henr_crsen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb1henr_crsen_en ),
  .din  (nxt_rcc_c1_apb1henr_crsen),
  .dout (cur_rcc_c1_apb1henr_crsen)
);


// --------------------------------------------------------------------------------
// rcc_c1_apb2enr                          0x150                                   
// --------------------------------------------------------------------------------
// 29:29               hrtimen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 28:28               dfsdm1en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 24:24               sai3en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 23:23               sai2en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 22:22               sai1en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 20:20               spi5en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 18:18               tim17en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 17:17               tim16en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               tim15en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 13:13               spi4en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 12:12               spi1en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 usart6en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 usart1en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 tim8en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 tim1en              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_apb2enr read data
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_read = {{2{1'b0}}
                           , cur_rcc_c1_apb2enr_hrtimen
                           , cur_rcc_c1_apb2enr_dfsdm1en
                           , {3{1'b0}}
                           , cur_rcc_c1_apb2enr_sai3en
                           , cur_rcc_c1_apb2enr_sai2en
                           , cur_rcc_c1_apb2enr_sai1en
                           , {1{1'b0}}
                           , cur_rcc_c1_apb2enr_spi5en
                           , {1{1'b0}}
                           , cur_rcc_c1_apb2enr_tim17en
                           , cur_rcc_c1_apb2enr_tim16en
                           , cur_rcc_c1_apb2enr_tim15en
                           , {2{1'b0}}
                           , cur_rcc_c1_apb2enr_spi4en
                           , cur_rcc_c1_apb2enr_spi1en
                           , {6{1'b0}}
                           , cur_rcc_c1_apb2enr_usart6en
                           , cur_rcc_c1_apb2enr_usart1en
                           , {2{1'b0}}
                           , cur_rcc_c1_apb2enr_tim8en
                           , cur_rcc_c1_apb2enr_tim1en};

// --------------------------------------------------------------------------------
// 29:29               hrtimen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_hrtimen_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_hrtimen = wdata[29:29]                  ;
assign rcc_c1_hrtim_en            = cur_rcc_c1_apb2enr_hrtimen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_hrtimen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb2enr_hrtimen_en ),
  .din  (nxt_rcc_c1_apb2enr_hrtimen),
  .dout (cur_rcc_c1_apb2enr_hrtimen)
);

// --------------------------------------------------------------------------------
// 28:28               dfsdm1en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_dfsdm1en_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_dfsdm1en = wdata[28:28]                  ;
assign rcc_c1_dfsdm1_en            = cur_rcc_c1_apb2enr_dfsdm1en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_dfsdm1en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb2enr_dfsdm1en_en ),
  .din  (nxt_rcc_c1_apb2enr_dfsdm1en),
  .dout (cur_rcc_c1_apb2enr_dfsdm1en)
);

// --------------------------------------------------------------------------------
// 24:24               sai3en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_sai3en_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_sai3en = wdata[24:24]                  ;
assign rcc_c1_sai3_en            = cur_rcc_c1_apb2enr_sai3en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_sai3en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb2enr_sai3en_en ),
  .din  (nxt_rcc_c1_apb2enr_sai3en),
  .dout (cur_rcc_c1_apb2enr_sai3en)
);

// --------------------------------------------------------------------------------
// 23:23               sai2en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_sai2en_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_sai2en = wdata[23:23]                  ;
assign rcc_c1_sai2_en            = cur_rcc_c1_apb2enr_sai2en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_sai2en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb2enr_sai2en_en ),
  .din  (nxt_rcc_c1_apb2enr_sai2en),
  .dout (cur_rcc_c1_apb2enr_sai2en)
);

// --------------------------------------------------------------------------------
// 22:22               sai1en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_sai1en_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_sai1en = wdata[22:22]                  ;
assign rcc_c1_sai1_en            = cur_rcc_c1_apb2enr_sai1en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_sai1en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb2enr_sai1en_en ),
  .din  (nxt_rcc_c1_apb2enr_sai1en),
  .dout (cur_rcc_c1_apb2enr_sai1en)
);

// --------------------------------------------------------------------------------
// 20:20               spi5en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_spi5en_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_spi5en = wdata[20:20]                  ;
assign rcc_c1_spi5_en            = cur_rcc_c1_apb2enr_spi5en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_spi5en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb2enr_spi5en_en ),
  .din  (nxt_rcc_c1_apb2enr_spi5en),
  .dout (cur_rcc_c1_apb2enr_spi5en)
);

// --------------------------------------------------------------------------------
// 18:18               tim17en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_tim17en_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_tim17en = wdata[18:18]                  ;
assign rcc_c1_tim17_en            = cur_rcc_c1_apb2enr_tim17en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_tim17en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb2enr_tim17en_en ),
  .din  (nxt_rcc_c1_apb2enr_tim17en),
  .dout (cur_rcc_c1_apb2enr_tim17en)
);

// --------------------------------------------------------------------------------
// 17:17               tim16en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_tim16en_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_tim16en = wdata[17:17]                  ;
assign rcc_c1_tim16_en            = cur_rcc_c1_apb2enr_tim16en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_tim16en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb2enr_tim16en_en ),
  .din  (nxt_rcc_c1_apb2enr_tim16en),
  .dout (cur_rcc_c1_apb2enr_tim16en)
);

// --------------------------------------------------------------------------------
// 16:16               tim15en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_tim15en_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_tim15en = wdata[16:16]                  ;
assign rcc_c1_tim15_en            = cur_rcc_c1_apb2enr_tim15en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_tim15en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c1_apb2enr_tim15en_en ),
  .din  (nxt_rcc_c1_apb2enr_tim15en),
  .dout (cur_rcc_c1_apb2enr_tim15en)
);

// --------------------------------------------------------------------------------
// 13:13               spi4en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_spi4en_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_spi4en = wdata[13:13]                  ;
assign rcc_c1_spi4_en            = cur_rcc_c1_apb2enr_spi4en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_spi4en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb2enr_spi4en_en ),
  .din  (nxt_rcc_c1_apb2enr_spi4en),
  .dout (cur_rcc_c1_apb2enr_spi4en)
);

// --------------------------------------------------------------------------------
// 12:12               spi1en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_spi1en_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_spi1en = wdata[12:12]                  ;
assign rcc_c1_spi1_en            = cur_rcc_c1_apb2enr_spi1en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_spi1en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb2enr_spi1en_en ),
  .din  (nxt_rcc_c1_apb2enr_spi1en),
  .dout (cur_rcc_c1_apb2enr_spi1en)
);

// --------------------------------------------------------------------------------
// 5:5                 usart6en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_usart6en_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_usart6en = wdata[5:5]                    ;
assign rcc_c1_usart6_en            = cur_rcc_c1_apb2enr_usart6en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_usart6en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb2enr_usart6en_en ),
  .din  (nxt_rcc_c1_apb2enr_usart6en),
  .dout (cur_rcc_c1_apb2enr_usart6en)
);

// --------------------------------------------------------------------------------
// 4:4                 usart1en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_usart1en_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_usart1en = wdata[4:4]                    ;
assign rcc_c1_usart1_en            = cur_rcc_c1_apb2enr_usart1en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_usart1en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb2enr_usart1en_en ),
  .din  (nxt_rcc_c1_apb2enr_usart1en),
  .dout (cur_rcc_c1_apb2enr_usart1en)
);

// --------------------------------------------------------------------------------
// 1:1                 tim8en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_tim8en_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_tim8en = wdata[1:1]                    ;
assign rcc_c1_tim8_en            = cur_rcc_c1_apb2enr_tim8en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_tim8en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb2enr_tim8en_en ),
  .din  (nxt_rcc_c1_apb2enr_tim8en),
  .dout (cur_rcc_c1_apb2enr_tim8en)
);

// --------------------------------------------------------------------------------
// 0:0                 tim1en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2enr_tim1en_en  = (|wr_req & rcc_c1_apb2enr_sel);
assign nxt_rcc_c1_apb2enr_tim1en = wdata[0:0]                    ;
assign rcc_c1_tim1_en            = cur_rcc_c1_apb2enr_tim1en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb2enr_tim1en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb2enr_tim1en_en ),
  .din  (nxt_rcc_c1_apb2enr_tim1en),
  .dout (cur_rcc_c1_apb2enr_tim1en)
);


// --------------------------------------------------------------------------------
// rcc_c1_apb4enr                          0x154                                   
// --------------------------------------------------------------------------------
// 21:21               sai4en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               rtcapben            RW                  0b1                 
// --------------------------------------------------------------------------------
// 15:15               vrefen              RW                  0b0                 
// --------------------------------------------------------------------------------
// 14:14               comp12en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 12:12               lptim5en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 11:11               lptim4en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 10:10               lptim3en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 lptim2en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 i2c4en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 spi6en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 lpuart1en           RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 syscfgen            RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_apb4enr read data
// --------------------------------------------------------------------------------
assign rcc_c1_apb4enr_read = {{10{1'b0}}
                           , cur_rcc_c1_apb4enr_sai4en
                           , {4{1'b0}}
                           , cur_rcc_c1_apb4enr_rtcapben
                           , cur_rcc_c1_apb4enr_vrefen
                           , cur_rcc_c1_apb4enr_comp12en
                           , {1{1'b0}}
                           , cur_rcc_c1_apb4enr_lptim5en
                           , cur_rcc_c1_apb4enr_lptim4en
                           , cur_rcc_c1_apb4enr_lptim3en
                           , cur_rcc_c1_apb4enr_lptim2en
                           , {1{1'b0}}
                           , cur_rcc_c1_apb4enr_i2c4en
                           , {1{1'b0}}
                           , cur_rcc_c1_apb4enr_spi6en
                           , {1{1'b0}}
                           , cur_rcc_c1_apb4enr_lpuart1en
                           , {1{1'b0}}
                           , cur_rcc_c1_apb4enr_syscfgen
                           , {1{1'b0}}};

// --------------------------------------------------------------------------------
// 21:21               sai4en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4enr_sai4en_en  = (|wr_req & rcc_c1_apb4enr_sel);
assign nxt_rcc_c1_apb4enr_sai4en = wdata[21:21]                  ;
assign rcc_c1_sai4_en            = cur_rcc_c1_apb4enr_sai4en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb4enr_sai4en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb4enr_sai4en_en ),
  .din  (nxt_rcc_c1_apb4enr_sai4en),
  .dout (cur_rcc_c1_apb4enr_sai4en)
);

// --------------------------------------------------------------------------------
// 16:16               rtcapben            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4enr_rtcapben_en  = (|wr_req & rcc_c1_apb4enr_sel);
assign nxt_rcc_c1_apb4enr_rtcapben = wdata[16:16]                  ;
assign rcc_c1_rtcapb_en            = cur_rcc_c1_apb4enr_rtcapben   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb4enr_rtcapben (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb4enr_rtcapben_en ),
  .din  (nxt_rcc_c1_apb4enr_rtcapben),
  .dout (cur_rcc_c1_apb4enr_rtcapben)
);

// --------------------------------------------------------------------------------
// 15:15               vrefen              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4enr_vrefen_en  = (|wr_req & rcc_c1_apb4enr_sel);
assign nxt_rcc_c1_apb4enr_vrefen = wdata[15:15]                  ;
assign rcc_c1_vref_en            = cur_rcc_c1_apb4enr_vrefen     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb4enr_vrefen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb4enr_vrefen_en ),
  .din  (nxt_rcc_c1_apb4enr_vrefen),
  .dout (cur_rcc_c1_apb4enr_vrefen)
);

// --------------------------------------------------------------------------------
// 14:14               comp12en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4enr_comp12en_en  = (|wr_req & rcc_c1_apb4enr_sel);
assign nxt_rcc_c1_apb4enr_comp12en = wdata[14:14]                  ;
assign rcc_c1_comp12_en            = cur_rcc_c1_apb4enr_comp12en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb4enr_comp12en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb4enr_comp12en_en ),
  .din  (nxt_rcc_c1_apb4enr_comp12en),
  .dout (cur_rcc_c1_apb4enr_comp12en)
);

// --------------------------------------------------------------------------------
// 12:12               lptim5en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4enr_lptim5en_en  = (|wr_req & rcc_c1_apb4enr_sel);
assign nxt_rcc_c1_apb4enr_lptim5en = wdata[12:12]                  ;
assign rcc_c1_lptim5_en            = cur_rcc_c1_apb4enr_lptim5en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb4enr_lptim5en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb4enr_lptim5en_en ),
  .din  (nxt_rcc_c1_apb4enr_lptim5en),
  .dout (cur_rcc_c1_apb4enr_lptim5en)
);

// --------------------------------------------------------------------------------
// 11:11               lptim4en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4enr_lptim4en_en  = (|wr_req & rcc_c1_apb4enr_sel);
assign nxt_rcc_c1_apb4enr_lptim4en = wdata[11:11]                  ;
assign rcc_c1_lptim4_en            = cur_rcc_c1_apb4enr_lptim4en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb4enr_lptim4en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb4enr_lptim4en_en ),
  .din  (nxt_rcc_c1_apb4enr_lptim4en),
  .dout (cur_rcc_c1_apb4enr_lptim4en)
);

// --------------------------------------------------------------------------------
// 10:10               lptim3en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4enr_lptim3en_en  = (|wr_req & rcc_c1_apb4enr_sel);
assign nxt_rcc_c1_apb4enr_lptim3en = wdata[10:10]                  ;
assign rcc_c1_lptim3_en            = cur_rcc_c1_apb4enr_lptim3en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb4enr_lptim3en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb4enr_lptim3en_en ),
  .din  (nxt_rcc_c1_apb4enr_lptim3en),
  .dout (cur_rcc_c1_apb4enr_lptim3en)
);

// --------------------------------------------------------------------------------
// 9:9                 lptim2en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4enr_lptim2en_en  = (|wr_req & rcc_c1_apb4enr_sel);
assign nxt_rcc_c1_apb4enr_lptim2en = wdata[9:9]                    ;
assign rcc_c1_lptim2_en            = cur_rcc_c1_apb4enr_lptim2en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb4enr_lptim2en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb4enr_lptim2en_en ),
  .din  (nxt_rcc_c1_apb4enr_lptim2en),
  .dout (cur_rcc_c1_apb4enr_lptim2en)
);

// --------------------------------------------------------------------------------
// 7:7                 i2c4en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4enr_i2c4en_en  = (|wr_req & rcc_c1_apb4enr_sel);
assign nxt_rcc_c1_apb4enr_i2c4en = wdata[7:7]                    ;
assign rcc_c1_i2c4_en            = cur_rcc_c1_apb4enr_i2c4en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb4enr_i2c4en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb4enr_i2c4en_en ),
  .din  (nxt_rcc_c1_apb4enr_i2c4en),
  .dout (cur_rcc_c1_apb4enr_i2c4en)
);

// --------------------------------------------------------------------------------
// 5:5                 spi6en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4enr_spi6en_en  = (|wr_req & rcc_c1_apb4enr_sel);
assign nxt_rcc_c1_apb4enr_spi6en = wdata[5:5]                    ;
assign rcc_c1_spi6_en            = cur_rcc_c1_apb4enr_spi6en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb4enr_spi6en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c1_apb4enr_spi6en_en ),
  .din  (nxt_rcc_c1_apb4enr_spi6en),
  .dout (cur_rcc_c1_apb4enr_spi6en)
);

// --------------------------------------------------------------------------------
// 3:3                 lpuart1en           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4enr_lpuart1en_en  = (|wr_req & rcc_c1_apb4enr_sel);
assign nxt_rcc_c1_apb4enr_lpuart1en = wdata[3:3]                    ;
assign rcc_c1_lpuart1_en            = cur_rcc_c1_apb4enr_lpuart1en  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb4enr_lpuart1en (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c1_apb4enr_lpuart1en_en ),
  .din  (nxt_rcc_c1_apb4enr_lpuart1en),
  .dout (cur_rcc_c1_apb4enr_lpuart1en)
);

// --------------------------------------------------------------------------------
// 1:1                 syscfgen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4enr_syscfgen_en  = (|wr_req & rcc_c1_apb4enr_sel);
assign nxt_rcc_c1_apb4enr_syscfgen = wdata[1:1]                    ;
assign rcc_c1_syscfg_en            = cur_rcc_c1_apb4enr_syscfgen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_apb4enr_syscfgen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c1_apb4enr_syscfgen_en ),
  .din  (nxt_rcc_c1_apb4enr_syscfgen),
  .dout (cur_rcc_c1_apb4enr_syscfgen)
);


// --------------------------------------------------------------------------------
// rcc_c1_ahb3lpenr                        0x15c                                   
// --------------------------------------------------------------------------------
// 31:31               axisramlpen         RW                  0b1                 
// --------------------------------------------------------------------------------
// 30:30               itcmlpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 29:29               dtcm2lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 28:28               dtcm1lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 16:16               sdmmc1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 14:14               qspilpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 12:12               fmclpen             RW                  0b1                 
// --------------------------------------------------------------------------------
// 8:8                 flitflpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 5:5                 jpgdeclpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 4:4                 dma2dlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 0:0                 mdmalpen            RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_ahb3lpenr read data
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3lpenr_read = {cur_rcc_c1_ahb3lpenr_axisramlpen
                             , cur_rcc_c1_ahb3lpenr_itcmlpen
                             , cur_rcc_c1_ahb3lpenr_dtcm2lpen
                             , cur_rcc_c1_ahb3lpenr_dtcm1lpen
                             , {11{1'b0}}
                             , cur_rcc_c1_ahb3lpenr_sdmmc1lpen
                             , {1{1'b0}}
                             , cur_rcc_c1_ahb3lpenr_qspilpen
                             , {1{1'b0}}
                             , cur_rcc_c1_ahb3lpenr_fmclpen
                             , {3{1'b0}}
                             , cur_rcc_c1_ahb3lpenr_flitflpen
                             , {2{1'b0}}
                             , cur_rcc_c1_ahb3lpenr_jpgdeclpen
                             , cur_rcc_c1_ahb3lpenr_dma2dlpen
                             , {3{1'b0}}
                             , cur_rcc_c1_ahb3lpenr_mdmalpen};

// --------------------------------------------------------------------------------
// 31:31               axisramlpen         RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3lpenr_axisramlpen_en  = (|wr_req & rcc_c1_ahb3lpenr_sel);
assign nxt_rcc_c1_ahb3lpenr_axisramlpen = wdata[31:31]                    ;
assign rcc_c1_axisramlp_en              = cur_rcc_c1_ahb3lpenr_axisramlpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb3lpenr_axisramlpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c1_ahb3lpenr_axisramlpen_en ),
  .din  (nxt_rcc_c1_ahb3lpenr_axisramlpen),
  .dout (cur_rcc_c1_ahb3lpenr_axisramlpen)
);

// --------------------------------------------------------------------------------
// 30:30               itcmlpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3lpenr_itcmlpen_en  = (|wr_req & rcc_c1_ahb3lpenr_sel);
assign nxt_rcc_c1_ahb3lpenr_itcmlpen = wdata[30:30]                    ;
assign rcc_c1_itcmlp_en              = cur_rcc_c1_ahb3lpenr_itcmlpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb3lpenr_itcmlpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_ahb3lpenr_itcmlpen_en ),
  .din  (nxt_rcc_c1_ahb3lpenr_itcmlpen),
  .dout (cur_rcc_c1_ahb3lpenr_itcmlpen)
);

// --------------------------------------------------------------------------------
// 29:29               dtcm2lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3lpenr_dtcm2lpen_en  = (|wr_req & rcc_c1_ahb3lpenr_sel);
assign nxt_rcc_c1_ahb3lpenr_dtcm2lpen = wdata[29:29]                    ;
assign rcc_c1_dtcm2lp_en              = cur_rcc_c1_ahb3lpenr_dtcm2lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb3lpenr_dtcm2lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb3lpenr_dtcm2lpen_en ),
  .din  (nxt_rcc_c1_ahb3lpenr_dtcm2lpen),
  .dout (cur_rcc_c1_ahb3lpenr_dtcm2lpen)
);

// --------------------------------------------------------------------------------
// 28:28               dtcm1lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3lpenr_dtcm1lpen_en  = (|wr_req & rcc_c1_ahb3lpenr_sel);
assign nxt_rcc_c1_ahb3lpenr_dtcm1lpen = wdata[28:28]                    ;
assign rcc_c1_dtcm1lp_en              = cur_rcc_c1_ahb3lpenr_dtcm1lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb3lpenr_dtcm1lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb3lpenr_dtcm1lpen_en ),
  .din  (nxt_rcc_c1_ahb3lpenr_dtcm1lpen),
  .dout (cur_rcc_c1_ahb3lpenr_dtcm1lpen)
);

// --------------------------------------------------------------------------------
// 16:16               sdmmc1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3lpenr_sdmmc1lpen_en  = (|wr_req & rcc_c1_ahb3lpenr_sel);
assign nxt_rcc_c1_ahb3lpenr_sdmmc1lpen = wdata[16:16]                    ;
assign rcc_c1_sdmmc1lp_en              = cur_rcc_c1_ahb3lpenr_sdmmc1lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb3lpenr_sdmmc1lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_ahb3lpenr_sdmmc1lpen_en ),
  .din  (nxt_rcc_c1_ahb3lpenr_sdmmc1lpen),
  .dout (cur_rcc_c1_ahb3lpenr_sdmmc1lpen)
);

// --------------------------------------------------------------------------------
// 14:14               qspilpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3lpenr_qspilpen_en  = (|wr_req & rcc_c1_ahb3lpenr_sel);
assign nxt_rcc_c1_ahb3lpenr_qspilpen = wdata[14:14]                    ;
assign rcc_c1_qspilp_en              = cur_rcc_c1_ahb3lpenr_qspilpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb3lpenr_qspilpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_ahb3lpenr_qspilpen_en ),
  .din  (nxt_rcc_c1_ahb3lpenr_qspilpen),
  .dout (cur_rcc_c1_ahb3lpenr_qspilpen)
);

// --------------------------------------------------------------------------------
// 12:12               fmclpen             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3lpenr_fmclpen_en  = (|wr_req & rcc_c1_ahb3lpenr_sel);
assign nxt_rcc_c1_ahb3lpenr_fmclpen = wdata[12:12]                    ;
assign rcc_c1_fmclp_en              = cur_rcc_c1_ahb3lpenr_fmclpen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb3lpenr_fmclpen (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c1_ahb3lpenr_fmclpen_en ),
  .din  (nxt_rcc_c1_ahb3lpenr_fmclpen),
  .dout (cur_rcc_c1_ahb3lpenr_fmclpen)
);

// --------------------------------------------------------------------------------
// 8:8                 flitflpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3lpenr_flitflpen_en  = (|wr_req & rcc_c1_ahb3lpenr_sel);
assign nxt_rcc_c1_ahb3lpenr_flitflpen = wdata[8:8]                      ;
assign rcc_c1_flitflp_en              = cur_rcc_c1_ahb3lpenr_flitflpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb3lpenr_flitflpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb3lpenr_flitflpen_en ),
  .din  (nxt_rcc_c1_ahb3lpenr_flitflpen),
  .dout (cur_rcc_c1_ahb3lpenr_flitflpen)
);

// --------------------------------------------------------------------------------
// 5:5                 jpgdeclpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3lpenr_jpgdeclpen_en  = (|wr_req & rcc_c1_ahb3lpenr_sel);
assign nxt_rcc_c1_ahb3lpenr_jpgdeclpen = wdata[5:5]                      ;
assign rcc_c1_jpgdeclp_en              = cur_rcc_c1_ahb3lpenr_jpgdeclpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb3lpenr_jpgdeclpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_ahb3lpenr_jpgdeclpen_en ),
  .din  (nxt_rcc_c1_ahb3lpenr_jpgdeclpen),
  .dout (cur_rcc_c1_ahb3lpenr_jpgdeclpen)
);

// --------------------------------------------------------------------------------
// 4:4                 dma2dlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3lpenr_dma2dlpen_en  = (|wr_req & rcc_c1_ahb3lpenr_sel);
assign nxt_rcc_c1_ahb3lpenr_dma2dlpen = wdata[4:4]                      ;
assign rcc_c1_dma2dlp_en              = cur_rcc_c1_ahb3lpenr_dma2dlpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb3lpenr_dma2dlpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb3lpenr_dma2dlpen_en ),
  .din  (nxt_rcc_c1_ahb3lpenr_dma2dlpen),
  .dout (cur_rcc_c1_ahb3lpenr_dma2dlpen)
);

// --------------------------------------------------------------------------------
// 0:0                 mdmalpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb3lpenr_mdmalpen_en  = (|wr_req & rcc_c1_ahb3lpenr_sel);
assign nxt_rcc_c1_ahb3lpenr_mdmalpen = wdata[0:0]                      ;
assign rcc_c1_mdmalp_en              = cur_rcc_c1_ahb3lpenr_mdmalpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb3lpenr_mdmalpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_ahb3lpenr_mdmalpen_en ),
  .din  (nxt_rcc_c1_ahb3lpenr_mdmalpen),
  .dout (cur_rcc_c1_ahb3lpenr_mdmalpen)
);


// --------------------------------------------------------------------------------
// rcc_c1_ahb1lpenr                        0x160                                   
// --------------------------------------------------------------------------------
// 28:28               usb2ulpilpen        RW                  0b1                 
// --------------------------------------------------------------------------------
// 27:27               usb2otglpen         RW                  0b1                 
// --------------------------------------------------------------------------------
// 26:26               usb1ulpilpen        RW                  0b1                 
// --------------------------------------------------------------------------------
// 25:25               usb1otglpen         RW                  0b1                 
// --------------------------------------------------------------------------------
// 17:17               eth1rxlpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 16:16               eth1txlpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 15:15               eth1maclpen         RW                  0b1                 
// --------------------------------------------------------------------------------
// 5:5                 adc12lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 1:1                 dma2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 0:0                 dma1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_ahb1lpenr read data
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1lpenr_read = {{3{1'b0}}
                             , cur_rcc_c1_ahb1lpenr_usb2ulpilpen
                             , cur_rcc_c1_ahb1lpenr_usb2otglpen
                             , cur_rcc_c1_ahb1lpenr_usb1ulpilpen
                             , cur_rcc_c1_ahb1lpenr_usb1otglpen
                             , {7{1'b0}}
                             , cur_rcc_c1_ahb1lpenr_eth1rxlpen
                             , cur_rcc_c1_ahb1lpenr_eth1txlpen
                             , cur_rcc_c1_ahb1lpenr_eth1maclpen
                             , {9{1'b0}}
                             , cur_rcc_c1_ahb1lpenr_adc12lpen
                             , {3{1'b0}}
                             , cur_rcc_c1_ahb1lpenr_dma2lpen
                             , cur_rcc_c1_ahb1lpenr_dma1lpen};

// --------------------------------------------------------------------------------
// 28:28               usb2ulpilpen        RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1lpenr_usb2ulpilpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel) ;
assign nxt_rcc_c1_ahb1lpenr_usb2ulpilpen = wdata[28:28]                     ;
assign rcc_c1_usb2ulpilp_en              = cur_rcc_c1_ahb1lpenr_usb2ulpilpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb1lpenr_usb2ulpilpen (
  .clk  (clk                              ),
  .rst_n(rst_n                            ),
  .en   (rcc_c1_ahb1lpenr_usb2ulpilpen_en ),
  .din  (nxt_rcc_c1_ahb1lpenr_usb2ulpilpen),
  .dout (cur_rcc_c1_ahb1lpenr_usb2ulpilpen)
);

// --------------------------------------------------------------------------------
// 27:27               usb2otglpen         RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1lpenr_usb2otglpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
assign nxt_rcc_c1_ahb1lpenr_usb2otglpen = wdata[27:27]                    ;
assign rcc_c1_usb2otglp_en              = cur_rcc_c1_ahb1lpenr_usb2otglpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb1lpenr_usb2otglpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c1_ahb1lpenr_usb2otglpen_en ),
  .din  (nxt_rcc_c1_ahb1lpenr_usb2otglpen),
  .dout (cur_rcc_c1_ahb1lpenr_usb2otglpen)
);

// --------------------------------------------------------------------------------
// 26:26               usb1ulpilpen        RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1lpenr_usb1ulpilpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel) ;
assign nxt_rcc_c1_ahb1lpenr_usb1ulpilpen = wdata[26:26]                     ;
assign rcc_c1_usb1ulpilp_en              = cur_rcc_c1_ahb1lpenr_usb1ulpilpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb1lpenr_usb1ulpilpen (
  .clk  (clk                              ),
  .rst_n(rst_n                            ),
  .en   (rcc_c1_ahb1lpenr_usb1ulpilpen_en ),
  .din  (nxt_rcc_c1_ahb1lpenr_usb1ulpilpen),
  .dout (cur_rcc_c1_ahb1lpenr_usb1ulpilpen)
);

// --------------------------------------------------------------------------------
// 25:25               usb1otglpen         RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1lpenr_usb1otglpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
assign nxt_rcc_c1_ahb1lpenr_usb1otglpen = wdata[25:25]                    ;
assign rcc_c1_usb1otglp_en              = cur_rcc_c1_ahb1lpenr_usb1otglpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb1lpenr_usb1otglpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c1_ahb1lpenr_usb1otglpen_en ),
  .din  (nxt_rcc_c1_ahb1lpenr_usb1otglpen),
  .dout (cur_rcc_c1_ahb1lpenr_usb1otglpen)
);

// --------------------------------------------------------------------------------
// 17:17               eth1rxlpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1lpenr_eth1rxlpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
assign nxt_rcc_c1_ahb1lpenr_eth1rxlpen = wdata[17:17]                    ;
assign rcc_c1_eth1rxlp_en              = cur_rcc_c1_ahb1lpenr_eth1rxlpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb1lpenr_eth1rxlpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_ahb1lpenr_eth1rxlpen_en ),
  .din  (nxt_rcc_c1_ahb1lpenr_eth1rxlpen),
  .dout (cur_rcc_c1_ahb1lpenr_eth1rxlpen)
);

// --------------------------------------------------------------------------------
// 16:16               eth1txlpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1lpenr_eth1txlpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
assign nxt_rcc_c1_ahb1lpenr_eth1txlpen = wdata[16:16]                    ;
assign rcc_c1_eth1txlp_en              = cur_rcc_c1_ahb1lpenr_eth1txlpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb1lpenr_eth1txlpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_ahb1lpenr_eth1txlpen_en ),
  .din  (nxt_rcc_c1_ahb1lpenr_eth1txlpen),
  .dout (cur_rcc_c1_ahb1lpenr_eth1txlpen)
);

// --------------------------------------------------------------------------------
// 15:15               eth1maclpen         RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1lpenr_eth1maclpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
assign nxt_rcc_c1_ahb1lpenr_eth1maclpen = wdata[15:15]                    ;
assign rcc_c1_eth1maclp_en              = cur_rcc_c1_ahb1lpenr_eth1maclpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb1lpenr_eth1maclpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c1_ahb1lpenr_eth1maclpen_en ),
  .din  (nxt_rcc_c1_ahb1lpenr_eth1maclpen),
  .dout (cur_rcc_c1_ahb1lpenr_eth1maclpen)
);

// --------------------------------------------------------------------------------
// 5:5                 adc12lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1lpenr_adc12lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
assign nxt_rcc_c1_ahb1lpenr_adc12lpen = wdata[5:5]                      ;
assign rcc_c1_adc12lp_en              = cur_rcc_c1_ahb1lpenr_adc12lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb1lpenr_adc12lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb1lpenr_adc12lpen_en ),
  .din  (nxt_rcc_c1_ahb1lpenr_adc12lpen),
  .dout (cur_rcc_c1_ahb1lpenr_adc12lpen)
);

// --------------------------------------------------------------------------------
// 1:1                 dma2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1lpenr_dma2lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
assign nxt_rcc_c1_ahb1lpenr_dma2lpen = wdata[1:1]                      ;
assign rcc_c1_dma2lp_en              = cur_rcc_c1_ahb1lpenr_dma2lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb1lpenr_dma2lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_ahb1lpenr_dma2lpen_en ),
  .din  (nxt_rcc_c1_ahb1lpenr_dma2lpen),
  .dout (cur_rcc_c1_ahb1lpenr_dma2lpen)
);

// --------------------------------------------------------------------------------
// 0:0                 dma1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb1lpenr_dma1lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
assign nxt_rcc_c1_ahb1lpenr_dma1lpen = wdata[0:0]                      ;
assign rcc_c1_dma1lp_en              = cur_rcc_c1_ahb1lpenr_dma1lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb1lpenr_dma1lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_ahb1lpenr_dma1lpen_en ),
  .din  (nxt_rcc_c1_ahb1lpenr_dma1lpen),
  .dout (cur_rcc_c1_ahb1lpenr_dma1lpen)
);


// --------------------------------------------------------------------------------
// rcc_c1_ahb2lpenr                        0x164                                   
// --------------------------------------------------------------------------------
// 31:31               sram3lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 30:30               sram2lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 29:29               sram1lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 9:9                 sdmmc2lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 6:6                 rnglpen             RW                  0b1                 
// --------------------------------------------------------------------------------
// 5:5                 hashlpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 4:4                 cryptlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 0:0                 dcmilpen            RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_ahb2lpenr read data
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2lpenr_read = {cur_rcc_c1_ahb2lpenr_sram3lpen
                             , cur_rcc_c1_ahb2lpenr_sram2lpen
                             , cur_rcc_c1_ahb2lpenr_sram1lpen
                             , {19{1'b0}}
                             , cur_rcc_c1_ahb2lpenr_sdmmc2lpen
                             , {2{1'b0}}
                             , cur_rcc_c1_ahb2lpenr_rnglpen
                             , cur_rcc_c1_ahb2lpenr_hashlpen
                             , cur_rcc_c1_ahb2lpenr_cryptlpen
                             , {3{1'b0}}
                             , cur_rcc_c1_ahb2lpenr_dcmilpen};

// --------------------------------------------------------------------------------
// 31:31               sram3lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2lpenr_sram3lpen_en  = (|wr_req & rcc_c1_ahb2lpenr_sel);
assign nxt_rcc_c1_ahb2lpenr_sram3lpen = wdata[31:31]                    ;
assign rcc_c1_sram3lp_en              = cur_rcc_c1_ahb2lpenr_sram3lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb2lpenr_sram3lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb2lpenr_sram3lpen_en ),
  .din  (nxt_rcc_c1_ahb2lpenr_sram3lpen),
  .dout (cur_rcc_c1_ahb2lpenr_sram3lpen)
);

// --------------------------------------------------------------------------------
// 30:30               sram2lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2lpenr_sram2lpen_en  = (|wr_req & rcc_c1_ahb2lpenr_sel);
assign nxt_rcc_c1_ahb2lpenr_sram2lpen = wdata[30:30]                    ;
assign rcc_c1_sram2lp_en              = cur_rcc_c1_ahb2lpenr_sram2lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb2lpenr_sram2lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb2lpenr_sram2lpen_en ),
  .din  (nxt_rcc_c1_ahb2lpenr_sram2lpen),
  .dout (cur_rcc_c1_ahb2lpenr_sram2lpen)
);

// --------------------------------------------------------------------------------
// 29:29               sram1lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2lpenr_sram1lpen_en  = (|wr_req & rcc_c1_ahb2lpenr_sel);
assign nxt_rcc_c1_ahb2lpenr_sram1lpen = wdata[29:29]                    ;
assign rcc_c1_sram1lp_en              = cur_rcc_c1_ahb2lpenr_sram1lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb2lpenr_sram1lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb2lpenr_sram1lpen_en ),
  .din  (nxt_rcc_c1_ahb2lpenr_sram1lpen),
  .dout (cur_rcc_c1_ahb2lpenr_sram1lpen)
);

// --------------------------------------------------------------------------------
// 9:9                 sdmmc2lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2lpenr_sdmmc2lpen_en  = (|wr_req & rcc_c1_ahb2lpenr_sel);
assign nxt_rcc_c1_ahb2lpenr_sdmmc2lpen = wdata[9:9]                      ;
assign rcc_c1_sdmmc2lp_en              = cur_rcc_c1_ahb2lpenr_sdmmc2lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb2lpenr_sdmmc2lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_ahb2lpenr_sdmmc2lpen_en ),
  .din  (nxt_rcc_c1_ahb2lpenr_sdmmc2lpen),
  .dout (cur_rcc_c1_ahb2lpenr_sdmmc2lpen)
);

// --------------------------------------------------------------------------------
// 6:6                 rnglpen             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2lpenr_rnglpen_en  = (|wr_req & rcc_c1_ahb2lpenr_sel);
assign nxt_rcc_c1_ahb2lpenr_rnglpen = wdata[6:6]                      ;
assign rcc_c1_rnglp_en              = cur_rcc_c1_ahb2lpenr_rnglpen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb2lpenr_rnglpen (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c1_ahb2lpenr_rnglpen_en ),
  .din  (nxt_rcc_c1_ahb2lpenr_rnglpen),
  .dout (cur_rcc_c1_ahb2lpenr_rnglpen)
);

// --------------------------------------------------------------------------------
// 5:5                 hashlpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2lpenr_hashlpen_en  = (|wr_req & rcc_c1_ahb2lpenr_sel);
assign nxt_rcc_c1_ahb2lpenr_hashlpen = wdata[5:5]                      ;
assign rcc_c1_hashlp_en              = cur_rcc_c1_ahb2lpenr_hashlpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb2lpenr_hashlpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_ahb2lpenr_hashlpen_en ),
  .din  (nxt_rcc_c1_ahb2lpenr_hashlpen),
  .dout (cur_rcc_c1_ahb2lpenr_hashlpen)
);

// --------------------------------------------------------------------------------
// 4:4                 cryptlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2lpenr_cryptlpen_en  = (|wr_req & rcc_c1_ahb2lpenr_sel);
assign nxt_rcc_c1_ahb2lpenr_cryptlpen = wdata[4:4]                      ;
assign rcc_c1_cryptlp_en              = cur_rcc_c1_ahb2lpenr_cryptlpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb2lpenr_cryptlpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb2lpenr_cryptlpen_en ),
  .din  (nxt_rcc_c1_ahb2lpenr_cryptlpen),
  .dout (cur_rcc_c1_ahb2lpenr_cryptlpen)
);

// --------------------------------------------------------------------------------
// 0:0                 dcmilpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb2lpenr_dcmilpen_en  = (|wr_req & rcc_c1_ahb2lpenr_sel);
assign nxt_rcc_c1_ahb2lpenr_dcmilpen = wdata[0:0]                      ;
assign rcc_c1_dcmilp_en              = cur_rcc_c1_ahb2lpenr_dcmilpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb2lpenr_dcmilpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_ahb2lpenr_dcmilpen_en ),
  .din  (nxt_rcc_c1_ahb2lpenr_dcmilpen),
  .dout (cur_rcc_c1_ahb2lpenr_dcmilpen)
);


// --------------------------------------------------------------------------------
// rcc_c1_ahb4lpenr                        0x168                                   
// --------------------------------------------------------------------------------
// 29:29               sram4lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 28:28               bkpramlpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 24:24               adc3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 21:21               bdmalpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 19:19               crclpen             RW                  0b1                 
// --------------------------------------------------------------------------------
// 10:10               gpioklpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 gpiojlpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 gpioilpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 gpiohlpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:6                 gpioglpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 gpioflpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 gpioelpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 gpiodlpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 gpioclpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 gpioblpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 gpioalpen           RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_ahb4lpenr read data
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_read = {{2{1'b0}}
                             , cur_rcc_c1_ahb4lpenr_sram4lpen
                             , cur_rcc_c1_ahb4lpenr_bkpramlpen
                             , {3{1'b0}}
                             , cur_rcc_c1_ahb4lpenr_adc3lpen
                             , {2{1'b0}}
                             , cur_rcc_c1_ahb4lpenr_bdmalpen
                             , {1{1'b0}}
                             , cur_rcc_c1_ahb4lpenr_crclpen
                             , {8{1'b0}}
                             , cur_rcc_c1_ahb4lpenr_gpioklpen
                             , cur_rcc_c1_ahb4lpenr_gpiojlpen
                             , cur_rcc_c1_ahb4lpenr_gpioilpen
                             , cur_rcc_c1_ahb4lpenr_gpiohlpen
                             , cur_rcc_c1_ahb4lpenr_gpioglpen
                             , cur_rcc_c1_ahb4lpenr_gpioflpen
                             , cur_rcc_c1_ahb4lpenr_gpioelpen
                             , cur_rcc_c1_ahb4lpenr_gpiodlpen
                             , cur_rcc_c1_ahb4lpenr_gpioclpen
                             , cur_rcc_c1_ahb4lpenr_gpioblpen
                             , cur_rcc_c1_ahb4lpenr_gpioalpen};

// --------------------------------------------------------------------------------
// 29:29               sram4lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_sram4lpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_sram4lpen = wdata[29:29]                    ;
assign rcc_c1_sram4lp_en              = cur_rcc_c1_ahb4lpenr_sram4lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb4lpenr_sram4lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb4lpenr_sram4lpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_sram4lpen),
  .dout (cur_rcc_c1_ahb4lpenr_sram4lpen)
);

// --------------------------------------------------------------------------------
// 28:28               bkpramlpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_bkpramlpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_bkpramlpen = wdata[28:28]                    ;
assign rcc_c1_bkpramlp_en              = cur_rcc_c1_ahb4lpenr_bkpramlpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb4lpenr_bkpramlpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_ahb4lpenr_bkpramlpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_bkpramlpen),
  .dout (cur_rcc_c1_ahb4lpenr_bkpramlpen)
);

// --------------------------------------------------------------------------------
// 24:24               adc3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_adc3lpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_adc3lpen = wdata[24:24]                    ;
assign rcc_c1_adc3lp_en              = cur_rcc_c1_ahb4lpenr_adc3lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb4lpenr_adc3lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_ahb4lpenr_adc3lpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_adc3lpen),
  .dout (cur_rcc_c1_ahb4lpenr_adc3lpen)
);

// --------------------------------------------------------------------------------
// 21:21               bdmalpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_bdmalpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_bdmalpen = wdata[21:21]                    ;
assign rcc_c1_bdmalp_en              = cur_rcc_c1_ahb4lpenr_bdmalpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb4lpenr_bdmalpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_ahb4lpenr_bdmalpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_bdmalpen),
  .dout (cur_rcc_c1_ahb4lpenr_bdmalpen)
);

// --------------------------------------------------------------------------------
// 19:19               crclpen             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_crclpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_crclpen = wdata[19:19]                    ;
assign rcc_c1_crclp_en              = cur_rcc_c1_ahb4lpenr_crclpen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_ahb4lpenr_crclpen (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c1_ahb4lpenr_crclpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_crclpen),
  .dout (cur_rcc_c1_ahb4lpenr_crclpen)
);

// --------------------------------------------------------------------------------
// 10:10               gpioklpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_gpioklpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_gpioklpen = wdata[10:10]                    ;
assign rcc_c1_gpioklp_en              = cur_rcc_c1_ahb4lpenr_gpioklpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4lpenr_gpioklpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb4lpenr_gpioklpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_gpioklpen),
  .dout (cur_rcc_c1_ahb4lpenr_gpioklpen)
);

// --------------------------------------------------------------------------------
// 9:9                 gpiojlpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_gpiojlpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_gpiojlpen = wdata[9:9]                      ;
assign rcc_c1_gpiojlp_en              = cur_rcc_c1_ahb4lpenr_gpiojlpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4lpenr_gpiojlpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb4lpenr_gpiojlpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_gpiojlpen),
  .dout (cur_rcc_c1_ahb4lpenr_gpiojlpen)
);

// --------------------------------------------------------------------------------
// 8:8                 gpioilpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_gpioilpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_gpioilpen = wdata[8:8]                      ;
assign rcc_c1_gpioilp_en              = cur_rcc_c1_ahb4lpenr_gpioilpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4lpenr_gpioilpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb4lpenr_gpioilpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_gpioilpen),
  .dout (cur_rcc_c1_ahb4lpenr_gpioilpen)
);

// --------------------------------------------------------------------------------
// 7:7                 gpiohlpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_gpiohlpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_gpiohlpen = wdata[7:7]                      ;
assign rcc_c1_gpiohlp_en              = cur_rcc_c1_ahb4lpenr_gpiohlpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4lpenr_gpiohlpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb4lpenr_gpiohlpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_gpiohlpen),
  .dout (cur_rcc_c1_ahb4lpenr_gpiohlpen)
);

// --------------------------------------------------------------------------------
// 6:6                 gpioglpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_gpioglpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_gpioglpen = wdata[6:6]                      ;
assign rcc_c1_gpioglp_en              = cur_rcc_c1_ahb4lpenr_gpioglpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4lpenr_gpioglpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb4lpenr_gpioglpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_gpioglpen),
  .dout (cur_rcc_c1_ahb4lpenr_gpioglpen)
);

// --------------------------------------------------------------------------------
// 5:5                 gpioflpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_gpioflpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_gpioflpen = wdata[5:5]                      ;
assign rcc_c1_gpioflp_en              = cur_rcc_c1_ahb4lpenr_gpioflpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4lpenr_gpioflpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb4lpenr_gpioflpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_gpioflpen),
  .dout (cur_rcc_c1_ahb4lpenr_gpioflpen)
);

// --------------------------------------------------------------------------------
// 4:4                 gpioelpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_gpioelpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_gpioelpen = wdata[4:4]                      ;
assign rcc_c1_gpioelp_en              = cur_rcc_c1_ahb4lpenr_gpioelpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4lpenr_gpioelpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb4lpenr_gpioelpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_gpioelpen),
  .dout (cur_rcc_c1_ahb4lpenr_gpioelpen)
);

// --------------------------------------------------------------------------------
// 3:3                 gpiodlpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_gpiodlpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_gpiodlpen = wdata[3:3]                      ;
assign rcc_c1_gpiodlp_en              = cur_rcc_c1_ahb4lpenr_gpiodlpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4lpenr_gpiodlpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb4lpenr_gpiodlpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_gpiodlpen),
  .dout (cur_rcc_c1_ahb4lpenr_gpiodlpen)
);

// --------------------------------------------------------------------------------
// 2:2                 gpioclpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_gpioclpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_gpioclpen = wdata[2:2]                      ;
assign rcc_c1_gpioclp_en              = cur_rcc_c1_ahb4lpenr_gpioclpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4lpenr_gpioclpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb4lpenr_gpioclpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_gpioclpen),
  .dout (cur_rcc_c1_ahb4lpenr_gpioclpen)
);

// --------------------------------------------------------------------------------
// 1:1                 gpioblpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_gpioblpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_gpioblpen = wdata[1:1]                      ;
assign rcc_c1_gpioblp_en              = cur_rcc_c1_ahb4lpenr_gpioblpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4lpenr_gpioblpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb4lpenr_gpioblpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_gpioblpen),
  .dout (cur_rcc_c1_ahb4lpenr_gpioblpen)
);

// --------------------------------------------------------------------------------
// 0:0                 gpioalpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_ahb4lpenr_gpioalpen_en  = (|wr_req & rcc_c1_ahb4lpenr_sel);
assign nxt_rcc_c1_ahb4lpenr_gpioalpen = wdata[0:0]                      ;
assign rcc_c1_gpioalp_en              = cur_rcc_c1_ahb4lpenr_gpioalpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_ahb4lpenr_gpioalpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_ahb4lpenr_gpioalpen_en ),
  .din  (nxt_rcc_c1_ahb4lpenr_gpioalpen),
  .dout (cur_rcc_c1_ahb4lpenr_gpioalpen)
);


// --------------------------------------------------------------------------------
// rcc_c1_apb3lpenr                        0x16c                                   
// --------------------------------------------------------------------------------
// 6:6                 wwdg1lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 3:3                 ltdclpen            RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_apb3lpenr read data
// --------------------------------------------------------------------------------
assign rcc_c1_apb3lpenr_read = {{25{1'b0}}
                             , cur_rcc_c1_apb3lpenr_wwdg1lpen
                             , {2{1'b0}}
                             , cur_rcc_c1_apb3lpenr_ltdclpen
                             , {3{1'b0}}};

// --------------------------------------------------------------------------------
// 6:6                 wwdg1lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb3lpenr_wwdg1lpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
assign nxt_rcc_c1_apb3lpenr_wwdg1lpen = wdata[6:6]                      ;
assign rcc_c1_wwdg1lp_en              = cur_rcc_c1_apb3lpenr_wwdg1lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb3lpenr_wwdg1lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb3lpenr_wwdg1lpen_en ),
  .din  (nxt_rcc_c1_apb3lpenr_wwdg1lpen),
  .dout (cur_rcc_c1_apb3lpenr_wwdg1lpen)
);

// --------------------------------------------------------------------------------
// 3:3                 ltdclpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb3lpenr_ltdclpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
assign nxt_rcc_c1_apb3lpenr_ltdclpen = wdata[3:3]                      ;
assign rcc_c1_ltdclp_en              = cur_rcc_c1_apb3lpenr_ltdclpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb3lpenr_ltdclpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb3lpenr_ltdclpen_en ),
  .din  (nxt_rcc_c1_apb3lpenr_ltdclpen),
  .dout (cur_rcc_c1_apb3lpenr_ltdclpen)
);


// --------------------------------------------------------------------------------
// rcc_c1_apb1llpenr                       0x170                                   
// --------------------------------------------------------------------------------
// 31:31               uart8lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 30:30               uart7lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 29:29               dac12lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 27:27               hdmiceclpen         RW                  0b1                 
// --------------------------------------------------------------------------------
// 23:23               i2c3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 22:22               i2c2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 21:21               i2c1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 20:20               uart5lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 19:19               uart4lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 18:18               usart3lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 17:17               usart2lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 16:16               spdifrxlpen         RW                  0b1                 
// --------------------------------------------------------------------------------
// 15:15               spi3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 14:14               spi2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 11:11               wwdg2lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 9:9                 lptim1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 8:8                 tim14lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 7:7                 tim13lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 6:6                 tim12lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 5:5                 tim7lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 4:4                 tim6lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 3:3                 tim5lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 2:2                 tim4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 1:1                 tim3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 0:0                 tim2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_apb1llpenr read data
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_read = {cur_rcc_c1_apb1llpenr_uart8lpen
                              , cur_rcc_c1_apb1llpenr_uart7lpen
                              , cur_rcc_c1_apb1llpenr_dac12lpen
                              , {1{1'b0}}
                              , cur_rcc_c1_apb1llpenr_hdmiceclpen
                              , {3{1'b0}}
                              , cur_rcc_c1_apb1llpenr_i2c3lpen
                              , cur_rcc_c1_apb1llpenr_i2c2lpen
                              , cur_rcc_c1_apb1llpenr_i2c1lpen
                              , cur_rcc_c1_apb1llpenr_uart5lpen
                              , cur_rcc_c1_apb1llpenr_uart4lpen
                              , cur_rcc_c1_apb1llpenr_usart3lpen
                              , cur_rcc_c1_apb1llpenr_usart2lpen
                              , cur_rcc_c1_apb1llpenr_spdifrxlpen
                              , cur_rcc_c1_apb1llpenr_spi3lpen
                              , cur_rcc_c1_apb1llpenr_spi2lpen
                              , {2{1'b0}}
                              , cur_rcc_c1_apb1llpenr_wwdg2lpen
                              , {1{1'b0}}
                              , cur_rcc_c1_apb1llpenr_lptim1lpen
                              , cur_rcc_c1_apb1llpenr_tim14lpen
                              , cur_rcc_c1_apb1llpenr_tim13lpen
                              , cur_rcc_c1_apb1llpenr_tim12lpen
                              , cur_rcc_c1_apb1llpenr_tim7lpen
                              , cur_rcc_c1_apb1llpenr_tim6lpen
                              , cur_rcc_c1_apb1llpenr_tim5lpen
                              , cur_rcc_c1_apb1llpenr_tim4lpen
                              , cur_rcc_c1_apb1llpenr_tim3lpen
                              , cur_rcc_c1_apb1llpenr_tim2lpen};

// --------------------------------------------------------------------------------
// 31:31               uart8lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_uart8lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_uart8lpen = wdata[31:31]                     ;
assign rcc_c1_uart8lp_en               = cur_rcc_c1_apb1llpenr_uart8lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_uart8lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb1llpenr_uart8lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_uart8lpen),
  .dout (cur_rcc_c1_apb1llpenr_uart8lpen)
);

// --------------------------------------------------------------------------------
// 30:30               uart7lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_uart7lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_uart7lpen = wdata[30:30]                     ;
assign rcc_c1_uart7lp_en               = cur_rcc_c1_apb1llpenr_uart7lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_uart7lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb1llpenr_uart7lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_uart7lpen),
  .dout (cur_rcc_c1_apb1llpenr_uart7lpen)
);

// --------------------------------------------------------------------------------
// 29:29               dac12lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_dac12lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_dac12lpen = wdata[29:29]                     ;
assign rcc_c1_dac12lp_en               = cur_rcc_c1_apb1llpenr_dac12lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_dac12lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb1llpenr_dac12lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_dac12lpen),
  .dout (cur_rcc_c1_apb1llpenr_dac12lpen)
);

// --------------------------------------------------------------------------------
// 27:27               hdmiceclpen         RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_hdmiceclpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_hdmiceclpen = wdata[27:27]                     ;
assign rcc_c1_hdmiceclp_en               = cur_rcc_c1_apb1llpenr_hdmiceclpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_hdmiceclpen (
  .clk  (clk                              ),
  .rst_n(rst_n                            ),
  .en   (rcc_c1_apb1llpenr_hdmiceclpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_hdmiceclpen),
  .dout (cur_rcc_c1_apb1llpenr_hdmiceclpen)
);

// --------------------------------------------------------------------------------
// 23:23               i2c3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_i2c3lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_i2c3lpen = wdata[23:23]                     ;
assign rcc_c1_i2c3lp_en               = cur_rcc_c1_apb1llpenr_i2c3lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_i2c3lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb1llpenr_i2c3lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_i2c3lpen),
  .dout (cur_rcc_c1_apb1llpenr_i2c3lpen)
);

// --------------------------------------------------------------------------------
// 22:22               i2c2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_i2c2lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_i2c2lpen = wdata[22:22]                     ;
assign rcc_c1_i2c2lp_en               = cur_rcc_c1_apb1llpenr_i2c2lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_i2c2lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb1llpenr_i2c2lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_i2c2lpen),
  .dout (cur_rcc_c1_apb1llpenr_i2c2lpen)
);

// --------------------------------------------------------------------------------
// 21:21               i2c1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_i2c1lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_i2c1lpen = wdata[21:21]                     ;
assign rcc_c1_i2c1lp_en               = cur_rcc_c1_apb1llpenr_i2c1lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_i2c1lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb1llpenr_i2c1lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_i2c1lpen),
  .dout (cur_rcc_c1_apb1llpenr_i2c1lpen)
);

// --------------------------------------------------------------------------------
// 20:20               uart5lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_uart5lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_uart5lpen = wdata[20:20]                     ;
assign rcc_c1_uart5lp_en               = cur_rcc_c1_apb1llpenr_uart5lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_uart5lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb1llpenr_uart5lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_uart5lpen),
  .dout (cur_rcc_c1_apb1llpenr_uart5lpen)
);

// --------------------------------------------------------------------------------
// 19:19               uart4lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_uart4lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_uart4lpen = wdata[19:19]                     ;
assign rcc_c1_uart4lp_en               = cur_rcc_c1_apb1llpenr_uart4lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_uart4lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb1llpenr_uart4lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_uart4lpen),
  .dout (cur_rcc_c1_apb1llpenr_uart4lpen)
);

// --------------------------------------------------------------------------------
// 18:18               usart3lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_usart3lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_usart3lpen = wdata[18:18]                     ;
assign rcc_c1_usart3lp_en               = cur_rcc_c1_apb1llpenr_usart3lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_usart3lpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c1_apb1llpenr_usart3lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_usart3lpen),
  .dout (cur_rcc_c1_apb1llpenr_usart3lpen)
);

// --------------------------------------------------------------------------------
// 17:17               usart2lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_usart2lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_usart2lpen = wdata[17:17]                     ;
assign rcc_c1_usart2lp_en               = cur_rcc_c1_apb1llpenr_usart2lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_usart2lpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c1_apb1llpenr_usart2lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_usart2lpen),
  .dout (cur_rcc_c1_apb1llpenr_usart2lpen)
);

// --------------------------------------------------------------------------------
// 16:16               spdifrxlpen         RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_spdifrxlpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_spdifrxlpen = wdata[16:16]                     ;
assign rcc_c1_spdifrxlp_en               = cur_rcc_c1_apb1llpenr_spdifrxlpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_spdifrxlpen (
  .clk  (clk                              ),
  .rst_n(rst_n                            ),
  .en   (rcc_c1_apb1llpenr_spdifrxlpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_spdifrxlpen),
  .dout (cur_rcc_c1_apb1llpenr_spdifrxlpen)
);

// --------------------------------------------------------------------------------
// 15:15               spi3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_spi3lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_spi3lpen = wdata[15:15]                     ;
assign rcc_c1_spi3lp_en               = cur_rcc_c1_apb1llpenr_spi3lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_spi3lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb1llpenr_spi3lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_spi3lpen),
  .dout (cur_rcc_c1_apb1llpenr_spi3lpen)
);

// --------------------------------------------------------------------------------
// 14:14               spi2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_spi2lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_spi2lpen = wdata[14:14]                     ;
assign rcc_c1_spi2lp_en               = cur_rcc_c1_apb1llpenr_spi2lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_spi2lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb1llpenr_spi2lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_spi2lpen),
  .dout (cur_rcc_c1_apb1llpenr_spi2lpen)
);

// --------------------------------------------------------------------------------
// 11:11               wwdg2lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_wwdg2lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_wwdg2lpen = wdata[11:11]                     ;
assign rcc_c1_wwdg2lp_en               = cur_rcc_c1_apb1llpenr_wwdg2lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_wwdg2lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb1llpenr_wwdg2lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_wwdg2lpen),
  .dout (cur_rcc_c1_apb1llpenr_wwdg2lpen)
);

// --------------------------------------------------------------------------------
// 9:9                 lptim1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_lptim1lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_lptim1lpen = wdata[9:9]                       ;
assign rcc_c1_lptim1lp_en               = cur_rcc_c1_apb1llpenr_lptim1lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_lptim1lpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c1_apb1llpenr_lptim1lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_lptim1lpen),
  .dout (cur_rcc_c1_apb1llpenr_lptim1lpen)
);

// --------------------------------------------------------------------------------
// 8:8                 tim14lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_tim14lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_tim14lpen = wdata[8:8]                       ;
assign rcc_c1_tim14lp_en               = cur_rcc_c1_apb1llpenr_tim14lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_tim14lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb1llpenr_tim14lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_tim14lpen),
  .dout (cur_rcc_c1_apb1llpenr_tim14lpen)
);

// --------------------------------------------------------------------------------
// 7:7                 tim13lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_tim13lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_tim13lpen = wdata[7:7]                       ;
assign rcc_c1_tim13lp_en               = cur_rcc_c1_apb1llpenr_tim13lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_tim13lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb1llpenr_tim13lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_tim13lpen),
  .dout (cur_rcc_c1_apb1llpenr_tim13lpen)
);

// --------------------------------------------------------------------------------
// 6:6                 tim12lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_tim12lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_tim12lpen = wdata[6:6]                       ;
assign rcc_c1_tim12lp_en               = cur_rcc_c1_apb1llpenr_tim12lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_tim12lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb1llpenr_tim12lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_tim12lpen),
  .dout (cur_rcc_c1_apb1llpenr_tim12lpen)
);

// --------------------------------------------------------------------------------
// 5:5                 tim7lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_tim7lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_tim7lpen = wdata[5:5]                       ;
assign rcc_c1_tim7lp_en               = cur_rcc_c1_apb1llpenr_tim7lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_tim7lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb1llpenr_tim7lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_tim7lpen),
  .dout (cur_rcc_c1_apb1llpenr_tim7lpen)
);

// --------------------------------------------------------------------------------
// 4:4                 tim6lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_tim6lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_tim6lpen = wdata[4:4]                       ;
assign rcc_c1_tim6lp_en               = cur_rcc_c1_apb1llpenr_tim6lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_tim6lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb1llpenr_tim6lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_tim6lpen),
  .dout (cur_rcc_c1_apb1llpenr_tim6lpen)
);

// --------------------------------------------------------------------------------
// 3:3                 tim5lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_tim5lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_tim5lpen = wdata[3:3]                       ;
assign rcc_c1_tim5lp_en               = cur_rcc_c1_apb1llpenr_tim5lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_tim5lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb1llpenr_tim5lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_tim5lpen),
  .dout (cur_rcc_c1_apb1llpenr_tim5lpen)
);

// --------------------------------------------------------------------------------
// 2:2                 tim4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_tim4lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_tim4lpen = wdata[2:2]                       ;
assign rcc_c1_tim4lp_en               = cur_rcc_c1_apb1llpenr_tim4lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_tim4lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb1llpenr_tim4lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_tim4lpen),
  .dout (cur_rcc_c1_apb1llpenr_tim4lpen)
);

// --------------------------------------------------------------------------------
// 1:1                 tim3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_tim3lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_tim3lpen = wdata[1:1]                       ;
assign rcc_c1_tim3lp_en               = cur_rcc_c1_apb1llpenr_tim3lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_tim3lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb1llpenr_tim3lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_tim3lpen),
  .dout (cur_rcc_c1_apb1llpenr_tim3lpen)
);

// --------------------------------------------------------------------------------
// 0:0                 tim2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1llpenr_tim2lpen_en  = (|wr_req & rcc_c1_apb1llpenr_sel);
assign nxt_rcc_c1_apb1llpenr_tim2lpen = wdata[0:0]                       ;
assign rcc_c1_tim2lp_en               = cur_rcc_c1_apb1llpenr_tim2lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1llpenr_tim2lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb1llpenr_tim2lpen_en ),
  .din  (nxt_rcc_c1_apb1llpenr_tim2lpen),
  .dout (cur_rcc_c1_apb1llpenr_tim2lpen)
);


// --------------------------------------------------------------------------------
// rcc_c1_apb1hlpenr                       0x174                                   
// --------------------------------------------------------------------------------
// 8:8                 fdcanlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 5:5                 mdioslpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 4:4                 opamplpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 2:2                 swplpen             RW                  0b1                 
// --------------------------------------------------------------------------------
// 1:1                 crslpen             RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_apb1hlpenr read data
// --------------------------------------------------------------------------------
assign rcc_c1_apb1hlpenr_read = {{23{1'b0}}
                              , cur_rcc_c1_apb1hlpenr_fdcanlpen
                              , {2{1'b0}}
                              , cur_rcc_c1_apb1hlpenr_mdioslpen
                              , cur_rcc_c1_apb1hlpenr_opamplpen
                              , {1{1'b0}}
                              , cur_rcc_c1_apb1hlpenr_swplpen
                              , cur_rcc_c1_apb1hlpenr_crslpen
                              , {1{1'b0}}};

// --------------------------------------------------------------------------------
// 8:8                 fdcanlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1hlpenr_fdcanlpen_en  = (|wr_req & rcc_c1_apb1hlpenr_sel);
assign nxt_rcc_c1_apb1hlpenr_fdcanlpen = wdata[8:8]                       ;
assign rcc_c1_fdcanlp_en               = cur_rcc_c1_apb1hlpenr_fdcanlpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1hlpenr_fdcanlpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb1hlpenr_fdcanlpen_en ),
  .din  (nxt_rcc_c1_apb1hlpenr_fdcanlpen),
  .dout (cur_rcc_c1_apb1hlpenr_fdcanlpen)
);

// --------------------------------------------------------------------------------
// 5:5                 mdioslpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1hlpenr_mdioslpen_en  = (|wr_req & rcc_c1_apb1hlpenr_sel);
assign nxt_rcc_c1_apb1hlpenr_mdioslpen = wdata[5:5]                       ;
assign rcc_c1_mdioslp_en               = cur_rcc_c1_apb1hlpenr_mdioslpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1hlpenr_mdioslpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb1hlpenr_mdioslpen_en ),
  .din  (nxt_rcc_c1_apb1hlpenr_mdioslpen),
  .dout (cur_rcc_c1_apb1hlpenr_mdioslpen)
);

// --------------------------------------------------------------------------------
// 4:4                 opamplpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1hlpenr_opamplpen_en  = (|wr_req & rcc_c1_apb1hlpenr_sel);
assign nxt_rcc_c1_apb1hlpenr_opamplpen = wdata[4:4]                       ;
assign rcc_c1_opamplp_en               = cur_rcc_c1_apb1hlpenr_opamplpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1hlpenr_opamplpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb1hlpenr_opamplpen_en ),
  .din  (nxt_rcc_c1_apb1hlpenr_opamplpen),
  .dout (cur_rcc_c1_apb1hlpenr_opamplpen)
);

// --------------------------------------------------------------------------------
// 2:2                 swplpen             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1hlpenr_swplpen_en  = (|wr_req & rcc_c1_apb1hlpenr_sel);
assign nxt_rcc_c1_apb1hlpenr_swplpen = wdata[2:2]                       ;
assign rcc_c1_swplp_en               = cur_rcc_c1_apb1hlpenr_swplpen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1hlpenr_swplpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb1hlpenr_swplpen_en ),
  .din  (nxt_rcc_c1_apb1hlpenr_swplpen),
  .dout (cur_rcc_c1_apb1hlpenr_swplpen)
);

// --------------------------------------------------------------------------------
// 1:1                 crslpen             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb1hlpenr_crslpen_en  = (|wr_req & rcc_c1_apb1hlpenr_sel);
assign nxt_rcc_c1_apb1hlpenr_crslpen = wdata[1:1]                       ;
assign rcc_c1_crslp_en               = cur_rcc_c1_apb1hlpenr_crslpen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb1hlpenr_crslpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb1hlpenr_crslpen_en ),
  .din  (nxt_rcc_c1_apb1hlpenr_crslpen),
  .dout (cur_rcc_c1_apb1hlpenr_crslpen)
);


// --------------------------------------------------------------------------------
// rcc_c1_apb2lpenr                        0x178                                   
// --------------------------------------------------------------------------------
// 29:29               hrtimlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 28:28               dfsdm1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 24:24               sai3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 23:23               sai2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 22:22               sai1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 20:20               spi5lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 18:18               tim17lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 17:17               tim16lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 16:16               tim15lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 13:13               spi4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 12:12               spi1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 5:5                 usart6lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 4:4                 usart1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 1:1                 tim8lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 0:0                 tim1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_apb2lpenr read data
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_read = {{2{1'b0}}
                             , cur_rcc_c1_apb2lpenr_hrtimlpen
                             , cur_rcc_c1_apb2lpenr_dfsdm1lpen
                             , {3{1'b0}}
                             , cur_rcc_c1_apb2lpenr_sai3lpen
                             , cur_rcc_c1_apb2lpenr_sai2lpen
                             , cur_rcc_c1_apb2lpenr_sai1lpen
                             , {1{1'b0}}
                             , cur_rcc_c1_apb2lpenr_spi5lpen
                             , {1{1'b0}}
                             , cur_rcc_c1_apb2lpenr_tim17lpen
                             , cur_rcc_c1_apb2lpenr_tim16lpen
                             , cur_rcc_c1_apb2lpenr_tim15lpen
                             , {2{1'b0}}
                             , cur_rcc_c1_apb2lpenr_spi4lpen
                             , cur_rcc_c1_apb2lpenr_spi1lpen
                             , {6{1'b0}}
                             , cur_rcc_c1_apb2lpenr_usart6lpen
                             , cur_rcc_c1_apb2lpenr_usart1lpen
                             , {2{1'b0}}
                             , cur_rcc_c1_apb2lpenr_tim8lpen
                             , cur_rcc_c1_apb2lpenr_tim1lpen};

// --------------------------------------------------------------------------------
// 29:29               hrtimlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_hrtimlpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_hrtimlpen = wdata[29:29]                    ;
assign rcc_c1_hrtimlp_en              = cur_rcc_c1_apb2lpenr_hrtimlpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_hrtimlpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb2lpenr_hrtimlpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_hrtimlpen),
  .dout (cur_rcc_c1_apb2lpenr_hrtimlpen)
);

// --------------------------------------------------------------------------------
// 28:28               dfsdm1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_dfsdm1lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_dfsdm1lpen = wdata[28:28]                    ;
assign rcc_c1_dfsdm1lp_en              = cur_rcc_c1_apb2lpenr_dfsdm1lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_dfsdm1lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb2lpenr_dfsdm1lpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_dfsdm1lpen),
  .dout (cur_rcc_c1_apb2lpenr_dfsdm1lpen)
);

// --------------------------------------------------------------------------------
// 24:24               sai3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_sai3lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_sai3lpen = wdata[24:24]                    ;
assign rcc_c1_sai3lp_en              = cur_rcc_c1_apb2lpenr_sai3lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_sai3lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb2lpenr_sai3lpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_sai3lpen),
  .dout (cur_rcc_c1_apb2lpenr_sai3lpen)
);

// --------------------------------------------------------------------------------
// 23:23               sai2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_sai2lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_sai2lpen = wdata[23:23]                    ;
assign rcc_c1_sai2lp_en              = cur_rcc_c1_apb2lpenr_sai2lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_sai2lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb2lpenr_sai2lpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_sai2lpen),
  .dout (cur_rcc_c1_apb2lpenr_sai2lpen)
);

// --------------------------------------------------------------------------------
// 22:22               sai1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_sai1lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_sai1lpen = wdata[22:22]                    ;
assign rcc_c1_sai1lp_en              = cur_rcc_c1_apb2lpenr_sai1lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_sai1lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb2lpenr_sai1lpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_sai1lpen),
  .dout (cur_rcc_c1_apb2lpenr_sai1lpen)
);

// --------------------------------------------------------------------------------
// 20:20               spi5lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_spi5lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_spi5lpen = wdata[20:20]                    ;
assign rcc_c1_spi5lp_en              = cur_rcc_c1_apb2lpenr_spi5lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_spi5lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb2lpenr_spi5lpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_spi5lpen),
  .dout (cur_rcc_c1_apb2lpenr_spi5lpen)
);

// --------------------------------------------------------------------------------
// 18:18               tim17lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_tim17lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_tim17lpen = wdata[18:18]                    ;
assign rcc_c1_tim17lp_en              = cur_rcc_c1_apb2lpenr_tim17lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_tim17lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb2lpenr_tim17lpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_tim17lpen),
  .dout (cur_rcc_c1_apb2lpenr_tim17lpen)
);

// --------------------------------------------------------------------------------
// 17:17               tim16lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_tim16lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_tim16lpen = wdata[17:17]                    ;
assign rcc_c1_tim16lp_en              = cur_rcc_c1_apb2lpenr_tim16lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_tim16lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb2lpenr_tim16lpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_tim16lpen),
  .dout (cur_rcc_c1_apb2lpenr_tim16lpen)
);

// --------------------------------------------------------------------------------
// 16:16               tim15lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_tim15lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_tim15lpen = wdata[16:16]                    ;
assign rcc_c1_tim15lp_en              = cur_rcc_c1_apb2lpenr_tim15lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_tim15lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c1_apb2lpenr_tim15lpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_tim15lpen),
  .dout (cur_rcc_c1_apb2lpenr_tim15lpen)
);

// --------------------------------------------------------------------------------
// 13:13               spi4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_spi4lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_spi4lpen = wdata[13:13]                    ;
assign rcc_c1_spi4lp_en              = cur_rcc_c1_apb2lpenr_spi4lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_spi4lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb2lpenr_spi4lpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_spi4lpen),
  .dout (cur_rcc_c1_apb2lpenr_spi4lpen)
);

// --------------------------------------------------------------------------------
// 12:12               spi1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_spi1lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_spi1lpen = wdata[12:12]                    ;
assign rcc_c1_spi1lp_en              = cur_rcc_c1_apb2lpenr_spi1lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_spi1lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb2lpenr_spi1lpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_spi1lpen),
  .dout (cur_rcc_c1_apb2lpenr_spi1lpen)
);

// --------------------------------------------------------------------------------
// 5:5                 usart6lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_usart6lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_usart6lpen = wdata[5:5]                      ;
assign rcc_c1_usart6lp_en              = cur_rcc_c1_apb2lpenr_usart6lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_usart6lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb2lpenr_usart6lpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_usart6lpen),
  .dout (cur_rcc_c1_apb2lpenr_usart6lpen)
);

// --------------------------------------------------------------------------------
// 4:4                 usart1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_usart1lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_usart1lpen = wdata[4:4]                      ;
assign rcc_c1_usart1lp_en              = cur_rcc_c1_apb2lpenr_usart1lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_usart1lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb2lpenr_usart1lpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_usart1lpen),
  .dout (cur_rcc_c1_apb2lpenr_usart1lpen)
);

// --------------------------------------------------------------------------------
// 1:1                 tim8lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_tim8lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_tim8lpen = wdata[1:1]                      ;
assign rcc_c1_tim8lp_en              = cur_rcc_c1_apb2lpenr_tim8lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_tim8lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb2lpenr_tim8lpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_tim8lpen),
  .dout (cur_rcc_c1_apb2lpenr_tim8lpen)
);

// --------------------------------------------------------------------------------
// 0:0                 tim1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb2lpenr_tim1lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
assign nxt_rcc_c1_apb2lpenr_tim1lpen = wdata[0:0]                      ;
assign rcc_c1_tim1lp_en              = cur_rcc_c1_apb2lpenr_tim1lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb2lpenr_tim1lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb2lpenr_tim1lpen_en ),
  .din  (nxt_rcc_c1_apb2lpenr_tim1lpen),
  .dout (cur_rcc_c1_apb2lpenr_tim1lpen)
);


// --------------------------------------------------------------------------------
// rcc_c1_apb4lpenr                        0x17c                                   
// --------------------------------------------------------------------------------
// 21:21               sai4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 16:16               rtcapblpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 15:15               vreflpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 14:14               comp12lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 12:12               lptim5lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 11:11               lptim4lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 10:10               lptim3lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 9:9                 lptim2lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 7:7                 i2c4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 5:5                 spi6lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 3:3                 lpuart1lpen         RW                  0b1                 
// --------------------------------------------------------------------------------
// 1:1                 syscfglpen          RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c1_apb4lpenr read data
// --------------------------------------------------------------------------------
assign rcc_c1_apb4lpenr_read = {{10{1'b0}}
                             , cur_rcc_c1_apb4lpenr_sai4lpen
                             , {4{1'b0}}
                             , cur_rcc_c1_apb4lpenr_rtcapblpen
                             , cur_rcc_c1_apb4lpenr_vreflpen
                             , cur_rcc_c1_apb4lpenr_comp12lpen
                             , {1{1'b0}}
                             , cur_rcc_c1_apb4lpenr_lptim5lpen
                             , cur_rcc_c1_apb4lpenr_lptim4lpen
                             , cur_rcc_c1_apb4lpenr_lptim3lpen
                             , cur_rcc_c1_apb4lpenr_lptim2lpen
                             , {1{1'b0}}
                             , cur_rcc_c1_apb4lpenr_i2c4lpen
                             , {1{1'b0}}
                             , cur_rcc_c1_apb4lpenr_spi6lpen
                             , {1{1'b0}}
                             , cur_rcc_c1_apb4lpenr_lpuart1lpen
                             , {1{1'b0}}
                             , cur_rcc_c1_apb4lpenr_syscfglpen
                             , {1{1'b0}}};

// --------------------------------------------------------------------------------
// 21:21               sai4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4lpenr_sai4lpen_en  = (|wr_req & rcc_c1_apb4lpenr_sel);
assign nxt_rcc_c1_apb4lpenr_sai4lpen = wdata[21:21]                    ;
assign rcc_c1_sai4lp_en              = cur_rcc_c1_apb4lpenr_sai4lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb4lpenr_sai4lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb4lpenr_sai4lpen_en ),
  .din  (nxt_rcc_c1_apb4lpenr_sai4lpen),
  .dout (cur_rcc_c1_apb4lpenr_sai4lpen)
);

// --------------------------------------------------------------------------------
// 16:16               rtcapblpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4lpenr_rtcapblpen_en  = (|wr_req & rcc_c1_apb4lpenr_sel);
assign nxt_rcc_c1_apb4lpenr_rtcapblpen = wdata[16:16]                    ;
assign rcc_c1_rtcapblp_en              = cur_rcc_c1_apb4lpenr_rtcapblpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb4lpenr_rtcapblpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb4lpenr_rtcapblpen_en ),
  .din  (nxt_rcc_c1_apb4lpenr_rtcapblpen),
  .dout (cur_rcc_c1_apb4lpenr_rtcapblpen)
);

// --------------------------------------------------------------------------------
// 15:15               vreflpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4lpenr_vreflpen_en  = (|wr_req & rcc_c1_apb4lpenr_sel);
assign nxt_rcc_c1_apb4lpenr_vreflpen = wdata[15:15]                    ;
assign rcc_c1_vreflp_en              = cur_rcc_c1_apb4lpenr_vreflpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb4lpenr_vreflpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb4lpenr_vreflpen_en ),
  .din  (nxt_rcc_c1_apb4lpenr_vreflpen),
  .dout (cur_rcc_c1_apb4lpenr_vreflpen)
);

// --------------------------------------------------------------------------------
// 14:14               comp12lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4lpenr_comp12lpen_en  = (|wr_req & rcc_c1_apb4lpenr_sel);
assign nxt_rcc_c1_apb4lpenr_comp12lpen = wdata[14:14]                    ;
assign rcc_c1_comp12lp_en              = cur_rcc_c1_apb4lpenr_comp12lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb4lpenr_comp12lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb4lpenr_comp12lpen_en ),
  .din  (nxt_rcc_c1_apb4lpenr_comp12lpen),
  .dout (cur_rcc_c1_apb4lpenr_comp12lpen)
);

// --------------------------------------------------------------------------------
// 12:12               lptim5lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4lpenr_lptim5lpen_en  = (|wr_req & rcc_c1_apb4lpenr_sel);
assign nxt_rcc_c1_apb4lpenr_lptim5lpen = wdata[12:12]                    ;
assign rcc_c1_lptim5lp_en              = cur_rcc_c1_apb4lpenr_lptim5lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb4lpenr_lptim5lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb4lpenr_lptim5lpen_en ),
  .din  (nxt_rcc_c1_apb4lpenr_lptim5lpen),
  .dout (cur_rcc_c1_apb4lpenr_lptim5lpen)
);

// --------------------------------------------------------------------------------
// 11:11               lptim4lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4lpenr_lptim4lpen_en  = (|wr_req & rcc_c1_apb4lpenr_sel);
assign nxt_rcc_c1_apb4lpenr_lptim4lpen = wdata[11:11]                    ;
assign rcc_c1_lptim4lp_en              = cur_rcc_c1_apb4lpenr_lptim4lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb4lpenr_lptim4lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb4lpenr_lptim4lpen_en ),
  .din  (nxt_rcc_c1_apb4lpenr_lptim4lpen),
  .dout (cur_rcc_c1_apb4lpenr_lptim4lpen)
);

// --------------------------------------------------------------------------------
// 10:10               lptim3lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4lpenr_lptim3lpen_en  = (|wr_req & rcc_c1_apb4lpenr_sel);
assign nxt_rcc_c1_apb4lpenr_lptim3lpen = wdata[10:10]                    ;
assign rcc_c1_lptim3lp_en              = cur_rcc_c1_apb4lpenr_lptim3lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb4lpenr_lptim3lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb4lpenr_lptim3lpen_en ),
  .din  (nxt_rcc_c1_apb4lpenr_lptim3lpen),
  .dout (cur_rcc_c1_apb4lpenr_lptim3lpen)
);

// --------------------------------------------------------------------------------
// 9:9                 lptim2lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4lpenr_lptim2lpen_en  = (|wr_req & rcc_c1_apb4lpenr_sel);
assign nxt_rcc_c1_apb4lpenr_lptim2lpen = wdata[9:9]                      ;
assign rcc_c1_lptim2lp_en              = cur_rcc_c1_apb4lpenr_lptim2lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb4lpenr_lptim2lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb4lpenr_lptim2lpen_en ),
  .din  (nxt_rcc_c1_apb4lpenr_lptim2lpen),
  .dout (cur_rcc_c1_apb4lpenr_lptim2lpen)
);

// --------------------------------------------------------------------------------
// 7:7                 i2c4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4lpenr_i2c4lpen_en  = (|wr_req & rcc_c1_apb4lpenr_sel);
assign nxt_rcc_c1_apb4lpenr_i2c4lpen = wdata[7:7]                      ;
assign rcc_c1_i2c4lp_en              = cur_rcc_c1_apb4lpenr_i2c4lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb4lpenr_i2c4lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb4lpenr_i2c4lpen_en ),
  .din  (nxt_rcc_c1_apb4lpenr_i2c4lpen),
  .dout (cur_rcc_c1_apb4lpenr_i2c4lpen)
);

// --------------------------------------------------------------------------------
// 5:5                 spi6lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4lpenr_spi6lpen_en  = (|wr_req & rcc_c1_apb4lpenr_sel);
assign nxt_rcc_c1_apb4lpenr_spi6lpen = wdata[5:5]                      ;
assign rcc_c1_spi6lp_en              = cur_rcc_c1_apb4lpenr_spi6lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb4lpenr_spi6lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c1_apb4lpenr_spi6lpen_en ),
  .din  (nxt_rcc_c1_apb4lpenr_spi6lpen),
  .dout (cur_rcc_c1_apb4lpenr_spi6lpen)
);

// --------------------------------------------------------------------------------
// 3:3                 lpuart1lpen         RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4lpenr_lpuart1lpen_en  = (|wr_req & rcc_c1_apb4lpenr_sel);
assign nxt_rcc_c1_apb4lpenr_lpuart1lpen = wdata[3:3]                      ;
assign rcc_c1_lpuart1lp_en              = cur_rcc_c1_apb4lpenr_lpuart1lpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb4lpenr_lpuart1lpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c1_apb4lpenr_lpuart1lpen_en ),
  .din  (nxt_rcc_c1_apb4lpenr_lpuart1lpen),
  .dout (cur_rcc_c1_apb4lpenr_lpuart1lpen)
);

// --------------------------------------------------------------------------------
// 1:1                 syscfglpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_apb4lpenr_syscfglpen_en  = (|wr_req & rcc_c1_apb4lpenr_sel);
assign nxt_rcc_c1_apb4lpenr_syscfglpen = wdata[1:1]                      ;
assign rcc_c1_syscfglp_en              = cur_rcc_c1_apb4lpenr_syscfglpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c1_apb4lpenr_syscfglpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c1_apb4lpenr_syscfglpen_en ),
  .din  (nxt_rcc_c1_apb4lpenr_syscfglpen),
  .dout (cur_rcc_c1_apb4lpenr_syscfglpen)
);



// --------------------------------------------------------------------------------
// rcc_c2_ahb3enr                          0x194                                   
// --------------------------------------------------------------------------------
// 31:31               axisramen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 30:30               itcmen              RW                  0b0                 
// --------------------------------------------------------------------------------
// 29:29               dtcm2en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 28:28               dtcm1en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               sdmmc1en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 14:14               qspien              RW                  0b0                 
// --------------------------------------------------------------------------------
// 12:12               fmcen               RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 flitfen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 jpgdecen            RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 dma2den             RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 mdmaen              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_ahb3enr read data
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3enr_read = {cur_rcc_c2_ahb3enr_axisramen
                           , cur_rcc_c2_ahb3enr_itcmen
                           , cur_rcc_c2_ahb3enr_dtcm2en
                           , cur_rcc_c2_ahb3enr_dtcm1en
                           , {11{1'b0}}
                           , cur_rcc_c2_ahb3enr_sdmmc1en
                           , {1{1'b0}}
                           , cur_rcc_c2_ahb3enr_qspien
                           , {1{1'b0}}
                           , cur_rcc_c2_ahb3enr_fmcen
                           , {3{1'b0}}
                           , cur_rcc_c2_ahb3enr_flitfen
                           , {2{1'b0}}
                           , cur_rcc_c2_ahb3enr_jpgdecen
                           , cur_rcc_c2_ahb3enr_dma2den
                           , {3{1'b0}}
                           , cur_rcc_c2_ahb3enr_mdmaen};

// --------------------------------------------------------------------------------
// 31:31               axisramen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3enr_axisramen_en  = (|wr_req & rcc_c2_ahb3enr_sel);
assign nxt_rcc_c2_ahb3enr_axisramen = wdata[31:31]                  ;
assign rcc_c2_axisram_en            = cur_rcc_c2_ahb3enr_axisramen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb3enr_axisramen (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c2_ahb3enr_axisramen_en ),
  .din  (nxt_rcc_c2_ahb3enr_axisramen),
  .dout (cur_rcc_c2_ahb3enr_axisramen)
);

// --------------------------------------------------------------------------------
// 30:30               itcmen              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3enr_itcmen_en  = (|wr_req & rcc_c2_ahb3enr_sel);
assign nxt_rcc_c2_ahb3enr_itcmen = wdata[30:30]                  ;
assign rcc_c2_itcm_en            = cur_rcc_c2_ahb3enr_itcmen     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb3enr_itcmen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_ahb3enr_itcmen_en ),
  .din  (nxt_rcc_c2_ahb3enr_itcmen),
  .dout (cur_rcc_c2_ahb3enr_itcmen)
);

// --------------------------------------------------------------------------------
// 29:29               dtcm2en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3enr_dtcm2en_en  = (|wr_req & rcc_c2_ahb3enr_sel);
assign nxt_rcc_c2_ahb3enr_dtcm2en = wdata[29:29]                  ;
assign rcc_c2_dtcm2_en            = cur_rcc_c2_ahb3enr_dtcm2en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb3enr_dtcm2en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb3enr_dtcm2en_en ),
  .din  (nxt_rcc_c2_ahb3enr_dtcm2en),
  .dout (cur_rcc_c2_ahb3enr_dtcm2en)
);

// --------------------------------------------------------------------------------
// 28:28               dtcm1en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3enr_dtcm1en_en  = (|wr_req & rcc_c2_ahb3enr_sel);
assign nxt_rcc_c2_ahb3enr_dtcm1en = wdata[28:28]                  ;
assign rcc_c2_dtcm1_en            = cur_rcc_c2_ahb3enr_dtcm1en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb3enr_dtcm1en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb3enr_dtcm1en_en ),
  .din  (nxt_rcc_c2_ahb3enr_dtcm1en),
  .dout (cur_rcc_c2_ahb3enr_dtcm1en)
);

// --------------------------------------------------------------------------------
// 16:16               sdmmc1en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3enr_sdmmc1en_en  = (|wr_req & rcc_c2_ahb3enr_sel);
assign nxt_rcc_c2_ahb3enr_sdmmc1en = wdata[16:16]                  ;
assign rcc_c2_sdmmc1_en            = cur_rcc_c2_ahb3enr_sdmmc1en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb3enr_sdmmc1en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_ahb3enr_sdmmc1en_en ),
  .din  (nxt_rcc_c2_ahb3enr_sdmmc1en),
  .dout (cur_rcc_c2_ahb3enr_sdmmc1en)
);

// --------------------------------------------------------------------------------
// 14:14               qspien              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3enr_qspien_en  = (|wr_req & rcc_c2_ahb3enr_sel);
assign nxt_rcc_c2_ahb3enr_qspien = wdata[14:14]                  ;
assign rcc_c2_qspi_en            = cur_rcc_c2_ahb3enr_qspien     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb3enr_qspien (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_ahb3enr_qspien_en ),
  .din  (nxt_rcc_c2_ahb3enr_qspien),
  .dout (cur_rcc_c2_ahb3enr_qspien)
);

// --------------------------------------------------------------------------------
// 12:12               fmcen               RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3enr_fmcen_en  = (|wr_req & rcc_c2_ahb3enr_sel);
assign nxt_rcc_c2_ahb3enr_fmcen = wdata[12:12]                  ;
assign rcc_c2_fmc_en            = cur_rcc_c2_ahb3enr_fmcen      ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb3enr_fmcen (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_c2_ahb3enr_fmcen_en ),
  .din  (nxt_rcc_c2_ahb3enr_fmcen),
  .dout (cur_rcc_c2_ahb3enr_fmcen)
);

// --------------------------------------------------------------------------------
// 8:8                 flitfen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3enr_flitfen_en  = (|wr_req & rcc_c2_ahb3enr_sel);
assign nxt_rcc_c2_ahb3enr_flitfen = wdata[8:8]                    ;
assign rcc_c2_flitf_en            = cur_rcc_c2_ahb3enr_flitfen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb3enr_flitfen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb3enr_flitfen_en ),
  .din  (nxt_rcc_c2_ahb3enr_flitfen),
  .dout (cur_rcc_c2_ahb3enr_flitfen)
);

// --------------------------------------------------------------------------------
// 5:5                 jpgdecen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3enr_jpgdecen_en  = (|wr_req & rcc_c2_ahb3enr_sel);
assign nxt_rcc_c2_ahb3enr_jpgdecen = wdata[5:5]                    ;
assign rcc_c2_jpgdec_en            = cur_rcc_c2_ahb3enr_jpgdecen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb3enr_jpgdecen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_ahb3enr_jpgdecen_en ),
  .din  (nxt_rcc_c2_ahb3enr_jpgdecen),
  .dout (cur_rcc_c2_ahb3enr_jpgdecen)
);

// --------------------------------------------------------------------------------
// 4:4                 dma2den             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3enr_dma2den_en  = (|wr_req & rcc_c2_ahb3enr_sel);
assign nxt_rcc_c2_ahb3enr_dma2den = wdata[4:4]                    ;
assign rcc_c2_dma2d_en            = cur_rcc_c2_ahb3enr_dma2den    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb3enr_dma2den (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb3enr_dma2den_en ),
  .din  (nxt_rcc_c2_ahb3enr_dma2den),
  .dout (cur_rcc_c2_ahb3enr_dma2den)
);

// --------------------------------------------------------------------------------
// 0:0                 mdmaen              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3enr_mdmaen_en  = (|wr_req & rcc_c2_ahb3enr_sel);
assign nxt_rcc_c2_ahb3enr_mdmaen = wdata[0:0]                    ;
assign rcc_c2_mdma_en            = cur_rcc_c2_ahb3enr_mdmaen     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb3enr_mdmaen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_ahb3enr_mdmaen_en ),
  .din  (nxt_rcc_c2_ahb3enr_mdmaen),
  .dout (cur_rcc_c2_ahb3enr_mdmaen)
);


// --------------------------------------------------------------------------------
// rcc_c2_ahb1enr                          0x198                                   
// --------------------------------------------------------------------------------
// 28:28               usb2ulpien          RW                  0b0                 
// --------------------------------------------------------------------------------
// 27:27               usb2otgen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 26:26               usb1ulpien          RW                  0b0                 
// --------------------------------------------------------------------------------
// 25:25               usb1otgen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 17:17               eth1rxen            RW                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               eth1txen            RW                  0b0                 
// --------------------------------------------------------------------------------
// 15:15               eth1macen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 adc12en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 dma2en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 dma1en              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_ahb1enr read data
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1enr_read = {{3{1'b0}}
                           , cur_rcc_c2_ahb1enr_usb2ulpien
                           , cur_rcc_c2_ahb1enr_usb2otgen
                           , cur_rcc_c2_ahb1enr_usb1ulpien
                           , cur_rcc_c2_ahb1enr_usb1otgen
                           , {7{1'b0}}
                           , cur_rcc_c2_ahb1enr_eth1rxen
                           , cur_rcc_c2_ahb1enr_eth1txen
                           , cur_rcc_c2_ahb1enr_eth1macen
                           , {9{1'b0}}
                           , cur_rcc_c2_ahb1enr_adc12en
                           , {3{1'b0}}
                           , cur_rcc_c2_ahb1enr_dma2en
                           , cur_rcc_c2_ahb1enr_dma1en};

// --------------------------------------------------------------------------------
// 28:28               usb2ulpien          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1enr_usb2ulpien_en  = (|wr_req & rcc_c2_ahb1enr_sel);
assign nxt_rcc_c2_ahb1enr_usb2ulpien = wdata[28:28]                  ;
assign rcc_c2_usb2ulpi_en            = cur_rcc_c2_ahb1enr_usb2ulpien ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb1enr_usb2ulpien (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_ahb1enr_usb2ulpien_en ),
  .din  (nxt_rcc_c2_ahb1enr_usb2ulpien),
  .dout (cur_rcc_c2_ahb1enr_usb2ulpien)
);

// --------------------------------------------------------------------------------
// 27:27               usb2otgen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1enr_usb2otgen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
assign nxt_rcc_c2_ahb1enr_usb2otgen = wdata[27:27]                  ;
assign rcc_c2_usb2otg_en            = cur_rcc_c2_ahb1enr_usb2otgen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb1enr_usb2otgen (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c2_ahb1enr_usb2otgen_en ),
  .din  (nxt_rcc_c2_ahb1enr_usb2otgen),
  .dout (cur_rcc_c2_ahb1enr_usb2otgen)
);

// --------------------------------------------------------------------------------
// 26:26               usb1ulpien          RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1enr_usb1ulpien_en  = (|wr_req & rcc_c2_ahb1enr_sel);
assign nxt_rcc_c2_ahb1enr_usb1ulpien = wdata[26:26]                  ;
assign rcc_c2_usb1ulpi_en            = cur_rcc_c2_ahb1enr_usb1ulpien ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb1enr_usb1ulpien (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_ahb1enr_usb1ulpien_en ),
  .din  (nxt_rcc_c2_ahb1enr_usb1ulpien),
  .dout (cur_rcc_c2_ahb1enr_usb1ulpien)
);

// --------------------------------------------------------------------------------
// 25:25               usb1otgen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1enr_usb1otgen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
assign nxt_rcc_c2_ahb1enr_usb1otgen = wdata[25:25]                  ;
assign rcc_c2_usb1otg_en            = cur_rcc_c2_ahb1enr_usb1otgen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb1enr_usb1otgen (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c2_ahb1enr_usb1otgen_en ),
  .din  (nxt_rcc_c2_ahb1enr_usb1otgen),
  .dout (cur_rcc_c2_ahb1enr_usb1otgen)
);

// --------------------------------------------------------------------------------
// 17:17               eth1rxen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1enr_eth1rxen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
assign nxt_rcc_c2_ahb1enr_eth1rxen = wdata[17:17]                  ;
assign rcc_c2_eth1rx_en            = cur_rcc_c2_ahb1enr_eth1rxen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb1enr_eth1rxen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_ahb1enr_eth1rxen_en ),
  .din  (nxt_rcc_c2_ahb1enr_eth1rxen),
  .dout (cur_rcc_c2_ahb1enr_eth1rxen)
);

// --------------------------------------------------------------------------------
// 16:16               eth1txen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1enr_eth1txen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
assign nxt_rcc_c2_ahb1enr_eth1txen = wdata[16:16]                  ;
assign rcc_c2_eth1tx_en            = cur_rcc_c2_ahb1enr_eth1txen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb1enr_eth1txen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_ahb1enr_eth1txen_en ),
  .din  (nxt_rcc_c2_ahb1enr_eth1txen),
  .dout (cur_rcc_c2_ahb1enr_eth1txen)
);

// --------------------------------------------------------------------------------
// 15:15               eth1macen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1enr_eth1macen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
assign nxt_rcc_c2_ahb1enr_eth1macen = wdata[15:15]                  ;
assign rcc_c2_eth1mac_en            = cur_rcc_c2_ahb1enr_eth1macen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb1enr_eth1macen (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c2_ahb1enr_eth1macen_en ),
  .din  (nxt_rcc_c2_ahb1enr_eth1macen),
  .dout (cur_rcc_c2_ahb1enr_eth1macen)
);

// --------------------------------------------------------------------------------
// 5:5                 adc12en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1enr_adc12en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
assign nxt_rcc_c2_ahb1enr_adc12en = wdata[5:5]                    ;
assign rcc_c2_adc12_en            = cur_rcc_c2_ahb1enr_adc12en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb1enr_adc12en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb1enr_adc12en_en ),
  .din  (nxt_rcc_c2_ahb1enr_adc12en),
  .dout (cur_rcc_c2_ahb1enr_adc12en)
);

// --------------------------------------------------------------------------------
// 1:1                 dma2en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1enr_dma2en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
assign nxt_rcc_c2_ahb1enr_dma2en = wdata[1:1]                    ;
assign rcc_c2_dma2_en            = cur_rcc_c2_ahb1enr_dma2en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb1enr_dma2en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_ahb1enr_dma2en_en ),
  .din  (nxt_rcc_c2_ahb1enr_dma2en),
  .dout (cur_rcc_c2_ahb1enr_dma2en)
);

// --------------------------------------------------------------------------------
// 0:0                 dma1en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1enr_dma1en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
assign nxt_rcc_c2_ahb1enr_dma1en = wdata[0:0]                    ;
assign rcc_c2_dma1_en            = cur_rcc_c2_ahb1enr_dma1en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb1enr_dma1en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_ahb1enr_dma1en_en ),
  .din  (nxt_rcc_c2_ahb1enr_dma1en),
  .dout (cur_rcc_c2_ahb1enr_dma1en)
);


// --------------------------------------------------------------------------------
// rcc_c2_ahb2enr                          0x19c                                   
// --------------------------------------------------------------------------------
// 31:31               sram3en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 30:30               sram2en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 29:29               sram1en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 sdmmc2en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:6                 rngen               RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 hashen              RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 crypten             RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 dcmien              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_ahb2enr read data
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2enr_read = {cur_rcc_c2_ahb2enr_sram3en
                           , cur_rcc_c2_ahb2enr_sram2en
                           , cur_rcc_c2_ahb2enr_sram1en
                           , {19{1'b0}}
                           , cur_rcc_c2_ahb2enr_sdmmc2en
                           , {2{1'b0}}
                           , cur_rcc_c2_ahb2enr_rngen
                           , cur_rcc_c2_ahb2enr_hashen
                           , cur_rcc_c2_ahb2enr_crypten
                           , {3{1'b0}}
                           , cur_rcc_c2_ahb2enr_dcmien};

// --------------------------------------------------------------------------------
// 31:31               sram3en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2enr_sram3en_en  = (|wr_req & rcc_c2_ahb2enr_sel);
assign nxt_rcc_c2_ahb2enr_sram3en = wdata[31:31]                  ;
assign rcc_c2_sram3_en            = cur_rcc_c2_ahb2enr_sram3en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb2enr_sram3en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb2enr_sram3en_en ),
  .din  (nxt_rcc_c2_ahb2enr_sram3en),
  .dout (cur_rcc_c2_ahb2enr_sram3en)
);

// --------------------------------------------------------------------------------
// 30:30               sram2en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2enr_sram2en_en  = (|wr_req & rcc_c2_ahb2enr_sel);
assign nxt_rcc_c2_ahb2enr_sram2en = wdata[30:30]                  ;
assign rcc_c2_sram2_en            = cur_rcc_c2_ahb2enr_sram2en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb2enr_sram2en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb2enr_sram2en_en ),
  .din  (nxt_rcc_c2_ahb2enr_sram2en),
  .dout (cur_rcc_c2_ahb2enr_sram2en)
);

// --------------------------------------------------------------------------------
// 29:29               sram1en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2enr_sram1en_en  = (|wr_req & rcc_c2_ahb2enr_sel);
assign nxt_rcc_c2_ahb2enr_sram1en = wdata[29:29]                  ;
assign rcc_c2_sram1_en            = cur_rcc_c2_ahb2enr_sram1en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb2enr_sram1en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb2enr_sram1en_en ),
  .din  (nxt_rcc_c2_ahb2enr_sram1en),
  .dout (cur_rcc_c2_ahb2enr_sram1en)
);

// --------------------------------------------------------------------------------
// 9:9                 sdmmc2en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2enr_sdmmc2en_en  = (|wr_req & rcc_c2_ahb2enr_sel);
assign nxt_rcc_c2_ahb2enr_sdmmc2en = wdata[9:9]                    ;
assign rcc_c2_sdmmc2_en            = cur_rcc_c2_ahb2enr_sdmmc2en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb2enr_sdmmc2en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_ahb2enr_sdmmc2en_en ),
  .din  (nxt_rcc_c2_ahb2enr_sdmmc2en),
  .dout (cur_rcc_c2_ahb2enr_sdmmc2en)
);

// --------------------------------------------------------------------------------
// 6:6                 rngen               RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2enr_rngen_en  = (|wr_req & rcc_c2_ahb2enr_sel);
assign nxt_rcc_c2_ahb2enr_rngen = wdata[6:6]                    ;
assign rcc_c2_rng_en            = cur_rcc_c2_ahb2enr_rngen      ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb2enr_rngen (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_c2_ahb2enr_rngen_en ),
  .din  (nxt_rcc_c2_ahb2enr_rngen),
  .dout (cur_rcc_c2_ahb2enr_rngen)
);

// --------------------------------------------------------------------------------
// 5:5                 hashen              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2enr_hashen_en  = (|wr_req & rcc_c2_ahb2enr_sel);
assign nxt_rcc_c2_ahb2enr_hashen = wdata[5:5]                    ;
assign rcc_c2_hash_en            = cur_rcc_c2_ahb2enr_hashen     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb2enr_hashen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_ahb2enr_hashen_en ),
  .din  (nxt_rcc_c2_ahb2enr_hashen),
  .dout (cur_rcc_c2_ahb2enr_hashen)
);

// --------------------------------------------------------------------------------
// 4:4                 crypten             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2enr_crypten_en  = (|wr_req & rcc_c2_ahb2enr_sel);
assign nxt_rcc_c2_ahb2enr_crypten = wdata[4:4]                    ;
assign rcc_c2_crypt_en            = cur_rcc_c2_ahb2enr_crypten    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb2enr_crypten (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb2enr_crypten_en ),
  .din  (nxt_rcc_c2_ahb2enr_crypten),
  .dout (cur_rcc_c2_ahb2enr_crypten)
);

// --------------------------------------------------------------------------------
// 0:0                 dcmien              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2enr_dcmien_en  = (|wr_req & rcc_c2_ahb2enr_sel);
assign nxt_rcc_c2_ahb2enr_dcmien = wdata[0:0]                    ;
assign rcc_c2_dcmi_en            = cur_rcc_c2_ahb2enr_dcmien     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb2enr_dcmien (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_ahb2enr_dcmien_en ),
  .din  (nxt_rcc_c2_ahb2enr_dcmien),
  .dout (cur_rcc_c2_ahb2enr_dcmien)
);


// --------------------------------------------------------------------------------
// rcc_c2_ahb4enr                          0x1a0                                   
// --------------------------------------------------------------------------------
// 28:28               bkpramen            RW                  0b0                 
// --------------------------------------------------------------------------------
// 25:25               hsemen              RW                  0b0                 
// --------------------------------------------------------------------------------
// 24:24               adc3en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 21:21               bdmaen              RW                  0b0                 
// --------------------------------------------------------------------------------
// 19:19               crcen               RW                  0b0                 
// --------------------------------------------------------------------------------
// 10:10               gpioken             RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 gpiojen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 gpioien             RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 gpiohen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:6                 gpiogen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 gpiofen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 gpioeen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 gpioden             RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 gpiocen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 gpioben             RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 gpioaen             RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_ahb4enr read data
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_read = {{3{1'b0}}
                           , cur_rcc_c2_ahb4enr_bkpramen
                           , {2{1'b0}}
                           , cur_rcc_c2_ahb4enr_hsemen
                           , cur_rcc_c2_ahb4enr_adc3en
                           , {2{1'b0}}
                           , cur_rcc_c2_ahb4enr_bdmaen
                           , {1{1'b0}}
                           , cur_rcc_c2_ahb4enr_crcen
                           , {8{1'b0}}
                           , cur_rcc_c2_ahb4enr_gpioken
                           , cur_rcc_c2_ahb4enr_gpiojen
                           , cur_rcc_c2_ahb4enr_gpioien
                           , cur_rcc_c2_ahb4enr_gpiohen
                           , cur_rcc_c2_ahb4enr_gpiogen
                           , cur_rcc_c2_ahb4enr_gpiofen
                           , cur_rcc_c2_ahb4enr_gpioeen
                           , cur_rcc_c2_ahb4enr_gpioden
                           , cur_rcc_c2_ahb4enr_gpiocen
                           , cur_rcc_c2_ahb4enr_gpioben
                           , cur_rcc_c2_ahb4enr_gpioaen};

// --------------------------------------------------------------------------------
// 28:28               bkpramen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_bkpramen_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_bkpramen = wdata[28:28]                  ;
assign rcc_c2_bkpram_en            = cur_rcc_c2_ahb4enr_bkpramen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_bkpramen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_ahb4enr_bkpramen_en ),
  .din  (nxt_rcc_c2_ahb4enr_bkpramen),
  .dout (cur_rcc_c2_ahb4enr_bkpramen)
);

// --------------------------------------------------------------------------------
// 25:25               hsemen              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_hsemen_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_hsemen = wdata[25:25]                  ;
assign rcc_c2_hsem_en            = cur_rcc_c2_ahb4enr_hsemen     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_hsemen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_ahb4enr_hsemen_en ),
  .din  (nxt_rcc_c2_ahb4enr_hsemen),
  .dout (cur_rcc_c2_ahb4enr_hsemen)
);

// --------------------------------------------------------------------------------
// 24:24               adc3en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_adc3en_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_adc3en = wdata[24:24]                  ;
assign rcc_c2_adc3_en            = cur_rcc_c2_ahb4enr_adc3en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_adc3en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_ahb4enr_adc3en_en ),
  .din  (nxt_rcc_c2_ahb4enr_adc3en),
  .dout (cur_rcc_c2_ahb4enr_adc3en)
);

// --------------------------------------------------------------------------------
// 21:21               bdmaen              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_bdmaen_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_bdmaen = wdata[21:21]                  ;
assign rcc_c2_bdma_en            = cur_rcc_c2_ahb4enr_bdmaen     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_bdmaen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_ahb4enr_bdmaen_en ),
  .din  (nxt_rcc_c2_ahb4enr_bdmaen),
  .dout (cur_rcc_c2_ahb4enr_bdmaen)
);

// --------------------------------------------------------------------------------
// 19:19               crcen               RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_crcen_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_crcen = wdata[19:19]                  ;
assign rcc_c2_crc_en            = cur_rcc_c2_ahb4enr_crcen      ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_crcen (
  .clk  (clk                     ),
  .rst_n(rst_n                   ),
  .en   (rcc_c2_ahb4enr_crcen_en ),
  .din  (nxt_rcc_c2_ahb4enr_crcen),
  .dout (cur_rcc_c2_ahb4enr_crcen)
);

// --------------------------------------------------------------------------------
// 10:10               gpioken             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_gpioken_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_gpioken = wdata[10:10]                  ;
assign rcc_c2_gpiok_en            = cur_rcc_c2_ahb4enr_gpioken    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_gpioken (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb4enr_gpioken_en ),
  .din  (nxt_rcc_c2_ahb4enr_gpioken),
  .dout (cur_rcc_c2_ahb4enr_gpioken)
);

// --------------------------------------------------------------------------------
// 9:9                 gpiojen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_gpiojen_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_gpiojen = wdata[9:9]                    ;
assign rcc_c2_gpioj_en            = cur_rcc_c2_ahb4enr_gpiojen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_gpiojen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb4enr_gpiojen_en ),
  .din  (nxt_rcc_c2_ahb4enr_gpiojen),
  .dout (cur_rcc_c2_ahb4enr_gpiojen)
);

// --------------------------------------------------------------------------------
// 8:8                 gpioien             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_gpioien_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_gpioien = wdata[8:8]                    ;
assign rcc_c2_gpioi_en            = cur_rcc_c2_ahb4enr_gpioien    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_gpioien (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb4enr_gpioien_en ),
  .din  (nxt_rcc_c2_ahb4enr_gpioien),
  .dout (cur_rcc_c2_ahb4enr_gpioien)
);

// --------------------------------------------------------------------------------
// 7:7                 gpiohen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_gpiohen_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_gpiohen = wdata[7:7]                    ;
assign rcc_c2_gpioh_en            = cur_rcc_c2_ahb4enr_gpiohen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_gpiohen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb4enr_gpiohen_en ),
  .din  (nxt_rcc_c2_ahb4enr_gpiohen),
  .dout (cur_rcc_c2_ahb4enr_gpiohen)
);

// --------------------------------------------------------------------------------
// 6:6                 gpiogen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_gpiogen_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_gpiogen = wdata[6:6]                    ;
assign rcc_c2_gpiog_en            = cur_rcc_c2_ahb4enr_gpiogen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_gpiogen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb4enr_gpiogen_en ),
  .din  (nxt_rcc_c2_ahb4enr_gpiogen),
  .dout (cur_rcc_c2_ahb4enr_gpiogen)
);

// --------------------------------------------------------------------------------
// 5:5                 gpiofen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_gpiofen_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_gpiofen = wdata[5:5]                    ;
assign rcc_c2_gpiof_en            = cur_rcc_c2_ahb4enr_gpiofen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_gpiofen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb4enr_gpiofen_en ),
  .din  (nxt_rcc_c2_ahb4enr_gpiofen),
  .dout (cur_rcc_c2_ahb4enr_gpiofen)
);

// --------------------------------------------------------------------------------
// 4:4                 gpioeen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_gpioeen_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_gpioeen = wdata[4:4]                    ;
assign rcc_c2_gpioe_en            = cur_rcc_c2_ahb4enr_gpioeen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_gpioeen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb4enr_gpioeen_en ),
  .din  (nxt_rcc_c2_ahb4enr_gpioeen),
  .dout (cur_rcc_c2_ahb4enr_gpioeen)
);

// --------------------------------------------------------------------------------
// 3:3                 gpioden             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_gpioden_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_gpioden = wdata[3:3]                    ;
assign rcc_c2_gpiod_en            = cur_rcc_c2_ahb4enr_gpioden    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_gpioden (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb4enr_gpioden_en ),
  .din  (nxt_rcc_c2_ahb4enr_gpioden),
  .dout (cur_rcc_c2_ahb4enr_gpioden)
);

// --------------------------------------------------------------------------------
// 2:2                 gpiocen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_gpiocen_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_gpiocen = wdata[2:2]                    ;
assign rcc_c2_gpioc_en            = cur_rcc_c2_ahb4enr_gpiocen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_gpiocen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb4enr_gpiocen_en ),
  .din  (nxt_rcc_c2_ahb4enr_gpiocen),
  .dout (cur_rcc_c2_ahb4enr_gpiocen)
);

// --------------------------------------------------------------------------------
// 1:1                 gpioben             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_gpioben_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_gpioben = wdata[1:1]                    ;
assign rcc_c2_gpiob_en            = cur_rcc_c2_ahb4enr_gpioben    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_gpioben (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb4enr_gpioben_en ),
  .din  (nxt_rcc_c2_ahb4enr_gpioben),
  .dout (cur_rcc_c2_ahb4enr_gpioben)
);

// --------------------------------------------------------------------------------
// 0:0                 gpioaen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4enr_gpioaen_en  = (|wr_req & rcc_c2_ahb4enr_sel);
assign nxt_rcc_c2_ahb4enr_gpioaen = wdata[0:0]                    ;
assign rcc_c2_gpioa_en            = cur_rcc_c2_ahb4enr_gpioaen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4enr_gpioaen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_ahb4enr_gpioaen_en ),
  .din  (nxt_rcc_c2_ahb4enr_gpioaen),
  .dout (cur_rcc_c2_ahb4enr_gpioaen)
);


// --------------------------------------------------------------------------------
// rcc_c2_apb3enr                          0x1a4                                   
// --------------------------------------------------------------------------------
// 6:6                 wwdg1en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 ltdcen              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_apb3enr read data
// --------------------------------------------------------------------------------
assign rcc_c2_apb3enr_read = {{25{1'b0}}
                           , cur_rcc_c2_apb3enr_wwdg1en
                           , {2{1'b0}}
                           , cur_rcc_c2_apb3enr_ltdcen
                           , {3{1'b0}}};

// --------------------------------------------------------------------------------
// 6:6                 wwdg1en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb3enr_wwdg1en_en  = (|wr_req & rcc_c2_apb3enr_sel);
assign nxt_rcc_c2_apb3enr_wwdg1en = wdata[6:6]                    ;
assign rcc_c2_wwdg1_en            = cur_rcc_c2_apb3enr_wwdg1en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb3enr_wwdg1en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb3enr_wwdg1en_en ),
  .din  (nxt_rcc_c2_apb3enr_wwdg1en),
  .dout (cur_rcc_c2_apb3enr_wwdg1en)
);

// --------------------------------------------------------------------------------
// 3:3                 ltdcen              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb3enr_ltdcen_en  = (|wr_req & rcc_c2_apb3enr_sel);
assign nxt_rcc_c2_apb3enr_ltdcen = wdata[3:3]                    ;
assign rcc_c2_ltdc_en            = cur_rcc_c2_apb3enr_ltdcen     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb3enr_ltdcen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb3enr_ltdcen_en ),
  .din  (nxt_rcc_c2_apb3enr_ltdcen),
  .dout (cur_rcc_c2_apb3enr_ltdcen)
);


// --------------------------------------------------------------------------------
// rcc_c2_apb1lenr                         0x1a8                                   
// --------------------------------------------------------------------------------
// 31:31               uart8en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 30:30               uart7en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 29:29               dac12en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 27:27               hdmicecen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 23:23               i2c3en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 22:22               i2c2en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 21:21               i2c1en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 20:20               uart5en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 19:19               uart4en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 18:18               usart3en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 17:17               usart2en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               spdifrxen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 15:15               spi3en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 14:14               spi2en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 11:11               wwdg2en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 lptim1en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 tim14en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 tim13en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:6                 tim12en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 tim7en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 tim6en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 tim5en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 tim4en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 tim3en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 tim2en              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_apb1lenr read data
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_read = {cur_rcc_c2_apb1lenr_uart8en
                            , cur_rcc_c2_apb1lenr_uart7en
                            , cur_rcc_c2_apb1lenr_dac12en
                            , {1{1'b0}}
                            , cur_rcc_c2_apb1lenr_hdmicecen
                            , {3{1'b0}}
                            , cur_rcc_c2_apb1lenr_i2c3en
                            , cur_rcc_c2_apb1lenr_i2c2en
                            , cur_rcc_c2_apb1lenr_i2c1en
                            , cur_rcc_c2_apb1lenr_uart5en
                            , cur_rcc_c2_apb1lenr_uart4en
                            , cur_rcc_c2_apb1lenr_usart3en
                            , cur_rcc_c2_apb1lenr_usart2en
                            , cur_rcc_c2_apb1lenr_spdifrxen
                            , cur_rcc_c2_apb1lenr_spi3en
                            , cur_rcc_c2_apb1lenr_spi2en
                            , {2{1'b0}}
                            , cur_rcc_c2_apb1lenr_wwdg2en
                            , {1{1'b0}}
                            , cur_rcc_c2_apb1lenr_lptim1en
                            , cur_rcc_c2_apb1lenr_tim14en
                            , cur_rcc_c2_apb1lenr_tim13en
                            , cur_rcc_c2_apb1lenr_tim12en
                            , cur_rcc_c2_apb1lenr_tim7en
                            , cur_rcc_c2_apb1lenr_tim6en
                            , cur_rcc_c2_apb1lenr_tim5en
                            , cur_rcc_c2_apb1lenr_tim4en
                            , cur_rcc_c2_apb1lenr_tim3en
                            , cur_rcc_c2_apb1lenr_tim2en};

// --------------------------------------------------------------------------------
// 31:31               uart8en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_uart8en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_uart8en = wdata[31:31]                   ;
assign rcc_c2_uart8_en             = cur_rcc_c2_apb1lenr_uart8en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_uart8en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb1lenr_uart8en_en ),
  .din  (nxt_rcc_c2_apb1lenr_uart8en),
  .dout (cur_rcc_c2_apb1lenr_uart8en)
);

// --------------------------------------------------------------------------------
// 30:30               uart7en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_uart7en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_uart7en = wdata[30:30]                   ;
assign rcc_c2_uart7_en             = cur_rcc_c2_apb1lenr_uart7en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_uart7en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb1lenr_uart7en_en ),
  .din  (nxt_rcc_c2_apb1lenr_uart7en),
  .dout (cur_rcc_c2_apb1lenr_uart7en)
);

// --------------------------------------------------------------------------------
// 29:29               dac12en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_dac12en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_dac12en = wdata[29:29]                   ;
assign rcc_c2_dac12_en             = cur_rcc_c2_apb1lenr_dac12en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_dac12en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb1lenr_dac12en_en ),
  .din  (nxt_rcc_c2_apb1lenr_dac12en),
  .dout (cur_rcc_c2_apb1lenr_dac12en)
);

// --------------------------------------------------------------------------------
// 27:27               hdmicecen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_hdmicecen_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_hdmicecen = wdata[27:27]                   ;
assign rcc_c2_hdmicec_en             = cur_rcc_c2_apb1lenr_hdmicecen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_hdmicecen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb1lenr_hdmicecen_en ),
  .din  (nxt_rcc_c2_apb1lenr_hdmicecen),
  .dout (cur_rcc_c2_apb1lenr_hdmicecen)
);

// --------------------------------------------------------------------------------
// 23:23               i2c3en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_i2c3en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_i2c3en = wdata[23:23]                   ;
assign rcc_c2_i2c3_en             = cur_rcc_c2_apb1lenr_i2c3en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_i2c3en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb1lenr_i2c3en_en ),
  .din  (nxt_rcc_c2_apb1lenr_i2c3en),
  .dout (cur_rcc_c2_apb1lenr_i2c3en)
);

// --------------------------------------------------------------------------------
// 22:22               i2c2en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_i2c2en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_i2c2en = wdata[22:22]                   ;
assign rcc_c2_i2c2_en             = cur_rcc_c2_apb1lenr_i2c2en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_i2c2en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb1lenr_i2c2en_en ),
  .din  (nxt_rcc_c2_apb1lenr_i2c2en),
  .dout (cur_rcc_c2_apb1lenr_i2c2en)
);

// --------------------------------------------------------------------------------
// 21:21               i2c1en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_i2c1en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_i2c1en = wdata[21:21]                   ;
assign rcc_c2_i2c1_en             = cur_rcc_c2_apb1lenr_i2c1en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_i2c1en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb1lenr_i2c1en_en ),
  .din  (nxt_rcc_c2_apb1lenr_i2c1en),
  .dout (cur_rcc_c2_apb1lenr_i2c1en)
);

// --------------------------------------------------------------------------------
// 20:20               uart5en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_uart5en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_uart5en = wdata[20:20]                   ;
assign rcc_c2_uart5_en             = cur_rcc_c2_apb1lenr_uart5en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_uart5en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb1lenr_uart5en_en ),
  .din  (nxt_rcc_c2_apb1lenr_uart5en),
  .dout (cur_rcc_c2_apb1lenr_uart5en)
);

// --------------------------------------------------------------------------------
// 19:19               uart4en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_uart4en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_uart4en = wdata[19:19]                   ;
assign rcc_c2_uart4_en             = cur_rcc_c2_apb1lenr_uart4en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_uart4en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb1lenr_uart4en_en ),
  .din  (nxt_rcc_c2_apb1lenr_uart4en),
  .dout (cur_rcc_c2_apb1lenr_uart4en)
);

// --------------------------------------------------------------------------------
// 18:18               usart3en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_usart3en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_usart3en = wdata[18:18]                   ;
assign rcc_c2_usart3_en             = cur_rcc_c2_apb1lenr_usart3en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_usart3en (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c2_apb1lenr_usart3en_en ),
  .din  (nxt_rcc_c2_apb1lenr_usart3en),
  .dout (cur_rcc_c2_apb1lenr_usart3en)
);

// --------------------------------------------------------------------------------
// 17:17               usart2en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_usart2en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_usart2en = wdata[17:17]                   ;
assign rcc_c2_usart2_en             = cur_rcc_c2_apb1lenr_usart2en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_usart2en (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c2_apb1lenr_usart2en_en ),
  .din  (nxt_rcc_c2_apb1lenr_usart2en),
  .dout (cur_rcc_c2_apb1lenr_usart2en)
);

// --------------------------------------------------------------------------------
// 16:16               spdifrxen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_spdifrxen_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_spdifrxen = wdata[16:16]                   ;
assign rcc_c2_spdifrx_en             = cur_rcc_c2_apb1lenr_spdifrxen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_spdifrxen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb1lenr_spdifrxen_en ),
  .din  (nxt_rcc_c2_apb1lenr_spdifrxen),
  .dout (cur_rcc_c2_apb1lenr_spdifrxen)
);

// --------------------------------------------------------------------------------
// 15:15               spi3en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_spi3en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_spi3en = wdata[15:15]                   ;
assign rcc_c2_spi3_en             = cur_rcc_c2_apb1lenr_spi3en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_spi3en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb1lenr_spi3en_en ),
  .din  (nxt_rcc_c2_apb1lenr_spi3en),
  .dout (cur_rcc_c2_apb1lenr_spi3en)
);

// --------------------------------------------------------------------------------
// 14:14               spi2en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_spi2en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_spi2en = wdata[14:14]                   ;
assign rcc_c2_spi2_en             = cur_rcc_c2_apb1lenr_spi2en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_spi2en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb1lenr_spi2en_en ),
  .din  (nxt_rcc_c2_apb1lenr_spi2en),
  .dout (cur_rcc_c2_apb1lenr_spi2en)
);

// --------------------------------------------------------------------------------
// 11:11               wwdg2en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_wwdg2en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_wwdg2en = wdata[11:11]                   ;
assign rcc_c2_wwdg2_en             = cur_rcc_c2_apb1lenr_wwdg2en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_wwdg2en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb1lenr_wwdg2en_en ),
  .din  (nxt_rcc_c2_apb1lenr_wwdg2en),
  .dout (cur_rcc_c2_apb1lenr_wwdg2en)
);

// --------------------------------------------------------------------------------
// 9:9                 lptim1en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_lptim1en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_lptim1en = wdata[9:9]                     ;
assign rcc_c2_lptim1_en             = cur_rcc_c2_apb1lenr_lptim1en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_lptim1en (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c2_apb1lenr_lptim1en_en ),
  .din  (nxt_rcc_c2_apb1lenr_lptim1en),
  .dout (cur_rcc_c2_apb1lenr_lptim1en)
);

// --------------------------------------------------------------------------------
// 8:8                 tim14en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_tim14en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_tim14en = wdata[8:8]                     ;
assign rcc_c2_tim14_en             = cur_rcc_c2_apb1lenr_tim14en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_tim14en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb1lenr_tim14en_en ),
  .din  (nxt_rcc_c2_apb1lenr_tim14en),
  .dout (cur_rcc_c2_apb1lenr_tim14en)
);

// --------------------------------------------------------------------------------
// 7:7                 tim13en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_tim13en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_tim13en = wdata[7:7]                     ;
assign rcc_c2_tim13_en             = cur_rcc_c2_apb1lenr_tim13en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_tim13en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb1lenr_tim13en_en ),
  .din  (nxt_rcc_c2_apb1lenr_tim13en),
  .dout (cur_rcc_c2_apb1lenr_tim13en)
);

// --------------------------------------------------------------------------------
// 6:6                 tim12en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_tim12en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_tim12en = wdata[6:6]                     ;
assign rcc_c2_tim12_en             = cur_rcc_c2_apb1lenr_tim12en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_tim12en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb1lenr_tim12en_en ),
  .din  (nxt_rcc_c2_apb1lenr_tim12en),
  .dout (cur_rcc_c2_apb1lenr_tim12en)
);

// --------------------------------------------------------------------------------
// 5:5                 tim7en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_tim7en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_tim7en = wdata[5:5]                     ;
assign rcc_c2_tim7_en             = cur_rcc_c2_apb1lenr_tim7en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_tim7en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb1lenr_tim7en_en ),
  .din  (nxt_rcc_c2_apb1lenr_tim7en),
  .dout (cur_rcc_c2_apb1lenr_tim7en)
);

// --------------------------------------------------------------------------------
// 4:4                 tim6en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_tim6en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_tim6en = wdata[4:4]                     ;
assign rcc_c2_tim6_en             = cur_rcc_c2_apb1lenr_tim6en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_tim6en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb1lenr_tim6en_en ),
  .din  (nxt_rcc_c2_apb1lenr_tim6en),
  .dout (cur_rcc_c2_apb1lenr_tim6en)
);

// --------------------------------------------------------------------------------
// 3:3                 tim5en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_tim5en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_tim5en = wdata[3:3]                     ;
assign rcc_c2_tim5_en             = cur_rcc_c2_apb1lenr_tim5en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_tim5en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb1lenr_tim5en_en ),
  .din  (nxt_rcc_c2_apb1lenr_tim5en),
  .dout (cur_rcc_c2_apb1lenr_tim5en)
);

// --------------------------------------------------------------------------------
// 2:2                 tim4en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_tim4en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_tim4en = wdata[2:2]                     ;
assign rcc_c2_tim4_en             = cur_rcc_c2_apb1lenr_tim4en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_tim4en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb1lenr_tim4en_en ),
  .din  (nxt_rcc_c2_apb1lenr_tim4en),
  .dout (cur_rcc_c2_apb1lenr_tim4en)
);

// --------------------------------------------------------------------------------
// 1:1                 tim3en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_tim3en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_tim3en = wdata[1:1]                     ;
assign rcc_c2_tim3_en             = cur_rcc_c2_apb1lenr_tim3en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_tim3en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb1lenr_tim3en_en ),
  .din  (nxt_rcc_c2_apb1lenr_tim3en),
  .dout (cur_rcc_c2_apb1lenr_tim3en)
);

// --------------------------------------------------------------------------------
// 0:0                 tim2en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1lenr_tim2en_en  = (|wr_req & rcc_c2_apb1lenr_sel);
assign nxt_rcc_c2_apb1lenr_tim2en = wdata[0:0]                     ;
assign rcc_c2_tim2_en             = cur_rcc_c2_apb1lenr_tim2en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1lenr_tim2en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb1lenr_tim2en_en ),
  .din  (nxt_rcc_c2_apb1lenr_tim2en),
  .dout (cur_rcc_c2_apb1lenr_tim2en)
);


// --------------------------------------------------------------------------------
// rcc_c2_apb1henr                         0x1ac                                   
// --------------------------------------------------------------------------------
// 8:8                 fdcanen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 mdiosen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 opampen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 swpen               RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 crsen               RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_apb1henr read data
// --------------------------------------------------------------------------------
assign rcc_c2_apb1henr_read = {{23{1'b0}}
                            , cur_rcc_c2_apb1henr_fdcanen
                            , {2{1'b0}}
                            , cur_rcc_c2_apb1henr_mdiosen
                            , cur_rcc_c2_apb1henr_opampen
                            , {1{1'b0}}
                            , cur_rcc_c2_apb1henr_swpen
                            , cur_rcc_c2_apb1henr_crsen
                            , {1{1'b0}}};

// --------------------------------------------------------------------------------
// 8:8                 fdcanen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1henr_fdcanen_en  = (|wr_req & rcc_c2_apb1henr_sel);
assign nxt_rcc_c2_apb1henr_fdcanen = wdata[8:8]                     ;
assign rcc_c2_fdcan_en             = cur_rcc_c2_apb1henr_fdcanen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1henr_fdcanen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb1henr_fdcanen_en ),
  .din  (nxt_rcc_c2_apb1henr_fdcanen),
  .dout (cur_rcc_c2_apb1henr_fdcanen)
);

// --------------------------------------------------------------------------------
// 5:5                 mdiosen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1henr_mdiosen_en  = (|wr_req & rcc_c2_apb1henr_sel);
assign nxt_rcc_c2_apb1henr_mdiosen = wdata[5:5]                     ;
assign rcc_c2_mdios_en             = cur_rcc_c2_apb1henr_mdiosen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1henr_mdiosen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb1henr_mdiosen_en ),
  .din  (nxt_rcc_c2_apb1henr_mdiosen),
  .dout (cur_rcc_c2_apb1henr_mdiosen)
);

// --------------------------------------------------------------------------------
// 4:4                 opampen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1henr_opampen_en  = (|wr_req & rcc_c2_apb1henr_sel);
assign nxt_rcc_c2_apb1henr_opampen = wdata[4:4]                     ;
assign rcc_c2_opamp_en             = cur_rcc_c2_apb1henr_opampen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1henr_opampen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb1henr_opampen_en ),
  .din  (nxt_rcc_c2_apb1henr_opampen),
  .dout (cur_rcc_c2_apb1henr_opampen)
);

// --------------------------------------------------------------------------------
// 2:2                 swpen               RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1henr_swpen_en  = (|wr_req & rcc_c2_apb1henr_sel);
assign nxt_rcc_c2_apb1henr_swpen = wdata[2:2]                     ;
assign rcc_c2_swp_en             = cur_rcc_c2_apb1henr_swpen      ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1henr_swpen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb1henr_swpen_en ),
  .din  (nxt_rcc_c2_apb1henr_swpen),
  .dout (cur_rcc_c2_apb1henr_swpen)
);

// --------------------------------------------------------------------------------
// 1:1                 crsen               RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1henr_crsen_en  = (|wr_req & rcc_c2_apb1henr_sel);
assign nxt_rcc_c2_apb1henr_crsen = wdata[1:1]                     ;
assign rcc_c2_crs_en             = cur_rcc_c2_apb1henr_crsen      ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb1henr_crsen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb1henr_crsen_en ),
  .din  (nxt_rcc_c2_apb1henr_crsen),
  .dout (cur_rcc_c2_apb1henr_crsen)
);


// --------------------------------------------------------------------------------
// rcc_c2_apb2enr                          0x1b0                                   
// --------------------------------------------------------------------------------
// 29:29               hrtimen             RW                  0b0                 
// --------------------------------------------------------------------------------
// 28:28               dfsdm1en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 24:24               sai3en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 23:23               sai2en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 22:22               sai1en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 20:20               spi5en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 18:18               tim17en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 17:17               tim16en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               tim15en             RW                  0b0                 
// --------------------------------------------------------------------------------
// 13:13               spi4en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 12:12               spi1en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 usart6en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 usart1en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 tim8en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 tim1en              RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_apb2enr read data
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_read = {{2{1'b0}}
                           , cur_rcc_c2_apb2enr_hrtimen
                           , cur_rcc_c2_apb2enr_dfsdm1en
                           , {3{1'b0}}
                           , cur_rcc_c2_apb2enr_sai3en
                           , cur_rcc_c2_apb2enr_sai2en
                           , cur_rcc_c2_apb2enr_sai1en
                           , {1{1'b0}}
                           , cur_rcc_c2_apb2enr_spi5en
                           , {1{1'b0}}
                           , cur_rcc_c2_apb2enr_tim17en
                           , cur_rcc_c2_apb2enr_tim16en
                           , cur_rcc_c2_apb2enr_tim15en
                           , {2{1'b0}}
                           , cur_rcc_c2_apb2enr_spi4en
                           , cur_rcc_c2_apb2enr_spi1en
                           , {6{1'b0}}
                           , cur_rcc_c2_apb2enr_usart6en
                           , cur_rcc_c2_apb2enr_usart1en
                           , {2{1'b0}}
                           , cur_rcc_c2_apb2enr_tim8en
                           , cur_rcc_c2_apb2enr_tim1en};

// --------------------------------------------------------------------------------
// 29:29               hrtimen             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_hrtimen_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_hrtimen = wdata[29:29]                  ;
assign rcc_c2_hrtim_en            = cur_rcc_c2_apb2enr_hrtimen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_hrtimen (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb2enr_hrtimen_en ),
  .din  (nxt_rcc_c2_apb2enr_hrtimen),
  .dout (cur_rcc_c2_apb2enr_hrtimen)
);

// --------------------------------------------------------------------------------
// 28:28               dfsdm1en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_dfsdm1en_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_dfsdm1en = wdata[28:28]                  ;
assign rcc_c2_dfsdm1_en            = cur_rcc_c2_apb2enr_dfsdm1en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_dfsdm1en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb2enr_dfsdm1en_en ),
  .din  (nxt_rcc_c2_apb2enr_dfsdm1en),
  .dout (cur_rcc_c2_apb2enr_dfsdm1en)
);

// --------------------------------------------------------------------------------
// 24:24               sai3en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_sai3en_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_sai3en = wdata[24:24]                  ;
assign rcc_c2_sai3_en            = cur_rcc_c2_apb2enr_sai3en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_sai3en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb2enr_sai3en_en ),
  .din  (nxt_rcc_c2_apb2enr_sai3en),
  .dout (cur_rcc_c2_apb2enr_sai3en)
);

// --------------------------------------------------------------------------------
// 23:23               sai2en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_sai2en_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_sai2en = wdata[23:23]                  ;
assign rcc_c2_sai2_en            = cur_rcc_c2_apb2enr_sai2en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_sai2en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb2enr_sai2en_en ),
  .din  (nxt_rcc_c2_apb2enr_sai2en),
  .dout (cur_rcc_c2_apb2enr_sai2en)
);

// --------------------------------------------------------------------------------
// 22:22               sai1en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_sai1en_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_sai1en = wdata[22:22]                  ;
assign rcc_c2_sai1_en            = cur_rcc_c2_apb2enr_sai1en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_sai1en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb2enr_sai1en_en ),
  .din  (nxt_rcc_c2_apb2enr_sai1en),
  .dout (cur_rcc_c2_apb2enr_sai1en)
);

// --------------------------------------------------------------------------------
// 20:20               spi5en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_spi5en_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_spi5en = wdata[20:20]                  ;
assign rcc_c2_spi5_en            = cur_rcc_c2_apb2enr_spi5en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_spi5en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb2enr_spi5en_en ),
  .din  (nxt_rcc_c2_apb2enr_spi5en),
  .dout (cur_rcc_c2_apb2enr_spi5en)
);

// --------------------------------------------------------------------------------
// 18:18               tim17en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_tim17en_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_tim17en = wdata[18:18]                  ;
assign rcc_c2_tim17_en            = cur_rcc_c2_apb2enr_tim17en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_tim17en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb2enr_tim17en_en ),
  .din  (nxt_rcc_c2_apb2enr_tim17en),
  .dout (cur_rcc_c2_apb2enr_tim17en)
);

// --------------------------------------------------------------------------------
// 17:17               tim16en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_tim16en_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_tim16en = wdata[17:17]                  ;
assign rcc_c2_tim16_en            = cur_rcc_c2_apb2enr_tim16en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_tim16en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb2enr_tim16en_en ),
  .din  (nxt_rcc_c2_apb2enr_tim16en),
  .dout (cur_rcc_c2_apb2enr_tim16en)
);

// --------------------------------------------------------------------------------
// 16:16               tim15en             RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_tim15en_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_tim15en = wdata[16:16]                  ;
assign rcc_c2_tim15_en            = cur_rcc_c2_apb2enr_tim15en    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_tim15en (
  .clk  (clk                       ),
  .rst_n(rst_n                     ),
  .en   (rcc_c2_apb2enr_tim15en_en ),
  .din  (nxt_rcc_c2_apb2enr_tim15en),
  .dout (cur_rcc_c2_apb2enr_tim15en)
);

// --------------------------------------------------------------------------------
// 13:13               spi4en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_spi4en_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_spi4en = wdata[13:13]                  ;
assign rcc_c2_spi4_en            = cur_rcc_c2_apb2enr_spi4en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_spi4en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb2enr_spi4en_en ),
  .din  (nxt_rcc_c2_apb2enr_spi4en),
  .dout (cur_rcc_c2_apb2enr_spi4en)
);

// --------------------------------------------------------------------------------
// 12:12               spi1en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_spi1en_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_spi1en = wdata[12:12]                  ;
assign rcc_c2_spi1_en            = cur_rcc_c2_apb2enr_spi1en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_spi1en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb2enr_spi1en_en ),
  .din  (nxt_rcc_c2_apb2enr_spi1en),
  .dout (cur_rcc_c2_apb2enr_spi1en)
);

// --------------------------------------------------------------------------------
// 5:5                 usart6en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_usart6en_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_usart6en = wdata[5:5]                    ;
assign rcc_c2_usart6_en            = cur_rcc_c2_apb2enr_usart6en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_usart6en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb2enr_usart6en_en ),
  .din  (nxt_rcc_c2_apb2enr_usart6en),
  .dout (cur_rcc_c2_apb2enr_usart6en)
);

// --------------------------------------------------------------------------------
// 4:4                 usart1en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_usart1en_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_usart1en = wdata[4:4]                    ;
assign rcc_c2_usart1_en            = cur_rcc_c2_apb2enr_usart1en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_usart1en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb2enr_usart1en_en ),
  .din  (nxt_rcc_c2_apb2enr_usart1en),
  .dout (cur_rcc_c2_apb2enr_usart1en)
);

// --------------------------------------------------------------------------------
// 1:1                 tim8en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_tim8en_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_tim8en = wdata[1:1]                    ;
assign rcc_c2_tim8_en            = cur_rcc_c2_apb2enr_tim8en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_tim8en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb2enr_tim8en_en ),
  .din  (nxt_rcc_c2_apb2enr_tim8en),
  .dout (cur_rcc_c2_apb2enr_tim8en)
);

// --------------------------------------------------------------------------------
// 0:0                 tim1en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2enr_tim1en_en  = (|wr_req & rcc_c2_apb2enr_sel);
assign nxt_rcc_c2_apb2enr_tim1en = wdata[0:0]                    ;
assign rcc_c2_tim1_en            = cur_rcc_c2_apb2enr_tim1en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb2enr_tim1en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb2enr_tim1en_en ),
  .din  (nxt_rcc_c2_apb2enr_tim1en),
  .dout (cur_rcc_c2_apb2enr_tim1en)
);


// --------------------------------------------------------------------------------
// rcc_c2_apb4enr                          0x1b4                                   
// --------------------------------------------------------------------------------
// 21:21               sai4en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 16:16               rtcapben            RW                  0b1                 
// --------------------------------------------------------------------------------
// 15:15               vrefen              RW                  0b0                 
// --------------------------------------------------------------------------------
// 14:14               comp12en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 12:12               lptim5en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 11:11               lptim4en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 10:10               lptim3en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 lptim2en            RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 i2c4en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 spi6en              RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 lpuart1en           RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 syscfgen            RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_apb4enr read data
// --------------------------------------------------------------------------------
assign rcc_c2_apb4enr_read = {{10{1'b0}}
                           , cur_rcc_c2_apb4enr_sai4en
                           , {4{1'b0}}
                           , cur_rcc_c2_apb4enr_rtcapben
                           , cur_rcc_c2_apb4enr_vrefen
                           , cur_rcc_c2_apb4enr_comp12en
                           , {1{1'b0}}
                           , cur_rcc_c2_apb4enr_lptim5en
                           , cur_rcc_c2_apb4enr_lptim4en
                           , cur_rcc_c2_apb4enr_lptim3en
                           , cur_rcc_c2_apb4enr_lptim2en
                           , {1{1'b0}}
                           , cur_rcc_c2_apb4enr_i2c4en
                           , {1{1'b0}}
                           , cur_rcc_c2_apb4enr_spi6en
                           , {1{1'b0}}
                           , cur_rcc_c2_apb4enr_lpuart1en
                           , {1{1'b0}}
                           , cur_rcc_c2_apb4enr_syscfgen
                           , {1{1'b0}}};

// --------------------------------------------------------------------------------
// 21:21               sai4en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4enr_sai4en_en  = (|wr_req & rcc_c2_apb4enr_sel);
assign nxt_rcc_c2_apb4enr_sai4en = wdata[21:21]                  ;
assign rcc_c2_sai4_en            = cur_rcc_c2_apb4enr_sai4en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb4enr_sai4en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb4enr_sai4en_en ),
  .din  (nxt_rcc_c2_apb4enr_sai4en),
  .dout (cur_rcc_c2_apb4enr_sai4en)
);

// --------------------------------------------------------------------------------
// 16:16               rtcapben            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4enr_rtcapben_en  = (|wr_req & rcc_c2_apb4enr_sel);
assign nxt_rcc_c2_apb4enr_rtcapben = wdata[16:16]                  ;
assign rcc_c2_rtcapb_en            = cur_rcc_c2_apb4enr_rtcapben   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb4enr_rtcapben (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb4enr_rtcapben_en ),
  .din  (nxt_rcc_c2_apb4enr_rtcapben),
  .dout (cur_rcc_c2_apb4enr_rtcapben)
);

// --------------------------------------------------------------------------------
// 15:15               vrefen              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4enr_vrefen_en  = (|wr_req & rcc_c2_apb4enr_sel);
assign nxt_rcc_c2_apb4enr_vrefen = wdata[15:15]                  ;
assign rcc_c2_vref_en            = cur_rcc_c2_apb4enr_vrefen     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb4enr_vrefen (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb4enr_vrefen_en ),
  .din  (nxt_rcc_c2_apb4enr_vrefen),
  .dout (cur_rcc_c2_apb4enr_vrefen)
);

// --------------------------------------------------------------------------------
// 14:14               comp12en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4enr_comp12en_en  = (|wr_req & rcc_c2_apb4enr_sel);
assign nxt_rcc_c2_apb4enr_comp12en = wdata[14:14]                  ;
assign rcc_c2_comp12_en            = cur_rcc_c2_apb4enr_comp12en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb4enr_comp12en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb4enr_comp12en_en ),
  .din  (nxt_rcc_c2_apb4enr_comp12en),
  .dout (cur_rcc_c2_apb4enr_comp12en)
);

// --------------------------------------------------------------------------------
// 12:12               lptim5en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4enr_lptim5en_en  = (|wr_req & rcc_c2_apb4enr_sel);
assign nxt_rcc_c2_apb4enr_lptim5en = wdata[12:12]                  ;
assign rcc_c2_lptim5_en            = cur_rcc_c2_apb4enr_lptim5en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb4enr_lptim5en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb4enr_lptim5en_en ),
  .din  (nxt_rcc_c2_apb4enr_lptim5en),
  .dout (cur_rcc_c2_apb4enr_lptim5en)
);

// --------------------------------------------------------------------------------
// 11:11               lptim4en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4enr_lptim4en_en  = (|wr_req & rcc_c2_apb4enr_sel);
assign nxt_rcc_c2_apb4enr_lptim4en = wdata[11:11]                  ;
assign rcc_c2_lptim4_en            = cur_rcc_c2_apb4enr_lptim4en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb4enr_lptim4en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb4enr_lptim4en_en ),
  .din  (nxt_rcc_c2_apb4enr_lptim4en),
  .dout (cur_rcc_c2_apb4enr_lptim4en)
);

// --------------------------------------------------------------------------------
// 10:10               lptim3en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4enr_lptim3en_en  = (|wr_req & rcc_c2_apb4enr_sel);
assign nxt_rcc_c2_apb4enr_lptim3en = wdata[10:10]                  ;
assign rcc_c2_lptim3_en            = cur_rcc_c2_apb4enr_lptim3en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb4enr_lptim3en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb4enr_lptim3en_en ),
  .din  (nxt_rcc_c2_apb4enr_lptim3en),
  .dout (cur_rcc_c2_apb4enr_lptim3en)
);

// --------------------------------------------------------------------------------
// 9:9                 lptim2en            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4enr_lptim2en_en  = (|wr_req & rcc_c2_apb4enr_sel);
assign nxt_rcc_c2_apb4enr_lptim2en = wdata[9:9]                    ;
assign rcc_c2_lptim2_en            = cur_rcc_c2_apb4enr_lptim2en   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb4enr_lptim2en (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb4enr_lptim2en_en ),
  .din  (nxt_rcc_c2_apb4enr_lptim2en),
  .dout (cur_rcc_c2_apb4enr_lptim2en)
);

// --------------------------------------------------------------------------------
// 7:7                 i2c4en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4enr_i2c4en_en  = (|wr_req & rcc_c2_apb4enr_sel);
assign nxt_rcc_c2_apb4enr_i2c4en = wdata[7:7]                    ;
assign rcc_c2_i2c4_en            = cur_rcc_c2_apb4enr_i2c4en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb4enr_i2c4en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb4enr_i2c4en_en ),
  .din  (nxt_rcc_c2_apb4enr_i2c4en),
  .dout (cur_rcc_c2_apb4enr_i2c4en)
);

// --------------------------------------------------------------------------------
// 5:5                 spi6en              RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4enr_spi6en_en  = (|wr_req & rcc_c2_apb4enr_sel);
assign nxt_rcc_c2_apb4enr_spi6en = wdata[5:5]                    ;
assign rcc_c2_spi6_en            = cur_rcc_c2_apb4enr_spi6en     ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb4enr_spi6en (
  .clk  (clk                      ),
  .rst_n(rst_n                    ),
  .en   (rcc_c2_apb4enr_spi6en_en ),
  .din  (nxt_rcc_c2_apb4enr_spi6en),
  .dout (cur_rcc_c2_apb4enr_spi6en)
);

// --------------------------------------------------------------------------------
// 3:3                 lpuart1en           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4enr_lpuart1en_en  = (|wr_req & rcc_c2_apb4enr_sel);
assign nxt_rcc_c2_apb4enr_lpuart1en = wdata[3:3]                    ;
assign rcc_c2_lpuart1_en            = cur_rcc_c2_apb4enr_lpuart1en  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb4enr_lpuart1en (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c2_apb4enr_lpuart1en_en ),
  .din  (nxt_rcc_c2_apb4enr_lpuart1en),
  .dout (cur_rcc_c2_apb4enr_lpuart1en)
);

// --------------------------------------------------------------------------------
// 1:1                 syscfgen            RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4enr_syscfgen_en  = (|wr_req & rcc_c2_apb4enr_sel);
assign nxt_rcc_c2_apb4enr_syscfgen = wdata[1:1]                    ;
assign rcc_c2_syscfg_en            = cur_rcc_c2_apb4enr_syscfgen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_apb4enr_syscfgen (
  .clk  (clk                        ),
  .rst_n(rst_n                      ),
  .en   (rcc_c2_apb4enr_syscfgen_en ),
  .din  (nxt_rcc_c2_apb4enr_syscfgen),
  .dout (cur_rcc_c2_apb4enr_syscfgen)
);


// --------------------------------------------------------------------------------
// rcc_c2_ahb3lpenr                        0x1bc                                   
// --------------------------------------------------------------------------------
// 31:31               axisramlpen         RW                  0b1                 
// --------------------------------------------------------------------------------
// 30:30               itcmlpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 29:29               dtcm2lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 28:28               dtcm1lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 16:16               sdmmc1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 14:14               qspilpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 12:12               fmclpen             RW                  0b1                 
// --------------------------------------------------------------------------------
// 8:8                 flitflpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 5:5                 jpgdeclpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 4:4                 dma2dlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 0:0                 mdmalpen            RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_ahb3lpenr read data
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3lpenr_read = {cur_rcc_c2_ahb3lpenr_axisramlpen
                             , cur_rcc_c2_ahb3lpenr_itcmlpen
                             , cur_rcc_c2_ahb3lpenr_dtcm2lpen
                             , cur_rcc_c2_ahb3lpenr_dtcm1lpen
                             , {11{1'b0}}
                             , cur_rcc_c2_ahb3lpenr_sdmmc1lpen
                             , {1{1'b0}}
                             , cur_rcc_c2_ahb3lpenr_qspilpen
                             , {1{1'b0}}
                             , cur_rcc_c2_ahb3lpenr_fmclpen
                             , {3{1'b0}}
                             , cur_rcc_c2_ahb3lpenr_flitflpen
                             , {2{1'b0}}
                             , cur_rcc_c2_ahb3lpenr_jpgdeclpen
                             , cur_rcc_c2_ahb3lpenr_dma2dlpen
                             , {3{1'b0}}
                             , cur_rcc_c2_ahb3lpenr_mdmalpen};

// --------------------------------------------------------------------------------
// 31:31               axisramlpen         RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3lpenr_axisramlpen_en  = (|wr_req & rcc_c2_ahb3lpenr_sel);
assign nxt_rcc_c2_ahb3lpenr_axisramlpen = wdata[31:31]                    ;
assign rcc_c2_axisramlp_en              = cur_rcc_c2_ahb3lpenr_axisramlpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb3lpenr_axisramlpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c2_ahb3lpenr_axisramlpen_en ),
  .din  (nxt_rcc_c2_ahb3lpenr_axisramlpen),
  .dout (cur_rcc_c2_ahb3lpenr_axisramlpen)
);

// --------------------------------------------------------------------------------
// 30:30               itcmlpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3lpenr_itcmlpen_en  = (|wr_req & rcc_c2_ahb3lpenr_sel);
assign nxt_rcc_c2_ahb3lpenr_itcmlpen = wdata[30:30]                    ;
assign rcc_c2_itcmlp_en              = cur_rcc_c2_ahb3lpenr_itcmlpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb3lpenr_itcmlpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_ahb3lpenr_itcmlpen_en ),
  .din  (nxt_rcc_c2_ahb3lpenr_itcmlpen),
  .dout (cur_rcc_c2_ahb3lpenr_itcmlpen)
);

// --------------------------------------------------------------------------------
// 29:29               dtcm2lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3lpenr_dtcm2lpen_en  = (|wr_req & rcc_c2_ahb3lpenr_sel);
assign nxt_rcc_c2_ahb3lpenr_dtcm2lpen = wdata[29:29]                    ;
assign rcc_c2_dtcm2lp_en              = cur_rcc_c2_ahb3lpenr_dtcm2lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb3lpenr_dtcm2lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb3lpenr_dtcm2lpen_en ),
  .din  (nxt_rcc_c2_ahb3lpenr_dtcm2lpen),
  .dout (cur_rcc_c2_ahb3lpenr_dtcm2lpen)
);

// --------------------------------------------------------------------------------
// 28:28               dtcm1lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3lpenr_dtcm1lpen_en  = (|wr_req & rcc_c2_ahb3lpenr_sel);
assign nxt_rcc_c2_ahb3lpenr_dtcm1lpen = wdata[28:28]                    ;
assign rcc_c2_dtcm1lp_en              = cur_rcc_c2_ahb3lpenr_dtcm1lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb3lpenr_dtcm1lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb3lpenr_dtcm1lpen_en ),
  .din  (nxt_rcc_c2_ahb3lpenr_dtcm1lpen),
  .dout (cur_rcc_c2_ahb3lpenr_dtcm1lpen)
);

// --------------------------------------------------------------------------------
// 16:16               sdmmc1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3lpenr_sdmmc1lpen_en  = (|wr_req & rcc_c2_ahb3lpenr_sel);
assign nxt_rcc_c2_ahb3lpenr_sdmmc1lpen = wdata[16:16]                    ;
assign rcc_c2_sdmmc1lp_en              = cur_rcc_c2_ahb3lpenr_sdmmc1lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb3lpenr_sdmmc1lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_ahb3lpenr_sdmmc1lpen_en ),
  .din  (nxt_rcc_c2_ahb3lpenr_sdmmc1lpen),
  .dout (cur_rcc_c2_ahb3lpenr_sdmmc1lpen)
);

// --------------------------------------------------------------------------------
// 14:14               qspilpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3lpenr_qspilpen_en  = (|wr_req & rcc_c2_ahb3lpenr_sel);
assign nxt_rcc_c2_ahb3lpenr_qspilpen = wdata[14:14]                    ;
assign rcc_c2_qspilp_en              = cur_rcc_c2_ahb3lpenr_qspilpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb3lpenr_qspilpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_ahb3lpenr_qspilpen_en ),
  .din  (nxt_rcc_c2_ahb3lpenr_qspilpen),
  .dout (cur_rcc_c2_ahb3lpenr_qspilpen)
);

// --------------------------------------------------------------------------------
// 12:12               fmclpen             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3lpenr_fmclpen_en  = (|wr_req & rcc_c2_ahb3lpenr_sel);
assign nxt_rcc_c2_ahb3lpenr_fmclpen = wdata[12:12]                    ;
assign rcc_c2_fmclp_en              = cur_rcc_c2_ahb3lpenr_fmclpen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb3lpenr_fmclpen (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c2_ahb3lpenr_fmclpen_en ),
  .din  (nxt_rcc_c2_ahb3lpenr_fmclpen),
  .dout (cur_rcc_c2_ahb3lpenr_fmclpen)
);

// --------------------------------------------------------------------------------
// 8:8                 flitflpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3lpenr_flitflpen_en  = (|wr_req & rcc_c2_ahb3lpenr_sel);
assign nxt_rcc_c2_ahb3lpenr_flitflpen = wdata[8:8]                      ;
assign rcc_c2_flitflp_en              = cur_rcc_c2_ahb3lpenr_flitflpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb3lpenr_flitflpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb3lpenr_flitflpen_en ),
  .din  (nxt_rcc_c2_ahb3lpenr_flitflpen),
  .dout (cur_rcc_c2_ahb3lpenr_flitflpen)
);

// --------------------------------------------------------------------------------
// 5:5                 jpgdeclpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3lpenr_jpgdeclpen_en  = (|wr_req & rcc_c2_ahb3lpenr_sel);
assign nxt_rcc_c2_ahb3lpenr_jpgdeclpen = wdata[5:5]                      ;
assign rcc_c2_jpgdeclp_en              = cur_rcc_c2_ahb3lpenr_jpgdeclpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb3lpenr_jpgdeclpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_ahb3lpenr_jpgdeclpen_en ),
  .din  (nxt_rcc_c2_ahb3lpenr_jpgdeclpen),
  .dout (cur_rcc_c2_ahb3lpenr_jpgdeclpen)
);

// --------------------------------------------------------------------------------
// 4:4                 dma2dlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3lpenr_dma2dlpen_en  = (|wr_req & rcc_c2_ahb3lpenr_sel);
assign nxt_rcc_c2_ahb3lpenr_dma2dlpen = wdata[4:4]                      ;
assign rcc_c2_dma2dlp_en              = cur_rcc_c2_ahb3lpenr_dma2dlpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb3lpenr_dma2dlpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb3lpenr_dma2dlpen_en ),
  .din  (nxt_rcc_c2_ahb3lpenr_dma2dlpen),
  .dout (cur_rcc_c2_ahb3lpenr_dma2dlpen)
);

// --------------------------------------------------------------------------------
// 0:0                 mdmalpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb3lpenr_mdmalpen_en  = (|wr_req & rcc_c2_ahb3lpenr_sel);
assign nxt_rcc_c2_ahb3lpenr_mdmalpen = wdata[0:0]                      ;
assign rcc_c2_mdmalp_en              = cur_rcc_c2_ahb3lpenr_mdmalpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb3lpenr_mdmalpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_ahb3lpenr_mdmalpen_en ),
  .din  (nxt_rcc_c2_ahb3lpenr_mdmalpen),
  .dout (cur_rcc_c2_ahb3lpenr_mdmalpen)
);


// --------------------------------------------------------------------------------
// rcc_c2_ahb1lpenr                        0x1c0                                   
// --------------------------------------------------------------------------------
// 28:28               usb2ulpilpen        RW                  0b1                 
// --------------------------------------------------------------------------------
// 27:27               usb2otglpen         RW                  0b1                 
// --------------------------------------------------------------------------------
// 26:26               usb1ulpilpen        RW                  0b1                 
// --------------------------------------------------------------------------------
// 25:25               usb1otglpen         RW                  0b1                 
// --------------------------------------------------------------------------------
// 17:17               eth1rxlpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 16:16               eth1txlpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 15:15               eth1maclpen         RW                  0b1                 
// --------------------------------------------------------------------------------
// 5:5                 adc12lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 1:1                 dma2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 0:0                 dma1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_ahb1lpenr read data
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1lpenr_read = {{3{1'b0}}
                             , cur_rcc_c2_ahb1lpenr_usb2ulpilpen
                             , cur_rcc_c2_ahb1lpenr_usb2otglpen
                             , cur_rcc_c2_ahb1lpenr_usb1ulpilpen
                             , cur_rcc_c2_ahb1lpenr_usb1otglpen
                             , {7{1'b0}}
                             , cur_rcc_c2_ahb1lpenr_eth1rxlpen
                             , cur_rcc_c2_ahb1lpenr_eth1txlpen
                             , cur_rcc_c2_ahb1lpenr_eth1maclpen
                             , {9{1'b0}}
                             , cur_rcc_c2_ahb1lpenr_adc12lpen
                             , {3{1'b0}}
                             , cur_rcc_c2_ahb1lpenr_dma2lpen
                             , cur_rcc_c2_ahb1lpenr_dma1lpen};

// --------------------------------------------------------------------------------
// 28:28               usb2ulpilpen        RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1lpenr_usb2ulpilpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel) ;
assign nxt_rcc_c2_ahb1lpenr_usb2ulpilpen = wdata[28:28]                     ;
assign rcc_c2_usb2ulpilp_en              = cur_rcc_c2_ahb1lpenr_usb2ulpilpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb1lpenr_usb2ulpilpen (
  .clk  (clk                              ),
  .rst_n(rst_n                            ),
  .en   (rcc_c2_ahb1lpenr_usb2ulpilpen_en ),
  .din  (nxt_rcc_c2_ahb1lpenr_usb2ulpilpen),
  .dout (cur_rcc_c2_ahb1lpenr_usb2ulpilpen)
);

// --------------------------------------------------------------------------------
// 27:27               usb2otglpen         RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1lpenr_usb2otglpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
assign nxt_rcc_c2_ahb1lpenr_usb2otglpen = wdata[27:27]                    ;
assign rcc_c2_usb2otglp_en              = cur_rcc_c2_ahb1lpenr_usb2otglpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb1lpenr_usb2otglpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c2_ahb1lpenr_usb2otglpen_en ),
  .din  (nxt_rcc_c2_ahb1lpenr_usb2otglpen),
  .dout (cur_rcc_c2_ahb1lpenr_usb2otglpen)
);

// --------------------------------------------------------------------------------
// 26:26               usb1ulpilpen        RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1lpenr_usb1ulpilpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel) ;
assign nxt_rcc_c2_ahb1lpenr_usb1ulpilpen = wdata[26:26]                     ;
assign rcc_c2_usb1ulpilp_en              = cur_rcc_c2_ahb1lpenr_usb1ulpilpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb1lpenr_usb1ulpilpen (
  .clk  (clk                              ),
  .rst_n(rst_n                            ),
  .en   (rcc_c2_ahb1lpenr_usb1ulpilpen_en ),
  .din  (nxt_rcc_c2_ahb1lpenr_usb1ulpilpen),
  .dout (cur_rcc_c2_ahb1lpenr_usb1ulpilpen)
);

// --------------------------------------------------------------------------------
// 25:25               usb1otglpen         RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1lpenr_usb1otglpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
assign nxt_rcc_c2_ahb1lpenr_usb1otglpen = wdata[25:25]                    ;
assign rcc_c2_usb1otglp_en              = cur_rcc_c2_ahb1lpenr_usb1otglpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb1lpenr_usb1otglpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c2_ahb1lpenr_usb1otglpen_en ),
  .din  (nxt_rcc_c2_ahb1lpenr_usb1otglpen),
  .dout (cur_rcc_c2_ahb1lpenr_usb1otglpen)
);

// --------------------------------------------------------------------------------
// 17:17               eth1rxlpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1lpenr_eth1rxlpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
assign nxt_rcc_c2_ahb1lpenr_eth1rxlpen = wdata[17:17]                    ;
assign rcc_c2_eth1rxlp_en              = cur_rcc_c2_ahb1lpenr_eth1rxlpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb1lpenr_eth1rxlpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_ahb1lpenr_eth1rxlpen_en ),
  .din  (nxt_rcc_c2_ahb1lpenr_eth1rxlpen),
  .dout (cur_rcc_c2_ahb1lpenr_eth1rxlpen)
);

// --------------------------------------------------------------------------------
// 16:16               eth1txlpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1lpenr_eth1txlpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
assign nxt_rcc_c2_ahb1lpenr_eth1txlpen = wdata[16:16]                    ;
assign rcc_c2_eth1txlp_en              = cur_rcc_c2_ahb1lpenr_eth1txlpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb1lpenr_eth1txlpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_ahb1lpenr_eth1txlpen_en ),
  .din  (nxt_rcc_c2_ahb1lpenr_eth1txlpen),
  .dout (cur_rcc_c2_ahb1lpenr_eth1txlpen)
);

// --------------------------------------------------------------------------------
// 15:15               eth1maclpen         RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1lpenr_eth1maclpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
assign nxt_rcc_c2_ahb1lpenr_eth1maclpen = wdata[15:15]                    ;
assign rcc_c2_eth1maclp_en              = cur_rcc_c2_ahb1lpenr_eth1maclpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb1lpenr_eth1maclpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c2_ahb1lpenr_eth1maclpen_en ),
  .din  (nxt_rcc_c2_ahb1lpenr_eth1maclpen),
  .dout (cur_rcc_c2_ahb1lpenr_eth1maclpen)
);

// --------------------------------------------------------------------------------
// 5:5                 adc12lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1lpenr_adc12lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
assign nxt_rcc_c2_ahb1lpenr_adc12lpen = wdata[5:5]                      ;
assign rcc_c2_adc12lp_en              = cur_rcc_c2_ahb1lpenr_adc12lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb1lpenr_adc12lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb1lpenr_adc12lpen_en ),
  .din  (nxt_rcc_c2_ahb1lpenr_adc12lpen),
  .dout (cur_rcc_c2_ahb1lpenr_adc12lpen)
);

// --------------------------------------------------------------------------------
// 1:1                 dma2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1lpenr_dma2lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
assign nxt_rcc_c2_ahb1lpenr_dma2lpen = wdata[1:1]                      ;
assign rcc_c2_dma2lp_en              = cur_rcc_c2_ahb1lpenr_dma2lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb1lpenr_dma2lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_ahb1lpenr_dma2lpen_en ),
  .din  (nxt_rcc_c2_ahb1lpenr_dma2lpen),
  .dout (cur_rcc_c2_ahb1lpenr_dma2lpen)
);

// --------------------------------------------------------------------------------
// 0:0                 dma1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb1lpenr_dma1lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
assign nxt_rcc_c2_ahb1lpenr_dma1lpen = wdata[0:0]                      ;
assign rcc_c2_dma1lp_en              = cur_rcc_c2_ahb1lpenr_dma1lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb1lpenr_dma1lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_ahb1lpenr_dma1lpen_en ),
  .din  (nxt_rcc_c2_ahb1lpenr_dma1lpen),
  .dout (cur_rcc_c2_ahb1lpenr_dma1lpen)
);


// --------------------------------------------------------------------------------
// rcc_c2_ahb2lpenr                        0x1c4                                   
// --------------------------------------------------------------------------------
// 31:31               sram3lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 30:30               sram2lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 29:29               sram1lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 9:9                 sdmmc2lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 6:6                 rnglpen             RW                  0b1                 
// --------------------------------------------------------------------------------
// 5:5                 hashlpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 4:4                 cryptlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 0:0                 dcmilpen            RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_ahb2lpenr read data
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2lpenr_read = {cur_rcc_c2_ahb2lpenr_sram3lpen
                             , cur_rcc_c2_ahb2lpenr_sram2lpen
                             , cur_rcc_c2_ahb2lpenr_sram1lpen
                             , {19{1'b0}}
                             , cur_rcc_c2_ahb2lpenr_sdmmc2lpen
                             , {2{1'b0}}
                             , cur_rcc_c2_ahb2lpenr_rnglpen
                             , cur_rcc_c2_ahb2lpenr_hashlpen
                             , cur_rcc_c2_ahb2lpenr_cryptlpen
                             , {3{1'b0}}
                             , cur_rcc_c2_ahb2lpenr_dcmilpen};

// --------------------------------------------------------------------------------
// 31:31               sram3lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2lpenr_sram3lpen_en  = (|wr_req & rcc_c2_ahb2lpenr_sel);
assign nxt_rcc_c2_ahb2lpenr_sram3lpen = wdata[31:31]                    ;
assign rcc_c2_sram3lp_en              = cur_rcc_c2_ahb2lpenr_sram3lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb2lpenr_sram3lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb2lpenr_sram3lpen_en ),
  .din  (nxt_rcc_c2_ahb2lpenr_sram3lpen),
  .dout (cur_rcc_c2_ahb2lpenr_sram3lpen)
);

// --------------------------------------------------------------------------------
// 30:30               sram2lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2lpenr_sram2lpen_en  = (|wr_req & rcc_c2_ahb2lpenr_sel);
assign nxt_rcc_c2_ahb2lpenr_sram2lpen = wdata[30:30]                    ;
assign rcc_c2_sram2lp_en              = cur_rcc_c2_ahb2lpenr_sram2lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb2lpenr_sram2lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb2lpenr_sram2lpen_en ),
  .din  (nxt_rcc_c2_ahb2lpenr_sram2lpen),
  .dout (cur_rcc_c2_ahb2lpenr_sram2lpen)
);

// --------------------------------------------------------------------------------
// 29:29               sram1lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2lpenr_sram1lpen_en  = (|wr_req & rcc_c2_ahb2lpenr_sel);
assign nxt_rcc_c2_ahb2lpenr_sram1lpen = wdata[29:29]                    ;
assign rcc_c2_sram1lp_en              = cur_rcc_c2_ahb2lpenr_sram1lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb2lpenr_sram1lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb2lpenr_sram1lpen_en ),
  .din  (nxt_rcc_c2_ahb2lpenr_sram1lpen),
  .dout (cur_rcc_c2_ahb2lpenr_sram1lpen)
);

// --------------------------------------------------------------------------------
// 9:9                 sdmmc2lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2lpenr_sdmmc2lpen_en  = (|wr_req & rcc_c2_ahb2lpenr_sel);
assign nxt_rcc_c2_ahb2lpenr_sdmmc2lpen = wdata[9:9]                      ;
assign rcc_c2_sdmmc2lp_en              = cur_rcc_c2_ahb2lpenr_sdmmc2lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb2lpenr_sdmmc2lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_ahb2lpenr_sdmmc2lpen_en ),
  .din  (nxt_rcc_c2_ahb2lpenr_sdmmc2lpen),
  .dout (cur_rcc_c2_ahb2lpenr_sdmmc2lpen)
);

// --------------------------------------------------------------------------------
// 6:6                 rnglpen             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2lpenr_rnglpen_en  = (|wr_req & rcc_c2_ahb2lpenr_sel);
assign nxt_rcc_c2_ahb2lpenr_rnglpen = wdata[6:6]                      ;
assign rcc_c2_rnglp_en              = cur_rcc_c2_ahb2lpenr_rnglpen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb2lpenr_rnglpen (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c2_ahb2lpenr_rnglpen_en ),
  .din  (nxt_rcc_c2_ahb2lpenr_rnglpen),
  .dout (cur_rcc_c2_ahb2lpenr_rnglpen)
);

// --------------------------------------------------------------------------------
// 5:5                 hashlpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2lpenr_hashlpen_en  = (|wr_req & rcc_c2_ahb2lpenr_sel);
assign nxt_rcc_c2_ahb2lpenr_hashlpen = wdata[5:5]                      ;
assign rcc_c2_hashlp_en              = cur_rcc_c2_ahb2lpenr_hashlpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb2lpenr_hashlpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_ahb2lpenr_hashlpen_en ),
  .din  (nxt_rcc_c2_ahb2lpenr_hashlpen),
  .dout (cur_rcc_c2_ahb2lpenr_hashlpen)
);

// --------------------------------------------------------------------------------
// 4:4                 cryptlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2lpenr_cryptlpen_en  = (|wr_req & rcc_c2_ahb2lpenr_sel);
assign nxt_rcc_c2_ahb2lpenr_cryptlpen = wdata[4:4]                      ;
assign rcc_c2_cryptlp_en              = cur_rcc_c2_ahb2lpenr_cryptlpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb2lpenr_cryptlpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb2lpenr_cryptlpen_en ),
  .din  (nxt_rcc_c2_ahb2lpenr_cryptlpen),
  .dout (cur_rcc_c2_ahb2lpenr_cryptlpen)
);

// --------------------------------------------------------------------------------
// 0:0                 dcmilpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb2lpenr_dcmilpen_en  = (|wr_req & rcc_c2_ahb2lpenr_sel);
assign nxt_rcc_c2_ahb2lpenr_dcmilpen = wdata[0:0]                      ;
assign rcc_c2_dcmilp_en              = cur_rcc_c2_ahb2lpenr_dcmilpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb2lpenr_dcmilpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_ahb2lpenr_dcmilpen_en ),
  .din  (nxt_rcc_c2_ahb2lpenr_dcmilpen),
  .dout (cur_rcc_c2_ahb2lpenr_dcmilpen)
);


// --------------------------------------------------------------------------------
// rcc_c2_ahb4lpenr                        0x1c8                                   
// --------------------------------------------------------------------------------
// 29:29               sram4lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 28:28               bkpramlpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 24:24               adc3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 21:21               bdmalpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 19:19               crclpen             RW                  0b1                 
// --------------------------------------------------------------------------------
// 10:10               gpioklpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 9:9                 gpiojlpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 8:8                 gpioilpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 7:7                 gpiohlpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 6:6                 gpioglpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 5:5                 gpioflpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 4:4                 gpioelpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 3:3                 gpiodlpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 2:2                 gpioclpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 1:1                 gpioblpen           RW                  0b0                 
// --------------------------------------------------------------------------------
// 0:0                 gpioalpen           RW                  0b0                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_ahb4lpenr read data
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_read = {{2{1'b0}}
                             , cur_rcc_c2_ahb4lpenr_sram4lpen
                             , cur_rcc_c2_ahb4lpenr_bkpramlpen
                             , {3{1'b0}}
                             , cur_rcc_c2_ahb4lpenr_adc3lpen
                             , {2{1'b0}}
                             , cur_rcc_c2_ahb4lpenr_bdmalpen
                             , {1{1'b0}}
                             , cur_rcc_c2_ahb4lpenr_crclpen
                             , {8{1'b0}}
                             , cur_rcc_c2_ahb4lpenr_gpioklpen
                             , cur_rcc_c2_ahb4lpenr_gpiojlpen
                             , cur_rcc_c2_ahb4lpenr_gpioilpen
                             , cur_rcc_c2_ahb4lpenr_gpiohlpen
                             , cur_rcc_c2_ahb4lpenr_gpioglpen
                             , cur_rcc_c2_ahb4lpenr_gpioflpen
                             , cur_rcc_c2_ahb4lpenr_gpioelpen
                             , cur_rcc_c2_ahb4lpenr_gpiodlpen
                             , cur_rcc_c2_ahb4lpenr_gpioclpen
                             , cur_rcc_c2_ahb4lpenr_gpioblpen
                             , cur_rcc_c2_ahb4lpenr_gpioalpen};

// --------------------------------------------------------------------------------
// 29:29               sram4lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_sram4lpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_sram4lpen = wdata[29:29]                    ;
assign rcc_c2_sram4lp_en              = cur_rcc_c2_ahb4lpenr_sram4lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb4lpenr_sram4lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb4lpenr_sram4lpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_sram4lpen),
  .dout (cur_rcc_c2_ahb4lpenr_sram4lpen)
);

// --------------------------------------------------------------------------------
// 28:28               bkpramlpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_bkpramlpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_bkpramlpen = wdata[28:28]                    ;
assign rcc_c2_bkpramlp_en              = cur_rcc_c2_ahb4lpenr_bkpramlpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb4lpenr_bkpramlpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_ahb4lpenr_bkpramlpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_bkpramlpen),
  .dout (cur_rcc_c2_ahb4lpenr_bkpramlpen)
);

// --------------------------------------------------------------------------------
// 24:24               adc3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_adc3lpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_adc3lpen = wdata[24:24]                    ;
assign rcc_c2_adc3lp_en              = cur_rcc_c2_ahb4lpenr_adc3lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb4lpenr_adc3lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_ahb4lpenr_adc3lpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_adc3lpen),
  .dout (cur_rcc_c2_ahb4lpenr_adc3lpen)
);

// --------------------------------------------------------------------------------
// 21:21               bdmalpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_bdmalpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_bdmalpen = wdata[21:21]                    ;
assign rcc_c2_bdmalp_en              = cur_rcc_c2_ahb4lpenr_bdmalpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb4lpenr_bdmalpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_ahb4lpenr_bdmalpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_bdmalpen),
  .dout (cur_rcc_c2_ahb4lpenr_bdmalpen)
);

// --------------------------------------------------------------------------------
// 19:19               crclpen             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_crclpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_crclpen = wdata[19:19]                    ;
assign rcc_c2_crclp_en              = cur_rcc_c2_ahb4lpenr_crclpen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_ahb4lpenr_crclpen (
  .clk  (clk                         ),
  .rst_n(rst_n                       ),
  .en   (rcc_c2_ahb4lpenr_crclpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_crclpen),
  .dout (cur_rcc_c2_ahb4lpenr_crclpen)
);

// --------------------------------------------------------------------------------
// 10:10               gpioklpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_gpioklpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_gpioklpen = wdata[10:10]                    ;
assign rcc_c2_gpioklp_en              = cur_rcc_c2_ahb4lpenr_gpioklpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4lpenr_gpioklpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb4lpenr_gpioklpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_gpioklpen),
  .dout (cur_rcc_c2_ahb4lpenr_gpioklpen)
);

// --------------------------------------------------------------------------------
// 9:9                 gpiojlpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_gpiojlpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_gpiojlpen = wdata[9:9]                      ;
assign rcc_c2_gpiojlp_en              = cur_rcc_c2_ahb4lpenr_gpiojlpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4lpenr_gpiojlpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb4lpenr_gpiojlpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_gpiojlpen),
  .dout (cur_rcc_c2_ahb4lpenr_gpiojlpen)
);

// --------------------------------------------------------------------------------
// 8:8                 gpioilpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_gpioilpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_gpioilpen = wdata[8:8]                      ;
assign rcc_c2_gpioilp_en              = cur_rcc_c2_ahb4lpenr_gpioilpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4lpenr_gpioilpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb4lpenr_gpioilpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_gpioilpen),
  .dout (cur_rcc_c2_ahb4lpenr_gpioilpen)
);

// --------------------------------------------------------------------------------
// 7:7                 gpiohlpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_gpiohlpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_gpiohlpen = wdata[7:7]                      ;
assign rcc_c2_gpiohlp_en              = cur_rcc_c2_ahb4lpenr_gpiohlpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4lpenr_gpiohlpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb4lpenr_gpiohlpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_gpiohlpen),
  .dout (cur_rcc_c2_ahb4lpenr_gpiohlpen)
);

// --------------------------------------------------------------------------------
// 6:6                 gpioglpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_gpioglpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_gpioglpen = wdata[6:6]                      ;
assign rcc_c2_gpioglp_en              = cur_rcc_c2_ahb4lpenr_gpioglpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4lpenr_gpioglpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb4lpenr_gpioglpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_gpioglpen),
  .dout (cur_rcc_c2_ahb4lpenr_gpioglpen)
);

// --------------------------------------------------------------------------------
// 5:5                 gpioflpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_gpioflpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_gpioflpen = wdata[5:5]                      ;
assign rcc_c2_gpioflp_en              = cur_rcc_c2_ahb4lpenr_gpioflpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4lpenr_gpioflpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb4lpenr_gpioflpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_gpioflpen),
  .dout (cur_rcc_c2_ahb4lpenr_gpioflpen)
);

// --------------------------------------------------------------------------------
// 4:4                 gpioelpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_gpioelpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_gpioelpen = wdata[4:4]                      ;
assign rcc_c2_gpioelp_en              = cur_rcc_c2_ahb4lpenr_gpioelpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4lpenr_gpioelpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb4lpenr_gpioelpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_gpioelpen),
  .dout (cur_rcc_c2_ahb4lpenr_gpioelpen)
);

// --------------------------------------------------------------------------------
// 3:3                 gpiodlpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_gpiodlpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_gpiodlpen = wdata[3:3]                      ;
assign rcc_c2_gpiodlp_en              = cur_rcc_c2_ahb4lpenr_gpiodlpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4lpenr_gpiodlpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb4lpenr_gpiodlpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_gpiodlpen),
  .dout (cur_rcc_c2_ahb4lpenr_gpiodlpen)
);

// --------------------------------------------------------------------------------
// 2:2                 gpioclpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_gpioclpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_gpioclpen = wdata[2:2]                      ;
assign rcc_c2_gpioclp_en              = cur_rcc_c2_ahb4lpenr_gpioclpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4lpenr_gpioclpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb4lpenr_gpioclpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_gpioclpen),
  .dout (cur_rcc_c2_ahb4lpenr_gpioclpen)
);

// --------------------------------------------------------------------------------
// 1:1                 gpioblpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_gpioblpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_gpioblpen = wdata[1:1]                      ;
assign rcc_c2_gpioblp_en              = cur_rcc_c2_ahb4lpenr_gpioblpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4lpenr_gpioblpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb4lpenr_gpioblpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_gpioblpen),
  .dout (cur_rcc_c2_ahb4lpenr_gpioblpen)
);

// --------------------------------------------------------------------------------
// 0:0                 gpioalpen           RW                  0b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_ahb4lpenr_gpioalpen_en  = (|wr_req & rcc_c2_ahb4lpenr_sel);
assign nxt_rcc_c2_ahb4lpenr_gpioalpen = wdata[0:0]                      ;
assign rcc_c2_gpioalp_en              = cur_rcc_c2_ahb4lpenr_gpioalpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_ahb4lpenr_gpioalpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_ahb4lpenr_gpioalpen_en ),
  .din  (nxt_rcc_c2_ahb4lpenr_gpioalpen),
  .dout (cur_rcc_c2_ahb4lpenr_gpioalpen)
);


// --------------------------------------------------------------------------------
// rcc_c2_apb3lpenr                        0x1cc                                   
// --------------------------------------------------------------------------------
// 6:6                 wwdg1lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 3:3                 ltdclpen            RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_apb3lpenr read data
// --------------------------------------------------------------------------------
assign rcc_c2_apb3lpenr_read = {{25{1'b0}}
                             , cur_rcc_c2_apb3lpenr_wwdg1lpen
                             , {2{1'b0}}
                             , cur_rcc_c2_apb3lpenr_ltdclpen
                             , {3{1'b0}}};

// --------------------------------------------------------------------------------
// 6:6                 wwdg1lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb3lpenr_wwdg1lpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
assign nxt_rcc_c2_apb3lpenr_wwdg1lpen = wdata[6:6]                      ;
assign rcc_c2_wwdg1lp_en              = cur_rcc_c2_apb3lpenr_wwdg1lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb3lpenr_wwdg1lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb3lpenr_wwdg1lpen_en ),
  .din  (nxt_rcc_c2_apb3lpenr_wwdg1lpen),
  .dout (cur_rcc_c2_apb3lpenr_wwdg1lpen)
);

// --------------------------------------------------------------------------------
// 3:3                 ltdclpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb3lpenr_ltdclpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
assign nxt_rcc_c2_apb3lpenr_ltdclpen = wdata[3:3]                      ;
assign rcc_c2_ltdclp_en              = cur_rcc_c2_apb3lpenr_ltdclpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb3lpenr_ltdclpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb3lpenr_ltdclpen_en ),
  .din  (nxt_rcc_c2_apb3lpenr_ltdclpen),
  .dout (cur_rcc_c2_apb3lpenr_ltdclpen)
);


// --------------------------------------------------------------------------------
// rcc_c2_apb1llpenr                       0x1d0                                   
// --------------------------------------------------------------------------------
// 31:31               uart8lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 30:30               uart7lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 29:29               dac12lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 27:27               hdmiceclpen         RW                  0b1                 
// --------------------------------------------------------------------------------
// 23:23               i2c3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 22:22               i2c2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 21:21               i2c1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 20:20               uart5lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 19:19               uart4lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 18:18               usart3lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 17:17               usart2lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 16:16               spdifrxlpen         RW                  0b1                 
// --------------------------------------------------------------------------------
// 15:15               spi3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 14:14               spi2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 11:11               wwdg2lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 9:9                 lptim1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 8:8                 tim14lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 7:7                 tim13lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 6:6                 tim12lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 5:5                 tim7lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 4:4                 tim6lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 3:3                 tim5lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 2:2                 tim4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 1:1                 tim3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 0:0                 tim2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_apb1llpenr read data
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_read = {cur_rcc_c2_apb1llpenr_uart8lpen
                              , cur_rcc_c2_apb1llpenr_uart7lpen
                              , cur_rcc_c2_apb1llpenr_dac12lpen
                              , {1{1'b0}}
                              , cur_rcc_c2_apb1llpenr_hdmiceclpen
                              , {3{1'b0}}
                              , cur_rcc_c2_apb1llpenr_i2c3lpen
                              , cur_rcc_c2_apb1llpenr_i2c2lpen
                              , cur_rcc_c2_apb1llpenr_i2c1lpen
                              , cur_rcc_c2_apb1llpenr_uart5lpen
                              , cur_rcc_c2_apb1llpenr_uart4lpen
                              , cur_rcc_c2_apb1llpenr_usart3lpen
                              , cur_rcc_c2_apb1llpenr_usart2lpen
                              , cur_rcc_c2_apb1llpenr_spdifrxlpen
                              , cur_rcc_c2_apb1llpenr_spi3lpen
                              , cur_rcc_c2_apb1llpenr_spi2lpen
                              , {2{1'b0}}
                              , cur_rcc_c2_apb1llpenr_wwdg2lpen
                              , {1{1'b0}}
                              , cur_rcc_c2_apb1llpenr_lptim1lpen
                              , cur_rcc_c2_apb1llpenr_tim14lpen
                              , cur_rcc_c2_apb1llpenr_tim13lpen
                              , cur_rcc_c2_apb1llpenr_tim12lpen
                              , cur_rcc_c2_apb1llpenr_tim7lpen
                              , cur_rcc_c2_apb1llpenr_tim6lpen
                              , cur_rcc_c2_apb1llpenr_tim5lpen
                              , cur_rcc_c2_apb1llpenr_tim4lpen
                              , cur_rcc_c2_apb1llpenr_tim3lpen
                              , cur_rcc_c2_apb1llpenr_tim2lpen};

// --------------------------------------------------------------------------------
// 31:31               uart8lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_uart8lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_uart8lpen = wdata[31:31]                     ;
assign rcc_c2_uart8lp_en               = cur_rcc_c2_apb1llpenr_uart8lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_uart8lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb1llpenr_uart8lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_uart8lpen),
  .dout (cur_rcc_c2_apb1llpenr_uart8lpen)
);

// --------------------------------------------------------------------------------
// 30:30               uart7lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_uart7lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_uart7lpen = wdata[30:30]                     ;
assign rcc_c2_uart7lp_en               = cur_rcc_c2_apb1llpenr_uart7lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_uart7lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb1llpenr_uart7lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_uart7lpen),
  .dout (cur_rcc_c2_apb1llpenr_uart7lpen)
);

// --------------------------------------------------------------------------------
// 29:29               dac12lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_dac12lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_dac12lpen = wdata[29:29]                     ;
assign rcc_c2_dac12lp_en               = cur_rcc_c2_apb1llpenr_dac12lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_dac12lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb1llpenr_dac12lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_dac12lpen),
  .dout (cur_rcc_c2_apb1llpenr_dac12lpen)
);

// --------------------------------------------------------------------------------
// 27:27               hdmiceclpen         RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_hdmiceclpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_hdmiceclpen = wdata[27:27]                     ;
assign rcc_c2_hdmiceclp_en               = cur_rcc_c2_apb1llpenr_hdmiceclpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_hdmiceclpen (
  .clk  (clk                              ),
  .rst_n(rst_n                            ),
  .en   (rcc_c2_apb1llpenr_hdmiceclpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_hdmiceclpen),
  .dout (cur_rcc_c2_apb1llpenr_hdmiceclpen)
);

// --------------------------------------------------------------------------------
// 23:23               i2c3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_i2c3lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_i2c3lpen = wdata[23:23]                     ;
assign rcc_c2_i2c3lp_en               = cur_rcc_c2_apb1llpenr_i2c3lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_i2c3lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb1llpenr_i2c3lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_i2c3lpen),
  .dout (cur_rcc_c2_apb1llpenr_i2c3lpen)
);

// --------------------------------------------------------------------------------
// 22:22               i2c2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_i2c2lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_i2c2lpen = wdata[22:22]                     ;
assign rcc_c2_i2c2lp_en               = cur_rcc_c2_apb1llpenr_i2c2lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_i2c2lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb1llpenr_i2c2lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_i2c2lpen),
  .dout (cur_rcc_c2_apb1llpenr_i2c2lpen)
);

// --------------------------------------------------------------------------------
// 21:21               i2c1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_i2c1lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_i2c1lpen = wdata[21:21]                     ;
assign rcc_c2_i2c1lp_en               = cur_rcc_c2_apb1llpenr_i2c1lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_i2c1lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb1llpenr_i2c1lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_i2c1lpen),
  .dout (cur_rcc_c2_apb1llpenr_i2c1lpen)
);

// --------------------------------------------------------------------------------
// 20:20               uart5lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_uart5lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_uart5lpen = wdata[20:20]                     ;
assign rcc_c2_uart5lp_en               = cur_rcc_c2_apb1llpenr_uart5lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_uart5lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb1llpenr_uart5lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_uart5lpen),
  .dout (cur_rcc_c2_apb1llpenr_uart5lpen)
);

// --------------------------------------------------------------------------------
// 19:19               uart4lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_uart4lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_uart4lpen = wdata[19:19]                     ;
assign rcc_c2_uart4lp_en               = cur_rcc_c2_apb1llpenr_uart4lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_uart4lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb1llpenr_uart4lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_uart4lpen),
  .dout (cur_rcc_c2_apb1llpenr_uart4lpen)
);

// --------------------------------------------------------------------------------
// 18:18               usart3lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_usart3lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_usart3lpen = wdata[18:18]                     ;
assign rcc_c2_usart3lp_en               = cur_rcc_c2_apb1llpenr_usart3lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_usart3lpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c2_apb1llpenr_usart3lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_usart3lpen),
  .dout (cur_rcc_c2_apb1llpenr_usart3lpen)
);

// --------------------------------------------------------------------------------
// 17:17               usart2lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_usart2lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_usart2lpen = wdata[17:17]                     ;
assign rcc_c2_usart2lp_en               = cur_rcc_c2_apb1llpenr_usart2lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_usart2lpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c2_apb1llpenr_usart2lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_usart2lpen),
  .dout (cur_rcc_c2_apb1llpenr_usart2lpen)
);

// --------------------------------------------------------------------------------
// 16:16               spdifrxlpen         RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_spdifrxlpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_spdifrxlpen = wdata[16:16]                     ;
assign rcc_c2_spdifrxlp_en               = cur_rcc_c2_apb1llpenr_spdifrxlpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_spdifrxlpen (
  .clk  (clk                              ),
  .rst_n(rst_n                            ),
  .en   (rcc_c2_apb1llpenr_spdifrxlpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_spdifrxlpen),
  .dout (cur_rcc_c2_apb1llpenr_spdifrxlpen)
);

// --------------------------------------------------------------------------------
// 15:15               spi3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_spi3lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_spi3lpen = wdata[15:15]                     ;
assign rcc_c2_spi3lp_en               = cur_rcc_c2_apb1llpenr_spi3lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_spi3lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb1llpenr_spi3lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_spi3lpen),
  .dout (cur_rcc_c2_apb1llpenr_spi3lpen)
);

// --------------------------------------------------------------------------------
// 14:14               spi2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_spi2lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_spi2lpen = wdata[14:14]                     ;
assign rcc_c2_spi2lp_en               = cur_rcc_c2_apb1llpenr_spi2lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_spi2lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb1llpenr_spi2lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_spi2lpen),
  .dout (cur_rcc_c2_apb1llpenr_spi2lpen)
);

// --------------------------------------------------------------------------------
// 11:11               wwdg2lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_wwdg2lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_wwdg2lpen = wdata[11:11]                     ;
assign rcc_c2_wwdg2lp_en               = cur_rcc_c2_apb1llpenr_wwdg2lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_wwdg2lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb1llpenr_wwdg2lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_wwdg2lpen),
  .dout (cur_rcc_c2_apb1llpenr_wwdg2lpen)
);

// --------------------------------------------------------------------------------
// 9:9                 lptim1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_lptim1lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_lptim1lpen = wdata[9:9]                       ;
assign rcc_c2_lptim1lp_en               = cur_rcc_c2_apb1llpenr_lptim1lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_lptim1lpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c2_apb1llpenr_lptim1lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_lptim1lpen),
  .dout (cur_rcc_c2_apb1llpenr_lptim1lpen)
);

// --------------------------------------------------------------------------------
// 8:8                 tim14lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_tim14lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_tim14lpen = wdata[8:8]                       ;
assign rcc_c2_tim14lp_en               = cur_rcc_c2_apb1llpenr_tim14lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_tim14lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb1llpenr_tim14lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_tim14lpen),
  .dout (cur_rcc_c2_apb1llpenr_tim14lpen)
);

// --------------------------------------------------------------------------------
// 7:7                 tim13lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_tim13lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_tim13lpen = wdata[7:7]                       ;
assign rcc_c2_tim13lp_en               = cur_rcc_c2_apb1llpenr_tim13lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_tim13lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb1llpenr_tim13lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_tim13lpen),
  .dout (cur_rcc_c2_apb1llpenr_tim13lpen)
);

// --------------------------------------------------------------------------------
// 6:6                 tim12lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_tim12lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_tim12lpen = wdata[6:6]                       ;
assign rcc_c2_tim12lp_en               = cur_rcc_c2_apb1llpenr_tim12lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_tim12lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb1llpenr_tim12lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_tim12lpen),
  .dout (cur_rcc_c2_apb1llpenr_tim12lpen)
);

// --------------------------------------------------------------------------------
// 5:5                 tim7lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_tim7lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_tim7lpen = wdata[5:5]                       ;
assign rcc_c2_tim7lp_en               = cur_rcc_c2_apb1llpenr_tim7lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_tim7lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb1llpenr_tim7lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_tim7lpen),
  .dout (cur_rcc_c2_apb1llpenr_tim7lpen)
);

// --------------------------------------------------------------------------------
// 4:4                 tim6lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_tim6lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_tim6lpen = wdata[4:4]                       ;
assign rcc_c2_tim6lp_en               = cur_rcc_c2_apb1llpenr_tim6lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_tim6lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb1llpenr_tim6lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_tim6lpen),
  .dout (cur_rcc_c2_apb1llpenr_tim6lpen)
);

// --------------------------------------------------------------------------------
// 3:3                 tim5lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_tim5lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_tim5lpen = wdata[3:3]                       ;
assign rcc_c2_tim5lp_en               = cur_rcc_c2_apb1llpenr_tim5lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_tim5lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb1llpenr_tim5lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_tim5lpen),
  .dout (cur_rcc_c2_apb1llpenr_tim5lpen)
);

// --------------------------------------------------------------------------------
// 2:2                 tim4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_tim4lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_tim4lpen = wdata[2:2]                       ;
assign rcc_c2_tim4lp_en               = cur_rcc_c2_apb1llpenr_tim4lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_tim4lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb1llpenr_tim4lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_tim4lpen),
  .dout (cur_rcc_c2_apb1llpenr_tim4lpen)
);

// --------------------------------------------------------------------------------
// 1:1                 tim3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_tim3lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_tim3lpen = wdata[1:1]                       ;
assign rcc_c2_tim3lp_en               = cur_rcc_c2_apb1llpenr_tim3lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_tim3lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb1llpenr_tim3lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_tim3lpen),
  .dout (cur_rcc_c2_apb1llpenr_tim3lpen)
);

// --------------------------------------------------------------------------------
// 0:0                 tim2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1llpenr_tim2lpen_en  = (|wr_req & rcc_c2_apb1llpenr_sel);
assign nxt_rcc_c2_apb1llpenr_tim2lpen = wdata[0:0]                       ;
assign rcc_c2_tim2lp_en               = cur_rcc_c2_apb1llpenr_tim2lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1llpenr_tim2lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb1llpenr_tim2lpen_en ),
  .din  (nxt_rcc_c2_apb1llpenr_tim2lpen),
  .dout (cur_rcc_c2_apb1llpenr_tim2lpen)
);


// --------------------------------------------------------------------------------
// rcc_c2_apb1hlpenr                       0x1d4                                   
// --------------------------------------------------------------------------------
// 8:8                 fdcanlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 5:5                 mdioslpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 4:4                 opamplpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 2:2                 swplpen             RW                  0b1                 
// --------------------------------------------------------------------------------
// 1:1                 crslpen             RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_apb1hlpenr read data
// --------------------------------------------------------------------------------
assign rcc_c2_apb1hlpenr_read = {{23{1'b0}}
                              , cur_rcc_c2_apb1hlpenr_fdcanlpen
                              , {2{1'b0}}
                              , cur_rcc_c2_apb1hlpenr_mdioslpen
                              , cur_rcc_c2_apb1hlpenr_opamplpen
                              , {1{1'b0}}
                              , cur_rcc_c2_apb1hlpenr_swplpen
                              , cur_rcc_c2_apb1hlpenr_crslpen
                              , {1{1'b0}}};

// --------------------------------------------------------------------------------
// 8:8                 fdcanlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1hlpenr_fdcanlpen_en  = (|wr_req & rcc_c2_apb1hlpenr_sel);
assign nxt_rcc_c2_apb1hlpenr_fdcanlpen = wdata[8:8]                       ;
assign rcc_c2_fdcanlp_en               = cur_rcc_c2_apb1hlpenr_fdcanlpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1hlpenr_fdcanlpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb1hlpenr_fdcanlpen_en ),
  .din  (nxt_rcc_c2_apb1hlpenr_fdcanlpen),
  .dout (cur_rcc_c2_apb1hlpenr_fdcanlpen)
);

// --------------------------------------------------------------------------------
// 5:5                 mdioslpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1hlpenr_mdioslpen_en  = (|wr_req & rcc_c2_apb1hlpenr_sel);
assign nxt_rcc_c2_apb1hlpenr_mdioslpen = wdata[5:5]                       ;
assign rcc_c2_mdioslp_en               = cur_rcc_c2_apb1hlpenr_mdioslpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1hlpenr_mdioslpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb1hlpenr_mdioslpen_en ),
  .din  (nxt_rcc_c2_apb1hlpenr_mdioslpen),
  .dout (cur_rcc_c2_apb1hlpenr_mdioslpen)
);

// --------------------------------------------------------------------------------
// 4:4                 opamplpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1hlpenr_opamplpen_en  = (|wr_req & rcc_c2_apb1hlpenr_sel);
assign nxt_rcc_c2_apb1hlpenr_opamplpen = wdata[4:4]                       ;
assign rcc_c2_opamplp_en               = cur_rcc_c2_apb1hlpenr_opamplpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1hlpenr_opamplpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb1hlpenr_opamplpen_en ),
  .din  (nxt_rcc_c2_apb1hlpenr_opamplpen),
  .dout (cur_rcc_c2_apb1hlpenr_opamplpen)
);

// --------------------------------------------------------------------------------
// 2:2                 swplpen             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1hlpenr_swplpen_en  = (|wr_req & rcc_c2_apb1hlpenr_sel);
assign nxt_rcc_c2_apb1hlpenr_swplpen = wdata[2:2]                       ;
assign rcc_c2_swplp_en               = cur_rcc_c2_apb1hlpenr_swplpen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1hlpenr_swplpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb1hlpenr_swplpen_en ),
  .din  (nxt_rcc_c2_apb1hlpenr_swplpen),
  .dout (cur_rcc_c2_apb1hlpenr_swplpen)
);

// --------------------------------------------------------------------------------
// 1:1                 crslpen             RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb1hlpenr_crslpen_en  = (|wr_req & rcc_c2_apb1hlpenr_sel);
assign nxt_rcc_c2_apb1hlpenr_crslpen = wdata[1:1]                       ;
assign rcc_c2_crslp_en               = cur_rcc_c2_apb1hlpenr_crslpen    ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb1hlpenr_crslpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb1hlpenr_crslpen_en ),
  .din  (nxt_rcc_c2_apb1hlpenr_crslpen),
  .dout (cur_rcc_c2_apb1hlpenr_crslpen)
);


// --------------------------------------------------------------------------------
// rcc_c2_apb2lpenr                        0x1d8                                   
// --------------------------------------------------------------------------------
// 29:29               hrtimlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 28:28               dfsdm1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 24:24               sai3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 23:23               sai2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 22:22               sai1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 20:20               spi5lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 18:18               tim17lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 17:17               tim16lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 16:16               tim15lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
// 13:13               spi4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 12:12               spi1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 5:5                 usart6lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 4:4                 usart1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 1:1                 tim8lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 0:0                 tim1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_apb2lpenr read data
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_read = {{2{1'b0}}
                             , cur_rcc_c2_apb2lpenr_hrtimlpen
                             , cur_rcc_c2_apb2lpenr_dfsdm1lpen
                             , {3{1'b0}}
                             , cur_rcc_c2_apb2lpenr_sai3lpen
                             , cur_rcc_c2_apb2lpenr_sai2lpen
                             , cur_rcc_c2_apb2lpenr_sai1lpen
                             , {1{1'b0}}
                             , cur_rcc_c2_apb2lpenr_spi5lpen
                             , {1{1'b0}}
                             , cur_rcc_c2_apb2lpenr_tim17lpen
                             , cur_rcc_c2_apb2lpenr_tim16lpen
                             , cur_rcc_c2_apb2lpenr_tim15lpen
                             , {2{1'b0}}
                             , cur_rcc_c2_apb2lpenr_spi4lpen
                             , cur_rcc_c2_apb2lpenr_spi1lpen
                             , {6{1'b0}}
                             , cur_rcc_c2_apb2lpenr_usart6lpen
                             , cur_rcc_c2_apb2lpenr_usart1lpen
                             , {2{1'b0}}
                             , cur_rcc_c2_apb2lpenr_tim8lpen
                             , cur_rcc_c2_apb2lpenr_tim1lpen};

// --------------------------------------------------------------------------------
// 29:29               hrtimlpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_hrtimlpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_hrtimlpen = wdata[29:29]                    ;
assign rcc_c2_hrtimlp_en              = cur_rcc_c2_apb2lpenr_hrtimlpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_hrtimlpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb2lpenr_hrtimlpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_hrtimlpen),
  .dout (cur_rcc_c2_apb2lpenr_hrtimlpen)
);

// --------------------------------------------------------------------------------
// 28:28               dfsdm1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_dfsdm1lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_dfsdm1lpen = wdata[28:28]                    ;
assign rcc_c2_dfsdm1lp_en              = cur_rcc_c2_apb2lpenr_dfsdm1lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_dfsdm1lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb2lpenr_dfsdm1lpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_dfsdm1lpen),
  .dout (cur_rcc_c2_apb2lpenr_dfsdm1lpen)
);

// --------------------------------------------------------------------------------
// 24:24               sai3lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_sai3lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_sai3lpen = wdata[24:24]                    ;
assign rcc_c2_sai3lp_en              = cur_rcc_c2_apb2lpenr_sai3lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_sai3lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb2lpenr_sai3lpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_sai3lpen),
  .dout (cur_rcc_c2_apb2lpenr_sai3lpen)
);

// --------------------------------------------------------------------------------
// 23:23               sai2lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_sai2lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_sai2lpen = wdata[23:23]                    ;
assign rcc_c2_sai2lp_en              = cur_rcc_c2_apb2lpenr_sai2lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_sai2lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb2lpenr_sai2lpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_sai2lpen),
  .dout (cur_rcc_c2_apb2lpenr_sai2lpen)
);

// --------------------------------------------------------------------------------
// 22:22               sai1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_sai1lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_sai1lpen = wdata[22:22]                    ;
assign rcc_c2_sai1lp_en              = cur_rcc_c2_apb2lpenr_sai1lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_sai1lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb2lpenr_sai1lpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_sai1lpen),
  .dout (cur_rcc_c2_apb2lpenr_sai1lpen)
);

// --------------------------------------------------------------------------------
// 20:20               spi5lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_spi5lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_spi5lpen = wdata[20:20]                    ;
assign rcc_c2_spi5lp_en              = cur_rcc_c2_apb2lpenr_spi5lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_spi5lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb2lpenr_spi5lpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_spi5lpen),
  .dout (cur_rcc_c2_apb2lpenr_spi5lpen)
);

// --------------------------------------------------------------------------------
// 18:18               tim17lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_tim17lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_tim17lpen = wdata[18:18]                    ;
assign rcc_c2_tim17lp_en              = cur_rcc_c2_apb2lpenr_tim17lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_tim17lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb2lpenr_tim17lpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_tim17lpen),
  .dout (cur_rcc_c2_apb2lpenr_tim17lpen)
);

// --------------------------------------------------------------------------------
// 17:17               tim16lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_tim16lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_tim16lpen = wdata[17:17]                    ;
assign rcc_c2_tim16lp_en              = cur_rcc_c2_apb2lpenr_tim16lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_tim16lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb2lpenr_tim16lpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_tim16lpen),
  .dout (cur_rcc_c2_apb2lpenr_tim16lpen)
);

// --------------------------------------------------------------------------------
// 16:16               tim15lpen           RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_tim15lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_tim15lpen = wdata[16:16]                    ;
assign rcc_c2_tim15lp_en              = cur_rcc_c2_apb2lpenr_tim15lpen  ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_tim15lpen (
  .clk  (clk                           ),
  .rst_n(rst_n                         ),
  .en   (rcc_c2_apb2lpenr_tim15lpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_tim15lpen),
  .dout (cur_rcc_c2_apb2lpenr_tim15lpen)
);

// --------------------------------------------------------------------------------
// 13:13               spi4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_spi4lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_spi4lpen = wdata[13:13]                    ;
assign rcc_c2_spi4lp_en              = cur_rcc_c2_apb2lpenr_spi4lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_spi4lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb2lpenr_spi4lpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_spi4lpen),
  .dout (cur_rcc_c2_apb2lpenr_spi4lpen)
);

// --------------------------------------------------------------------------------
// 12:12               spi1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_spi1lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_spi1lpen = wdata[12:12]                    ;
assign rcc_c2_spi1lp_en              = cur_rcc_c2_apb2lpenr_spi1lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_spi1lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb2lpenr_spi1lpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_spi1lpen),
  .dout (cur_rcc_c2_apb2lpenr_spi1lpen)
);

// --------------------------------------------------------------------------------
// 5:5                 usart6lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_usart6lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_usart6lpen = wdata[5:5]                      ;
assign rcc_c2_usart6lp_en              = cur_rcc_c2_apb2lpenr_usart6lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_usart6lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb2lpenr_usart6lpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_usart6lpen),
  .dout (cur_rcc_c2_apb2lpenr_usart6lpen)
);

// --------------------------------------------------------------------------------
// 4:4                 usart1lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_usart1lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_usart1lpen = wdata[4:4]                      ;
assign rcc_c2_usart1lp_en              = cur_rcc_c2_apb2lpenr_usart1lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_usart1lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb2lpenr_usart1lpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_usart1lpen),
  .dout (cur_rcc_c2_apb2lpenr_usart1lpen)
);

// --------------------------------------------------------------------------------
// 1:1                 tim8lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_tim8lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_tim8lpen = wdata[1:1]                      ;
assign rcc_c2_tim8lp_en              = cur_rcc_c2_apb2lpenr_tim8lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_tim8lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb2lpenr_tim8lpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_tim8lpen),
  .dout (cur_rcc_c2_apb2lpenr_tim8lpen)
);

// --------------------------------------------------------------------------------
// 0:0                 tim1lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb2lpenr_tim1lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
assign nxt_rcc_c2_apb2lpenr_tim1lpen = wdata[0:0]                      ;
assign rcc_c2_tim1lp_en              = cur_rcc_c2_apb2lpenr_tim1lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb2lpenr_tim1lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb2lpenr_tim1lpen_en ),
  .din  (nxt_rcc_c2_apb2lpenr_tim1lpen),
  .dout (cur_rcc_c2_apb2lpenr_tim1lpen)
);


// --------------------------------------------------------------------------------
// rcc_c2_apb4lpenr                        0x1dc                                   
// --------------------------------------------------------------------------------
// 21:21               sai4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 16:16               rtcapblpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 15:15               vreflpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 14:14               comp12lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 12:12               lptim5lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 11:11               lptim4lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 10:10               lptim3lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 9:9                 lptim2lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
// 7:7                 i2c4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 5:5                 spi6lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
// 3:3                 lpuart1lpen         RW                  0b1                 
// --------------------------------------------------------------------------------
// 1:1                 syscfglpen          RW                  0b1                 
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// rcc_c2_apb4lpenr read data
// --------------------------------------------------------------------------------
assign rcc_c2_apb4lpenr_read = {{10{1'b0}}
                             , cur_rcc_c2_apb4lpenr_sai4lpen
                             , {4{1'b0}}
                             , cur_rcc_c2_apb4lpenr_rtcapblpen
                             , cur_rcc_c2_apb4lpenr_vreflpen
                             , cur_rcc_c2_apb4lpenr_comp12lpen
                             , {1{1'b0}}
                             , cur_rcc_c2_apb4lpenr_lptim5lpen
                             , cur_rcc_c2_apb4lpenr_lptim4lpen
                             , cur_rcc_c2_apb4lpenr_lptim3lpen
                             , cur_rcc_c2_apb4lpenr_lptim2lpen
                             , {1{1'b0}}
                             , cur_rcc_c2_apb4lpenr_i2c4lpen
                             , {1{1'b0}}
                             , cur_rcc_c2_apb4lpenr_spi6lpen
                             , {1{1'b0}}
                             , cur_rcc_c2_apb4lpenr_lpuart1lpen
                             , {1{1'b0}}
                             , cur_rcc_c2_apb4lpenr_syscfglpen
                             , {1{1'b0}}};

// --------------------------------------------------------------------------------
// 21:21               sai4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4lpenr_sai4lpen_en  = (|wr_req & rcc_c2_apb4lpenr_sel);
assign nxt_rcc_c2_apb4lpenr_sai4lpen = wdata[21:21]                    ;
assign rcc_c2_sai4lp_en              = cur_rcc_c2_apb4lpenr_sai4lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb4lpenr_sai4lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb4lpenr_sai4lpen_en ),
  .din  (nxt_rcc_c2_apb4lpenr_sai4lpen),
  .dout (cur_rcc_c2_apb4lpenr_sai4lpen)
);

// --------------------------------------------------------------------------------
// 16:16               rtcapblpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4lpenr_rtcapblpen_en  = (|wr_req & rcc_c2_apb4lpenr_sel);
assign nxt_rcc_c2_apb4lpenr_rtcapblpen = wdata[16:16]                    ;
assign rcc_c2_rtcapblp_en              = cur_rcc_c2_apb4lpenr_rtcapblpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb4lpenr_rtcapblpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb4lpenr_rtcapblpen_en ),
  .din  (nxt_rcc_c2_apb4lpenr_rtcapblpen),
  .dout (cur_rcc_c2_apb4lpenr_rtcapblpen)
);

// --------------------------------------------------------------------------------
// 15:15               vreflpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4lpenr_vreflpen_en  = (|wr_req & rcc_c2_apb4lpenr_sel);
assign nxt_rcc_c2_apb4lpenr_vreflpen = wdata[15:15]                    ;
assign rcc_c2_vreflp_en              = cur_rcc_c2_apb4lpenr_vreflpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb4lpenr_vreflpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb4lpenr_vreflpen_en ),
  .din  (nxt_rcc_c2_apb4lpenr_vreflpen),
  .dout (cur_rcc_c2_apb4lpenr_vreflpen)
);

// --------------------------------------------------------------------------------
// 14:14               comp12lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4lpenr_comp12lpen_en  = (|wr_req & rcc_c2_apb4lpenr_sel);
assign nxt_rcc_c2_apb4lpenr_comp12lpen = wdata[14:14]                    ;
assign rcc_c2_comp12lp_en              = cur_rcc_c2_apb4lpenr_comp12lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb4lpenr_comp12lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb4lpenr_comp12lpen_en ),
  .din  (nxt_rcc_c2_apb4lpenr_comp12lpen),
  .dout (cur_rcc_c2_apb4lpenr_comp12lpen)
);

// --------------------------------------------------------------------------------
// 12:12               lptim5lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4lpenr_lptim5lpen_en  = (|wr_req & rcc_c2_apb4lpenr_sel);
assign nxt_rcc_c2_apb4lpenr_lptim5lpen = wdata[12:12]                    ;
assign rcc_c2_lptim5lp_en              = cur_rcc_c2_apb4lpenr_lptim5lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb4lpenr_lptim5lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb4lpenr_lptim5lpen_en ),
  .din  (nxt_rcc_c2_apb4lpenr_lptim5lpen),
  .dout (cur_rcc_c2_apb4lpenr_lptim5lpen)
);

// --------------------------------------------------------------------------------
// 11:11               lptim4lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4lpenr_lptim4lpen_en  = (|wr_req & rcc_c2_apb4lpenr_sel);
assign nxt_rcc_c2_apb4lpenr_lptim4lpen = wdata[11:11]                    ;
assign rcc_c2_lptim4lp_en              = cur_rcc_c2_apb4lpenr_lptim4lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb4lpenr_lptim4lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb4lpenr_lptim4lpen_en ),
  .din  (nxt_rcc_c2_apb4lpenr_lptim4lpen),
  .dout (cur_rcc_c2_apb4lpenr_lptim4lpen)
);

// --------------------------------------------------------------------------------
// 10:10               lptim3lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4lpenr_lptim3lpen_en  = (|wr_req & rcc_c2_apb4lpenr_sel);
assign nxt_rcc_c2_apb4lpenr_lptim3lpen = wdata[10:10]                    ;
assign rcc_c2_lptim3lp_en              = cur_rcc_c2_apb4lpenr_lptim3lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb4lpenr_lptim3lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb4lpenr_lptim3lpen_en ),
  .din  (nxt_rcc_c2_apb4lpenr_lptim3lpen),
  .dout (cur_rcc_c2_apb4lpenr_lptim3lpen)
);

// --------------------------------------------------------------------------------
// 9:9                 lptim2lpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4lpenr_lptim2lpen_en  = (|wr_req & rcc_c2_apb4lpenr_sel);
assign nxt_rcc_c2_apb4lpenr_lptim2lpen = wdata[9:9]                      ;
assign rcc_c2_lptim2lp_en              = cur_rcc_c2_apb4lpenr_lptim2lpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb4lpenr_lptim2lpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb4lpenr_lptim2lpen_en ),
  .din  (nxt_rcc_c2_apb4lpenr_lptim2lpen),
  .dout (cur_rcc_c2_apb4lpenr_lptim2lpen)
);

// --------------------------------------------------------------------------------
// 7:7                 i2c4lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4lpenr_i2c4lpen_en  = (|wr_req & rcc_c2_apb4lpenr_sel);
assign nxt_rcc_c2_apb4lpenr_i2c4lpen = wdata[7:7]                      ;
assign rcc_c2_i2c4lp_en              = cur_rcc_c2_apb4lpenr_i2c4lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb4lpenr_i2c4lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb4lpenr_i2c4lpen_en ),
  .din  (nxt_rcc_c2_apb4lpenr_i2c4lpen),
  .dout (cur_rcc_c2_apb4lpenr_i2c4lpen)
);

// --------------------------------------------------------------------------------
// 5:5                 spi6lpen            RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4lpenr_spi6lpen_en  = (|wr_req & rcc_c2_apb4lpenr_sel);
assign nxt_rcc_c2_apb4lpenr_spi6lpen = wdata[5:5]                      ;
assign rcc_c2_spi6lp_en              = cur_rcc_c2_apb4lpenr_spi6lpen   ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb4lpenr_spi6lpen (
  .clk  (clk                          ),
  .rst_n(rst_n                        ),
  .en   (rcc_c2_apb4lpenr_spi6lpen_en ),
  .din  (nxt_rcc_c2_apb4lpenr_spi6lpen),
  .dout (cur_rcc_c2_apb4lpenr_spi6lpen)
);

// --------------------------------------------------------------------------------
// 3:3                 lpuart1lpen         RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4lpenr_lpuart1lpen_en  = (|wr_req & rcc_c2_apb4lpenr_sel);
assign nxt_rcc_c2_apb4lpenr_lpuart1lpen = wdata[3:3]                      ;
assign rcc_c2_lpuart1lp_en              = cur_rcc_c2_apb4lpenr_lpuart1lpen;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb4lpenr_lpuart1lpen (
  .clk  (clk                             ),
  .rst_n(rst_n                           ),
  .en   (rcc_c2_apb4lpenr_lpuart1lpen_en ),
  .din  (nxt_rcc_c2_apb4lpenr_lpuart1lpen),
  .dout (cur_rcc_c2_apb4lpenr_lpuart1lpen)
);

// --------------------------------------------------------------------------------
// 1:1                 syscfglpen          RW                  0b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_apb4lpenr_syscfglpen_en  = (|wr_req & rcc_c2_apb4lpenr_sel);
assign nxt_rcc_c2_apb4lpenr_syscfglpen = wdata[1:1]                      ;
assign rcc_c2_syscfglp_en              = cur_rcc_c2_apb4lpenr_syscfglpen ;
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h1)
) U_rcc_c2_apb4lpenr_syscfglpen (
  .clk  (clk                            ),
  .rst_n(rst_n                          ),
  .en   (rcc_c2_apb4lpenr_syscfglpen_en ),
  .din  (nxt_rcc_c2_apb4lpenr_syscfglpen),
  .dout (cur_rcc_c2_apb4lpenr_syscfglpen)
);


endmodule
