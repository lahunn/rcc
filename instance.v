// rcc_reg Parameters
parameter AW  = 32  ;
parameter DW  = 32  ;
parameter WW  = DW/8;

// rcc_reg Inputs
reg   clk;
reg   rst_n;
reg   req;
reg   [WW-1:0]  we;
reg   [AW-1:0]  addr;
reg   [DW-1:0]  wdata;
reg   pll3_rdy;
reg   pll2_rdy;
reg   pll1_rdy;
reg   hse_rdy;
reg   d2_clk_rdy;
reg   d1_clk_rdy;
reg   hsi48_rdy;
reg   csi_rdy;
reg   hsi_rdy;
reg   [7:0]  flash_csi_opt;
reg   [11:0]  flash_hsi_opt;
reg   [9:0]  crs_hsi48_trim;
reg   rcc_sys_stop;
reg   rcc_hsecss_fail;
reg   rcc_exit_sys_stop;
reg   rcc_lsecss_fail;
reg   cur_rcc_bdcr_bdrst;
reg   cur_rcc_bdcr_rtcen;
reg   [1:0]  cur_rcc_bdcr_rtcsel;
reg   cur_rcc_bdcr_lsecssd;
reg   cur_rcc_bdcr_lsecsson;
reg   [1:0]  cur_rcc_bdcr_lsedrv;
reg   cur_rcc_bdcr_lsebyp;
reg   cur_rcc_bdcr_lserdy;
reg   cur_rcc_bdcr_lseon;
reg   cur_rcc_c1_rsr_lpwr2rstf;
reg   cur_rcc_c1_rsr_lpwr1rstf;
reg   cur_rcc_c1_rsr_wwdg2rstf;
reg   cur_rcc_c1_rsr_wwdg1rstf;
reg   cur_rcc_c1_rsr_iwdg2rstf;
reg   cur_rcc_c1_rsr_iwdg1rstf;
reg   cur_rcc_c1_rsr_sft2rstf;
reg   cur_rcc_c1_rsr_sft1rstf;
reg   cur_rcc_c1_rsr_porrstf;
reg   cur_rcc_c1_rsr_pinrstf;
reg   cur_rcc_c1_rsr_borrstf;
reg   cur_rcc_c1_rsr_d2rstf;
reg   cur_rcc_c1_rsr_d1rstf;
reg   cur_rcc_c1_rsr_oblrstf;
reg   cur_rcc_c1_rsr_rmvf;
reg   cur_rcc_c2_rsr_lpwr2rstf;
reg   cur_rcc_c2_rsr_lpwr1rstf;
reg   cur_rcc_c2_rsr_wwdg2rstf;
reg   cur_rcc_c2_rsr_wwdg1rstf;
reg   cur_rcc_c2_rsr_iwdg2rstf;
reg   cur_rcc_c2_rsr_iwdg1rstf;
reg   cur_rcc_c2_rsr_sft2rstf;
reg   cur_rcc_c2_rsr_sft1rstf;
reg   cur_rcc_c2_rsr_porrstf;
reg   cur_rcc_c2_rsr_pinrstf;
reg   cur_rcc_c2_rsr_borrstf;
reg   cur_rcc_c2_rsr_d2rstf;
reg   cur_rcc_c2_rsr_d1rstf;
reg   cur_rcc_c2_rsr_oblrstf;
reg   cur_rcc_c2_rsr_rmvf;
reg   cur_rcc_csr_lsirdy;
reg   cur_rcc_csr_lsion;

