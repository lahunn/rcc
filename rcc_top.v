module rcc_top #(
    // parameter D1_AXI_NUM = 1,   // IN NEXT VERSION.we will add these parameter
    // parameter D1_AHB_NUM = 1,
    // parameter D1_APB_NUM = 1,
    // parameter D2_AXI_NUM = 0,
    // parameter D2_AHB_NUM = 2,
    // parameter D2_APB_NUM = 2,
    // parameter D3_AXI_NUM = 0,
    // parameter D3_AHB_NUM = 1,
    // parameter D3_APB_NUM = 1,
    parameter D1_AXI_PER_NUM = 10,
    parameter D1_AHB_PER_NUM = 10,
    parameter D1_APB_PER_NUM = 10,
    parameter D2_AXI_PER_NUM = 0,
    parameter D2_AHB_PER_NUM = 10,
    parameter D2_APB_PER_NUM = 10,
    parameter D3_AXI_PER_NUM = 0,
    parameter D3_AHB_PER_NUM = 10,
    parameter D3_APB_PER_NUM = 10
)( 
// signals connected to PAD 
    input  OSC32_IN,
    output  OSC32_OUT,
    input  OSC_IN,
    output  OSC_OUT,
    output  MCO1,
    output  MCO2,
    input  ARCG_ON,
    input  I2S_CLKIN,
    input  ETH_MII_TX_CLK,
    input  ETH_MII_RX_CLK,
    input  ETH_RMII_REF_CLK,
    input  USB_PHY1,
    input  USB_PHY2,
// signals connected to PAD_NRST 
    input  nrst_in,
    output  nrst_out,
// signals connected to PWR 
    input  d3_deepsleep,
    input  pwr_d1_wkup,
    input  pwr_d2_wkup,
    input  pwr_d3_wkup,
    output  rcc_pwd_d1_req,
    output  rcc_pwd_d2_req,
    output  rcc_pwd_d3_req,
    output  cpu_per_alloc_d1,
    output  cpu_per_alloc_d2,
    input  flash_power_ok,
    input  pwr_d1_ok,
    input  pwr_d2_ok,
    input  pwr_vcore_ok,
    input  backup_protect,
// signals connected to CPU 
    input  c1_sleep,
    input  c2_sleep,
    input  c1_deepsleep,
    input  c2_deepsleep,
    output  rcc_c1_clk,
    output  rcc_c2_clk,
    output  rcc_fclk_c1,
    output  rcc_fclk_c2,
    output  rcc_c1_systick_clk,
    output  rcc_c2_systick_clk,
    output  rcc_c1_rst_n,
    output  rcc_c2_rst_n,
// signals connected to FLASH 
    output  rcc_obl_rst,
    output  rcc_obl_clk,
    output  rcc_flash_rst,
    output  rcc_flash_aclk,
    output  rcc_flash_hclk,
    input  flash_obl_reload,
    input  Tamp_rst_req,
    input [7:0] flash_csi_opt,
    input [11:0] flash_hsi_opt,
    input  obl_done,
// signals connected to CRS 
    input [9:0] crs_hsi48_trim,
// signals connected to 各类外设 
    output  rcc_perx_rst,
    output  rcc_perx_pclk,
    output  rcc_perx_hclk,
    output  rcc_perx_aclk,
    output  rcc_perx_ker_clk,
    input  perx_ker_clk_req,
// signals connected to 总线矩阵 
    output  rcc_axibridge_d1_clk,
    output  rcc_ahb3bridge_d1_clk,
    output  rcc_apb3bridge_d1_clk,
    output  rcc_ahb1bridge_d2_clk,
    output  rcc_ahb2bridge_d2_clk,
    output  rcc_apb1bridge_d2_clk,
    output  rcc_apb2bridge_d2_clk,
    output  rcc_ahb4bridge_d3_clk,
    output  rcc_apb4bridge_d3_clk,
    output  rcc_axibridge_rst,
    output  rcc_ahb3bridge_rst,
    output  rcc_apb3bridge_rst,
    output  rcc_ahb1bridge_rst,
    output  rcc_ahb2bridge_rst,
    output  rcc_apb1bridge_rst,
    output  rcc_apb2bridge_rst,
    output  rcc_ahb4bridge_rst,
    output  rcc_apb4bridge_rst,
    output  rcc_bus_clk_en,
// signals connected to 总线信号
    input wire ahb_hclk,
    input wire ahb_hresetn,
    input wire [31:0] ahb_haddr,
    input wire [2:0] ahb_hburst,
    input wire [2:0] ahb_hprot,
    output wire [31:0] ahb_hrdata,
    input wire ahb_hready_in,
    output wire ahb_hready_out,
    output wire ahb_hresp,
    input wire [2:0] ahb_hsize,
    input wire [1:0] ahb_htrans,
    input wire [31:0] ahb_hwdata,
    input wire ahb_hwrite,
    input wire ahb_hsel,
    input wire ahb_hmaster,
// signals connected to 中断信号 
    output  rcc_it,
    output  rcc_hsecss_it,
    output  rcc_lsecss_it,
    output  rcc_hsecss_fail,
    output  rcc_lsecss_fail,
// signals connected to 复位�?? 
    input  iwdg1_out_rst,
    input  wwdg1_out_rst,
    input  iwdg2_out_rst,
    input  wwdg2_out_rst,
    input  lpwr1_rst,
    input  lpwr2_rst,
    input  pwr_bor_rst,
    input  pwr_por_rst,
    input  pwr_vsw_rst,
    input  d1_rst,
    input  d2_rst,
    input  stby_rst,
    input  cpu1_sftrst,
    input  cpu2_sftrst,
// signals connected to busy 指示信号 
    input  axibridge_d1_busy,
    input  ahbbridge_d1_busy,
    input  apbbridge_d1_busy,
    input  ahb1bridge_d2_busy,
    input  ahb2bridge_d2_busy,
    input  apb1bridge_d2_busy,
    input  apb2bridge_d2_busy,
    input  ahb4bridge_d3_busy,
    input  apb4bridge_d3_busy,
    input  flash_busy,
// signals connected to PLL * 3 
    input  pllx_rdy,
    output  pllx_on,
    output  divrx_en,
    output  divqx_en,
    output  divpx_en,
    output [1:0] pllx_rge,
    output  pllx_vco_sel,
    output  pllx_frac_en,
    output [6:0] rcc_pllx_divrx,
    output [6:0] rcc_pllx_divqx,
    output [6:0] rcc_pllx_divpx,
    output [8:0] rcc_pllx_divnx,
    output [12:0] rcc_pllx_fracnx,
    output  rcc_pllx_ref_clk,
    input  pllx_pclk,
    input  pllx_qclk,
    input  pllx_rclk,
// signals connected to HSE 
    output  hse_css_on,
    output  hse_byp,
    input  hse_rdy,
    output  hse_on,
    input  hse_css_fail,
    input  hse_clk,
// signals connected to HSI48 
    input  hsi48_ready,
    output  hsi48_on,
    output [9:0] hsi48_trim,
    input  hsi48_clk,
// signals connected to CSI 
    output  csi_on,
    input  csi_rdy,
    output [7:0] csi_trim,
    input  csi_clk,
// signals connected to HSI 
    input  hsi_rdy,
    output  hsi_on,
    output [11:0] hsi_trim,
    input  hsi_origin_clk,
// signals connected to LSE 
    input  lse_css_fail,
    output  lse_css_on,
    output  lse_drv,
    output  lse_byp,
    input  lse_rdy,
    output  lse_on,
    input  lse_clk,
// signals connected to LSI 
    input  lsi_rdy,
    output  lsi_on,
    input  lsi_clk,
//peripheral reset
    output  sdmmc1rst  ,
    output  qspirst    ,
    output  fmcrst     ,
    output  jpgdecrst  ,
    output  dma2drst   ,
    output  mdmarst    ,
    output  usb2otgrst ,
    output  usb1otgrst ,
    output  eth1macrst ,
    output  adc12rst   ,
    output  dma2rst    ,
    output  dma1rst    ,
    output  sdmmc2rst  ,
    output  rngrst     ,
    output  hashrst    ,
    output  cryptrst   ,
    output  dcmirst    ,
    output  hsemrst    ,
    output  adc3rst    ,
    output  bdmarst    ,
    output  crcrst     ,
    output  gpiokrst   ,
    output  gpiojrst   ,
    output  gpioirst   ,
    output  gpiohrst   ,
    output  gpiogrst   ,
    output  gpiofrst   ,
    output  gpioerst   ,
    output  gpiodrst   ,
    output  gpiocrst   ,
    output  gpiobrst   ,
    output  gpioarst   ,
    output  ltdcrst    ,
    output  uart8rst   ,
    output  uart7rst   ,
    output  dac12rst   ,
    output  hdmicecrst ,
    output  i2c3rst    ,
    output  i2c2rst    ,
    output  i2c1rst    ,
    output  uart5rst   ,
    output  uart4rst   ,
    output  usart3rst  ,
    output  usart2rst  ,
    output  spdifrxrst ,
    output  spi3rst    ,
    output  spi2rst    ,
    output  lptim1rst  ,
    output  tim14rst   ,
    output  tim13rst   ,
    output  tim12rst   ,
    output  tim7rst    ,
    output  tim6rst    ,
    output  tim5rst    ,
    output  tim4rst    ,
    output  tim3rst    ,
    output  tim2rst    ,
    output  fdcanrst   ,
    output  mdiosrst   ,
    output  opamprst   ,
    output  swprst     ,
    output  crsrst     ,
    output  hrtimrst   ,
    output  dfsdm1rst  ,
    output  sai3rst    ,
    output  sai2rst    ,
    output  sai1rst    ,
    output  spi5rst    ,
    output  tim17rst   ,
    output  tim16rst   ,
    output  tim15rst   ,
    output  spi4rst    ,
    output  spi1rst    ,
    output  usart6rst  ,
    output  usart1rst  ,
    output  tim8rst    ,
    output  tim1rst    ,
    output  sai4rst    ,
    output  vrefrst    ,
    output  comp12rst  ,
    output  lptim5rst  ,
    output  lptim4rst  ,
    output  lptim3rst  ,
    output  lptim2rst  ,
    output  i2c4rst    ,
    output  spi6rst    ,
    output  lpuart1rst ,
    output  syscfgrst  ,
//

//per_ker_clk_control region
    output wire  rcc_qspi_aclk,
    output wire  rcc_qspi_hclk,
    output wire  rcc_qspi_ker_clk,
    output wire  rcc_axisram_aclk,
    output wire  rcc_fmc_aclk,
    output wire  rcc_fmc_hclk,
    output wire  rcc_fmc_ker_clk,
    output wire  rcc_dma2d_aclk,
    output wire  rcc_dma2d_hclk,
    output wire  rcc_mdma_aclk,
    output wire  rcc_mdma_hclk,
    output wire  rcc_ltdc_aclk,
    output wire  rcc_ltdc_pclk,
    output wire  rcc_ltdc_ker_clk,
    output wire  rcc_ramecc1_hclk,
    output wire  rcc_gpv_hclk,
    output wire  rcc_itcm_hclk,
    output wire  rcc_dtcm2_hclk,
    output wire  rcc_dtcm1_hclk,
    output wire  rcc_jpgdec_hclk,
    output wire  rcc_sdmmc1_hclk,
    output wire  rcc_sdmmc1_ker_clk,
    output wire  rcc_wwdg1_pclk,
    output wire  rcc_usb2ulpi_hclk,
    output wire  rcc_usb2otg_hclk,
    output wire  rcc_usb2otg_ker_clk,
    output wire  rcc_usb1ulpi_hclk,
    output wire  rcc_usb1ulpi_ker_clk,
    output wire  rcc_usb1otg_hclk,
    output wire  rcc_usb1otg_ker_clk,
    output wire  rcc_eth1rx_hclk,
    output wire  rcc_eth1tx_hclk,
    output wire  rcc_eth1mac_hclk,
    output wire  rcc_adc12_hclk,
    output wire  rcc_adc12_ker_clk,
    output wire  rcc_dma2_hclk,
    output wire  rcc_dma1_hclk,
    output wire  rcc_sram3_hclk,
    output wire  rcc_sram2_hclk,
    output wire  rcc_sram1_hclk,
    output wire  rcc_sdmmc2_hclk,
    output wire  rcc_sdmmc2_ker_clk,
    output wire  rcc_rng_hclk,
    output wire  rcc_rng_ker_clk,
    output wire  rcc_hash_hclk,
    output wire  rcc_crypt_hclk,
    output wire  rcc_dcmi_hclk,
    output wire  rcc_ramecc2_hclk,
    output wire  rcc_uart8_pclk,
    output wire  rcc_uart8_ker_clk,
    output wire  rcc_uart7_pclk,
    output wire  rcc_uart7_ker_clk,
    output wire  rcc_dac12_pclk,
    output wire  rcc_hdmicec_pclk,
    output wire  rcc_hdmicec_ker_clk,
    output wire  rcc_i2c3_pclk,
    output wire  rcc_i2c3_ker_clk,
    output wire  rcc_i2c2_pclk,
    output wire  rcc_i2c2_ker_clk,
    output wire  rcc_i2c1_pclk,
    output wire  rcc_i2c1_ker_clk,
    output wire  rcc_uart5_pclk,
    output wire  rcc_uart5_ker_clk,
    output wire  rcc_uart4_pclk,
    output wire  rcc_uart4_ker_clk,
    output wire  rcc_usart3_pclk,
    output wire  rcc_usart3_ker_clk,
    output wire  rcc_usart2_pclk,
    output wire  rcc_usart2_ker_clk,
    output wire  rcc_spdifrx_pclk,
    output wire  rcc_spdifrx_ker_clk,
    output wire  rcc_spi3_pclk,
    output wire  rcc_spi3_ker_clk,
    output wire  rcc_spi2_pclk,
    output wire  rcc_spi2_ker_clk,
    output wire  rcc_wwdg2_pclk,
    output wire  rcc_lptim1_pclk,
    output wire  rcc_lptim1_ker_clk,
    output wire  rcc_tim14_pclk,
    output wire  rcc_tim14_ker_clk,
    output wire  rcc_tim13_pclk,
    output wire  rcc_tim13_ker_clk,
    output wire  rcc_tim12_pclk,
    output wire  rcc_tim12_ker_clk,
    output wire  rcc_tim7_pclk,
    output wire  rcc_tim7_ker_clk,
    output wire  rcc_tim6_pclk,
    output wire  rcc_tim6_ker_clk,
    output wire  rcc_tim5_pclk,
    output wire  rcc_tim5_ker_clk,
    output wire  rcc_tim4_pclk,
    output wire  rcc_tim4_ker_clk,
    output wire  rcc_tim3_pclk,
    output wire  rcc_tim3_ker_clk,
    output wire  rcc_tim2_pclk,
    output wire  rcc_tim2_ker_clk,
    output wire  rcc_fdcan_pclk,
    output wire  rcc_fdcan_ker_clk,
    output wire  rcc_mdios_pclk,
    output wire  rcc_opamp_pclk,
    output wire  rcc_swpmi_pclk,
    output wire  rcc_swpmi_ker_clk,
    output wire  rcc_crs_pclk,
    output wire  rcc_hrtim_pclk,
    output wire  rcc_hrtim_ker_clk,
    output wire  rcc_dfsdm1_pclk,
    output wire  rcc_dfsdm1_ker_clk_0,
    output wire  rcc_dfsdm1_ker_clk_1,
    output wire  rcc_sai3_pclk,
    output wire  rcc_sai3_ker_clk,
    output wire  rcc_sai2_pclk,
    output wire  rcc_sai2_ker_clk,
    output wire  rcc_sai1_pclk,
    output wire  rcc_sai1_ker_clk,
    output wire  rcc_spi5_pclk,
    output wire  rcc_spi5_ker_clk,
    output wire  rcc_tim17_pclk,
    output wire  rcc_tim17_ker_clk,
    output wire  rcc_tim16_pclk,
    output wire  rcc_tim16_ker_clk,
    output wire  rcc_tim15_pclk,
    output wire  rcc_tim15_ker_clk,
    output wire  rcc_spi4_pclk,
    output wire  rcc_spi4_ker_clk,
    output wire  rcc_spi1_pclk,
    output wire  rcc_spi1_ker_clk,
    output wire  rcc_usart6_pclk,
    output wire  rcc_usart6_ker_clk,
    output wire  rcc_usart1_pclk,
    output wire  rcc_usart1_ker_clk,
    output wire  rcc_tim8_pclk,
    output wire  rcc_tim8_ker_clk,
    output wire  rcc_tim1_pclk,
    output wire  rcc_tim1_ker_clk,
    output wire  rcc_sram4_hclk,
    output wire  rcc_bkpram_hclk,
    output wire  rcc_ramecc3_hclk,
    output wire  rcc_hsem_hclk,
    output wire  rcc_adc3_hclk,
    output wire  rcc_adc3_ker_clk,
    output wire  rcc_bdma_hclk,
    output wire  rcc_crc_hclk,
    output wire  rcc_gpiok_hclk,
    output wire  rcc_gpioj_hclk,
    output wire  rcc_gpioi_hclk,
    output wire  rcc_gpioh_hclk,
    output wire  rcc_gpiog_hclk,
    output wire  rcc_gpiof_hclk,
    output wire  rcc_gpioe_hclk,
    output wire  rcc_gpiod_hclk,
    output wire  rcc_gpioc_hclk,
    output wire  rcc_gpiob_hclk,
    output wire  rcc_gpioa_hclk,
    output wire  rcc_rcc_hclk,
    output wire  rcc_pwr_hclk,
    output wire  rcc_sai4_pclk,
    output wire  rcc_sai4_ker_clk_0,
    output wire  rcc_sai4_ker_clk_1,
    output wire  rcc_vref_pclk,
    output wire  rcc_comp12_pclk,
    output wire  rcc_lptim5_pclk,
    output wire  rcc_lptim5_ker_clk,
    output wire  rcc_lptim4_pclk,
    output wire  rcc_lptim4_ker_clk,
    output wire  rcc_lptim3_pclk,
    output wire  rcc_lptim3_ker_clk,
    output wire  rcc_lptim2_pclk,
    output wire  rcc_lptim2_ker_clk,
    output wire  rcc_i2c4_pclk,
    output wire  rcc_i2c4_ker_clk,
    output wire  rcc_spi6_pclk,
    output wire  rcc_spi6_ker_clk,
    output wire  rcc_lpuart1_pclk,
    output wire  rcc_lpuart1_ker_clk,
    output wire  rcc_syscfg_pclk,
    output wire  rcc_iwdg2_pclk,
    output wire  rcc_iwdg1_pclk,
    output wire  rcc_exti_pclk
//end per_ker_clk_control region

);

