module rcc_vcore_top #(
    parameter CLK_ON_AFTER_PER_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_SYS_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_D1_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_D2_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_CPU1_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_CPU2_RST_RELEASE = 8,
    // ================================================================================
    // CONFIGURABLE PARAMETERS
    // ================================================================================
    parameter AW = 29,
    parameter DW = 32,
    parameter WW = DW / 8
) (
    // signals connected to 复位源 
    input  nrst_in,
    input  iwdg1_out_rst,
    input  wwdg1_out_rst,
    input  iwdg2_out_rst,
    input  wwdg2_out_rst,
    input  lpwr2_rst,
    input  lpwr1_rst,
    input  pwr_bor_rst,
    input  pwr_por_rst,
    input  cpu2_sftrst,
    input  cpu1_sftrst,
    output nrst_out,
    output obl_rst,
    output d1_rst,
    output d2_rst,

    // signals connected to PWR 
    input      d3_deepsleep,
    input      pwr_d1_wkup,
    input      pwr_d2_wkup,
    input      pwr_d3_wkup,
    output reg rcc_pwr_d1_req,
    output reg rcc_pwr_d2_req,
    output reg rcc_pwr_d3_req,
    output     c2_per_alloc_d1,
    output     c1_per_alloc_d2,
    input      flash_power_ok,
    input      pwr_d1_ok,
    input      pwr_d2_ok,
    input      pwr_vcore_ok,
    input      backup_protect,


    // signals connected to CPU 
    input       c2_sleep,
    input       c2_deepsleep,
    input       c1_sleep,
    input       c1_deepsleep,
    output      rcc_c2_clk,
    output      rcc_fclk_c2,
    output      rcc_c2_systick_clk,
    output      rcc_c1_clk,
    output      rcc_fclk_c1,
    output      rcc_c1_systick_clk,
    // reset to cpu and bus 
    output      cpu1_arcg_rst_n,
    output      cpu2_arcg_rst_n,
    output      d1_bus_arcg_rst_n,
    output      d2_bus_arcg_rst_n,
    output      d3_bus_arcg_rst_n,
    // timer clocks
    output wire rcc_timx_ker_clk,
    output wire rcc_timy_ker_clk,
    output wire rcc_hrtimer_prescalar_clk,
    output wire sys_d1cpre_clk,
    output wire sys_hpre_clk,
    // rtc clocks
    output wire hse_rtc_clk,
    // signals connected to PAD 
    output      mco1,
    output      mco2,
    input       pad_rcc_eth_mii_tx_clk,
    input       pad_rcc_eth_mii_rx_clk,
    input       USB_PHY1,
    // interrupt signals
    output      rcc_hsefail_it,
    output      rcc_lsefail_it,
    output      rcc_it,

    // some other signals 
    input        flash_obl_reload,
    input        obl_done,
    input        rcc_arcg_on,
    input        pll3_rdy,
    input        pll2_rdy,
    input        pll1_rdy,
    input        hse_rdy,
    input        hsi48_rdy,
    input        csi_rdy,
    input        hsi_rdy,
    input [ 7:0] flash_csi_opt,
    input [11:0] flash_hsi_opt,
    input [ 9:0] crs_hsi48_trim,
    input        hsecss_fail,
    input        lsecss_fail,
    // signals connected to HSE
    input        hse_clk_pre,
    // lse lsi clock
    input        lse_clk,
    input        lsi_clk,
    // signals connected to HSI48 
    input        hsi48_clk,
    // signals connected to CSI
    input        csi_clk_pre,
    // signals connected to HSI
    input        hsi_origin_clk,

    // reset signals
    output wire pwr_por_rst_n,
    output wire sys_arcg_rst_n,
    output wire d1_arcg_rst_n,
    output wire d2_arcg_rst_n,
    output wire stby_rst_n,

    // per rst signals
    output             rcc_flash_arcg_rst_n,
    output             rcc_qspi_arcg_rst_n,
    output             rcc_axisram_arcg_rst_n,
    output             rcc_fmc_arcg_rst_n,
    output             rcc_dma2d_arcg_rst_n,
    output             rcc_mdma_arcg_rst_n,
    output             rcc_ltdc_arcg_rst_n,
    output             rcc_ramecc1_arcg_rst_n,
    output             rcc_gpv_arcg_rst_n,
    output             rcc_itcm_arcg_rst_n,
    output             rcc_dtcm2_arcg_rst_n,
    output             rcc_dtcm1_arcg_rst_n,
    output             rcc_jpgdec_arcg_rst_n,
    output             rcc_sdmmc1_arcg_rst_n,
    output             rcc_wwdg1_arcg_rst_n,
    output             rcc_usb2ulpi_arcg_rst_n,
    output             rcc_usb2otg_arcg_rst_n,
    output             rcc_usb1ulpi_arcg_rst_n,
    output             rcc_usb1otg_arcg_rst_n,
    output             rcc_eth1rx_arcg_rst_n,
    output             rcc_eth1tx_arcg_rst_n,
    output             rcc_eth1mac_arcg_rst_n,
    output             rcc_adc12_arcg_rst_n,
    output             rcc_dma2_arcg_rst_n,
    output             rcc_dma1_arcg_rst_n,
    output             rcc_sram3_arcg_rst_n,
    output             rcc_sram2_arcg_rst_n,
    output             rcc_sram1_arcg_rst_n,
    output             rcc_sdmmc2_arcg_rst_n,
    output             rcc_rng_arcg_rst_n,
    output             rcc_hash_arcg_rst_n,
    output             rcc_crypt_arcg_rst_n,
    output             rcc_dcmi_arcg_rst_n,
    output             rcc_ramecc2_arcg_rst_n,
    output             rcc_uart8_arcg_rst_n,
    output             rcc_uart7_arcg_rst_n,
    output             rcc_dac12_arcg_rst_n,
    output             rcc_hdmicec_arcg_rst_n,
    output             rcc_i2c3_arcg_rst_n,
    output             rcc_i2c2_arcg_rst_n,
    output             rcc_i2c1_arcg_rst_n,
    output             rcc_uart5_arcg_rst_n,
    output             rcc_uart4_arcg_rst_n,
    output             rcc_usart3_arcg_rst_n,
    output             rcc_usart2_arcg_rst_n,
    output             rcc_spdifrx_arcg_rst_n,
    output             rcc_spi3_arcg_rst_n,
    output             rcc_spi2_arcg_rst_n,
    output             rcc_wwdg2_arcg_rst_n,
    output             rcc_lptim1_arcg_rst_n,
    output             rcc_tim14_arcg_rst_n,
    output             rcc_tim13_arcg_rst_n,
    output             rcc_tim12_arcg_rst_n,
    output             rcc_tim7_arcg_rst_n,
    output             rcc_tim6_arcg_rst_n,
    output             rcc_tim5_arcg_rst_n,
    output             rcc_tim4_arcg_rst_n,
    output             rcc_tim3_arcg_rst_n,
    output             rcc_tim2_arcg_rst_n,
    output             rcc_fdcan_arcg_rst_n,
    output             rcc_mdios_arcg_rst_n,
    output             rcc_opamp_arcg_rst_n,
    output             rcc_swpmi_arcg_rst_n,
    output             rcc_crs_arcg_rst_n,
    output             rcc_hrtim_arcg_rst_n,
    output             rcc_dfsdm1_arcg_rst_n,
    output             rcc_sai3_arcg_rst_n,
    output             rcc_sai2_arcg_rst_n,
    output             rcc_sai1_arcg_rst_n,
    output             rcc_spi5_arcg_rst_n,
    output             rcc_tim17_arcg_rst_n,
    output             rcc_tim16_arcg_rst_n,
    output             rcc_tim15_arcg_rst_n,
    output             rcc_spi4_arcg_rst_n,
    output             rcc_spi1_arcg_rst_n,
    output             rcc_usart6_arcg_rst_n,
    output             rcc_usart1_arcg_rst_n,
    output             rcc_tim8_arcg_rst_n,
    output             rcc_tim1_arcg_rst_n,
    output             rcc_sram4_arcg_rst_n,
    output             rcc_bkpram_arcg_rst_n,
    output             rcc_ramecc3_arcg_rst_n,
    output             rcc_hsem_arcg_rst_n,
    output             rcc_adc3_arcg_rst_n,
    output             rcc_bdma_arcg_rst_n,
    output             rcc_crc_arcg_rst_n,
    output             rcc_gpiok_arcg_rst_n,
    output             rcc_gpioj_arcg_rst_n,
    output             rcc_gpioi_arcg_rst_n,
    output             rcc_gpioh_arcg_rst_n,
    output             rcc_gpiog_arcg_rst_n,
    output             rcc_gpiof_arcg_rst_n,
    output             rcc_gpioe_arcg_rst_n,
    output             rcc_gpiod_arcg_rst_n,
    output             rcc_gpioc_arcg_rst_n,
    output             rcc_gpiob_arcg_rst_n,
    output             rcc_gpioa_arcg_rst_n,
    output             rcc_rcc_arcg_rst_n,
    output             rcc_pwr_arcg_rst_n,
    output             rcc_sai4_arcg_rst_n,
    output             rcc_rtc_arcg_rst_n,
    output             rcc_vref_arcg_rst_n,
    output             rcc_comp12_arcg_rst_n,
    output             rcc_lptim5_arcg_rst_n,
    output             rcc_lptim4_arcg_rst_n,
    output             rcc_lptim3_arcg_rst_n,
    output             rcc_lptim2_arcg_rst_n,
    output             rcc_i2c4_arcg_rst_n,
    output             rcc_spi6_arcg_rst_n,
    output             rcc_lpuart1_arcg_rst_n,
    output             rcc_syscfg_arcg_rst_n,
    output             rcc_iwdg2_arcg_rst_n,
    output             rcc_iwdg1_arcg_rst_n,
    output             rcc_exti_arcg_rst_n,
    // ahb bus signals
    input  wire        ahb_hclk,
    input  wire        ahb_hresetn,
    input  wire [31:0] ahb_haddr,
    input  wire [ 2:0] ahb_hburst,
    input  wire [ 2:0] ahb_hprot,
    output wire [31:0] ahb_hrdata,
    input  wire        ahb_hready_in,
    output wire        ahb_hready_out,
    output wire        ahb_hresp,
    input  wire [ 2:0] ahb_hsize,
    input  wire [ 1:0] ahb_htrans,
    input  wire [31:0] ahb_hwdata,
    input  wire        ahb_hwrite,
    input  wire        ahb_hsel,
    input  wire        ahb_hmaster,

    // per_ker_clk_control Inputs
    // ker clock req
    input              uart8_ker_clk_req,
    input              uart7_ker_clk_req,
    input              i2c3_ker_clk_req,
    input              i2c2_ker_clk_req,
    input              i2c1_ker_clk_req,
    input              uart5_ker_clk_req,
    input              uart4_ker_clk_req,
    input              usart3_ker_clk_req,
    input              usart2_ker_clk_req,
    input              usart6_ker_clk_req,
    input              usart1_ker_clk_req,
    input              i2c4_ker_clk_req,
    input              lpuart1_ker_clk_req,
    // bus clock signals
    output wire        rcc_axibridge_d1_clk,
    output wire        rcc_ahb3bridge_d1_clk,
    output wire        rcc_apb3bridge_d1_clk,
    output wire        rcc_ahb1bridge_d2_clk,
    output wire        rcc_ahb2bridge_d2_clk,
    output wire        rcc_apb1bridge_d2_clk,
    output wire        rcc_apb2bridge_d2_clk,
    output wire        rcc_ahb4bridge_d3_clk,
    output wire        rcc_apb4bridge_d3_clk,
    // pll , oscilator and pad clocks
    output             pll1_src_clk,
    output             pll2_src_clk,
    output             pll3_src_clk,
    input  wire        pll1_p_clk,
    input  wire        pll1_q_clk,
    input  wire        pll2_p_clk,
    input  wire        pll2_q_clk,
    input  wire        pll2_r_clk,
    input  wire        pll3_p_clk,
    input  wire        pll3_q_clk,
    input  wire        pll3_r_clk,
    input  wire        I2S_clk_IN,
    // pll osc control signals
    output             pll3on,
    output             pll2on,
    output             pll1on,
    output             hsecsson,
    output             hsebyp,
    output             hseon,
    output             hsi48on,
    output             csikeron,
    output             csion,
    output      [ 1:0] hsidiv,
    output             hsikeron,
    output             hsion,
    output      [ 7:0] rcc_csi_triming,
    output      [11:0] rcc_hsi_triming,
    output             divr3en,
    output             divq3en,
    output             divp3en,
    output             divr2en,
    output             divq2en,
    output             divp2en,
    output             divr1en,
    output             divq1en,
    output             divp1en,
    output      [ 1:0] pll3rge,
    output             pll3vcosel,
    output             pll3fracen,
    output      [ 1:0] pll2rge,
    output             pll2vcosel,
    output             pll2fracen,
    output      [ 1:0] pll1rge,
    output             pll1vcosel,
    output             pll1fracen,
    output      [ 6:0] divr1,
    output      [ 6:0] divq1,
    output      [ 6:0] divp1,
    output      [ 8:0] divn1,
    output      [12:0] fracn1,
    output      [ 6:0] divr2,
    output      [ 6:0] divq2,
    output      [ 6:0] divp2,
    output      [ 8:0] divn2,
    output      [12:0] fracn2,
    output      [ 6:0] divr3,
    output      [ 6:0] divq3,
    output      [ 6:0] divp3,
    output      [ 8:0] divn3,
    output      [12:0] fracn3,
    // indicate busy state 
    input              axibridge_d1_busy,
    input              ahb3bridge_d1_busy,
    input              apb3bridge_d1_busy,
    input              ahb1bridge_d2_busy,
    input              ahb2bridge_d2_busy,
    input              apb1bridge_d2_busy,
    input              apb2bridge_d2_busy,
    input              ahb4bridge_d3_busy,
    input              apb4bridge_d3_busy,
    input              flash_busy,

    //signals from eth 
    input  eth_rcc_fes,
    input  eth_rcc_epis_2,
    output rcc_eth_mii_tx_clk,
    output rcc_eth_mii_rx_clk,
    output rcc_eth_rmii_ref_clk,

    //register signals
    output       rcc_c1_rsr_rmvf_wren,
    output       rcc_c2_rsr_rmvf_wren,
    output       rcc_csr_lsion_wren,
    output       rcc_bdcr_byte2_wren,
    output       rcc_bdcr_byte1_wren,
    output       rcc_bdcr_byte0_wren,
    // rcc_bdcr 
    input        cur_rcc_bdcr_bdrst,
    output       nxt_rcc_bdcr_bdrst,
    input        cur_rcc_bdcr_rtcen,
    output       nxt_rcc_bdcr_rtcen,
    input  [1:0] cur_rcc_bdcr_rtcsel,
    output [1:0] nxt_rcc_bdcr_rtcsel,
    input        cur_rcc_bdcr_lsecssd,
    input        cur_rcc_bdcr_lsecsson,
    output       nxt_rcc_bdcr_lsecsson,
    input  [1:0] cur_rcc_bdcr_lsedrv,
    output [1:0] nxt_rcc_bdcr_lsedrv,
    input        cur_rcc_bdcr_lsebyp,
    output       nxt_rcc_bdcr_lsebyp,
    input        cur_rcc_bdcr_lserdy,
    input        cur_rcc_bdcr_lseon,
    output       nxt_rcc_bdcr_lseon,

    output rcc_vdd_wdata,
    // rcc_c1_rsr 
    input  cur_rcc_c1_rsr_lpwr2rstf,
    input  cur_rcc_c1_rsr_lpwr1rstf,
    input  cur_rcc_c1_rsr_wwdg2rstf,
    input  cur_rcc_c1_rsr_wwdg1rstf,
    input  cur_rcc_c1_rsr_iwdg2rstf,
    input  cur_rcc_c1_rsr_iwdg1rstf,
    input  cur_rcc_c1_rsr_sft2rstf,
    input  cur_rcc_c1_rsr_sft1rstf,
    input  cur_rcc_c1_rsr_porrstf,
    input  cur_rcc_c1_rsr_pinrstf,
    input  cur_rcc_c1_rsr_borrstf,
    input  cur_rcc_c1_rsr_d2rstf,
    input  cur_rcc_c1_rsr_d1rstf,
    input  cur_rcc_c1_rsr_oblrstf,
    input  cur_rcc_c1_rsr_rmvf,
    // rcc_c2_rsr 
    input  cur_rcc_c2_rsr_lpwr2rstf,
    input  cur_rcc_c2_rsr_lpwr1rstf,
    input  cur_rcc_c2_rsr_wwdg2rstf,
    input  cur_rcc_c2_rsr_wwdg1rstf,
    input  cur_rcc_c2_rsr_iwdg2rstf,
    input  cur_rcc_c2_rsr_iwdg1rstf,
    input  cur_rcc_c2_rsr_sft2rstf,
    input  cur_rcc_c2_rsr_sft1rstf,
    input  cur_rcc_c2_rsr_porrstf,
    input  cur_rcc_c2_rsr_pinrstf,
    input  cur_rcc_c2_rsr_borrstf,
    input  cur_rcc_c2_rsr_d2rstf,
    input  cur_rcc_c2_rsr_d1rstf,
    input  cur_rcc_c2_rsr_oblrstf,
    input  cur_rcc_c2_rsr_rmvf,
    // rcc_csr
    input  cur_rcc_csr_lsirdy,
    input  cur_rcc_csr_lsion,

    //per_ker_clk_control region
    output wire rcc_rtc_pclk,
    output wire rcc_flash_aclk,
    output wire rcc_flash_hclk,
    output wire rcc_qspi_aclk,
    output wire rcc_qspi_hclk,
    output wire rcc_qspi_ker_clk,
    output wire rcc_axisram_aclk,
    output wire rcc_fmc_aclk,
    output wire rcc_fmc_hclk,
    output wire rcc_fmc_ker_clk,
    output wire rcc_dma2d_aclk,
    output wire rcc_dma2d_hclk,
    output wire rcc_mdma_aclk,
    output wire rcc_mdma_hclk,
    output wire rcc_ltdc_aclk,
    output wire rcc_ltdc_pclk,
    output wire rcc_ltdc_ker_clk,
    output wire rcc_ramecc1_hclk,
    output wire rcc_gpv_hclk,
    output wire rcc_itcm_hclk,
    output wire rcc_dtcm2_hclk,
    output wire rcc_dtcm1_hclk,
    output wire rcc_jpgdec_hclk,
    output wire rcc_sdmmc1_hclk,
    output wire rcc_sdmmc1_ker_clk,
    output wire rcc_wwdg1_pclk,
    output wire rcc_usb2ulpi_hclk,
    output wire rcc_usb2otg_hclk,
    output wire rcc_usb2otg_ker_clk,
    output wire rcc_usb1ulpi_hclk,
    output wire rcc_usb1ulpi_ker_clk,
    output wire rcc_usb1otg_hclk,
    output wire rcc_usb1otg_ker_clk,
    output wire rcc_eth1rx_hclk,
    output wire rcc_eth1tx_hclk,
    output wire rcc_eth1mac_hclk,
    output wire rcc_adc12_hclk,
    output wire rcc_adc12_ker_clk,
    output wire rcc_dma2_hclk,
    output wire rcc_dma1_hclk,
    output wire rcc_sram3_hclk,
    output wire rcc_sram2_hclk,
    output wire rcc_sram1_hclk,
    output wire rcc_sdmmc2_hclk,
    output wire rcc_sdmmc2_ker_clk,
    output wire rcc_rng_hclk,
    output wire rcc_rng_ker_clk,
    output wire rcc_hash_hclk,
    output wire rcc_crypt_hclk,
    output wire rcc_dcmi_hclk,
    output wire rcc_ramecc2_hclk,
    output wire rcc_uart8_pclk,
    output wire rcc_uart8_ker_clk,
    output wire rcc_uart7_pclk,
    output wire rcc_uart7_ker_clk,
    output wire rcc_dac12_pclk,
    output wire rcc_hdmicec_pclk,
    output wire rcc_hdmicec_ker_clk,
    output wire rcc_i2c3_pclk,
    output wire rcc_i2c3_ker_clk,
    output wire rcc_i2c2_pclk,
    output wire rcc_i2c2_ker_clk,
    output wire rcc_i2c1_pclk,
    output wire rcc_i2c1_ker_clk,
    output wire rcc_uart5_pclk,
    output wire rcc_uart5_ker_clk,
    output wire rcc_uart4_pclk,
    output wire rcc_uart4_ker_clk,
    output wire rcc_usart3_pclk,
    output wire rcc_usart3_ker_clk,
    output wire rcc_usart2_pclk,
    output wire rcc_usart2_ker_clk,
    output wire rcc_spdifrx_pclk,
    output wire rcc_spdifrx_ker_clk,
    output wire rcc_spi3_pclk,
    output wire rcc_spi3_ker_clk,
    output wire rcc_spi2_pclk,
    output wire rcc_spi2_ker_clk,
    output wire rcc_wwdg2_pclk,
    output wire rcc_lptim1_pclk,
    output wire rcc_lptim1_ker_clk,
    output wire rcc_tim14_pclk,
    output wire rcc_tim14_ker_clk,
    output wire rcc_tim13_pclk,
    output wire rcc_tim13_ker_clk,
    output wire rcc_tim12_pclk,
    output wire rcc_tim12_ker_clk,
    output wire rcc_tim7_pclk,
    output wire rcc_tim7_ker_clk,
    output wire rcc_tim6_pclk,
    output wire rcc_tim6_ker_clk,
    output wire rcc_tim5_pclk,
    output wire rcc_tim5_ker_clk,
    output wire rcc_tim4_pclk,
    output wire rcc_tim4_ker_clk,
    output wire rcc_tim3_pclk,
    output wire rcc_tim3_ker_clk,
    output wire rcc_tim2_pclk,
    output wire rcc_tim2_ker_clk,
    output wire rcc_fdcan_pclk,
    output wire rcc_fdcan_ker_clk,
    output wire rcc_mdios_pclk,
    output wire rcc_opamp_pclk,
    output wire rcc_swpmi_pclk,
    output wire rcc_swpmi_ker_clk,
    output wire rcc_crs_pclk,
    output wire rcc_hrtim_pclk,
    output wire rcc_hrtim_ker_clk,
    output wire rcc_dfsdm1_pclk,
    output wire rcc_dfsdm1_ker_clk_0,
    output wire rcc_dfsdm1_ker_clk_1,
    output wire rcc_sai3_pclk,
    output wire rcc_sai3_ker_clk,
    output wire rcc_sai2_pclk,
    output wire rcc_sai2_ker_clk,
    output wire rcc_sai1_pclk,
    output wire rcc_sai1_ker_clk,
    output wire rcc_spi5_pclk,
    output wire rcc_spi5_ker_clk,
    output wire rcc_tim17_pclk,
    output wire rcc_tim17_ker_clk,
    output wire rcc_tim16_pclk,
    output wire rcc_tim16_ker_clk,
    output wire rcc_tim15_pclk,
    output wire rcc_tim15_ker_clk,
    output wire rcc_spi4_pclk,
    output wire rcc_spi4_ker_clk,
    output wire rcc_spi1_pclk,
    output wire rcc_spi1_ker_clk,
    output wire rcc_usart6_pclk,
    output wire rcc_usart6_ker_clk,
    output wire rcc_usart1_pclk,
    output wire rcc_usart1_ker_clk,
    output wire rcc_tim8_pclk,
    output wire rcc_tim8_ker_clk,
    output wire rcc_tim1_pclk,
    output wire rcc_tim1_ker_clk,
    output wire rcc_sram4_hclk,
    output wire rcc_bkpram_hclk,
    output wire rcc_ramecc3_hclk,
    output wire rcc_hsem_hclk,
    output wire rcc_adc3_hclk,
    output wire rcc_adc3_ker_clk,
    output wire rcc_bdma_hclk,
    output wire rcc_crc_hclk,
    output wire rcc_gpiok_hclk,
    output wire rcc_gpioj_hclk,
    output wire rcc_gpioi_hclk,
    output wire rcc_gpioh_hclk,
    output wire rcc_gpiog_hclk,
    output wire rcc_gpiof_hclk,
    output wire rcc_gpioe_hclk,
    output wire rcc_gpiod_hclk,
    output wire rcc_gpioc_hclk,
    output wire rcc_gpiob_hclk,
    output wire rcc_gpioa_hclk,
    output wire rcc_rcc_hclk,
    output wire rcc_pwr_hclk,
    output wire rcc_sai4_pclk,
    output wire rcc_sai4_ker_clk_0,
    output wire rcc_sai4_ker_clk_1,
    output wire rcc_vref_pclk,
    output wire rcc_comp12_pclk,
    output wire rcc_lptim5_pclk,
    output wire rcc_lptim5_ker_clk,
    output wire rcc_lptim4_pclk,
    output wire rcc_lptim4_ker_clk,
    output wire rcc_lptim3_pclk,
    output wire rcc_lptim3_ker_clk,
    output wire rcc_lptim2_pclk,
    output wire rcc_lptim2_ker_clk,
    output wire rcc_i2c4_pclk,
    output wire rcc_i2c4_ker_clk,
    output wire rcc_spi6_pclk,
    output wire rcc_spi6_ker_clk,
    output wire rcc_lpuart1_pclk,
    output wire rcc_lpuart1_ker_clk,
    output wire rcc_syscfg_pclk,
    output wire rcc_iwdg2_pclk,
    output wire rcc_iwdg1_pclk,
    output wire rcc_exti_pclk
    //end per_ker_clk_control region
);
  /*AUTOWIRE*/
  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire       adc12rst;  // From u_rcc_reg of rcc_reg.v
  wire       adc3rst;  // From u_rcc_reg of rcc_reg.v
  wire [1:0] adcsel;  // From u_rcc_reg of rcc_reg.v
  wire       bdmarst;  // From u_rcc_reg of rcc_reg.v
  wire [1:0] cecsel;  // From u_rcc_reg of rcc_reg.v
  wire [1:0] clkpersel;  // From u_rcc_reg of rcc_reg.v
  wire       comp12rst;  // From u_rcc_reg of rcc_reg.v
  wire       cpu1_clk_arcg_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       cpu1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       cpu2_clk_arcg_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       cpu2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       crcrst;  // From u_rcc_reg of rcc_reg.v
  wire       crsrst;  // From u_rcc_reg of rcc_reg.v
  wire       cryptrst;  // From u_rcc_reg of rcc_reg.v
  wire       csirdyie;  // From u_rcc_reg of rcc_reg.v
  wire       d1_clk_arcg_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       d1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire [3:0] d1cpre;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] d1ppre;  // From u_rcc_reg of rcc_reg.v
  wire       d2_clk_arcg_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       d2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire [2:0] d2ppre1;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] d2ppre2;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] d3ppre;  // From u_rcc_reg of rcc_reg.v
  wire       dac12rst;  // From u_rcc_reg of rcc_reg.v
  wire       dcmirst;  // From u_rcc_reg of rcc_reg.v
  wire       dfsdm1rst;  // From u_rcc_reg of rcc_reg.v
  wire       dfsdm1sel;  // From u_rcc_reg of rcc_reg.v
  wire [5:0] divm1;  // From u_rcc_reg of rcc_reg.v
  wire [5:0] divm2;  // From u_rcc_reg of rcc_reg.v
  wire [5:0] divm3;  // From u_rcc_reg of rcc_reg.v
  wire       dma1rst;  // From u_rcc_reg of rcc_reg.v
  wire       dma2drst;  // From u_rcc_reg of rcc_reg.v
  wire       dma2rst;  // From u_rcc_reg of rcc_reg.v
  wire       eth1macrst;  // From u_rcc_reg of rcc_reg.v
  wire       fdcanrst;  // From u_rcc_reg of rcc_reg.v
  wire [1:0] fdcansel;  // From u_rcc_reg of rcc_reg.v
  wire       fmcrst;  // From u_rcc_reg of rcc_reg.v
  wire [1:0] fmcsel;  // From u_rcc_reg of rcc_reg.v
  wire       gpioarst;  // From u_rcc_reg of rcc_reg.v
  wire       gpiobrst;  // From u_rcc_reg of rcc_reg.v
  wire       gpiocrst;  // From u_rcc_reg of rcc_reg.v
  wire       gpiodrst;  // From u_rcc_reg of rcc_reg.v
  wire       gpioerst;  // From u_rcc_reg of rcc_reg.v
  wire       gpiofrst;  // From u_rcc_reg of rcc_reg.v
  wire       gpiogrst;  // From u_rcc_reg of rcc_reg.v
  wire       gpiohrst;  // From u_rcc_reg of rcc_reg.v
  wire       gpioirst;  // From u_rcc_reg of rcc_reg.v
  wire       gpiojrst;  // From u_rcc_reg of rcc_reg.v
  wire       gpiokrst;  // From u_rcc_reg of rcc_reg.v
  wire       hashrst;  // From u_rcc_reg of rcc_reg.v
  wire       hdmicecrst;  // From u_rcc_reg of rcc_reg.v
  wire [3:0] hpre;  // From u_rcc_reg of rcc_reg.v
  wire       hrtimrst;  // From u_rcc_reg of rcc_reg.v
  wire       hrtimsel;  // From u_rcc_reg of rcc_reg.v
  wire       hsemrst;  // From u_rcc_reg of rcc_reg.v
  wire       hserdyie;  // From u_rcc_reg of rcc_reg.v
  wire       hsi48rdyie;  // From u_rcc_reg of rcc_reg.v
  wire       hsirdyie;  // From u_rcc_reg of rcc_reg.v
  wire [1:0] i2c123sel;  // From u_rcc_reg of rcc_reg.v
  wire       i2c1rst;  // From u_rcc_reg of rcc_reg.v
  wire       i2c2rst;  // From u_rcc_reg of rcc_reg.v
  wire       i2c3rst;  // From u_rcc_reg of rcc_reg.v
  wire       i2c4rst;  // From u_rcc_reg of rcc_reg.v
  wire [1:0] i2c4sel;  // From u_rcc_reg of rcc_reg.v
  wire       jpgdecrst;  // From u_rcc_reg of rcc_reg.v
  wire       lptim1rst;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] lptim1sel;  // From u_rcc_reg of rcc_reg.v
  wire       lptim2rst;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] lptim2sel;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] lptim345sel;  // From u_rcc_reg of rcc_reg.v
  wire       lptim3rst;  // From u_rcc_reg of rcc_reg.v
  wire       lptim4rst;  // From u_rcc_reg of rcc_reg.v
  wire       lptim5rst;  // From u_rcc_reg of rcc_reg.v
  wire       lpuart1rst;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] lpuart1sel;  // From u_rcc_reg of rcc_reg.v
  wire       lsecssie;  // From u_rcc_reg of rcc_reg.v
  wire       lserdyie;  // From u_rcc_reg of rcc_reg.v
  wire       lsirdyie;  // From u_rcc_reg of rcc_reg.v
  wire       ltdcrst;  // From u_rcc_reg of rcc_reg.v
  wire [3:0] mco1pre;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] mco1sel;  // From u_rcc_reg of rcc_reg.v
  wire [3:0] mco2pre;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] mco2sel;  // From u_rcc_reg of rcc_reg.v
  wire       mdiosrst;  // From u_rcc_reg of rcc_reg.v
  wire       mdmarst;  // From u_rcc_reg of rcc_reg.v
  wire       opamprst;  // From u_rcc_reg of rcc_reg.v
  wire       pll1rdyie;  // From u_rcc_reg of rcc_reg.v
  wire       pll2rdyie;  // From u_rcc_reg of rcc_reg.v
  wire       pll3rdyie;  // From u_rcc_reg of rcc_reg.v
  wire [1:0] pllsrc;  // From u_rcc_reg of rcc_reg.v
  wire       qspirst;  // From u_rcc_reg of rcc_reg.v
  wire [1:0] qspisel;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_adc12_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_adc12_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_adc3_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_adc3_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_adc3_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_axisram_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_axisram_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_bdma_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_bdma_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_bdma_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_bkpram_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_bkpram_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_bkpram_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_c1_adc12_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_adc12_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_adc3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_adc3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_axisram_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_bdma_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_bdma_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_bkpram_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_bkpram_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_comp12_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_comp12_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_crc_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_crc_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_crs_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_crs_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_crypt_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_crypt_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_dac12_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_dac12_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_dcmi_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_dcmi_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_dfsdm1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_dfsdm1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_dma1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_dma1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_dma2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_dma2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_dma2d_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_dma2d_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_dtcm1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_dtcm2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_eth1mac_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_eth1mac_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_eth1rx_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_eth1rx_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_eth1tx_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_eth1tx_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_fdcan_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_fdcan_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_fmc_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_fmc_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpioa_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpioa_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpiob_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpiob_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpioc_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpioc_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpiod_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpiod_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpioe_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpioe_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpiof_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpiof_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpiog_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpiog_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpioh_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpioh_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpioi_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpioi_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpioj_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpioj_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpiok_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_gpiok_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_hash_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_hash_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_hdmicec_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_hdmicec_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_hrtim_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_hrtim_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_hsem_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_i2c1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_i2c1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_i2c2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_i2c2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_i2c3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_i2c3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_i2c4_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_i2c4_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_itcm_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_jpgdec_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_jpgdec_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_lptim1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_lptim1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_lptim2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_lptim2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_lptim3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_lptim3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_lptim4_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_lptim4_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_lptim5_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_lptim5_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_lpuart1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_lpuart1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_ltdc_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_ltdc_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_mdios_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_mdios_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_mdma_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_mdma_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_opamp_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_opamp_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_qspi_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_qspi_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_rng_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_rng_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_rtc_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_rtc_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sai1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sai1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sai2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sai2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sai3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sai3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sai4_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sai4_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sdmmc1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sdmmc1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sdmmc2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sdmmc2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_spdifrx_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_spdifrx_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_spi1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_spi1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_spi2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_spi2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_spi3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_spi3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_spi4_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_spi4_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_spi5_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_spi5_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_spi6_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_spi6_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sram1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sram1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sram2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sram2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sram3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sram3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_sram4_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_swpmi_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_swpmi_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_syscfg_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_syscfg_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim12_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim12_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim13_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim13_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim14_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim14_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim15_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim15_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim16_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim16_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim17_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim17_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim4_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim4_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim5_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim5_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim6_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim6_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim7_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim7_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim8_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_tim8_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_uart4_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_uart4_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_uart5_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_uart5_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_uart7_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_uart7_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_uart8_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_uart8_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usart1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usart1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usart2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usart2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usart3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usart3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usart6_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usart6_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usb1otg_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usb1otg_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usb1ulpi_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usb1ulpi_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usb2otg_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usb2otg_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usb2ulpi_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_usb2ulpi_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_vref_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_vref_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_wwdg1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_wwdg1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_wwdg2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c1_wwdg2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_adc12_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_adc12_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_adc3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_adc3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_axisram_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_axisram_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_bdma_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_bdma_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_bkpram_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_bkpram_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_comp12_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_comp12_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_crc_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_crc_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_crs_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_crs_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_crypt_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_crypt_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dac12_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dac12_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dcmi_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dcmi_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dfsdm1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dfsdm1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dma1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dma1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dma2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dma2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dma2d_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dma2d_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dtcm1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dtcm1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dtcm2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_dtcm2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_eth1mac_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_eth1mac_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_eth1rx_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_eth1rx_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_eth1tx_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_eth1tx_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_fdcan_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_fdcan_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_fmc_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_fmc_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpioa_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpioa_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpiob_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpiob_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpioc_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpioc_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpiod_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpiod_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpioe_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpioe_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpiof_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpiof_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpiog_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpiog_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpioh_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpioh_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpioi_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpioi_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpioj_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpioj_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpiok_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_gpiok_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_hash_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_hash_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_hdmicec_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_hdmicec_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_hrtim_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_hrtim_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_hsem_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_i2c1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_i2c1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_i2c2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_i2c2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_i2c3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_i2c3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_i2c4_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_i2c4_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_itcm_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_itcm_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_jpgdec_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_jpgdec_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_lptim1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_lptim1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_lptim2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_lptim2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_lptim3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_lptim3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_lptim4_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_lptim4_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_lptim5_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_lptim5_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_lpuart1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_lpuart1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_ltdc_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_ltdc_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_mdios_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_mdios_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_mdma_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_mdma_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_opamp_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_opamp_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_qspi_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_qspi_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_rng_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_rng_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_rtc_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_rtc_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sai1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sai1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sai2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sai2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sai3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sai3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sai4_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sai4_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sdmmc1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sdmmc1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sdmmc2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sdmmc2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_spdifrx_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_spdifrx_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_spi1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_spi1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_spi2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_spi2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_spi3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_spi3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_spi4_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_spi4_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_spi5_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_spi5_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_spi6_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_spi6_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sram1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sram2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sram3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_sram4_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_swpmi_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_swpmi_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_syscfg_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_syscfg_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim12_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim12_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim13_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim13_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim14_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim14_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim15_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim15_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim16_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim16_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim17_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim17_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim4_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim4_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim5_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim5_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim6_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim6_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim7_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim7_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim8_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_tim8_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_uart4_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_uart4_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_uart5_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_uart5_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_uart7_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_uart7_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_uart8_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_uart8_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usart1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usart1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usart2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usart2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usart3_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usart3_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usart6_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usart6_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usb1otg_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usb1otg_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usb1ulpi_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usb1ulpi_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usb2otg_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usb2otg_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usb2ulpi_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_usb2ulpi_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_vref_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_vref_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_wwdg1_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_wwdg1_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_wwdg2_en;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_c2_wwdg2_lpen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_comp12_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_comp12_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_comp12_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_crc_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_crc_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_crc_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_crs_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_crs_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_crypt_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_crypt_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_csirdyf;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_dac12_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_dac12_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_dcmi_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_dcmi_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_dfsdm1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_dfsdm1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_dma1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_dma1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_dma2_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_dma2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_dma2d_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_dma2d_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_dtcm1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_dtcm1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_dtcm2_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_dtcm2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_eth1mac_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_eth1mac_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_eth1rx_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_eth1rx_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_eth1tx_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_eth1tx_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_exti_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_exti_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_fdcan_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_fdcan_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_flash_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_flash_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_fmc_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_fmc_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_gpioa_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_gpioa_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_gpiob_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_gpiob_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_gpioc_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_gpioc_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_gpiod_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_gpiod_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_gpioe_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_gpioe_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_gpiof_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_gpiof_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_gpiog_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_gpiog_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_gpioh_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_gpioh_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_gpioi_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_gpioi_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_gpioj_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_gpioj_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_gpiok_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_gpiok_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_gpv_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_gpv_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_hash_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_hash_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_hdmicec_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_hdmicec_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_hrtim_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_hrtim_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_hsecssf;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_hsem_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_hsem_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_hserdyf;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_hsi48rdyf;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_hsirdyf;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_i2c1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_i2c1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_i2c2_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_i2c2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_i2c3_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_i2c3_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_i2c4_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_i2c4_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_i2c4_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_itcm_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_itcm_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_iwdg1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_iwdg1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_iwdg2_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_iwdg2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_jpgdec_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_jpgdec_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_lptim1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_lptim1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_lptim2_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_lptim2_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_lptim2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_lptim3_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_lptim3_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_lptim3_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_lptim4_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_lptim4_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_lptim4_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_lptim5_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_lptim5_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_lptim5_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_lpuart1_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_lpuart1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_lpuart1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_lsecssf;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_lserdyf;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_lsirdyf;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_ltdc_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_ltdc_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_mdios_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_mdios_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_mdma_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_mdma_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_opamp_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_opamp_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_pll1rdyf;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_pll2rdyf;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_pll3rdyf;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_pwr_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_pwr_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_qspi_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_qspi_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_ramecc1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_ramecc1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_ramecc2_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_ramecc2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_ramecc3_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_ramecc3_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_rcc_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_rcc_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_rng_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_rng_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_rtc_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_rtc_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_rtc_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_sai1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_sai1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_sai2_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_sai2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_sai3_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_sai3_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_sai4_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_sai4_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_sai4_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_sdmmc1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_sdmmc1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_sdmmc2_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_sdmmc2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_spdifrx_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_spdifrx_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_spi1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_spi1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_spi2_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_spi2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_spi3_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_spi3_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_spi4_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_spi4_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_spi5_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_spi5_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_spi6_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_spi6_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_spi6_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_sram1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_sram1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_sram2_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_sram2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_sram3_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_sram3_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_sram4_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_sram4_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_sram4_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_swpmi_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_swpmi_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_syscfg_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_syscfg_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_tim12_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_tim12_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_tim13_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_tim13_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_tim14_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_tim14_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_tim15_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_tim15_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_tim16_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_tim16_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_tim17_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_tim17_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_tim1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_tim1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_tim2_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_tim2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_tim3_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_tim3_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_tim4_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_tim4_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_tim5_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_tim5_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_tim6_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_tim6_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_tim7_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_tim7_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_tim8_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_tim8_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_uart4_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_uart4_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_uart5_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_uart5_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_uart7_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_uart7_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_uart8_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_uart8_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_usart1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_usart1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_usart2_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_usart2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_usart3_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_usart3_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_usart6_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_usart6_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_usb1otg_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_usb1otg_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_usb1ulpi_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_usb1ulpi_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_usb2otg_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_usb2otg_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_usb2ulpi_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_usb2ulpi_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_vref_amen;  // From u_rcc_reg of rcc_reg.v
  wire       rcc_vref_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_vref_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_wwdg1_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_wwdg1_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rcc_wwdg2_arcg_clk_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       rcc_wwdg2_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       rngrst;  // From u_rcc_reg of rcc_reg.v
  wire [1:0] rngsel;  // From u_rcc_reg of rcc_reg.v
  wire       rst_n;  // From u_rcc_ahb_lite_bus of rcc_ahb_lite_bus.v
  wire [5:0] rtcpre;  // From u_rcc_reg of rcc_reg.v
  wire       sai1rst;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] sai1sel;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] sai23sel;  // From u_rcc_reg of rcc_reg.v
  wire       sai2rst;  // From u_rcc_reg of rcc_reg.v
  wire       sai3rst;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] sai4asel;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] sai4bsel;  // From u_rcc_reg of rcc_reg.v
  wire       sai4rst;  // From u_rcc_reg of rcc_reg.v
  wire       sdmmc1rst;  // From u_rcc_reg of rcc_reg.v
  wire       sdmmc2rst;  // From u_rcc_reg of rcc_reg.v
  wire       sdmmcsel;  // From u_rcc_reg of rcc_reg.v
  wire       spdifrxrst;  // From u_rcc_reg of rcc_reg.v
  wire [1:0] spdifsel;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] spi123sel;  // From u_rcc_reg of rcc_reg.v
  wire       spi1rst;  // From u_rcc_reg of rcc_reg.v
  wire       spi2rst;  // From u_rcc_reg of rcc_reg.v
  wire       spi3rst;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] spi45sel;  // From u_rcc_reg of rcc_reg.v
  wire       spi4rst;  // From u_rcc_reg of rcc_reg.v
  wire       spi5rst;  // From u_rcc_reg of rcc_reg.v
  wire       spi6rst;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] spi6sel;  // From u_rcc_reg of rcc_reg.v
  wire [1:0] sw;  // From u_rcc_reg of rcc_reg.v
  wire       swpmirst;  // From u_rcc_reg of rcc_reg.v
  wire       swpmisel;  // From u_rcc_reg of rcc_reg.v
  wire       sys_clk;  // From u_rcc_vcore_clk_ctrl of rcc_vcore_clk_ctrl.v
  wire       sys_clk_arcg_en;  // From u_rcc_sys_async_reset_clk_gate of rcc_sys_async_reset_clk_gate.v
  wire       sys_clk_pre;  // From u_rcc_vcore_clk_ctrl of rcc_vcore_clk_ctrl.v
  wire       sys_rst_n;  // From u_rcc_vcore_rst_ctrl of rcc_vcore_rst_ctrl.v
  wire       syscfgrst;  // From u_rcc_reg of rcc_reg.v
  wire       tim12rst;  // From u_rcc_reg of rcc_reg.v
  wire       tim13rst;  // From u_rcc_reg of rcc_reg.v
  wire       tim14rst;  // From u_rcc_reg of rcc_reg.v
  wire       tim15rst;  // From u_rcc_reg of rcc_reg.v
  wire       tim16rst;  // From u_rcc_reg of rcc_reg.v
  wire       tim17rst;  // From u_rcc_reg of rcc_reg.v
  wire       tim1rst;  // From u_rcc_reg of rcc_reg.v
  wire       tim2rst;  // From u_rcc_reg of rcc_reg.v
  wire       tim3rst;  // From u_rcc_reg of rcc_reg.v
  wire       tim4rst;  // From u_rcc_reg of rcc_reg.v
  wire       tim5rst;  // From u_rcc_reg of rcc_reg.v
  wire       tim6rst;  // From u_rcc_reg of rcc_reg.v
  wire       tim7rst;  // From u_rcc_reg of rcc_reg.v
  wire       tim8rst;  // From u_rcc_reg of rcc_reg.v
  wire       timpre;  // From u_rcc_reg of rcc_reg.v
  wire       uart4rst;  // From u_rcc_reg of rcc_reg.v
  wire       uart5rst;  // From u_rcc_reg of rcc_reg.v
  wire       uart7rst;  // From u_rcc_reg of rcc_reg.v
  wire       uart8rst;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] usart16sel;  // From u_rcc_reg of rcc_reg.v
  wire       usart1rst;  // From u_rcc_reg of rcc_reg.v
  wire [2:0] usart234578sel;  // From u_rcc_reg of rcc_reg.v
  wire       usart2rst;  // From u_rcc_reg of rcc_reg.v
  wire       usart3rst;  // From u_rcc_reg of rcc_reg.v
  wire       usart6rst;  // From u_rcc_reg of rcc_reg.v
  wire       usb1otgrst;  // From u_rcc_reg of rcc_reg.v
  wire       usb2otgrst;  // From u_rcc_reg of rcc_reg.v
  wire [1:0] usbsel;  // From u_rcc_reg of rcc_reg.v
  wire       vrefrst;  // From u_rcc_reg of rcc_reg.v
  // End of automatics
  /*AUTOREG*/

  ///////////////////////////////////////
  // dx_req signal generate /////////////
  ///////////////////////////////////////

  assign rcc_exit_sys_stop    = pwr_d3_wkup;

  assign d1_rst               = ~d1_rst_n;
  assign d2_rst               = ~d2_rst_n;

  assign rcc_d1_busy          = axibridge_d1_busy | ahb3bridge_d1_busy | apb3bridge_d1_busy | flash_busy;
  assign rcc_d2_busy          = ahb1bridge_d2_busy | ahb2bridge_d2_busy | apb1bridge_d2_busy | apb2bridge_d2_busy;
  assign rcc_d3_busy          = rcc_d1_busy | rcc_d2_busy | ahb4bridge_d3_busy | apb4bridge_d3_busy;


  assign rcc_pwr_d1_req_set_n = ~(c1_deepsleep & (~c2_per_alloc_d1 | c2_deepsleep) & ~rcc_d1_busy);  // 'c1 stop' and 'c2 stop or no peripherals in d1 allocate to c2' and 'd1 not busy' 
  assign rcc_pwr_d2_req_set_n = ~(c2_deepsleep & (~c1_per_alloc_d2 | c1_deepsleep) & ~rcc_d2_busy);  // 'c2 stop' and 'c1 stop or no peripherals in d2 allocate to c1' and 'd2 not busy'
  assign rcc_pwr_d3_req_set_n = ~((c1_deepsleep & c2_deepsleep & d3_deepsleep) & ~rcc_d3_busy);  // 'c1 stop' and 'c2 stop' and 'd3 stop' and 'd3 not busy'

  assign rcc_d1_stop          = rcc_pwr_d1_req;
  assign rcc_d2_stop          = rcc_pwr_d2_req;
  assign rcc_sys_stop         = rcc_pwr_d3_req;

  BB_dfflrs #(
      .DW     (1),
      .RST_VAL(0),
      .SET_VAL(1)
  ) u_BB_rcc_pwr_d1_req_dfflrs (
      .clk  (sys_clk),
      .rst_n(sys_arcg_rst_n),
      .set_n(rcc_pwr_d1_req_set_n),
      .en   (pwr_d1_wkup),
      .din  (1'b0),

      .dout(rcc_pwr_d1_req)
  );  // it could be chnaged with no reset

  BB_dfflrs #(
      .DW     (1),
      .RST_VAL(0),
      .SET_VAL(1)
  ) u_BB_rcc_pwr_d2_req_dfflrs (
      .clk  (sys_clk),
      .rst_n(sys_arcg_rst_n),
      .set_n(rcc_pwr_d2_req_set_n),
      .en   (pwr_d2_wkup),
      .din  (1'b0),

      .dout(rcc_pwr_d2_req)
  );

  BB_dfflrs #(
      .DW     (1),
      .RST_VAL(0),
      .SET_VAL(1)
  ) u_BB_rcc_pwr_d3_req_dfflrs (
      .clk  (sys_clk),
      .rst_n(sys_arcg_rst_n),
      .set_n(rcc_pwr_d3_req_set_n),
      .en   (pwr_d3_wkup),
      .din  (1'b0),

      .dout(rcc_pwr_d3_req)
  );

  // interrrupt logic
  assign rcc_hsefail_it = rcc_hsecssf;
  assign rcc_lsefail_it = rcc_lsecssf & lsecssie;
  assign rcc_it         = (rcc_pll3rdyf & pll3rdyie) | (rcc_pll2rdyf & pll2rdyie) | (rcc_pll1rdyf & pll1rdyie) | (rcc_hsi48rdyf & hsi48rdyie) | (rcc_csirdyf & csirdyie) | (rcc_hserdyf & hserdyie) | (rcc_hsirdyf & hsirdyie) | (rcc_lserdyf & lserdyie) | (rcc_lsirdyf & lsirdyie);


  ///////////////////////////////////////
  //signals rename //////////////////////
  ///////////////////////////////////////
  wire        ww1rsc;
  wire        ww2rsc;
  wire [ 1:0] pll_src_sel;
  wire [ 1:0] sys_clk_sw;
  wire        clk;
  wire [ 3:0] we;
  wire [31:0] addr;
  wire [31:0] wdata;
  wire [31:0] rdata;
  wire [ 1:0] rsp;
  wire        req;
  wire        hrst_n;
  wire        rcc_c1_flitf_lpen;
  wire        rcc_c2_flitf_en;
  wire        rcc_c2_flitf_lpen;

  assign sys_clk_sw        = sw;
  assign pll_src_sel       = pllsrc;
  assign rcc_c1_flash_lpen = rcc_c1_flitf_lpen;
  assign rcc_c2_flash_en   = rcc_c2_flitf_en;
  assign rcc_c2_flash_lpen = rcc_c2_flitf_lpen;

  rcc_vcore_clk_ctrl u_rcc_vcore_clk_ctrl (  /*AUTOINST*/
      // Outputs
      .sys_clk                  (sys_clk),
      .sys_clk_pre              (sys_clk_pre),
      .mco1                     (mco1),
      .mco2                     (mco2),
      .c2_per_alloc_d1          (c2_per_alloc_d1),
      .c1_per_alloc_d2          (c1_per_alloc_d2),
      .rcc_c2_clk               (rcc_c2_clk),
      .rcc_fclk_c2              (rcc_fclk_c2),
      .rcc_c2_systick_clk       (rcc_c2_systick_clk),
      .rcc_c1_clk               (rcc_c1_clk),
      .rcc_fclk_c1              (rcc_fclk_c1),
      .rcc_c1_systick_clk       (rcc_c1_systick_clk),
      .rcc_timx_ker_clk         (rcc_timx_ker_clk),
      .rcc_timy_ker_clk         (rcc_timy_ker_clk),
      .rcc_hrtimer_prescalar_clk(rcc_hrtimer_prescalar_clk),
      .sys_d1cpre_clk           (sys_d1cpre_clk),
      .sys_hpre_clk             (sys_hpre_clk),
      .hse_rtc_clk              (hse_rtc_clk),
      .rcc_axibridge_d1_clk     (rcc_axibridge_d1_clk),
      .rcc_ahb3bridge_d1_clk    (rcc_ahb3bridge_d1_clk),
      .rcc_apb3bridge_d1_clk    (rcc_apb3bridge_d1_clk),
      .rcc_ahb1bridge_d2_clk    (rcc_ahb1bridge_d2_clk),
      .rcc_ahb2bridge_d2_clk    (rcc_ahb2bridge_d2_clk),
      .rcc_apb1bridge_d2_clk    (rcc_apb1bridge_d2_clk),
      .rcc_apb2bridge_d2_clk    (rcc_apb2bridge_d2_clk),
      .rcc_ahb4bridge_d3_clk    (rcc_ahb4bridge_d3_clk),
      .rcc_apb4bridge_d3_clk    (rcc_apb4bridge_d3_clk),
      .pll1_src_clk             (pll1_src_clk),
      .pll2_src_clk             (pll2_src_clk),
      .pll3_src_clk             (pll3_src_clk),
      .rcc_rtc_pclk             (rcc_rtc_pclk),
      .rcc_flash_aclk           (rcc_flash_aclk),
      .rcc_flash_hclk           (rcc_flash_hclk),
      .rcc_qspi_aclk            (rcc_qspi_aclk),
      .rcc_qspi_hclk            (rcc_qspi_hclk),
      .rcc_qspi_ker_clk         (rcc_qspi_ker_clk),
      .rcc_axisram_aclk         (rcc_axisram_aclk),
      .rcc_fmc_aclk             (rcc_fmc_aclk),
      .rcc_fmc_hclk             (rcc_fmc_hclk),
      .rcc_fmc_ker_clk          (rcc_fmc_ker_clk),
      .rcc_dma2d_aclk           (rcc_dma2d_aclk),
      .rcc_dma2d_hclk           (rcc_dma2d_hclk),
      .rcc_mdma_aclk            (rcc_mdma_aclk),
      .rcc_mdma_hclk            (rcc_mdma_hclk),
      .rcc_ltdc_aclk            (rcc_ltdc_aclk),
      .rcc_ltdc_pclk            (rcc_ltdc_pclk),
      .rcc_ltdc_ker_clk         (rcc_ltdc_ker_clk),
      .rcc_ramecc1_hclk         (rcc_ramecc1_hclk),
      .rcc_gpv_hclk             (rcc_gpv_hclk),
      .rcc_itcm_hclk            (rcc_itcm_hclk),
      .rcc_dtcm2_hclk           (rcc_dtcm2_hclk),
      .rcc_dtcm1_hclk           (rcc_dtcm1_hclk),
      .rcc_jpgdec_hclk          (rcc_jpgdec_hclk),
      .rcc_sdmmc1_hclk          (rcc_sdmmc1_hclk),
      .rcc_sdmmc1_ker_clk       (rcc_sdmmc1_ker_clk),
      .rcc_wwdg1_pclk           (rcc_wwdg1_pclk),
      .rcc_usb2ulpi_hclk        (rcc_usb2ulpi_hclk),
      .rcc_usb2otg_hclk         (rcc_usb2otg_hclk),
      .rcc_usb2otg_ker_clk      (rcc_usb2otg_ker_clk),
      .rcc_usb1ulpi_hclk        (rcc_usb1ulpi_hclk),
      .rcc_usb1ulpi_ker_clk     (rcc_usb1ulpi_ker_clk),
      .rcc_usb1otg_hclk         (rcc_usb1otg_hclk),
      .rcc_usb1otg_ker_clk      (rcc_usb1otg_ker_clk),
      .rcc_eth1rx_hclk          (rcc_eth1rx_hclk),
      .rcc_eth1tx_hclk          (rcc_eth1tx_hclk),
      .rcc_eth1mac_hclk         (rcc_eth1mac_hclk),
      .rcc_adc12_hclk           (rcc_adc12_hclk),
      .rcc_adc12_ker_clk        (rcc_adc12_ker_clk),
      .rcc_dma2_hclk            (rcc_dma2_hclk),
      .rcc_dma1_hclk            (rcc_dma1_hclk),
      .rcc_sram3_hclk           (rcc_sram3_hclk),
      .rcc_sram2_hclk           (rcc_sram2_hclk),
      .rcc_sram1_hclk           (rcc_sram1_hclk),
      .rcc_sdmmc2_hclk          (rcc_sdmmc2_hclk),
      .rcc_sdmmc2_ker_clk       (rcc_sdmmc2_ker_clk),
      .rcc_rng_hclk             (rcc_rng_hclk),
      .rcc_rng_ker_clk          (rcc_rng_ker_clk),
      .rcc_hash_hclk            (rcc_hash_hclk),
      .rcc_crypt_hclk           (rcc_crypt_hclk),
      .rcc_dcmi_hclk            (rcc_dcmi_hclk),
      .rcc_ramecc2_hclk         (rcc_ramecc2_hclk),
      .rcc_uart8_pclk           (rcc_uart8_pclk),
      .rcc_uart8_ker_clk        (rcc_uart8_ker_clk),
      .rcc_uart7_pclk           (rcc_uart7_pclk),
      .rcc_uart7_ker_clk        (rcc_uart7_ker_clk),
      .rcc_dac12_pclk           (rcc_dac12_pclk),
      .rcc_hdmicec_pclk         (rcc_hdmicec_pclk),
      .rcc_hdmicec_ker_clk      (rcc_hdmicec_ker_clk),
      .rcc_i2c3_pclk            (rcc_i2c3_pclk),
      .rcc_i2c3_ker_clk         (rcc_i2c3_ker_clk),
      .rcc_i2c2_pclk            (rcc_i2c2_pclk),
      .rcc_i2c2_ker_clk         (rcc_i2c2_ker_clk),
      .rcc_i2c1_pclk            (rcc_i2c1_pclk),
      .rcc_i2c1_ker_clk         (rcc_i2c1_ker_clk),
      .rcc_uart5_pclk           (rcc_uart5_pclk),
      .rcc_uart5_ker_clk        (rcc_uart5_ker_clk),
      .rcc_uart4_pclk           (rcc_uart4_pclk),
      .rcc_uart4_ker_clk        (rcc_uart4_ker_clk),
      .rcc_usart3_pclk          (rcc_usart3_pclk),
      .rcc_usart3_ker_clk       (rcc_usart3_ker_clk),
      .rcc_usart2_pclk          (rcc_usart2_pclk),
      .rcc_usart2_ker_clk       (rcc_usart2_ker_clk),
      .rcc_spdifrx_pclk         (rcc_spdifrx_pclk),
      .rcc_spdifrx_ker_clk      (rcc_spdifrx_ker_clk),
      .rcc_spi3_pclk            (rcc_spi3_pclk),
      .rcc_spi3_ker_clk         (rcc_spi3_ker_clk),
      .rcc_spi2_pclk            (rcc_spi2_pclk),
      .rcc_spi2_ker_clk         (rcc_spi2_ker_clk),
      .rcc_wwdg2_pclk           (rcc_wwdg2_pclk),
      .rcc_lptim1_pclk          (rcc_lptim1_pclk),
      .rcc_lptim1_ker_clk       (rcc_lptim1_ker_clk),
      .rcc_tim14_pclk           (rcc_tim14_pclk),
      .rcc_tim14_ker_clk        (rcc_tim14_ker_clk),
      .rcc_tim13_pclk           (rcc_tim13_pclk),
      .rcc_tim13_ker_clk        (rcc_tim13_ker_clk),
      .rcc_tim12_pclk           (rcc_tim12_pclk),
      .rcc_tim12_ker_clk        (rcc_tim12_ker_clk),
      .rcc_tim7_pclk            (rcc_tim7_pclk),
      .rcc_tim7_ker_clk         (rcc_tim7_ker_clk),
      .rcc_tim6_pclk            (rcc_tim6_pclk),
      .rcc_tim6_ker_clk         (rcc_tim6_ker_clk),
      .rcc_tim5_pclk            (rcc_tim5_pclk),
      .rcc_tim5_ker_clk         (rcc_tim5_ker_clk),
      .rcc_tim4_pclk            (rcc_tim4_pclk),
      .rcc_tim4_ker_clk         (rcc_tim4_ker_clk),
      .rcc_tim3_pclk            (rcc_tim3_pclk),
      .rcc_tim3_ker_clk         (rcc_tim3_ker_clk),
      .rcc_tim2_pclk            (rcc_tim2_pclk),
      .rcc_tim2_ker_clk         (rcc_tim2_ker_clk),
      .rcc_fdcan_pclk           (rcc_fdcan_pclk),
      .rcc_fdcan_ker_clk        (rcc_fdcan_ker_clk),
      .rcc_mdios_pclk           (rcc_mdios_pclk),
      .rcc_opamp_pclk           (rcc_opamp_pclk),
      .rcc_swpmi_pclk           (rcc_swpmi_pclk),
      .rcc_swpmi_ker_clk        (rcc_swpmi_ker_clk),
      .rcc_crs_pclk             (rcc_crs_pclk),
      .rcc_hrtim_pclk           (rcc_hrtim_pclk),
      .rcc_hrtim_ker_clk        (rcc_hrtim_ker_clk),
      .rcc_dfsdm1_pclk          (rcc_dfsdm1_pclk),
      .rcc_dfsdm1_ker_clk_0     (rcc_dfsdm1_ker_clk_0),
      .rcc_dfsdm1_ker_clk_1     (rcc_dfsdm1_ker_clk_1),
      .rcc_sai3_pclk            (rcc_sai3_pclk),
      .rcc_sai3_ker_clk         (rcc_sai3_ker_clk),
      .rcc_sai2_pclk            (rcc_sai2_pclk),
      .rcc_sai2_ker_clk         (rcc_sai2_ker_clk),
      .rcc_sai1_pclk            (rcc_sai1_pclk),
      .rcc_sai1_ker_clk         (rcc_sai1_ker_clk),
      .rcc_spi5_pclk            (rcc_spi5_pclk),
      .rcc_spi5_ker_clk         (rcc_spi5_ker_clk),
      .rcc_tim17_pclk           (rcc_tim17_pclk),
      .rcc_tim17_ker_clk        (rcc_tim17_ker_clk),
      .rcc_tim16_pclk           (rcc_tim16_pclk),
      .rcc_tim16_ker_clk        (rcc_tim16_ker_clk),
      .rcc_tim15_pclk           (rcc_tim15_pclk),
      .rcc_tim15_ker_clk        (rcc_tim15_ker_clk),
      .rcc_spi4_pclk            (rcc_spi4_pclk),
      .rcc_spi4_ker_clk         (rcc_spi4_ker_clk),
      .rcc_spi1_pclk            (rcc_spi1_pclk),
      .rcc_spi1_ker_clk         (rcc_spi1_ker_clk),
      .rcc_usart6_pclk          (rcc_usart6_pclk),
      .rcc_usart6_ker_clk       (rcc_usart6_ker_clk),
      .rcc_usart1_pclk          (rcc_usart1_pclk),
      .rcc_usart1_ker_clk       (rcc_usart1_ker_clk),
      .rcc_tim8_pclk            (rcc_tim8_pclk),
      .rcc_tim8_ker_clk         (rcc_tim8_ker_clk),
      .rcc_tim1_pclk            (rcc_tim1_pclk),
      .rcc_tim1_ker_clk         (rcc_tim1_ker_clk),
      .rcc_sram4_hclk           (rcc_sram4_hclk),
      .rcc_bkpram_hclk          (rcc_bkpram_hclk),
      .rcc_ramecc3_hclk         (rcc_ramecc3_hclk),
      .rcc_hsem_hclk            (rcc_hsem_hclk),
      .rcc_adc3_hclk            (rcc_adc3_hclk),
      .rcc_adc3_ker_clk         (rcc_adc3_ker_clk),
      .rcc_bdma_hclk            (rcc_bdma_hclk),
      .rcc_crc_hclk             (rcc_crc_hclk),
      .rcc_gpiok_hclk           (rcc_gpiok_hclk),
      .rcc_gpioj_hclk           (rcc_gpioj_hclk),
      .rcc_gpioi_hclk           (rcc_gpioi_hclk),
      .rcc_gpioh_hclk           (rcc_gpioh_hclk),
      .rcc_gpiog_hclk           (rcc_gpiog_hclk),
      .rcc_gpiof_hclk           (rcc_gpiof_hclk),
      .rcc_gpioe_hclk           (rcc_gpioe_hclk),
      .rcc_gpiod_hclk           (rcc_gpiod_hclk),
      .rcc_gpioc_hclk           (rcc_gpioc_hclk),
      .rcc_gpiob_hclk           (rcc_gpiob_hclk),
      .rcc_gpioa_hclk           (rcc_gpioa_hclk),
      .rcc_rcc_hclk             (rcc_rcc_hclk),
      .rcc_pwr_hclk             (rcc_pwr_hclk),
      .rcc_sai4_pclk            (rcc_sai4_pclk),
      .rcc_sai4_ker_clk_0       (rcc_sai4_ker_clk_0),
      .rcc_sai4_ker_clk_1       (rcc_sai4_ker_clk_1),
      .rcc_vref_pclk            (rcc_vref_pclk),
      .rcc_comp12_pclk          (rcc_comp12_pclk),
      .rcc_lptim5_pclk          (rcc_lptim5_pclk),
      .rcc_lptim5_ker_clk       (rcc_lptim5_ker_clk),
      .rcc_lptim4_pclk          (rcc_lptim4_pclk),
      .rcc_lptim4_ker_clk       (rcc_lptim4_ker_clk),
      .rcc_lptim3_pclk          (rcc_lptim3_pclk),
      .rcc_lptim3_ker_clk       (rcc_lptim3_ker_clk),
      .rcc_lptim2_pclk          (rcc_lptim2_pclk),
      .rcc_lptim2_ker_clk       (rcc_lptim2_ker_clk),
      .rcc_i2c4_pclk            (rcc_i2c4_pclk),
      .rcc_i2c4_ker_clk         (rcc_i2c4_ker_clk),
      .rcc_spi6_pclk            (rcc_spi6_pclk),
      .rcc_spi6_ker_clk         (rcc_spi6_ker_clk),
      .rcc_lpuart1_pclk         (rcc_lpuart1_pclk),
      .rcc_lpuart1_ker_clk      (rcc_lpuart1_ker_clk),
      .rcc_syscfg_pclk          (rcc_syscfg_pclk),
      .rcc_iwdg2_pclk           (rcc_iwdg2_pclk),
      .rcc_iwdg1_pclk           (rcc_iwdg1_pclk),
      .rcc_exti_pclk            (rcc_exti_pclk),
      .rcc_eth_mii_tx_clk       (rcc_eth_mii_tx_clk),
      .rcc_eth_mii_rx_clk       (rcc_eth_mii_rx_clk),
      .rcc_eth_rmii_ref_clk     (rcc_eth_rmii_ref_clk),
      // Inputs
      .pad_rcc_eth_mii_tx_clk   (pad_rcc_eth_mii_tx_clk),
      .pad_rcc_eth_mii_rx_clk   (pad_rcc_eth_mii_rx_clk),
      .USB_PHY1                 (USB_PHY1),
      .d3_deepsleep             (d3_deepsleep),
      .c2_sleep                 (c2_sleep),
      .c2_deepsleep             (c2_deepsleep),
      .c1_sleep                 (c1_sleep),
      .c1_deepsleep             (c1_deepsleep),
      .rcc_d1_stop              (rcc_d1_stop),
      .rcc_d2_stop              (rcc_d2_stop),
      .rcc_sys_stop             (rcc_sys_stop),
      .hsecss_fail              (hsecss_fail),
      .hse_clk_pre              (hse_clk_pre),
      .lse_clk                  (lse_clk),
      .lsi_clk                  (lsi_clk),
      .hsi48_clk                (hsi48_clk),
      .csi_clk_pre              (csi_clk_pre),
      .hsi_origin_clk           (hsi_origin_clk),
      .sys_rst_n                (sys_rst_n),
      .pll_src_sel              (pll_src_sel[1:0]),
      .pll1_q_clk               (pll1_q_clk),
      .pll1_p_clk               (pll1_p_clk),
      .pll2_p_clk               (pll2_p_clk),
      .pll2_q_clk               (pll2_q_clk),
      .pll2_r_clk               (pll2_r_clk),
      .pll3_p_clk               (pll3_p_clk),
      .pll3_q_clk               (pll3_q_clk),
      .pll3_r_clk               (pll3_r_clk),
      .I2S_clk_IN               (I2S_clk_IN),
      .rcc_c2_flash_en          (rcc_c2_flash_en),
      .rcc_c1_flash_lpen        (rcc_c1_flash_lpen),
      .rcc_c2_flash_lpen        (rcc_c2_flash_lpen),
      .rcc_c1_qspi_en           (rcc_c1_qspi_en),
      .rcc_c2_qspi_en           (rcc_c2_qspi_en),
      .rcc_c1_qspi_lpen         (rcc_c1_qspi_lpen),
      .rcc_c2_qspi_lpen         (rcc_c2_qspi_lpen),
      .rcc_c2_axisram_en        (rcc_c2_axisram_en),
      .rcc_c1_axisram_lpen      (rcc_c1_axisram_lpen),
      .rcc_c2_axisram_lpen      (rcc_c2_axisram_lpen),
      .rcc_c1_fmc_en            (rcc_c1_fmc_en),
      .rcc_c2_fmc_en            (rcc_c2_fmc_en),
      .rcc_c1_fmc_lpen          (rcc_c1_fmc_lpen),
      .rcc_c2_fmc_lpen          (rcc_c2_fmc_lpen),
      .rcc_c1_dma2d_en          (rcc_c1_dma2d_en),
      .rcc_c2_dma2d_en          (rcc_c2_dma2d_en),
      .rcc_c1_dma2d_lpen        (rcc_c1_dma2d_lpen),
      .rcc_c2_dma2d_lpen        (rcc_c2_dma2d_lpen),
      .rcc_c1_mdma_en           (rcc_c1_mdma_en),
      .rcc_c2_mdma_en           (rcc_c2_mdma_en),
      .rcc_c1_mdma_lpen         (rcc_c1_mdma_lpen),
      .rcc_c2_mdma_lpen         (rcc_c2_mdma_lpen),
      .rcc_c1_ltdc_en           (rcc_c1_ltdc_en),
      .rcc_c2_ltdc_en           (rcc_c2_ltdc_en),
      .rcc_c1_ltdc_lpen         (rcc_c1_ltdc_lpen),
      .rcc_c2_ltdc_lpen         (rcc_c2_ltdc_lpen),
      .rcc_c2_itcm_en           (rcc_c2_itcm_en),
      .rcc_c1_itcm_lpen         (rcc_c1_itcm_lpen),
      .rcc_c2_itcm_lpen         (rcc_c2_itcm_lpen),
      .rcc_c2_dtcm2_en          (rcc_c2_dtcm2_en),
      .rcc_c1_dtcm2_lpen        (rcc_c1_dtcm2_lpen),
      .rcc_c2_dtcm2_lpen        (rcc_c2_dtcm2_lpen),
      .rcc_c2_dtcm1_en          (rcc_c2_dtcm1_en),
      .rcc_c1_dtcm1_lpen        (rcc_c1_dtcm1_lpen),
      .rcc_c2_dtcm1_lpen        (rcc_c2_dtcm1_lpen),
      .rcc_c1_jpgdec_en         (rcc_c1_jpgdec_en),
      .rcc_c2_jpgdec_en         (rcc_c2_jpgdec_en),
      .rcc_c1_jpgdec_lpen       (rcc_c1_jpgdec_lpen),
      .rcc_c2_jpgdec_lpen       (rcc_c2_jpgdec_lpen),
      .rcc_c1_sdmmc1_en         (rcc_c1_sdmmc1_en),
      .rcc_c2_sdmmc1_en         (rcc_c2_sdmmc1_en),
      .rcc_c1_sdmmc1_lpen       (rcc_c1_sdmmc1_lpen),
      .rcc_c2_sdmmc1_lpen       (rcc_c2_sdmmc1_lpen),
      .rcc_c1_wwdg1_en          (rcc_c1_wwdg1_en),
      .rcc_c2_wwdg1_en          (rcc_c2_wwdg1_en),
      .rcc_c1_wwdg1_lpen        (rcc_c1_wwdg1_lpen),
      .rcc_c2_wwdg1_lpen        (rcc_c2_wwdg1_lpen),
      .rcc_c1_usb2ulpi_en       (rcc_c1_usb2ulpi_en),
      .rcc_c2_usb2ulpi_en       (rcc_c2_usb2ulpi_en),
      .rcc_c1_usb2ulpi_lpen     (rcc_c1_usb2ulpi_lpen),
      .rcc_c2_usb2ulpi_lpen     (rcc_c2_usb2ulpi_lpen),
      .rcc_c1_usb2otg_en        (rcc_c1_usb2otg_en),
      .rcc_c2_usb2otg_en        (rcc_c2_usb2otg_en),
      .rcc_c1_usb2otg_lpen      (rcc_c1_usb2otg_lpen),
      .rcc_c2_usb2otg_lpen      (rcc_c2_usb2otg_lpen),
      .rcc_c1_usb1ulpi_en       (rcc_c1_usb1ulpi_en),
      .rcc_c2_usb1ulpi_en       (rcc_c2_usb1ulpi_en),
      .rcc_c1_usb1ulpi_lpen     (rcc_c1_usb1ulpi_lpen),
      .rcc_c2_usb1ulpi_lpen     (rcc_c2_usb1ulpi_lpen),
      .rcc_c1_usb1otg_en        (rcc_c1_usb1otg_en),
      .rcc_c2_usb1otg_en        (rcc_c2_usb1otg_en),
      .rcc_c1_usb1otg_lpen      (rcc_c1_usb1otg_lpen),
      .rcc_c2_usb1otg_lpen      (rcc_c2_usb1otg_lpen),
      .rcc_c1_eth1rx_en         (rcc_c1_eth1rx_en),
      .rcc_c2_eth1rx_en         (rcc_c2_eth1rx_en),
      .rcc_c1_eth1rx_lpen       (rcc_c1_eth1rx_lpen),
      .rcc_c2_eth1rx_lpen       (rcc_c2_eth1rx_lpen),
      .rcc_c1_eth1tx_en         (rcc_c1_eth1tx_en),
      .rcc_c2_eth1tx_en         (rcc_c2_eth1tx_en),
      .rcc_c1_eth1tx_lpen       (rcc_c1_eth1tx_lpen),
      .rcc_c2_eth1tx_lpen       (rcc_c2_eth1tx_lpen),
      .rcc_c1_eth1mac_en        (rcc_c1_eth1mac_en),
      .rcc_c2_eth1mac_en        (rcc_c2_eth1mac_en),
      .rcc_c1_eth1mac_lpen      (rcc_c1_eth1mac_lpen),
      .rcc_c2_eth1mac_lpen      (rcc_c2_eth1mac_lpen),
      .rcc_c1_adc12_en          (rcc_c1_adc12_en),
      .rcc_c2_adc12_en          (rcc_c2_adc12_en),
      .rcc_c1_adc12_lpen        (rcc_c1_adc12_lpen),
      .rcc_c2_adc12_lpen        (rcc_c2_adc12_lpen),
      .rcc_c1_dma2_en           (rcc_c1_dma2_en),
      .rcc_c2_dma2_en           (rcc_c2_dma2_en),
      .rcc_c1_dma2_lpen         (rcc_c1_dma2_lpen),
      .rcc_c2_dma2_lpen         (rcc_c2_dma2_lpen),
      .rcc_c1_dma1_en           (rcc_c1_dma1_en),
      .rcc_c2_dma1_en           (rcc_c2_dma1_en),
      .rcc_c1_dma1_lpen         (rcc_c1_dma1_lpen),
      .rcc_c2_dma1_lpen         (rcc_c2_dma1_lpen),
      .rcc_c1_sram3_en          (rcc_c1_sram3_en),
      .rcc_c1_sram3_lpen        (rcc_c1_sram3_lpen),
      .rcc_c2_sram3_lpen        (rcc_c2_sram3_lpen),
      .rcc_c1_sram2_en          (rcc_c1_sram2_en),
      .rcc_c1_sram2_lpen        (rcc_c1_sram2_lpen),
      .rcc_c2_sram2_lpen        (rcc_c2_sram2_lpen),
      .rcc_c1_sram1_en          (rcc_c1_sram1_en),
      .rcc_c1_sram1_lpen        (rcc_c1_sram1_lpen),
      .rcc_c2_sram1_lpen        (rcc_c2_sram1_lpen),
      .rcc_c1_sdmmc2_en         (rcc_c1_sdmmc2_en),
      .rcc_c2_sdmmc2_en         (rcc_c2_sdmmc2_en),
      .rcc_c1_sdmmc2_lpen       (rcc_c1_sdmmc2_lpen),
      .rcc_c2_sdmmc2_lpen       (rcc_c2_sdmmc2_lpen),
      .rcc_c1_rng_en            (rcc_c1_rng_en),
      .rcc_c2_rng_en            (rcc_c2_rng_en),
      .rcc_c1_rng_lpen          (rcc_c1_rng_lpen),
      .rcc_c2_rng_lpen          (rcc_c2_rng_lpen),
      .rcc_c1_hash_en           (rcc_c1_hash_en),
      .rcc_c2_hash_en           (rcc_c2_hash_en),
      .rcc_c1_hash_lpen         (rcc_c1_hash_lpen),
      .rcc_c2_hash_lpen         (rcc_c2_hash_lpen),
      .rcc_c1_crypt_en          (rcc_c1_crypt_en),
      .rcc_c2_crypt_en          (rcc_c2_crypt_en),
      .rcc_c1_crypt_lpen        (rcc_c1_crypt_lpen),
      .rcc_c2_crypt_lpen        (rcc_c2_crypt_lpen),
      .rcc_c1_dcmi_en           (rcc_c1_dcmi_en),
      .rcc_c2_dcmi_en           (rcc_c2_dcmi_en),
      .rcc_c1_dcmi_lpen         (rcc_c1_dcmi_lpen),
      .rcc_c2_dcmi_lpen         (rcc_c2_dcmi_lpen),
      .rcc_c1_uart8_en          (rcc_c1_uart8_en),
      .rcc_c2_uart8_en          (rcc_c2_uart8_en),
      .rcc_c1_uart8_lpen        (rcc_c1_uart8_lpen),
      .rcc_c2_uart8_lpen        (rcc_c2_uart8_lpen),
      .uart8_ker_clk_req        (uart8_ker_clk_req),
      .rcc_c1_uart7_en          (rcc_c1_uart7_en),
      .rcc_c2_uart7_en          (rcc_c2_uart7_en),
      .rcc_c1_uart7_lpen        (rcc_c1_uart7_lpen),
      .rcc_c2_uart7_lpen        (rcc_c2_uart7_lpen),
      .uart7_ker_clk_req        (uart7_ker_clk_req),
      .rcc_c1_dac12_en          (rcc_c1_dac12_en),
      .rcc_c2_dac12_en          (rcc_c2_dac12_en),
      .rcc_c1_dac12_lpen        (rcc_c1_dac12_lpen),
      .rcc_c2_dac12_lpen        (rcc_c2_dac12_lpen),
      .rcc_c1_hdmicec_en        (rcc_c1_hdmicec_en),
      .rcc_c2_hdmicec_en        (rcc_c2_hdmicec_en),
      .rcc_c1_hdmicec_lpen      (rcc_c1_hdmicec_lpen),
      .rcc_c2_hdmicec_lpen      (rcc_c2_hdmicec_lpen),
      .rcc_c1_i2c3_en           (rcc_c1_i2c3_en),
      .rcc_c2_i2c3_en           (rcc_c2_i2c3_en),
      .rcc_c1_i2c3_lpen         (rcc_c1_i2c3_lpen),
      .rcc_c2_i2c3_lpen         (rcc_c2_i2c3_lpen),
      .i2c3_ker_clk_req         (i2c3_ker_clk_req),
      .rcc_c1_i2c2_en           (rcc_c1_i2c2_en),
      .rcc_c2_i2c2_en           (rcc_c2_i2c2_en),
      .rcc_c1_i2c2_lpen         (rcc_c1_i2c2_lpen),
      .rcc_c2_i2c2_lpen         (rcc_c2_i2c2_lpen),
      .i2c2_ker_clk_req         (i2c2_ker_clk_req),
      .rcc_c1_i2c1_en           (rcc_c1_i2c1_en),
      .rcc_c2_i2c1_en           (rcc_c2_i2c1_en),
      .rcc_c1_i2c1_lpen         (rcc_c1_i2c1_lpen),
      .rcc_c2_i2c1_lpen         (rcc_c2_i2c1_lpen),
      .i2c1_ker_clk_req         (i2c1_ker_clk_req),
      .rcc_c1_uart5_en          (rcc_c1_uart5_en),
      .rcc_c2_uart5_en          (rcc_c2_uart5_en),
      .rcc_c1_uart5_lpen        (rcc_c1_uart5_lpen),
      .rcc_c2_uart5_lpen        (rcc_c2_uart5_lpen),
      .uart5_ker_clk_req        (uart5_ker_clk_req),
      .rcc_c1_uart4_en          (rcc_c1_uart4_en),
      .rcc_c2_uart4_en          (rcc_c2_uart4_en),
      .rcc_c1_uart4_lpen        (rcc_c1_uart4_lpen),
      .rcc_c2_uart4_lpen        (rcc_c2_uart4_lpen),
      .uart4_ker_clk_req        (uart4_ker_clk_req),
      .rcc_c1_usart3_en         (rcc_c1_usart3_en),
      .rcc_c2_usart3_en         (rcc_c2_usart3_en),
      .rcc_c1_usart3_lpen       (rcc_c1_usart3_lpen),
      .rcc_c2_usart3_lpen       (rcc_c2_usart3_lpen),
      .usart3_ker_clk_req       (usart3_ker_clk_req),
      .rcc_c1_usart2_en         (rcc_c1_usart2_en),
      .rcc_c2_usart2_en         (rcc_c2_usart2_en),
      .rcc_c1_usart2_lpen       (rcc_c1_usart2_lpen),
      .rcc_c2_usart2_lpen       (rcc_c2_usart2_lpen),
      .usart2_ker_clk_req       (usart2_ker_clk_req),
      .rcc_c1_spdifrx_en        (rcc_c1_spdifrx_en),
      .rcc_c2_spdifrx_en        (rcc_c2_spdifrx_en),
      .rcc_c1_spdifrx_lpen      (rcc_c1_spdifrx_lpen),
      .rcc_c2_spdifrx_lpen      (rcc_c2_spdifrx_lpen),
      .rcc_c1_spi3_en           (rcc_c1_spi3_en),
      .rcc_c2_spi3_en           (rcc_c2_spi3_en),
      .rcc_c1_spi3_lpen         (rcc_c1_spi3_lpen),
      .rcc_c2_spi3_lpen         (rcc_c2_spi3_lpen),
      .rcc_c1_spi2_en           (rcc_c1_spi2_en),
      .rcc_c2_spi2_en           (rcc_c2_spi2_en),
      .rcc_c1_spi2_lpen         (rcc_c1_spi2_lpen),
      .rcc_c2_spi2_lpen         (rcc_c2_spi2_lpen),
      .rcc_c1_wwdg2_en          (rcc_c1_wwdg2_en),
      .rcc_c2_wwdg2_en          (rcc_c2_wwdg2_en),
      .rcc_c1_wwdg2_lpen        (rcc_c1_wwdg2_lpen),
      .rcc_c2_wwdg2_lpen        (rcc_c2_wwdg2_lpen),
      .rcc_c1_lptim1_en         (rcc_c1_lptim1_en),
      .rcc_c2_lptim1_en         (rcc_c2_lptim1_en),
      .rcc_c1_lptim1_lpen       (rcc_c1_lptim1_lpen),
      .rcc_c2_lptim1_lpen       (rcc_c2_lptim1_lpen),
      .rcc_c1_tim14_en          (rcc_c1_tim14_en),
      .rcc_c2_tim14_en          (rcc_c2_tim14_en),
      .rcc_c1_tim14_lpen        (rcc_c1_tim14_lpen),
      .rcc_c2_tim14_lpen        (rcc_c2_tim14_lpen),
      .rcc_c1_tim13_en          (rcc_c1_tim13_en),
      .rcc_c2_tim13_en          (rcc_c2_tim13_en),
      .rcc_c1_tim13_lpen        (rcc_c1_tim13_lpen),
      .rcc_c2_tim13_lpen        (rcc_c2_tim13_lpen),
      .rcc_c1_tim12_en          (rcc_c1_tim12_en),
      .rcc_c2_tim12_en          (rcc_c2_tim12_en),
      .rcc_c1_tim12_lpen        (rcc_c1_tim12_lpen),
      .rcc_c2_tim12_lpen        (rcc_c2_tim12_lpen),
      .rcc_c1_tim7_en           (rcc_c1_tim7_en),
      .rcc_c2_tim7_en           (rcc_c2_tim7_en),
      .rcc_c1_tim7_lpen         (rcc_c1_tim7_lpen),
      .rcc_c2_tim7_lpen         (rcc_c2_tim7_lpen),
      .rcc_c1_tim6_en           (rcc_c1_tim6_en),
      .rcc_c2_tim6_en           (rcc_c2_tim6_en),
      .rcc_c1_tim6_lpen         (rcc_c1_tim6_lpen),
      .rcc_c2_tim6_lpen         (rcc_c2_tim6_lpen),
      .rcc_c1_tim5_en           (rcc_c1_tim5_en),
      .rcc_c2_tim5_en           (rcc_c2_tim5_en),
      .rcc_c1_tim5_lpen         (rcc_c1_tim5_lpen),
      .rcc_c2_tim5_lpen         (rcc_c2_tim5_lpen),
      .rcc_c1_tim4_en           (rcc_c1_tim4_en),
      .rcc_c2_tim4_en           (rcc_c2_tim4_en),
      .rcc_c1_tim4_lpen         (rcc_c1_tim4_lpen),
      .rcc_c2_tim4_lpen         (rcc_c2_tim4_lpen),
      .rcc_c1_tim3_en           (rcc_c1_tim3_en),
      .rcc_c2_tim3_en           (rcc_c2_tim3_en),
      .rcc_c1_tim3_lpen         (rcc_c1_tim3_lpen),
      .rcc_c2_tim3_lpen         (rcc_c2_tim3_lpen),
      .rcc_c1_tim2_en           (rcc_c1_tim2_en),
      .rcc_c2_tim2_en           (rcc_c2_tim2_en),
      .rcc_c1_tim2_lpen         (rcc_c1_tim2_lpen),
      .rcc_c2_tim2_lpen         (rcc_c2_tim2_lpen),
      .rcc_c1_fdcan_en          (rcc_c1_fdcan_en),
      .rcc_c2_fdcan_en          (rcc_c2_fdcan_en),
      .rcc_c1_fdcan_lpen        (rcc_c1_fdcan_lpen),
      .rcc_c2_fdcan_lpen        (rcc_c2_fdcan_lpen),
      .rcc_c1_mdios_en          (rcc_c1_mdios_en),
      .rcc_c2_mdios_en          (rcc_c2_mdios_en),
      .rcc_c1_mdios_lpen        (rcc_c1_mdios_lpen),
      .rcc_c2_mdios_lpen        (rcc_c2_mdios_lpen),
      .rcc_c1_opamp_en          (rcc_c1_opamp_en),
      .rcc_c2_opamp_en          (rcc_c2_opamp_en),
      .rcc_c1_opamp_lpen        (rcc_c1_opamp_lpen),
      .rcc_c2_opamp_lpen        (rcc_c2_opamp_lpen),
      .rcc_c1_swpmi_en          (rcc_c1_swpmi_en),
      .rcc_c2_swpmi_en          (rcc_c2_swpmi_en),
      .rcc_c1_swpmi_lpen        (rcc_c1_swpmi_lpen),
      .rcc_c2_swpmi_lpen        (rcc_c2_swpmi_lpen),
      .rcc_c1_crs_en            (rcc_c1_crs_en),
      .rcc_c2_crs_en            (rcc_c2_crs_en),
      .rcc_c1_crs_lpen          (rcc_c1_crs_lpen),
      .rcc_c2_crs_lpen          (rcc_c2_crs_lpen),
      .rcc_c1_hrtim_en          (rcc_c1_hrtim_en),
      .rcc_c2_hrtim_en          (rcc_c2_hrtim_en),
      .rcc_c1_hrtim_lpen        (rcc_c1_hrtim_lpen),
      .rcc_c2_hrtim_lpen        (rcc_c2_hrtim_lpen),
      .rcc_c1_dfsdm1_en         (rcc_c1_dfsdm1_en),
      .rcc_c2_dfsdm1_en         (rcc_c2_dfsdm1_en),
      .rcc_c1_dfsdm1_lpen       (rcc_c1_dfsdm1_lpen),
      .rcc_c2_dfsdm1_lpen       (rcc_c2_dfsdm1_lpen),
      .rcc_c1_sai3_en           (rcc_c1_sai3_en),
      .rcc_c2_sai3_en           (rcc_c2_sai3_en),
      .rcc_c1_sai3_lpen         (rcc_c1_sai3_lpen),
      .rcc_c2_sai3_lpen         (rcc_c2_sai3_lpen),
      .rcc_c1_sai2_en           (rcc_c1_sai2_en),
      .rcc_c2_sai2_en           (rcc_c2_sai2_en),
      .rcc_c1_sai2_lpen         (rcc_c1_sai2_lpen),
      .rcc_c2_sai2_lpen         (rcc_c2_sai2_lpen),
      .rcc_c1_sai1_en           (rcc_c1_sai1_en),
      .rcc_c2_sai1_en           (rcc_c2_sai1_en),
      .rcc_c1_sai1_lpen         (rcc_c1_sai1_lpen),
      .rcc_c2_sai1_lpen         (rcc_c2_sai1_lpen),
      .rcc_c1_spi5_en           (rcc_c1_spi5_en),
      .rcc_c2_spi5_en           (rcc_c2_spi5_en),
      .rcc_c1_spi5_lpen         (rcc_c1_spi5_lpen),
      .rcc_c2_spi5_lpen         (rcc_c2_spi5_lpen),
      .rcc_c1_tim17_en          (rcc_c1_tim17_en),
      .rcc_c2_tim17_en          (rcc_c2_tim17_en),
      .rcc_c1_tim17_lpen        (rcc_c1_tim17_lpen),
      .rcc_c2_tim17_lpen        (rcc_c2_tim17_lpen),
      .rcc_c1_tim16_en          (rcc_c1_tim16_en),
      .rcc_c2_tim16_en          (rcc_c2_tim16_en),
      .rcc_c1_tim16_lpen        (rcc_c1_tim16_lpen),
      .rcc_c2_tim16_lpen        (rcc_c2_tim16_lpen),
      .rcc_c1_tim15_en          (rcc_c1_tim15_en),
      .rcc_c2_tim15_en          (rcc_c2_tim15_en),
      .rcc_c1_tim15_lpen        (rcc_c1_tim15_lpen),
      .rcc_c2_tim15_lpen        (rcc_c2_tim15_lpen),
      .rcc_c1_spi4_en           (rcc_c1_spi4_en),
      .rcc_c2_spi4_en           (rcc_c2_spi4_en),
      .rcc_c1_spi4_lpen         (rcc_c1_spi4_lpen),
      .rcc_c2_spi4_lpen         (rcc_c2_spi4_lpen),
      .rcc_c1_spi1_en           (rcc_c1_spi1_en),
      .rcc_c2_spi1_en           (rcc_c2_spi1_en),
      .rcc_c1_spi1_lpen         (rcc_c1_spi1_lpen),
      .rcc_c2_spi1_lpen         (rcc_c2_spi1_lpen),
      .rcc_c1_usart6_en         (rcc_c1_usart6_en),
      .rcc_c2_usart6_en         (rcc_c2_usart6_en),
      .rcc_c1_usart6_lpen       (rcc_c1_usart6_lpen),
      .rcc_c2_usart6_lpen       (rcc_c2_usart6_lpen),
      .usart6_ker_clk_req       (usart6_ker_clk_req),
      .rcc_c1_usart1_en         (rcc_c1_usart1_en),
      .rcc_c2_usart1_en         (rcc_c2_usart1_en),
      .rcc_c1_usart1_lpen       (rcc_c1_usart1_lpen),
      .rcc_c2_usart1_lpen       (rcc_c2_usart1_lpen),
      .usart1_ker_clk_req       (usart1_ker_clk_req),
      .rcc_c1_tim8_en           (rcc_c1_tim8_en),
      .rcc_c2_tim8_en           (rcc_c2_tim8_en),
      .rcc_c1_tim8_lpen         (rcc_c1_tim8_lpen),
      .rcc_c2_tim8_lpen         (rcc_c2_tim8_lpen),
      .rcc_c1_tim1_en           (rcc_c1_tim1_en),
      .rcc_c2_tim1_en           (rcc_c2_tim1_en),
      .rcc_c1_tim1_lpen         (rcc_c1_tim1_lpen),
      .rcc_c2_tim1_lpen         (rcc_c2_tim1_lpen),
      .rcc_c1_sram4_lpen        (rcc_c1_sram4_lpen),
      .rcc_c2_sram4_lpen        (rcc_c2_sram4_lpen),
      .rcc_sram4_amen           (rcc_sram4_amen),
      .rcc_c1_bkpram_en         (rcc_c1_bkpram_en),
      .rcc_c2_bkpram_en         (rcc_c2_bkpram_en),
      .rcc_c1_bkpram_lpen       (rcc_c1_bkpram_lpen),
      .rcc_c2_bkpram_lpen       (rcc_c2_bkpram_lpen),
      .rcc_bkpram_amen          (rcc_bkpram_amen),
      .rcc_c1_hsem_en           (rcc_c1_hsem_en),
      .rcc_c2_hsem_en           (rcc_c2_hsem_en),
      .rcc_c1_adc3_en           (rcc_c1_adc3_en),
      .rcc_c2_adc3_en           (rcc_c2_adc3_en),
      .rcc_c1_adc3_lpen         (rcc_c1_adc3_lpen),
      .rcc_c2_adc3_lpen         (rcc_c2_adc3_lpen),
      .rcc_adc3_amen            (rcc_adc3_amen),
      .rcc_c1_bdma_en           (rcc_c1_bdma_en),
      .rcc_c2_bdma_en           (rcc_c2_bdma_en),
      .rcc_c1_bdma_lpen         (rcc_c1_bdma_lpen),
      .rcc_c2_bdma_lpen         (rcc_c2_bdma_lpen),
      .rcc_bdma_amen            (rcc_bdma_amen),
      .rcc_c1_crc_en            (rcc_c1_crc_en),
      .rcc_c2_crc_en            (rcc_c2_crc_en),
      .rcc_c1_crc_lpen          (rcc_c1_crc_lpen),
      .rcc_c2_crc_lpen          (rcc_c2_crc_lpen),
      .rcc_crc_amen             (rcc_crc_amen),
      .rcc_c1_gpiok_en          (rcc_c1_gpiok_en),
      .rcc_c2_gpiok_en          (rcc_c2_gpiok_en),
      .rcc_c1_gpiok_lpen        (rcc_c1_gpiok_lpen),
      .rcc_c2_gpiok_lpen        (rcc_c2_gpiok_lpen),
      .rcc_c1_gpioj_en          (rcc_c1_gpioj_en),
      .rcc_c2_gpioj_en          (rcc_c2_gpioj_en),
      .rcc_c1_gpioj_lpen        (rcc_c1_gpioj_lpen),
      .rcc_c2_gpioj_lpen        (rcc_c2_gpioj_lpen),
      .rcc_c1_gpioi_en          (rcc_c1_gpioi_en),
      .rcc_c2_gpioi_en          (rcc_c2_gpioi_en),
      .rcc_c1_gpioi_lpen        (rcc_c1_gpioi_lpen),
      .rcc_c2_gpioi_lpen        (rcc_c2_gpioi_lpen),
      .rcc_c1_gpioh_en          (rcc_c1_gpioh_en),
      .rcc_c2_gpioh_en          (rcc_c2_gpioh_en),
      .rcc_c1_gpioh_lpen        (rcc_c1_gpioh_lpen),
      .rcc_c2_gpioh_lpen        (rcc_c2_gpioh_lpen),
      .rcc_c1_gpiog_en          (rcc_c1_gpiog_en),
      .rcc_c2_gpiog_en          (rcc_c2_gpiog_en),
      .rcc_c1_gpiog_lpen        (rcc_c1_gpiog_lpen),
      .rcc_c2_gpiog_lpen        (rcc_c2_gpiog_lpen),
      .rcc_c1_gpiof_en          (rcc_c1_gpiof_en),
      .rcc_c2_gpiof_en          (rcc_c2_gpiof_en),
      .rcc_c1_gpiof_lpen        (rcc_c1_gpiof_lpen),
      .rcc_c2_gpiof_lpen        (rcc_c2_gpiof_lpen),
      .rcc_c1_gpioe_en          (rcc_c1_gpioe_en),
      .rcc_c2_gpioe_en          (rcc_c2_gpioe_en),
      .rcc_c1_gpioe_lpen        (rcc_c1_gpioe_lpen),
      .rcc_c2_gpioe_lpen        (rcc_c2_gpioe_lpen),
      .rcc_c1_gpiod_en          (rcc_c1_gpiod_en),
      .rcc_c2_gpiod_en          (rcc_c2_gpiod_en),
      .rcc_c1_gpiod_lpen        (rcc_c1_gpiod_lpen),
      .rcc_c2_gpiod_lpen        (rcc_c2_gpiod_lpen),
      .rcc_c1_gpioc_en          (rcc_c1_gpioc_en),
      .rcc_c2_gpioc_en          (rcc_c2_gpioc_en),
      .rcc_c1_gpioc_lpen        (rcc_c1_gpioc_lpen),
      .rcc_c2_gpioc_lpen        (rcc_c2_gpioc_lpen),
      .rcc_c1_gpiob_en          (rcc_c1_gpiob_en),
      .rcc_c2_gpiob_en          (rcc_c2_gpiob_en),
      .rcc_c1_gpiob_lpen        (rcc_c1_gpiob_lpen),
      .rcc_c2_gpiob_lpen        (rcc_c2_gpiob_lpen),
      .rcc_c1_gpioa_en          (rcc_c1_gpioa_en),
      .rcc_c2_gpioa_en          (rcc_c2_gpioa_en),
      .rcc_c1_gpioa_lpen        (rcc_c1_gpioa_lpen),
      .rcc_c2_gpioa_lpen        (rcc_c2_gpioa_lpen),
      .rcc_c1_sai4_en           (rcc_c1_sai4_en),
      .rcc_c2_sai4_en           (rcc_c2_sai4_en),
      .rcc_c1_sai4_lpen         (rcc_c1_sai4_lpen),
      .rcc_c2_sai4_lpen         (rcc_c2_sai4_lpen),
      .rcc_sai4_amen            (rcc_sai4_amen),
      .rcc_c1_rtc_en            (rcc_c1_rtc_en),
      .rcc_c2_rtc_en            (rcc_c2_rtc_en),
      .rcc_c1_rtc_lpen          (rcc_c1_rtc_lpen),
      .rcc_c2_rtc_lpen          (rcc_c2_rtc_lpen),
      .rcc_rtc_amen             (rcc_rtc_amen),
      .rcc_c1_vref_en           (rcc_c1_vref_en),
      .rcc_c2_vref_en           (rcc_c2_vref_en),
      .rcc_c1_vref_lpen         (rcc_c1_vref_lpen),
      .rcc_c2_vref_lpen         (rcc_c2_vref_lpen),
      .rcc_vref_amen            (rcc_vref_amen),
      .rcc_c1_comp12_en         (rcc_c1_comp12_en),
      .rcc_c2_comp12_en         (rcc_c2_comp12_en),
      .rcc_c1_comp12_lpen       (rcc_c1_comp12_lpen),
      .rcc_c2_comp12_lpen       (rcc_c2_comp12_lpen),
      .rcc_comp12_amen          (rcc_comp12_amen),
      .rcc_c1_lptim5_en         (rcc_c1_lptim5_en),
      .rcc_c2_lptim5_en         (rcc_c2_lptim5_en),
      .rcc_c1_lptim5_lpen       (rcc_c1_lptim5_lpen),
      .rcc_c2_lptim5_lpen       (rcc_c2_lptim5_lpen),
      .rcc_lptim5_amen          (rcc_lptim5_amen),
      .rcc_c1_lptim4_en         (rcc_c1_lptim4_en),
      .rcc_c2_lptim4_en         (rcc_c2_lptim4_en),
      .rcc_c1_lptim4_lpen       (rcc_c1_lptim4_lpen),
      .rcc_c2_lptim4_lpen       (rcc_c2_lptim4_lpen),
      .rcc_lptim4_amen          (rcc_lptim4_amen),
      .rcc_c1_lptim3_en         (rcc_c1_lptim3_en),
      .rcc_c2_lptim3_en         (rcc_c2_lptim3_en),
      .rcc_c1_lptim3_lpen       (rcc_c1_lptim3_lpen),
      .rcc_c2_lptim3_lpen       (rcc_c2_lptim3_lpen),
      .rcc_lptim3_amen          (rcc_lptim3_amen),
      .rcc_c1_lptim2_en         (rcc_c1_lptim2_en),
      .rcc_c2_lptim2_en         (rcc_c2_lptim2_en),
      .rcc_c1_lptim2_lpen       (rcc_c1_lptim2_lpen),
      .rcc_c2_lptim2_lpen       (rcc_c2_lptim2_lpen),
      .rcc_lptim2_amen          (rcc_lptim2_amen),
      .rcc_c1_i2c4_en           (rcc_c1_i2c4_en),
      .rcc_c2_i2c4_en           (rcc_c2_i2c4_en),
      .rcc_c1_i2c4_lpen         (rcc_c1_i2c4_lpen),
      .rcc_c2_i2c4_lpen         (rcc_c2_i2c4_lpen),
      .rcc_i2c4_amen            (rcc_i2c4_amen),
      .i2c4_ker_clk_req         (i2c4_ker_clk_req),
      .rcc_c1_spi6_en           (rcc_c1_spi6_en),
      .rcc_c2_spi6_en           (rcc_c2_spi6_en),
      .rcc_c1_spi6_lpen         (rcc_c1_spi6_lpen),
      .rcc_c2_spi6_lpen         (rcc_c2_spi6_lpen),
      .rcc_spi6_amen            (rcc_spi6_amen),
      .rcc_c1_lpuart1_en        (rcc_c1_lpuart1_en),
      .rcc_c2_lpuart1_en        (rcc_c2_lpuart1_en),
      .rcc_c1_lpuart1_lpen      (rcc_c1_lpuart1_lpen),
      .rcc_c2_lpuart1_lpen      (rcc_c2_lpuart1_lpen),
      .rcc_lpuart1_amen         (rcc_lpuart1_amen),
      .lpuart1_ker_clk_req      (lpuart1_ker_clk_req),
      .rcc_c1_syscfg_en         (rcc_c1_syscfg_en),
      .rcc_c2_syscfg_en         (rcc_c2_syscfg_en),
      .rcc_c1_syscfg_lpen       (rcc_c1_syscfg_lpen),
      .rcc_c2_syscfg_lpen       (rcc_c2_syscfg_lpen),
      .qspisel                  (qspisel[1:0]),
      .fmcsel                   (fmcsel[1:0]),
      .sdmmcsel                 (sdmmcsel),
      .usbsel                   (usbsel[1:0]),
      .adcsel                   (adcsel[1:0]),
      .rngsel                   (rngsel[1:0]),
      .cecsel                   (cecsel[1:0]),
      .i2c123sel                (i2c123sel[1:0]),
      .usart234578sel           (usart234578sel[2:0]),
      .spdifsel                 (spdifsel[1:0]),
      .lptim1sel                (lptim1sel[2:0]),
      .fdcansel                 (fdcansel[1:0]),
      .swpmisel                 (swpmisel),
      .sai1sel                  (sai1sel[2:0]),
      .dfsdm1sel                (dfsdm1sel),
      .sai23sel                 (sai23sel[2:0]),
      .spi45sel                 (spi45sel[2:0]),
      .spi123sel                (spi123sel[2:0]),
      .usart16sel               (usart16sel[2:0]),
      .sai4asel                 (sai4asel[2:0]),
      .sai4bsel                 (sai4bsel[2:0]),
      .lptim345sel              (lptim345sel[2:0]),
      .lptim2sel                (lptim2sel[2:0]),
      .i2c4sel                  (i2c4sel[1:0]),
      .spi6sel                  (spi6sel[2:0]),
      .lpuart1sel               (lpuart1sel[2:0]),
      .d1_clk_arcg_en           (d1_clk_arcg_en),
      .d2_clk_arcg_en           (d2_clk_arcg_en),
      .cpu1_clk_arcg_en         (cpu1_clk_arcg_en),
      .cpu2_clk_arcg_en         (cpu2_clk_arcg_en),
      .sys_clk_arcg_en          (sys_clk_arcg_en),
      .rcc_flash_arcg_clk_en    (rcc_flash_arcg_clk_en),
      .rcc_qspi_arcg_clk_en     (rcc_qspi_arcg_clk_en),
      .rcc_axisram_arcg_clk_en  (rcc_axisram_arcg_clk_en),
      .rcc_fmc_arcg_clk_en      (rcc_fmc_arcg_clk_en),
      .rcc_dma2d_arcg_clk_en    (rcc_dma2d_arcg_clk_en),
      .rcc_mdma_arcg_clk_en     (rcc_mdma_arcg_clk_en),
      .rcc_ltdc_arcg_clk_en     (rcc_ltdc_arcg_clk_en),
      .rcc_ramecc1_arcg_clk_en  (rcc_ramecc1_arcg_clk_en),
      .rcc_gpv_arcg_clk_en      (rcc_gpv_arcg_clk_en),
      .rcc_itcm_arcg_clk_en     (rcc_itcm_arcg_clk_en),
      .rcc_dtcm2_arcg_clk_en    (rcc_dtcm2_arcg_clk_en),
      .rcc_dtcm1_arcg_clk_en    (rcc_dtcm1_arcg_clk_en),
      .rcc_jpgdec_arcg_clk_en   (rcc_jpgdec_arcg_clk_en),
      .rcc_sdmmc1_arcg_clk_en   (rcc_sdmmc1_arcg_clk_en),
      .rcc_wwdg1_arcg_clk_en    (rcc_wwdg1_arcg_clk_en),
      .rcc_usb2ulpi_arcg_clk_en (rcc_usb2ulpi_arcg_clk_en),
      .rcc_usb2otg_arcg_clk_en  (rcc_usb2otg_arcg_clk_en),
      .rcc_usb1ulpi_arcg_clk_en (rcc_usb1ulpi_arcg_clk_en),
      .rcc_usb1otg_arcg_clk_en  (rcc_usb1otg_arcg_clk_en),
      .rcc_eth1rx_arcg_clk_en   (rcc_eth1rx_arcg_clk_en),
      .rcc_eth1tx_arcg_clk_en   (rcc_eth1tx_arcg_clk_en),
      .rcc_eth1mac_arcg_clk_en  (rcc_eth1mac_arcg_clk_en),
      .rcc_adc12_arcg_clk_en    (rcc_adc12_arcg_clk_en),
      .rcc_dma2_arcg_clk_en     (rcc_dma2_arcg_clk_en),
      .rcc_dma1_arcg_clk_en     (rcc_dma1_arcg_clk_en),
      .rcc_sram3_arcg_clk_en    (rcc_sram3_arcg_clk_en),
      .rcc_sram2_arcg_clk_en    (rcc_sram2_arcg_clk_en),
      .rcc_sram1_arcg_clk_en    (rcc_sram1_arcg_clk_en),
      .rcc_sdmmc2_arcg_clk_en   (rcc_sdmmc2_arcg_clk_en),
      .rcc_rng_arcg_clk_en      (rcc_rng_arcg_clk_en),
      .rcc_hash_arcg_clk_en     (rcc_hash_arcg_clk_en),
      .rcc_crypt_arcg_clk_en    (rcc_crypt_arcg_clk_en),
      .rcc_dcmi_arcg_clk_en     (rcc_dcmi_arcg_clk_en),
      .rcc_ramecc2_arcg_clk_en  (rcc_ramecc2_arcg_clk_en),
      .rcc_uart8_arcg_clk_en    (rcc_uart8_arcg_clk_en),
      .rcc_uart7_arcg_clk_en    (rcc_uart7_arcg_clk_en),
      .rcc_dac12_arcg_clk_en    (rcc_dac12_arcg_clk_en),
      .rcc_hdmicec_arcg_clk_en  (rcc_hdmicec_arcg_clk_en),
      .rcc_i2c3_arcg_clk_en     (rcc_i2c3_arcg_clk_en),
      .rcc_i2c2_arcg_clk_en     (rcc_i2c2_arcg_clk_en),
      .rcc_i2c1_arcg_clk_en     (rcc_i2c1_arcg_clk_en),
      .rcc_uart5_arcg_clk_en    (rcc_uart5_arcg_clk_en),
      .rcc_uart4_arcg_clk_en    (rcc_uart4_arcg_clk_en),
      .rcc_usart3_arcg_clk_en   (rcc_usart3_arcg_clk_en),
      .rcc_usart2_arcg_clk_en   (rcc_usart2_arcg_clk_en),
      .rcc_spdifrx_arcg_clk_en  (rcc_spdifrx_arcg_clk_en),
      .rcc_spi3_arcg_clk_en     (rcc_spi3_arcg_clk_en),
      .rcc_spi2_arcg_clk_en     (rcc_spi2_arcg_clk_en),
      .rcc_wwdg2_arcg_clk_en    (rcc_wwdg2_arcg_clk_en),
      .rcc_lptim1_arcg_clk_en   (rcc_lptim1_arcg_clk_en),
      .rcc_tim14_arcg_clk_en    (rcc_tim14_arcg_clk_en),
      .rcc_tim13_arcg_clk_en    (rcc_tim13_arcg_clk_en),
      .rcc_tim12_arcg_clk_en    (rcc_tim12_arcg_clk_en),
      .rcc_tim7_arcg_clk_en     (rcc_tim7_arcg_clk_en),
      .rcc_tim6_arcg_clk_en     (rcc_tim6_arcg_clk_en),
      .rcc_tim5_arcg_clk_en     (rcc_tim5_arcg_clk_en),
      .rcc_tim4_arcg_clk_en     (rcc_tim4_arcg_clk_en),
      .rcc_tim3_arcg_clk_en     (rcc_tim3_arcg_clk_en),
      .rcc_tim2_arcg_clk_en     (rcc_tim2_arcg_clk_en),
      .rcc_fdcan_arcg_clk_en    (rcc_fdcan_arcg_clk_en),
      .rcc_mdios_arcg_clk_en    (rcc_mdios_arcg_clk_en),
      .rcc_opamp_arcg_clk_en    (rcc_opamp_arcg_clk_en),
      .rcc_swpmi_arcg_clk_en    (rcc_swpmi_arcg_clk_en),
      .rcc_crs_arcg_clk_en      (rcc_crs_arcg_clk_en),
      .rcc_hrtim_arcg_clk_en    (rcc_hrtim_arcg_clk_en),
      .rcc_dfsdm1_arcg_clk_en   (rcc_dfsdm1_arcg_clk_en),
      .rcc_sai3_arcg_clk_en     (rcc_sai3_arcg_clk_en),
      .rcc_sai2_arcg_clk_en     (rcc_sai2_arcg_clk_en),
      .rcc_sai1_arcg_clk_en     (rcc_sai1_arcg_clk_en),
      .rcc_spi5_arcg_clk_en     (rcc_spi5_arcg_clk_en),
      .rcc_tim17_arcg_clk_en    (rcc_tim17_arcg_clk_en),
      .rcc_tim16_arcg_clk_en    (rcc_tim16_arcg_clk_en),
      .rcc_tim15_arcg_clk_en    (rcc_tim15_arcg_clk_en),
      .rcc_spi4_arcg_clk_en     (rcc_spi4_arcg_clk_en),
      .rcc_spi1_arcg_clk_en     (rcc_spi1_arcg_clk_en),
      .rcc_usart6_arcg_clk_en   (rcc_usart6_arcg_clk_en),
      .rcc_usart1_arcg_clk_en   (rcc_usart1_arcg_clk_en),
      .rcc_tim8_arcg_clk_en     (rcc_tim8_arcg_clk_en),
      .rcc_tim1_arcg_clk_en     (rcc_tim1_arcg_clk_en),
      .rcc_sram4_arcg_clk_en    (rcc_sram4_arcg_clk_en),
      .rcc_bkpram_arcg_clk_en   (rcc_bkpram_arcg_clk_en),
      .rcc_ramecc3_arcg_clk_en  (rcc_ramecc3_arcg_clk_en),
      .rcc_hsem_arcg_clk_en     (rcc_hsem_arcg_clk_en),
      .rcc_adc3_arcg_clk_en     (rcc_adc3_arcg_clk_en),
      .rcc_bdma_arcg_clk_en     (rcc_bdma_arcg_clk_en),
      .rcc_crc_arcg_clk_en      (rcc_crc_arcg_clk_en),
      .rcc_gpiok_arcg_clk_en    (rcc_gpiok_arcg_clk_en),
      .rcc_gpioj_arcg_clk_en    (rcc_gpioj_arcg_clk_en),
      .rcc_gpioi_arcg_clk_en    (rcc_gpioi_arcg_clk_en),
      .rcc_gpioh_arcg_clk_en    (rcc_gpioh_arcg_clk_en),
      .rcc_gpiog_arcg_clk_en    (rcc_gpiog_arcg_clk_en),
      .rcc_gpiof_arcg_clk_en    (rcc_gpiof_arcg_clk_en),
      .rcc_gpioe_arcg_clk_en    (rcc_gpioe_arcg_clk_en),
      .rcc_gpiod_arcg_clk_en    (rcc_gpiod_arcg_clk_en),
      .rcc_gpioc_arcg_clk_en    (rcc_gpioc_arcg_clk_en),
      .rcc_gpiob_arcg_clk_en    (rcc_gpiob_arcg_clk_en),
      .rcc_gpioa_arcg_clk_en    (rcc_gpioa_arcg_clk_en),
      .rcc_rcc_arcg_clk_en      (rcc_rcc_arcg_clk_en),
      .rcc_pwr_arcg_clk_en      (rcc_pwr_arcg_clk_en),
      .rcc_sai4_arcg_clk_en     (rcc_sai4_arcg_clk_en),
      .rcc_rtc_arcg_clk_en      (rcc_rtc_arcg_clk_en),
      .rcc_vref_arcg_clk_en     (rcc_vref_arcg_clk_en),
      .rcc_comp12_arcg_clk_en   (rcc_comp12_arcg_clk_en),
      .rcc_lptim5_arcg_clk_en   (rcc_lptim5_arcg_clk_en),
      .rcc_lptim4_arcg_clk_en   (rcc_lptim4_arcg_clk_en),
      .rcc_lptim3_arcg_clk_en   (rcc_lptim3_arcg_clk_en),
      .rcc_lptim2_arcg_clk_en   (rcc_lptim2_arcg_clk_en),
      .rcc_i2c4_arcg_clk_en     (rcc_i2c4_arcg_clk_en),
      .rcc_spi6_arcg_clk_en     (rcc_spi6_arcg_clk_en),
      .rcc_lpuart1_arcg_clk_en  (rcc_lpuart1_arcg_clk_en),
      .rcc_syscfg_arcg_clk_en   (rcc_syscfg_arcg_clk_en),
      .rcc_iwdg2_arcg_clk_en    (rcc_iwdg2_arcg_clk_en),
      .rcc_iwdg1_arcg_clk_en    (rcc_iwdg1_arcg_clk_en),
      .rcc_exti_arcg_clk_en     (rcc_exti_arcg_clk_en),
      .axibridge_d1_busy        (axibridge_d1_busy),
      .ahb3bridge_d1_busy       (ahb3bridge_d1_busy),
      .apb3bridge_d1_busy       (apb3bridge_d1_busy),
      .ahb1bridge_d2_busy       (ahb1bridge_d2_busy),
      .ahb2bridge_d2_busy       (ahb2bridge_d2_busy),
      .apb1bridge_d2_busy       (apb1bridge_d2_busy),
      .apb2bridge_d2_busy       (apb2bridge_d2_busy),
      .flash_busy               (flash_busy),
      .eth_rcc_fes              (eth_rcc_fes),
      .eth_rcc_epis_2           (eth_rcc_epis_2),
      .mco1sel                  (mco1sel[2:0]),
      .mco2sel                  (mco2sel[2:0]),
      .mco1pre                  (mco1pre[3:0]),
      .mco2pre                  (mco2pre[3:0]),
      .rtcpre                   (rtcpre[5:0]),
      .hsidiv                   (hsidiv[1:0]),
      .sys_clk_sw               (sys_clk_sw[1:0]),
      .d1cpre                   (d1cpre[3:0]),
      .d1ppre                   (d1ppre[2:0]),
      .hpre                     (hpre[3:0]),
      .d2ppre1                  (d2ppre1[2:0]),
      .d2ppre2                  (d2ppre2[2:0]),
      .d3ppre                   (d3ppre[2:0]),
      .timpre                   (timpre),
      .hrtimsel                 (hrtimsel),
      .clkpersel                (clkpersel[1:0]),
      .divm1                    (divm1[5:0]),
      .divm2                    (divm2[5:0]),
      .divm3                    (divm3[5:0]),
      .csi_rdy                  (csi_rdy),
      .hsi_rdy                  (hsi_rdy)
  );

  rcc_vcore_rst_ctrl u_rcc_vcore_rst_ctrl (  /*AUTOINST*/
      // Outputs
      .pwr_por_rst_n     (pwr_por_rst_n),
      .sys_rst_n         (sys_rst_n),
      .d1_rst_n          (d1_rst_n),
      .d2_rst_n          (d2_rst_n),
      .stby_rst_n        (stby_rst_n),
      .nrst_out          (nrst_out),
      .cpu1_rst_n        (cpu1_rst_n),
      .cpu2_rst_n        (cpu2_rst_n),
      .rcc_flash_rst_n   (rcc_flash_rst_n),
      .rcc_qspi_rst_n    (rcc_qspi_rst_n),
      .rcc_axisram_rst_n (rcc_axisram_rst_n),
      .rcc_fmc_rst_n     (rcc_fmc_rst_n),
      .rcc_dma2d_rst_n   (rcc_dma2d_rst_n),
      .rcc_mdma_rst_n    (rcc_mdma_rst_n),
      .rcc_ltdc_rst_n    (rcc_ltdc_rst_n),
      .rcc_ramecc1_rst_n (rcc_ramecc1_rst_n),
      .rcc_gpv_rst_n     (rcc_gpv_rst_n),
      .rcc_itcm_rst_n    (rcc_itcm_rst_n),
      .rcc_dtcm2_rst_n   (rcc_dtcm2_rst_n),
      .rcc_dtcm1_rst_n   (rcc_dtcm1_rst_n),
      .rcc_jpgdec_rst_n  (rcc_jpgdec_rst_n),
      .rcc_sdmmc1_rst_n  (rcc_sdmmc1_rst_n),
      .rcc_wwdg1_rst_n   (rcc_wwdg1_rst_n),
      .rcc_usb2ulpi_rst_n(rcc_usb2ulpi_rst_n),
      .rcc_usb2otg_rst_n (rcc_usb2otg_rst_n),
      .rcc_usb1ulpi_rst_n(rcc_usb1ulpi_rst_n),
      .rcc_usb1otg_rst_n (rcc_usb1otg_rst_n),
      .rcc_eth1rx_rst_n  (rcc_eth1rx_rst_n),
      .rcc_eth1tx_rst_n  (rcc_eth1tx_rst_n),
      .rcc_eth1mac_rst_n (rcc_eth1mac_rst_n),
      .rcc_adc12_rst_n   (rcc_adc12_rst_n),
      .rcc_dma2_rst_n    (rcc_dma2_rst_n),
      .rcc_dma1_rst_n    (rcc_dma1_rst_n),
      .rcc_sram3_rst_n   (rcc_sram3_rst_n),
      .rcc_sram2_rst_n   (rcc_sram2_rst_n),
      .rcc_sram1_rst_n   (rcc_sram1_rst_n),
      .rcc_sdmmc2_rst_n  (rcc_sdmmc2_rst_n),
      .rcc_rng_rst_n     (rcc_rng_rst_n),
      .rcc_hash_rst_n    (rcc_hash_rst_n),
      .rcc_crypt_rst_n   (rcc_crypt_rst_n),
      .rcc_dcmi_rst_n    (rcc_dcmi_rst_n),
      .rcc_ramecc2_rst_n (rcc_ramecc2_rst_n),
      .rcc_uart8_rst_n   (rcc_uart8_rst_n),
      .rcc_uart7_rst_n   (rcc_uart7_rst_n),
      .rcc_dac12_rst_n   (rcc_dac12_rst_n),
      .rcc_hdmicec_rst_n (rcc_hdmicec_rst_n),
      .rcc_i2c3_rst_n    (rcc_i2c3_rst_n),
      .rcc_i2c2_rst_n    (rcc_i2c2_rst_n),
      .rcc_i2c1_rst_n    (rcc_i2c1_rst_n),
      .rcc_uart5_rst_n   (rcc_uart5_rst_n),
      .rcc_uart4_rst_n   (rcc_uart4_rst_n),
      .rcc_usart3_rst_n  (rcc_usart3_rst_n),
      .rcc_usart2_rst_n  (rcc_usart2_rst_n),
      .rcc_spdifrx_rst_n (rcc_spdifrx_rst_n),
      .rcc_spi3_rst_n    (rcc_spi3_rst_n),
      .rcc_spi2_rst_n    (rcc_spi2_rst_n),
      .rcc_wwdg2_rst_n   (rcc_wwdg2_rst_n),
      .rcc_lptim1_rst_n  (rcc_lptim1_rst_n),
      .rcc_tim14_rst_n   (rcc_tim14_rst_n),
      .rcc_tim13_rst_n   (rcc_tim13_rst_n),
      .rcc_tim12_rst_n   (rcc_tim12_rst_n),
      .rcc_tim7_rst_n    (rcc_tim7_rst_n),
      .rcc_tim6_rst_n    (rcc_tim6_rst_n),
      .rcc_tim5_rst_n    (rcc_tim5_rst_n),
      .rcc_tim4_rst_n    (rcc_tim4_rst_n),
      .rcc_tim3_rst_n    (rcc_tim3_rst_n),
      .rcc_tim2_rst_n    (rcc_tim2_rst_n),
      .rcc_fdcan_rst_n   (rcc_fdcan_rst_n),
      .rcc_mdios_rst_n   (rcc_mdios_rst_n),
      .rcc_opamp_rst_n   (rcc_opamp_rst_n),
      .rcc_swpmi_rst_n   (rcc_swpmi_rst_n),
      .rcc_crs_rst_n     (rcc_crs_rst_n),
      .rcc_hrtim_rst_n   (rcc_hrtim_rst_n),
      .rcc_dfsdm1_rst_n  (rcc_dfsdm1_rst_n),
      .rcc_sai3_rst_n    (rcc_sai3_rst_n),
      .rcc_sai2_rst_n    (rcc_sai2_rst_n),
      .rcc_sai1_rst_n    (rcc_sai1_rst_n),
      .rcc_spi5_rst_n    (rcc_spi5_rst_n),
      .rcc_tim17_rst_n   (rcc_tim17_rst_n),
      .rcc_tim16_rst_n   (rcc_tim16_rst_n),
      .rcc_tim15_rst_n   (rcc_tim15_rst_n),
      .rcc_spi4_rst_n    (rcc_spi4_rst_n),
      .rcc_spi1_rst_n    (rcc_spi1_rst_n),
      .rcc_usart6_rst_n  (rcc_usart6_rst_n),
      .rcc_usart1_rst_n  (rcc_usart1_rst_n),
      .rcc_tim8_rst_n    (rcc_tim8_rst_n),
      .rcc_tim1_rst_n    (rcc_tim1_rst_n),
      .rcc_sram4_rst_n   (rcc_sram4_rst_n),
      .rcc_bkpram_rst_n  (rcc_bkpram_rst_n),
      .rcc_ramecc3_rst_n (rcc_ramecc3_rst_n),
      .rcc_hsem_rst_n    (rcc_hsem_rst_n),
      .rcc_adc3_rst_n    (rcc_adc3_rst_n),
      .rcc_bdma_rst_n    (rcc_bdma_rst_n),
      .rcc_crc_rst_n     (rcc_crc_rst_n),
      .rcc_gpiok_rst_n   (rcc_gpiok_rst_n),
      .rcc_gpioj_rst_n   (rcc_gpioj_rst_n),
      .rcc_gpioi_rst_n   (rcc_gpioi_rst_n),
      .rcc_gpioh_rst_n   (rcc_gpioh_rst_n),
      .rcc_gpiog_rst_n   (rcc_gpiog_rst_n),
      .rcc_gpiof_rst_n   (rcc_gpiof_rst_n),
      .rcc_gpioe_rst_n   (rcc_gpioe_rst_n),
      .rcc_gpiod_rst_n   (rcc_gpiod_rst_n),
      .rcc_gpioc_rst_n   (rcc_gpioc_rst_n),
      .rcc_gpiob_rst_n   (rcc_gpiob_rst_n),
      .rcc_gpioa_rst_n   (rcc_gpioa_rst_n),
      .rcc_rcc_rst_n     (rcc_rcc_rst_n),
      .rcc_pwr_rst_n     (rcc_pwr_rst_n),
      .rcc_sai4_rst_n    (rcc_sai4_rst_n),
      .rcc_rtc_rst_n     (rcc_rtc_rst_n),
      .rcc_vref_rst_n    (rcc_vref_rst_n),
      .rcc_comp12_rst_n  (rcc_comp12_rst_n),
      .rcc_lptim5_rst_n  (rcc_lptim5_rst_n),
      .rcc_lptim4_rst_n  (rcc_lptim4_rst_n),
      .rcc_lptim3_rst_n  (rcc_lptim3_rst_n),
      .rcc_lptim2_rst_n  (rcc_lptim2_rst_n),
      .rcc_i2c4_rst_n    (rcc_i2c4_rst_n),
      .rcc_spi6_rst_n    (rcc_spi6_rst_n),
      .rcc_lpuart1_rst_n (rcc_lpuart1_rst_n),
      .rcc_syscfg_rst_n  (rcc_syscfg_rst_n),
      .rcc_iwdg2_rst_n   (rcc_iwdg2_rst_n),
      .rcc_iwdg1_rst_n   (rcc_iwdg1_rst_n),
      .rcc_exti_rst_n    (rcc_exti_rst_n),
      .obl_rst           (obl_rst),
      // Inputs
      .nrst_in           (nrst_in),
      .iwdg1_out_rst     (iwdg1_out_rst),
      .wwdg1_out_rst     (wwdg1_out_rst),
      .iwdg2_out_rst     (iwdg2_out_rst),
      .wwdg2_out_rst     (wwdg2_out_rst),
      .lpwr2_rst         (lpwr2_rst),
      .lpwr1_rst         (lpwr1_rst),
      .pwr_bor_rst       (pwr_bor_rst),
      .pwr_por_rst       (pwr_por_rst),
      .cpu2_sftrst       (cpu2_sftrst),
      .cpu1_sftrst       (cpu1_sftrst),
      .pwr_vcore_ok      (pwr_vcore_ok),
      .pwr_d1_ok         (pwr_d1_ok),
      .pwr_d2_ok         (pwr_d2_ok),
      .flash_obl_reload  (flash_obl_reload),
      .obl_done          (obl_done),
      .flash_power_ok    (flash_power_ok),
      .hsi_rdy           (hsi_rdy),
      .ww2rsc            (ww2rsc),
      .ww1rsc            (ww1rsc),
      .sys_d1cpre_clk    (sys_d1cpre_clk),
      .sys_hpre_clk      (sys_hpre_clk),
      .sys_clk_pre       (sys_clk_pre),
      .qspirst           (qspirst),
      .fmcrst            (fmcrst),
      .dma2drst          (dma2drst),
      .mdmarst           (mdmarst),
      .ltdcrst           (ltdcrst),
      .jpgdecrst         (jpgdecrst),
      .sdmmc1rst         (sdmmc1rst),
      .usb2otgrst        (usb2otgrst),
      .usb1otgrst        (usb1otgrst),
      .eth1macrst        (eth1macrst),
      .adc12rst          (adc12rst),
      .dma2rst           (dma2rst),
      .dma1rst           (dma1rst),
      .sdmmc2rst         (sdmmc2rst),
      .rngrst            (rngrst),
      .hashrst           (hashrst),
      .cryptrst          (cryptrst),
      .dcmirst           (dcmirst),
      .uart8rst          (uart8rst),
      .uart7rst          (uart7rst),
      .dac12rst          (dac12rst),
      .hdmicecrst        (hdmicecrst),
      .i2c3rst           (i2c3rst),
      .i2c2rst           (i2c2rst),
      .i2c1rst           (i2c1rst),
      .uart5rst          (uart5rst),
      .uart4rst          (uart4rst),
      .usart3rst         (usart3rst),
      .usart2rst         (usart2rst),
      .spdifrxrst        (spdifrxrst),
      .spi3rst           (spi3rst),
      .spi2rst           (spi2rst),
      .lptim1rst         (lptim1rst),
      .tim14rst          (tim14rst),
      .tim13rst          (tim13rst),
      .tim12rst          (tim12rst),
      .tim7rst           (tim7rst),
      .tim6rst           (tim6rst),
      .tim5rst           (tim5rst),
      .tim4rst           (tim4rst),
      .tim3rst           (tim3rst),
      .tim2rst           (tim2rst),
      .fdcanrst          (fdcanrst),
      .mdiosrst          (mdiosrst),
      .opamprst          (opamprst),
      .swpmirst          (swpmirst),
      .crsrst            (crsrst),
      .hrtimrst          (hrtimrst),
      .dfsdm1rst         (dfsdm1rst),
      .sai3rst           (sai3rst),
      .sai2rst           (sai2rst),
      .sai1rst           (sai1rst),
      .spi5rst           (spi5rst),
      .tim17rst          (tim17rst),
      .tim16rst          (tim16rst),
      .tim15rst          (tim15rst),
      .spi4rst           (spi4rst),
      .spi1rst           (spi1rst),
      .usart6rst         (usart6rst),
      .usart1rst         (usart1rst),
      .tim8rst           (tim8rst),
      .tim1rst           (tim1rst),
      .hsemrst           (hsemrst),
      .adc3rst           (adc3rst),
      .bdmarst           (bdmarst),
      .crcrst            (crcrst),
      .gpiokrst          (gpiokrst),
      .gpiojrst          (gpiojrst),
      .gpioirst          (gpioirst),
      .gpiohrst          (gpiohrst),
      .gpiogrst          (gpiogrst),
      .gpiofrst          (gpiofrst),
      .gpioerst          (gpioerst),
      .gpiodrst          (gpiodrst),
      .gpiocrst          (gpiocrst),
      .gpiobrst          (gpiobrst),
      .gpioarst          (gpioarst),
      .sai4rst           (sai4rst),
      .vrefrst           (vrefrst),
      .comp12rst         (comp12rst),
      .lptim5rst         (lptim5rst),
      .lptim4rst         (lptim4rst),
      .lptim3rst         (lptim3rst),
      .lptim2rst         (lptim2rst),
      .i2c4rst           (i2c4rst),
      .spi6rst           (spi6rst),
      .lpuart1rst        (lpuart1rst),
      .syscfgrst         (syscfgrst)
  );

  // rcc sys_async_reset_clk_gate
  rcc_sys_async_reset_clk_gate #(  /*AUTOINSTPARAM*/
      // Parameters
      .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE),
      .CLK_ON_AFTER_SYS_RST_RELEASE (CLK_ON_AFTER_SYS_RST_RELEASE),
      .CLK_ON_AFTER_D1_RST_RELEASE  (CLK_ON_AFTER_D1_RST_RELEASE),
      .CLK_ON_AFTER_D2_RST_RELEASE  (CLK_ON_AFTER_D2_RST_RELEASE),
      .CLK_ON_AFTER_CPU1_RST_RELEASE(CLK_ON_AFTER_CPU1_RST_RELEASE),
      .CLK_ON_AFTER_CPU2_RST_RELEASE(CLK_ON_AFTER_CPU2_RST_RELEASE)
  ) u_rcc_sys_async_reset_clk_gate (  /*AUTOINST*/
      // Outputs
      .d1_clk_arcg_en          (d1_clk_arcg_en),
      .d2_clk_arcg_en          (d2_clk_arcg_en),
      .sys_clk_arcg_en         (sys_clk_arcg_en),
      .sys_arcg_rst_n          (sys_arcg_rst_n),
      .d1_arcg_rst_n           (d1_arcg_rst_n),
      .d2_arcg_rst_n           (d2_arcg_rst_n),
      .cpu1_clk_arcg_en        (cpu1_clk_arcg_en),
      .cpu2_clk_arcg_en        (cpu2_clk_arcg_en),
      .cpu1_arcg_rst_n         (cpu1_arcg_rst_n),
      .cpu2_arcg_rst_n         (cpu2_arcg_rst_n),
      .d1_bus_arcg_rst_n       (d1_bus_arcg_rst_n),
      .d2_bus_arcg_rst_n       (d2_bus_arcg_rst_n),
      .d3_bus_arcg_rst_n       (d3_bus_arcg_rst_n),
      .rcc_flash_arcg_rst_n    (rcc_flash_arcg_rst_n),
      .rcc_qspi_arcg_rst_n     (rcc_qspi_arcg_rst_n),
      .rcc_axisram_arcg_rst_n  (rcc_axisram_arcg_rst_n),
      .rcc_fmc_arcg_rst_n      (rcc_fmc_arcg_rst_n),
      .rcc_dma2d_arcg_rst_n    (rcc_dma2d_arcg_rst_n),
      .rcc_mdma_arcg_rst_n     (rcc_mdma_arcg_rst_n),
      .rcc_ltdc_arcg_rst_n     (rcc_ltdc_arcg_rst_n),
      .rcc_ramecc1_arcg_rst_n  (rcc_ramecc1_arcg_rst_n),
      .rcc_gpv_arcg_rst_n      (rcc_gpv_arcg_rst_n),
      .rcc_itcm_arcg_rst_n     (rcc_itcm_arcg_rst_n),
      .rcc_dtcm2_arcg_rst_n    (rcc_dtcm2_arcg_rst_n),
      .rcc_dtcm1_arcg_rst_n    (rcc_dtcm1_arcg_rst_n),
      .rcc_jpgdec_arcg_rst_n   (rcc_jpgdec_arcg_rst_n),
      .rcc_sdmmc1_arcg_rst_n   (rcc_sdmmc1_arcg_rst_n),
      .rcc_wwdg1_arcg_rst_n    (rcc_wwdg1_arcg_rst_n),
      .rcc_usb2ulpi_arcg_rst_n (rcc_usb2ulpi_arcg_rst_n),
      .rcc_usb2otg_arcg_rst_n  (rcc_usb2otg_arcg_rst_n),
      .rcc_usb1ulpi_arcg_rst_n (rcc_usb1ulpi_arcg_rst_n),
      .rcc_usb1otg_arcg_rst_n  (rcc_usb1otg_arcg_rst_n),
      .rcc_eth1rx_arcg_rst_n   (rcc_eth1rx_arcg_rst_n),
      .rcc_eth1tx_arcg_rst_n   (rcc_eth1tx_arcg_rst_n),
      .rcc_eth1mac_arcg_rst_n  (rcc_eth1mac_arcg_rst_n),
      .rcc_adc12_arcg_rst_n    (rcc_adc12_arcg_rst_n),
      .rcc_dma2_arcg_rst_n     (rcc_dma2_arcg_rst_n),
      .rcc_dma1_arcg_rst_n     (rcc_dma1_arcg_rst_n),
      .rcc_sram3_arcg_rst_n    (rcc_sram3_arcg_rst_n),
      .rcc_sram2_arcg_rst_n    (rcc_sram2_arcg_rst_n),
      .rcc_sram1_arcg_rst_n    (rcc_sram1_arcg_rst_n),
      .rcc_sdmmc2_arcg_rst_n   (rcc_sdmmc2_arcg_rst_n),
      .rcc_rng_arcg_rst_n      (rcc_rng_arcg_rst_n),
      .rcc_hash_arcg_rst_n     (rcc_hash_arcg_rst_n),
      .rcc_crypt_arcg_rst_n    (rcc_crypt_arcg_rst_n),
      .rcc_dcmi_arcg_rst_n     (rcc_dcmi_arcg_rst_n),
      .rcc_ramecc2_arcg_rst_n  (rcc_ramecc2_arcg_rst_n),
      .rcc_uart8_arcg_rst_n    (rcc_uart8_arcg_rst_n),
      .rcc_uart7_arcg_rst_n    (rcc_uart7_arcg_rst_n),
      .rcc_dac12_arcg_rst_n    (rcc_dac12_arcg_rst_n),
      .rcc_hdmicec_arcg_rst_n  (rcc_hdmicec_arcg_rst_n),
      .rcc_i2c3_arcg_rst_n     (rcc_i2c3_arcg_rst_n),
      .rcc_i2c2_arcg_rst_n     (rcc_i2c2_arcg_rst_n),
      .rcc_i2c1_arcg_rst_n     (rcc_i2c1_arcg_rst_n),
      .rcc_uart5_arcg_rst_n    (rcc_uart5_arcg_rst_n),
      .rcc_uart4_arcg_rst_n    (rcc_uart4_arcg_rst_n),
      .rcc_usart3_arcg_rst_n   (rcc_usart3_arcg_rst_n),
      .rcc_usart2_arcg_rst_n   (rcc_usart2_arcg_rst_n),
      .rcc_spdifrx_arcg_rst_n  (rcc_spdifrx_arcg_rst_n),
      .rcc_spi3_arcg_rst_n     (rcc_spi3_arcg_rst_n),
      .rcc_spi2_arcg_rst_n     (rcc_spi2_arcg_rst_n),
      .rcc_wwdg2_arcg_rst_n    (rcc_wwdg2_arcg_rst_n),
      .rcc_lptim1_arcg_rst_n   (rcc_lptim1_arcg_rst_n),
      .rcc_tim14_arcg_rst_n    (rcc_tim14_arcg_rst_n),
      .rcc_tim13_arcg_rst_n    (rcc_tim13_arcg_rst_n),
      .rcc_tim12_arcg_rst_n    (rcc_tim12_arcg_rst_n),
      .rcc_tim7_arcg_rst_n     (rcc_tim7_arcg_rst_n),
      .rcc_tim6_arcg_rst_n     (rcc_tim6_arcg_rst_n),
      .rcc_tim5_arcg_rst_n     (rcc_tim5_arcg_rst_n),
      .rcc_tim4_arcg_rst_n     (rcc_tim4_arcg_rst_n),
      .rcc_tim3_arcg_rst_n     (rcc_tim3_arcg_rst_n),
      .rcc_tim2_arcg_rst_n     (rcc_tim2_arcg_rst_n),
      .rcc_fdcan_arcg_rst_n    (rcc_fdcan_arcg_rst_n),
      .rcc_mdios_arcg_rst_n    (rcc_mdios_arcg_rst_n),
      .rcc_opamp_arcg_rst_n    (rcc_opamp_arcg_rst_n),
      .rcc_swpmi_arcg_rst_n    (rcc_swpmi_arcg_rst_n),
      .rcc_crs_arcg_rst_n      (rcc_crs_arcg_rst_n),
      .rcc_hrtim_arcg_rst_n    (rcc_hrtim_arcg_rst_n),
      .rcc_dfsdm1_arcg_rst_n   (rcc_dfsdm1_arcg_rst_n),
      .rcc_sai3_arcg_rst_n     (rcc_sai3_arcg_rst_n),
      .rcc_sai2_arcg_rst_n     (rcc_sai2_arcg_rst_n),
      .rcc_sai1_arcg_rst_n     (rcc_sai1_arcg_rst_n),
      .rcc_spi5_arcg_rst_n     (rcc_spi5_arcg_rst_n),
      .rcc_tim17_arcg_rst_n    (rcc_tim17_arcg_rst_n),
      .rcc_tim16_arcg_rst_n    (rcc_tim16_arcg_rst_n),
      .rcc_tim15_arcg_rst_n    (rcc_tim15_arcg_rst_n),
      .rcc_spi4_arcg_rst_n     (rcc_spi4_arcg_rst_n),
      .rcc_spi1_arcg_rst_n     (rcc_spi1_arcg_rst_n),
      .rcc_usart6_arcg_rst_n   (rcc_usart6_arcg_rst_n),
      .rcc_usart1_arcg_rst_n   (rcc_usart1_arcg_rst_n),
      .rcc_tim8_arcg_rst_n     (rcc_tim8_arcg_rst_n),
      .rcc_tim1_arcg_rst_n     (rcc_tim1_arcg_rst_n),
      .rcc_sram4_arcg_rst_n    (rcc_sram4_arcg_rst_n),
      .rcc_bkpram_arcg_rst_n   (rcc_bkpram_arcg_rst_n),
      .rcc_ramecc3_arcg_rst_n  (rcc_ramecc3_arcg_rst_n),
      .rcc_hsem_arcg_rst_n     (rcc_hsem_arcg_rst_n),
      .rcc_adc3_arcg_rst_n     (rcc_adc3_arcg_rst_n),
      .rcc_bdma_arcg_rst_n     (rcc_bdma_arcg_rst_n),
      .rcc_crc_arcg_rst_n      (rcc_crc_arcg_rst_n),
      .rcc_gpiok_arcg_rst_n    (rcc_gpiok_arcg_rst_n),
      .rcc_gpioj_arcg_rst_n    (rcc_gpioj_arcg_rst_n),
      .rcc_gpioi_arcg_rst_n    (rcc_gpioi_arcg_rst_n),
      .rcc_gpioh_arcg_rst_n    (rcc_gpioh_arcg_rst_n),
      .rcc_gpiog_arcg_rst_n    (rcc_gpiog_arcg_rst_n),
      .rcc_gpiof_arcg_rst_n    (rcc_gpiof_arcg_rst_n),
      .rcc_gpioe_arcg_rst_n    (rcc_gpioe_arcg_rst_n),
      .rcc_gpiod_arcg_rst_n    (rcc_gpiod_arcg_rst_n),
      .rcc_gpioc_arcg_rst_n    (rcc_gpioc_arcg_rst_n),
      .rcc_gpiob_arcg_rst_n    (rcc_gpiob_arcg_rst_n),
      .rcc_gpioa_arcg_rst_n    (rcc_gpioa_arcg_rst_n),
      .rcc_rcc_arcg_rst_n      (rcc_rcc_arcg_rst_n),
      .rcc_pwr_arcg_rst_n      (rcc_pwr_arcg_rst_n),
      .rcc_sai4_arcg_rst_n     (rcc_sai4_arcg_rst_n),
      .rcc_rtc_arcg_rst_n      (rcc_rtc_arcg_rst_n),
      .rcc_vref_arcg_rst_n     (rcc_vref_arcg_rst_n),
      .rcc_comp12_arcg_rst_n   (rcc_comp12_arcg_rst_n),
      .rcc_lptim5_arcg_rst_n   (rcc_lptim5_arcg_rst_n),
      .rcc_lptim4_arcg_rst_n   (rcc_lptim4_arcg_rst_n),
      .rcc_lptim3_arcg_rst_n   (rcc_lptim3_arcg_rst_n),
      .rcc_lptim2_arcg_rst_n   (rcc_lptim2_arcg_rst_n),
      .rcc_i2c4_arcg_rst_n     (rcc_i2c4_arcg_rst_n),
      .rcc_spi6_arcg_rst_n     (rcc_spi6_arcg_rst_n),
      .rcc_lpuart1_arcg_rst_n  (rcc_lpuart1_arcg_rst_n),
      .rcc_syscfg_arcg_rst_n   (rcc_syscfg_arcg_rst_n),
      .rcc_iwdg2_arcg_rst_n    (rcc_iwdg2_arcg_rst_n),
      .rcc_iwdg1_arcg_rst_n    (rcc_iwdg1_arcg_rst_n),
      .rcc_exti_arcg_rst_n     (rcc_exti_arcg_rst_n),
      .rcc_flash_arcg_clk_en   (rcc_flash_arcg_clk_en),
      .rcc_qspi_arcg_clk_en    (rcc_qspi_arcg_clk_en),
      .rcc_axisram_arcg_clk_en (rcc_axisram_arcg_clk_en),
      .rcc_fmc_arcg_clk_en     (rcc_fmc_arcg_clk_en),
      .rcc_dma2d_arcg_clk_en   (rcc_dma2d_arcg_clk_en),
      .rcc_mdma_arcg_clk_en    (rcc_mdma_arcg_clk_en),
      .rcc_ltdc_arcg_clk_en    (rcc_ltdc_arcg_clk_en),
      .rcc_ramecc1_arcg_clk_en (rcc_ramecc1_arcg_clk_en),
      .rcc_gpv_arcg_clk_en     (rcc_gpv_arcg_clk_en),
      .rcc_itcm_arcg_clk_en    (rcc_itcm_arcg_clk_en),
      .rcc_dtcm2_arcg_clk_en   (rcc_dtcm2_arcg_clk_en),
      .rcc_dtcm1_arcg_clk_en   (rcc_dtcm1_arcg_clk_en),
      .rcc_jpgdec_arcg_clk_en  (rcc_jpgdec_arcg_clk_en),
      .rcc_sdmmc1_arcg_clk_en  (rcc_sdmmc1_arcg_clk_en),
      .rcc_wwdg1_arcg_clk_en   (rcc_wwdg1_arcg_clk_en),
      .rcc_usb2ulpi_arcg_clk_en(rcc_usb2ulpi_arcg_clk_en),
      .rcc_usb2otg_arcg_clk_en (rcc_usb2otg_arcg_clk_en),
      .rcc_usb1ulpi_arcg_clk_en(rcc_usb1ulpi_arcg_clk_en),
      .rcc_usb1otg_arcg_clk_en (rcc_usb1otg_arcg_clk_en),
      .rcc_eth1rx_arcg_clk_en  (rcc_eth1rx_arcg_clk_en),
      .rcc_eth1tx_arcg_clk_en  (rcc_eth1tx_arcg_clk_en),
      .rcc_eth1mac_arcg_clk_en (rcc_eth1mac_arcg_clk_en),
      .rcc_adc12_arcg_clk_en   (rcc_adc12_arcg_clk_en),
      .rcc_dma2_arcg_clk_en    (rcc_dma2_arcg_clk_en),
      .rcc_dma1_arcg_clk_en    (rcc_dma1_arcg_clk_en),
      .rcc_sram3_arcg_clk_en   (rcc_sram3_arcg_clk_en),
      .rcc_sram2_arcg_clk_en   (rcc_sram2_arcg_clk_en),
      .rcc_sram1_arcg_clk_en   (rcc_sram1_arcg_clk_en),
      .rcc_sdmmc2_arcg_clk_en  (rcc_sdmmc2_arcg_clk_en),
      .rcc_rng_arcg_clk_en     (rcc_rng_arcg_clk_en),
      .rcc_hash_arcg_clk_en    (rcc_hash_arcg_clk_en),
      .rcc_crypt_arcg_clk_en   (rcc_crypt_arcg_clk_en),
      .rcc_dcmi_arcg_clk_en    (rcc_dcmi_arcg_clk_en),
      .rcc_ramecc2_arcg_clk_en (rcc_ramecc2_arcg_clk_en),
      .rcc_uart8_arcg_clk_en   (rcc_uart8_arcg_clk_en),
      .rcc_uart7_arcg_clk_en   (rcc_uart7_arcg_clk_en),
      .rcc_dac12_arcg_clk_en   (rcc_dac12_arcg_clk_en),
      .rcc_hdmicec_arcg_clk_en (rcc_hdmicec_arcg_clk_en),
      .rcc_i2c3_arcg_clk_en    (rcc_i2c3_arcg_clk_en),
      .rcc_i2c2_arcg_clk_en    (rcc_i2c2_arcg_clk_en),
      .rcc_i2c1_arcg_clk_en    (rcc_i2c1_arcg_clk_en),
      .rcc_uart5_arcg_clk_en   (rcc_uart5_arcg_clk_en),
      .rcc_uart4_arcg_clk_en   (rcc_uart4_arcg_clk_en),
      .rcc_usart3_arcg_clk_en  (rcc_usart3_arcg_clk_en),
      .rcc_usart2_arcg_clk_en  (rcc_usart2_arcg_clk_en),
      .rcc_spdifrx_arcg_clk_en (rcc_spdifrx_arcg_clk_en),
      .rcc_spi3_arcg_clk_en    (rcc_spi3_arcg_clk_en),
      .rcc_spi2_arcg_clk_en    (rcc_spi2_arcg_clk_en),
      .rcc_wwdg2_arcg_clk_en   (rcc_wwdg2_arcg_clk_en),
      .rcc_lptim1_arcg_clk_en  (rcc_lptim1_arcg_clk_en),
      .rcc_tim14_arcg_clk_en   (rcc_tim14_arcg_clk_en),
      .rcc_tim13_arcg_clk_en   (rcc_tim13_arcg_clk_en),
      .rcc_tim12_arcg_clk_en   (rcc_tim12_arcg_clk_en),
      .rcc_tim7_arcg_clk_en    (rcc_tim7_arcg_clk_en),
      .rcc_tim6_arcg_clk_en    (rcc_tim6_arcg_clk_en),
      .rcc_tim5_arcg_clk_en    (rcc_tim5_arcg_clk_en),
      .rcc_tim4_arcg_clk_en    (rcc_tim4_arcg_clk_en),
      .rcc_tim3_arcg_clk_en    (rcc_tim3_arcg_clk_en),
      .rcc_tim2_arcg_clk_en    (rcc_tim2_arcg_clk_en),
      .rcc_fdcan_arcg_clk_en   (rcc_fdcan_arcg_clk_en),
      .rcc_mdios_arcg_clk_en   (rcc_mdios_arcg_clk_en),
      .rcc_opamp_arcg_clk_en   (rcc_opamp_arcg_clk_en),
      .rcc_swpmi_arcg_clk_en   (rcc_swpmi_arcg_clk_en),
      .rcc_crs_arcg_clk_en     (rcc_crs_arcg_clk_en),
      .rcc_hrtim_arcg_clk_en   (rcc_hrtim_arcg_clk_en),
      .rcc_dfsdm1_arcg_clk_en  (rcc_dfsdm1_arcg_clk_en),
      .rcc_sai3_arcg_clk_en    (rcc_sai3_arcg_clk_en),
      .rcc_sai2_arcg_clk_en    (rcc_sai2_arcg_clk_en),
      .rcc_sai1_arcg_clk_en    (rcc_sai1_arcg_clk_en),
      .rcc_spi5_arcg_clk_en    (rcc_spi5_arcg_clk_en),
      .rcc_tim17_arcg_clk_en   (rcc_tim17_arcg_clk_en),
      .rcc_tim16_arcg_clk_en   (rcc_tim16_arcg_clk_en),
      .rcc_tim15_arcg_clk_en   (rcc_tim15_arcg_clk_en),
      .rcc_spi4_arcg_clk_en    (rcc_spi4_arcg_clk_en),
      .rcc_spi1_arcg_clk_en    (rcc_spi1_arcg_clk_en),
      .rcc_usart6_arcg_clk_en  (rcc_usart6_arcg_clk_en),
      .rcc_usart1_arcg_clk_en  (rcc_usart1_arcg_clk_en),
      .rcc_tim8_arcg_clk_en    (rcc_tim8_arcg_clk_en),
      .rcc_tim1_arcg_clk_en    (rcc_tim1_arcg_clk_en),
      .rcc_sram4_arcg_clk_en   (rcc_sram4_arcg_clk_en),
      .rcc_bkpram_arcg_clk_en  (rcc_bkpram_arcg_clk_en),
      .rcc_ramecc3_arcg_clk_en (rcc_ramecc3_arcg_clk_en),
      .rcc_hsem_arcg_clk_en    (rcc_hsem_arcg_clk_en),
      .rcc_adc3_arcg_clk_en    (rcc_adc3_arcg_clk_en),
      .rcc_bdma_arcg_clk_en    (rcc_bdma_arcg_clk_en),
      .rcc_crc_arcg_clk_en     (rcc_crc_arcg_clk_en),
      .rcc_gpiok_arcg_clk_en   (rcc_gpiok_arcg_clk_en),
      .rcc_gpioj_arcg_clk_en   (rcc_gpioj_arcg_clk_en),
      .rcc_gpioi_arcg_clk_en   (rcc_gpioi_arcg_clk_en),
      .rcc_gpioh_arcg_clk_en   (rcc_gpioh_arcg_clk_en),
      .rcc_gpiog_arcg_clk_en   (rcc_gpiog_arcg_clk_en),
      .rcc_gpiof_arcg_clk_en   (rcc_gpiof_arcg_clk_en),
      .rcc_gpioe_arcg_clk_en   (rcc_gpioe_arcg_clk_en),
      .rcc_gpiod_arcg_clk_en   (rcc_gpiod_arcg_clk_en),
      .rcc_gpioc_arcg_clk_en   (rcc_gpioc_arcg_clk_en),
      .rcc_gpiob_arcg_clk_en   (rcc_gpiob_arcg_clk_en),
      .rcc_gpioa_arcg_clk_en   (rcc_gpioa_arcg_clk_en),
      .rcc_rcc_arcg_clk_en     (rcc_rcc_arcg_clk_en),
      .rcc_pwr_arcg_clk_en     (rcc_pwr_arcg_clk_en),
      .rcc_sai4_arcg_clk_en    (rcc_sai4_arcg_clk_en),
      .rcc_rtc_arcg_clk_en     (rcc_rtc_arcg_clk_en),
      .rcc_vref_arcg_clk_en    (rcc_vref_arcg_clk_en),
      .rcc_comp12_arcg_clk_en  (rcc_comp12_arcg_clk_en),
      .rcc_lptim5_arcg_clk_en  (rcc_lptim5_arcg_clk_en),
      .rcc_lptim4_arcg_clk_en  (rcc_lptim4_arcg_clk_en),
      .rcc_lptim3_arcg_clk_en  (rcc_lptim3_arcg_clk_en),
      .rcc_lptim2_arcg_clk_en  (rcc_lptim2_arcg_clk_en),
      .rcc_i2c4_arcg_clk_en    (rcc_i2c4_arcg_clk_en),
      .rcc_spi6_arcg_clk_en    (rcc_spi6_arcg_clk_en),
      .rcc_lpuart1_arcg_clk_en (rcc_lpuart1_arcg_clk_en),
      .rcc_syscfg_arcg_clk_en  (rcc_syscfg_arcg_clk_en),
      .rcc_iwdg2_arcg_clk_en   (rcc_iwdg2_arcg_clk_en),
      .rcc_iwdg1_arcg_clk_en   (rcc_iwdg1_arcg_clk_en),
      .rcc_exti_arcg_clk_en    (rcc_exti_arcg_clk_en),
      // Inputs
      .rcc_arcg_on             (rcc_arcg_on),
      .sys_clk                 (sys_clk),
      .sys_d1cpre_clk          (sys_d1cpre_clk),
      .sys_hpre_clk            (sys_hpre_clk),
      .rcc_flash_hclk          (rcc_flash_hclk),
      .rcc_qspi_hclk           (rcc_qspi_hclk),
      .rcc_axisram_aclk        (rcc_axisram_aclk),
      .rcc_fmc_hclk            (rcc_fmc_hclk),
      .rcc_dma2d_hclk          (rcc_dma2d_hclk),
      .rcc_mdma_hclk           (rcc_mdma_hclk),
      .rcc_ltdc_pclk           (rcc_ltdc_pclk),
      .rcc_ramecc1_hclk        (rcc_ramecc1_hclk),
      .rcc_gpv_hclk            (rcc_gpv_hclk),
      .rcc_itcm_hclk           (rcc_itcm_hclk),
      .rcc_dtcm2_hclk          (rcc_dtcm2_hclk),
      .rcc_dtcm1_hclk          (rcc_dtcm1_hclk),
      .rcc_jpgdec_hclk         (rcc_jpgdec_hclk),
      .rcc_sdmmc1_hclk         (rcc_sdmmc1_hclk),
      .rcc_wwdg1_pclk          (rcc_wwdg1_pclk),
      .rcc_usb2ulpi_hclk       (rcc_usb2ulpi_hclk),
      .rcc_usb2otg_hclk        (rcc_usb2otg_hclk),
      .rcc_usb1ulpi_hclk       (rcc_usb1ulpi_hclk),
      .rcc_usb1otg_hclk        (rcc_usb1otg_hclk),
      .rcc_eth1rx_hclk         (rcc_eth1rx_hclk),
      .rcc_eth1tx_hclk         (rcc_eth1tx_hclk),
      .rcc_eth1mac_hclk        (rcc_eth1mac_hclk),
      .rcc_adc12_hclk          (rcc_adc12_hclk),
      .rcc_dma2_hclk           (rcc_dma2_hclk),
      .rcc_dma1_hclk           (rcc_dma1_hclk),
      .rcc_sram3_hclk          (rcc_sram3_hclk),
      .rcc_sram2_hclk          (rcc_sram2_hclk),
      .rcc_sram1_hclk          (rcc_sram1_hclk),
      .rcc_sdmmc2_hclk         (rcc_sdmmc2_hclk),
      .rcc_rng_hclk            (rcc_rng_hclk),
      .rcc_hash_hclk           (rcc_hash_hclk),
      .rcc_crypt_hclk          (rcc_crypt_hclk),
      .rcc_dcmi_hclk           (rcc_dcmi_hclk),
      .rcc_ramecc2_hclk        (rcc_ramecc2_hclk),
      .rcc_uart8_pclk          (rcc_uart8_pclk),
      .rcc_uart7_pclk          (rcc_uart7_pclk),
      .rcc_dac12_pclk          (rcc_dac12_pclk),
      .rcc_hdmicec_pclk        (rcc_hdmicec_pclk),
      .rcc_i2c3_pclk           (rcc_i2c3_pclk),
      .rcc_i2c2_pclk           (rcc_i2c2_pclk),
      .rcc_i2c1_pclk           (rcc_i2c1_pclk),
      .rcc_uart5_pclk          (rcc_uart5_pclk),
      .rcc_uart4_pclk          (rcc_uart4_pclk),
      .rcc_usart3_pclk         (rcc_usart3_pclk),
      .rcc_usart2_pclk         (rcc_usart2_pclk),
      .rcc_spdifrx_pclk        (rcc_spdifrx_pclk),
      .rcc_spi3_pclk           (rcc_spi3_pclk),
      .rcc_spi2_pclk           (rcc_spi2_pclk),
      .rcc_wwdg2_pclk          (rcc_wwdg2_pclk),
      .rcc_lptim1_pclk         (rcc_lptim1_pclk),
      .rcc_tim14_pclk          (rcc_tim14_pclk),
      .rcc_tim13_pclk          (rcc_tim13_pclk),
      .rcc_tim12_pclk          (rcc_tim12_pclk),
      .rcc_tim7_pclk           (rcc_tim7_pclk),
      .rcc_tim6_pclk           (rcc_tim6_pclk),
      .rcc_tim5_pclk           (rcc_tim5_pclk),
      .rcc_tim4_pclk           (rcc_tim4_pclk),
      .rcc_tim3_pclk           (rcc_tim3_pclk),
      .rcc_tim2_pclk           (rcc_tim2_pclk),
      .rcc_fdcan_pclk          (rcc_fdcan_pclk),
      .rcc_mdios_pclk          (rcc_mdios_pclk),
      .rcc_opamp_pclk          (rcc_opamp_pclk),
      .rcc_swpmi_pclk          (rcc_swpmi_pclk),
      .rcc_crs_pclk            (rcc_crs_pclk),
      .rcc_hrtim_pclk          (rcc_hrtim_pclk),
      .rcc_dfsdm1_pclk         (rcc_dfsdm1_pclk),
      .rcc_sai3_pclk           (rcc_sai3_pclk),
      .rcc_sai2_pclk           (rcc_sai2_pclk),
      .rcc_sai1_pclk           (rcc_sai1_pclk),
      .rcc_spi5_pclk           (rcc_spi5_pclk),
      .rcc_tim17_pclk          (rcc_tim17_pclk),
      .rcc_tim16_pclk          (rcc_tim16_pclk),
      .rcc_tim15_pclk          (rcc_tim15_pclk),
      .rcc_spi4_pclk           (rcc_spi4_pclk),
      .rcc_spi1_pclk           (rcc_spi1_pclk),
      .rcc_usart6_pclk         (rcc_usart6_pclk),
      .rcc_usart1_pclk         (rcc_usart1_pclk),
      .rcc_tim8_pclk           (rcc_tim8_pclk),
      .rcc_tim1_pclk           (rcc_tim1_pclk),
      .rcc_sram4_hclk          (rcc_sram4_hclk),
      .rcc_bkpram_hclk         (rcc_bkpram_hclk),
      .rcc_ramecc3_hclk        (rcc_ramecc3_hclk),
      .rcc_hsem_hclk           (rcc_hsem_hclk),
      .rcc_adc3_hclk           (rcc_adc3_hclk),
      .rcc_bdma_hclk           (rcc_bdma_hclk),
      .rcc_crc_hclk            (rcc_crc_hclk),
      .rcc_gpiok_hclk          (rcc_gpiok_hclk),
      .rcc_gpioj_hclk          (rcc_gpioj_hclk),
      .rcc_gpioi_hclk          (rcc_gpioi_hclk),
      .rcc_gpioh_hclk          (rcc_gpioh_hclk),
      .rcc_gpiog_hclk          (rcc_gpiog_hclk),
      .rcc_gpiof_hclk          (rcc_gpiof_hclk),
      .rcc_gpioe_hclk          (rcc_gpioe_hclk),
      .rcc_gpiod_hclk          (rcc_gpiod_hclk),
      .rcc_gpioc_hclk          (rcc_gpioc_hclk),
      .rcc_gpiob_hclk          (rcc_gpiob_hclk),
      .rcc_gpioa_hclk          (rcc_gpioa_hclk),
      .rcc_rcc_hclk            (rcc_rcc_hclk),
      .rcc_pwr_hclk            (rcc_pwr_hclk),
      .rcc_sai4_pclk           (rcc_sai4_pclk),
      .rcc_rtc_pclk            (rcc_rtc_pclk),
      .rcc_vref_pclk           (rcc_vref_pclk),
      .rcc_comp12_pclk         (rcc_comp12_pclk),
      .rcc_lptim5_pclk         (rcc_lptim5_pclk),
      .rcc_lptim4_pclk         (rcc_lptim4_pclk),
      .rcc_lptim3_pclk         (rcc_lptim3_pclk),
      .rcc_lptim2_pclk         (rcc_lptim2_pclk),
      .rcc_i2c4_pclk           (rcc_i2c4_pclk),
      .rcc_spi6_pclk           (rcc_spi6_pclk),
      .rcc_lpuart1_pclk        (rcc_lpuart1_pclk),
      .rcc_syscfg_pclk         (rcc_syscfg_pclk),
      .rcc_iwdg2_pclk          (rcc_iwdg2_pclk),
      .rcc_iwdg1_pclk          (rcc_iwdg1_pclk),
      .rcc_exti_pclk           (rcc_exti_pclk),
      .rcc_flash_rst_n         (rcc_flash_rst_n),
      .rcc_qspi_rst_n          (rcc_qspi_rst_n),
      .rcc_axisram_rst_n       (rcc_axisram_rst_n),
      .rcc_fmc_rst_n           (rcc_fmc_rst_n),
      .rcc_dma2d_rst_n         (rcc_dma2d_rst_n),
      .rcc_mdma_rst_n          (rcc_mdma_rst_n),
      .rcc_ltdc_rst_n          (rcc_ltdc_rst_n),
      .rcc_ramecc1_rst_n       (rcc_ramecc1_rst_n),
      .rcc_gpv_rst_n           (rcc_gpv_rst_n),
      .rcc_itcm_rst_n          (rcc_itcm_rst_n),
      .rcc_dtcm2_rst_n         (rcc_dtcm2_rst_n),
      .rcc_dtcm1_rst_n         (rcc_dtcm1_rst_n),
      .rcc_jpgdec_rst_n        (rcc_jpgdec_rst_n),
      .rcc_sdmmc1_rst_n        (rcc_sdmmc1_rst_n),
      .rcc_wwdg1_rst_n         (rcc_wwdg1_rst_n),
      .rcc_usb2ulpi_rst_n      (rcc_usb2ulpi_rst_n),
      .rcc_usb2otg_rst_n       (rcc_usb2otg_rst_n),
      .rcc_usb1ulpi_rst_n      (rcc_usb1ulpi_rst_n),
      .rcc_usb1otg_rst_n       (rcc_usb1otg_rst_n),
      .rcc_eth1rx_rst_n        (rcc_eth1rx_rst_n),
      .rcc_eth1tx_rst_n        (rcc_eth1tx_rst_n),
      .rcc_eth1mac_rst_n       (rcc_eth1mac_rst_n),
      .rcc_adc12_rst_n         (rcc_adc12_rst_n),
      .rcc_dma2_rst_n          (rcc_dma2_rst_n),
      .rcc_dma1_rst_n          (rcc_dma1_rst_n),
      .rcc_sram3_rst_n         (rcc_sram3_rst_n),
      .rcc_sram2_rst_n         (rcc_sram2_rst_n),
      .rcc_sram1_rst_n         (rcc_sram1_rst_n),
      .rcc_sdmmc2_rst_n        (rcc_sdmmc2_rst_n),
      .rcc_rng_rst_n           (rcc_rng_rst_n),
      .rcc_hash_rst_n          (rcc_hash_rst_n),
      .rcc_crypt_rst_n         (rcc_crypt_rst_n),
      .rcc_dcmi_rst_n          (rcc_dcmi_rst_n),
      .rcc_ramecc2_rst_n       (rcc_ramecc2_rst_n),
      .rcc_uart8_rst_n         (rcc_uart8_rst_n),
      .rcc_uart7_rst_n         (rcc_uart7_rst_n),
      .rcc_dac12_rst_n         (rcc_dac12_rst_n),
      .rcc_hdmicec_rst_n       (rcc_hdmicec_rst_n),
      .rcc_i2c3_rst_n          (rcc_i2c3_rst_n),
      .rcc_i2c2_rst_n          (rcc_i2c2_rst_n),
      .rcc_i2c1_rst_n          (rcc_i2c1_rst_n),
      .rcc_uart5_rst_n         (rcc_uart5_rst_n),
      .rcc_uart4_rst_n         (rcc_uart4_rst_n),
      .rcc_usart3_rst_n        (rcc_usart3_rst_n),
      .rcc_usart2_rst_n        (rcc_usart2_rst_n),
      .rcc_spdifrx_rst_n       (rcc_spdifrx_rst_n),
      .rcc_spi3_rst_n          (rcc_spi3_rst_n),
      .rcc_spi2_rst_n          (rcc_spi2_rst_n),
      .rcc_wwdg2_rst_n         (rcc_wwdg2_rst_n),
      .rcc_lptim1_rst_n        (rcc_lptim1_rst_n),
      .rcc_tim14_rst_n         (rcc_tim14_rst_n),
      .rcc_tim13_rst_n         (rcc_tim13_rst_n),
      .rcc_tim12_rst_n         (rcc_tim12_rst_n),
      .rcc_tim7_rst_n          (rcc_tim7_rst_n),
      .rcc_tim6_rst_n          (rcc_tim6_rst_n),
      .rcc_tim5_rst_n          (rcc_tim5_rst_n),
      .rcc_tim4_rst_n          (rcc_tim4_rst_n),
      .rcc_tim3_rst_n          (rcc_tim3_rst_n),
      .rcc_tim2_rst_n          (rcc_tim2_rst_n),
      .rcc_fdcan_rst_n         (rcc_fdcan_rst_n),
      .rcc_mdios_rst_n         (rcc_mdios_rst_n),
      .rcc_opamp_rst_n         (rcc_opamp_rst_n),
      .rcc_swpmi_rst_n         (rcc_swpmi_rst_n),
      .rcc_crs_rst_n           (rcc_crs_rst_n),
      .rcc_hrtim_rst_n         (rcc_hrtim_rst_n),
      .rcc_dfsdm1_rst_n        (rcc_dfsdm1_rst_n),
      .rcc_sai3_rst_n          (rcc_sai3_rst_n),
      .rcc_sai2_rst_n          (rcc_sai2_rst_n),
      .rcc_sai1_rst_n          (rcc_sai1_rst_n),
      .rcc_spi5_rst_n          (rcc_spi5_rst_n),
      .rcc_tim17_rst_n         (rcc_tim17_rst_n),
      .rcc_tim16_rst_n         (rcc_tim16_rst_n),
      .rcc_tim15_rst_n         (rcc_tim15_rst_n),
      .rcc_spi4_rst_n          (rcc_spi4_rst_n),
      .rcc_spi1_rst_n          (rcc_spi1_rst_n),
      .rcc_usart6_rst_n        (rcc_usart6_rst_n),
      .rcc_usart1_rst_n        (rcc_usart1_rst_n),
      .rcc_tim8_rst_n          (rcc_tim8_rst_n),
      .rcc_tim1_rst_n          (rcc_tim1_rst_n),
      .rcc_sram4_rst_n         (rcc_sram4_rst_n),
      .rcc_bkpram_rst_n        (rcc_bkpram_rst_n),
      .rcc_ramecc3_rst_n       (rcc_ramecc3_rst_n),
      .rcc_hsem_rst_n          (rcc_hsem_rst_n),
      .rcc_adc3_rst_n          (rcc_adc3_rst_n),
      .rcc_bdma_rst_n          (rcc_bdma_rst_n),
      .rcc_crc_rst_n           (rcc_crc_rst_n),
      .rcc_gpiok_rst_n         (rcc_gpiok_rst_n),
      .rcc_gpioj_rst_n         (rcc_gpioj_rst_n),
      .rcc_gpioi_rst_n         (rcc_gpioi_rst_n),
      .rcc_gpioh_rst_n         (rcc_gpioh_rst_n),
      .rcc_gpiog_rst_n         (rcc_gpiog_rst_n),
      .rcc_gpiof_rst_n         (rcc_gpiof_rst_n),
      .rcc_gpioe_rst_n         (rcc_gpioe_rst_n),
      .rcc_gpiod_rst_n         (rcc_gpiod_rst_n),
      .rcc_gpioc_rst_n         (rcc_gpioc_rst_n),
      .rcc_gpiob_rst_n         (rcc_gpiob_rst_n),
      .rcc_gpioa_rst_n         (rcc_gpioa_rst_n),
      .rcc_rcc_rst_n           (rcc_rcc_rst_n),
      .rcc_pwr_rst_n           (rcc_pwr_rst_n),
      .rcc_sai4_rst_n          (rcc_sai4_rst_n),
      .rcc_rtc_rst_n           (rcc_rtc_rst_n),
      .rcc_vref_rst_n          (rcc_vref_rst_n),
      .rcc_comp12_rst_n        (rcc_comp12_rst_n),
      .rcc_lptim5_rst_n        (rcc_lptim5_rst_n),
      .rcc_lptim4_rst_n        (rcc_lptim4_rst_n),
      .rcc_lptim3_rst_n        (rcc_lptim3_rst_n),
      .rcc_lptim2_rst_n        (rcc_lptim2_rst_n),
      .rcc_i2c4_rst_n          (rcc_i2c4_rst_n),
      .rcc_spi6_rst_n          (rcc_spi6_rst_n),
      .rcc_lpuart1_rst_n       (rcc_lpuart1_rst_n),
      .rcc_syscfg_rst_n        (rcc_syscfg_rst_n),
      .rcc_iwdg2_rst_n         (rcc_iwdg2_rst_n),
      .rcc_iwdg1_rst_n         (rcc_iwdg1_rst_n),
      .rcc_exti_rst_n          (rcc_exti_rst_n),
      .sys_rst_n               (sys_rst_n),
      .d1_rst_n                (d1_rst_n),
      .d2_rst_n                (d2_rst_n),
      .cpu1_rst_n              (cpu1_rst_n),
      .cpu2_rst_n              (cpu2_rst_n)
  );

  rcc_ahb_lite_bus u_rcc_ahb_lite_bus (  /*AUTOINST*/
      // Outputs
      .ahb_hrdata    (ahb_hrdata[31:0]),
      .ahb_hready_out(ahb_hready_out),
      .ahb_hresp     (ahb_hresp),
      .clk           (clk),
      .rst_n         (rst_n),
      .req           (req),
      .we            (we[3:0]),
      .addr          (addr[31:0]),
      .wdata         (wdata[31:0]),
      // Inputs
      .ahb_hclk      (ahb_hclk),
      .ahb_hresetn   (ahb_hresetn),
      .ahb_haddr     (ahb_haddr[31:0]),
      .ahb_hburst    (ahb_hburst[2:0]),
      .ahb_hprot     (ahb_hprot[2:0]),
      .ahb_hready_in (ahb_hready_in),
      .ahb_hsize     (ahb_hsize[2:0]),
      .ahb_htrans    (ahb_htrans[1:0]),
      .ahb_hwdata    (ahb_hwdata[31:0]),
      .ahb_hwrite    (ahb_hwrite),
      .ahb_hsel      (ahb_hsel),
      .ahb_hmaster   (ahb_hmaster),
      .rdata         (rdata[31:0]),
      .rsp           (rsp[1:0])
  );

  rcc_reg #(  /*AUTOINSTPARAM*/
      // Parameters
      .AW(AW),
      .DW(DW),
      .WW(WW)
  ) u_rcc_reg (  /*AUTOINST*/
      // Outputs
      .rdata                   (rdata[DW-1:0]),
      .rsp                     (rsp[1:0]),
      .pll3on                  (pll3on),
      .pll2on                  (pll2on),
      .pll1on                  (pll1on),
      .hsecsson                (hsecsson),
      .hsebyp                  (hsebyp),
      .hseon                   (hseon),
      .hsi48on                 (hsi48on),
      .csikeron                (csikeron),
      .csion                   (csion),
      .hsidiv                  (hsidiv[1:0]),
      .hsikeron                (hsikeron),
      .hsion                   (hsion),
      .rcc_csi_triming         (rcc_csi_triming[7:0]),
      .rcc_hsi_triming         (rcc_hsi_triming[11:0]),
      .mco2sel                 (mco2sel[2:0]),
      .mco2pre                 (mco2pre[3:0]),
      .mco1sel                 (mco1sel[2:0]),
      .mco1pre                 (mco1pre[3:0]),
      .timpre                  (timpre),
      .hrtimsel                (hrtimsel),
      .rtcpre                  (rtcpre[5:0]),
      .sw                      (sw[1:0]),
      .d1cpre                  (d1cpre[3:0]),
      .d1ppre                  (d1ppre[2:0]),
      .hpre                    (hpre[3:0]),
      .d2ppre2                 (d2ppre2[2:0]),
      .d2ppre1                 (d2ppre1[2:0]),
      .d3ppre                  (d3ppre[2:0]),
      .divm3                   (divm3[5:0]),
      .divm2                   (divm2[5:0]),
      .divm1                   (divm1[5:0]),
      .pllsrc                  (pllsrc[1:0]),
      .divr3en                 (divr3en),
      .divq3en                 (divq3en),
      .divp3en                 (divp3en),
      .divr2en                 (divr2en),
      .divq2en                 (divq2en),
      .divp2en                 (divp2en),
      .divr1en                 (divr1en),
      .divq1en                 (divq1en),
      .divp1en                 (divp1en),
      .pll3rge                 (pll3rge[1:0]),
      .pll3vcosel              (pll3vcosel),
      .pll3fracen              (pll3fracen),
      .pll2rge                 (pll2rge[1:0]),
      .pll2vcosel              (pll2vcosel),
      .pll2fracen              (pll2fracen),
      .pll1rge                 (pll1rge[1:0]),
      .pll1vcosel              (pll1vcosel),
      .pll1fracen              (pll1fracen),
      .divr1                   (divr1[6:0]),
      .divq1                   (divq1[6:0]),
      .divp1                   (divp1[6:0]),
      .divn1                   (divn1[8:0]),
      .fracn1                  (fracn1[12:0]),
      .divr2                   (divr2[6:0]),
      .divq2                   (divq2[6:0]),
      .divp2                   (divp2[6:0]),
      .divn2                   (divn2[8:0]),
      .fracn2                  (fracn2[12:0]),
      .divr3                   (divr3[6:0]),
      .divq3                   (divq3[6:0]),
      .divp3                   (divp3[6:0]),
      .divn3                   (divn3[8:0]),
      .fracn3                  (fracn3[12:0]),
      .clkpersel               (clkpersel[1:0]),
      .sdmmcsel                (sdmmcsel),
      .qspisel                 (qspisel[1:0]),
      .fmcsel                  (fmcsel[1:0]),
      .swpmisel                (swpmisel),
      .fdcansel                (fdcansel[1:0]),
      .dfsdm1sel               (dfsdm1sel),
      .spdifsel                (spdifsel[1:0]),
      .spi45sel                (spi45sel[2:0]),
      .spi123sel               (spi123sel[2:0]),
      .sai23sel                (sai23sel[2:0]),
      .sai1sel                 (sai1sel[2:0]),
      .lptim1sel               (lptim1sel[2:0]),
      .cecsel                  (cecsel[1:0]),
      .usbsel                  (usbsel[1:0]),
      .i2c123sel               (i2c123sel[1:0]),
      .rngsel                  (rngsel[1:0]),
      .usart16sel              (usart16sel[2:0]),
      .usart234578sel          (usart234578sel[2:0]),
      .spi6sel                 (spi6sel[2:0]),
      .sai4bsel                (sai4bsel[2:0]),
      .sai4asel                (sai4asel[2:0]),
      .adcsel                  (adcsel[1:0]),
      .lptim345sel             (lptim345sel[2:0]),
      .lptim2sel               (lptim2sel[2:0]),
      .i2c4sel                 (i2c4sel[1:0]),
      .lpuart1sel              (lpuart1sel[2:0]),
      .lsecssie                (lsecssie),
      .pll3rdyie               (pll3rdyie),
      .pll2rdyie               (pll2rdyie),
      .pll1rdyie               (pll1rdyie),
      .hsi48rdyie              (hsi48rdyie),
      .csirdyie                (csirdyie),
      .hserdyie                (hserdyie),
      .hsirdyie                (hsirdyie),
      .lserdyie                (lserdyie),
      .lsirdyie                (lsirdyie),
      .rcc_hsecssf             (rcc_hsecssf),
      .rcc_lsecssf             (rcc_lsecssf),
      .rcc_pll3rdyf            (rcc_pll3rdyf),
      .rcc_pll2rdyf            (rcc_pll2rdyf),
      .rcc_pll1rdyf            (rcc_pll1rdyf),
      .rcc_hsi48rdyf           (rcc_hsi48rdyf),
      .rcc_csirdyf             (rcc_csirdyf),
      .rcc_hserdyf             (rcc_hserdyf),
      .rcc_hsirdyf             (rcc_hsirdyf),
      .rcc_lserdyf             (rcc_lserdyf),
      .rcc_lsirdyf             (rcc_lsirdyf),
      .sdmmc1rst               (sdmmc1rst),
      .qspirst                 (qspirst),
      .fmcrst                  (fmcrst),
      .jpgdecrst               (jpgdecrst),
      .dma2drst                (dma2drst),
      .mdmarst                 (mdmarst),
      .usb2otgrst              (usb2otgrst),
      .usb1otgrst              (usb1otgrst),
      .eth1macrst              (eth1macrst),
      .adc12rst                (adc12rst),
      .dma2rst                 (dma2rst),
      .dma1rst                 (dma1rst),
      .sdmmc2rst               (sdmmc2rst),
      .rngrst                  (rngrst),
      .hashrst                 (hashrst),
      .cryptrst                (cryptrst),
      .dcmirst                 (dcmirst),
      .hsemrst                 (hsemrst),
      .adc3rst                 (adc3rst),
      .bdmarst                 (bdmarst),
      .crcrst                  (crcrst),
      .gpiokrst                (gpiokrst),
      .gpiojrst                (gpiojrst),
      .gpioirst                (gpioirst),
      .gpiohrst                (gpiohrst),
      .gpiogrst                (gpiogrst),
      .gpiofrst                (gpiofrst),
      .gpioerst                (gpioerst),
      .gpiodrst                (gpiodrst),
      .gpiocrst                (gpiocrst),
      .gpiobrst                (gpiobrst),
      .gpioarst                (gpioarst),
      .ltdcrst                 (ltdcrst),
      .uart8rst                (uart8rst),
      .uart7rst                (uart7rst),
      .dac12rst                (dac12rst),
      .hdmicecrst              (hdmicecrst),
      .i2c3rst                 (i2c3rst),
      .i2c2rst                 (i2c2rst),
      .i2c1rst                 (i2c1rst),
      .uart5rst                (uart5rst),
      .uart4rst                (uart4rst),
      .usart3rst               (usart3rst),
      .usart2rst               (usart2rst),
      .spdifrxrst              (spdifrxrst),
      .spi3rst                 (spi3rst),
      .spi2rst                 (spi2rst),
      .lptim1rst               (lptim1rst),
      .tim14rst                (tim14rst),
      .tim13rst                (tim13rst),
      .tim12rst                (tim12rst),
      .tim7rst                 (tim7rst),
      .tim6rst                 (tim6rst),
      .tim5rst                 (tim5rst),
      .tim4rst                 (tim4rst),
      .tim3rst                 (tim3rst),
      .tim2rst                 (tim2rst),
      .fdcanrst                (fdcanrst),
      .mdiosrst                (mdiosrst),
      .opamprst                (opamprst),
      .swpmirst                (swpmirst),
      .crsrst                  (crsrst),
      .hrtimrst                (hrtimrst),
      .dfsdm1rst               (dfsdm1rst),
      .sai3rst                 (sai3rst),
      .sai2rst                 (sai2rst),
      .sai1rst                 (sai1rst),
      .spi5rst                 (spi5rst),
      .tim17rst                (tim17rst),
      .tim16rst                (tim16rst),
      .tim15rst                (tim15rst),
      .spi4rst                 (spi4rst),
      .spi1rst                 (spi1rst),
      .usart6rst               (usart6rst),
      .usart1rst               (usart1rst),
      .tim8rst                 (tim8rst),
      .tim1rst                 (tim1rst),
      .sai4rst                 (sai4rst),
      .vrefrst                 (vrefrst),
      .comp12rst               (comp12rst),
      .lptim5rst               (lptim5rst),
      .lptim4rst               (lptim4rst),
      .lptim3rst               (lptim3rst),
      .lptim2rst               (lptim2rst),
      .i2c4rst                 (i2c4rst),
      .spi6rst                 (spi6rst),
      .lpuart1rst              (lpuart1rst),
      .syscfgrst               (syscfgrst),
      .ww2rsc                  (ww2rsc),
      .ww1rsc                  (ww1rsc),
      .rcc_sram4_amen          (rcc_sram4_amen),
      .rcc_bkpram_amen         (rcc_bkpram_amen),
      .rcc_adc3_amen           (rcc_adc3_amen),
      .rcc_sai4_amen           (rcc_sai4_amen),
      .rcc_crc_amen            (rcc_crc_amen),
      .rcc_rtc_amen            (rcc_rtc_amen),
      .rcc_vref_amen           (rcc_vref_amen),
      .rcc_comp12_amen         (rcc_comp12_amen),
      .rcc_lptim5_amen         (rcc_lptim5_amen),
      .rcc_lptim4_amen         (rcc_lptim4_amen),
      .rcc_lptim3_amen         (rcc_lptim3_amen),
      .rcc_lptim2_amen         (rcc_lptim2_amen),
      .rcc_i2c4_amen           (rcc_i2c4_amen),
      .rcc_spi6_amen           (rcc_spi6_amen),
      .rcc_lpuart1_amen        (rcc_lpuart1_amen),
      .rcc_bdma_amen           (rcc_bdma_amen),
      .rcc_c1_sdmmc1_en        (rcc_c1_sdmmc1_en),
      .rcc_c1_qspi_en          (rcc_c1_qspi_en),
      .rcc_c1_fmc_en           (rcc_c1_fmc_en),
      .rcc_c1_jpgdec_en        (rcc_c1_jpgdec_en),
      .rcc_c1_dma2d_en         (rcc_c1_dma2d_en),
      .rcc_c1_mdma_en          (rcc_c1_mdma_en),
      .rcc_c1_usb2ulpi_en      (rcc_c1_usb2ulpi_en),
      .rcc_c1_usb2otg_en       (rcc_c1_usb2otg_en),
      .rcc_c1_usb1ulpi_en      (rcc_c1_usb1ulpi_en),
      .rcc_c1_usb1otg_en       (rcc_c1_usb1otg_en),
      .rcc_c1_eth1rx_en        (rcc_c1_eth1rx_en),
      .rcc_c1_eth1tx_en        (rcc_c1_eth1tx_en),
      .rcc_c1_eth1mac_en       (rcc_c1_eth1mac_en),
      .rcc_c1_adc12_en         (rcc_c1_adc12_en),
      .rcc_c1_dma2_en          (rcc_c1_dma2_en),
      .rcc_c1_dma1_en          (rcc_c1_dma1_en),
      .rcc_c1_sram3_en         (rcc_c1_sram3_en),
      .rcc_c1_sram2_en         (rcc_c1_sram2_en),
      .rcc_c1_sram1_en         (rcc_c1_sram1_en),
      .rcc_c1_sdmmc2_en        (rcc_c1_sdmmc2_en),
      .rcc_c1_rng_en           (rcc_c1_rng_en),
      .rcc_c1_hash_en          (rcc_c1_hash_en),
      .rcc_c1_crypt_en         (rcc_c1_crypt_en),
      .rcc_c1_dcmi_en          (rcc_c1_dcmi_en),
      .rcc_c1_bkpram_en        (rcc_c1_bkpram_en),
      .rcc_c1_hsem_en          (rcc_c1_hsem_en),
      .rcc_c1_adc3_en          (rcc_c1_adc3_en),
      .rcc_c1_bdma_en          (rcc_c1_bdma_en),
      .rcc_c1_crc_en           (rcc_c1_crc_en),
      .rcc_c1_gpiok_en         (rcc_c1_gpiok_en),
      .rcc_c1_gpioj_en         (rcc_c1_gpioj_en),
      .rcc_c1_gpioi_en         (rcc_c1_gpioi_en),
      .rcc_c1_gpioh_en         (rcc_c1_gpioh_en),
      .rcc_c1_gpiog_en         (rcc_c1_gpiog_en),
      .rcc_c1_gpiof_en         (rcc_c1_gpiof_en),
      .rcc_c1_gpioe_en         (rcc_c1_gpioe_en),
      .rcc_c1_gpiod_en         (rcc_c1_gpiod_en),
      .rcc_c1_gpioc_en         (rcc_c1_gpioc_en),
      .rcc_c1_gpiob_en         (rcc_c1_gpiob_en),
      .rcc_c1_gpioa_en         (rcc_c1_gpioa_en),
      .rcc_c1_wwdg1_en         (rcc_c1_wwdg1_en),
      .rcc_c1_ltdc_en          (rcc_c1_ltdc_en),
      .rcc_c1_uart8_en         (rcc_c1_uart8_en),
      .rcc_c1_uart7_en         (rcc_c1_uart7_en),
      .rcc_c1_dac12_en         (rcc_c1_dac12_en),
      .rcc_c1_hdmicec_en       (rcc_c1_hdmicec_en),
      .rcc_c1_i2c3_en          (rcc_c1_i2c3_en),
      .rcc_c1_i2c2_en          (rcc_c1_i2c2_en),
      .rcc_c1_i2c1_en          (rcc_c1_i2c1_en),
      .rcc_c1_uart5_en         (rcc_c1_uart5_en),
      .rcc_c1_uart4_en         (rcc_c1_uart4_en),
      .rcc_c1_usart3_en        (rcc_c1_usart3_en),
      .rcc_c1_usart2_en        (rcc_c1_usart2_en),
      .rcc_c1_spdifrx_en       (rcc_c1_spdifrx_en),
      .rcc_c1_spi3_en          (rcc_c1_spi3_en),
      .rcc_c1_spi2_en          (rcc_c1_spi2_en),
      .rcc_c1_wwdg2_en         (rcc_c1_wwdg2_en),
      .rcc_c1_lptim1_en        (rcc_c1_lptim1_en),
      .rcc_c1_tim14_en         (rcc_c1_tim14_en),
      .rcc_c1_tim13_en         (rcc_c1_tim13_en),
      .rcc_c1_tim12_en         (rcc_c1_tim12_en),
      .rcc_c1_tim7_en          (rcc_c1_tim7_en),
      .rcc_c1_tim6_en          (rcc_c1_tim6_en),
      .rcc_c1_tim5_en          (rcc_c1_tim5_en),
      .rcc_c1_tim4_en          (rcc_c1_tim4_en),
      .rcc_c1_tim3_en          (rcc_c1_tim3_en),
      .rcc_c1_tim2_en          (rcc_c1_tim2_en),
      .rcc_c1_fdcan_en         (rcc_c1_fdcan_en),
      .rcc_c1_mdios_en         (rcc_c1_mdios_en),
      .rcc_c1_opamp_en         (rcc_c1_opamp_en),
      .rcc_c1_swpmi_en         (rcc_c1_swpmi_en),
      .rcc_c1_crs_en           (rcc_c1_crs_en),
      .rcc_c1_hrtim_en         (rcc_c1_hrtim_en),
      .rcc_c1_dfsdm1_en        (rcc_c1_dfsdm1_en),
      .rcc_c1_sai3_en          (rcc_c1_sai3_en),
      .rcc_c1_sai2_en          (rcc_c1_sai2_en),
      .rcc_c1_sai1_en          (rcc_c1_sai1_en),
      .rcc_c1_spi5_en          (rcc_c1_spi5_en),
      .rcc_c1_tim17_en         (rcc_c1_tim17_en),
      .rcc_c1_tim16_en         (rcc_c1_tim16_en),
      .rcc_c1_tim15_en         (rcc_c1_tim15_en),
      .rcc_c1_spi4_en          (rcc_c1_spi4_en),
      .rcc_c1_spi1_en          (rcc_c1_spi1_en),
      .rcc_c1_usart6_en        (rcc_c1_usart6_en),
      .rcc_c1_usart1_en        (rcc_c1_usart1_en),
      .rcc_c1_tim8_en          (rcc_c1_tim8_en),
      .rcc_c1_tim1_en          (rcc_c1_tim1_en),
      .rcc_c1_sai4_en          (rcc_c1_sai4_en),
      .rcc_c1_rtc_en           (rcc_c1_rtc_en),
      .rcc_c1_vref_en          (rcc_c1_vref_en),
      .rcc_c1_comp12_en        (rcc_c1_comp12_en),
      .rcc_c1_lptim5_en        (rcc_c1_lptim5_en),
      .rcc_c1_lptim4_en        (rcc_c1_lptim4_en),
      .rcc_c1_lptim3_en        (rcc_c1_lptim3_en),
      .rcc_c1_lptim2_en        (rcc_c1_lptim2_en),
      .rcc_c1_i2c4_en          (rcc_c1_i2c4_en),
      .rcc_c1_spi6_en          (rcc_c1_spi6_en),
      .rcc_c1_lpuart1_en       (rcc_c1_lpuart1_en),
      .rcc_c1_syscfg_en        (rcc_c1_syscfg_en),
      .rcc_c1_axisram_lpen     (rcc_c1_axisram_lpen),
      .rcc_c1_itcm_lpen        (rcc_c1_itcm_lpen),
      .rcc_c1_dtcm2_lpen       (rcc_c1_dtcm2_lpen),
      .rcc_c1_dtcm1_lpen       (rcc_c1_dtcm1_lpen),
      .rcc_c1_sdmmc1_lpen      (rcc_c1_sdmmc1_lpen),
      .rcc_c1_qspi_lpen        (rcc_c1_qspi_lpen),
      .rcc_c1_fmc_lpen         (rcc_c1_fmc_lpen),
      .rcc_c1_flitf_lpen       (rcc_c1_flitf_lpen),
      .rcc_c1_jpgdec_lpen      (rcc_c1_jpgdec_lpen),
      .rcc_c1_dma2d_lpen       (rcc_c1_dma2d_lpen),
      .rcc_c1_mdma_lpen        (rcc_c1_mdma_lpen),
      .rcc_c1_usb2ulpi_lpen    (rcc_c1_usb2ulpi_lpen),
      .rcc_c1_usb2otg_lpen     (rcc_c1_usb2otg_lpen),
      .rcc_c1_usb1ulpi_lpen    (rcc_c1_usb1ulpi_lpen),
      .rcc_c1_usb1otg_lpen     (rcc_c1_usb1otg_lpen),
      .rcc_c1_eth1rx_lpen      (rcc_c1_eth1rx_lpen),
      .rcc_c1_eth1tx_lpen      (rcc_c1_eth1tx_lpen),
      .rcc_c1_eth1mac_lpen     (rcc_c1_eth1mac_lpen),
      .rcc_c1_adc12_lpen       (rcc_c1_adc12_lpen),
      .rcc_c1_dma2_lpen        (rcc_c1_dma2_lpen),
      .rcc_c1_dma1_lpen        (rcc_c1_dma1_lpen),
      .rcc_c1_sram3_lpen       (rcc_c1_sram3_lpen),
      .rcc_c1_sram2_lpen       (rcc_c1_sram2_lpen),
      .rcc_c1_sram1_lpen       (rcc_c1_sram1_lpen),
      .rcc_c1_sdmmc2_lpen      (rcc_c1_sdmmc2_lpen),
      .rcc_c1_rng_lpen         (rcc_c1_rng_lpen),
      .rcc_c1_hash_lpen        (rcc_c1_hash_lpen),
      .rcc_c1_crypt_lpen       (rcc_c1_crypt_lpen),
      .rcc_c1_dcmi_lpen        (rcc_c1_dcmi_lpen),
      .rcc_c1_sram4_lpen       (rcc_c1_sram4_lpen),
      .rcc_c1_bkpram_lpen      (rcc_c1_bkpram_lpen),
      .rcc_c1_adc3_lpen        (rcc_c1_adc3_lpen),
      .rcc_c1_bdma_lpen        (rcc_c1_bdma_lpen),
      .rcc_c1_crc_lpen         (rcc_c1_crc_lpen),
      .rcc_c1_gpiok_lpen       (rcc_c1_gpiok_lpen),
      .rcc_c1_gpioj_lpen       (rcc_c1_gpioj_lpen),
      .rcc_c1_gpioi_lpen       (rcc_c1_gpioi_lpen),
      .rcc_c1_gpioh_lpen       (rcc_c1_gpioh_lpen),
      .rcc_c1_gpiog_lpen       (rcc_c1_gpiog_lpen),
      .rcc_c1_gpiof_lpen       (rcc_c1_gpiof_lpen),
      .rcc_c1_gpioe_lpen       (rcc_c1_gpioe_lpen),
      .rcc_c1_gpiod_lpen       (rcc_c1_gpiod_lpen),
      .rcc_c1_gpioc_lpen       (rcc_c1_gpioc_lpen),
      .rcc_c1_gpiob_lpen       (rcc_c1_gpiob_lpen),
      .rcc_c1_gpioa_lpen       (rcc_c1_gpioa_lpen),
      .rcc_c1_wwdg1_lpen       (rcc_c1_wwdg1_lpen),
      .rcc_c1_ltdc_lpen        (rcc_c1_ltdc_lpen),
      .rcc_c1_uart8_lpen       (rcc_c1_uart8_lpen),
      .rcc_c1_uart7_lpen       (rcc_c1_uart7_lpen),
      .rcc_c1_dac12_lpen       (rcc_c1_dac12_lpen),
      .rcc_c1_hdmicec_lpen     (rcc_c1_hdmicec_lpen),
      .rcc_c1_i2c3_lpen        (rcc_c1_i2c3_lpen),
      .rcc_c1_i2c2_lpen        (rcc_c1_i2c2_lpen),
      .rcc_c1_i2c1_lpen        (rcc_c1_i2c1_lpen),
      .rcc_c1_uart5_lpen       (rcc_c1_uart5_lpen),
      .rcc_c1_uart4_lpen       (rcc_c1_uart4_lpen),
      .rcc_c1_usart3_lpen      (rcc_c1_usart3_lpen),
      .rcc_c1_usart2_lpen      (rcc_c1_usart2_lpen),
      .rcc_c1_spdifrx_lpen     (rcc_c1_spdifrx_lpen),
      .rcc_c1_spi3_lpen        (rcc_c1_spi3_lpen),
      .rcc_c1_spi2_lpen        (rcc_c1_spi2_lpen),
      .rcc_c1_wwdg2_lpen       (rcc_c1_wwdg2_lpen),
      .rcc_c1_lptim1_lpen      (rcc_c1_lptim1_lpen),
      .rcc_c1_tim14_lpen       (rcc_c1_tim14_lpen),
      .rcc_c1_tim13_lpen       (rcc_c1_tim13_lpen),
      .rcc_c1_tim12_lpen       (rcc_c1_tim12_lpen),
      .rcc_c1_tim7_lpen        (rcc_c1_tim7_lpen),
      .rcc_c1_tim6_lpen        (rcc_c1_tim6_lpen),
      .rcc_c1_tim5_lpen        (rcc_c1_tim5_lpen),
      .rcc_c1_tim4_lpen        (rcc_c1_tim4_lpen),
      .rcc_c1_tim3_lpen        (rcc_c1_tim3_lpen),
      .rcc_c1_tim2_lpen        (rcc_c1_tim2_lpen),
      .rcc_c1_fdcan_lpen       (rcc_c1_fdcan_lpen),
      .rcc_c1_mdios_lpen       (rcc_c1_mdios_lpen),
      .rcc_c1_opamp_lpen       (rcc_c1_opamp_lpen),
      .rcc_c1_swpmi_lpen       (rcc_c1_swpmi_lpen),
      .rcc_c1_crs_lpen         (rcc_c1_crs_lpen),
      .rcc_c1_hrtim_lpen       (rcc_c1_hrtim_lpen),
      .rcc_c1_dfsdm1_lpen      (rcc_c1_dfsdm1_lpen),
      .rcc_c1_sai3_lpen        (rcc_c1_sai3_lpen),
      .rcc_c1_sai2_lpen        (rcc_c1_sai2_lpen),
      .rcc_c1_sai1_lpen        (rcc_c1_sai1_lpen),
      .rcc_c1_spi5_lpen        (rcc_c1_spi5_lpen),
      .rcc_c1_tim17_lpen       (rcc_c1_tim17_lpen),
      .rcc_c1_tim16_lpen       (rcc_c1_tim16_lpen),
      .rcc_c1_tim15_lpen       (rcc_c1_tim15_lpen),
      .rcc_c1_spi4_lpen        (rcc_c1_spi4_lpen),
      .rcc_c1_spi1_lpen        (rcc_c1_spi1_lpen),
      .rcc_c1_usart6_lpen      (rcc_c1_usart6_lpen),
      .rcc_c1_usart1_lpen      (rcc_c1_usart1_lpen),
      .rcc_c1_tim8_lpen        (rcc_c1_tim8_lpen),
      .rcc_c1_tim1_lpen        (rcc_c1_tim1_lpen),
      .rcc_c1_sai4_lpen        (rcc_c1_sai4_lpen),
      .rcc_c1_rtc_lpen         (rcc_c1_rtc_lpen),
      .rcc_c1_vref_lpen        (rcc_c1_vref_lpen),
      .rcc_c1_comp12_lpen      (rcc_c1_comp12_lpen),
      .rcc_c1_lptim5_lpen      (rcc_c1_lptim5_lpen),
      .rcc_c1_lptim4_lpen      (rcc_c1_lptim4_lpen),
      .rcc_c1_lptim3_lpen      (rcc_c1_lptim3_lpen),
      .rcc_c1_lptim2_lpen      (rcc_c1_lptim2_lpen),
      .rcc_c1_i2c4_lpen        (rcc_c1_i2c4_lpen),
      .rcc_c1_spi6_lpen        (rcc_c1_spi6_lpen),
      .rcc_c1_lpuart1_lpen     (rcc_c1_lpuart1_lpen),
      .rcc_c1_syscfg_lpen      (rcc_c1_syscfg_lpen),
      .rcc_c2_axisram_en       (rcc_c2_axisram_en),
      .rcc_c2_itcm_en          (rcc_c2_itcm_en),
      .rcc_c2_dtcm2_en         (rcc_c2_dtcm2_en),
      .rcc_c2_dtcm1_en         (rcc_c2_dtcm1_en),
      .rcc_c2_sdmmc1_en        (rcc_c2_sdmmc1_en),
      .rcc_c2_qspi_en          (rcc_c2_qspi_en),
      .rcc_c2_fmc_en           (rcc_c2_fmc_en),
      .rcc_c2_flitf_en         (rcc_c2_flitf_en),
      .rcc_c2_jpgdec_en        (rcc_c2_jpgdec_en),
      .rcc_c2_dma2d_en         (rcc_c2_dma2d_en),
      .rcc_c2_mdma_en          (rcc_c2_mdma_en),
      .rcc_c2_usb2ulpi_en      (rcc_c2_usb2ulpi_en),
      .rcc_c2_usb2otg_en       (rcc_c2_usb2otg_en),
      .rcc_c2_usb1ulpi_en      (rcc_c2_usb1ulpi_en),
      .rcc_c2_usb1otg_en       (rcc_c2_usb1otg_en),
      .rcc_c2_eth1rx_en        (rcc_c2_eth1rx_en),
      .rcc_c2_eth1tx_en        (rcc_c2_eth1tx_en),
      .rcc_c2_eth1mac_en       (rcc_c2_eth1mac_en),
      .rcc_c2_adc12_en         (rcc_c2_adc12_en),
      .rcc_c2_dma2_en          (rcc_c2_dma2_en),
      .rcc_c2_dma1_en          (rcc_c2_dma1_en),
      .rcc_c2_sdmmc2_en        (rcc_c2_sdmmc2_en),
      .rcc_c2_rng_en           (rcc_c2_rng_en),
      .rcc_c2_hash_en          (rcc_c2_hash_en),
      .rcc_c2_crypt_en         (rcc_c2_crypt_en),
      .rcc_c2_dcmi_en          (rcc_c2_dcmi_en),
      .rcc_c2_bkpram_en        (rcc_c2_bkpram_en),
      .rcc_c2_hsem_en          (rcc_c2_hsem_en),
      .rcc_c2_adc3_en          (rcc_c2_adc3_en),
      .rcc_c2_bdma_en          (rcc_c2_bdma_en),
      .rcc_c2_crc_en           (rcc_c2_crc_en),
      .rcc_c2_gpiok_en         (rcc_c2_gpiok_en),
      .rcc_c2_gpioj_en         (rcc_c2_gpioj_en),
      .rcc_c2_gpioi_en         (rcc_c2_gpioi_en),
      .rcc_c2_gpioh_en         (rcc_c2_gpioh_en),
      .rcc_c2_gpiog_en         (rcc_c2_gpiog_en),
      .rcc_c2_gpiof_en         (rcc_c2_gpiof_en),
      .rcc_c2_gpioe_en         (rcc_c2_gpioe_en),
      .rcc_c2_gpiod_en         (rcc_c2_gpiod_en),
      .rcc_c2_gpioc_en         (rcc_c2_gpioc_en),
      .rcc_c2_gpiob_en         (rcc_c2_gpiob_en),
      .rcc_c2_gpioa_en         (rcc_c2_gpioa_en),
      .rcc_c2_wwdg1_en         (rcc_c2_wwdg1_en),
      .rcc_c2_ltdc_en          (rcc_c2_ltdc_en),
      .rcc_c2_uart8_en         (rcc_c2_uart8_en),
      .rcc_c2_uart7_en         (rcc_c2_uart7_en),
      .rcc_c2_dac12_en         (rcc_c2_dac12_en),
      .rcc_c2_hdmicec_en       (rcc_c2_hdmicec_en),
      .rcc_c2_i2c3_en          (rcc_c2_i2c3_en),
      .rcc_c2_i2c2_en          (rcc_c2_i2c2_en),
      .rcc_c2_i2c1_en          (rcc_c2_i2c1_en),
      .rcc_c2_uart5_en         (rcc_c2_uart5_en),
      .rcc_c2_uart4_en         (rcc_c2_uart4_en),
      .rcc_c2_usart3_en        (rcc_c2_usart3_en),
      .rcc_c2_usart2_en        (rcc_c2_usart2_en),
      .rcc_c2_spdifrx_en       (rcc_c2_spdifrx_en),
      .rcc_c2_spi3_en          (rcc_c2_spi3_en),
      .rcc_c2_spi2_en          (rcc_c2_spi2_en),
      .rcc_c2_wwdg2_en         (rcc_c2_wwdg2_en),
      .rcc_c2_lptim1_en        (rcc_c2_lptim1_en),
      .rcc_c2_tim14_en         (rcc_c2_tim14_en),
      .rcc_c2_tim13_en         (rcc_c2_tim13_en),
      .rcc_c2_tim12_en         (rcc_c2_tim12_en),
      .rcc_c2_tim7_en          (rcc_c2_tim7_en),
      .rcc_c2_tim6_en          (rcc_c2_tim6_en),
      .rcc_c2_tim5_en          (rcc_c2_tim5_en),
      .rcc_c2_tim4_en          (rcc_c2_tim4_en),
      .rcc_c2_tim3_en          (rcc_c2_tim3_en),
      .rcc_c2_tim2_en          (rcc_c2_tim2_en),
      .rcc_c2_fdcan_en         (rcc_c2_fdcan_en),
      .rcc_c2_mdios_en         (rcc_c2_mdios_en),
      .rcc_c2_opamp_en         (rcc_c2_opamp_en),
      .rcc_c2_swpmi_en         (rcc_c2_swpmi_en),
      .rcc_c2_crs_en           (rcc_c2_crs_en),
      .rcc_c2_hrtim_en         (rcc_c2_hrtim_en),
      .rcc_c2_dfsdm1_en        (rcc_c2_dfsdm1_en),
      .rcc_c2_sai3_en          (rcc_c2_sai3_en),
      .rcc_c2_sai2_en          (rcc_c2_sai2_en),
      .rcc_c2_sai1_en          (rcc_c2_sai1_en),
      .rcc_c2_spi5_en          (rcc_c2_spi5_en),
      .rcc_c2_tim17_en         (rcc_c2_tim17_en),
      .rcc_c2_tim16_en         (rcc_c2_tim16_en),
      .rcc_c2_tim15_en         (rcc_c2_tim15_en),
      .rcc_c2_spi4_en          (rcc_c2_spi4_en),
      .rcc_c2_spi1_en          (rcc_c2_spi1_en),
      .rcc_c2_usart6_en        (rcc_c2_usart6_en),
      .rcc_c2_usart1_en        (rcc_c2_usart1_en),
      .rcc_c2_tim8_en          (rcc_c2_tim8_en),
      .rcc_c2_tim1_en          (rcc_c2_tim1_en),
      .rcc_c2_sai4_en          (rcc_c2_sai4_en),
      .rcc_c2_rtc_en           (rcc_c2_rtc_en),
      .rcc_c2_vref_en          (rcc_c2_vref_en),
      .rcc_c2_comp12_en        (rcc_c2_comp12_en),
      .rcc_c2_lptim5_en        (rcc_c2_lptim5_en),
      .rcc_c2_lptim4_en        (rcc_c2_lptim4_en),
      .rcc_c2_lptim3_en        (rcc_c2_lptim3_en),
      .rcc_c2_lptim2_en        (rcc_c2_lptim2_en),
      .rcc_c2_i2c4_en          (rcc_c2_i2c4_en),
      .rcc_c2_spi6_en          (rcc_c2_spi6_en),
      .rcc_c2_lpuart1_en       (rcc_c2_lpuart1_en),
      .rcc_c2_syscfg_en        (rcc_c2_syscfg_en),
      .rcc_c2_axisram_lpen     (rcc_c2_axisram_lpen),
      .rcc_c2_itcm_lpen        (rcc_c2_itcm_lpen),
      .rcc_c2_dtcm2_lpen       (rcc_c2_dtcm2_lpen),
      .rcc_c2_dtcm1_lpen       (rcc_c2_dtcm1_lpen),
      .rcc_c2_sdmmc1_lpen      (rcc_c2_sdmmc1_lpen),
      .rcc_c2_qspi_lpen        (rcc_c2_qspi_lpen),
      .rcc_c2_fmc_lpen         (rcc_c2_fmc_lpen),
      .rcc_c2_flitf_lpen       (rcc_c2_flitf_lpen),
      .rcc_c2_jpgdec_lpen      (rcc_c2_jpgdec_lpen),
      .rcc_c2_dma2d_lpen       (rcc_c2_dma2d_lpen),
      .rcc_c2_mdma_lpen        (rcc_c2_mdma_lpen),
      .rcc_c2_usb2ulpi_lpen    (rcc_c2_usb2ulpi_lpen),
      .rcc_c2_usb2otg_lpen     (rcc_c2_usb2otg_lpen),
      .rcc_c2_usb1ulpi_lpen    (rcc_c2_usb1ulpi_lpen),
      .rcc_c2_usb1otg_lpen     (rcc_c2_usb1otg_lpen),
      .rcc_c2_eth1rx_lpen      (rcc_c2_eth1rx_lpen),
      .rcc_c2_eth1tx_lpen      (rcc_c2_eth1tx_lpen),
      .rcc_c2_eth1mac_lpen     (rcc_c2_eth1mac_lpen),
      .rcc_c2_adc12_lpen       (rcc_c2_adc12_lpen),
      .rcc_c2_dma2_lpen        (rcc_c2_dma2_lpen),
      .rcc_c2_dma1_lpen        (rcc_c2_dma1_lpen),
      .rcc_c2_sram3_lpen       (rcc_c2_sram3_lpen),
      .rcc_c2_sram2_lpen       (rcc_c2_sram2_lpen),
      .rcc_c2_sram1_lpen       (rcc_c2_sram1_lpen),
      .rcc_c2_sdmmc2_lpen      (rcc_c2_sdmmc2_lpen),
      .rcc_c2_rng_lpen         (rcc_c2_rng_lpen),
      .rcc_c2_hash_lpen        (rcc_c2_hash_lpen),
      .rcc_c2_crypt_lpen       (rcc_c2_crypt_lpen),
      .rcc_c2_dcmi_lpen        (rcc_c2_dcmi_lpen),
      .rcc_c2_sram4_lpen       (rcc_c2_sram4_lpen),
      .rcc_c2_bkpram_lpen      (rcc_c2_bkpram_lpen),
      .rcc_c2_adc3_lpen        (rcc_c2_adc3_lpen),
      .rcc_c2_bdma_lpen        (rcc_c2_bdma_lpen),
      .rcc_c2_crc_lpen         (rcc_c2_crc_lpen),
      .rcc_c2_gpiok_lpen       (rcc_c2_gpiok_lpen),
      .rcc_c2_gpioj_lpen       (rcc_c2_gpioj_lpen),
      .rcc_c2_gpioi_lpen       (rcc_c2_gpioi_lpen),
      .rcc_c2_gpioh_lpen       (rcc_c2_gpioh_lpen),
      .rcc_c2_gpiog_lpen       (rcc_c2_gpiog_lpen),
      .rcc_c2_gpiof_lpen       (rcc_c2_gpiof_lpen),
      .rcc_c2_gpioe_lpen       (rcc_c2_gpioe_lpen),
      .rcc_c2_gpiod_lpen       (rcc_c2_gpiod_lpen),
      .rcc_c2_gpioc_lpen       (rcc_c2_gpioc_lpen),
      .rcc_c2_gpiob_lpen       (rcc_c2_gpiob_lpen),
      .rcc_c2_gpioa_lpen       (rcc_c2_gpioa_lpen),
      .rcc_c2_wwdg1_lpen       (rcc_c2_wwdg1_lpen),
      .rcc_c2_ltdc_lpen        (rcc_c2_ltdc_lpen),
      .rcc_c2_uart8_lpen       (rcc_c2_uart8_lpen),
      .rcc_c2_uart7_lpen       (rcc_c2_uart7_lpen),
      .rcc_c2_dac12_lpen       (rcc_c2_dac12_lpen),
      .rcc_c2_hdmicec_lpen     (rcc_c2_hdmicec_lpen),
      .rcc_c2_i2c3_lpen        (rcc_c2_i2c3_lpen),
      .rcc_c2_i2c2_lpen        (rcc_c2_i2c2_lpen),
      .rcc_c2_i2c1_lpen        (rcc_c2_i2c1_lpen),
      .rcc_c2_uart5_lpen       (rcc_c2_uart5_lpen),
      .rcc_c2_uart4_lpen       (rcc_c2_uart4_lpen),
      .rcc_c2_usart3_lpen      (rcc_c2_usart3_lpen),
      .rcc_c2_usart2_lpen      (rcc_c2_usart2_lpen),
      .rcc_c2_spdifrx_lpen     (rcc_c2_spdifrx_lpen),
      .rcc_c2_spi3_lpen        (rcc_c2_spi3_lpen),
      .rcc_c2_spi2_lpen        (rcc_c2_spi2_lpen),
      .rcc_c2_wwdg2_lpen       (rcc_c2_wwdg2_lpen),
      .rcc_c2_lptim1_lpen      (rcc_c2_lptim1_lpen),
      .rcc_c2_tim14_lpen       (rcc_c2_tim14_lpen),
      .rcc_c2_tim13_lpen       (rcc_c2_tim13_lpen),
      .rcc_c2_tim12_lpen       (rcc_c2_tim12_lpen),
      .rcc_c2_tim7_lpen        (rcc_c2_tim7_lpen),
      .rcc_c2_tim6_lpen        (rcc_c2_tim6_lpen),
      .rcc_c2_tim5_lpen        (rcc_c2_tim5_lpen),
      .rcc_c2_tim4_lpen        (rcc_c2_tim4_lpen),
      .rcc_c2_tim3_lpen        (rcc_c2_tim3_lpen),
      .rcc_c2_tim2_lpen        (rcc_c2_tim2_lpen),
      .rcc_c2_fdcan_lpen       (rcc_c2_fdcan_lpen),
      .rcc_c2_mdios_lpen       (rcc_c2_mdios_lpen),
      .rcc_c2_opamp_lpen       (rcc_c2_opamp_lpen),
      .rcc_c2_swpmi_lpen       (rcc_c2_swpmi_lpen),
      .rcc_c2_crs_lpen         (rcc_c2_crs_lpen),
      .rcc_c2_hrtim_lpen       (rcc_c2_hrtim_lpen),
      .rcc_c2_dfsdm1_lpen      (rcc_c2_dfsdm1_lpen),
      .rcc_c2_sai3_lpen        (rcc_c2_sai3_lpen),
      .rcc_c2_sai2_lpen        (rcc_c2_sai2_lpen),
      .rcc_c2_sai1_lpen        (rcc_c2_sai1_lpen),
      .rcc_c2_spi5_lpen        (rcc_c2_spi5_lpen),
      .rcc_c2_tim17_lpen       (rcc_c2_tim17_lpen),
      .rcc_c2_tim16_lpen       (rcc_c2_tim16_lpen),
      .rcc_c2_tim15_lpen       (rcc_c2_tim15_lpen),
      .rcc_c2_spi4_lpen        (rcc_c2_spi4_lpen),
      .rcc_c2_spi1_lpen        (rcc_c2_spi1_lpen),
      .rcc_c2_usart6_lpen      (rcc_c2_usart6_lpen),
      .rcc_c2_usart1_lpen      (rcc_c2_usart1_lpen),
      .rcc_c2_tim8_lpen        (rcc_c2_tim8_lpen),
      .rcc_c2_tim1_lpen        (rcc_c2_tim1_lpen),
      .rcc_c2_sai4_lpen        (rcc_c2_sai4_lpen),
      .rcc_c2_rtc_lpen         (rcc_c2_rtc_lpen),
      .rcc_c2_vref_lpen        (rcc_c2_vref_lpen),
      .rcc_c2_comp12_lpen      (rcc_c2_comp12_lpen),
      .rcc_c2_lptim5_lpen      (rcc_c2_lptim5_lpen),
      .rcc_c2_lptim4_lpen      (rcc_c2_lptim4_lpen),
      .rcc_c2_lptim3_lpen      (rcc_c2_lptim3_lpen),
      .rcc_c2_lptim2_lpen      (rcc_c2_lptim2_lpen),
      .rcc_c2_i2c4_lpen        (rcc_c2_i2c4_lpen),
      .rcc_c2_spi6_lpen        (rcc_c2_spi6_lpen),
      .rcc_c2_lpuart1_lpen     (rcc_c2_lpuart1_lpen),
      .rcc_c2_syscfg_lpen      (rcc_c2_syscfg_lpen),
      .nxt_rcc_bdcr_bdrst      (nxt_rcc_bdcr_bdrst),
      .nxt_rcc_bdcr_rtcen      (nxt_rcc_bdcr_rtcen),
      .nxt_rcc_bdcr_rtcsel     (nxt_rcc_bdcr_rtcsel[1:0]),
      .nxt_rcc_bdcr_lsecsson   (nxt_rcc_bdcr_lsecsson),
      .nxt_rcc_bdcr_lsedrv     (nxt_rcc_bdcr_lsedrv[1:0]),
      .nxt_rcc_bdcr_lsebyp     (nxt_rcc_bdcr_lsebyp),
      .nxt_rcc_bdcr_lseon      (nxt_rcc_bdcr_lseon),
      .rcc_vdd_wdata           (rcc_vdd_wdata),
      .rcc_c1_rsr_rmvf_wren    (rcc_c1_rsr_rmvf_wren),
      .rcc_c2_rsr_rmvf_wren    (rcc_c2_rsr_rmvf_wren),
      .rcc_csr_lsion_wren      (rcc_csr_lsion_wren),
      .rcc_bdcr_byte2_wren     (rcc_bdcr_byte2_wren),
      .rcc_bdcr_byte1_wren     (rcc_bdcr_byte1_wren),
      .rcc_bdcr_byte0_wren     (rcc_bdcr_byte0_wren),
      // Inputs
      .clk                     (clk),
      .rst_n                   (rst_n),
      .req                     (req),
      .we                      (we[WW-1:0]),
      .addr                    (addr[AW-1:0]),
      .wdata                   (wdata[DW-1:0]),
      .pll3_rdy                (pll3_rdy),
      .pll2_rdy                (pll2_rdy),
      .pll1_rdy                (pll1_rdy),
      .hse_rdy                 (hse_rdy),
      .hsi48_rdy               (hsi48_rdy),
      .csi_rdy                 (csi_rdy),
      .hsi_rdy                 (hsi_rdy),
      .flash_csi_opt           (flash_csi_opt[7:0]),
      .flash_hsi_opt           (flash_hsi_opt[11:0]),
      .crs_hsi48_trim          (crs_hsi48_trim[9:0]),
      .rcc_sys_stop            (rcc_sys_stop),
      .rcc_d1_stop             (rcc_d1_stop),
      .rcc_d2_stop             (rcc_d2_stop),
      .hsecss_fail             (hsecss_fail),
      .rcc_exit_sys_stop       (rcc_exit_sys_stop),
      .lsecss_fail             (lsecss_fail),
      .backup_protect          (backup_protect),
      .cur_rcc_bdcr_bdrst      (cur_rcc_bdcr_bdrst),
      .cur_rcc_bdcr_rtcen      (cur_rcc_bdcr_rtcen),
      .cur_rcc_bdcr_rtcsel     (cur_rcc_bdcr_rtcsel[1:0]),
      .cur_rcc_bdcr_lsecssd    (cur_rcc_bdcr_lsecssd),
      .cur_rcc_bdcr_lsecsson   (cur_rcc_bdcr_lsecsson),
      .cur_rcc_bdcr_lsedrv     (cur_rcc_bdcr_lsedrv[1:0]),
      .cur_rcc_bdcr_lsebyp     (cur_rcc_bdcr_lsebyp),
      .cur_rcc_bdcr_lserdy     (cur_rcc_bdcr_lserdy),
      .cur_rcc_bdcr_lseon      (cur_rcc_bdcr_lseon),
      .cur_rcc_c1_rsr_lpwr2rstf(cur_rcc_c1_rsr_lpwr2rstf),
      .cur_rcc_c1_rsr_lpwr1rstf(cur_rcc_c1_rsr_lpwr1rstf),
      .cur_rcc_c1_rsr_wwdg2rstf(cur_rcc_c1_rsr_wwdg2rstf),
      .cur_rcc_c1_rsr_wwdg1rstf(cur_rcc_c1_rsr_wwdg1rstf),
      .cur_rcc_c1_rsr_iwdg2rstf(cur_rcc_c1_rsr_iwdg2rstf),
      .cur_rcc_c1_rsr_iwdg1rstf(cur_rcc_c1_rsr_iwdg1rstf),
      .cur_rcc_c1_rsr_sft2rstf (cur_rcc_c1_rsr_sft2rstf),
      .cur_rcc_c1_rsr_sft1rstf (cur_rcc_c1_rsr_sft1rstf),
      .cur_rcc_c1_rsr_porrstf  (cur_rcc_c1_rsr_porrstf),
      .cur_rcc_c1_rsr_pinrstf  (cur_rcc_c1_rsr_pinrstf),
      .cur_rcc_c1_rsr_borrstf  (cur_rcc_c1_rsr_borrstf),
      .cur_rcc_c1_rsr_d2rstf   (cur_rcc_c1_rsr_d2rstf),
      .cur_rcc_c1_rsr_d1rstf   (cur_rcc_c1_rsr_d1rstf),
      .cur_rcc_c1_rsr_oblrstf  (cur_rcc_c1_rsr_oblrstf),
      .cur_rcc_c1_rsr_rmvf     (cur_rcc_c1_rsr_rmvf),
      .cur_rcc_c2_rsr_lpwr2rstf(cur_rcc_c2_rsr_lpwr2rstf),
      .cur_rcc_c2_rsr_lpwr1rstf(cur_rcc_c2_rsr_lpwr1rstf),
      .cur_rcc_c2_rsr_wwdg2rstf(cur_rcc_c2_rsr_wwdg2rstf),
      .cur_rcc_c2_rsr_wwdg1rstf(cur_rcc_c2_rsr_wwdg1rstf),
      .cur_rcc_c2_rsr_iwdg2rstf(cur_rcc_c2_rsr_iwdg2rstf),
      .cur_rcc_c2_rsr_iwdg1rstf(cur_rcc_c2_rsr_iwdg1rstf),
      .cur_rcc_c2_rsr_sft2rstf (cur_rcc_c2_rsr_sft2rstf),
      .cur_rcc_c2_rsr_sft1rstf (cur_rcc_c2_rsr_sft1rstf),
      .cur_rcc_c2_rsr_porrstf  (cur_rcc_c2_rsr_porrstf),
      .cur_rcc_c2_rsr_pinrstf  (cur_rcc_c2_rsr_pinrstf),
      .cur_rcc_c2_rsr_borrstf  (cur_rcc_c2_rsr_borrstf),
      .cur_rcc_c2_rsr_d2rstf   (cur_rcc_c2_rsr_d2rstf),
      .cur_rcc_c2_rsr_d1rstf   (cur_rcc_c2_rsr_d1rstf),
      .cur_rcc_c2_rsr_oblrstf  (cur_rcc_c2_rsr_oblrstf),
      .cur_rcc_c2_rsr_rmvf     (cur_rcc_c2_rsr_rmvf),
      .cur_rcc_csr_lsirdy      (cur_rcc_csr_lsirdy),
      .cur_rcc_csr_lsion       (cur_rcc_csr_lsion)
  );

endmodule