// rcc_reg Outputs
wire  [DW-1:0]  rdata;
wire  [1:0]  rsp;
wire  pll3on;
wire  pll2on;
wire  pll1on;
wire  hsecsson;
wire  hsebyp;
wire  hseon;
wire  hsi48on;
wire  csikeron;
wire  csion;
wire  [1:0]  hsidiv;
wire  hsikeron;
wire  hsion;
wire  [4:0]  csitrim;
wire  [5:0]  hsitrim;
wire  [2:0]  mco2sel;
wire  [3:0]  mco2pre;
wire  [2:0]  mco1sel;
wire  [3:0]  mco1pre;
wire  timpre;
wire  hrtimsel;
wire  [5:0]  rtcpre;
wire  stopkerwuck;
wire  stopwuck;
wire  [2:0]  sw;
wire  [3:0]  d1cpre;
wire  [2:0]  d1ppre;
wire  [3:0]  hpre;
wire  [2:0]  d2ppre2;
wire  [2:0]  d2ppre1;
wire  [2:0]  d3ppre;
wire  [5:0]  divm3;
wire  [5:0]  divm2;
wire  [5:0]  divm1;
wire  [1:0]  pllsrc;
wire  divr3en;
wire  divq3en;
wire  divp3en;
wire  divr2en;
wire  divq2en;
wire  divp2en;
wire  divr1en;
wire  divq1en;
wire  divp1en;
wire  [1:0]  pll3rge;
wire  pll3vcosel;
wire  pll3fracen;
wire  [1:0]  pll2rge;
wire  pll2vcosel;
wire  pll2fracen;
wire  [1:0]  pll1rge;
wire  pll1vcosel;
wire  pll1fracen;
wire  [6:0]  divr1;
wire  [6:0]  divq1;
wire  [6:0]  divp1;
wire  [8:0]  divn1;
wire  [12:0]  fracn1;
wire  [6:0]  divr2;
wire  [6:0]  divq2;
wire  [6:0]  divp2;
wire  [8:0]  divn2;
wire  [12:0]  fracn2;
wire  [6:0]  divr3;
wire  [6:0]  divq3;
wire  [6:0]  divp3;
wire  [8:0]  divn3;
wire  [12:0]  fracn3;
wire  [1:0]  clkpersel;
wire  sdmmcsel;
wire  dsisel;
wire  [1:0]  qspisel;
wire  [1:0]  fmcsel;
wire  swpsel;
wire  [1:0]  fdcansel;
wire  dfsdm1sel;
wire  [1:0]  spdifsel;
wire  [2:0]  spi45sel;
wire  [2:0]  spi123sel;
wire  [2:0]  sai23sel;
wire  [1:0]  sai1sel;
wire  [2:0]  lptim1sel;
wire  [1:0]  cecsel;
wire  [1:0]  usbsel;
wire  [1:0]  i2c123sel;
wire  [1:0]  rngsel;
wire  [2:0]  usart16sel;
wire  [2:0]  usart234578sel;
wire  [2:0]  spi6sel;
wire  [2:0]  sai4bsel;
wire  [2:0]  sai4asel;
wire  [1:0]  adcsel;
wire  [2:0]  lptim345sel;
wire  [2:0]  lptim2sel;
wire  [1:0]  i2c4sel;
wire  [2:0]  lpuart1sel;
wire  lsecssie;
wire  pll3rdyie;
wire  pll2rdyie;
wire  pll1rdyie;
wire  hsi48rdyie;
wire  csirdyie;
wire  hserdyie;
wire  hsirdyie;
wire  lserdyie;
wire  lsirdyie;
wire  sdmmc1rst;
wire  qspirst;
wire  fmcrst;
wire  jpgdecrst;
wire  dma2drst;
wire  mdmarst;
wire  usb2otgrst;
wire  usb1otgrst;
wire  eth1macrst;
wire  adc12rst;
wire  dma2rst;
wire  dma1rst;
wire  sdmmc2rst;
wire  rngrst;
wire  hashrst;
wire  cryptrst;
wire  dcmirst;
wire  hsemrst;
wire  adc3rst;
wire  bdmarst;
wire  crcrst;
wire  gpiokrst;
wire  gpiojrst;
wire  gpioirst;
wire  gpiohrst;
wire  gpiogrst;
wire  gpiofrst;
wire  gpioerst;
wire  gpiodrst;
wire  gpiocrst;
wire  gpiobrst;
wire  gpioarst;
wire  ltdcrst;
wire  uart8rst;
wire  uart7rst;
wire  dac12rst;
wire  hdmicecrst;
wire  i2c3rst;
wire  i2c2rst;
wire  i2c1rst;
wire  uart5rst;
wire  uart4rst;
wire  usart3rst;
wire  usart2rst;
wire  spdifrxrst;
wire  spi3rst;
wire  spi2rst;
wire  lptim1rst;
wire  tim14rst;
wire  tim13rst;
wire  tim12rst;
wire  tim7rst;
wire  tim6rst;
wire  tim5rst;
wire  tim4rst;
wire  tim3rst;
wire  tim2rst;
wire  fdcanrst;
wire  mdiosrst;
wire  opamprst;
wire  swprst;
wire  crsrst;
wire  hrtimrst;
wire  dfsdm1rst;
wire  sai3rst;
wire  sai2rst;
wire  sai1rst;
wire  spi5rst;
wire  tim17rst;
wire  tim16rst;
wire  tim15rst;
wire  spi4rst;
wire  spi1rst;
wire  usart6rst;
wire  usart1rst;
wire  tim8rst;
wire  tim1rst;
wire  sai4rst;
wire  vrefrst;
wire  comp12rst;
wire  lptim5rst;
wire  lptim4rst;
wire  lptim3rst;
wire  lptim2rst;
wire  i2c4rst;
wire  spi6rst;
wire  lpuart1rst;
wire  syscfgrst;
wire  ww2rsc;
wire  ww1rsc;
wire  rcc_sram4_amen;
wire  rcc_bkpram_amen;
wire  rcc_adc3_amen;
wire  rcc_sai4_amen;
wire  rcc_crc_amen;
wire  rcc_rtc_amen;
wire  rcc_vref_amen;
wire  rcc_comp12_amen;
wire  rcc_lptim5_amen;
wire  rcc_lptim4_amen;
wire  rcc_lptim3_amen;
wire  rcc_lptim2_amen;
wire  rcc_i2c4_amen;
wire  rcc_spi6_amen;
wire  rcc_lpuart1_amen;
wire  rcc_bdma_amen;
wire  rcc_c1_axisram_en;
wire  rcc_c1_itcm_en;
wire  rcc_c1_dtcm2_en;
wire  rcc_c1_dtcm1_en;
wire  rcc_c1_sdmmc1_en;
wire  rcc_c1_qspi_en;
wire  rcc_c1_fmc_en;
wire  rcc_c1_flitf_en;
wire  rcc_c1_jpgdec_en;
wire  rcc_c1_dma2d_en;
wire  rcc_c1_mdma_en;
wire  rcc_c1_usb2ulpi_en;
wire  rcc_c1_usb2otg_en;
wire  rcc_c1_usb1ulpi_en;
wire  rcc_c1_usb1otg_en;
wire  rcc_c1_eth1rx_en;
wire  rcc_c1_eth1tx_en;
wire  rcc_c1_eth1mac_en;
wire  rcc_c1_adc12_en;
wire  rcc_c1_dma2_en;
wire  rcc_c1_dma1_en;
wire  rcc_c1_sram3_en;
wire  rcc_c1_sram2_en;
wire  rcc_c1_sram1_en;
wire  rcc_c1_sdmmc2_en;
wire  rcc_c1_rng_en;
wire  rcc_c1_hash_en;
wire  rcc_c1_crypt_en;
wire  rcc_c1_dcmi_en;
wire  rcc_c1_bkpram_en;
wire  rcc_c1_hsem_en;
wire  rcc_c1_adc3_en;
wire  rcc_c1_bdma_en;
wire  rcc_c1_crc_en;
wire  rcc_c1_gpiok_en;
wire  rcc_c1_gpioj_en;
wire  rcc_c1_gpioi_en;
wire  rcc_c1_gpioh_en;
wire  rcc_c1_gpiog_en;
wire  rcc_c1_gpiof_en;
wire  rcc_c1_gpioe_en;
wire  rcc_c1_gpiod_en;
wire  rcc_c1_gpioc_en;
wire  rcc_c1_gpiob_en;
wire  rcc_c1_gpioa_en;
wire  rcc_c1_wwdg1_en;
wire  rcc_c1_ltdc_en;
wire  rcc_c1_uart8_en;
wire  rcc_c1_uart7_en;
wire  rcc_c1_dac12_en;
wire  rcc_c1_hdmicec_en;
wire  rcc_c1_i2c3_en;
wire  rcc_c1_i2c2_en;
wire  rcc_c1_i2c1_en;
wire  rcc_c1_uart5_en;
wire  rcc_c1_uart4_en;
wire  rcc_c1_usart3_en;
wire  rcc_c1_usart2_en;
wire  rcc_c1_spdifrx_en;
wire  rcc_c1_spi3_en;
wire  rcc_c1_spi2_en;
wire  rcc_c1_wwdg2_en;
wire  rcc_c1_lptim1_en;
wire  rcc_c1_tim14_en;
wire  rcc_c1_tim13_en;
wire  rcc_c1_tim12_en;
wire  rcc_c1_tim7_en;
wire  rcc_c1_tim6_en;
wire  rcc_c1_tim5_en;
wire  rcc_c1_tim4_en;
wire  rcc_c1_tim3_en;
wire  rcc_c1_tim2_en;
wire  rcc_c1_fdcan_en;
wire  rcc_c1_mdios_en;
wire  rcc_c1_opamp_en;
wire  rcc_c1_swp_en;
wire  rcc_c1_crs_en;
wire  rcc_c1_hrtim_en;
wire  rcc_c1_dfsdm1_en;
wire  rcc_c1_sai3_en;
wire  rcc_c1_sai2_en;
wire  rcc_c1_sai1_en;
wire  rcc_c1_spi5_en;
wire  rcc_c1_tim17_en;
wire  rcc_c1_tim16_en;
wire  rcc_c1_tim15_en;
wire  rcc_c1_spi4_en;
wire  rcc_c1_spi1_en;
wire  rcc_c1_usart6_en;
wire  rcc_c1_usart1_en;
wire  rcc_c1_tim8_en;
wire  rcc_c1_tim1_en;
wire  rcc_c1_sai4_en;
wire  rcc_c1_rtcapb_en;
wire  rcc_c1_vref_en;
wire  rcc_c1_comp12_en;
wire  rcc_c1_lptim5_en;
wire  rcc_c1_lptim4_en;
wire  rcc_c1_lptim3_en;
wire  rcc_c1_lptim2_en;
wire  rcc_c1_i2c4_en;
wire  rcc_c1_spi6_en;
wire  rcc_c1_lpuart1_en;
wire  rcc_c1_syscfg_en;
wire  rcc_c1_axisram_lpen;
wire  rcc_c1_itcm_lpen;
wire  rcc_c1_dtcm2_lpen;
wire  rcc_c1_dtcm1_lpen;
wire  rcc_c1_sdmmc1_lpen;
wire  rcc_c1_qspi_lpen;
wire  rcc_c1_fmc_lpen;
wire  rcc_c1_flitf_lpen;
wire  rcc_c1_jpgdec_lpen;
wire  rcc_c1_dma2d_lpen;
wire  rcc_c1_mdma_lpen;
wire  rcc_c1_usb2ulpi_lpen;
wire  rcc_c1_usb2otg_lpen;
wire  rcc_c1_usb1ulpi_lpen;
wire  rcc_c1_usb1otg_lpen;
wire  rcc_c1_eth1rx_lpen;
wire  rcc_c1_eth1tx_lpen;
wire  rcc_c1_eth1mac_lpen;
wire  rcc_c1_adc12_lpen;
wire  rcc_c1_dma2_lpen;
wire  rcc_c1_dma1_lpen;
wire  rcc_c1_sram3_lpen;
wire  rcc_c1_sram2_lpen;
wire  rcc_c1_sram1_lpen;
wire  rcc_c1_sdmmc2_lpen;
wire  rcc_c1_rng_lpen;
wire  rcc_c1_hash_lpen;
wire  rcc_c1_crypt_lpen;
wire  rcc_c1_dcmi_lpen;
wire  rcc_c1_sram4_lpen;
wire  rcc_c1_bkpram_lpen;
wire  rcc_c1_adc3_lpen;
wire  rcc_c1_bdma_lpen;
wire  rcc_c1_crc_lpen;
wire  rcc_c1_gpiok_lpen;
wire  rcc_c1_gpioj_lpen;
wire  rcc_c1_gpioi_lpen;
wire  rcc_c1_gpioh_lpen;
wire  rcc_c1_gpiog_lpen;
wire  rcc_c1_gpiof_lpen;
wire  rcc_c1_gpioe_lpen;
wire  rcc_c1_gpiod_lpen;
wire  rcc_c1_gpioc_lpen;
wire  rcc_c1_gpiob_lpen;
wire  rcc_c1_gpioa_lpen;
wire  rcc_c1_wwdg1_lpen;
wire  rcc_c1_ltdc_lpen;
wire  rcc_c1_uart8_lpen;
wire  rcc_c1_uart7_lpen;
wire  rcc_c1_dac12_lpen;
wire  rcc_c1_hdmicec_lpen;
wire  rcc_c1_i2c3_lpen;
wire  rcc_c1_i2c2_lpen;
wire  rcc_c1_i2c1_lpen;
wire  rcc_c1_uart5_lpen;
wire  rcc_c1_uart4_lpen;
wire  rcc_c1_usart3_lpen;
wire  rcc_c1_usart2_lpen;
wire  rcc_c1_spdifrx_lpen;
wire  rcc_c1_spi3_lpen;
wire  rcc_c1_spi2_lpen;
wire  rcc_c1_wwdg2_lpen;
wire  rcc_c1_lptim1_lpen;
wire  rcc_c1_tim14_lpen;
wire  rcc_c1_tim13_lpen;
wire  rcc_c1_tim12_lpen;
wire  rcc_c1_tim7_lpen;
wire  rcc_c1_tim6_lpen;
wire  rcc_c1_tim5_lpen;
wire  rcc_c1_tim4_lpen;
wire  rcc_c1_tim3_lpen;
wire  rcc_c1_tim2_lpen;
wire  rcc_c1_fdcan_lpen;
wire  rcc_c1_mdios_lpen;
wire  rcc_c1_opamp_lpen;
wire  rcc_c1_swp_lpen;
wire  rcc_c1_crs_lpen;
wire  rcc_c1_hrtim_lpen;
wire  rcc_c1_dfsdm1_lpen;
wire  rcc_c1_sai3_lpen;
wire  rcc_c1_sai2_lpen;
wire  rcc_c1_sai1_lpen;
wire  rcc_c1_spi5_lpen;
wire  rcc_c1_tim17_lpen;
wire  rcc_c1_tim16_lpen;
wire  rcc_c1_tim15_lpen;
wire  rcc_c1_spi4_lpen;
wire  rcc_c1_spi1_lpen;
wire  rcc_c1_usart6_lpen;
wire  rcc_c1_usart1_lpen;
wire  rcc_c1_tim8_lpen;
wire  rcc_c1_tim1_lpen;
wire  rcc_c1_sai4_lpen;
wire  rcc_c1_rtcapb_lpen;
wire  rcc_c1_vref_lpen;
wire  rcc_c1_comp12_lpen;
wire  rcc_c1_lptim5_lpen;
wire  rcc_c1_lptim4_lpen;
wire  rcc_c1_lptim3_lpen;
wire  rcc_c1_lptim2_lpen;
wire  rcc_c1_i2c4_lpen;
wire  rcc_c1_spi6_lpen;
wire  rcc_c1_lpuart1_lpen;
wire  rcc_c1_syscfg_lpen;
wire  rcc_c2_axisram_en;
wire  rcc_c2_itcm_en;
wire  rcc_c2_dtcm2_en;
wire  rcc_c2_dtcm1_en;
wire  rcc_c2_sdmmc1_en;
wire  rcc_c2_qspi_en;
wire  rcc_c2_fmc_en;
wire  rcc_c2_flitf_en;
wire  rcc_c2_jpgdec_en;
wire  rcc_c2_dma2d_en;
wire  rcc_c2_mdma_en;
wire  rcc_c2_usb2ulpi_en;
wire  rcc_c2_usb2otg_en;
wire  rcc_c2_usb1ulpi_en;
wire  rcc_c2_usb1otg_en;
wire  rcc_c2_eth1rx_en;
wire  rcc_c2_eth1tx_en;
wire  rcc_c2_eth1mac_en;
wire  rcc_c2_adc12_en;
wire  rcc_c2_dma2_en;
wire  rcc_c2_dma1_en;
wire  rcc_c2_sram3_en;
wire  rcc_c2_sram2_en;
wire  rcc_c2_sram1_en;
wire  rcc_c2_sdmmc2_en;
wire  rcc_c2_rng_en;
wire  rcc_c2_hash_en;
wire  rcc_c2_crypt_en;
wire  rcc_c2_dcmi_en;
wire  rcc_c2_bkpram_en;
wire  rcc_c2_hsem_en;
wire  rcc_c2_adc3_en;
wire  rcc_c2_bdma_en;
wire  rcc_c2_crc_en;
wire  rcc_c2_gpiok_en;
wire  rcc_c2_gpioj_en;
wire  rcc_c2_gpioi_en;
wire  rcc_c2_gpioh_en;
wire  rcc_c2_gpiog_en;
wire  rcc_c2_gpiof_en;
wire  rcc_c2_gpioe_en;
wire  rcc_c2_gpiod_en;
wire  rcc_c2_gpioc_en;
wire  rcc_c2_gpiob_en;
wire  rcc_c2_gpioa_en;
wire  rcc_c2_wwdg1_en;
wire  rcc_c2_ltdc_en;
wire  rcc_c2_uart8_en;
wire  rcc_c2_uart7_en;
wire  rcc_c2_dac12_en;
wire  rcc_c2_hdmicec_en;
wire  rcc_c2_i2c3_en;
wire  rcc_c2_i2c2_en;
wire  rcc_c2_i2c1_en;
wire  rcc_c2_uart5_en;
wire  rcc_c2_uart4_en;
wire  rcc_c2_usart3_en;
wire  rcc_c2_usart2_en;
wire  rcc_c2_spdifrx_en;
wire  rcc_c2_spi3_en;
wire  rcc_c2_spi2_en;
wire  rcc_c2_wwdg2_en;
wire  rcc_c2_lptim1_en;
wire  rcc_c2_tim14_en;
wire  rcc_c2_tim13_en;
wire  rcc_c2_tim12_en;
wire  rcc_c2_tim7_en;
wire  rcc_c2_tim6_en;
wire  rcc_c2_tim5_en;
wire  rcc_c2_tim4_en;
wire  rcc_c2_tim3_en;
wire  rcc_c2_tim2_en;
wire  rcc_c2_fdcan_en;
wire  rcc_c2_mdios_en;
wire  rcc_c2_opamp_en;
wire  rcc_c2_swp_en;
wire  rcc_c2_crs_en;
wire  rcc_c2_hrtim_en;
wire  rcc_c2_dfsdm1_en;
wire  rcc_c2_sai3_en;
wire  rcc_c2_sai2_en;
wire  rcc_c2_sai1_en;
wire  rcc_c2_spi5_en;
wire  rcc_c2_tim17_en;
wire  rcc_c2_tim16_en;
wire  rcc_c2_tim15_en;
wire  rcc_c2_spi4_en;
wire  rcc_c2_spi1_en;
wire  rcc_c2_usart6_en;
wire  rcc_c2_usart1_en;
wire  rcc_c2_tim8_en;
wire  rcc_c2_tim1_en;
wire  rcc_c2_sai4_en;
wire  rcc_c2_rtcapb_en;
wire  rcc_c2_vref_en;
wire  rcc_c2_comp12_en;
wire  rcc_c2_lptim5_en;
wire  rcc_c2_lptim4_en;
wire  rcc_c2_lptim3_en;
wire  rcc_c2_lptim2_en;
wire  rcc_c2_i2c4_en;
wire  rcc_c2_spi6_en;
wire  rcc_c2_lpuart1_en;
wire  rcc_c2_syscfg_en;
wire  rcc_c2_axisram_lpen;
wire  rcc_c2_itcm_lpen;
wire  rcc_c2_dtcm2_lpen;
wire  rcc_c2_dtcm1_lpen;
wire  rcc_c2_sdmmc1_lpen;
wire  rcc_c2_qspi_lpen;
wire  rcc_c2_fmc_lpen;
wire  rcc_c2_flitf_lpen;
wire  rcc_c2_jpgdec_lpen;
wire  rcc_c2_dma2d_lpen;
wire  rcc_c2_mdma_lpen;
wire  rcc_c2_usb2ulpi_lpen;
wire  rcc_c2_usb2otg_lpen;
wire  rcc_c2_usb1ulpi_lpen;
wire  rcc_c2_usb1otg_lpen;
wire  rcc_c2_eth1rx_lpen;
wire  rcc_c2_eth1tx_lpen;
wire  rcc_c2_eth1mac_lpen;
wire  rcc_c2_adc12_lpen;
wire  rcc_c2_dma2_lpen;
wire  rcc_c2_dma1_lpen;
wire  rcc_c2_sram3_lpen;
wire  rcc_c2_sram2_lpen;
wire  rcc_c2_sram1_lpen;
wire  rcc_c2_sdmmc2_lpen;
wire  rcc_c2_rng_lpen;
wire  rcc_c2_hash_lpen;
wire  rcc_c2_crypt_lpen;
wire  rcc_c2_dcmi_lpen;
wire  rcc_c2_sram4_lpen;
wire  rcc_c2_bkpram_lpen;
wire  rcc_c2_adc3_lpen;
wire  rcc_c2_bdma_lpen;
wire  rcc_c2_crc_lpen;
wire  rcc_c2_gpiok_lpen;
wire  rcc_c2_gpioj_lpen;
wire  rcc_c2_gpioi_lpen;
wire  rcc_c2_gpioh_lpen;
wire  rcc_c2_gpiog_lpen;
wire  rcc_c2_gpiof_lpen;
wire  rcc_c2_gpioe_lpen;
wire  rcc_c2_gpiod_lpen;
wire  rcc_c2_gpioc_lpen;
wire  rcc_c2_gpiob_lpen;
wire  rcc_c2_gpioa_lpen;
wire  rcc_c2_wwdg1_lpen;
wire  rcc_c2_ltdc_lpen;
wire  rcc_c2_uart8_lpen;
wire  rcc_c2_uart7_lpen;
wire  rcc_c2_dac12_lpen;
wire  rcc_c2_hdmicec_lpen;
wire  rcc_c2_i2c3_lpen;
wire  rcc_c2_i2c2_lpen;
wire  rcc_c2_i2c1_lpen;
wire  rcc_c2_uart5_lpen;
wire  rcc_c2_uart4_lpen;
wire  rcc_c2_usart3_lpen;
wire  rcc_c2_usart2_lpen;
wire  rcc_c2_spdifrx_lpen;
wire  rcc_c2_spi3_lpen;
wire  rcc_c2_spi2_lpen;
wire  rcc_c2_wwdg2_lpen;
wire  rcc_c2_lptim1_lpen;
wire  rcc_c2_tim14_lpen;
wire  rcc_c2_tim13_lpen;
wire  rcc_c2_tim12_lpen;
wire  rcc_c2_tim7_lpen;
wire  rcc_c2_tim6_lpen;
wire  rcc_c2_tim5_lpen;
wire  rcc_c2_tim4_lpen;
wire  rcc_c2_tim3_lpen;
wire  rcc_c2_tim2_lpen;
wire  rcc_c2_fdcan_lpen;
wire  rcc_c2_mdios_lpen;
wire  rcc_c2_opamp_lpen;
wire  rcc_c2_swp_lpen;
wire  rcc_c2_crs_lpen;
wire  rcc_c2_hrtim_lpen;
wire  rcc_c2_dfsdm1_lpen;
wire  rcc_c2_sai3_lpen;
wire  rcc_c2_sai2_lpen;
wire  rcc_c2_sai1_lpen;
wire  rcc_c2_spi5_lpen;
wire  rcc_c2_tim17_lpen;
wire  rcc_c2_tim16_lpen;
wire  rcc_c2_tim15_lpen;
wire  rcc_c2_spi4_lpen;
wire  rcc_c2_spi1_lpen;
wire  rcc_c2_usart6_lpen;
wire  rcc_c2_usart1_lpen;
wire  rcc_c2_tim8_lpen;
wire  rcc_c2_tim1_lpen;
wire  rcc_c2_sai4_lpen;
wire  rcc_c2_rtcapb_lpen;
wire  rcc_c2_vref_lpen;
wire  rcc_c2_comp12_lpen;
wire  rcc_c2_lptim5_lpen;
wire  rcc_c2_lptim4_lpen;
wire  rcc_c2_lptim3_lpen;
wire  rcc_c2_lptim2_lpen;
wire  rcc_c2_i2c4_lpen;
wire  rcc_c2_spi6_lpen;
wire  rcc_c2_lpuart1_lpen;
wire  rcc_c2_syscfg_lpen;
wire  nxt_rcc_bdcr_bdrst;
wire  nxt_rcc_bdcr_rtcen;
wire  [1:0]  nxt_rcc_bdcr_rtcsel;
wire  nxt_rcc_bdcr_lsecsson;
wire  [1:0]  nxt_rcc_bdcr_lsedrv;
wire  nxt_rcc_bdcr_lsebyp;
wire  nxt_rcc_bdcr_lseon;
wire  rcc_c1_rsr_rmvf_wren;
wire  rcc_c2_rsr_rmvf_wren;
wire  rcc_csr_lsion_wren;
wire  rcc_bdcr_byte2_wren;
wire  rcc_bdcr_byte1_wren;
wire  rcc_bdcr_byte0_wren;