// rcc_vdd_top Outputs
wire  cur_rcc_c1_rsr_lpwr2rstf;
wire  cur_rcc_c1_rsr_lpwr1rstf;
wire  cur_rcc_c1_rsr_wwdg2rstf;
wire  cur_rcc_c1_rsr_wwdg1rstf;
wire  cur_rcc_c1_rsr_iwdg2rstf;
wire  cur_rcc_c1_rsr_iwdg1rstf;
wire  cur_rcc_c1_rsr_sft2rstf;
wire  cur_rcc_c1_rsr_sft1rstf;
wire  cur_rcc_c1_rsr_porrstf;
wire  cur_rcc_c1_rsr_pinrstf;
wire  cur_rcc_c1_rsr_borrstf;
wire  cur_rcc_c1_rsr_d2rstf;
wire  cur_rcc_c1_rsr_d1rstf;
wire  cur_rcc_c1_rsr_oblrstf;
wire  cur_rcc_c1_rsr_rmvf;
wire  cur_rcc_c2_rsr_lpwr2rstf;
wire  cur_rcc_c2_rsr_lpwr1rstf;
wire  cur_rcc_c2_rsr_wwdg2rstf;
wire  cur_rcc_c2_rsr_wwdg1rstf;
wire  cur_rcc_c2_rsr_iwdg2rstf;
wire  cur_rcc_c2_rsr_iwdg1rstf;
wire  cur_rcc_c2_rsr_sft2rstf;
wire  cur_rcc_c2_rsr_sft1rstf;
wire  cur_rcc_c2_rsr_porrstf;
wire  cur_rcc_c2_rsr_pinrstf;
wire  cur_rcc_c2_rsr_borrstf;
wire  cur_rcc_c2_rsr_d2rstf;
wire  cur_rcc_c2_rsr_d1rstf;
wire  cur_rcc_c2_rsr_oblrstf;
wire  cur_rcc_c2_rsr_rmvf;
wire  cur_rcc_csr_lsirdy;
wire  cur_rcc_csr_lsion;

// RCC Outputs
//#region RCC Outputs
wire  [31:0]  rdata;
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
wire  [2:0]  mco2;
wire  [3:0]  mco2pre;
wire  [2:0]  mco1;
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
wire  bdrst;
wire  rtcen;
wire  [1:0]  rtcsel;
wire  lsecsson;
wire  [1:0]  lsedrv;
wire  lsebyp;
wire  lseon;
wire  lsion;
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
wire  sram4amen;
wire  bkpramamen;
wire  adc3amen;
wire  sai4amen;
wire  crcamen;
wire  rtcamen;
wire  vrefamen;
wire  comp12amen;
wire  lptim5amen;
wire  lptim4amen;
wire  lptim3amen;
wire  lptim2amen;
wire  i2c4amen;
wire  spi6amen;
wire  lpuart1amen;
wire  bdmaamen;
wire  rmvf;
//#endregion

// rcc_vsw_top Outputs
wire  rcc_rtc_ker_clk;
wire  cur_rcc_bdcr_bdrst;
wire  cur_rcc_bdcr_rtcen;
wire  [1:0]  cur_rcc_bdcr_rtcsel;
wire  cur_rcc_bdcr_lsecssd;
wire  cur_rcc_bdcr_lsecsson;
wire  [1:0]  cur_rcc_bdcr_lsedrv;
wire  cur_rcc_bdcr_lsebyp;
wire  cur_rcc_bdcr_lserdy;
wire  cur_rcc_bdcr_lseon;