rcc_reg #(
    .AW ( 32   ),
    .DW ( 32   ),
    .WW ( DW/8 ))
 u_rcc_reg (
    .clk                       ( clk                        ),
    .rst_n                     ( rst_n                      ),
    .req                       ( req                        ),
    .we                        ( we                         ),
    .addr                      ( addr                       ),
    .wdata                     ( wdata                      ),
    .pll3_rdy                  ( pll3_rdy                   ),
    .pll2_rdy                  ( pll2_rdy                   ),
    .pll1_rdy                  ( pll1_rdy                   ),
    .hse_rdy                   ( hse_rdy                    ),
    .d2_clk_rdy                ( d2_clk_rdy                 ),
    .d1_clk_rdy                ( d1_clk_rdy                 ),
    .hsi48_rdy                 ( hsi48_rdy                  ),
    .csi_rdy                   ( csi_rdy                    ),
    .hsi_rdy                   ( hsi_rdy                    ),
    .flash_csi_opt             ( flash_csi_opt              ),
    .flash_hsi_opt             ( flash_hsi_opt              ),
    .crs_hsi48_trim            ( crs_hsi48_trim             ),
    .rcc_sys_stop              ( rcc_sys_stop               ),
    .rcc_hsecss_fail           ( rcc_hsecss_fail            ),
    .rcc_exit_sys_stop         ( rcc_exit_sys_stop          ),
    .rcc_lsecss_fail           ( rcc_lsecss_fail            ),
    .cur_rcc_bdcr_bdrst        ( cur_rcc_bdcr_bdrst         ),
    .cur_rcc_bdcr_rtcen        ( cur_rcc_bdcr_rtcen         ),
    .cur_rcc_bdcr_rtcsel       ( cur_rcc_bdcr_rtcsel        ),
    .cur_rcc_bdcr_lsecssd      ( cur_rcc_bdcr_lsecssd       ),
    .cur_rcc_bdcr_lsecsson     ( cur_rcc_bdcr_lsecsson      ),
    .cur_rcc_bdcr_lsedrv       ( cur_rcc_bdcr_lsedrv        ),
    .cur_rcc_bdcr_lsebyp       ( cur_rcc_bdcr_lsebyp        ),
    .cur_rcc_bdcr_lserdy       ( cur_rcc_bdcr_lserdy        ),
    .cur_rcc_bdcr_lseon        ( cur_rcc_bdcr_lseon         ),
    .cur_rcc_c1_rsr_lpwr2rstf  ( cur_rcc_c1_rsr_lpwr2rstf   ),
    .cur_rcc_c1_rsr_lpwr1rstf  ( cur_rcc_c1_rsr_lpwr1rstf   ),
    .cur_rcc_c1_rsr_wwdg2rstf  ( cur_rcc_c1_rsr_wwdg2rstf   ),
    .cur_rcc_c1_rsr_wwdg1rstf  ( cur_rcc_c1_rsr_wwdg1rstf   ),
    .cur_rcc_c1_rsr_iwdg2rstf  ( cur_rcc_c1_rsr_iwdg2rstf   ),
    .cur_rcc_c1_rsr_iwdg1rstf  ( cur_rcc_c1_rsr_iwdg1rstf   ),
    .cur_rcc_c1_rsr_sft2rstf   ( cur_rcc_c1_rsr_sft2rstf    ),
    .cur_rcc_c1_rsr_sft1rstf   ( cur_rcc_c1_rsr_sft1rstf    ),
    .cur_rcc_c1_rsr_porrstf    ( cur_rcc_c1_rsr_porrstf     ),
    .cur_rcc_c1_rsr_pinrstf    ( cur_rcc_c1_rsr_pinrstf     ),
    .cur_rcc_c1_rsr_borrstf    ( cur_rcc_c1_rsr_borrstf     ),
    .cur_rcc_c1_rsr_d2rstf     ( cur_rcc_c1_rsr_d2rstf      ),
    .cur_rcc_c1_rsr_d1rstf     ( cur_rcc_c1_rsr_d1rstf      ),
    .cur_rcc_c1_rsr_oblrstf    ( cur_rcc_c1_rsr_oblrstf     ),
    .cur_rcc_c1_rsr_rmvf       ( cur_rcc_c1_rsr_rmvf        ),
    .cur_rcc_c2_rsr_lpwr2rstf  ( cur_rcc_c2_rsr_lpwr2rstf   ),
    .cur_rcc_c2_rsr_lpwr1rstf  ( cur_rcc_c2_rsr_lpwr1rstf   ),
    .cur_rcc_c2_rsr_wwdg2rstf  ( cur_rcc_c2_rsr_wwdg2rstf   ),
    .cur_rcc_c2_rsr_wwdg1rstf  ( cur_rcc_c2_rsr_wwdg1rstf   ),
    .cur_rcc_c2_rsr_iwdg2rstf  ( cur_rcc_c2_rsr_iwdg2rstf   ),
    .cur_rcc_c2_rsr_iwdg1rstf  ( cur_rcc_c2_rsr_iwdg1rstf   ),
    .cur_rcc_c2_rsr_sft2rstf   ( cur_rcc_c2_rsr_sft2rstf    ),
    .cur_rcc_c2_rsr_sft1rstf   ( cur_rcc_c2_rsr_sft1rstf    ),
    .cur_rcc_c2_rsr_porrstf    ( cur_rcc_c2_rsr_porrstf     ),
    .cur_rcc_c2_rsr_pinrstf    ( cur_rcc_c2_rsr_pinrstf     ),
    .cur_rcc_c2_rsr_borrstf    ( cur_rcc_c2_rsr_borrstf     ),
    .cur_rcc_c2_rsr_d2rstf     ( cur_rcc_c2_rsr_d2rstf      ),
    .cur_rcc_c2_rsr_d1rstf     ( cur_rcc_c2_rsr_d1rstf      ),
    .cur_rcc_c2_rsr_oblrstf    ( cur_rcc_c2_rsr_oblrstf     ),
    .cur_rcc_c2_rsr_rmvf       ( cur_rcc_c2_rsr_rmvf        ),
    .cur_rcc_csr_lsirdy        ( cur_rcc_csr_lsirdy         ),
    .cur_rcc_csr_lsion         ( cur_rcc_csr_lsion          ),

    .rdata                     ( rdata                      ),
    .rsp                       ( rsp                        ),
    .pll3on                    ( pll3on                     ),
    .pll2on                    ( pll2on                     ),
    .pll1on                    ( pll1on                     ),
    .hsecsson                  ( hsecsson                   ),
    .hsebyp                    ( hsebyp                     ),
    .hseon                     ( hseon                      ),
    .hsi48on                   ( hsi48on                    ),
    .csikeron                  ( csikeron                   ),
    .csion                     ( csion                      ),
    .hsidiv                    ( hsidiv                     ),
    .hsikeron                  ( hsikeron                   ),
    .hsion                     ( hsion                      ),
    .csitrim                   ( csitrim                    ),
    .hsitrim                   ( hsitrim                    ),
    .mco2sel                   ( mco2sel                    ),
    .mco2pre                   ( mco2pre                    ),
    .mco1sel                   ( mco1sel                    ),
    .mco1pre                   ( mco1pre                    ),
    .timpre                    ( timpre                     ),
    .hrtimsel                  ( hrtimsel                   ),
    .rtcpre                    ( rtcpre                     ),
    .stopkerwuck               ( stopkerwuck                ),
    .stopwuck                  ( stopwuck                   ),
    .sw                        ( sw                         ),
    .d1cpre                    ( d1cpre                     ),
    .d1ppre                    ( d1ppre                     ),
    .hpre                      ( hpre                       ),
    .d2ppre2                   ( d2ppre2                    ),
    .d2ppre1                   ( d2ppre1                    ),
    .d3ppre                    ( d3ppre                     ),
    .divm3                     ( divm3                      ),
    .divm2                     ( divm2                      ),
    .divm1                     ( divm1                      ),
    .pllsrc                    ( pllsrc                     ),
    .divr3en                   ( divr3en                    ),
    .divq3en                   ( divq3en                    ),
    .divp3en                   ( divp3en                    ),
    .divr2en                   ( divr2en                    ),
    .divq2en                   ( divq2en                    ),
    .divp2en                   ( divp2en                    ),
    .divr1en                   ( divr1en                    ),
    .divq1en                   ( divq1en                    ),
    .divp1en                   ( divp1en                    ),
    .pll3rge                   ( pll3rge                    ),
    .pll3vcosel                ( pll3vcosel                 ),
    .pll3fracen                ( pll3fracen                 ),
    .pll2rge                   ( pll2rge                    ),
    .pll2vcosel                ( pll2vcosel                 ),
    .pll2fracen                ( pll2fracen                 ),
    .pll1rge                   ( pll1rge                    ),
    .pll1vcosel                ( pll1vcosel                 ),
    .pll1fracen                ( pll1fracen                 ),
    .divr1                     ( divr1                      ),
    .divq1                     ( divq1                      ),
    .divp1                     ( divp1                      ),
    .divn1                     ( divn1                      ),
    .fracn1                    ( fracn1                     ),
    .divr2                     ( divr2                      ),
    .divq2                     ( divq2                      ),
    .divp2                     ( divp2                      ),
    .divn2                     ( divn2                      ),
    .fracn2                    ( fracn2                     ),
    .divr3                     ( divr3                      ),
    .divq3                     ( divq3                      ),
    .divp3                     ( divp3                      ),
    .divn3                     ( divn3                      ),
    .fracn3                    ( fracn3                     ),
    .clkpersel                 ( clkpersel                  ),
    .sdmmcsel                  ( sdmmcsel                   ),
    .dsisel                    ( dsisel                     ),
    .qspisel                   ( qspisel                    ),
    .fmcsel                    ( fmcsel                     ),
    .swpsel                    ( swpsel                     ),
    .fdcansel                  ( fdcansel                   ),
    .dfsdm1sel                 ( dfsdm1sel                  ),
    .spdifsel                  ( spdifsel                   ),
    .spi45sel                  ( spi45sel                   ),
    .spi123sel                 ( spi123sel                  ),
    .sai23sel                  ( sai23sel                   ),
    .sai1sel                   ( sai1sel                    ),
    .lptim1sel                 ( lptim1sel                  ),
    .cecsel                    ( cecsel                     ),
    .usbsel                    ( usbsel                     ),
    .i2c123sel                 ( i2c123sel                  ),
    .rngsel                    ( rngsel                     ),
    .usart16sel                ( usart16sel                 ),
    .usart234578sel            ( usart234578sel             ),
    .spi6sel                   ( spi6sel                    ),
    .sai4bsel                  ( sai4bsel                   ),
    .sai4asel                  ( sai4asel                   ),
    .adcsel                    ( adcsel                     ),
    .lptim345sel               ( lptim345sel                ),
    .lptim2sel                 ( lptim2sel                  ),
    .i2c4sel                   ( i2c4sel                    ),
    .lpuart1sel                ( lpuart1sel                 ),
    .lsecssie                  ( lsecssie                   ),
    .pll3rdyie                 ( pll3rdyie                  ),
    .pll2rdyie                 ( pll2rdyie                  ),
    .pll1rdyie                 ( pll1rdyie                  ),
    .hsi48rdyie                ( hsi48rdyie                 ),
    .csirdyie                  ( csirdyie                   ),
    .hserdyie                  ( hserdyie                   ),
    .hsirdyie                  ( hsirdyie                   ),
    .lserdyie                  ( lserdyie                   ),
    .lsirdyie                  ( lsirdyie                   ),
    .sdmmc1rst                 ( sdmmc1rst                  ),
    .qspirst                   ( qspirst                    ),
    .fmcrst                    ( fmcrst                     ),
    .jpgdecrst                 ( jpgdecrst                  ),
    .dma2drst                  ( dma2drst                   ),
    .mdmarst                   ( mdmarst                    ),
    .usb2otgrst                ( usb2otgrst                 ),
    .usb1otgrst                ( usb1otgrst                 ),
    .eth1macrst                ( eth1macrst                 ),
    .adc12rst                  ( adc12rst                   ),
    .dma2rst                   ( dma2rst                    ),
    .dma1rst                   ( dma1rst                    ),
    .sdmmc2rst                 ( sdmmc2rst                  ),
    .rngrst                    ( rngrst                     ),
    .hashrst                   ( hashrst                    ),
    .cryptrst                  ( cryptrst                   ),
    .dcmirst                   ( dcmirst                    ),
    .hsemrst                   ( hsemrst                    ),
    .adc3rst                   ( adc3rst                    ),
    .bdmarst                   ( bdmarst                    ),
    .crcrst                    ( crcrst                     ),
    .gpiokrst                  ( gpiokrst                   ),
    .gpiojrst                  ( gpiojrst                   ),
    .gpioirst                  ( gpioirst                   ),
    .gpiohrst                  ( gpiohrst                   ),
    .gpiogrst                  ( gpiogrst                   ),
    .gpiofrst                  ( gpiofrst                   ),
    .gpioerst                  ( gpioerst                   ),
    .gpiodrst                  ( gpiodrst                   ),
    .gpiocrst                  ( gpiocrst                   ),
    .gpiobrst                  ( gpiobrst                   ),
    .gpioarst                  ( gpioarst                   ),
    .ltdcrst                   ( ltdcrst                    ),
    .uart8rst                  ( uart8rst                   ),
    .uart7rst                  ( uart7rst                   ),
    .dac12rst                  ( dac12rst                   ),
    .hdmicecrst                ( hdmicecrst                 ),
    .i2c3rst                   ( i2c3rst                    ),
    .i2c2rst                   ( i2c2rst                    ),
    .i2c1rst                   ( i2c1rst                    ),
    .uart5rst                  ( uart5rst                   ),
    .uart4rst                  ( uart4rst                   ),
    .usart3rst                 ( usart3rst                  ),
    .usart2rst                 ( usart2rst                  ),
    .spdifrxrst                ( spdifrxrst                 ),
    .spi3rst                   ( spi3rst                    ),
    .spi2rst                   ( spi2rst                    ),
    .lptim1rst                 ( lptim1rst                  ),
    .tim14rst                  ( tim14rst                   ),
    .tim13rst                  ( tim13rst                   ),
    .tim12rst                  ( tim12rst                   ),
    .tim7rst                   ( tim7rst                    ),
    .tim6rst                   ( tim6rst                    ),
    .tim5rst                   ( tim5rst                    ),
    .tim4rst                   ( tim4rst                    ),
    .tim3rst                   ( tim3rst                    ),
    .tim2rst                   ( tim2rst                    ),
    .fdcanrst                  ( fdcanrst                   ),
    .mdiosrst                  ( mdiosrst                   ),
    .opamprst                  ( opamprst                   ),
    .swprst                    ( swprst                     ),
    .crsrst                    ( crsrst                     ),
    .hrtimrst                  ( hrtimrst                   ),
    .dfsdm1rst                 ( dfsdm1rst                  ),
    .sai3rst                   ( sai3rst                    ),
    .sai2rst                   ( sai2rst                    ),
    .sai1rst                   ( sai1rst                    ),
    .spi5rst                   ( spi5rst                    ),
    .tim17rst                  ( tim17rst                   ),
    .tim16rst                  ( tim16rst                   ),
    .tim15rst                  ( tim15rst                   ),
    .spi4rst                   ( spi4rst                    ),
    .spi1rst                   ( spi1rst                    ),
    .usart6rst                 ( usart6rst                  ),
    .usart1rst                 ( usart1rst                  ),
    .tim8rst                   ( tim8rst                    ),
    .tim1rst                   ( tim1rst                    ),
    .sai4rst                   ( sai4rst                    ),
    .vrefrst                   ( vrefrst                    ),
    .comp12rst                 ( comp12rst                  ),
    .lptim5rst                 ( lptim5rst                  ),
    .lptim4rst                 ( lptim4rst                  ),
    .lptim3rst                 ( lptim3rst                  ),
    .lptim2rst                 ( lptim2rst                  ),
    .i2c4rst                   ( i2c4rst                    ),
    .spi6rst                   ( spi6rst                    ),
    .lpuart1rst                ( lpuart1rst                 ),
    .syscfgrst                 ( syscfgrst                  ),
    .ww2rsc                    ( ww2rsc                     ),
    .ww1rsc                    ( ww1rsc                     ),
    .rcc_sram4_amen            ( rcc_sram4_amen             ),
    .rcc_bkpram_amen           ( rcc_bkpram_amen            ),
    .rcc_adc3_amen             ( rcc_adc3_amen              ),
    .rcc_sai4_amen             ( rcc_sai4_amen              ),
    .rcc_crc_amen              ( rcc_crc_amen               ),
    .rcc_rtc_amen              ( rcc_rtc_amen               ),
    .rcc_vref_amen             ( rcc_vref_amen              ),
    .rcc_comp12_amen           ( rcc_comp12_amen            ),
    .rcc_lptim5_amen           ( rcc_lptim5_amen            ),
    .rcc_lptim4_amen           ( rcc_lptim4_amen            ),
    .rcc_lptim3_amen           ( rcc_lptim3_amen            ),
    .rcc_lptim2_amen           ( rcc_lptim2_amen            ),
    .rcc_i2c4_amen             ( rcc_i2c4_amen              ),
    .rcc_spi6_amen             ( rcc_spi6_amen              ),
    .rcc_lpuart1_amen          ( rcc_lpuart1_amen           ),
    .rcc_bdma_amen             ( rcc_bdma_amen              ),
    .rcc_c1_axisram_en         ( rcc_c1_axisram_en          ),
    .rcc_c1_itcm_en            ( rcc_c1_itcm_en             ),
    .rcc_c1_dtcm2_en           ( rcc_c1_dtcm2_en            ),
    .rcc_c1_dtcm1_en           ( rcc_c1_dtcm1_en            ),
    .rcc_c1_sdmmc1_en          ( rcc_c1_sdmmc1_en           ),
    .rcc_c1_qspi_en            ( rcc_c1_qspi_en             ),
    .rcc_c1_fmc_en             ( rcc_c1_fmc_en              ),
    .rcc_c1_flitf_en           ( rcc_c1_flitf_en            ),
    .rcc_c1_jpgdec_en          ( rcc_c1_jpgdec_en           ),
    .rcc_c1_dma2d_en           ( rcc_c1_dma2d_en            ),
    .rcc_c1_mdma_en            ( rcc_c1_mdma_en             ),
    .rcc_c1_usb2ulpi_en        ( rcc_c1_usb2ulpi_en         ),
    .rcc_c1_usb2otg_en         ( rcc_c1_usb2otg_en          ),
    .rcc_c1_usb1ulpi_en        ( rcc_c1_usb1ulpi_en         ),
    .rcc_c1_usb1otg_en         ( rcc_c1_usb1otg_en          ),
    .rcc_c1_eth1rx_en          ( rcc_c1_eth1rx_en           ),
    .rcc_c1_eth1tx_en          ( rcc_c1_eth1tx_en           ),
    .rcc_c1_eth1mac_en         ( rcc_c1_eth1mac_en          ),
    .rcc_c1_adc12_en           ( rcc_c1_adc12_en            ),
    .rcc_c1_dma2_en            ( rcc_c1_dma2_en             ),
    .rcc_c1_dma1_en            ( rcc_c1_dma1_en             ),
    .rcc_c1_sram3_en           ( rcc_c1_sram3_en            ),
    .rcc_c1_sram2_en           ( rcc_c1_sram2_en            ),
    .rcc_c1_sram1_en           ( rcc_c1_sram1_en            ),
    .rcc_c1_sdmmc2_en          ( rcc_c1_sdmmc2_en           ),
    .rcc_c1_rng_en             ( rcc_c1_rng_en              ),
    .rcc_c1_hash_en            ( rcc_c1_hash_en             ),
    .rcc_c1_crypt_en           ( rcc_c1_crypt_en            ),
    .rcc_c1_dcmi_en            ( rcc_c1_dcmi_en             ),
    .rcc_c1_bkpram_en          ( rcc_c1_bkpram_en           ),
    .rcc_c1_hsem_en            ( rcc_c1_hsem_en             ),
    .rcc_c1_adc3_en            ( rcc_c1_adc3_en             ),
    .rcc_c1_bdma_en            ( rcc_c1_bdma_en             ),
    .rcc_c1_crc_en             ( rcc_c1_crc_en              ),
    .rcc_c1_gpiok_en           ( rcc_c1_gpiok_en            ),
    .rcc_c1_gpioj_en           ( rcc_c1_gpioj_en            ),
    .rcc_c1_gpioi_en           ( rcc_c1_gpioi_en            ),
    .rcc_c1_gpioh_en           ( rcc_c1_gpioh_en            ),
    .rcc_c1_gpiog_en           ( rcc_c1_gpiog_en            ),
    .rcc_c1_gpiof_en           ( rcc_c1_gpiof_en            ),
    .rcc_c1_gpioe_en           ( rcc_c1_gpioe_en            ),
    .rcc_c1_gpiod_en           ( rcc_c1_gpiod_en            ),
    .rcc_c1_gpioc_en           ( rcc_c1_gpioc_en            ),
    .rcc_c1_gpiob_en           ( rcc_c1_gpiob_en            ),
    .rcc_c1_gpioa_en           ( rcc_c1_gpioa_en            ),
    .rcc_c1_wwdg1_en           ( rcc_c1_wwdg1_en            ),
    .rcc_c1_ltdc_en            ( rcc_c1_ltdc_en             ),
    .rcc_c1_uart8_en           ( rcc_c1_uart8_en            ),
    .rcc_c1_uart7_en           ( rcc_c1_uart7_en            ),
    .rcc_c1_dac12_en           ( rcc_c1_dac12_en            ),
    .rcc_c1_hdmicec_en         ( rcc_c1_hdmicec_en          ),
    .rcc_c1_i2c3_en            ( rcc_c1_i2c3_en             ),
    .rcc_c1_i2c2_en            ( rcc_c1_i2c2_en             ),
    .rcc_c1_i2c1_en            ( rcc_c1_i2c1_en             ),
    .rcc_c1_uart5_en           ( rcc_c1_uart5_en            ),
    .rcc_c1_uart4_en           ( rcc_c1_uart4_en            ),
    .rcc_c1_usart3_en          ( rcc_c1_usart3_en           ),
    .rcc_c1_usart2_en          ( rcc_c1_usart2_en           ),
    .rcc_c1_spdifrx_en         ( rcc_c1_spdifrx_en          ),
    .rcc_c1_spi3_en            ( rcc_c1_spi3_en             ),
    .rcc_c1_spi2_en            ( rcc_c1_spi2_en             ),
    .rcc_c1_wwdg2_en           ( rcc_c1_wwdg2_en            ),
    .rcc_c1_lptim1_en          ( rcc_c1_lptim1_en           ),
    .rcc_c1_tim14_en           ( rcc_c1_tim14_en            ),
    .rcc_c1_tim13_en           ( rcc_c1_tim13_en            ),
    .rcc_c1_tim12_en           ( rcc_c1_tim12_en            ),
    .rcc_c1_tim7_en            ( rcc_c1_tim7_en             ),
    .rcc_c1_tim6_en            ( rcc_c1_tim6_en             ),
    .rcc_c1_tim5_en            ( rcc_c1_tim5_en             ),
    .rcc_c1_tim4_en            ( rcc_c1_tim4_en             ),
    .rcc_c1_tim3_en            ( rcc_c1_tim3_en             ),
    .rcc_c1_tim2_en            ( rcc_c1_tim2_en             ),
    .rcc_c1_fdcan_en           ( rcc_c1_fdcan_en            ),
    .rcc_c1_mdios_en           ( rcc_c1_mdios_en            ),
    .rcc_c1_opamp_en           ( rcc_c1_opamp_en            ),
    .rcc_c1_swp_en             ( rcc_c1_swp_en              ),
    .rcc_c1_crs_en             ( rcc_c1_crs_en              ),
    .rcc_c1_hrtim_en           ( rcc_c1_hrtim_en            ),
    .rcc_c1_dfsdm1_en          ( rcc_c1_dfsdm1_en           ),
    .rcc_c1_sai3_en            ( rcc_c1_sai3_en             ),
    .rcc_c1_sai2_en            ( rcc_c1_sai2_en             ),
    .rcc_c1_sai1_en            ( rcc_c1_sai1_en             ),
    .rcc_c1_spi5_en            ( rcc_c1_spi5_en             ),
    .rcc_c1_tim17_en           ( rcc_c1_tim17_en            ),
    .rcc_c1_tim16_en           ( rcc_c1_tim16_en            ),
    .rcc_c1_tim15_en           ( rcc_c1_tim15_en            ),
    .rcc_c1_spi4_en            ( rcc_c1_spi4_en             ),
    .rcc_c1_spi1_en            ( rcc_c1_spi1_en             ),
    .rcc_c1_usart6_en          ( rcc_c1_usart6_en           ),
    .rcc_c1_usart1_en          ( rcc_c1_usart1_en           ),
    .rcc_c1_tim8_en            ( rcc_c1_tim8_en             ),
    .rcc_c1_tim1_en            ( rcc_c1_tim1_en             ),
    .rcc_c1_sai4_en            ( rcc_c1_sai4_en             ),
    .rcc_c1_rtcapb_en          ( rcc_c1_rtcapb_en           ),
    .rcc_c1_vref_en            ( rcc_c1_vref_en             ),
    .rcc_c1_comp12_en          ( rcc_c1_comp12_en           ),
    .rcc_c1_lptim5_en          ( rcc_c1_lptim5_en           ),
    .rcc_c1_lptim4_en          ( rcc_c1_lptim4_en           ),
    .rcc_c1_lptim3_en          ( rcc_c1_lptim3_en           ),
    .rcc_c1_lptim2_en          ( rcc_c1_lptim2_en           ),
    .rcc_c1_i2c4_en            ( rcc_c1_i2c4_en             ),
    .rcc_c1_spi6_en            ( rcc_c1_spi6_en             ),
    .rcc_c1_lpuart1_en         ( rcc_c1_lpuart1_en          ),
    .rcc_c1_syscfg_en          ( rcc_c1_syscfg_en           ),
    .rcc_c1_axisram_lpen       ( rcc_c1_axisram_lpen        ),
    .rcc_c1_itcm_lpen          ( rcc_c1_itcm_lpen           ),
    .rcc_c1_dtcm2_lpen         ( rcc_c1_dtcm2_lpen          ),
    .rcc_c1_dtcm1_lpen         ( rcc_c1_dtcm1_lpen          ),
    .rcc_c1_sdmmc1_lpen        ( rcc_c1_sdmmc1_lpen         ),
    .rcc_c1_qspi_lpen          ( rcc_c1_qspi_lpen           ),
    .rcc_c1_fmc_lpen           ( rcc_c1_fmc_lpen            ),
    .rcc_c1_flitf_lpen         ( rcc_c1_flitf_lpen          ),
    .rcc_c1_jpgdec_lpen        ( rcc_c1_jpgdec_lpen         ),
    .rcc_c1_dma2d_lpen         ( rcc_c1_dma2d_lpen          ),
    .rcc_c1_mdma_lpen          ( rcc_c1_mdma_lpen           ),
    .rcc_c1_usb2ulpi_lpen      ( rcc_c1_usb2ulpi_lpen       ),
    .rcc_c1_usb2otg_lpen       ( rcc_c1_usb2otg_lpen        ),
    .rcc_c1_usb1ulpi_lpen      ( rcc_c1_usb1ulpi_lpen       ),
    .rcc_c1_usb1otg_lpen       ( rcc_c1_usb1otg_lpen        ),
    .rcc_c1_eth1rx_lpen        ( rcc_c1_eth1rx_lpen         ),
    .rcc_c1_eth1tx_lpen        ( rcc_c1_eth1tx_lpen         ),
    .rcc_c1_eth1mac_lpen       ( rcc_c1_eth1mac_lpen        ),
    .rcc_c1_adc12_lpen         ( rcc_c1_adc12_lpen          ),
    .rcc_c1_dma2_lpen          ( rcc_c1_dma2_lpen           ),
    .rcc_c1_dma1_lpen          ( rcc_c1_dma1_lpen           ),
    .rcc_c1_sram3_lpen         ( rcc_c1_sram3_lpen          ),
    .rcc_c1_sram2_lpen         ( rcc_c1_sram2_lpen          ),
    .rcc_c1_sram1_lpen         ( rcc_c1_sram1_lpen          ),
    .rcc_c1_sdmmc2_lpen        ( rcc_c1_sdmmc2_lpen         ),
    .rcc_c1_rng_lpen           ( rcc_c1_rng_lpen            ),
    .rcc_c1_hash_lpen          ( rcc_c1_hash_lpen           ),
    .rcc_c1_crypt_lpen         ( rcc_c1_crypt_lpen          ),
    .rcc_c1_dcmi_lpen          ( rcc_c1_dcmi_lpen           ),
    .rcc_c1_sram4_lpen         ( rcc_c1_sram4_lpen          ),
    .rcc_c1_bkpram_lpen        ( rcc_c1_bkpram_lpen         ),
    .rcc_c1_adc3_lpen          ( rcc_c1_adc3_lpen           ),
    .rcc_c1_bdma_lpen          ( rcc_c1_bdma_lpen           ),
    .rcc_c1_crc_lpen           ( rcc_c1_crc_lpen            ),
    .rcc_c1_gpiok_lpen         ( rcc_c1_gpiok_lpen          ),
    .rcc_c1_gpioj_lpen         ( rcc_c1_gpioj_lpen          ),
    .rcc_c1_gpioi_lpen         ( rcc_c1_gpioi_lpen          ),
    .rcc_c1_gpioh_lpen         ( rcc_c1_gpioh_lpen          ),
    .rcc_c1_gpiog_lpen         ( rcc_c1_gpiog_lpen          ),
    .rcc_c1_gpiof_lpen         ( rcc_c1_gpiof_lpen          ),
    .rcc_c1_gpioe_lpen         ( rcc_c1_gpioe_lpen          ),
    .rcc_c1_gpiod_lpen         ( rcc_c1_gpiod_lpen          ),
    .rcc_c1_gpioc_lpen         ( rcc_c1_gpioc_lpen          ),
    .rcc_c1_gpiob_lpen         ( rcc_c1_gpiob_lpen          ),
    .rcc_c1_gpioa_lpen         ( rcc_c1_gpioa_lpen          ),
    .rcc_c1_wwdg1_lpen         ( rcc_c1_wwdg1_lpen          ),
    .rcc_c1_ltdc_lpen          ( rcc_c1_ltdc_lpen           ),
    .rcc_c1_uart8_lpen         ( rcc_c1_uart8_lpen          ),
    .rcc_c1_uart7_lpen         ( rcc_c1_uart7_lpen          ),
    .rcc_c1_dac12_lpen         ( rcc_c1_dac12_lpen          ),
    .rcc_c1_hdmicec_lpen       ( rcc_c1_hdmicec_lpen        ),
    .rcc_c1_i2c3_lpen          ( rcc_c1_i2c3_lpen           ),
    .rcc_c1_i2c2_lpen          ( rcc_c1_i2c2_lpen           ),
    .rcc_c1_i2c1_lpen          ( rcc_c1_i2c1_lpen           ),
    .rcc_c1_uart5_lpen         ( rcc_c1_uart5_lpen          ),
    .rcc_c1_uart4_lpen         ( rcc_c1_uart4_lpen          ),
    .rcc_c1_usart3_lpen        ( rcc_c1_usart3_lpen         ),
    .rcc_c1_usart2_lpen        ( rcc_c1_usart2_lpen         ),
    .rcc_c1_spdifrx_lpen       ( rcc_c1_spdifrx_lpen        ),
    .rcc_c1_spi3_lpen          ( rcc_c1_spi3_lpen           ),
    .rcc_c1_spi2_lpen          ( rcc_c1_spi2_lpen           ),
    .rcc_c1_wwdg2_lpen         ( rcc_c1_wwdg2_lpen          ),
    .rcc_c1_lptim1_lpen        ( rcc_c1_lptim1_lpen         ),
    .rcc_c1_tim14_lpen         ( rcc_c1_tim14_lpen          ),
    .rcc_c1_tim13_lpen         ( rcc_c1_tim13_lpen          ),
    .rcc_c1_tim12_lpen         ( rcc_c1_tim12_lpen          ),
    .rcc_c1_tim7_lpen          ( rcc_c1_tim7_lpen           ),
    .rcc_c1_tim6_lpen          ( rcc_c1_tim6_lpen           ),
    .rcc_c1_tim5_lpen          ( rcc_c1_tim5_lpen           ),
    .rcc_c1_tim4_lpen          ( rcc_c1_tim4_lpen           ),
    .rcc_c1_tim3_lpen          ( rcc_c1_tim3_lpen           ),
    .rcc_c1_tim2_lpen          ( rcc_c1_tim2_lpen           ),
    .rcc_c1_fdcan_lpen         ( rcc_c1_fdcan_lpen          ),
    .rcc_c1_mdios_lpen         ( rcc_c1_mdios_lpen          ),
    .rcc_c1_opamp_lpen         ( rcc_c1_opamp_lpen          ),
    .rcc_c1_swp_lpen           ( rcc_c1_swp_lpen            ),
    .rcc_c1_crs_lpen           ( rcc_c1_crs_lpen            ),
    .rcc_c1_hrtim_lpen         ( rcc_c1_hrtim_lpen          ),
    .rcc_c1_dfsdm1_lpen        ( rcc_c1_dfsdm1_lpen         ),
    .rcc_c1_sai3_lpen          ( rcc_c1_sai3_lpen           ),
    .rcc_c1_sai2_lpen          ( rcc_c1_sai2_lpen           ),
    .rcc_c1_sai1_lpen          ( rcc_c1_sai1_lpen           ),
    .rcc_c1_spi5_lpen          ( rcc_c1_spi5_lpen           ),
    .rcc_c1_tim17_lpen         ( rcc_c1_tim17_lpen          ),
    .rcc_c1_tim16_lpen         ( rcc_c1_tim16_lpen          ),
    .rcc_c1_tim15_lpen         ( rcc_c1_tim15_lpen          ),
    .rcc_c1_spi4_lpen          ( rcc_c1_spi4_lpen           ),
    .rcc_c1_spi1_lpen          ( rcc_c1_spi1_lpen           ),
    .rcc_c1_usart6_lpen        ( rcc_c1_usart6_lpen         ),
    .rcc_c1_usart1_lpen        ( rcc_c1_usart1_lpen         ),
    .rcc_c1_tim8_lpen          ( rcc_c1_tim8_lpen           ),
    .rcc_c1_tim1_lpen          ( rcc_c1_tim1_lpen           ),
    .rcc_c1_sai4_lpen          ( rcc_c1_sai4_lpen           ),
    .rcc_c1_rtcapb_lpen        ( rcc_c1_rtcapb_lpen         ),
    .rcc_c1_vref_lpen          ( rcc_c1_vref_lpen           ),
    .rcc_c1_comp12_lpen        ( rcc_c1_comp12_lpen         ),
    .rcc_c1_lptim5_lpen        ( rcc_c1_lptim5_lpen         ),
    .rcc_c1_lptim4_lpen        ( rcc_c1_lptim4_lpen         ),
    .rcc_c1_lptim3_lpen        ( rcc_c1_lptim3_lpen         ),
    .rcc_c1_lptim2_lpen        ( rcc_c1_lptim2_lpen         ),
    .rcc_c1_i2c4_lpen          ( rcc_c1_i2c4_lpen           ),
    .rcc_c1_spi6_lpen          ( rcc_c1_spi6_lpen           ),
    .rcc_c1_lpuart1_lpen       ( rcc_c1_lpuart1_lpen        ),
    .rcc_c1_syscfg_lpen        ( rcc_c1_syscfg_lpen         ),
    .rcc_c2_axisram_en         ( rcc_c2_axisram_en          ),
    .rcc_c2_itcm_en            ( rcc_c2_itcm_en             ),
    .rcc_c2_dtcm2_en           ( rcc_c2_dtcm2_en            ),
    .rcc_c2_dtcm1_en           ( rcc_c2_dtcm1_en            ),
    .rcc_c2_sdmmc1_en          ( rcc_c2_sdmmc1_en           ),
    .rcc_c2_qspi_en            ( rcc_c2_qspi_en             ),
    .rcc_c2_fmc_en             ( rcc_c2_fmc_en              ),
    .rcc_c2_flitf_en           ( rcc_c2_flitf_en            ),
    .rcc_c2_jpgdec_en          ( rcc_c2_jpgdec_en           ),
    .rcc_c2_dma2d_en           ( rcc_c2_dma2d_en            ),
    .rcc_c2_mdma_en            ( rcc_c2_mdma_en             ),
    .rcc_c2_usb2ulpi_en        ( rcc_c2_usb2ulpi_en         ),
    .rcc_c2_usb2otg_en         ( rcc_c2_usb2otg_en          ),
    .rcc_c2_usb1ulpi_en        ( rcc_c2_usb1ulpi_en         ),
    .rcc_c2_usb1otg_en         ( rcc_c2_usb1otg_en          ),
    .rcc_c2_eth1rx_en          ( rcc_c2_eth1rx_en           ),
    .rcc_c2_eth1tx_en          ( rcc_c2_eth1tx_en           ),
    .rcc_c2_eth1mac_en         ( rcc_c2_eth1mac_en          ),
    .rcc_c2_adc12_en           ( rcc_c2_adc12_en            ),
    .rcc_c2_dma2_en            ( rcc_c2_dma2_en             ),
    .rcc_c2_dma1_en            ( rcc_c2_dma1_en             ),
    .rcc_c2_sram3_en           ( rcc_c2_sram3_en            ),
    .rcc_c2_sram2_en           ( rcc_c2_sram2_en            ),
    .rcc_c2_sram1_en           ( rcc_c2_sram1_en            ),
    .rcc_c2_sdmmc2_en          ( rcc_c2_sdmmc2_en           ),
    .rcc_c2_rng_en             ( rcc_c2_rng_en              ),
    .rcc_c2_hash_en            ( rcc_c2_hash_en             ),
    .rcc_c2_crypt_en           ( rcc_c2_crypt_en            ),
    .rcc_c2_dcmi_en            ( rcc_c2_dcmi_en             ),
    .rcc_c2_bkpram_en          ( rcc_c2_bkpram_en           ),
    .rcc_c2_hsem_en            ( rcc_c2_hsem_en             ),
    .rcc_c2_adc3_en            ( rcc_c2_adc3_en             ),
    .rcc_c2_bdma_en            ( rcc_c2_bdma_en             ),
    .rcc_c2_crc_en             ( rcc_c2_crc_en              ),
    .rcc_c2_gpiok_en           ( rcc_c2_gpiok_en            ),
    .rcc_c2_gpioj_en           ( rcc_c2_gpioj_en            ),
    .rcc_c2_gpioi_en           ( rcc_c2_gpioi_en            ),
    .rcc_c2_gpioh_en           ( rcc_c2_gpioh_en            ),
    .rcc_c2_gpiog_en           ( rcc_c2_gpiog_en            ),
    .rcc_c2_gpiof_en           ( rcc_c2_gpiof_en            ),
    .rcc_c2_gpioe_en           ( rcc_c2_gpioe_en            ),
    .rcc_c2_gpiod_en           ( rcc_c2_gpiod_en            ),
    .rcc_c2_gpioc_en           ( rcc_c2_gpioc_en            ),
    .rcc_c2_gpiob_en           ( rcc_c2_gpiob_en            ),
    .rcc_c2_gpioa_en           ( rcc_c2_gpioa_en            ),
    .rcc_c2_wwdg1_en           ( rcc_c2_wwdg1_en            ),
    .rcc_c2_ltdc_en            ( rcc_c2_ltdc_en             ),
    .rcc_c2_uart8_en           ( rcc_c2_uart8_en            ),
    .rcc_c2_uart7_en           ( rcc_c2_uart7_en            ),
    .rcc_c2_dac12_en           ( rcc_c2_dac12_en            ),
    .rcc_c2_hdmicec_en         ( rcc_c2_hdmicec_en          ),
    .rcc_c2_i2c3_en            ( rcc_c2_i2c3_en             ),
    .rcc_c2_i2c2_en            ( rcc_c2_i2c2_en             ),
    .rcc_c2_i2c1_en            ( rcc_c2_i2c1_en             ),
    .rcc_c2_uart5_en           ( rcc_c2_uart5_en            ),
    .rcc_c2_uart4_en           ( rcc_c2_uart4_en            ),
    .rcc_c2_usart3_en          ( rcc_c2_usart3_en           ),
    .rcc_c2_usart2_en          ( rcc_c2_usart2_en           ),
    .rcc_c2_spdifrx_en         ( rcc_c2_spdifrx_en          ),
    .rcc_c2_spi3_en            ( rcc_c2_spi3_en             ),
    .rcc_c2_spi2_en            ( rcc_c2_spi2_en             ),
    .rcc_c2_wwdg2_en           ( rcc_c2_wwdg2_en            ),
    .rcc_c2_lptim1_en          ( rcc_c2_lptim1_en           ),
    .rcc_c2_tim14_en           ( rcc_c2_tim14_en            ),
    .rcc_c2_tim13_en           ( rcc_c2_tim13_en            ),
    .rcc_c2_tim12_en           ( rcc_c2_tim12_en            ),
    .rcc_c2_tim7_en            ( rcc_c2_tim7_en             ),
    .rcc_c2_tim6_en            ( rcc_c2_tim6_en             ),
    .rcc_c2_tim5_en            ( rcc_c2_tim5_en             ),
    .rcc_c2_tim4_en            ( rcc_c2_tim4_en             ),
    .rcc_c2_tim3_en            ( rcc_c2_tim3_en             ),
    .rcc_c2_tim2_en            ( rcc_c2_tim2_en             ),
    .rcc_c2_fdcan_en           ( rcc_c2_fdcan_en            ),
    .rcc_c2_mdios_en           ( rcc_c2_mdios_en            ),
    .rcc_c2_opamp_en           ( rcc_c2_opamp_en            ),
    .rcc_c2_swp_en             ( rcc_c2_swp_en              ),
    .rcc_c2_crs_en             ( rcc_c2_crs_en              ),
    .rcc_c2_hrtim_en           ( rcc_c2_hrtim_en            ),
    .rcc_c2_dfsdm1_en          ( rcc_c2_dfsdm1_en           ),
    .rcc_c2_sai3_en            ( rcc_c2_sai3_en             ),
    .rcc_c2_sai2_en            ( rcc_c2_sai2_en             ),
    .rcc_c2_sai1_en            ( rcc_c2_sai1_en             ),
    .rcc_c2_spi5_en            ( rcc_c2_spi5_en             ),
    .rcc_c2_tim17_en           ( rcc_c2_tim17_en            ),
    .rcc_c2_tim16_en           ( rcc_c2_tim16_en            ),
    .rcc_c2_tim15_en           ( rcc_c2_tim15_en            ),
    .rcc_c2_spi4_en            ( rcc_c2_spi4_en             ),
    .rcc_c2_spi1_en            ( rcc_c2_spi1_en             ),
    .rcc_c2_usart6_en          ( rcc_c2_usart6_en           ),
    .rcc_c2_usart1_en          ( rcc_c2_usart1_en           ),
    .rcc_c2_tim8_en            ( rcc_c2_tim8_en             ),
    .rcc_c2_tim1_en            ( rcc_c2_tim1_en             ),
    .rcc_c2_sai4_en            ( rcc_c2_sai4_en             ),
    .rcc_c2_rtcapb_en          ( rcc_c2_rtcapb_en           ),
    .rcc_c2_vref_en            ( rcc_c2_vref_en             ),
    .rcc_c2_comp12_en          ( rcc_c2_comp12_en           ),
    .rcc_c2_lptim5_en          ( rcc_c2_lptim5_en           ),
    .rcc_c2_lptim4_en          ( rcc_c2_lptim4_en           ),
    .rcc_c2_lptim3_en          ( rcc_c2_lptim3_en           ),
    .rcc_c2_lptim2_en          ( rcc_c2_lptim2_en           ),
    .rcc_c2_i2c4_en            ( rcc_c2_i2c4_en             ),
    .rcc_c2_spi6_en            ( rcc_c2_spi6_en             ),
    .rcc_c2_lpuart1_en         ( rcc_c2_lpuart1_en          ),
    .rcc_c2_syscfg_en          ( rcc_c2_syscfg_en           ),
    .rcc_c2_axisram_lpen       ( rcc_c2_axisram_lpen        ),
    .rcc_c2_itcm_lpen          ( rcc_c2_itcm_lpen           ),
    .rcc_c2_dtcm2_lpen         ( rcc_c2_dtcm2_lpen          ),
    .rcc_c2_dtcm1_lpen         ( rcc_c2_dtcm1_lpen          ),
    .rcc_c2_sdmmc1_lpen        ( rcc_c2_sdmmc1_lpen         ),
    .rcc_c2_qspi_lpen          ( rcc_c2_qspi_lpen           ),
    .rcc_c2_fmc_lpen           ( rcc_c2_fmc_lpen            ),
    .rcc_c2_flitf_lpen         ( rcc_c2_flitf_lpen          ),
    .rcc_c2_jpgdec_lpen        ( rcc_c2_jpgdec_lpen         ),
    .rcc_c2_dma2d_lpen         ( rcc_c2_dma2d_lpen          ),
    .rcc_c2_mdma_lpen          ( rcc_c2_mdma_lpen           ),
    .rcc_c2_usb2ulpi_lpen      ( rcc_c2_usb2ulpi_lpen       ),
    .rcc_c2_usb2otg_lpen       ( rcc_c2_usb2otg_lpen        ),
    .rcc_c2_usb1ulpi_lpen      ( rcc_c2_usb1ulpi_lpen       ),
    .rcc_c2_usb1otg_lpen       ( rcc_c2_usb1otg_lpen        ),
    .rcc_c2_eth1rx_lpen        ( rcc_c2_eth1rx_lpen         ),
    .rcc_c2_eth1tx_lpen        ( rcc_c2_eth1tx_lpen         ),
    .rcc_c2_eth1mac_lpen       ( rcc_c2_eth1mac_lpen        ),
    .rcc_c2_adc12_lpen         ( rcc_c2_adc12_lpen          ),
    .rcc_c2_dma2_lpen          ( rcc_c2_dma2_lpen           ),
    .rcc_c2_dma1_lpen          ( rcc_c2_dma1_lpen           ),
    .rcc_c2_sram3_lpen         ( rcc_c2_sram3_lpen          ),
    .rcc_c2_sram2_lpen         ( rcc_c2_sram2_lpen          ),
    .rcc_c2_sram1_lpen         ( rcc_c2_sram1_lpen          ),
    .rcc_c2_sdmmc2_lpen        ( rcc_c2_sdmmc2_lpen         ),
    .rcc_c2_rng_lpen           ( rcc_c2_rng_lpen            ),
    .rcc_c2_hash_lpen          ( rcc_c2_hash_lpen           ),
    .rcc_c2_crypt_lpen         ( rcc_c2_crypt_lpen          ),
    .rcc_c2_dcmi_lpen          ( rcc_c2_dcmi_lpen           ),
    .rcc_c2_sram4_lpen         ( rcc_c2_sram4_lpen          ),
    .rcc_c2_bkpram_lpen        ( rcc_c2_bkpram_lpen         ),
    .rcc_c2_adc3_lpen          ( rcc_c2_adc3_lpen           ),
    .rcc_c2_bdma_lpen          ( rcc_c2_bdma_lpen           ),
    .rcc_c2_crc_lpen           ( rcc_c2_crc_lpen            ),
    .rcc_c2_gpiok_lpen         ( rcc_c2_gpiok_lpen          ),
    .rcc_c2_gpioj_lpen         ( rcc_c2_gpioj_lpen          ),
    .rcc_c2_gpioi_lpen         ( rcc_c2_gpioi_lpen          ),
    .rcc_c2_gpioh_lpen         ( rcc_c2_gpioh_lpen          ),
    .rcc_c2_gpiog_lpen         ( rcc_c2_gpiog_lpen          ),
    .rcc_c2_gpiof_lpen         ( rcc_c2_gpiof_lpen          ),
    .rcc_c2_gpioe_lpen         ( rcc_c2_gpioe_lpen          ),
    .rcc_c2_gpiod_lpen         ( rcc_c2_gpiod_lpen          ),
    .rcc_c2_gpioc_lpen         ( rcc_c2_gpioc_lpen          ),
    .rcc_c2_gpiob_lpen         ( rcc_c2_gpiob_lpen          ),
    .rcc_c2_gpioa_lpen         ( rcc_c2_gpioa_lpen          ),
    .rcc_c2_wwdg1_lpen         ( rcc_c2_wwdg1_lpen          ),
    .rcc_c2_ltdc_lpen          ( rcc_c2_ltdc_lpen           ),
    .rcc_c2_uart8_lpen         ( rcc_c2_uart8_lpen          ),
    .rcc_c2_uart7_lpen         ( rcc_c2_uart7_lpen          ),
    .rcc_c2_dac12_lpen         ( rcc_c2_dac12_lpen          ),
    .rcc_c2_hdmicec_lpen       ( rcc_c2_hdmicec_lpen        ),
    .rcc_c2_i2c3_lpen          ( rcc_c2_i2c3_lpen           ),
    .rcc_c2_i2c2_lpen          ( rcc_c2_i2c2_lpen           ),
    .rcc_c2_i2c1_lpen          ( rcc_c2_i2c1_lpen           ),
    .rcc_c2_uart5_lpen         ( rcc_c2_uart5_lpen          ),
    .rcc_c2_uart4_lpen         ( rcc_c2_uart4_lpen          ),
    .rcc_c2_usart3_lpen        ( rcc_c2_usart3_lpen         ),
    .rcc_c2_usart2_lpen        ( rcc_c2_usart2_lpen         ),
    .rcc_c2_spdifrx_lpen       ( rcc_c2_spdifrx_lpen        ),
    .rcc_c2_spi3_lpen          ( rcc_c2_spi3_lpen           ),
    .rcc_c2_spi2_lpen          ( rcc_c2_spi2_lpen           ),
    .rcc_c2_wwdg2_lpen         ( rcc_c2_wwdg2_lpen          ),
    .rcc_c2_lptim1_lpen        ( rcc_c2_lptim1_lpen         ),
    .rcc_c2_tim14_lpen         ( rcc_c2_tim14_lpen          ),
    .rcc_c2_tim13_lpen         ( rcc_c2_tim13_lpen          ),
    .rcc_c2_tim12_lpen         ( rcc_c2_tim12_lpen          ),
    .rcc_c2_tim7_lpen          ( rcc_c2_tim7_lpen           ),
    .rcc_c2_tim6_lpen          ( rcc_c2_tim6_lpen           ),
    .rcc_c2_tim5_lpen          ( rcc_c2_tim5_lpen           ),
    .rcc_c2_tim4_lpen          ( rcc_c2_tim4_lpen           ),
    .rcc_c2_tim3_lpen          ( rcc_c2_tim3_lpen           ),
    .rcc_c2_tim2_lpen          ( rcc_c2_tim2_lpen           ),
    .rcc_c2_fdcan_lpen         ( rcc_c2_fdcan_lpen          ),
    .rcc_c2_mdios_lpen         ( rcc_c2_mdios_lpen          ),
    .rcc_c2_opamp_lpen         ( rcc_c2_opamp_lpen          ),
    .rcc_c2_swp_lpen           ( rcc_c2_swp_lpen            ),
    .rcc_c2_crs_lpen           ( rcc_c2_crs_lpen            ),
    .rcc_c2_hrtim_lpen         ( rcc_c2_hrtim_lpen          ),
    .rcc_c2_dfsdm1_lpen        ( rcc_c2_dfsdm1_lpen         ),
    .rcc_c2_sai3_lpen          ( rcc_c2_sai3_lpen           ),
    .rcc_c2_sai2_lpen          ( rcc_c2_sai2_lpen           ),
    .rcc_c2_sai1_lpen          ( rcc_c2_sai1_lpen           ),
    .rcc_c2_spi5_lpen          ( rcc_c2_spi5_lpen           ),
    .rcc_c2_tim17_lpen         ( rcc_c2_tim17_lpen          ),
    .rcc_c2_tim16_lpen         ( rcc_c2_tim16_lpen          ),
    .rcc_c2_tim15_lpen         ( rcc_c2_tim15_lpen          ),
    .rcc_c2_spi4_lpen          ( rcc_c2_spi4_lpen           ),
    .rcc_c2_spi1_lpen          ( rcc_c2_spi1_lpen           ),
    .rcc_c2_usart6_lpen        ( rcc_c2_usart6_lpen         ),
    .rcc_c2_usart1_lpen        ( rcc_c2_usart1_lpen         ),
    .rcc_c2_tim8_lpen          ( rcc_c2_tim8_lpen           ),
    .rcc_c2_tim1_lpen          ( rcc_c2_tim1_lpen           ),
    .rcc_c2_sai4_lpen          ( rcc_c2_sai4_lpen           ),
    .rcc_c2_rtcapb_lpen        ( rcc_c2_rtcapb_lpen         ),
    .rcc_c2_vref_lpen          ( rcc_c2_vref_lpen           ),
    .rcc_c2_comp12_lpen        ( rcc_c2_comp12_lpen         ),
    .rcc_c2_lptim5_lpen        ( rcc_c2_lptim5_lpen         ),
    .rcc_c2_lptim4_lpen        ( rcc_c2_lptim4_lpen         ),
    .rcc_c2_lptim3_lpen        ( rcc_c2_lptim3_lpen         ),
    .rcc_c2_lptim2_lpen        ( rcc_c2_lptim2_lpen         ),
    .rcc_c2_i2c4_lpen          ( rcc_c2_i2c4_lpen           ),
    .rcc_c2_spi6_lpen          ( rcc_c2_spi6_lpen           ),
    .rcc_c2_lpuart1_lpen       ( rcc_c2_lpuart1_lpen        ),
    .rcc_c2_syscfg_lpen        ( rcc_c2_syscfg_lpen         ),
    .nxt_rcc_bdcr_bdrst        ( nxt_rcc_bdcr_bdrst         ),
    .nxt_rcc_bdcr_rtcen        ( nxt_rcc_bdcr_rtcen         ),
    .nxt_rcc_bdcr_rtcsel       ( nxt_rcc_bdcr_rtcsel        ),
    .nxt_rcc_bdcr_lsecsson     ( nxt_rcc_bdcr_lsecsson      ),
    .nxt_rcc_bdcr_lsedrv       ( nxt_rcc_bdcr_lsedrv        ),
    .nxt_rcc_bdcr_lsebyp       ( nxt_rcc_bdcr_lsebyp        ),
    .nxt_rcc_bdcr_lseon        ( nxt_rcc_bdcr_lseon         ),
    .rcc_c1_rsr_rmvf_wren      ( rcc_c1_rsr_rmvf_wren       ),
    .rcc_c2_rsr_rmvf_wren      ( rcc_c2_rsr_rmvf_wren       ),
    .rcc_csr_lsion_wren        ( rcc_csr_lsion_wren         ),
    .rcc_bdcr_byte2_wren       ( rcc_bdcr_byte2_wren        ),
    .rcc_bdcr_byte1_wren       ( rcc_bdcr_byte1_wren        ),
    .rcc_bdcr_byte0_wren       ( rcc_bdcr_byte0_wren        )
);