rcc_vsw_top  u_rcc_vsw_top (
    .lse_css_fail            ( lse_css_fail            ),
    .lse_rdy                 ( lse_rdy                 ),
    .lse_clk                 ( lse_clk                 ),
    .lsi_clk                 ( lsi_clk                 ),
    .hse_rtc_clk             ( hse_rtc_clk             ),
    .pwr_vsw_rst             ( pwr_vsw_rst             ),
    .rcc_bdcr_byte2_wren     ( rcc_bdcr_byte2_wren     ),
    .rcc_bdcr_byte1_wren     ( rcc_bdcr_byte1_wren     ),
    .rcc_bdcr_byte0_wren     ( rcc_bdcr_byte0_wren     ),
    .rcc_lsecss_fail         ( rcc_lsecss_fail         ),
    .lserdy                  ( lserdy                  ),
    .nxt_rcc_bdcr_bdrst      ( nxt_rcc_bdcr_bdrst      ),
    .nxt_rcc_bdcr_rtcen      ( nxt_rcc_bdcr_rtcen      ),
    .nxt_rcc_bdcr_rtcsel     ( nxt_rcc_bdcr_rtcsel     ),
    .nxt_rcc_bdcr_lsecsson   ( nxt_rcc_bdcr_lsecsson   ),
    .nxt_rcc_bdcr_lsedrv     ( nxt_rcc_bdcr_lsedrv     ),
    .nxt_rcc_bdcr_lsebyp     ( nxt_rcc_bdcr_lsebyp     ),
    .nxt_rcc_bdcr_lseon      ( nxt_rcc_bdcr_lseon      ),

    .lse_css_on              ( lse_css_on              ),
    .lse_drv                 ( lse_drv                 ),
    .lse_byp                 ( lse_byp                 ),
    .lse_on                  ( lse_on                  ),
    .rcc_rtc_ker_clk         ( rcc_rtc_ker_clk         ),
    .lsecsson                ( lsecsson                ),
    .lsedrv                  ( lsedrv                  ),
    .lsebyp                  ( lsebyp                  ),
    .lseon                   ( lseon                   ),
    .cur_rcc_bdcr_bdrst      ( cur_rcc_bdcr_bdrst      ),
    .cur_rcc_bdcr_rtcen      ( cur_rcc_bdcr_rtcen      ),
    .cur_rcc_bdcr_rtcsel     ( cur_rcc_bdcr_rtcsel     ),
    .cur_rcc_bdcr_lsecssd    ( cur_rcc_bdcr_lsecssd    ),
    .cur_rcc_bdcr_lsecsson   ( cur_rcc_bdcr_lsecsson   ),
    .cur_rcc_bdcr_lsedrv     ( cur_rcc_bdcr_lsedrv     ),
    .cur_rcc_bdcr_lsebyp     ( cur_rcc_bdcr_lsebyp     ),
    .cur_rcc_bdcr_lserdy     ( cur_rcc_bdcr_lserdy     ),
    .cur_rcc_bdcr_lseon      ( cur_rcc_bdcr_lseon      )
);

rcc_vdd_top  u_rcc_vdd_top (
    .wdata                     ( wdata                      ),
    .rcc_c1_rsr_rmvf_wren      ( rcc_c1_rsr_rmvf_wren       ),
    .rcc_c2_rsr_rmvf_wren      ( rcc_c2_rsr_rmvf_wren       ),
    .rcc_csr_lsion_wren        ( rcc_csr_lsion_wren         ),
    .nrst_in                   ( nrst_in                    ),
    .obl_rst                   ( obl_rst                    ),
    .lpwr2_rst                 ( lpwr2_rst                  ),
    .lpwr1_rst                 ( lpwr1_rst                  ),
    .wwdg1_out_rst             ( wwdg1_out_rst              ),
    .wwdg2_out_rst             ( wwdg2_out_rst              ),
    .iwdg1_out_rst             ( iwdg1_out_rst              ),
    .iwdg2_out_rst             ( iwdg2_out_rst              ),
    .cpu2_sftrst               ( cpu2_sftrst                ),
    .cpu1_sftrst               ( cpu1_sftrst                ),
    .pwr_por_rst               ( pwr_por_rst                ),
    .pwr_bor_rst               ( pwr_bor_rst                ),
    .d2_rst                    ( d2_rst                     ),
    .d1_rst                    ( d1_rst                     ),
    .cpu2_rst                  ( cpu2_rst                   ),
    .cpu1_rst                  ( cpu1_rst                   ),
    .lsi_rdy                   ( lsi_rdy                    ),

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
    .cur_rcc_csr_lsion         ( cur_rcc_csr_lsion          )
);

rcc_vcore_top  u_rcc_vcore_top (
    .d3_deepsleep            ( d3_deepsleep            ),
    .pwr_d1_wkup             ( pwr_d1_wkup             ),
    .pwr_d2_wkup             ( pwr_d2_wkup             ),
    .pwr_d3_wkup             ( pwr_d3_wkup             ),
    .flash_power_ok          ( flash_power_ok          ),
    .pwr_d1_ok               ( pwr_d1_ok               ),
    .pwr_d2_ok               ( pwr_d2_ok               ),
    .pwr_vcore_ok            ( pwr_vcore_ok            ),
    .backup_protect          ( backup_protect          ),
    .c1_sleep                ( c1_sleep                ),
    .c2_sleep                ( c2_sleep                ),
    .c1_deepsleep            ( c1_deepsleep            ),
    .c2_deepsleep            ( c2_deepsleep            ),
    .ahb_hclk                ( ahb_hclk                ),
    .ahb_hresetn             ( ahb_hresetn             ),
    .ahb_haddr               ( ahb_haddr               ),
    .ahb_hburst              ( ahb_hburst              ),
    .ahb_hprot               ( ahb_hprot               ),
    .ahb_hready_in           ( ahb_hready_in           ),
    .ahb_hsize               ( ahb_hsize               ),
    .ahb_htrans              ( ahb_htrans              ),
    .ahb_hwdata              ( ahb_hwdata              ),
    .ahb_hwrite              ( ahb_hwrite              ),
    .ahb_hsel                ( ahb_hsel                ),
    .ahb_hmaster             ( ahb_hmaster             ),
    .pll1_q_clk              ( pll1_q_clk              ),
    .pll2_p_clk              ( pll2_p_clk              ),
    .pll2_q_clk              ( pll2_q_clk              ),
    .pll2_r_clk              ( pll2_r_clk              ),
    .pll3_p_clk              ( pll3_p_clk              ),
    .pll3_q_clk              ( pll3_q_clk              ),
    .pll3_r_clk              ( pll3_r_clk              ),
    .I2S_clk_IN              ( I2S_clk_IN              ),

    .rcc_pwr_d1_req          ( rcc_pwr_d1_req          ),
    .rcc_pwr_d2_req          ( rcc_pwr_d2_req          ),
    .rcc_pwr_d3_req          ( rcc_pwr_d3_req          ),
    .c2_per_alloc_d1         ( c2_per_alloc_d1         ),
    .c1_per_alloc_d2         ( c1_per_alloc_d2         ),
    .pwr_por_rst_n           ( pwr_por_rst_n           ),
    .pwr_vsw_rst_n           ( pwr_vsw_rst_n           ),
    .sys_rst_n               ( sys_rst_n               ),
    .rcc_perx_rst_n          ( rcc_perx_rst_n          ),
    .d1_rst_n                ( d1_rst_n                ),
    .d2_rst_n                ( d2_rst_n                ),
    .sdby_rst_n              ( sdby_rst_n              ),
    .ahb_hrdata              ( ahb_hrdata              ),
    .ahb_hready_out          ( ahb_hready_out          ),
    .ahb_hresp               ( ahb_hresp               ),
    .rcc_axibridge_d1_clk    ( rcc_axibridge_d1_clk    ),
    .rcc_ahb3bridge_d1_clk   ( rcc_ahb3bridge_d1_clk   ),
    .rcc_apb3bridge_d1_clk   ( rcc_apb3bridge_d1_clk   ),
    .rcc_ahb1bridge_d2_clk   ( rcc_ahb1bridge_d2_clk   ),
    .rcc_ahb2bridge_d2_clk   ( rcc_ahb2bridge_d2_clk   ),
    .rcc_apb1bridge_d2_clk   ( rcc_apb1bridge_d2_clk   ),
    .rcc_apb2bridge_d2_clk   ( rcc_apb2bridge_d2_clk   ),
    .rcc_ahb4bridge_d3_clk   ( rcc_ahb4bridge_d3_clk   ),
    .rcc_apb4bridge_d3_clk   ( rcc_apb4bridge_d3_clk   ),
    .sdmmc1rst               ( sdmmc1rst               ),
    .qspirst                 ( qspirst                 ),
    .fmcrst                  ( fmcrst                  ),
    .jpgdecrst               ( jpgdecrst               ),
    .dma2drst                ( dma2drst                ),
    .mdmarst                 ( mdmarst                 ),
    .usb2otgrst              ( usb2otgrst              ),
    .usb1otgrst              ( usb1otgrst              ),
    .eth1macrst              ( eth1macrst              ),
    .adc12rst                ( adc12rst                ),
    .dma2rst                 ( dma2rst                 ),
    .dma1rst                 ( dma1rst                 ),
    .sdmmc2rst               ( sdmmc2rst               ),
    .rngrst                  ( rngrst                  ),
    .hashrst                 ( hashrst                 ),
    .cryptrst                ( cryptrst                ),
    .dcmirst                 ( dcmirst                 ),
    .hsemrst                 ( hsemrst                 ),
    .adc3rst                 ( adc3rst                 ),
    .bdmarst                 ( bdmarst                 ),
    .crcrst                  ( crcrst                  ),
    .gpiokrst                ( gpiokrst                ),
    .gpiojrst                ( gpiojrst                ),
    .gpioirst                ( gpioirst                ),
    .gpiohrst                ( gpiohrst                ),
    .gpiogrst                ( gpiogrst                ),
    .gpiofrst                ( gpiofrst                ),
    .gpioerst                ( gpioerst                ),
    .gpiodrst                ( gpiodrst                ),
    .gpiocrst                ( gpiocrst                ),
    .gpiobrst                ( gpiobrst                ),
    .gpioarst                ( gpioarst                ),
    .ltdcrst                 ( ltdcrst                 ),
    .uart8rst                ( uart8rst                ),
    .uart7rst                ( uart7rst                ),
    .dac12rst                ( dac12rst                ),
    .hdmicecrst              ( hdmicecrst              ),
    .i2c3rst                 ( i2c3rst                 ),
    .i2c2rst                 ( i2c2rst                 ),
    .i2c1rst                 ( i2c1rst                 ),
    .uart5rst                ( uart5rst                ),
    .uart4rst                ( uart4rst                ),
    .usart3rst               ( usart3rst               ),
    .usart2rst               ( usart2rst               ),
    .spdifrxrst              ( spdifrxrst              ),
    .spi3rst                 ( spi3rst                 ),
    .spi2rst                 ( spi2rst                 ),
    .lptim1rst               ( lptim1rst               ),
    .tim14rst                ( tim14rst                ),
    .tim13rst                ( tim13rst                ),
    .tim12rst                ( tim12rst                ),
    .tim7rst                 ( tim7rst                 ),
    .tim6rst                 ( tim6rst                 ),
    .tim5rst                 ( tim5rst                 ),
    .tim4rst                 ( tim4rst                 ),
    .tim3rst                 ( tim3rst                 ),
    .tim2rst                 ( tim2rst                 ),
    .fdcanrst                ( fdcanrst                ),
    .mdiosrst                ( mdiosrst                ),
    .opamprst                ( opamprst                ),
    .swprst                  ( swprst                  ),
    .crsrst                  ( crsrst                  ),
    .hrtimrst                ( hrtimrst                ),
    .dfsdm1rst               ( dfsdm1rst               ),
    .sai3rst                 ( sai3rst                 ),
    .sai2rst                 ( sai2rst                 ),
    .sai1rst                 ( sai1rst                 ),
    .spi5rst                 ( spi5rst                 ),
    .tim17rst                ( tim17rst                ),
    .tim16rst                ( tim16rst                ),
    .tim15rst                ( tim15rst                ),
    .spi4rst                 ( spi4rst                 ),
    .spi1rst                 ( spi1rst                 ),
    .usart6rst               ( usart6rst               ),
    .usart1rst               ( usart1rst               ),
    .tim8rst                 ( tim8rst                 ),
    .tim1rst                 ( tim1rst                 ),
    .sai4rst                 ( sai4rst                 ),
    .vrefrst                 ( vrefrst                 ),
    .comp12rst               ( comp12rst               ),
    .lptim5rst               ( lptim5rst               ),
    .lptim4rst               ( lptim4rst               ),
    .lptim3rst               ( lptim3rst               ),
    .lptim2rst               ( lptim2rst               ),
    .i2c4rst                 ( i2c4rst                 ),
    .spi6rst                 ( spi6rst                 ),
    .lpuart1rst              ( lpuart1rst              ),
    .syscfgrst               ( syscfgrst               ),
    .rcc_flash_aclk          ( rcc_flash_aclk          ),
    .rcc_flash_hclk          ( rcc_flash_hclk          ),
    .rcc_qspi_aclk           ( rcc_qspi_aclk           ),
    .rcc_qspi_hclk           ( rcc_qspi_hclk           ),
    .rcc_qspi_ker_clk        ( rcc_qspi_ker_clk        ),
    .rcc_axisram_aclk        ( rcc_axisram_aclk        ),
    .rcc_fmc_aclk            ( rcc_fmc_aclk            ),
    .rcc_fmc_hclk            ( rcc_fmc_hclk            ),
    .rcc_fmc_ker_clk         ( rcc_fmc_ker_clk         ),
    .rcc_dma2d_aclk          ( rcc_dma2d_aclk          ),
    .rcc_dma2d_hclk          ( rcc_dma2d_hclk          ),
    .rcc_mdma_aclk           ( rcc_mdma_aclk           ),
    .rcc_mdma_hclk           ( rcc_mdma_hclk           ),
    .rcc_ltdc_aclk           ( rcc_ltdc_aclk           ),
    .rcc_ltdc_pclk           ( rcc_ltdc_pclk           ),
    .rcc_ltdc_ker_clk        ( rcc_ltdc_ker_clk        ),
    .rcc_ramecc1_hclk        ( rcc_ramecc1_hclk        ),
    .rcc_gpv_hclk            ( rcc_gpv_hclk            ),
    .rcc_itcm_hclk           ( rcc_itcm_hclk           ),
    .rcc_dtcm2_hclk          ( rcc_dtcm2_hclk          ),
    .rcc_dtcm1_hclk          ( rcc_dtcm1_hclk          ),
    .rcc_jpgdec_hclk         ( rcc_jpgdec_hclk         ),
    .rcc_sdmmc1_hclk         ( rcc_sdmmc1_hclk         ),
    .rcc_sdmmc1_ker_clk      ( rcc_sdmmc1_ker_clk      ),
    .rcc_wwdg1_pclk          ( rcc_wwdg1_pclk          ),
    .rcc_usb2ulpi_hclk       ( rcc_usb2ulpi_hclk       ),
    .rcc_usb2otg_hclk        ( rcc_usb2otg_hclk        ),
    .rcc_usb2otg_ker_clk     ( rcc_usb2otg_ker_clk     ),
    .rcc_usb1ulpi_hclk       ( rcc_usb1ulpi_hclk       ),
    .rcc_usb1ulpi_ker_clk    ( rcc_usb1ulpi_ker_clk    ),
    .rcc_usb1otg_hclk        ( rcc_usb1otg_hclk        ),
    .rcc_usb1otg_ker_clk     ( rcc_usb1otg_ker_clk     ),
    .rcc_eth1rx_hclk         ( rcc_eth1rx_hclk         ),
    .rcc_eth1tx_hclk         ( rcc_eth1tx_hclk         ),
    .rcc_eth1mac_hclk        ( rcc_eth1mac_hclk        ),
    .rcc_adc12_hclk          ( rcc_adc12_hclk          ),
    .rcc_adc12_ker_clk       ( rcc_adc12_ker_clk       ),
    .rcc_dma2_hclk           ( rcc_dma2_hclk           ),
    .rcc_dma1_hclk           ( rcc_dma1_hclk           ),
    .rcc_sram3_hclk          ( rcc_sram3_hclk          ),
    .rcc_sram2_hclk          ( rcc_sram2_hclk          ),
    .rcc_sram1_hclk          ( rcc_sram1_hclk          ),
    .rcc_sdmmc2_hclk         ( rcc_sdmmc2_hclk         ),
    .rcc_sdmmc2_ker_clk      ( rcc_sdmmc2_ker_clk      ),
    .rcc_rng_hclk            ( rcc_rng_hclk            ),
    .rcc_rng_ker_clk         ( rcc_rng_ker_clk         ),
    .rcc_hash_hclk           ( rcc_hash_hclk           ),
    .rcc_crypt_hclk          ( rcc_crypt_hclk          ),
    .rcc_dcmi_hclk           ( rcc_dcmi_hclk           ),
    .rcc_ramecc2_hclk        ( rcc_ramecc2_hclk        ),
    .rcc_uart8_pclk          ( rcc_uart8_pclk          ),
    .rcc_uart8_ker_clk       ( rcc_uart8_ker_clk       ),
    .rcc_uart7_pclk          ( rcc_uart7_pclk          ),
    .rcc_uart7_ker_clk       ( rcc_uart7_ker_clk       ),
    .rcc_dac12_pclk          ( rcc_dac12_pclk          ),
    .rcc_hdmicec_pclk        ( rcc_hdmicec_pclk        ),
    .rcc_hdmicec_ker_clk     ( rcc_hdmicec_ker_clk     ),
    .rcc_i2c3_pclk           ( rcc_i2c3_pclk           ),
    .rcc_i2c3_ker_clk        ( rcc_i2c3_ker_clk        ),
    .rcc_i2c2_pclk           ( rcc_i2c2_pclk           ),
    .rcc_i2c2_ker_clk        ( rcc_i2c2_ker_clk        ),
    .rcc_i2c1_pclk           ( rcc_i2c1_pclk           ),
    .rcc_i2c1_ker_clk        ( rcc_i2c1_ker_clk        ),
    .rcc_uart5_pclk          ( rcc_uart5_pclk          ),
    .rcc_uart5_ker_clk       ( rcc_uart5_ker_clk       ),
    .rcc_uart4_pclk          ( rcc_uart4_pclk          ),
    .rcc_uart4_ker_clk       ( rcc_uart4_ker_clk       ),
    .rcc_usart3_pclk         ( rcc_usart3_pclk         ),
    .rcc_usart3_ker_clk      ( rcc_usart3_ker_clk      ),
    .rcc_usart2_pclk         ( rcc_usart2_pclk         ),
    .rcc_usart2_ker_clk      ( rcc_usart2_ker_clk      ),
    .rcc_spdifrx_pclk        ( rcc_spdifrx_pclk        ),
    .rcc_spdifrx_ker_clk     ( rcc_spdifrx_ker_clk     ),
    .rcc_spi3_pclk           ( rcc_spi3_pclk           ),
    .rcc_spi3_ker_clk        ( rcc_spi3_ker_clk        ),
    .rcc_spi2_pclk           ( rcc_spi2_pclk           ),
    .rcc_spi2_ker_clk        ( rcc_spi2_ker_clk        ),
    .rcc_wwdg2_pclk          ( rcc_wwdg2_pclk          ),
    .rcc_lptim1_pclk         ( rcc_lptim1_pclk         ),
    .rcc_lptim1_ker_clk      ( rcc_lptim1_ker_clk      ),
    .rcc_tim14_pclk          ( rcc_tim14_pclk          ),
    .rcc_tim14_ker_clk       ( rcc_tim14_ker_clk       ),
    .rcc_tim13_pclk          ( rcc_tim13_pclk          ),
    .rcc_tim13_ker_clk       ( rcc_tim13_ker_clk       ),
    .rcc_tim12_pclk          ( rcc_tim12_pclk          ),
    .rcc_tim12_ker_clk       ( rcc_tim12_ker_clk       ),
    .rcc_tim7_pclk           ( rcc_tim7_pclk           ),
    .rcc_tim7_ker_clk        ( rcc_tim7_ker_clk        ),
    .rcc_tim6_pclk           ( rcc_tim6_pclk           ),
    .rcc_tim6_ker_clk        ( rcc_tim6_ker_clk        ),
    .rcc_tim5_pclk           ( rcc_tim5_pclk           ),
    .rcc_tim5_ker_clk        ( rcc_tim5_ker_clk        ),
    .rcc_tim4_pclk           ( rcc_tim4_pclk           ),
    .rcc_tim4_ker_clk        ( rcc_tim4_ker_clk        ),
    .rcc_tim3_pclk           ( rcc_tim3_pclk           ),
    .rcc_tim3_ker_clk        ( rcc_tim3_ker_clk        ),
    .rcc_tim2_pclk           ( rcc_tim2_pclk           ),
    .rcc_tim2_ker_clk        ( rcc_tim2_ker_clk        ),
    .rcc_fdcan_pclk          ( rcc_fdcan_pclk          ),
    .rcc_fdcan_ker_clk       ( rcc_fdcan_ker_clk       ),
    .rcc_mdios_pclk          ( rcc_mdios_pclk          ),
    .rcc_opamp_pclk          ( rcc_opamp_pclk          ),
    .rcc_swpmi_pclk          ( rcc_swpmi_pclk          ),
    .rcc_swpmi_ker_clk       ( rcc_swpmi_ker_clk       ),
    .rcc_crs_pclk            ( rcc_crs_pclk            ),
    .rcc_hrtim_pclk          ( rcc_hrtim_pclk          ),
    .rcc_hrtim_ker_clk       ( rcc_hrtim_ker_clk       ),
    .rcc_dfsdm1_pclk         ( rcc_dfsdm1_pclk         ),
    .rcc_dfsdm1_ker_clk_0    ( rcc_dfsdm1_ker_clk_0    ),
    .rcc_dfsdm1_ker_clk_1    ( rcc_dfsdm1_ker_clk_1    ),
    .rcc_sai3_pclk           ( rcc_sai3_pclk           ),
    .rcc_sai3_ker_clk        ( rcc_sai3_ker_clk        ),
    .rcc_sai2_pclk           ( rcc_sai2_pclk           ),
    .rcc_sai2_ker_clk        ( rcc_sai2_ker_clk        ),
    .rcc_sai1_pclk           ( rcc_sai1_pclk           ),
    .rcc_sai1_ker_clk        ( rcc_sai1_ker_clk        ),
    .rcc_spi5_pclk           ( rcc_spi5_pclk           ),
    .rcc_spi5_ker_clk        ( rcc_spi5_ker_clk        ),
    .rcc_tim17_pclk          ( rcc_tim17_pclk          ),
    .rcc_tim17_ker_clk       ( rcc_tim17_ker_clk       ),
    .rcc_tim16_pclk          ( rcc_tim16_pclk          ),
    .rcc_tim16_ker_clk       ( rcc_tim16_ker_clk       ),
    .rcc_tim15_pclk          ( rcc_tim15_pclk          ),
    .rcc_tim15_ker_clk       ( rcc_tim15_ker_clk       ),
    .rcc_spi4_pclk           ( rcc_spi4_pclk           ),
    .rcc_spi4_ker_clk        ( rcc_spi4_ker_clk        ),
    .rcc_spi1_pclk           ( rcc_spi1_pclk           ),
    .rcc_spi1_ker_clk        ( rcc_spi1_ker_clk        ),
    .rcc_usart6_pclk         ( rcc_usart6_pclk         ),
    .rcc_usart6_ker_clk      ( rcc_usart6_ker_clk      ),
    .rcc_usart1_pclk         ( rcc_usart1_pclk         ),
    .rcc_usart1_ker_clk      ( rcc_usart1_ker_clk      ),
    .rcc_tim8_pclk           ( rcc_tim8_pclk           ),
    .rcc_tim8_ker_clk        ( rcc_tim8_ker_clk        ),
    .rcc_tim1_pclk           ( rcc_tim1_pclk           ),
    .rcc_tim1_ker_clk        ( rcc_tim1_ker_clk        ),
    .rcc_sram4_hclk          ( rcc_sram4_hclk          ),
    .rcc_bkpram_hclk         ( rcc_bkpram_hclk         ),
    .rcc_ramecc3_hclk        ( rcc_ramecc3_hclk        ),
    .rcc_hsem_hclk           ( rcc_hsem_hclk           ),
    .rcc_adc3_hclk           ( rcc_adc3_hclk           ),
    .rcc_adc3_ker_clk        ( rcc_adc3_ker_clk        ),
    .rcc_bdma_hclk           ( rcc_bdma_hclk           ),
    .rcc_crc_hclk            ( rcc_crc_hclk            ),
    .rcc_gpiok_hclk          ( rcc_gpiok_hclk          ),
    .rcc_gpioj_hclk          ( rcc_gpioj_hclk          ),
    .rcc_gpioi_hclk          ( rcc_gpioi_hclk          ),
    .rcc_gpioh_hclk          ( rcc_gpioh_hclk          ),
    .rcc_gpiog_hclk          ( rcc_gpiog_hclk          ),
    .rcc_gpiof_hclk          ( rcc_gpiof_hclk          ),
    .rcc_gpioe_hclk          ( rcc_gpioe_hclk          ),
    .rcc_gpiod_hclk          ( rcc_gpiod_hclk          ),
    .rcc_gpioc_hclk          ( rcc_gpioc_hclk          ),
    .rcc_gpiob_hclk          ( rcc_gpiob_hclk          ),
    .rcc_gpioa_hclk          ( rcc_gpioa_hclk          ),
    .rcc_rcc_hclk            ( rcc_rcc_hclk            ),
    .rcc_pwr_hclk            ( rcc_pwr_hclk            ),
    .rcc_sai4_pclk           ( rcc_sai4_pclk           ),
    .rcc_sai4_ker_clk_0      ( rcc_sai4_ker_clk_0      ),
    .rcc_sai4_ker_clk_1      ( rcc_sai4_ker_clk_1      ),
    .rcc_vref_pclk           ( rcc_vref_pclk           ),
    .rcc_comp12_pclk         ( rcc_comp12_pclk         ),
    .rcc_lptim5_pclk         ( rcc_lptim5_pclk         ),
    .rcc_lptim5_ker_clk      ( rcc_lptim5_ker_clk      ),
    .rcc_lptim4_pclk         ( rcc_lptim4_pclk         ),
    .rcc_lptim4_ker_clk      ( rcc_lptim4_ker_clk      ),
    .rcc_lptim3_pclk         ( rcc_lptim3_pclk         ),
    .rcc_lptim3_ker_clk      ( rcc_lptim3_ker_clk      ),
    .rcc_lptim2_pclk         ( rcc_lptim2_pclk         ),
    .rcc_lptim2_ker_clk      ( rcc_lptim2_ker_clk      ),
    .rcc_i2c4_pclk           ( rcc_i2c4_pclk           ),
    .rcc_i2c4_ker_clk        ( rcc_i2c4_ker_clk        ),
    .rcc_spi6_pclk           ( rcc_spi6_pclk           ),
    .rcc_spi6_ker_clk        ( rcc_spi6_ker_clk        ),
    .rcc_lpuart1_pclk        ( rcc_lpuart1_pclk        ),
    .rcc_lpuart1_ker_clk     ( rcc_lpuart1_ker_clk     ),
    .rcc_syscfg_pclk         ( rcc_syscfg_pclk         ),
    .rcc_iwdg2_pclk          ( rcc_iwdg2_pclk          ),
    .rcc_iwdg1_pclk          ( rcc_iwdg1_pclk          ),
    .rcc_exti_pclk           ( rcc_exti_pclk           )
);


endmodule
