// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : RCC register in vcore domain
// ****************************************************************
// spyglass disable_block Clock_info05c
// Clock_info05c (56) : Reports unconstrained MUXes which do not receive clocks in all its data inputs
module rcc_vcore_reg #(
    // ================================================================================
    // CONFIGURABLE PARAMETERS
    // ================================================================================
    parameter AW = 32,
    parameter DW = 32,
    parameter WW = DW / 8
) (
    //================================================================
    // testmode
    //================================================================
    input           testmode,
    // ===============================================================
    // PINS
    // ===============================================================
    input           clk,
    input           rst_n,
    input           req,
    input  [WW-1:0] we,
    input  [AW-1:0] addr,
    input  [DW-1:0] wdata,
    input           mmaster,
    output [DW-1:0] rdata,
    output [   1:0] rsp,
    input           sync_pll3_rdy,
    output          pll3on,
    input           sync_pll2_rdy,
    output          pll2on,
    input           sync_pll1_rdy,
    output          pll1on,
    output          hsecsson,
    output          hsebyp,
    input           sync_hse_rdy,
    output          hseon,
    input           sync_hsi48_rdy,
    output          hsi48on,
    input           sync_csi_rdy,
    output          csion,
    output [   1:0] hsidiv,
    input           sync_hsi_rdy,
    output          hsion,
    input           sync_lse_rdy,
    input           sync_lsi_rdy,
    output [   7:0] csi_trim,
    input  [   7:0] flash_csi_opt,
    output [  11:0] hsi_trim,
    input  [  11:0] flash_hsi_opt,
    input  [   9:0] crs_hsi48_trim,
    output [   2:0] mco2sel,
    output [   3:0] mco2pre,
    output [   2:0] mco1sel,
    output [   3:0] mco1pre,
    output          timpre,
    output          hrtimsel,
    output [   5:0] rtcpre,
    output [   1:0] sw,
    output [   3:0] d1cpre,
    output [   2:0] d1ppre,
    output [   3:0] hpre,
    output [   2:0] d2ppre2,
    output [   2:0] d2ppre1,
    output [   2:0] d3ppre,
    output [   5:0] divm3,
    output [   5:0] divm2,
    output [   5:0] divm1,
    output [   1:0] pllsrc,
    output          divr3en,
    output          divq3en,
    output          divp3en,
    output          divr2en,
    output          divq2en,
    output          divp2en,
    output          divr1en,
    output          divq1en,
    output          divp1en,
    output [   1:0] pll3rge,
    output          pll3vcosel,
    output          pll3fracen,
    output [   1:0] pll2rge,
    output          pll2vcosel,
    output          pll2fracen,
    output [   1:0] pll1rge,
    output          pll1vcosel,
    output          pll1fracen,
    output [   6:0] divr1,
    output [   6:0] divq1,
    output [   6:0] divp1,
    output [   8:0] divn1,
    output [  12:0] fracn1,
    output [   6:0] divr2,
    output [   6:0] divq2,
    output [   6:0] divp2,
    output [   8:0] divn2,
    output [  12:0] fracn2,
    output [   6:0] divr3,
    output [   6:0] divq3,
    output [   6:0] divp3,
    output [   8:0] divn3,
    output [  12:0] fracn3,
    output [   1:0] clkpersel,
    output          sdmmcsel,
    output [   1:0] qspisel,
    output [   1:0] fmcsel,
    output          swpmisel,
    output [   1:0] fdcansel,
    output          dfsdm1sel,
    output [   1:0] spdifsel,
    output [   2:0] spi45sel,
    output [   2:0] spi123sel,
    output [   2:0] sai23sel,
    output [   2:0] sai1sel,
    output [   2:0] lptim1sel,
    output [   1:0] cecsel,
    output [   1:0] usbsel,
    output [   1:0] i2c123sel,
    output [   1:0] rngsel,
    output [   2:0] usart16sel,
    output [   2:0] usart234578sel,
    output [   2:0] spi6sel,
    output [   2:0] sai4bsel,
    output [   2:0] sai4asel,
    output [   1:0] adcsel,
    output [   2:0] lptim345sel,
    output [   2:0] lptim2sel,
    output [   1:0] i2c4sel,
    output [   2:0] lpuart1sel,
    output [   1:0] rtcsel,
    output          lsecsson,
    output [   1:0] lsedrv,
    output          lsebyp,
    input           lse_rdy,
    output          lseon,
    input           lsi_rdy,
    output          lsion,
    output          romrst,
    output          tsmsrst,
    output          smsrst,
    output          xflashrst,
    output          fftrst,
    output          npurst,
    output          dma1rst,
    output          dma2rst,
    output          dmaschrst,
    output          qspi1rst,
    output          qspi2rst,
    output          qspi3rst,
    output          qspi4rst,
    output          xspirst,
    output          mspirst,
    output          hacif_l1rst,
    output          hacif_f1rst,
    output          macrst,
    output          lzrst,
    output          gtim1rst,
    output          gtim2rst,
    output          gtim3rst,
    output          gtim4rst,
    output          spi1rst,
    output          spi2rst,
    output          spi3rst,
    output          uart1rst,
    output          uart2rst,
    output          uart3rst,
    output          uart4rst,
    output          i2c1rst,
    output          gpio1rst,
    output          gpio2rst,
    output          gpio3rst,
    output          can1rst,
    output          can2rst,
    output          can3rst,
    output          gtim5rst,
    output          gtim6rst,
    output          spi4rst,
    output          spi5rst,
    output          uart5rst,
    output          uart6rst,
    output          uart7rst,
    output          uart8rst,
    output          i2c2rst,
    output          i2c3rst,
    output          can4rst,
    output          can5rst,
    output          can6rst,
    output          mpptrst,
    output          gpio4rst,
    output          gpio5rst,
    output          sysctlrst,
    output          wwdtrst,
    output          tim1rst,
    output          tim2rst,
    output          adccrst,
    output          gpio6rst,
    output          gpio7rst,
    output          gpio8rst,
    output          iwdtrst,
    output          rtcrst,
    output          ww2rsc,
    output          ww1rsc,
    output          rcc_rom_amen,
    output          rcc_tsms_amen,
    output          rcc_sms_amen,
    output          rcc_xflash_amen,
    output          rcc_fft_amen,
    output          rcc_npu_amen,
    output          rcc_dma1_amen,
    output          rcc_dma2_amen,
    output          rcc_dmasch_amen,
    output          rcc_qspi1_amen,
    output          rcc_qspi2_amen,
    output          rcc_qspi3_amen,
    output          rcc_qspi4_amen,
    output          rcc_xspi_amen,
    output          rcc_mspi_amen,
    output          rcc_hacif_l1_amen,
    output          rcc_hacif_f1_amen,
    output          rcc_mac_amen,
    output          rcc_lz_amen,
    output          rcc_gtim1_amen,
    output          rcc_gtim2_amen,
    output          rcc_gtim3_amen,
    output          rcc_gtim4_amen,
    output          rcc_spi1_amen,
    output          rcc_spi2_amen,
    output          rcc_spi3_amen,
    output          rcc_uart1_amen,
    output          rcc_uart2_amen,
    output          rcc_uart3_amen,
    output          rcc_uart4_amen,
    output          rcc_i2c1_amen,
    output          rcc_gpio1_amen,
    output          rcc_gpio2_amen,
    output          rcc_gpio3_amen,
    output          rcc_can1_amen,
    output          rcc_can2_amen,
    output          rcc_can3_amen,
    output          rcc_gtim5_amen,
    output          rcc_gtim6_amen,
    output          rcc_spi4_amen,
    output          rcc_spi5_amen,
    output          rcc_uart5_amen,
    output          rcc_uart6_amen,
    output          rcc_uart7_amen,
    output          rcc_uart8_amen,
    output          rcc_i2c2_amen,
    output          rcc_i2c3_amen,
    output          rcc_can4_amen,
    output          rcc_can5_amen,
    output          rcc_can6_amen,
    output          rcc_mppt_amen,
    output          rcc_gpio4_amen,
    output          rcc_gpio5_amen,
    output          rcc_sysctl_amen,
    output          rcc_wwdt_amen,
    output          rcc_tim1_amen,
    output          rcc_tim2_amen,
    output          rcc_adcc_amen,
    output          rcc_gpio6_amen,
    output          rcc_gpio7_amen,
    output          rcc_gpio8_amen,
    output          rcc_iwdt_amen,
    output          rcc_rtc_amen,
    output          rcc_c1_rom_en,
    output          rcc_c1_tsms_en,
    output          rcc_c1_sms_en,
    output          rcc_c1_xflash_en,
    output          rcc_c1_fft_en,
    output          rcc_c1_npu_en,
    output          rcc_c1_dma1_en,
    output          rcc_c1_dma2_en,
    output          rcc_c1_dmasch_en,
    output          rcc_c1_qspi1_en,
    output          rcc_c1_qspi2_en,
    output          rcc_c1_qspi3_en,
    output          rcc_c1_qspi4_en,
    output          rcc_c1_xspi_en,
    output          rcc_c1_mspi_en,
    output          rcc_c1_hacif_l1_en,
    output          rcc_c1_hacif_f1_en,
    output          rcc_c1_mac_en,
    output          rcc_c1_lz_en,
    output          rcc_c1_gtim1_en,
    output          rcc_c1_gtim2_en,
    output          rcc_c1_gtim3_en,
    output          rcc_c1_gtim4_en,
    output          rcc_c1_spi1_en,
    output          rcc_c1_spi2_en,
    output          rcc_c1_spi3_en,
    output          rcc_c1_uart1_en,
    output          rcc_c1_uart2_en,
    output          rcc_c1_uart3_en,
    output          rcc_c1_uart4_en,
    output          rcc_c1_i2c1_en,
    output          rcc_c1_gpio1_en,
    output          rcc_c1_gpio2_en,
    output          rcc_c1_gpio3_en,
    output          rcc_c1_can1_en,
    output          rcc_c1_can2_en,
    output          rcc_c1_can3_en,
    output          rcc_c1_gtim5_en,
    output          rcc_c1_gtim6_en,
    output          rcc_c1_spi4_en,
    output          rcc_c1_spi5_en,
    output          rcc_c1_uart5_en,
    output          rcc_c1_uart6_en,
    output          rcc_c1_uart7_en,
    output          rcc_c1_uart8_en,
    output          rcc_c1_i2c2_en,
    output          rcc_c1_i2c3_en,
    output          rcc_c1_can4_en,
    output          rcc_c1_can5_en,
    output          rcc_c1_can6_en,
    output          rcc_c1_mppt_en,
    output          rcc_c1_gpio4_en,
    output          rcc_c1_gpio5_en,
    output          rcc_c1_sysctl_en,
    output          rcc_c1_wwdt_en,
    output          rcc_c1_tim1_en,
    output          rcc_c1_tim2_en,
    output          rcc_c1_adcc_en,
    output          rcc_c1_gpio6_en,
    output          rcc_c1_gpio7_en,
    output          rcc_c1_gpio8_en,
    output          rcc_c1_rom_lpen,
    output          rcc_c1_tsms_lpen,
    output          rcc_c1_sms_lpen,
    output          rcc_c1_xflash_lpen,
    output          rcc_c1_fft_lpen,
    output          rcc_c1_npu_lpen,
    output          rcc_c1_dma1_lpen,
    output          rcc_c1_dma2_lpen,
    output          rcc_c1_dmasch_lpen,
    output          rcc_c1_qspi1_lpen,
    output          rcc_c1_qspi2_lpen,
    output          rcc_c1_qspi3_lpen,
    output          rcc_c1_qspi4_lpen,
    output          rcc_c1_xspi_lpen,
    output          rcc_c1_mspi_lpen,
    output          rcc_c1_hacif_l1_lpen,
    output          rcc_c1_hacif_f1_lpen,
    output          rcc_c1_mac_lpen,
    output          rcc_c1_lz_lpen,
    output          rcc_c1_gtim1_lpen,
    output          rcc_c1_gtim2_lpen,
    output          rcc_c1_gtim3_lpen,
    output          rcc_c1_gtim4_lpen,
    output          rcc_c1_spi1_lpen,
    output          rcc_c1_spi2_lpen,
    output          rcc_c1_spi3_lpen,
    output          rcc_c1_uart1_lpen,
    output          rcc_c1_uart2_lpen,
    output          rcc_c1_uart3_lpen,
    output          rcc_c1_uart4_lpen,
    output          rcc_c1_i2c1_lpen,
    output          rcc_c1_gpio1_lpen,
    output          rcc_c1_gpio2_lpen,
    output          rcc_c1_gpio3_lpen,
    output          rcc_c1_can1_lpen,
    output          rcc_c1_can2_lpen,
    output          rcc_c1_can3_lpen,
    output          rcc_c1_gtim5_lpen,
    output          rcc_c1_gtim6_lpen,
    output          rcc_c1_spi4_lpen,
    output          rcc_c1_spi5_lpen,
    output          rcc_c1_uart5_lpen,
    output          rcc_c1_uart6_lpen,
    output          rcc_c1_uart7_lpen,
    output          rcc_c1_uart8_lpen,
    output          rcc_c1_i2c2_lpen,
    output          rcc_c1_i2c3_lpen,
    output          rcc_c1_can4_lpen,
    output          rcc_c1_can5_lpen,
    output          rcc_c1_can6_lpen,
    output          rcc_c1_mppt_lpen,
    output          rcc_c1_gpio4_lpen,
    output          rcc_c1_gpio5_lpen,
    output          rcc_c1_sysctl_lpen,
    output          rcc_c1_wwdt_lpen,
    output          rcc_c1_tim1_lpen,
    output          rcc_c1_tim2_lpen,
    output          rcc_c1_adcc_lpen,
    output          rcc_c1_gpio6_lpen,
    output          rcc_c1_gpio7_lpen,
    output          rcc_c1_gpio8_lpen,
    output          rcc_c2_adcc_en,
    output          rcc_c2_adcc_lpen,
    output          rcc_c2_can1_en,
    output          rcc_c2_can1_lpen,
    output          rcc_c2_can2_en,
    output          rcc_c2_can2_lpen,
    output          rcc_c2_can3_en,
    output          rcc_c2_can3_lpen,
    output          rcc_c2_can4_en,
    output          rcc_c2_can4_lpen,
    output          rcc_c2_can5_en,
    output          rcc_c2_can5_lpen,
    output          rcc_c2_can6_en,
    output          rcc_c2_can6_lpen,
    output          rcc_c2_dma1_en,
    output          rcc_c2_dma1_lpen,
    output          rcc_c2_dma2_en,
    output          rcc_c2_dma2_lpen,
    output          rcc_c2_dmasch_en,
    output          rcc_c2_dmasch_lpen,
    output          rcc_c2_eth1rx_en,
    output          rcc_c2_eth1rx_lpen,
    output          rcc_c2_eth1tx_en,
    output          rcc_c2_eth1tx_lpen,
    output          rcc_c2_fft_en,
    output          rcc_c2_fft_lpen,
    output          rcc_c2_gpio1_en,
    output          rcc_c2_gpio1_lpen,
    output          rcc_c2_gpio2_en,
    output          rcc_c2_gpio2_lpen,
    output          rcc_c2_gpio3_en,
    output          rcc_c2_gpio3_lpen,
    output          rcc_c2_gpio4_en,
    output          rcc_c2_gpio4_lpen,
    output          rcc_c2_gpio5_en,
    output          rcc_c2_gpio5_lpen,
    output          rcc_c2_gpio6_en,
    output          rcc_c2_gpio6_lpen,
    output          rcc_c2_gpio7_en,
    output          rcc_c2_gpio7_lpen,
    output          rcc_c2_gpio8_en,
    output          rcc_c2_gpio8_lpen,
    output          rcc_c2_gtim1_en,
    output          rcc_c2_gtim1_lpen,
    output          rcc_c2_gtim2_en,
    output          rcc_c2_gtim2_lpen,
    output          rcc_c2_gtim3_en,
    output          rcc_c2_gtim3_lpen,
    output          rcc_c2_gtim4_en,
    output          rcc_c2_gtim4_lpen,
    output          rcc_c2_gtim5_en,
    output          rcc_c2_gtim5_lpen,
    output          rcc_c2_gtim6_en,
    output          rcc_c2_gtim6_lpen,
    output          rcc_c2_hacif_f1_en,
    output          rcc_c2_hacif_f1_lpen,
    output          rcc_c2_hacif_l1_en,
    output          rcc_c2_hacif_l1_lpen,
    output          rcc_c2_i2c1_en,
    output          rcc_c2_i2c1_lpen,
    output          rcc_c2_i2c2_en,
    output          rcc_c2_i2c2_lpen,
    output          rcc_c2_i2c3_en,
    output          rcc_c2_i2c3_lpen,
    output          rcc_c2_lz_en,
    output          rcc_c2_lz_lpen,
    output          rcc_c2_mac_en,
    output          rcc_c2_mac_lpen,
    output          rcc_c2_mppt_en,
    output          rcc_c2_mppt_lpen,
    output          rcc_c2_mspi_en,
    output          rcc_c2_mspi_lpen,
    output          rcc_c2_npu_en,
    output          rcc_c2_npu_lpen,
    output          rcc_c2_qspi1_en,
    output          rcc_c2_qspi1_lpen,
    output          rcc_c2_qspi2_en,
    output          rcc_c2_qspi2_lpen,
    output          rcc_c2_qspi3_en,
    output          rcc_c2_qspi3_lpen,
    output          rcc_c2_qspi4_en,
    output          rcc_c2_qspi4_lpen,
    output          rcc_c2_rom_en,
    output          rcc_c2_rom_lpen,
    output          rcc_c2_sms_en,
    output          rcc_c2_sms_lpen,
    output          rcc_c2_spi1_en,
    output          rcc_c2_spi1_lpen,
    output          rcc_c2_spi2_en,
    output          rcc_c2_spi2_lpen,
    output          rcc_c2_spi3_en,
    output          rcc_c2_spi3_lpen,
    output          rcc_c2_spi4_en,
    output          rcc_c2_spi4_lpen,
    output          rcc_c2_spi5_en,
    output          rcc_c2_spi5_lpen,
    output          rcc_c2_sysctl_en,
    output          rcc_c2_sysctl_lpen,
    output          rcc_c2_tim1_en,
    output          rcc_c2_tim1_lpen,
    output          rcc_c2_tim2_en,
    output          rcc_c2_tim2_lpen,
    output          rcc_c2_tsms_en,
    output          rcc_c2_tsms_lpen,
    output          rcc_c2_uart1_en,
    output          rcc_c2_uart1_lpen,
    output          rcc_c2_uart2_en,
    output          rcc_c2_uart2_lpen,
    output          rcc_c2_uart3_en,
    output          rcc_c2_uart3_lpen,
    output          rcc_c2_uart4_en,
    output          rcc_c2_uart4_lpen,
    output          rcc_c2_uart5_en,
    output          rcc_c2_uart5_lpen,
    output          rcc_c2_uart6_en,
    output          rcc_c2_uart6_lpen,
    output          rcc_c2_uart7_en,
    output          rcc_c2_uart7_lpen,
    output          rcc_c2_uart8_en,
    output          rcc_c2_uart8_lpen,
    output          rcc_c2_wwdt_en,
    output          rcc_c2_wwdt_lpen,
    output          rcc_c2_xflash_en,
    output          rcc_c2_xflash_lpen,
    output          rcc_c2_xspi_en,
    output          rcc_c2_xspi_lpen,
    input           rcc_sys_stop,
    input           rcc_d1_stop,
    input           rcc_d2_stop,
    input           sync_hsecss_fail_rst,
    input           sync_hsecss_fail,
    input           rcc_exit_sys_stop,
    input           sync_lsecss_fail,

    // rcc_bdcr 
    input        backup_protect,
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

    output rcc_c1_rsr_rmvf_wren,
    output rcc_c2_rsr_rmvf_wren,
    output rcc_csr_lsion_wren,
    output rcc_bdcr_byte2_wren,
    output rcc_bdcr_byte1_wren,
    output rcc_bdcr_byte0_wren,
    output rcc_hsecss_it,
    output rcc_lsecss_it,
    output rcc_it
);
  // ================================================================================
  // LOCAL PARAMETERS
  // ================================================================================
  // rcc_vcore_reg
  localparam RCC_REG = 'h0;
  localparam RCC_CR = (RCC_REG + 'h0) >> 2;
  localparam RCC_ICSCR = (RCC_REG + 'h4) >> 2;
  localparam RCC_CRRCR = (RCC_REG + 'h8) >> 2;
  localparam RCC_CFGR = (RCC_REG + 'h10) >> 2;
  localparam RCC_D1CFGR = (RCC_REG + 'h18) >> 2;
  localparam RCC_D2CFGR = (RCC_REG + 'h1C) >> 2;
  localparam RCC_D3CFGR = (RCC_REG + 'h20) >> 2;
  localparam RCC_PLLCLKSELR = (RCC_REG + 'h28) >> 2;
  localparam RCC_PLLCFGR = (RCC_REG + 'h2C) >> 2;
  localparam RCC_PLL1DIVR = (RCC_REG + 'h30) >> 2;
  localparam RCC_PLL1FRACR = (RCC_REG + 'h34) >> 2;
  localparam RCC_PLL2DIVR = (RCC_REG + 'h38) >> 2;
  localparam RCC_PLL2FRACR = (RCC_REG + 'h3C) >> 2;
  localparam RCC_PLL3DIVR = (RCC_REG + 'h40) >> 2;
  localparam RCC_PLL3FRACR = (RCC_REG + 'h44) >> 2;
  localparam RCC_D1CCIPR = (RCC_REG + 'h4C) >> 2;
  localparam RCC_D2CCIP1R = (RCC_REG + 'h50) >> 2;
  localparam RCC_D2CCIP2R = (RCC_REG + 'h54) >> 2;
  localparam RCC_D3CCIPR = (RCC_REG + 'h58) >> 2;
  localparam RCC_CIER = (RCC_REG + 'h60) >> 2;
  localparam RCC_CIFR = (RCC_REG + 'h64) >> 2;
  localparam RCC_CICR = (RCC_REG + 'h68) >> 2;
  localparam RCC_BDCR = (RCC_REG + 'h70) >> 2;
  localparam RCC_CSR = (RCC_REG + 'h74) >> 2;
  localparam RCC_AHB1RSTR = (RCC_REG + 'h7C) >> 2;
  localparam RCC_APB1RSTR = (RCC_REG + 'h80) >> 2;
  localparam RCC_APB2RSTR = (RCC_REG + 'h84) >> 2;
  localparam RCC_APB3RSTR = (RCC_REG + 'h88) >> 2;
  localparam RCC_GCR = (RCC_REG + 'h8C) >> 2;
  localparam RCC_AHB1D3AMR = (RCC_REG + 'hA8) >> 2;
  localparam RCC_APB1D3AMR = (RCC_REG + 'hAC) >> 2;
  localparam RCC_APB2D3AMR = (RCC_REG + 'hB0) >> 2;
  localparam RCC_APB3D3AMR = (RCC_REG + 'hB4) >> 2;
  localparam RCC_RSR = (RCC_REG + 'h0D0) >> 2;
  localparam RCC_C1_RSR = (RCC_REG + 'h130) >> 2;
  localparam RCC_C1_AHB1ENR = (RCC_REG + 'h134) >> 2;
  localparam RCC_C1_APB1ENR = (RCC_REG + 'h138) >> 2;
  localparam RCC_C1_APB2ENR = (RCC_REG + 'h13C) >> 2;
  localparam RCC_C1_APB3ENR = (RCC_REG + 'h140) >> 2;
  localparam RCC_C1_AHB1LPENR = (RCC_REG + 'h144) >> 2;
  localparam RCC_C1_APB1LPENR = (RCC_REG + 'h148) >> 2;
  localparam RCC_C1_APB2LPENR = (RCC_REG + 'h14C) >> 2;
  localparam RCC_C1_APB3LPENR = (RCC_REG + 'h150) >> 2;
  localparam RCC_C2_RSR = (RCC_REG + 'h190) >> 2;
  localparam RCC_C2_AHB1ENR = (RCC_REG + 'h194) >> 2;
  localparam RCC_C2_APB1ENR = (RCC_REG + 'h198) >> 2;
  localparam RCC_C2_APB2ENR = (RCC_REG + 'h19C) >> 2;
  localparam RCC_C2_APB3ENR = (RCC_REG + 'h1A0) >> 2;
  localparam RCC_C2_AHB1LPENR = (RCC_REG + 'h1A4) >> 2;
  localparam RCC_C2_APB1LPENR = (RCC_REG + 'h1A8) >> 2;
  localparam RCC_C2_APB2LPENR = (RCC_REG + 'h1AC) >> 2;
  localparam RCC_C2_APB3LPENR = (RCC_REG + 'h1B0) >> 2;
  // other paramters

  // ================================================================================
  // INTERNAL SIGNAL DECLARATION
  // ================================================================================
  // read/write logic signal
  wire          rd_req;
  wire [WW-1:0] wr_req;
  wire          rsv_reg_sel;
  wire          rsv_acs_err;
  wire [DW-1:0] rdata_tmp;
  // rcc_vcore_reg
  // rcc_cr
  wire [  31:0] rcc_cr_read;
  wire          rcc_cr_sel;
  wire          cur_rcc_cr_pll3rdy;
  wire          cur_rcc_cr_pll3on;
  wire          nxt_rcc_cr_pll3on;
  wire          rcc_cr_pll3on_en;
  wire          cur_rcc_cr_pll2rdy;
  wire          cur_rcc_cr_pll2on;
  wire          nxt_rcc_cr_pll2on;
  wire          rcc_cr_pll2on_en;
  wire          cur_rcc_cr_pll1rdy;
  wire          cur_rcc_cr_pll1on;
  wire          nxt_rcc_cr_pll1on;
  wire          rcc_cr_pll1on_en;
  wire          cur_rcc_cr_hsecsson;
  wire          nxt_rcc_cr_hsecsson;
  wire          rcc_cr_hsecsson_en;
  wire          cur_rcc_cr_hsebyp;
  wire          nxt_rcc_cr_hsebyp;
  wire          rcc_cr_hsebyp_en;
  wire          cur_rcc_cr_hserdy;
  wire          cur_rcc_cr_hseon;
  wire          nxt_rcc_cr_hseon;
  wire          rcc_cr_hseon_en;
  wire          cur_rcc_cr_d2ckrdy;
  wire          cur_rcc_cr_d1ckrdy;
  wire          cur_rcc_cr_hsi48rdy;
  wire          cur_rcc_cr_hsi48on;
  wire          nxt_rcc_cr_hsi48on;
  wire          rcc_cr_hsi48on_en;
  wire          cur_rcc_cr_csikeron;
  wire          nxt_rcc_cr_csikeron;
  wire          rcc_cr_csikeron_en;
  wire          cur_rcc_cr_csirdy;
  wire          cur_rcc_cr_csion;
  wire          nxt_rcc_cr_csion;
  wire          rcc_cr_csion_en;
  wire          cur_rcc_cr_hsidivf;
  wire          nxt_rcc_cr_hsidivf;
  wire          rcc_cr_hsidivf_en;
  wire          rcc_cr_hsidivf_clr;
  wire          rcc_cr_hsidivf_set;
  wire [   1:0] cur_rcc_cr_hsidiv;
  wire [   1:0] nxt_rcc_cr_hsidiv;
  wire          rcc_cr_hsidiv_en;
  wire          cur_rcc_cr_hsirdy;
  wire          cur_rcc_cr_hsikeron;
  wire          nxt_rcc_cr_hsikeron;
  wire          rcc_cr_hsikeron_en;
  wire          cur_rcc_cr_hsion;
  wire          nxt_rcc_cr_hsion;
  wire          rcc_cr_hsion_en;
  // rcc_icscr
  wire [  31:0] rcc_icscr_read;
  wire          rcc_icscr_sel;
  wire [   4:0] csitrim;
  wire [   4:0] cur_rcc_icscr_csitrim;
  wire [   4:0] nxt_rcc_icscr_csitrim;
  wire          rcc_icscr_csitrim_en;
  wire [   7:0] cur_rcc_icscr_csical;
  wire [   5:0] hsitrim;
  wire [   5:0] cur_rcc_icscr_hsitrim;
  wire [   5:0] nxt_rcc_icscr_hsitrim;
  wire          rcc_icscr_hsitrim_en;
  wire [  11:0] cur_rcc_icscr_hsical;
  // rcc_crrcr
  wire [  31:0] rcc_crrcr_read;
  wire          rcc_crrcr_sel;
  wire [   9:0] cur_rcc_crrcr_hsi48cal;
  // rcc_cfgr
  wire [  31:0] rcc_cfgr_read;
  wire          rcc_cfgr_sel;
  wire [   2:0] cur_rcc_cfgr_mco2sel;
  wire [   2:0] nxt_rcc_cfgr_mco2sel;
  wire          rcc_cfgr_mco2sel_en;
  wire [   3:0] cur_rcc_cfgr_mco2pre;
  wire [   3:0] nxt_rcc_cfgr_mco2pre;
  wire          rcc_cfgr_mco2pre_en;
  wire [   2:0] cur_rcc_cfgr_mco1sel;
  wire [   2:0] nxt_rcc_cfgr_mco1sel;
  wire          rcc_cfgr_mco1sel_en;
  wire [   3:0] cur_rcc_cfgr_mco1pre;
  wire [   3:0] nxt_rcc_cfgr_mco1pre;
  wire          rcc_cfgr_mco1pre_en;
  wire          cur_rcc_cfgr_timpre;
  wire          nxt_rcc_cfgr_timpre;
  wire          rcc_cfgr_timpre_en;
  wire          cur_rcc_cfgr_hrtimsel;
  wire          nxt_rcc_cfgr_hrtimsel;
  wire          rcc_cfgr_hrtimsel_en;
  wire [   5:0] cur_rcc_cfgr_rtcpre;
  wire [   5:0] nxt_rcc_cfgr_rtcpre;
  wire          rcc_cfgr_rtcpre_en;
  wire          cur_rcc_cfgr_stopkerwuck;
  wire          nxt_rcc_cfgr_stopkerwuck;
  wire          rcc_cfgr_stopkerwuck_en;
  wire          cur_rcc_cfgr_stopwuck;
  wire          nxt_rcc_cfgr_stopwuck;
  wire          rcc_cfgr_stopwuck_en;
  wire [   2:0] nxt_rcc_cfgr_sws;
  wire          rcc_cfgr_sws_en;
  wire [   2:0] cur_rcc_cfgr_sws;
  wire [   2:0] cur_rcc_cfgr_sw;
  wire [   2:0] nxt_rcc_cfgr_sw;
  wire          rcc_cfgr_sw_en;
  // rcc_d1cfgr
  wire [  31:0] rcc_d1cfgr_read;
  wire          rcc_d1cfgr_sel;
  wire [   3:0] cur_rcc_d1cfgr_d1cpre;
  wire [   3:0] nxt_rcc_d1cfgr_d1cpre;
  wire          rcc_d1cfgr_d1cpre_en;
  wire [   2:0] cur_rcc_d1cfgr_d1ppre;
  wire [   2:0] nxt_rcc_d1cfgr_d1ppre;
  wire          rcc_d1cfgr_d1ppre_en;
  wire [   3:0] cur_rcc_d1cfgr_hpre;
  wire [   3:0] nxt_rcc_d1cfgr_hpre;
  wire          rcc_d1cfgr_hpre_en;
  // rcc_d2cfgr
  wire [  31:0] rcc_d2cfgr_read;
  wire          rcc_d2cfgr_sel;
  wire [   2:0] cur_rcc_d2cfgr_d2ppre2;
  wire [   2:0] nxt_rcc_d2cfgr_d2ppre2;
  wire          rcc_d2cfgr_d2ppre2_en;
  wire [   2:0] cur_rcc_d2cfgr_d2ppre1;
  wire [   2:0] nxt_rcc_d2cfgr_d2ppre1;
  wire          rcc_d2cfgr_d2ppre1_en;
  // rcc_d3cfgr
  wire [  31:0] rcc_d3cfgr_read;
  wire          rcc_d3cfgr_sel;
  wire [   2:0] cur_rcc_d3cfgr_d3ppre;
  wire [   2:0] nxt_rcc_d3cfgr_d3ppre;
  wire          rcc_d3cfgr_d3ppre_en;
  // rcc_pllclkselr
  wire [  31:0] rcc_pllclkselr_read;
  wire          rcc_pllclkselr_sel;
  wire [   5:0] cur_rcc_pllclkselr_divm3;
  wire [   5:0] nxt_rcc_pllclkselr_divm3;
  wire          rcc_pllclkselr_divm3_en;
  wire [   5:0] cur_rcc_pllclkselr_divm2;
  wire [   5:0] nxt_rcc_pllclkselr_divm2;
  wire          rcc_pllclkselr_divm2_en;
  wire [   5:0] cur_rcc_pllclkselr_divm1;
  wire [   5:0] nxt_rcc_pllclkselr_divm1;
  wire          rcc_pllclkselr_divm1_en;
  wire [   1:0] cur_rcc_pllclkselr_pllsrc;
  wire [   1:0] nxt_rcc_pllclkselr_pllsrc;
  wire          rcc_pllclkselr_pllsrc_en;
  // rcc_pllcfgr
  wire [  31:0] rcc_pllcfgr_read;
  wire          rcc_pllcfgr_sel;
  wire          cur_rcc_pllcfgr_divr3en;
  wire          nxt_rcc_pllcfgr_divr3en;
  wire          rcc_pllcfgr_divr3en_en;
  wire          cur_rcc_pllcfgr_divq3en;
  wire          nxt_rcc_pllcfgr_divq3en;
  wire          rcc_pllcfgr_divq3en_en;
  wire          cur_rcc_pllcfgr_divp3en;
  wire          nxt_rcc_pllcfgr_divp3en;
  wire          rcc_pllcfgr_divp3en_en;
  wire          cur_rcc_pllcfgr_divr2en;
  wire          nxt_rcc_pllcfgr_divr2en;
  wire          rcc_pllcfgr_divr2en_en;
  wire          cur_rcc_pllcfgr_divq2en;
  wire          nxt_rcc_pllcfgr_divq2en;
  wire          rcc_pllcfgr_divq2en_en;
  wire          cur_rcc_pllcfgr_divp2en;
  wire          nxt_rcc_pllcfgr_divp2en;
  wire          rcc_pllcfgr_divp2en_en;
  wire          cur_rcc_pllcfgr_divr1en;
  wire          nxt_rcc_pllcfgr_divr1en;
  wire          rcc_pllcfgr_divr1en_en;
  wire          cur_rcc_pllcfgr_divq1en;
  wire          nxt_rcc_pllcfgr_divq1en;
  wire          rcc_pllcfgr_divq1en_en;
  wire          cur_rcc_pllcfgr_divp1en;
  wire          nxt_rcc_pllcfgr_divp1en;
  wire          rcc_pllcfgr_divp1en_en;
  wire [   1:0] cur_rcc_pllcfgr_pll3rge;
  wire [   1:0] nxt_rcc_pllcfgr_pll3rge;
  wire          rcc_pllcfgr_pll3rge_en;
  wire          cur_rcc_pllcfgr_pll3vcosel;
  wire          nxt_rcc_pllcfgr_pll3vcosel;
  wire          rcc_pllcfgr_pll3vcosel_en;
  wire          cur_rcc_pllcfgr_pll3fracen;
  wire          nxt_rcc_pllcfgr_pll3fracen;
  wire          rcc_pllcfgr_pll3fracen_en;
  wire [   1:0] cur_rcc_pllcfgr_pll2rge;
  wire [   1:0] nxt_rcc_pllcfgr_pll2rge;
  wire          rcc_pllcfgr_pll2rge_en;
  wire          cur_rcc_pllcfgr_pll2vcosel;
  wire          nxt_rcc_pllcfgr_pll2vcosel;
  wire          rcc_pllcfgr_pll2vcosel_en;
  wire          cur_rcc_pllcfgr_pll2fracen;
  wire          nxt_rcc_pllcfgr_pll2fracen;
  wire          rcc_pllcfgr_pll2fracen_en;
  wire [   1:0] cur_rcc_pllcfgr_pll1rge;
  wire [   1:0] nxt_rcc_pllcfgr_pll1rge;
  wire          rcc_pllcfgr_pll1rge_en;
  wire          cur_rcc_pllcfgr_pll1vcosel;
  wire          nxt_rcc_pllcfgr_pll1vcosel;
  wire          rcc_pllcfgr_pll1vcosel_en;
  wire          cur_rcc_pllcfgr_pll1fracen;
  wire          nxt_rcc_pllcfgr_pll1fracen;
  wire          rcc_pllcfgr_pll1fracen_en;
  // rcc_pll1divr
  wire [  31:0] rcc_pll1divr_read;
  wire          rcc_pll1divr_sel;
  wire [   6:0] cur_rcc_pll1divr_divr1;
  wire [   6:0] nxt_rcc_pll1divr_divr1;
  wire          rcc_pll1divr_divr1_en;
  wire [   6:0] cur_rcc_pll1divr_divq1;
  wire [   6:0] nxt_rcc_pll1divr_divq1;
  wire          rcc_pll1divr_divq1_en;
  wire [   6:0] cur_rcc_pll1divr_divp1;
  wire [   6:0] nxt_rcc_pll1divr_divp1;
  wire          rcc_pll1divr_divp1_en;
  wire [   8:0] cur_rcc_pll1divr_divn1;
  wire [   8:0] nxt_rcc_pll1divr_divn1;
  wire          rcc_pll1divr_divn1_en;
  // rcc_pll1fracr
  wire [  31:0] rcc_pll1fracr_read;
  wire          rcc_pll1fracr_sel;
  wire [  12:0] cur_rcc_pll1fracr_fracn1;
  wire [  12:0] nxt_rcc_pll1fracr_fracn1;
  wire          rcc_pll1fracr_fracn1_en;
  // rcc_pll2divr
  wire [  31:0] rcc_pll2divr_read;
  wire          rcc_pll2divr_sel;
  wire [   6:0] cur_rcc_pll2divr_divr2;
  wire [   6:0] nxt_rcc_pll2divr_divr2;
  wire          rcc_pll2divr_divr2_en;
  wire [   6:0] cur_rcc_pll2divr_divq2;
  wire [   6:0] nxt_rcc_pll2divr_divq2;
  wire          rcc_pll2divr_divq2_en;
  wire [   6:0] cur_rcc_pll2divr_divp2;
  wire [   6:0] nxt_rcc_pll2divr_divp2;
  wire          rcc_pll2divr_divp2_en;
  wire [   8:0] cur_rcc_pll2divr_divn2;
  wire [   8:0] nxt_rcc_pll2divr_divn2;
  wire          rcc_pll2divr_divn2_en;
  // rcc_pll2fracr
  wire [  31:0] rcc_pll2fracr_read;
  wire          rcc_pll2fracr_sel;
  wire [  12:0] cur_rcc_pll2fracr_fracn2;
  wire [  12:0] nxt_rcc_pll2fracr_fracn2;
  wire          rcc_pll2fracr_fracn2_en;
  // rcc_pll3divr
  wire [  31:0] rcc_pll3divr_read;
  wire          rcc_pll3divr_sel;
  wire [   6:0] cur_rcc_pll3divr_divr3;
  wire [   6:0] nxt_rcc_pll3divr_divr3;
  wire          rcc_pll3divr_divr3_en;
  wire [   6:0] cur_rcc_pll3divr_divq3;
  wire [   6:0] nxt_rcc_pll3divr_divq3;
  wire          rcc_pll3divr_divq3_en;
  wire [   6:0] cur_rcc_pll3divr_divp3;
  wire [   6:0] nxt_rcc_pll3divr_divp3;
  wire          rcc_pll3divr_divp3_en;
  wire [   8:0] cur_rcc_pll3divr_divn3;
  wire [   8:0] nxt_rcc_pll3divr_divn3;
  wire          rcc_pll3divr_divn3_en;
  // rcc_pll3fracr
  wire [  31:0] rcc_pll3fracr_read;
  wire          rcc_pll3fracr_sel;
  wire [  12:0] cur_rcc_pll3fracr_fracn3;
  wire [  12:0] nxt_rcc_pll3fracr_fracn3;
  wire          rcc_pll3fracr_fracn3_en;
  // rcc_d1ccipr
  wire [  31:0] rcc_d1ccipr_read;
  wire          rcc_d1ccipr_sel;
  wire [   1:0] cur_rcc_d1ccipr_clkpersel;
  wire [   1:0] nxt_rcc_d1ccipr_clkpersel;
  wire          rcc_d1ccipr_clkpersel_en;
  wire          cur_rcc_d1ccipr_sdmmcsel;
  wire          nxt_rcc_d1ccipr_sdmmcsel;
  wire          rcc_d1ccipr_sdmmcsel_en;
  wire [   1:0] cur_rcc_d1ccipr_qspisel;
  wire [   1:0] nxt_rcc_d1ccipr_qspisel;
  wire          rcc_d1ccipr_qspisel_en;
  wire [   1:0] cur_rcc_d1ccipr_fmcsel;
  wire [   1:0] nxt_rcc_d1ccipr_fmcsel;
  wire          rcc_d1ccipr_fmcsel_en;
  // rcc_d2ccip1r
  wire [  31:0] rcc_d2ccip1r_read;
  wire          rcc_d2ccip1r_sel;
  wire          cur_rcc_d2ccip1r_swpmisel;
  wire          nxt_rcc_d2ccip1r_swpmisel;
  wire          rcc_d2ccip1r_swpmisel_en;
  wire [   1:0] cur_rcc_d2ccip1r_fdcansel;
  wire [   1:0] nxt_rcc_d2ccip1r_fdcansel;
  wire          rcc_d2ccip1r_fdcansel_en;
  wire          cur_rcc_d2ccip1r_dfsdm1sel;
  wire          nxt_rcc_d2ccip1r_dfsdm1sel;
  wire          rcc_d2ccip1r_dfsdm1sel_en;
  wire [   1:0] cur_rcc_d2ccip1r_spdifsel;
  wire [   1:0] nxt_rcc_d2ccip1r_spdifsel;
  wire          rcc_d2ccip1r_spdifsel_en;
  wire [   2:0] cur_rcc_d2ccip1r_spi45sel;
  wire [   2:0] nxt_rcc_d2ccip1r_spi45sel;
  wire          rcc_d2ccip1r_spi45sel_en;
  wire [   2:0] cur_rcc_d2ccip1r_spi123sel;
  wire [   2:0] nxt_rcc_d2ccip1r_spi123sel;
  wire          rcc_d2ccip1r_spi123sel_en;
  wire [   2:0] cur_rcc_d2ccip1r_sai23sel;
  wire [   2:0] nxt_rcc_d2ccip1r_sai23sel;
  wire          rcc_d2ccip1r_sai23sel_en;
  wire [   2:0] cur_rcc_d2ccip1r_sai1sel;
  wire [   2:0] nxt_rcc_d2ccip1r_sai1sel;
  wire          rcc_d2ccip1r_sai1sel_en;
  // rcc_d2ccip2r
  wire [  31:0] rcc_d2ccip2r_read;
  wire          rcc_d2ccip2r_sel;
  wire [   2:0] cur_rcc_d2ccip2r_lptim1sel;
  wire [   2:0] nxt_rcc_d2ccip2r_lptim1sel;
  wire          rcc_d2ccip2r_lptim1sel_en;
  wire [   1:0] cur_rcc_d2ccip2r_cecsel;
  wire [   1:0] nxt_rcc_d2ccip2r_cecsel;
  wire          rcc_d2ccip2r_cecsel_en;
  wire [   1:0] cur_rcc_d2ccip2r_usbsel;
  wire [   1:0] nxt_rcc_d2ccip2r_usbsel;
  wire          rcc_d2ccip2r_usbsel_en;
  wire [   1:0] cur_rcc_d2ccip2r_i2c123sel;
  wire [   1:0] nxt_rcc_d2ccip2r_i2c123sel;
  wire          rcc_d2ccip2r_i2c123sel_en;
  wire [   1:0] cur_rcc_d2ccip2r_rngsel;
  wire [   1:0] nxt_rcc_d2ccip2r_rngsel;
  wire          rcc_d2ccip2r_rngsel_en;
  wire [   2:0] cur_rcc_d2ccip2r_usart16sel;
  wire [   2:0] nxt_rcc_d2ccip2r_usart16sel;
  wire          rcc_d2ccip2r_usart16sel_en;
  wire [   2:0] cur_rcc_d2ccip2r_usart234578sel;
  wire [   2:0] nxt_rcc_d2ccip2r_usart234578sel;
  wire          rcc_d2ccip2r_usart234578sel_en;
  // rcc_d3ccipr
  wire [  31:0] rcc_d3ccipr_read;
  wire          rcc_d3ccipr_sel;
  wire [   2:0] cur_rcc_d3ccipr_spi6sel;
  wire [   2:0] nxt_rcc_d3ccipr_spi6sel;
  wire          rcc_d3ccipr_spi6sel_en;
  wire [   2:0] cur_rcc_d3ccipr_sai4bsel;
  wire [   2:0] nxt_rcc_d3ccipr_sai4bsel;
  wire          rcc_d3ccipr_sai4bsel_en;
  wire [   2:0] cur_rcc_d3ccipr_sai4asel;
  wire [   2:0] nxt_rcc_d3ccipr_sai4asel;
  wire          rcc_d3ccipr_sai4asel_en;
  wire [   1:0] cur_rcc_d3ccipr_adcsel;
  wire [   1:0] nxt_rcc_d3ccipr_adcsel;
  wire          rcc_d3ccipr_adcsel_en;
  wire [   2:0] cur_rcc_d3ccipr_lptim345sel;
  wire [   2:0] nxt_rcc_d3ccipr_lptim345sel;
  wire          rcc_d3ccipr_lptim345sel_en;
  wire [   2:0] cur_rcc_d3ccipr_lptim2sel;
  wire [   2:0] nxt_rcc_d3ccipr_lptim2sel;
  wire          rcc_d3ccipr_lptim2sel_en;
  wire [   1:0] cur_rcc_d3ccipr_i2c4sel;
  wire [   1:0] nxt_rcc_d3ccipr_i2c4sel;
  wire          rcc_d3ccipr_i2c4sel_en;
  wire [   2:0] cur_rcc_d3ccipr_lpuart1sel;
  wire [   2:0] nxt_rcc_d3ccipr_lpuart1sel;
  wire          rcc_d3ccipr_lpuart1sel_en;
  // rcc_cier
  wire [  31:0] rcc_cier_read;
  wire          rcc_cier_sel;
  wire          cur_rcc_cier_lsecssie;
  wire          nxt_rcc_cier_lsecssie;
  wire          rcc_cier_lsecssie_en;
  wire          cur_rcc_cier_pll3rdyie;
  wire          nxt_rcc_cier_pll3rdyie;
  wire          rcc_cier_pll3rdyie_en;
  wire          cur_rcc_cier_pll2rdyie;
  wire          nxt_rcc_cier_pll2rdyie;
  wire          rcc_cier_pll2rdyie_en;
  wire          cur_rcc_cier_pll1rdyie;
  wire          nxt_rcc_cier_pll1rdyie;
  wire          rcc_cier_pll1rdyie_en;
  wire          cur_rcc_cier_hsi48rdyie;
  wire          nxt_rcc_cier_hsi48rdyie;
  wire          rcc_cier_hsi48rdyie_en;
  wire          cur_rcc_cier_csirdyie;
  wire          nxt_rcc_cier_csirdyie;
  wire          rcc_cier_csirdyie_en;
  wire          cur_rcc_cier_hserdyie;
  wire          nxt_rcc_cier_hserdyie;
  wire          rcc_cier_hserdyie_en;
  wire          cur_rcc_cier_hsirdyie;
  wire          nxt_rcc_cier_hsirdyie;
  wire          rcc_cier_hsirdyie_en;
  wire          cur_rcc_cier_lserdyie;
  wire          nxt_rcc_cier_lserdyie;
  wire          rcc_cier_lserdyie_en;
  wire          cur_rcc_cier_lsirdyie;
  wire          nxt_rcc_cier_lsirdyie;
  wire          rcc_cier_lsirdyie_en;
  // rcc_cifr
  wire [  31:0] rcc_cifr_read;
  wire          rcc_cifr_sel;
  wire          cur_rcc_cifr_hsecssf;
  wire          nxt_rcc_cifr_hsecssf;
  wire          rcc_cifr_hsecssf_en;
  wire          rcc_cifr_hsecssf_clr;
  wire          rcc_cifr_hsecssf_set;
  wire          cur_rcc_cifr_lsecssf;
  wire          nxt_rcc_cifr_lsecssf;
  wire          rcc_cifr_lsecssf_en;
  wire          rcc_cifr_lsecssf_clr;
  wire          rcc_cifr_lsecssf_set;
  wire          cur_rcc_cifr_pll3rdyf;
  wire          nxt_rcc_cifr_pll3rdyf;
  wire          rcc_cifr_pll3rdyf_en;
  wire          rcc_cifr_pll3rdyf_clr;
  wire          rcc_cifr_pll3rdyf_set;
  wire          cur_rcc_cifr_pll2rdyf;
  wire          nxt_rcc_cifr_pll2rdyf;
  wire          rcc_cifr_pll2rdyf_en;
  wire          rcc_cifr_pll2rdyf_clr;
  wire          rcc_cifr_pll2rdyf_set;
  wire          cur_rcc_cifr_pll1rdyf;
  wire          nxt_rcc_cifr_pll1rdyf;
  wire          rcc_cifr_pll1rdyf_en;
  wire          rcc_cifr_pll1rdyf_clr;
  wire          rcc_cifr_pll1rdyf_set;
  wire          cur_rcc_cifr_hsi48rdyf;
  wire          nxt_rcc_cifr_hsi48rdyf;
  wire          rcc_cifr_hsi48rdyf_en;
  wire          rcc_cifr_hsi48rdyf_clr;
  wire          rcc_cifr_hsi48rdyf_set;
  wire          cur_rcc_cifr_csirdyf;
  wire          nxt_rcc_cifr_csirdyf;
  wire          rcc_cifr_csirdyf_en;
  wire          rcc_cifr_csirdyf_clr;
  wire          rcc_cifr_csirdyf_set;
  wire          cur_rcc_cifr_hserdyf;
  wire          nxt_rcc_cifr_hserdyf;
  wire          rcc_cifr_hserdyf_en;
  wire          rcc_cifr_hserdyf_clr;
  wire          rcc_cifr_hserdyf_set;
  wire          cur_rcc_cifr_hsirdyf;
  wire          nxt_rcc_cifr_hsirdyf;
  wire          rcc_cifr_hsirdyf_en;
  wire          rcc_cifr_hsirdyf_clr;
  wire          rcc_cifr_hsirdyf_set;
  wire          cur_rcc_cifr_lserdyf;
  wire          nxt_rcc_cifr_lserdyf;
  wire          rcc_cifr_lserdyf_en;
  wire          rcc_cifr_lserdyf_clr;
  wire          rcc_cifr_lserdyf_set;
  wire          cur_rcc_cifr_lsirdyf;
  wire          nxt_rcc_cifr_lsirdyf;
  wire          rcc_cifr_lsirdyf_en;
  wire          rcc_cifr_lsirdyf_clr;
  wire          rcc_cifr_lsirdyf_set;
  // rcc_cicr
  wire [  31:0] rcc_cicr_read;
  wire          rcc_cicr_sel;
  wire          cur_rcc_cicr_hsecssc;
  wire          nxt_rcc_cicr_hsecssc;
  wire          rcc_cicr_hsecssc_en;
  wire          rcc_cicr_hsecssc_clr;
  wire          rcc_cicr_hsecssc_set;
  wire          cur_rcc_cicr_lsecssc;
  wire          nxt_rcc_cicr_lsecssc;
  wire          rcc_cicr_lsecssc_en;
  wire          rcc_cicr_lsecssc_clr;
  wire          rcc_cicr_lsecssc_set;
  wire          cur_rcc_cicr_pll3rdyc;
  wire          nxt_rcc_cicr_pll3rdyc;
  wire          rcc_cicr_pll3rdyc_en;
  wire          rcc_cicr_pll3rdyc_clr;
  wire          rcc_cicr_pll3rdyc_set;
  wire          cur_rcc_cicr_pll2rdyc;
  wire          nxt_rcc_cicr_pll2rdyc;
  wire          rcc_cicr_pll2rdyc_en;
  wire          rcc_cicr_pll2rdyc_clr;
  wire          rcc_cicr_pll2rdyc_set;
  wire          cur_rcc_cicr_pll1rdyc;
  wire          nxt_rcc_cicr_pll1rdyc;
  wire          rcc_cicr_pll1rdyc_en;
  wire          rcc_cicr_pll1rdyc_clr;
  wire          rcc_cicr_pll1rdyc_set;
  wire          cur_rcc_cicr_hsi48rdyc;
  wire          nxt_rcc_cicr_hsi48rdyc;
  wire          rcc_cicr_hsi48rdyc_en;
  wire          rcc_cicr_hsi48rdyc_clr;
  wire          rcc_cicr_hsi48rdyc_set;
  wire          cur_rcc_cicr_csirdyc;
  wire          nxt_rcc_cicr_csirdyc;
  wire          rcc_cicr_csirdyc_en;
  wire          rcc_cicr_csirdyc_clr;
  wire          rcc_cicr_csirdyc_set;
  wire          cur_rcc_cicr_hserdyc;
  wire          nxt_rcc_cicr_hserdyc;
  wire          rcc_cicr_hserdyc_en;
  wire          rcc_cicr_hserdyc_clr;
  wire          rcc_cicr_hserdyc_set;
  wire          cur_rcc_cicr_hsirdyc;
  wire          nxt_rcc_cicr_hsirdyc;
  wire          rcc_cicr_hsirdyc_en;
  wire          rcc_cicr_hsirdyc_clr;
  wire          rcc_cicr_hsirdyc_set;
  wire          cur_rcc_cicr_lserdyc;
  wire          nxt_rcc_cicr_lserdyc;
  wire          rcc_cicr_lserdyc_en;
  wire          rcc_cicr_lserdyc_clr;
  wire          rcc_cicr_lserdyc_set;
  wire          cur_rcc_cicr_lsirdyc;
  wire          nxt_rcc_cicr_lsirdyc;
  wire          rcc_cicr_lsirdyc_en;
  wire          rcc_cicr_lsirdyc_clr;
  wire          rcc_cicr_lsirdyc_set;
  // rcc_bdcr
  // rcc_csr
  // rcc_ahb1rstr
  wire [  31:0] rcc_ahb1rstr_read;
  wire          rcc_ahb1rstr_sel;
  wire          cur_rcc_ahb1rstr_romrst;
  wire          nxt_rcc_ahb1rstr_romrst;
  wire          rcc_ahb1rstr_romrst_en;
  wire          cur_rcc_ahb1rstr_tsmsrst;
  wire          nxt_rcc_ahb1rstr_tsmsrst;
  wire          rcc_ahb1rstr_tsmsrst_en;
  wire          cur_rcc_ahb1rstr_smsrst;
  wire          nxt_rcc_ahb1rstr_smsrst;
  wire          rcc_ahb1rstr_smsrst_en;
  wire          cur_rcc_ahb1rstr_xflashrst;
  wire          nxt_rcc_ahb1rstr_xflashrst;
  wire          rcc_ahb1rstr_xflashrst_en;
  wire          cur_rcc_ahb1rstr_fftrst;
  wire          nxt_rcc_ahb1rstr_fftrst;
  wire          rcc_ahb1rstr_fftrst_en;
  wire          cur_rcc_ahb1rstr_npurst;
  wire          nxt_rcc_ahb1rstr_npurst;
  wire          rcc_ahb1rstr_npurst_en;
  wire          cur_rcc_ahb1rstr_dma1rst;
  wire          nxt_rcc_ahb1rstr_dma1rst;
  wire          rcc_ahb1rstr_dma1rst_en;
  wire          cur_rcc_ahb1rstr_dma2rst;
  wire          nxt_rcc_ahb1rstr_dma2rst;
  wire          rcc_ahb1rstr_dma2rst_en;
  wire          cur_rcc_ahb1rstr_dmaschrst;
  wire          nxt_rcc_ahb1rstr_dmaschrst;
  wire          rcc_ahb1rstr_dmaschrst_en;
  wire          cur_rcc_ahb1rstr_qspi1rst;
  wire          nxt_rcc_ahb1rstr_qspi1rst;
  wire          rcc_ahb1rstr_qspi1rst_en;
  wire          cur_rcc_ahb1rstr_qspi2rst;
  wire          nxt_rcc_ahb1rstr_qspi2rst;
  wire          rcc_ahb1rstr_qspi2rst_en;
  wire          cur_rcc_ahb1rstr_qspi3rst;
  wire          nxt_rcc_ahb1rstr_qspi3rst;
  wire          rcc_ahb1rstr_qspi3rst_en;
  wire          cur_rcc_ahb1rstr_qspi4rst;
  wire          nxt_rcc_ahb1rstr_qspi4rst;
  wire          rcc_ahb1rstr_qspi4rst_en;
  wire          cur_rcc_ahb1rstr_xspirst;
  wire          nxt_rcc_ahb1rstr_xspirst;
  wire          rcc_ahb1rstr_xspirst_en;
  wire          cur_rcc_ahb1rstr_mspirst;
  wire          nxt_rcc_ahb1rstr_mspirst;
  wire          rcc_ahb1rstr_mspirst_en;
  wire          cur_rcc_ahb1rstr_hacif_l1rst;
  wire          nxt_rcc_ahb1rstr_hacif_l1rst;
  wire          rcc_ahb1rstr_hacif_l1rst_en;
  wire          cur_rcc_ahb1rstr_hacif_f1rst;
  wire          nxt_rcc_ahb1rstr_hacif_f1rst;
  wire          rcc_ahb1rstr_hacif_f1rst_en;
  wire          cur_rcc_ahb1rstr_macrst;
  wire          nxt_rcc_ahb1rstr_macrst;
  wire          rcc_ahb1rstr_macrst_en;
  wire          cur_rcc_ahb1rstr_lzrst;
  wire          nxt_rcc_ahb1rstr_lzrst;
  wire          rcc_ahb1rstr_lzrst_en;
  // rcc_apb1rstr
  wire [  31:0] rcc_apb1rstr_read;
  wire          rcc_apb1rstr_sel;
  wire          cur_rcc_apb1rstr_gtim1rst;
  wire          nxt_rcc_apb1rstr_gtim1rst;
  wire          rcc_apb1rstr_gtim1rst_en;
  wire          cur_rcc_apb1rstr_gtim2rst;
  wire          nxt_rcc_apb1rstr_gtim2rst;
  wire          rcc_apb1rstr_gtim2rst_en;
  wire          cur_rcc_apb1rstr_gtim3rst;
  wire          nxt_rcc_apb1rstr_gtim3rst;
  wire          rcc_apb1rstr_gtim3rst_en;
  wire          cur_rcc_apb1rstr_gtim4rst;
  wire          nxt_rcc_apb1rstr_gtim4rst;
  wire          rcc_apb1rstr_gtim4rst_en;
  wire          cur_rcc_apb1rstr_spi1rst;
  wire          nxt_rcc_apb1rstr_spi1rst;
  wire          rcc_apb1rstr_spi1rst_en;
  wire          cur_rcc_apb1rstr_spi2rst;
  wire          nxt_rcc_apb1rstr_spi2rst;
  wire          rcc_apb1rstr_spi2rst_en;
  wire          cur_rcc_apb1rstr_spi3rst;
  wire          nxt_rcc_apb1rstr_spi3rst;
  wire          rcc_apb1rstr_spi3rst_en;
  wire          cur_rcc_apb1rstr_uart1rst;
  wire          nxt_rcc_apb1rstr_uart1rst;
  wire          rcc_apb1rstr_uart1rst_en;
  wire          cur_rcc_apb1rstr_uart2rst;
  wire          nxt_rcc_apb1rstr_uart2rst;
  wire          rcc_apb1rstr_uart2rst_en;
  wire          cur_rcc_apb1rstr_uart3rst;
  wire          nxt_rcc_apb1rstr_uart3rst;
  wire          rcc_apb1rstr_uart3rst_en;
  wire          cur_rcc_apb1rstr_uart4rst;
  wire          nxt_rcc_apb1rstr_uart4rst;
  wire          rcc_apb1rstr_uart4rst_en;
  wire          cur_rcc_apb1rstr_i2c1rst;
  wire          nxt_rcc_apb1rstr_i2c1rst;
  wire          rcc_apb1rstr_i2c1rst_en;
  wire          cur_rcc_apb1rstr_gpio1rst;
  wire          nxt_rcc_apb1rstr_gpio1rst;
  wire          rcc_apb1rstr_gpio1rst_en;
  wire          cur_rcc_apb1rstr_gpio2rst;
  wire          nxt_rcc_apb1rstr_gpio2rst;
  wire          rcc_apb1rstr_gpio2rst_en;
  wire          cur_rcc_apb1rstr_gpio3rst;
  wire          nxt_rcc_apb1rstr_gpio3rst;
  wire          rcc_apb1rstr_gpio3rst_en;
  wire          cur_rcc_apb1rstr_can1rst;
  wire          nxt_rcc_apb1rstr_can1rst;
  wire          rcc_apb1rstr_can1rst_en;
  wire          cur_rcc_apb1rstr_can2rst;
  wire          nxt_rcc_apb1rstr_can2rst;
  wire          rcc_apb1rstr_can2rst_en;
  wire          cur_rcc_apb1rstr_can3rst;
  wire          nxt_rcc_apb1rstr_can3rst;
  wire          rcc_apb1rstr_can3rst_en;
  // rcc_apb2rstr
  wire [  31:0] rcc_apb2rstr_read;
  wire          rcc_apb2rstr_sel;
  wire          cur_rcc_apb2rstr_gtim5rst;
  wire          nxt_rcc_apb2rstr_gtim5rst;
  wire          rcc_apb2rstr_gtim5rst_en;
  wire          cur_rcc_apb2rstr_gtim6rst;
  wire          nxt_rcc_apb2rstr_gtim6rst;
  wire          rcc_apb2rstr_gtim6rst_en;
  wire          cur_rcc_apb2rstr_spi4rst;
  wire          nxt_rcc_apb2rstr_spi4rst;
  wire          rcc_apb2rstr_spi4rst_en;
  wire          cur_rcc_apb2rstr_spi5rst;
  wire          nxt_rcc_apb2rstr_spi5rst;
  wire          rcc_apb2rstr_spi5rst_en;
  wire          cur_rcc_apb2rstr_uart5rst;
  wire          nxt_rcc_apb2rstr_uart5rst;
  wire          rcc_apb2rstr_uart5rst_en;
  wire          cur_rcc_apb2rstr_uart6rst;
  wire          nxt_rcc_apb2rstr_uart6rst;
  wire          rcc_apb2rstr_uart6rst_en;
  wire          cur_rcc_apb2rstr_uart7rst;
  wire          nxt_rcc_apb2rstr_uart7rst;
  wire          rcc_apb2rstr_uart7rst_en;
  wire          cur_rcc_apb2rstr_uart8rst;
  wire          nxt_rcc_apb2rstr_uart8rst;
  wire          rcc_apb2rstr_uart8rst_en;
  wire          cur_rcc_apb2rstr_i2c2rst;
  wire          nxt_rcc_apb2rstr_i2c2rst;
  wire          rcc_apb2rstr_i2c2rst_en;
  wire          cur_rcc_apb2rstr_i2c3rst;
  wire          nxt_rcc_apb2rstr_i2c3rst;
  wire          rcc_apb2rstr_i2c3rst_en;
  wire          cur_rcc_apb2rstr_can4rst;
  wire          nxt_rcc_apb2rstr_can4rst;
  wire          rcc_apb2rstr_can4rst_en;
  wire          cur_rcc_apb2rstr_can5rst;
  wire          nxt_rcc_apb2rstr_can5rst;
  wire          rcc_apb2rstr_can5rst_en;
  wire          cur_rcc_apb2rstr_can6rst;
  wire          nxt_rcc_apb2rstr_can6rst;
  wire          rcc_apb2rstr_can6rst_en;
  wire          cur_rcc_apb2rstr_mpptrst;
  wire          nxt_rcc_apb2rstr_mpptrst;
  wire          rcc_apb2rstr_mpptrst_en;
  wire          cur_rcc_apb2rstr_gpio4rst;
  wire          nxt_rcc_apb2rstr_gpio4rst;
  wire          rcc_apb2rstr_gpio4rst_en;
  wire          cur_rcc_apb2rstr_gpio5rst;
  wire          nxt_rcc_apb2rstr_gpio5rst;
  wire          rcc_apb2rstr_gpio5rst_en;
  // rcc_apb3rstr
  wire [  31:0] rcc_apb3rstr_read;
  wire          rcc_apb3rstr_sel;
  wire          cur_rcc_apb3rstr_sysctlrst;
  wire          nxt_rcc_apb3rstr_sysctlrst;
  wire          rcc_apb3rstr_sysctlrst_en;
  wire          cur_rcc_apb3rstr_wwdtrst;
  wire          nxt_rcc_apb3rstr_wwdtrst;
  wire          rcc_apb3rstr_wwdtrst_en;
  wire          cur_rcc_apb3rstr_tim1rst;
  wire          nxt_rcc_apb3rstr_tim1rst;
  wire          rcc_apb3rstr_tim1rst_en;
  wire          cur_rcc_apb3rstr_tim2rst;
  wire          nxt_rcc_apb3rstr_tim2rst;
  wire          rcc_apb3rstr_tim2rst_en;
  wire          cur_rcc_apb3rstr_adccrst;
  wire          nxt_rcc_apb3rstr_adccrst;
  wire          rcc_apb3rstr_adccrst_en;
  wire          cur_rcc_apb3rstr_gpio6rst;
  wire          nxt_rcc_apb3rstr_gpio6rst;
  wire          rcc_apb3rstr_gpio6rst_en;
  wire          cur_rcc_apb3rstr_gpio7rst;
  wire          nxt_rcc_apb3rstr_gpio7rst;
  wire          rcc_apb3rstr_gpio7rst_en;
  wire          cur_rcc_apb3rstr_gpio8rst;
  wire          nxt_rcc_apb3rstr_gpio8rst;
  wire          rcc_apb3rstr_gpio8rst_en;
  wire          cur_rcc_apb3rstr_iwdtrst;
  wire          nxt_rcc_apb3rstr_iwdtrst;
  wire          rcc_apb3rstr_iwdtrst_en;
  wire          cur_rcc_apb3rstr_rtcrst;
  wire          nxt_rcc_apb3rstr_rtcrst;
  wire          rcc_apb3rstr_rtcrst_en;
  // rcc_gcr
  wire [  31:0] rcc_gcr_read;
  wire          rcc_gcr_sel;
  wire          cur_rcc_gcr_ww2rsc;
  wire          nxt_rcc_gcr_ww2rsc;
  wire          rcc_gcr_ww2rsc_en;
  wire          cur_rcc_gcr_ww1rsc;
  wire          nxt_rcc_gcr_ww1rsc;
  wire          rcc_gcr_ww1rsc_en;
  // rcc_ahb1d3amr
  wire [  31:0] rcc_ahb1d3amr_read;
  wire          rcc_ahb1d3amr_sel;
  wire          cur_rcc_ahb1d3amr_romamen;
  wire          nxt_rcc_ahb1d3amr_romamen;
  wire          rcc_ahb1d3amr_romamen_en;
  wire          cur_rcc_ahb1d3amr_tsmsamen;
  wire          nxt_rcc_ahb1d3amr_tsmsamen;
  wire          rcc_ahb1d3amr_tsmsamen_en;
  wire          cur_rcc_ahb1d3amr_smsamen;
  wire          nxt_rcc_ahb1d3amr_smsamen;
  wire          rcc_ahb1d3amr_smsamen_en;
  wire          cur_rcc_ahb1d3amr_xflashamen;
  wire          nxt_rcc_ahb1d3amr_xflashamen;
  wire          rcc_ahb1d3amr_xflashamen_en;
  wire          cur_rcc_ahb1d3amr_fftamen;
  wire          nxt_rcc_ahb1d3amr_fftamen;
  wire          rcc_ahb1d3amr_fftamen_en;
  wire          cur_rcc_ahb1d3amr_npuamen;
  wire          nxt_rcc_ahb1d3amr_npuamen;
  wire          rcc_ahb1d3amr_npuamen_en;
  wire          cur_rcc_ahb1d3amr_dma1amen;
  wire          nxt_rcc_ahb1d3amr_dma1amen;
  wire          rcc_ahb1d3amr_dma1amen_en;
  wire          cur_rcc_ahb1d3amr_dma2amen;
  wire          nxt_rcc_ahb1d3amr_dma2amen;
  wire          rcc_ahb1d3amr_dma2amen_en;
  wire          cur_rcc_ahb1d3amr_dmaschamen;
  wire          nxt_rcc_ahb1d3amr_dmaschamen;
  wire          rcc_ahb1d3amr_dmaschamen_en;
  wire          cur_rcc_ahb1d3amr_qspi1amen;
  wire          nxt_rcc_ahb1d3amr_qspi1amen;
  wire          rcc_ahb1d3amr_qspi1amen_en;
  wire          cur_rcc_ahb1d3amr_qspi2amen;
  wire          nxt_rcc_ahb1d3amr_qspi2amen;
  wire          rcc_ahb1d3amr_qspi2amen_en;
  wire          cur_rcc_ahb1d3amr_qspi3amen;
  wire          nxt_rcc_ahb1d3amr_qspi3amen;
  wire          rcc_ahb1d3amr_qspi3amen_en;
  wire          cur_rcc_ahb1d3amr_qspi4amen;
  wire          nxt_rcc_ahb1d3amr_qspi4amen;
  wire          rcc_ahb1d3amr_qspi4amen_en;
  wire          cur_rcc_ahb1d3amr_xspiamen;
  wire          nxt_rcc_ahb1d3amr_xspiamen;
  wire          rcc_ahb1d3amr_xspiamen_en;
  wire          cur_rcc_ahb1d3amr_mspiamen;
  wire          nxt_rcc_ahb1d3amr_mspiamen;
  wire          rcc_ahb1d3amr_mspiamen_en;
  wire          cur_rcc_ahb1d3amr_hacif_l1amen;
  wire          nxt_rcc_ahb1d3amr_hacif_l1amen;
  wire          rcc_ahb1d3amr_hacif_l1amen_en;
  wire          cur_rcc_ahb1d3amr_hacif_f1amen;
  wire          nxt_rcc_ahb1d3amr_hacif_f1amen;
  wire          rcc_ahb1d3amr_hacif_f1amen_en;
  wire          cur_rcc_ahb1d3amr_macamen;
  wire          nxt_rcc_ahb1d3amr_macamen;
  wire          rcc_ahb1d3amr_macamen_en;
  wire          cur_rcc_ahb1d3amr_lzamen;
  wire          nxt_rcc_ahb1d3amr_lzamen;
  wire          rcc_ahb1d3amr_lzamen_en;
  // rcc_apb1d3amr
  wire [  31:0] rcc_apb1d3amr_read;
  wire          rcc_apb1d3amr_sel;
  wire          cur_rcc_apb1d3amr_gtim1amen;
  wire          nxt_rcc_apb1d3amr_gtim1amen;
  wire          rcc_apb1d3amr_gtim1amen_en;
  wire          cur_rcc_apb1d3amr_gtim2amen;
  wire          nxt_rcc_apb1d3amr_gtim2amen;
  wire          rcc_apb1d3amr_gtim2amen_en;
  wire          cur_rcc_apb1d3amr_gtim3amen;
  wire          nxt_rcc_apb1d3amr_gtim3amen;
  wire          rcc_apb1d3amr_gtim3amen_en;
  wire          cur_rcc_apb1d3amr_gtim4amen;
  wire          nxt_rcc_apb1d3amr_gtim4amen;
  wire          rcc_apb1d3amr_gtim4amen_en;
  wire          cur_rcc_apb1d3amr_spi1amen;
  wire          nxt_rcc_apb1d3amr_spi1amen;
  wire          rcc_apb1d3amr_spi1amen_en;
  wire          cur_rcc_apb1d3amr_spi2amen;
  wire          nxt_rcc_apb1d3amr_spi2amen;
  wire          rcc_apb1d3amr_spi2amen_en;
  wire          cur_rcc_apb1d3amr_spi3amen;
  wire          nxt_rcc_apb1d3amr_spi3amen;
  wire          rcc_apb1d3amr_spi3amen_en;
  wire          cur_rcc_apb1d3amr_uart1amen;
  wire          nxt_rcc_apb1d3amr_uart1amen;
  wire          rcc_apb1d3amr_uart1amen_en;
  wire          cur_rcc_apb1d3amr_uart2amen;
  wire          nxt_rcc_apb1d3amr_uart2amen;
  wire          rcc_apb1d3amr_uart2amen_en;
  wire          cur_rcc_apb1d3amr_uart3amen;
  wire          nxt_rcc_apb1d3amr_uart3amen;
  wire          rcc_apb1d3amr_uart3amen_en;
  wire          cur_rcc_apb1d3amr_uart4amen;
  wire          nxt_rcc_apb1d3amr_uart4amen;
  wire          rcc_apb1d3amr_uart4amen_en;
  wire          cur_rcc_apb1d3amr_i2c1amen;
  wire          nxt_rcc_apb1d3amr_i2c1amen;
  wire          rcc_apb1d3amr_i2c1amen_en;
  wire          cur_rcc_apb1d3amr_gpio1amen;
  wire          nxt_rcc_apb1d3amr_gpio1amen;
  wire          rcc_apb1d3amr_gpio1amen_en;
  wire          cur_rcc_apb1d3amr_gpio2amen;
  wire          nxt_rcc_apb1d3amr_gpio2amen;
  wire          rcc_apb1d3amr_gpio2amen_en;
  wire          cur_rcc_apb1d3amr_gpio3amen;
  wire          nxt_rcc_apb1d3amr_gpio3amen;
  wire          rcc_apb1d3amr_gpio3amen_en;
  wire          cur_rcc_apb1d3amr_can1amen;
  wire          nxt_rcc_apb1d3amr_can1amen;
  wire          rcc_apb1d3amr_can1amen_en;
  wire          cur_rcc_apb1d3amr_can2amen;
  wire          nxt_rcc_apb1d3amr_can2amen;
  wire          rcc_apb1d3amr_can2amen_en;
  wire          cur_rcc_apb1d3amr_can3amen;
  wire          nxt_rcc_apb1d3amr_can3amen;
  wire          rcc_apb1d3amr_can3amen_en;
  // rcc_apb2d3amr
  wire [  31:0] rcc_apb2d3amr_read;
  wire          rcc_apb2d3amr_sel;
  wire          cur_rcc_apb2d3amr_gtim5amen;
  wire          nxt_rcc_apb2d3amr_gtim5amen;
  wire          rcc_apb2d3amr_gtim5amen_en;
  wire          cur_rcc_apb2d3amr_gtim6amen;
  wire          nxt_rcc_apb2d3amr_gtim6amen;
  wire          rcc_apb2d3amr_gtim6amen_en;
  wire          cur_rcc_apb2d3amr_spi4amen;
  wire          nxt_rcc_apb2d3amr_spi4amen;
  wire          rcc_apb2d3amr_spi4amen_en;
  wire          cur_rcc_apb2d3amr_spi5amen;
  wire          nxt_rcc_apb2d3amr_spi5amen;
  wire          rcc_apb2d3amr_spi5amen_en;
  wire          cur_rcc_apb2d3amr_uart5amen;
  wire          nxt_rcc_apb2d3amr_uart5amen;
  wire          rcc_apb2d3amr_uart5amen_en;
  wire          cur_rcc_apb2d3amr_uart6amen;
  wire          nxt_rcc_apb2d3amr_uart6amen;
  wire          rcc_apb2d3amr_uart6amen_en;
  wire          cur_rcc_apb2d3amr_uart7amen;
  wire          nxt_rcc_apb2d3amr_uart7amen;
  wire          rcc_apb2d3amr_uart7amen_en;
  wire          cur_rcc_apb2d3amr_uart8amen;
  wire          nxt_rcc_apb2d3amr_uart8amen;
  wire          rcc_apb2d3amr_uart8amen_en;
  wire          cur_rcc_apb2d3amr_i2c2amen;
  wire          nxt_rcc_apb2d3amr_i2c2amen;
  wire          rcc_apb2d3amr_i2c2amen_en;
  wire          cur_rcc_apb2d3amr_i2c3amen;
  wire          nxt_rcc_apb2d3amr_i2c3amen;
  wire          rcc_apb2d3amr_i2c3amen_en;
  wire          cur_rcc_apb2d3amr_can4amen;
  wire          nxt_rcc_apb2d3amr_can4amen;
  wire          rcc_apb2d3amr_can4amen_en;
  wire          cur_rcc_apb2d3amr_can5amen;
  wire          nxt_rcc_apb2d3amr_can5amen;
  wire          rcc_apb2d3amr_can5amen_en;
  wire          cur_rcc_apb2d3amr_can6amen;
  wire          nxt_rcc_apb2d3amr_can6amen;
  wire          rcc_apb2d3amr_can6amen_en;
  wire          cur_rcc_apb2d3amr_mpptamen;
  wire          nxt_rcc_apb2d3amr_mpptamen;
  wire          rcc_apb2d3amr_mpptamen_en;
  wire          cur_rcc_apb2d3amr_gpio4amen;
  wire          nxt_rcc_apb2d3amr_gpio4amen;
  wire          rcc_apb2d3amr_gpio4amen_en;
  wire          cur_rcc_apb2d3amr_gpio5amen;
  wire          nxt_rcc_apb2d3amr_gpio5amen;
  wire          rcc_apb2d3amr_gpio5amen_en;
  // rcc_apb3d3amr
  wire [  31:0] rcc_apb3d3amr_read;
  wire          rcc_apb3d3amr_sel;
  wire          cur_rcc_apb3d3amr_sysctlamen;
  wire          nxt_rcc_apb3d3amr_sysctlamen;
  wire          rcc_apb3d3amr_sysctlamen_en;
  wire          cur_rcc_apb3d3amr_wwdtamen;
  wire          nxt_rcc_apb3d3amr_wwdtamen;
  wire          rcc_apb3d3amr_wwdtamen_en;
  wire          cur_rcc_apb3d3amr_tim1amen;
  wire          nxt_rcc_apb3d3amr_tim1amen;
  wire          rcc_apb3d3amr_tim1amen_en;
  wire          cur_rcc_apb3d3amr_tim2amen;
  wire          nxt_rcc_apb3d3amr_tim2amen;
  wire          rcc_apb3d3amr_tim2amen_en;
  wire          cur_rcc_apb3d3amr_adccamen;
  wire          nxt_rcc_apb3d3amr_adccamen;
  wire          rcc_apb3d3amr_adccamen_en;
  wire          cur_rcc_apb3d3amr_gpio6amen;
  wire          nxt_rcc_apb3d3amr_gpio6amen;
  wire          rcc_apb3d3amr_gpio6amen_en;
  wire          cur_rcc_apb3d3amr_gpio7amen;
  wire          nxt_rcc_apb3d3amr_gpio7amen;
  wire          rcc_apb3d3amr_gpio7amen_en;
  wire          cur_rcc_apb3d3amr_gpio8amen;
  wire          nxt_rcc_apb3d3amr_gpio8amen;
  wire          rcc_apb3d3amr_gpio8amen_en;
  wire          cur_rcc_apb3d3amr_iwdtamen;
  wire          nxt_rcc_apb3d3amr_iwdtamen;
  wire          rcc_apb3d3amr_iwdtamen_en;
  wire          cur_rcc_apb3d3amr_rtcamen;
  wire          nxt_rcc_apb3d3amr_rtcamen;
  wire          rcc_apb3d3amr_rtcamen_en;
  // rcc_c1_rsr
  // rcc_c1_ahb1enr
  wire [  31:0] rcc_c1_ahb1enr_read;
  wire          rcc_c1_ahb1enr_sel;
  wire          cur_rcc_c1_ahb1enr_romen;
  wire          nxt_rcc_c1_ahb1enr_romen;
  wire          rcc_c1_ahb1enr_romen_en;
  wire          cur_rcc_c1_ahb1enr_tsmsen;
  wire          nxt_rcc_c1_ahb1enr_tsmsen;
  wire          rcc_c1_ahb1enr_tsmsen_en;
  wire          cur_rcc_c1_ahb1enr_smsen;
  wire          nxt_rcc_c1_ahb1enr_smsen;
  wire          rcc_c1_ahb1enr_smsen_en;
  wire          cur_rcc_c1_ahb1enr_xflashen;
  wire          nxt_rcc_c1_ahb1enr_xflashen;
  wire          rcc_c1_ahb1enr_xflashen_en;
  wire          cur_rcc_c1_ahb1enr_fften;
  wire          nxt_rcc_c1_ahb1enr_fften;
  wire          rcc_c1_ahb1enr_fften_en;
  wire          cur_rcc_c1_ahb1enr_npuen;
  wire          nxt_rcc_c1_ahb1enr_npuen;
  wire          rcc_c1_ahb1enr_npuen_en;
  wire          cur_rcc_c1_ahb1enr_dma1en;
  wire          nxt_rcc_c1_ahb1enr_dma1en;
  wire          rcc_c1_ahb1enr_dma1en_en;
  wire          cur_rcc_c1_ahb1enr_dma2en;
  wire          nxt_rcc_c1_ahb1enr_dma2en;
  wire          rcc_c1_ahb1enr_dma2en_en;
  wire          cur_rcc_c1_ahb1enr_dmaschen;
  wire          nxt_rcc_c1_ahb1enr_dmaschen;
  wire          rcc_c1_ahb1enr_dmaschen_en;
  wire          cur_rcc_c1_ahb1enr_qspi1en;
  wire          nxt_rcc_c1_ahb1enr_qspi1en;
  wire          rcc_c1_ahb1enr_qspi1en_en;
  wire          cur_rcc_c1_ahb1enr_qspi2en;
  wire          nxt_rcc_c1_ahb1enr_qspi2en;
  wire          rcc_c1_ahb1enr_qspi2en_en;
  wire          cur_rcc_c1_ahb1enr_qspi3en;
  wire          nxt_rcc_c1_ahb1enr_qspi3en;
  wire          rcc_c1_ahb1enr_qspi3en_en;
  wire          cur_rcc_c1_ahb1enr_qspi4en;
  wire          nxt_rcc_c1_ahb1enr_qspi4en;
  wire          rcc_c1_ahb1enr_qspi4en_en;
  wire          cur_rcc_c1_ahb1enr_xspien;
  wire          nxt_rcc_c1_ahb1enr_xspien;
  wire          rcc_c1_ahb1enr_xspien_en;
  wire          cur_rcc_c1_ahb1enr_mspien;
  wire          nxt_rcc_c1_ahb1enr_mspien;
  wire          rcc_c1_ahb1enr_mspien_en;
  wire          cur_rcc_c1_ahb1enr_hacif_l1en;
  wire          nxt_rcc_c1_ahb1enr_hacif_l1en;
  wire          rcc_c1_ahb1enr_hacif_l1en_en;
  wire          cur_rcc_c1_ahb1enr_hacif_f1en;
  wire          nxt_rcc_c1_ahb1enr_hacif_f1en;
  wire          rcc_c1_ahb1enr_hacif_f1en_en;
  wire          cur_rcc_c1_ahb1enr_macen;
  wire          nxt_rcc_c1_ahb1enr_macen;
  wire          rcc_c1_ahb1enr_macen_en;
  wire          cur_rcc_c1_ahb1enr_lzen;
  wire          nxt_rcc_c1_ahb1enr_lzen;
  wire          rcc_c1_ahb1enr_lzen_en;
  // rcc_c1_apb1enr
  wire [  31:0] rcc_c1_apb1enr_read;
  wire          rcc_c1_apb1enr_sel;
  wire          cur_rcc_c1_apb1enr_gtim1en;
  wire          nxt_rcc_c1_apb1enr_gtim1en;
  wire          rcc_c1_apb1enr_gtim1en_en;
  wire          cur_rcc_c1_apb1enr_gtim2en;
  wire          nxt_rcc_c1_apb1enr_gtim2en;
  wire          rcc_c1_apb1enr_gtim2en_en;
  wire          cur_rcc_c1_apb1enr_gtim3en;
  wire          nxt_rcc_c1_apb1enr_gtim3en;
  wire          rcc_c1_apb1enr_gtim3en_en;
  wire          cur_rcc_c1_apb1enr_gtim4en;
  wire          nxt_rcc_c1_apb1enr_gtim4en;
  wire          rcc_c1_apb1enr_gtim4en_en;
  wire          cur_rcc_c1_apb1enr_spi1en;
  wire          nxt_rcc_c1_apb1enr_spi1en;
  wire          rcc_c1_apb1enr_spi1en_en;
  wire          cur_rcc_c1_apb1enr_spi2en;
  wire          nxt_rcc_c1_apb1enr_spi2en;
  wire          rcc_c1_apb1enr_spi2en_en;
  wire          cur_rcc_c1_apb1enr_spi3en;
  wire          nxt_rcc_c1_apb1enr_spi3en;
  wire          rcc_c1_apb1enr_spi3en_en;
  wire          cur_rcc_c1_apb1enr_uart1en;
  wire          nxt_rcc_c1_apb1enr_uart1en;
  wire          rcc_c1_apb1enr_uart1en_en;
  wire          cur_rcc_c1_apb1enr_uart2en;
  wire          nxt_rcc_c1_apb1enr_uart2en;
  wire          rcc_c1_apb1enr_uart2en_en;
  wire          cur_rcc_c1_apb1enr_uart3en;
  wire          nxt_rcc_c1_apb1enr_uart3en;
  wire          rcc_c1_apb1enr_uart3en_en;
  wire          cur_rcc_c1_apb1enr_uart4en;
  wire          nxt_rcc_c1_apb1enr_uart4en;
  wire          rcc_c1_apb1enr_uart4en_en;
  wire          cur_rcc_c1_apb1enr_i2c1en;
  wire          nxt_rcc_c1_apb1enr_i2c1en;
  wire          rcc_c1_apb1enr_i2c1en_en;
  wire          cur_rcc_c1_apb1enr_gpio1en;
  wire          nxt_rcc_c1_apb1enr_gpio1en;
  wire          rcc_c1_apb1enr_gpio1en_en;
  wire          cur_rcc_c1_apb1enr_gpio2en;
  wire          nxt_rcc_c1_apb1enr_gpio2en;
  wire          rcc_c1_apb1enr_gpio2en_en;
  wire          cur_rcc_c1_apb1enr_gpio3en;
  wire          nxt_rcc_c1_apb1enr_gpio3en;
  wire          rcc_c1_apb1enr_gpio3en_en;
  wire          cur_rcc_c1_apb1enr_can1en;
  wire          nxt_rcc_c1_apb1enr_can1en;
  wire          rcc_c1_apb1enr_can1en_en;
  wire          cur_rcc_c1_apb1enr_can2en;
  wire          nxt_rcc_c1_apb1enr_can2en;
  wire          rcc_c1_apb1enr_can2en_en;
  wire          cur_rcc_c1_apb1enr_can3en;
  wire          nxt_rcc_c1_apb1enr_can3en;
  wire          rcc_c1_apb1enr_can3en_en;
  // rcc_c1_apb2enr
  wire [  31:0] rcc_c1_apb2enr_read;
  wire          rcc_c1_apb2enr_sel;
  wire          cur_rcc_c1_apb2enr_gtim5en;
  wire          nxt_rcc_c1_apb2enr_gtim5en;
  wire          rcc_c1_apb2enr_gtim5en_en;
  wire          cur_rcc_c1_apb2enr_gtim6en;
  wire          nxt_rcc_c1_apb2enr_gtim6en;
  wire          rcc_c1_apb2enr_gtim6en_en;
  wire          cur_rcc_c1_apb2enr_spi4en;
  wire          nxt_rcc_c1_apb2enr_spi4en;
  wire          rcc_c1_apb2enr_spi4en_en;
  wire          cur_rcc_c1_apb2enr_spi5en;
  wire          nxt_rcc_c1_apb2enr_spi5en;
  wire          rcc_c1_apb2enr_spi5en_en;
  wire          cur_rcc_c1_apb2enr_uart5en;
  wire          nxt_rcc_c1_apb2enr_uart5en;
  wire          rcc_c1_apb2enr_uart5en_en;
  wire          cur_rcc_c1_apb2enr_uart6en;
  wire          nxt_rcc_c1_apb2enr_uart6en;
  wire          rcc_c1_apb2enr_uart6en_en;
  wire          cur_rcc_c1_apb2enr_uart7en;
  wire          nxt_rcc_c1_apb2enr_uart7en;
  wire          rcc_c1_apb2enr_uart7en_en;
  wire          cur_rcc_c1_apb2enr_uart8en;
  wire          nxt_rcc_c1_apb2enr_uart8en;
  wire          rcc_c1_apb2enr_uart8en_en;
  wire          cur_rcc_c1_apb2enr_i2c2en;
  wire          nxt_rcc_c1_apb2enr_i2c2en;
  wire          rcc_c1_apb2enr_i2c2en_en;
  wire          cur_rcc_c1_apb2enr_i2c3en;
  wire          nxt_rcc_c1_apb2enr_i2c3en;
  wire          rcc_c1_apb2enr_i2c3en_en;
  wire          cur_rcc_c1_apb2enr_can4en;
  wire          nxt_rcc_c1_apb2enr_can4en;
  wire          rcc_c1_apb2enr_can4en_en;
  wire          cur_rcc_c1_apb2enr_can5en;
  wire          nxt_rcc_c1_apb2enr_can5en;
  wire          rcc_c1_apb2enr_can5en_en;
  wire          cur_rcc_c1_apb2enr_can6en;
  wire          nxt_rcc_c1_apb2enr_can6en;
  wire          rcc_c1_apb2enr_can6en_en;
  wire          cur_rcc_c1_apb2enr_mppten;
  wire          nxt_rcc_c1_apb2enr_mppten;
  wire          rcc_c1_apb2enr_mppten_en;
  wire          cur_rcc_c1_apb2enr_gpio4en;
  wire          nxt_rcc_c1_apb2enr_gpio4en;
  wire          rcc_c1_apb2enr_gpio4en_en;
  wire          cur_rcc_c1_apb2enr_gpio5en;
  wire          nxt_rcc_c1_apb2enr_gpio5en;
  wire          rcc_c1_apb2enr_gpio5en_en;
  // rcc_c1_apb3enr
  wire [  31:0] rcc_c1_apb3enr_read;
  wire          rcc_c1_apb3enr_sel;
  wire          cur_rcc_c1_apb3enr_sysctlen;
  wire          nxt_rcc_c1_apb3enr_sysctlen;
  wire          rcc_c1_apb3enr_sysctlen_en;
  wire          cur_rcc_c1_apb3enr_wwdten;
  wire          nxt_rcc_c1_apb3enr_wwdten;
  wire          rcc_c1_apb3enr_wwdten_en;
  wire          cur_rcc_c1_apb3enr_tim1en;
  wire          nxt_rcc_c1_apb3enr_tim1en;
  wire          rcc_c1_apb3enr_tim1en_en;
  wire          cur_rcc_c1_apb3enr_tim2en;
  wire          nxt_rcc_c1_apb3enr_tim2en;
  wire          rcc_c1_apb3enr_tim2en_en;
  wire          cur_rcc_c1_apb3enr_adccen;
  wire          nxt_rcc_c1_apb3enr_adccen;
  wire          rcc_c1_apb3enr_adccen_en;
  wire          cur_rcc_c1_apb3enr_gpio6en;
  wire          nxt_rcc_c1_apb3enr_gpio6en;
  wire          rcc_c1_apb3enr_gpio6en_en;
  wire          cur_rcc_c1_apb3enr_gpio7en;
  wire          nxt_rcc_c1_apb3enr_gpio7en;
  wire          rcc_c1_apb3enr_gpio7en_en;
  wire          cur_rcc_c1_apb3enr_gpio8en;
  wire          nxt_rcc_c1_apb3enr_gpio8en;
  wire          rcc_c1_apb3enr_gpio8en_en;
  // rcc_c1_ahb1lpenr
  wire [  31:0] rcc_c1_ahb1lpenr_read;
  wire          rcc_c1_ahb1lpenr_sel;
  wire          cur_rcc_c1_ahb1lpenr_romlpen;
  wire          nxt_rcc_c1_ahb1lpenr_romlpen;
  wire          rcc_c1_ahb1lpenr_romlpen_en;
  wire          cur_rcc_c1_ahb1lpenr_tsmslpen;
  wire          nxt_rcc_c1_ahb1lpenr_tsmslpen;
  wire          rcc_c1_ahb1lpenr_tsmslpen_en;
  wire          cur_rcc_c1_ahb1lpenr_smslpen;
  wire          nxt_rcc_c1_ahb1lpenr_smslpen;
  wire          rcc_c1_ahb1lpenr_smslpen_en;
  wire          cur_rcc_c1_ahb1lpenr_xflashlpen;
  wire          nxt_rcc_c1_ahb1lpenr_xflashlpen;
  wire          rcc_c1_ahb1lpenr_xflashlpen_en;
  wire          cur_rcc_c1_ahb1lpenr_fftlpen;
  wire          nxt_rcc_c1_ahb1lpenr_fftlpen;
  wire          rcc_c1_ahb1lpenr_fftlpen_en;
  wire          cur_rcc_c1_ahb1lpenr_npulpen;
  wire          nxt_rcc_c1_ahb1lpenr_npulpen;
  wire          rcc_c1_ahb1lpenr_npulpen_en;
  wire          cur_rcc_c1_ahb1lpenr_dma1lpen;
  wire          nxt_rcc_c1_ahb1lpenr_dma1lpen;
  wire          rcc_c1_ahb1lpenr_dma1lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_dma2lpen;
  wire          nxt_rcc_c1_ahb1lpenr_dma2lpen;
  wire          rcc_c1_ahb1lpenr_dma2lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_dmaschlpen;
  wire          nxt_rcc_c1_ahb1lpenr_dmaschlpen;
  wire          rcc_c1_ahb1lpenr_dmaschlpen_en;
  wire          cur_rcc_c1_ahb1lpenr_qspi1lpen;
  wire          nxt_rcc_c1_ahb1lpenr_qspi1lpen;
  wire          rcc_c1_ahb1lpenr_qspi1lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_qspi2lpen;
  wire          nxt_rcc_c1_ahb1lpenr_qspi2lpen;
  wire          rcc_c1_ahb1lpenr_qspi2lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_qspi3lpen;
  wire          nxt_rcc_c1_ahb1lpenr_qspi3lpen;
  wire          rcc_c1_ahb1lpenr_qspi3lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_qspi4lpen;
  wire          nxt_rcc_c1_ahb1lpenr_qspi4lpen;
  wire          rcc_c1_ahb1lpenr_qspi4lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_xspilpen;
  wire          nxt_rcc_c1_ahb1lpenr_xspilpen;
  wire          rcc_c1_ahb1lpenr_xspilpen_en;
  wire          cur_rcc_c1_ahb1lpenr_mspilpen;
  wire          nxt_rcc_c1_ahb1lpenr_mspilpen;
  wire          rcc_c1_ahb1lpenr_mspilpen_en;
  wire          cur_rcc_c1_ahb1lpenr_hacif_l1lpen;
  wire          nxt_rcc_c1_ahb1lpenr_hacif_l1lpen;
  wire          rcc_c1_ahb1lpenr_hacif_l1lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_hacif_f1lpen;
  wire          nxt_rcc_c1_ahb1lpenr_hacif_f1lpen;
  wire          rcc_c1_ahb1lpenr_hacif_f1lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_maclpen;
  wire          nxt_rcc_c1_ahb1lpenr_maclpen;
  wire          rcc_c1_ahb1lpenr_maclpen_en;
  wire          cur_rcc_c1_ahb1lpenr_lzlpen;
  wire          nxt_rcc_c1_ahb1lpenr_lzlpen;
  wire          rcc_c1_ahb1lpenr_lzlpen_en;
  // rcc_c1_apb1lpenr
  wire [  31:0] rcc_c1_apb1lpenr_read;
  wire          rcc_c1_apb1lpenr_sel;
  wire          cur_rcc_c1_apb1lpenr_gtim1lpen;
  wire          nxt_rcc_c1_apb1lpenr_gtim1lpen;
  wire          rcc_c1_apb1lpenr_gtim1lpen_en;
  wire          cur_rcc_c1_apb1lpenr_gtim2lpen;
  wire          nxt_rcc_c1_apb1lpenr_gtim2lpen;
  wire          rcc_c1_apb1lpenr_gtim2lpen_en;
  wire          cur_rcc_c1_apb1lpenr_gtim3lpen;
  wire          nxt_rcc_c1_apb1lpenr_gtim3lpen;
  wire          rcc_c1_apb1lpenr_gtim3lpen_en;
  wire          cur_rcc_c1_apb1lpenr_gtim4lpen;
  wire          nxt_rcc_c1_apb1lpenr_gtim4lpen;
  wire          rcc_c1_apb1lpenr_gtim4lpen_en;
  wire          cur_rcc_c1_apb1lpenr_spi1lpen;
  wire          nxt_rcc_c1_apb1lpenr_spi1lpen;
  wire          rcc_c1_apb1lpenr_spi1lpen_en;
  wire          cur_rcc_c1_apb1lpenr_spi2lpen;
  wire          nxt_rcc_c1_apb1lpenr_spi2lpen;
  wire          rcc_c1_apb1lpenr_spi2lpen_en;
  wire          cur_rcc_c1_apb1lpenr_spi3lpen;
  wire          nxt_rcc_c1_apb1lpenr_spi3lpen;
  wire          rcc_c1_apb1lpenr_spi3lpen_en;
  wire          cur_rcc_c1_apb1lpenr_uart1lpen;
  wire          nxt_rcc_c1_apb1lpenr_uart1lpen;
  wire          rcc_c1_apb1lpenr_uart1lpen_en;
  wire          cur_rcc_c1_apb1lpenr_uart2lpen;
  wire          nxt_rcc_c1_apb1lpenr_uart2lpen;
  wire          rcc_c1_apb1lpenr_uart2lpen_en;
  wire          cur_rcc_c1_apb1lpenr_uart3lpen;
  wire          nxt_rcc_c1_apb1lpenr_uart3lpen;
  wire          rcc_c1_apb1lpenr_uart3lpen_en;
  wire          cur_rcc_c1_apb1lpenr_uart4lpen;
  wire          nxt_rcc_c1_apb1lpenr_uart4lpen;
  wire          rcc_c1_apb1lpenr_uart4lpen_en;
  wire          cur_rcc_c1_apb1lpenr_i2c1lpen;
  wire          nxt_rcc_c1_apb1lpenr_i2c1lpen;
  wire          rcc_c1_apb1lpenr_i2c1lpen_en;
  wire          cur_rcc_c1_apb1lpenr_gpio1lpen;
  wire          nxt_rcc_c1_apb1lpenr_gpio1lpen;
  wire          rcc_c1_apb1lpenr_gpio1lpen_en;
  wire          cur_rcc_c1_apb1lpenr_gpio2lpen;
  wire          nxt_rcc_c1_apb1lpenr_gpio2lpen;
  wire          rcc_c1_apb1lpenr_gpio2lpen_en;
  wire          cur_rcc_c1_apb1lpenr_gpio3lpen;
  wire          nxt_rcc_c1_apb1lpenr_gpio3lpen;
  wire          rcc_c1_apb1lpenr_gpio3lpen_en;
  wire          cur_rcc_c1_apb1lpenr_can1lpen;
  wire          nxt_rcc_c1_apb1lpenr_can1lpen;
  wire          rcc_c1_apb1lpenr_can1lpen_en;
  wire          cur_rcc_c1_apb1lpenr_can2lpen;
  wire          nxt_rcc_c1_apb1lpenr_can2lpen;
  wire          rcc_c1_apb1lpenr_can2lpen_en;
  wire          cur_rcc_c1_apb1lpenr_can3lpen;
  wire          nxt_rcc_c1_apb1lpenr_can3lpen;
  wire          rcc_c1_apb1lpenr_can3lpen_en;
  // rcc_c1_apb2lpenr
  wire [  31:0] rcc_c1_apb2lpenr_read;
  wire          rcc_c1_apb2lpenr_sel;
  wire          cur_rcc_c1_apb2lpenr_gtim5lpen;
  wire          nxt_rcc_c1_apb2lpenr_gtim5lpen;
  wire          rcc_c1_apb2lpenr_gtim5lpen_en;
  wire          cur_rcc_c1_apb2lpenr_gtim6lpen;
  wire          nxt_rcc_c1_apb2lpenr_gtim6lpen;
  wire          rcc_c1_apb2lpenr_gtim6lpen_en;
  wire          cur_rcc_c1_apb2lpenr_spi4lpen;
  wire          nxt_rcc_c1_apb2lpenr_spi4lpen;
  wire          rcc_c1_apb2lpenr_spi4lpen_en;
  wire          cur_rcc_c1_apb2lpenr_spi5lpen;
  wire          nxt_rcc_c1_apb2lpenr_spi5lpen;
  wire          rcc_c1_apb2lpenr_spi5lpen_en;
  wire          cur_rcc_c1_apb2lpenr_uart5lpen;
  wire          nxt_rcc_c1_apb2lpenr_uart5lpen;
  wire          rcc_c1_apb2lpenr_uart5lpen_en;
  wire          cur_rcc_c1_apb2lpenr_uart6lpen;
  wire          nxt_rcc_c1_apb2lpenr_uart6lpen;
  wire          rcc_c1_apb2lpenr_uart6lpen_en;
  wire          cur_rcc_c1_apb2lpenr_uart7lpen;
  wire          nxt_rcc_c1_apb2lpenr_uart7lpen;
  wire          rcc_c1_apb2lpenr_uart7lpen_en;
  wire          cur_rcc_c1_apb2lpenr_uart8lpen;
  wire          nxt_rcc_c1_apb2lpenr_uart8lpen;
  wire          rcc_c1_apb2lpenr_uart8lpen_en;
  wire          cur_rcc_c1_apb2lpenr_i2c2lpen;
  wire          nxt_rcc_c1_apb2lpenr_i2c2lpen;
  wire          rcc_c1_apb2lpenr_i2c2lpen_en;
  wire          cur_rcc_c1_apb2lpenr_i2c3lpen;
  wire          nxt_rcc_c1_apb2lpenr_i2c3lpen;
  wire          rcc_c1_apb2lpenr_i2c3lpen_en;
  wire          cur_rcc_c1_apb2lpenr_can4lpen;
  wire          nxt_rcc_c1_apb2lpenr_can4lpen;
  wire          rcc_c1_apb2lpenr_can4lpen_en;
  wire          cur_rcc_c1_apb2lpenr_can5lpen;
  wire          nxt_rcc_c1_apb2lpenr_can5lpen;
  wire          rcc_c1_apb2lpenr_can5lpen_en;
  wire          cur_rcc_c1_apb2lpenr_can6lpen;
  wire          nxt_rcc_c1_apb2lpenr_can6lpen;
  wire          rcc_c1_apb2lpenr_can6lpen_en;
  wire          cur_rcc_c1_apb2lpenr_mpptlpen;
  wire          nxt_rcc_c1_apb2lpenr_mpptlpen;
  wire          rcc_c1_apb2lpenr_mpptlpen_en;
  wire          cur_rcc_c1_apb2lpenr_gpio4lpen;
  wire          nxt_rcc_c1_apb2lpenr_gpio4lpen;
  wire          rcc_c1_apb2lpenr_gpio4lpen_en;
  wire          cur_rcc_c1_apb2lpenr_gpio5lpen;
  wire          nxt_rcc_c1_apb2lpenr_gpio5lpen;
  wire          rcc_c1_apb2lpenr_gpio5lpen_en;
  // rcc_c1_apb3lpenr
  wire [  31:0] rcc_c1_apb3lpenr_read;
  wire          rcc_c1_apb3lpenr_sel;
  wire          cur_rcc_c1_apb3lpenr_sysctllpen;
  wire          nxt_rcc_c1_apb3lpenr_sysctllpen;
  wire          rcc_c1_apb3lpenr_sysctllpen_en;
  wire          cur_rcc_c1_apb3lpenr_wwdtlpen;
  wire          nxt_rcc_c1_apb3lpenr_wwdtlpen;
  wire          rcc_c1_apb3lpenr_wwdtlpen_en;
  wire          cur_rcc_c1_apb3lpenr_tim1lpen;
  wire          nxt_rcc_c1_apb3lpenr_tim1lpen;
  wire          rcc_c1_apb3lpenr_tim1lpen_en;
  wire          cur_rcc_c1_apb3lpenr_tim2lpen;
  wire          nxt_rcc_c1_apb3lpenr_tim2lpen;
  wire          rcc_c1_apb3lpenr_tim2lpen_en;
  wire          cur_rcc_c1_apb3lpenr_adcclpen;
  wire          nxt_rcc_c1_apb3lpenr_adcclpen;
  wire          rcc_c1_apb3lpenr_adcclpen_en;
  wire          cur_rcc_c1_apb3lpenr_gpio6lpen;
  wire          nxt_rcc_c1_apb3lpenr_gpio6lpen;
  wire          rcc_c1_apb3lpenr_gpio6lpen_en;
  wire          cur_rcc_c1_apb3lpenr_gpio7lpen;
  wire          nxt_rcc_c1_apb3lpenr_gpio7lpen;
  wire          rcc_c1_apb3lpenr_gpio7lpen_en;
  wire          cur_rcc_c1_apb3lpenr_gpio8lpen;
  wire          nxt_rcc_c1_apb3lpenr_gpio8lpen;
  wire          rcc_c1_apb3lpenr_gpio8lpen_en;


  // rcc_c2_ahb1enr
  wire [  31:0] rcc_c2_ahb1enr_read;
  wire          rcc_c2_ahb1enr_sel;
  wire          cur_rcc_c2_ahb1enr_romen;
  wire          nxt_rcc_c2_ahb1enr_romen;
  wire          rcc_c2_ahb1enr_romen_en;
  wire          cur_rcc_c2_ahb1enr_tsmsen;
  wire          nxt_rcc_c2_ahb1enr_tsmsen;
  wire          rcc_c2_ahb1enr_tsmsen_en;
  wire          cur_rcc_c2_ahb1enr_smsen;
  wire          nxt_rcc_c2_ahb1enr_smsen;
  wire          rcc_c2_ahb1enr_smsen_en;
  wire          cur_rcc_c2_ahb1enr_xflashen;
  wire          nxt_rcc_c2_ahb1enr_xflashen;
  wire          rcc_c2_ahb1enr_xflashen_en;
  wire          cur_rcc_c2_ahb1enr_fften;
  wire          nxt_rcc_c2_ahb1enr_fften;
  wire          rcc_c2_ahb1enr_fften_en;
  wire          cur_rcc_c2_ahb1enr_npuen;
  wire          nxt_rcc_c2_ahb1enr_npuen;
  wire          rcc_c2_ahb1enr_npuen_en;
  wire          cur_rcc_c2_ahb1enr_dma1en;
  wire          nxt_rcc_c2_ahb1enr_dma1en;
  wire          rcc_c2_ahb1enr_dma1en_en;
  wire          cur_rcc_c2_ahb1enr_dma2en;
  wire          nxt_rcc_c2_ahb1enr_dma2en;
  wire          rcc_c2_ahb1enr_dma2en_en;
  wire          cur_rcc_c2_ahb1enr_dmaschen;
  wire          nxt_rcc_c2_ahb1enr_dmaschen;
  wire          rcc_c2_ahb1enr_dmaschen_en;
  wire          cur_rcc_c2_ahb1enr_qspi1en;
  wire          nxt_rcc_c2_ahb1enr_qspi1en;
  wire          rcc_c2_ahb1enr_qspi1en_en;
  wire          cur_rcc_c2_ahb1enr_qspi2en;
  wire          nxt_rcc_c2_ahb1enr_qspi2en;
  wire          rcc_c2_ahb1enr_qspi2en_en;
  wire          cur_rcc_c2_ahb1enr_qspi3en;
  wire          nxt_rcc_c2_ahb1enr_qspi3en;
  wire          rcc_c2_ahb1enr_qspi3en_en;
  wire          cur_rcc_c2_ahb1enr_qspi4en;
  wire          nxt_rcc_c2_ahb1enr_qspi4en;
  wire          rcc_c2_ahb1enr_qspi4en_en;
  wire          cur_rcc_c2_ahb1enr_xspien;
  wire          nxt_rcc_c2_ahb1enr_xspien;
  wire          rcc_c2_ahb1enr_xspien_en;
  wire          cur_rcc_c2_ahb1enr_mspien;
  wire          nxt_rcc_c2_ahb1enr_mspien;
  wire          rcc_c2_ahb1enr_mspien_en;
  wire          cur_rcc_c2_ahb1enr_hacif_l1en;
  wire          nxt_rcc_c2_ahb1enr_hacif_l1en;
  wire          rcc_c2_ahb1enr_hacif_l1en_en;
  wire          cur_rcc_c2_ahb1enr_hacif_f1en;
  wire          nxt_rcc_c2_ahb1enr_hacif_f1en;
  wire          rcc_c2_ahb1enr_hacif_f1en_en;
  wire          cur_rcc_c2_ahb1enr_macen;
  wire          nxt_rcc_c2_ahb1enr_macen;
  wire          rcc_c2_ahb1enr_macen_en;
  wire          cur_rcc_c2_ahb1enr_lzen;
  wire          nxt_rcc_c2_ahb1enr_lzen;
  wire          rcc_c2_ahb1enr_lzen_en;
  // rcc_c2_apb1enr
  wire [  31:0] rcc_c2_apb1enr_read;
  wire          rcc_c2_apb1enr_sel;
  wire          cur_rcc_c2_apb1enr_gtim1en;
  wire          nxt_rcc_c2_apb1enr_gtim1en;
  wire          rcc_c2_apb1enr_gtim1en_en;
  wire          cur_rcc_c2_apb1enr_gtim2en;
  wire          nxt_rcc_c2_apb1enr_gtim2en;
  wire          rcc_c2_apb1enr_gtim2en_en;
  wire          cur_rcc_c2_apb1enr_gtim3en;
  wire          nxt_rcc_c2_apb1enr_gtim3en;
  wire          rcc_c2_apb1enr_gtim3en_en;
  wire          cur_rcc_c2_apb1enr_gtim4en;
  wire          nxt_rcc_c2_apb1enr_gtim4en;
  wire          rcc_c2_apb1enr_gtim4en_en;
  wire          cur_rcc_c2_apb1enr_spi1en;
  wire          nxt_rcc_c2_apb1enr_spi1en;
  wire          rcc_c2_apb1enr_spi1en_en;
  wire          cur_rcc_c2_apb1enr_spi2en;
  wire          nxt_rcc_c2_apb1enr_spi2en;
  wire          rcc_c2_apb1enr_spi2en_en;
  wire          cur_rcc_c2_apb1enr_spi3en;
  wire          nxt_rcc_c2_apb1enr_spi3en;
  wire          rcc_c2_apb1enr_spi3en_en;
  wire          cur_rcc_c2_apb1enr_uart1en;
  wire          nxt_rcc_c2_apb1enr_uart1en;
  wire          rcc_c2_apb1enr_uart1en_en;
  wire          cur_rcc_c2_apb1enr_uart2en;
  wire          nxt_rcc_c2_apb1enr_uart2en;
  wire          rcc_c2_apb1enr_uart2en_en;
  wire          cur_rcc_c2_apb1enr_uart3en;
  wire          nxt_rcc_c2_apb1enr_uart3en;
  wire          rcc_c2_apb1enr_uart3en_en;
  wire          cur_rcc_c2_apb1enr_uart4en;
  wire          nxt_rcc_c2_apb1enr_uart4en;
  wire          rcc_c2_apb1enr_uart4en_en;
  wire          cur_rcc_c2_apb1enr_i2c2en;
  wire          nxt_rcc_c2_apb1enr_i2c2en;
  wire          rcc_c2_apb1enr_i2c2en_en;
  wire          cur_rcc_c2_apb1enr_gpio1en;
  wire          nxt_rcc_c2_apb1enr_gpio1en;
  wire          rcc_c2_apb1enr_gpio1en_en;
  wire          cur_rcc_c2_apb1enr_gpio2en;
  wire          nxt_rcc_c2_apb1enr_gpio2en;
  wire          rcc_c2_apb1enr_gpio2en_en;
  wire          cur_rcc_c2_apb1enr_gpio3en;
  wire          nxt_rcc_c2_apb1enr_gpio3en;
  wire          rcc_c2_apb1enr_gpio3en_en;
  wire          cur_rcc_c2_apb1enr_can1en;
  wire          nxt_rcc_c2_apb1enr_can1en;
  wire          rcc_c2_apb1enr_can1en_en;
  wire          cur_rcc_c2_apb1enr_can2en;
  wire          nxt_rcc_c2_apb1enr_can2en;
  wire          rcc_c2_apb1enr_can2en_en;
  wire          cur_rcc_c2_apb1enr_can3en;
  wire          nxt_rcc_c2_apb1enr_can3en;
  wire          rcc_c2_apb1enr_can3en_en;
  // rcc_c2_apb2enr
  wire [  31:0] rcc_c2_apb2enr_read;
  wire          rcc_c2_apb2enr_sel;
  wire          cur_rcc_c2_apb2enr_gtim5en;
  wire          nxt_rcc_c2_apb2enr_gtim5en;
  wire          rcc_c2_apb2enr_gtim5en_en;
  wire          cur_rcc_c2_apb2enr_gtim6en;
  wire          nxt_rcc_c2_apb2enr_gtim6en;
  wire          rcc_c2_apb2enr_gtim6en_en;
  wire          cur_rcc_c2_apb2enr_spi4en;
  wire          nxt_rcc_c2_apb2enr_spi4en;
  wire          rcc_c2_apb2enr_spi4en_en;
  wire          cur_rcc_c2_apb2enr_spi5en;
  wire          nxt_rcc_c2_apb2enr_spi5en;
  wire          rcc_c2_apb2enr_spi5en_en;
  wire          cur_rcc_c2_apb2enr_uart5en;
  wire          nxt_rcc_c2_apb2enr_uart5en;
  wire          rcc_c2_apb2enr_uart5en_en;
  wire          cur_rcc_c2_apb2enr_uart6en;
  wire          nxt_rcc_c2_apb2enr_uart6en;
  wire          rcc_c2_apb2enr_uart6en_en;
  wire          cur_rcc_c2_apb2enr_uart7en;
  wire          nxt_rcc_c2_apb2enr_uart7en;
  wire          rcc_c2_apb2enr_uart7en_en;
  wire          cur_rcc_c2_apb2enr_uart8en;
  wire          nxt_rcc_c2_apb2enr_uart8en;
  wire          rcc_c2_apb2enr_uart8en_en;
  wire          cur_rcc_c2_apb2enr_i2c2en;
  wire          nxt_rcc_c2_apb2enr_i2c2en;
  wire          rcc_c2_apb2enr_i2c2en_en;
  wire          cur_rcc_c2_apb2enr_i2c3en;
  wire          nxt_rcc_c2_apb2enr_i2c3en;
  wire          rcc_c2_apb2enr_i2c3en_en;
  wire          cur_rcc_c2_apb2enr_can4en;
  wire          nxt_rcc_c2_apb2enr_can4en;
  wire          rcc_c2_apb2enr_can4en_en;
  wire          cur_rcc_c2_apb2enr_can5en;
  wire          nxt_rcc_c2_apb2enr_can5en;
  wire          rcc_c2_apb2enr_can5en_en;
  wire          cur_rcc_c2_apb2enr_can6en;
  wire          nxt_rcc_c2_apb2enr_can6en;
  wire          rcc_c2_apb2enr_can6en_en;
  wire          cur_rcc_c2_apb2enr_mppten;
  wire          nxt_rcc_c2_apb2enr_mppten;
  wire          rcc_c2_apb2enr_mppten_en;
  wire          cur_rcc_c2_apb2enr_gpio4en;
  wire          nxt_rcc_c2_apb2enr_gpio4en;
  wire          rcc_c2_apb2enr_gpio4en_en;
  wire          cur_rcc_c2_apb2enr_gpio5en;
  wire          nxt_rcc_c2_apb2enr_gpio5en;
  wire          rcc_c2_apb2enr_gpio5en_en;
  // rcc_c2_apb3enr
  wire [  31:0] rcc_c2_apb3enr_read;
  wire          rcc_c2_apb3enr_sel;
  wire          cur_rcc_c2_apb3enr_sysctlen;
  wire          nxt_rcc_c2_apb3enr_sysctlen;
  wire          rcc_c2_apb3enr_sysctlen_en;
  wire          cur_rcc_c2_apb3enr_wwdten;
  wire          nxt_rcc_c2_apb3enr_wwdten;
  wire          rcc_c2_apb3enr_wwdten_en;
  wire          cur_rcc_c2_apb3enr_tim1en;
  wire          nxt_rcc_c2_apb3enr_tim1en;
  wire          rcc_c2_apb3enr_tim1en_en;
  wire          cur_rcc_c2_apb3enr_tim2en;
  wire          nxt_rcc_c2_apb3enr_tim2en;
  wire          rcc_c2_apb3enr_tim2en_en;
  wire          cur_rcc_c2_apb3enr_adccen;
  wire          nxt_rcc_c2_apb3enr_adccen;
  wire          rcc_c2_apb3enr_adccen_en;
  wire          cur_rcc_c2_apb3enr_gpio6en;
  wire          nxt_rcc_c2_apb3enr_gpio6en;
  wire          rcc_c2_apb3enr_gpio6en_en;
  wire          cur_rcc_c2_apb3enr_gpio7en;
  wire          nxt_rcc_c2_apb3enr_gpio7en;
  wire          rcc_c2_apb3enr_gpio7en_en;
  wire          cur_rcc_c2_apb3enr_gpio8en;
  wire          nxt_rcc_c2_apb3enr_gpio8en;
  wire          rcc_c2_apb3enr_gpio8en_en;
  // rcc_c2_ahb1lpenr
  wire [  31:0] rcc_c2_ahb1lpenr_read;
  wire          rcc_c2_ahb1lpenr_sel;
  wire          cur_rcc_c2_ahb1lpenr_romlpen;
  wire          nxt_rcc_c2_ahb1lpenr_romlpen;
  wire          rcc_c2_ahb1lpenr_romlpen_en;
  wire          cur_rcc_c2_ahb1lpenr_tsmslpen;
  wire          nxt_rcc_c2_ahb1lpenr_tsmslpen;
  wire          rcc_c2_ahb1lpenr_tsmslpen_en;
  wire          cur_rcc_c2_ahb1lpenr_smslpen;
  wire          nxt_rcc_c2_ahb1lpenr_smslpen;
  wire          rcc_c2_ahb1lpenr_smslpen_en;
  wire          cur_rcc_c2_ahb1lpenr_xflashlpen;
  wire          nxt_rcc_c2_ahb1lpenr_xflashlpen;
  wire          rcc_c2_ahb1lpenr_xflashlpen_en;
  wire          cur_rcc_c2_ahb1lpenr_fftlpen;
  wire          nxt_rcc_c2_ahb1lpenr_fftlpen;
  wire          rcc_c2_ahb1lpenr_fftlpen_en;
  wire          cur_rcc_c2_ahb1lpenr_npulpen;
  wire          nxt_rcc_c2_ahb1lpenr_npulpen;
  wire          rcc_c2_ahb1lpenr_npulpen_en;
  wire          cur_rcc_c2_ahb1lpenr_dma1lpen;
  wire          nxt_rcc_c2_ahb1lpenr_dma1lpen;
  wire          rcc_c2_ahb1lpenr_dma1lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_dma2lpen;
  wire          nxt_rcc_c2_ahb1lpenr_dma2lpen;
  wire          rcc_c2_ahb1lpenr_dma2lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_dmaschlpen;
  wire          nxt_rcc_c2_ahb1lpenr_dmaschlpen;
  wire          rcc_c2_ahb1lpenr_dmaschlpen_en;
  wire          cur_rcc_c2_ahb1lpenr_qspi1lpen;
  wire          nxt_rcc_c2_ahb1lpenr_qspi1lpen;
  wire          rcc_c2_ahb1lpenr_qspi1lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_qspi2lpen;
  wire          nxt_rcc_c2_ahb1lpenr_qspi2lpen;
  wire          rcc_c2_ahb1lpenr_qspi2lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_qspi3lpen;
  wire          nxt_rcc_c2_ahb1lpenr_qspi3lpen;
  wire          rcc_c2_ahb1lpenr_qspi3lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_qspi4lpen;
  wire          nxt_rcc_c2_ahb1lpenr_qspi4lpen;
  wire          rcc_c2_ahb1lpenr_qspi4lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_xspilpen;
  wire          nxt_rcc_c2_ahb1lpenr_xspilpen;
  wire          rcc_c2_ahb1lpenr_xspilpen_en;
  wire          cur_rcc_c2_ahb1lpenr_mspilpen;
  wire          nxt_rcc_c2_ahb1lpenr_mspilpen;
  wire          rcc_c2_ahb1lpenr_mspilpen_en;
  wire          cur_rcc_c2_ahb1lpenr_hacif_l1lpen;
  wire          nxt_rcc_c2_ahb1lpenr_hacif_l1lpen;
  wire          rcc_c2_ahb1lpenr_hacif_l1lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_hacif_f1lpen;
  wire          nxt_rcc_c2_ahb1lpenr_hacif_f1lpen;
  wire          rcc_c2_ahb1lpenr_hacif_f1lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_maclpen;
  wire          nxt_rcc_c2_ahb1lpenr_maclpen;
  wire          rcc_c2_ahb1lpenr_maclpen_en;
  wire          cur_rcc_c2_ahb1lpenr_lzlpen;
  wire          nxt_rcc_c2_ahb1lpenr_lzlpen;
  wire          rcc_c2_ahb1lpenr_lzlpen_en;
  // rcc_c2_apb1lpenr
  wire [  31:0] rcc_c2_apb1lpenr_read;
  wire          rcc_c2_apb1lpenr_sel;
  wire          cur_rcc_c2_apb1lpenr_gtim1lpen;
  wire          nxt_rcc_c2_apb1lpenr_gtim1lpen;
  wire          rcc_c2_apb1lpenr_gtim1lpen_en;
  wire          cur_rcc_c2_apb1lpenr_gtim2lpen;
  wire          nxt_rcc_c2_apb1lpenr_gtim2lpen;
  wire          rcc_c2_apb1lpenr_gtim2lpen_en;
  wire          cur_rcc_c2_apb1lpenr_gtim3lpen;
  wire          nxt_rcc_c2_apb1lpenr_gtim3lpen;
  wire          rcc_c2_apb1lpenr_gtim3lpen_en;
  wire          cur_rcc_c2_apb1lpenr_gtim4lpen;
  wire          nxt_rcc_c2_apb1lpenr_gtim4lpen;
  wire          rcc_c2_apb1lpenr_gtim4lpen_en;
  wire          cur_rcc_c2_apb1lpenr_spi1lpen;
  wire          nxt_rcc_c2_apb1lpenr_spi1lpen;
  wire          rcc_c2_apb1lpenr_spi1lpen_en;
  wire          cur_rcc_c2_apb1lpenr_spi2lpen;
  wire          nxt_rcc_c2_apb1lpenr_spi2lpen;
  wire          rcc_c2_apb1lpenr_spi2lpen_en;
  wire          cur_rcc_c2_apb1lpenr_spi3lpen;
  wire          nxt_rcc_c2_apb1lpenr_spi3lpen;
  wire          rcc_c2_apb1lpenr_spi3lpen_en;
  wire          cur_rcc_c2_apb1lpenr_uart1lpen;
  wire          nxt_rcc_c2_apb1lpenr_uart1lpen;
  wire          rcc_c2_apb1lpenr_uart1lpen_en;
  wire          cur_rcc_c2_apb1lpenr_uart2lpen;
  wire          nxt_rcc_c2_apb1lpenr_uart2lpen;
  wire          rcc_c2_apb1lpenr_uart2lpen_en;
  wire          cur_rcc_c2_apb1lpenr_uart3lpen;
  wire          nxt_rcc_c2_apb1lpenr_uart3lpen;
  wire          rcc_c2_apb1lpenr_uart3lpen_en;
  wire          cur_rcc_c2_apb1lpenr_uart4lpen;
  wire          nxt_rcc_c2_apb1lpenr_uart4lpen;
  wire          rcc_c2_apb1lpenr_uart4lpen_en;
  wire          cur_rcc_c2_apb1lpenr_i2c2lpen;
  wire          nxt_rcc_c2_apb1lpenr_i2c2lpen;
  wire          rcc_c2_apb1lpenr_i2c2lpen_en;
  wire          cur_rcc_c2_apb1lpenr_gpio1lpen;
  wire          nxt_rcc_c2_apb1lpenr_gpio1lpen;
  wire          rcc_c2_apb1lpenr_gpio1lpen_en;
  wire          cur_rcc_c2_apb1lpenr_gpio2lpen;
  wire          nxt_rcc_c2_apb1lpenr_gpio2lpen;
  wire          rcc_c2_apb1lpenr_gpio2lpen_en;
  wire          cur_rcc_c2_apb1lpenr_gpio3lpen;
  wire          nxt_rcc_c2_apb1lpenr_gpio3lpen;
  wire          rcc_c2_apb1lpenr_gpio3lpen_en;
  wire          cur_rcc_c2_apb1lpenr_can1lpen;
  wire          nxt_rcc_c2_apb1lpenr_can1lpen;
  wire          rcc_c2_apb1lpenr_can1lpen_en;
  wire          cur_rcc_c2_apb1lpenr_can2lpen;
  wire          nxt_rcc_c2_apb1lpenr_can2lpen;
  wire          rcc_c2_apb1lpenr_can2lpen_en;
  wire          cur_rcc_c2_apb1lpenr_can3lpen;
  wire          nxt_rcc_c2_apb1lpenr_can3lpen;
  wire          rcc_c2_apb1lpenr_can3lpen_en;
  // rcc_c2_apb2lpenr
  wire [  31:0] rcc_c2_apb2lpenr_read;
  wire          rcc_c2_apb2lpenr_sel;
  wire          cur_rcc_c2_apb2lpenr_gtim5lpen;
  wire          nxt_rcc_c2_apb2lpenr_gtim5lpen;
  wire          rcc_c2_apb2lpenr_gtim5lpen_en;
  wire          cur_rcc_c2_apb2lpenr_gtim6lpen;
  wire          nxt_rcc_c2_apb2lpenr_gtim6lpen;
  wire          rcc_c2_apb2lpenr_gtim6lpen_en;
  wire          cur_rcc_c2_apb2lpenr_spi4lpen;
  wire          nxt_rcc_c2_apb2lpenr_spi4lpen;
  wire          rcc_c2_apb2lpenr_spi4lpen_en;
  wire          cur_rcc_c2_apb2lpenr_spi5lpen;
  wire          nxt_rcc_c2_apb2lpenr_spi5lpen;
  wire          rcc_c2_apb2lpenr_spi5lpen_en;
  wire          cur_rcc_c2_apb2lpenr_uart5lpen;
  wire          nxt_rcc_c2_apb2lpenr_uart5lpen;
  wire          rcc_c2_apb2lpenr_uart5lpen_en;
  wire          cur_rcc_c2_apb2lpenr_uart6lpen;
  wire          nxt_rcc_c2_apb2lpenr_uart6lpen;
  wire          rcc_c2_apb2lpenr_uart6lpen_en;
  wire          cur_rcc_c2_apb2lpenr_uart7lpen;
  wire          nxt_rcc_c2_apb2lpenr_uart7lpen;
  wire          rcc_c2_apb2lpenr_uart7lpen_en;
  wire          cur_rcc_c2_apb2lpenr_uart8lpen;
  wire          nxt_rcc_c2_apb2lpenr_uart8lpen;
  wire          rcc_c2_apb2lpenr_uart8lpen_en;
  wire          cur_rcc_c2_apb2lpenr_i2c2lpen;
  wire          nxt_rcc_c2_apb2lpenr_i2c2lpen;
  wire          rcc_c2_apb2lpenr_i2c2lpen_en;
  wire          cur_rcc_c2_apb2lpenr_i2c3lpen;
  wire          nxt_rcc_c2_apb2lpenr_i2c3lpen;
  wire          rcc_c2_apb2lpenr_i2c3lpen_en;
  wire          cur_rcc_c2_apb2lpenr_can4lpen;
  wire          nxt_rcc_c2_apb2lpenr_can4lpen;
  wire          rcc_c2_apb2lpenr_can4lpen_en;
  wire          cur_rcc_c2_apb2lpenr_can5lpen;
  wire          nxt_rcc_c2_apb2lpenr_can5lpen;
  wire          rcc_c2_apb2lpenr_can5lpen_en;
  wire          cur_rcc_c2_apb2lpenr_can6lpen;
  wire          nxt_rcc_c2_apb2lpenr_can6lpen;
  wire          rcc_c2_apb2lpenr_can6lpen_en;
  wire          cur_rcc_c2_apb2lpenr_mpptlpen;
  wire          nxt_rcc_c2_apb2lpenr_mpptlpen;
  wire          rcc_c2_apb2lpenr_mpptlpen_en;
  wire          cur_rcc_c2_apb2lpenr_gpio4lpen;
  wire          nxt_rcc_c2_apb2lpenr_gpio4lpen;
  wire          rcc_c2_apb2lpenr_gpio4lpen_en;
  wire          cur_rcc_c2_apb2lpenr_gpio5lpen;
  wire          nxt_rcc_c2_apb2lpenr_gpio5lpen;
  wire          rcc_c2_apb2lpenr_gpio5lpen_en;
  // rcc_c2_apb3lpenr
  wire [  31:0] rcc_c2_apb3lpenr_read;
  wire          rcc_c2_apb3lpenr_sel;
  wire          cur_rcc_c2_apb3lpenr_sysctllpen;
  wire          nxt_rcc_c2_apb3lpenr_sysctllpen;
  wire          rcc_c2_apb3lpenr_sysctllpen_en;
  wire          cur_rcc_c2_apb3lpenr_wwdtlpen;
  wire          nxt_rcc_c2_apb3lpenr_wwdtlpen;
  wire          rcc_c2_apb3lpenr_wwdtlpen_en;
  wire          cur_rcc_c2_apb3lpenr_tim1lpen;
  wire          nxt_rcc_c2_apb3lpenr_tim1lpen;
  wire          rcc_c2_apb3lpenr_tim1lpen_en;
  wire          cur_rcc_c2_apb3lpenr_tim2lpen;
  wire          nxt_rcc_c2_apb3lpenr_tim2lpen;
  wire          rcc_c2_apb3lpenr_tim2lpen_en;
  wire          cur_rcc_c2_apb3lpenr_adcclpen;
  wire          nxt_rcc_c2_apb3lpenr_adcclpen;
  wire          rcc_c2_apb3lpenr_adcclpen_en;
  wire          cur_rcc_c2_apb3lpenr_gpio6lpen;
  wire          nxt_rcc_c2_apb3lpenr_gpio6lpen;
  wire          rcc_c2_apb3lpenr_gpio6lpen_en;
  wire          cur_rcc_c2_apb3lpenr_gpio7lpen;
  wire          nxt_rcc_c2_apb3lpenr_gpio7lpen;
  wire          rcc_c2_apb3lpenr_gpio7lpen_en;
  wire          cur_rcc_c2_apb3lpenr_gpio8lpen;
  wire          nxt_rcc_c2_apb3lpenr_gpio8lpen;
  wire          rcc_c2_apb3lpenr_gpio8lpen_en;

  //register async set or reset
  wire          raw_pllxon_clr_n;
  wire          pllxon_clr_n;
  wire          raw_hseon_clr_n;
  wire          hseon_clr_n;
  wire          raw_hsi48on_clr_n;
  wire          hsi48on_clr_n;

  wire [   1:0] eff_hsidiv;
  wire          rcc_eff_hsidiv_en;
  wire          csion_clr_n;
  wire          csion_set_n;
  wire          hsion_rst_n;
  wire          raw_hsion_rst_n;
  wire          raw_sw_clr_n;
  wire          sw_clr_n;
  wire          sw_set_n;

  wire          hsikeron;
  wire          csikeron;
  // rcc_bdcr
  wire [  31:0] rcc_bdcr_read;
  wire          rcc_bdcr_sel;
  // rcc_csr
  wire [  31:0] rcc_csr_read;
  wire          rcc_csr_sel;
  // rcc_c1_rsr
  wire [  31:0] rcc_c1_rsr_read;
  wire          rcc_c1_rsr_sel;
  // rcc_c2_rsr
  wire [  31:0] rcc_c2_rsr_read;
  wire          rcc_c2_rsr_sel;
  //clk ready signals
  wire          d1_clk_rdy;
  wire          d2_clk_rdy;
  wire          sys_clk_rdy;
  wire          tg_sys_clk_rdy;
  wire [   3:0] sys_rdy_candidate;
  //interrupt signals
  wire          lsecssie;
  wire          pll3rdyie;
  wire          pll2rdyie;
  wire          pll1rdyie;
  wire          hsi48rdyie;
  wire          csirdyie;
  wire          hserdyie;
  wire          hsirdyie;
  wire          lserdyie;
  wire          lsirdyie;
  wire          rcc_hsecssf;
  wire          rcc_lsecssf;
  wire          rcc_pll3rdyf;
  wire          rcc_pll2rdyf;
  wire          rcc_pll1rdyf;
  wire          rcc_hsi48rdyf;
  wire          rcc_csirdyf;
  wire          rcc_hserdyf;
  wire          rcc_hsirdyf;
  wire          rcc_lserdyf;
  wire          rcc_lsirdyf;
  //addr remap
  wire [AW-1:0] remap_addr;
  wire [AW-1:0] addr_shift;
  //PLL forbidden
  wire          pll3_forbidden;
  wire          pll2_forbidden;
  wire          pll1_forbidden;

  wire          rcc_c1_rsr_rmvf_en;
  wire          rcc_c2_rsr_rmvf_en;
  wire          rcc_csr_lsion_en;
  wire          rcc_bdcr_byte2_en;
  wire          rcc_bdcr_byte1_en;
  wire          rcc_bdcr_byte0_en;
  // ================================================================================
  // R/W INDICATOR
  // ================================================================================
  assign rd_req = req && !(|we);
  assign wr_req = {WW{req}} & we;

  // ================================================================================
  // ADDRESS DECODER
  // ================================================================================
  // rcc_vcore_reg
  assign addr_shift = (addr <= RCC_RSR) ? 'b0 : (addr <= RCC_C1_RSR) ? ((mmaster == 0) ? 'h18 : 'h30) : 'b0;
  assign remap_addr = addr + addr_shift;
  assign rcc_cr_sel = (remap_addr == RCC_CR);
  assign rcc_icscr_sel = (remap_addr == RCC_ICSCR);
  assign rcc_crrcr_sel = (remap_addr == RCC_CRRCR);
  assign rcc_cfgr_sel = (remap_addr == RCC_CFGR);
  assign rcc_d1cfgr_sel = (remap_addr == RCC_D1CFGR);
  assign rcc_d2cfgr_sel = (remap_addr == RCC_D2CFGR);
  assign rcc_d3cfgr_sel = (remap_addr == RCC_D3CFGR);
  assign rcc_pllclkselr_sel = (remap_addr == RCC_PLLCLKSELR);
  assign rcc_pllcfgr_sel = (remap_addr == RCC_PLLCFGR);
  assign rcc_pll1divr_sel = (remap_addr == RCC_PLL1DIVR);
  assign rcc_pll1fracr_sel = (remap_addr == RCC_PLL1FRACR);
  assign rcc_pll2divr_sel = (remap_addr == RCC_PLL2DIVR);
  assign rcc_pll2fracr_sel = (remap_addr == RCC_PLL2FRACR);
  assign rcc_pll3divr_sel = (remap_addr == RCC_PLL3DIVR);
  assign rcc_pll3fracr_sel = (remap_addr == RCC_PLL3FRACR);
  assign rcc_d1ccipr_sel = (remap_addr == RCC_D1CCIPR);
  assign rcc_d2ccip1r_sel = (remap_addr == RCC_D2CCIP1R);
  assign rcc_d2ccip2r_sel = (remap_addr == RCC_D2CCIP2R);
  assign rcc_d3ccipr_sel = (remap_addr == RCC_D3CCIPR);
  assign rcc_cier_sel = (remap_addr == RCC_CIER);
  assign rcc_cifr_sel = (remap_addr == RCC_CIFR);
  assign rcc_cicr_sel = (remap_addr == RCC_CICR);
  assign rcc_bdcr_sel = (remap_addr == RCC_BDCR);
  assign rcc_csr_sel = (remap_addr == RCC_CSR);
  assign rcc_ahb1rstr_sel = (remap_addr == RCC_AHB1RSTR);
  assign rcc_apb1rstr_sel = (remap_addr == RCC_APB1RSTR);
  assign rcc_apb2rstr_sel = (remap_addr == RCC_APB2RSTR);
  assign rcc_apb3rstr_sel = (remap_addr == RCC_APB3RSTR);
  assign rcc_gcr_sel = (remap_addr == RCC_GCR);
  assign rcc_ahb1d3amr_sel = (remap_addr == RCC_AHB1D3AMR);
  assign rcc_apb1d3amr_sel = (remap_addr == RCC_APB1D3AMR);
  assign rcc_apb2d3amr_sel = (remap_addr == RCC_APB2D3AMR);
  assign rcc_apb3d3amr_sel = (remap_addr == RCC_APB3D3AMR);
  assign rcc_c1_rsr_sel = (remap_addr == RCC_C1_RSR);
  assign rcc_c1_ahb1enr_sel = (remap_addr == RCC_C1_AHB1ENR);
  assign rcc_c1_apb1enr_sel = (remap_addr == RCC_C1_APB1ENR);
  assign rcc_c1_apb2enr_sel = (remap_addr == RCC_C1_APB2ENR);
  assign rcc_c1_apb3enr_sel = (remap_addr == RCC_C1_APB3ENR);
  assign rcc_c1_ahb1lpenr_sel = (remap_addr == RCC_C1_AHB1LPENR);
  assign rcc_c1_apb1lpenr_sel = (remap_addr == RCC_C1_APB1LPENR);
  assign rcc_c1_apb2lpenr_sel = (remap_addr == RCC_C1_APB2LPENR);
  assign rcc_c1_apb3lpenr_sel = (remap_addr == RCC_C1_APB3LPENR);
  assign rcc_c2_rsr_sel = (remap_addr == RCC_C2_RSR);
  assign rcc_c2_ahb1enr_sel = (remap_addr == RCC_C2_AHB1ENR);
  assign rcc_c2_apb1enr_sel = (remap_addr == RCC_C2_APB1ENR);
  assign rcc_c2_apb2enr_sel = (remap_addr == RCC_C2_APB2ENR);
  assign rcc_c2_apb3enr_sel = (remap_addr == RCC_C2_APB3ENR);
  assign rcc_c2_ahb1lpenr_sel = (remap_addr == RCC_C2_AHB1LPENR);
  assign rcc_c2_apb1lpenr_sel = (remap_addr == RCC_C2_APB1LPENR);
  assign rcc_c2_apb2lpenr_sel = (remap_addr == RCC_C2_APB2LPENR);
  assign rcc_c2_apb3lpenr_sel = (remap_addr == RCC_C2_APB3LPENR);

  // ================================================================================
  // REG ACCESS ERROR
  // ================================================================================
  assign rsv_reg_sel = (remap_addr < RCC_CR)
                  || ((remap_addr > RCC_CRRCR) && (remap_addr < RCC_CFGR))
                  || ((remap_addr > RCC_CFGR) && (remap_addr < RCC_D1CFGR))
                  || ((remap_addr > RCC_D3CFGR) && (remap_addr < RCC_PLLCLKSELR))
                  || ((remap_addr > RCC_PLL3FRACR) && (remap_addr < RCC_D1CCIPR))
                  || ((remap_addr > RCC_D3CCIPR) && (remap_addr < RCC_CIER))
                  || ((remap_addr > RCC_CICR) && (remap_addr < RCC_BDCR))
                  || ((remap_addr > RCC_CSR) && (remap_addr < RCC_AHB1RSTR))
                  || ((remap_addr > RCC_GCR) && (remap_addr < RCC_AHB1D3AMR))
                  || ((remap_addr > RCC_C1_APB3LPENR) && (remap_addr < RCC_C2_RSR))
                  || (remap_addr > RCC_C2_APB3LPENR);

  assign rsv_acs_err = rsv_reg_sel && req;
  assign rsp = {1'b0, rsv_acs_err};

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
                 | ({DW{rcc_ahb1rstr_sel}} & rcc_ahb1rstr_read)
                 | ({DW{rcc_apb1rstr_sel}} & rcc_apb1rstr_read)
                 | ({DW{rcc_apb2rstr_sel}} & rcc_apb2rstr_read)
                 | ({DW{rcc_apb3rstr_sel}} & rcc_apb3rstr_read)
                 | ({DW{rcc_gcr_sel}} & rcc_gcr_read)
                 | ({DW{rcc_ahb1d3amr_sel}} & rcc_ahb1d3amr_read)
                 | ({DW{rcc_apb1d3amr_sel}} & rcc_apb1d3amr_read)
                 | ({DW{rcc_apb2d3amr_sel}} & rcc_apb2d3amr_read)
                 | ({DW{rcc_apb3d3amr_sel}} & rcc_apb3d3amr_read)
                 | ({DW{rcc_c1_rsr_sel}} & rcc_c1_rsr_read)
                 | ({DW{rcc_c1_ahb1enr_sel}} & rcc_c1_ahb1enr_read)
                 | ({DW{rcc_c1_apb1enr_sel}} & rcc_c1_apb1enr_read)
                 | ({DW{rcc_c1_apb2enr_sel}} & rcc_c1_apb2enr_read)
                 | ({DW{rcc_c1_apb3enr_sel}} & rcc_c1_apb3enr_read)
                 | ({DW{rcc_c1_ahb1lpenr_sel}} & rcc_c1_ahb1lpenr_read)
                 | ({DW{rcc_c1_apb1lpenr_sel}} & rcc_c1_apb1lpenr_read)
                 | ({DW{rcc_c1_apb2lpenr_sel}} & rcc_c1_apb2lpenr_read)
                 | ({DW{rcc_c1_apb3lpenr_sel}} & rcc_c1_apb3lpenr_read)
                 | ({DW{rcc_c2_rsr_sel}} & rcc_c2_rsr_read)
                 | ({DW{rcc_c2_ahb1enr_sel}} & rcc_c2_ahb1enr_read)
                 | ({DW{rcc_c2_apb1enr_sel}} & rcc_c2_apb1enr_read)
                 | ({DW{rcc_c2_apb2enr_sel}} & rcc_c2_apb2enr_read)
                 | ({DW{rcc_c2_apb3enr_sel}} & rcc_c2_apb3enr_read)
                 | ({DW{rcc_c2_ahb1lpenr_sel}} & rcc_c2_ahb1lpenr_read)
                 | ({DW{rcc_c2_apb1lpenr_sel}} & rcc_c2_apb1lpenr_read)
                 | ({DW{rcc_c2_apb2lpenr_sel}} & rcc_c2_apb2lpenr_read)
                 | ({DW{rcc_c2_apb3lpenr_sel}} & rcc_c2_apb3lpenr_read);

  BB_dfflr #(
      .DW     (DW),
      .RST_VAL(0)
  ) U_rdata_flop (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rd_req),
      .din  (rdata_tmp),
      .dout (rdata)
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
  assign rcc_cr_read = {
    {2{1'b0}},
    cur_rcc_cr_pll3rdy,
    cur_rcc_cr_pll3on,
    cur_rcc_cr_pll2rdy,
    cur_rcc_cr_pll2on,
    cur_rcc_cr_pll1rdy,
    cur_rcc_cr_pll1on,
    {4{1'b0}},
    cur_rcc_cr_hsecsson,
    cur_rcc_cr_hsebyp,
    cur_rcc_cr_hserdy,
    cur_rcc_cr_hseon,
    cur_rcc_cr_d2ckrdy,
    cur_rcc_cr_d1ckrdy,
    cur_rcc_cr_hsi48rdy,
    cur_rcc_cr_hsi48on,
    {2{1'b0}},
    cur_rcc_cr_csikeron,
    cur_rcc_cr_csirdy,
    cur_rcc_cr_csion,
    {1{1'b0}},
    cur_rcc_cr_hsidivf,
    cur_rcc_cr_hsidiv,
    cur_rcc_cr_hsirdy,
    cur_rcc_cr_hsikeron,
    cur_rcc_cr_hsion
  };

  // --------------------------------------------------------------------------------
  // 29:29               pll3rdy             RO                  0b0                 
  // --------------------------------------------------------------------------------

  assign cur_rcc_cr_pll3rdy = sync_pll3_rdy;

  // --------------------------------------------------------------------------------
  // 28:28               pll3on              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign raw_pllxon_clr_n = rst_n & ~(rcc_sys_stop | (sync_hsecss_fail_rst & cur_rcc_pllclkselr_pllsrc == 2'b10));

  // pllxon_clr_n test reset mux
  test_rst_mux u_pllxon_clr_n_mux (
      .test_rst_n(rst_n),
      .func_rst_n(raw_pllxon_clr_n),
      .testmode  (testmode),
      .rst_n     (pllxon_clr_n)
  );

  assign rcc_cr_pll3on_en  = (|wr_req & rcc_cr_sel);
  assign nxt_rcc_cr_pll3on = wdata[28:28];
  assign pll3on            = cur_rcc_cr_pll3on;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cr_pll3on (
      .clk  (clk),
      .rst_n(pllxon_clr_n),
      .en   (rcc_cr_pll3on_en),
      .din  (nxt_rcc_cr_pll3on),
      .dout (cur_rcc_cr_pll3on)
  );

  // --------------------------------------------------------------------------------
  // 27:27               pll2rdy             RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign cur_rcc_cr_pll2rdy = sync_pll2_rdy;

  // --------------------------------------------------------------------------------
  // 26:26               pll2on              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cr_pll2on_en   = (|wr_req & rcc_cr_sel);
  assign nxt_rcc_cr_pll2on  = wdata[26:26];
  assign pll2on             = cur_rcc_cr_pll2on;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cr_pll2on (
      .clk  (clk),
      .rst_n(pllxon_clr_n),
      .en   (rcc_cr_pll2on_en),
      .din  (nxt_rcc_cr_pll2on),
      .dout (cur_rcc_cr_pll2on)
  );

  // --------------------------------------------------------------------------------
  // 25:25               pll1rdy             RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign cur_rcc_cr_pll1rdy = sync_pll1_rdy;

  // --------------------------------------------------------------------------------
  // 24:24               pll1on              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cr_pll1on_en   = (|wr_req && rcc_cr_sel) && (~(cur_rcc_cfgr_sws == 3'b011 && nxt_rcc_cr_pll1on == 0));
  assign nxt_rcc_cr_pll1on  = wdata[24:24];
  assign pll1on             = cur_rcc_cr_pll1on;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cr_pll1on (
      .clk  (clk),
      .rst_n(pllxon_clr_n),
      .en   (rcc_cr_pll1on_en),
      .din  (nxt_rcc_cr_pll1on),
      .dout (cur_rcc_cr_pll1on)
  );

  // --------------------------------------------------------------------------------
  // 19:19               hsecsson            W1S                 0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cr_hsecsson_en_en  = (|wr_req & rcc_cr_sel);
  assign rcc_cr_hsecsson_en     = rcc_cr_hsecsson_en_en && (cur_rcc_cr_hsecsson_en || sync_hsecss_fail);
  assign nxt_rcc_cr_hsecsson    = wdata[19:19];
  assign nxt_rcc_cr_hsecsson_en = (nxt_rcc_cr_hsecsson == 1'b0) && (cur_rcc_cr_hsecsson == 1'b0);
  assign hsecsson               = cur_rcc_cr_hsecsson;

  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cr_hsecsson (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cr_hsecsson_en),
      .din  (nxt_rcc_cr_hsecsson),
      .dout (cur_rcc_cr_hsecsson)
  );

  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_cr_hsecsson_en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cr_hsecsson_en_en),
      .din  (nxt_rcc_cr_hsecsson_en),  //when hsecsson is set to 1, it can not be cleared until hsecss_fail
      .dout (cur_rcc_cr_hsecsson_en)
  );

  // --------------------------------------------------------------------------------
  // 18:18               hsebyp              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cr_hsebyp_en  = (|wr_req & rcc_cr_sel);
  assign nxt_rcc_cr_hsebyp = wdata[18:18];
  assign hsebyp            = cur_rcc_cr_hsebyp;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cr_hsebyp (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cr_hsebyp_en),
      .din  (nxt_rcc_cr_hsebyp),
      .dout (cur_rcc_cr_hsebyp)
  );

  // --------------------------------------------------------------------------------
  // 17:17               hserdy              RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign raw_hseon_clr_n = rst_n & ~(sync_hsecss_fail_rst | rcc_sys_stop);
  // hseon_clr_n test reset mux
  test_rst_mux u_hseon_clr_n_mux (
      .test_rst_n(rst_n),
      .func_rst_n(raw_hseon_clr_n),
      .testmode  (testmode),
      .rst_n     (hseon_clr_n)
  );
  assign cur_rcc_cr_hserdy = sync_hse_rdy;

  // --------------------------------------------------------------------------------
  // 16:16               hseon               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cr_hseon_en   = (~((cur_rcc_cfgr_sws == 3'b010) | (cur_rcc_cr_pll1on && cur_rcc_pllclkselr_pllsrc == 2'b10))) && (|wr_req && rcc_cr_sel);
  assign nxt_rcc_cr_hseon  = wdata[16:16];
  assign hseon             = cur_rcc_cr_hseon;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cr_hseon (
      .clk  (clk),
      .rst_n(hseon_clr_n),
      .en   (rcc_cr_hseon_en),
      .din  (nxt_rcc_cr_hseon),
      .dout (cur_rcc_cr_hseon)
  );

  // --------------------------------------------------------------------------------
  // 15:15               d2ckrdy             RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign cur_rcc_cr_d2ckrdy = d2_clk_rdy;

  //clock ready logic generate

  assign sys_rdy_candidate  = {sync_pll1_rdy, sync_hse_rdy, sync_csi_rdy, sync_hsi_rdy};
  assign d1_clk_rdy         = sys_clk_rdy & (~rcc_d1_stop);
  assign d2_clk_rdy         = sys_clk_rdy & (~rcc_d2_stop);

  mux_n_to_1 #(
      .N(4),
      .m(2)
  ) u_mux_sys_clk_rdy (
      .inp (sys_rdy_candidate),
      .sel (sw),
      .mout(sys_clk_rdy)
  );



  // --------------------------------------------------------------------------------
  // 14:14               d1ckrdy             RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign cur_rcc_cr_d1ckrdy  = d1_clk_rdy;

  // --------------------------------------------------------------------------------
  // 13:13               hsi48rdy            RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign cur_rcc_cr_hsi48rdy = sync_hsi48_rdy;

  // --------------------------------------------------------------------------------
  // 12:12               hsi48on             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign raw_hsi48on_clr_n   = rst_n & ~rcc_sys_stop;
  // hsi48on_clr_n test reset mux
  test_rst_mux u_hsi48on_clr_n_mux (
      .test_rst_n(rst_n),
      .func_rst_n(raw_hsi48on_clr_n),
      .testmode  (testmode),
      .rst_n     (hsi48on_clr_n)
  );
  assign rcc_cr_hsi48on_en  = (|wr_req & rcc_cr_sel);
  assign nxt_rcc_cr_hsi48on = wdata[12:12];
  assign hsi48on            = cur_rcc_cr_hsi48on;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cr_hsi48on (
      .clk  (clk),
      .rst_n(hsi48on_clr_n),
      .en   (rcc_cr_hsi48on_en),
      .din  (nxt_rcc_cr_hsi48on),
      .dout (cur_rcc_cr_hsi48on)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 csikeron            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cr_csikeron_en  = (|wr_req & rcc_cr_sel);
  assign nxt_rcc_cr_csikeron = wdata[9:9];
  assign csikeron            = cur_rcc_cr_csikeron;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cr_csikeron (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cr_csikeron_en),
      .din  (nxt_rcc_cr_csikeron),
      .dout (cur_rcc_cr_csikeron)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 csirdy              RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign cur_rcc_cr_csirdy = sync_csi_rdy;

  // --------------------------------------------------------------------------------
  // 7:7                 csion               RW                  0b0                 
  // --------------------------------------------------------------------------------
  //csi on value doesn't change when system stop
  assign csion_clr_n       = rst_n;
  //when 
  assign csion_set_n       = ~(rcc_exit_sys_stop && (cur_rcc_cfgr_stopwuck == 1 || cur_rcc_cfgr_stopkerwuck == 1));

  assign rcc_cr_csion_en   = (~((cur_rcc_cfgr_sws == 3'b001) || (cur_rcc_cr_pll1on && cur_rcc_pllclkselr_pllsrc == 2'b01))) && (|wr_req && rcc_cr_sel);
  assign nxt_rcc_cr_csion  = wdata[7:7];
  assign csion             = rcc_sys_stop ? csikeron : cur_rcc_cr_csion;
  BB_dfflrs #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cr_csion (
      .clk  (clk),
      .rst_n(csion_clr_n),
      .set_n(csion_set_n),
      .en   (rcc_cr_csion_en),
      .din  (nxt_rcc_cr_csion),
      .dout (cur_rcc_cr_csion)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 hsidivf             RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cr_hsidivf_set = cur_rcc_cr_hsidiv == eff_hsidiv;
  assign rcc_cr_hsidivf_clr = cur_rcc_cr_hsidiv != eff_hsidiv;
  assign rcc_cr_hsidivf_en  = rcc_cr_hsidivf_set | rcc_cr_hsidivf_clr;
  assign nxt_rcc_cr_hsidivf = rcc_cr_hsidivf_set;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cr_hsidivf (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cr_hsidivf_en),
      .din  (nxt_rcc_cr_hsidivf),
      .dout (cur_rcc_cr_hsidivf)
  );
  // when hsi is selected as the pll source clock , and one of the pllx is on , hsi divide ratio can't be changed
  assign rcc_eff_hsidiv_en = ~(cur_rcc_pllclkselr_pllsrc == 2'b00 & (pll1on | pll2on | pll3on));

  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_cr_eff_hsidiv (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_eff_hsidiv_en),
      .din  (cur_rcc_cr_hsidiv),
      .dout (eff_hsidiv)
  );


  // --------------------------------------------------------------------------------
  // 4:3                 hsidiv              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cr_hsidiv_en  = (|wr_req & rcc_cr_sel);
  assign nxt_rcc_cr_hsidiv = wdata[4:3];
  assign hsidiv            = eff_hsidiv;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_cr_hsidiv (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cr_hsidiv_en),
      .din  (nxt_rcc_cr_hsidiv),
      .dout (cur_rcc_cr_hsidiv)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 hsirdy              RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign cur_rcc_cr_hsirdy   = sync_hsi_rdy;

  // --------------------------------------------------------------------------------
  // 1:1                 hsikeron            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cr_hsikeron_en  = (|wr_req & rcc_cr_sel);
  assign nxt_rcc_cr_hsikeron = wdata[1:1];
  assign hsikeron            = cur_rcc_cr_hsikeron;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cr_hsikeron (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cr_hsikeron_en),
      .din  (nxt_rcc_cr_hsikeron),
      .dout (cur_rcc_cr_hsikeron)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 hsion               RW                  0b1                 
  // --------------------------------------------------------------------------------
  ////hsi on value doesn't change when system stop
  assign raw_hsion_rst_n = (~((rcc_exit_sys_stop && (cur_rcc_cfgr_stopwuck == 0 || cur_rcc_cfgr_stopkerwuck == 0)) || sync_hsecss_fail_rst)) && rst_n;
  // hsion_rst_n test reset mux
  test_rst_mux u_hsion_rst_n_mux (
      .test_rst_n(rst_n),
      .func_rst_n(raw_hsion_rst_n),
      .testmode  (testmode),
      .rst_n     (hsion_rst_n)
  );
  assign rcc_cr_hsion_en  = (~((cur_rcc_cfgr_sws == 3'b000) || (cur_rcc_cr_pll1on && cur_rcc_pllclkselr_pllsrc == 2'b00))) && (|wr_req && rcc_cr_sel);
  assign nxt_rcc_cr_hsion = wdata[0:0];
  assign hsion            = rcc_sys_stop ? hsikeron : cur_rcc_cr_hsion;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_cr_hsion (
      .clk  (clk),
      .rst_n(hsion_rst_n),
      .en   (rcc_cr_hsion_en),
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
  assign rcc_icscr_read        = {{1{1'b0}}, cur_rcc_icscr_csitrim, cur_rcc_icscr_csical, cur_rcc_icscr_hsitrim, cur_rcc_icscr_hsical};

  // --------------------------------------------------------------------------------
  // 30:26               csitrim             RW                  0b10000             
  // --------------------------------------------------------------------------------
  assign rcc_icscr_csitrim_en  = (|wr_req & rcc_icscr_sel);
  assign nxt_rcc_icscr_csitrim = wdata[30:26];
  assign csitrim               = cur_rcc_icscr_csitrim;
  BB_dfflr #(
      .DW     (5),
      .RST_VAL('h10)
  ) U_rcc_icscr_csitrim (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_icscr_csitrim_en),
      .din  (nxt_rcc_icscr_csitrim),
      .dout (cur_rcc_icscr_csitrim)
  );

  // --------------------------------------------------------------------------------
  // 25:18               csical              RO                  flash_csi_opt       
  // --------------------------------------------------------------------------------
  assign cur_rcc_icscr_csical  = flash_csi_opt + {3'b0, csitrim};
  assign csi_trim              = cur_rcc_icscr_csical;

  // --------------------------------------------------------------------------------
  // 17:12               hsitrim             RW                  0b100000            
  // --------------------------------------------------------------------------------
  assign rcc_icscr_hsitrim_en  = (|wr_req & rcc_icscr_sel);
  assign nxt_rcc_icscr_hsitrim = wdata[17:12];
  assign hsitrim               = cur_rcc_icscr_hsitrim;
  BB_dfflr #(
      .DW     (6),
      .RST_VAL('h20)
  ) U_rcc_icscr_hsitrim (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_icscr_hsitrim_en),
      .din  (nxt_rcc_icscr_hsitrim),
      .dout (cur_rcc_icscr_hsitrim)
  );

  // --------------------------------------------------------------------------------
  // 11:0                hsical              RO                  flash_hsi_opt       
  // --------------------------------------------------------------------------------
  assign cur_rcc_icscr_hsical   = flash_hsi_opt + {6'b0, hsitrim};
  assign hsi_trim               = cur_rcc_icscr_hsical;


  // --------------------------------------------------------------------------------
  // rcc_crrcr                               0x8                                     
  // --------------------------------------------------------------------------------
  // 9:0                 hsi48cal            RO                  crs_hsi48_trim      
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_crrcr read data
  // --------------------------------------------------------------------------------
  assign rcc_crrcr_read         = {{22{1'b0}}, cur_rcc_crrcr_hsi48cal};

  // --------------------------------------------------------------------------------
  // 9:0                 hsi48cal            RO                  crs_hsi48_trim      
  // --------------------------------------------------------------------------------
  assign cur_rcc_crrcr_hsi48cal = crs_hsi48_trim;


  // --------------------------------------------------------------------------------
  // rcc_cfgr                                0x10                                    
  // --------------------------------------------------------------------------------
  // 31:29               mco2sel             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 28:25               mco2pre             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 24:22               mco1sel             RW                  0b0                 
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
  // 2:0                 sw                  RW                  0b10                
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_cfgr read data
  // --------------------------------------------------------------------------------
  assign rcc_cfgr_read          = {cur_rcc_cfgr_mco2sel, cur_rcc_cfgr_mco2pre, cur_rcc_cfgr_mco1sel, cur_rcc_cfgr_mco1pre, {2{1'b0}}, cur_rcc_cfgr_timpre, cur_rcc_cfgr_hrtimsel, cur_rcc_cfgr_rtcpre, cur_rcc_cfgr_stopkerwuck, cur_rcc_cfgr_stopwuck, cur_rcc_cfgr_sws, cur_rcc_cfgr_sw};

  // --------------------------------------------------------------------------------
  // 31:29               mco2sel             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cfgr_mco2sel_en    = (|wr_req & rcc_cfgr_sel);
  assign nxt_rcc_cfgr_mco2sel   = wdata[31:29];
  assign mco2sel                = cur_rcc_cfgr_mco2sel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_cfgr_mco2sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cfgr_mco2sel_en),
      .din  (nxt_rcc_cfgr_mco2sel),
      .dout (cur_rcc_cfgr_mco2sel)
  );

  // --------------------------------------------------------------------------------
  // 28:25               mco2pre             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cfgr_mco2pre_en  = (|wr_req & rcc_cfgr_sel);
  assign nxt_rcc_cfgr_mco2pre = wdata[28:25];
  assign mco2pre              = cur_rcc_cfgr_mco2pre;
  BB_dfflr #(
      .DW     (4),
      .RST_VAL('h0)
  ) U_rcc_cfgr_mco2pre (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cfgr_mco2pre_en),
      .din  (nxt_rcc_cfgr_mco2pre),
      .dout (cur_rcc_cfgr_mco2pre)
  );

  // --------------------------------------------------------------------------------
  // 24:22               mco1sel             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cfgr_mco1sel_en  = (|wr_req & rcc_cfgr_sel);
  assign nxt_rcc_cfgr_mco1sel = wdata[24:22];
  assign mco1sel              = cur_rcc_cfgr_mco1sel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_cfgr_mco1sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cfgr_mco1sel_en),
      .din  (nxt_rcc_cfgr_mco1sel),
      .dout (cur_rcc_cfgr_mco1sel)
  );

  // --------------------------------------------------------------------------------
  // 21:18               mco1pre             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cfgr_mco1pre_en  = (|wr_req & rcc_cfgr_sel);
  assign nxt_rcc_cfgr_mco1pre = wdata[21:18];
  assign mco1pre              = cur_rcc_cfgr_mco1pre;
  BB_dfflr #(
      .DW     (4),
      .RST_VAL('h0)
  ) U_rcc_cfgr_mco1pre (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cfgr_mco1pre_en),
      .din  (nxt_rcc_cfgr_mco1pre),
      .dout (cur_rcc_cfgr_mco1pre)
  );

  // --------------------------------------------------------------------------------
  // 15:15               timpre              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cfgr_timpre_en  = (|wr_req & rcc_cfgr_sel);
  assign nxt_rcc_cfgr_timpre = wdata[15:15];
  assign timpre              = cur_rcc_cfgr_timpre;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cfgr_timpre (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cfgr_timpre_en),
      .din  (nxt_rcc_cfgr_timpre),
      .dout (cur_rcc_cfgr_timpre)
  );

  // --------------------------------------------------------------------------------
  // 14:14               hrtimsel            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cfgr_hrtimsel_en  = (|wr_req & rcc_cfgr_sel);
  assign nxt_rcc_cfgr_hrtimsel = wdata[14:14];
  assign hrtimsel              = cur_rcc_cfgr_hrtimsel;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cfgr_hrtimsel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cfgr_hrtimsel_en),
      .din  (nxt_rcc_cfgr_hrtimsel),
      .dout (cur_rcc_cfgr_hrtimsel)
  );

  // --------------------------------------------------------------------------------
  // 13:8                rtcpre              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cfgr_rtcpre_en  = (|wr_req & rcc_cfgr_sel);
  assign nxt_rcc_cfgr_rtcpre = wdata[13:8];
  assign rtcpre              = cur_rcc_cfgr_rtcpre;
  BB_dfflr #(
      .DW     (6),
      .RST_VAL('h0)
  ) U_rcc_cfgr_rtcpre (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cfgr_rtcpre_en),
      .din  (nxt_rcc_cfgr_rtcpre),
      .dout (cur_rcc_cfgr_rtcpre)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 stopkerwuck         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cfgr_stopkerwuck_en  = (|wr_req & rcc_cfgr_sel);
  assign nxt_rcc_cfgr_stopkerwuck = wdata[7:7];
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cfgr_stopkerwuck (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cfgr_stopkerwuck_en),
      .din  (nxt_rcc_cfgr_stopkerwuck),
      .dout (cur_rcc_cfgr_stopkerwuck)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 stopwuck            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cfgr_stopwuck_en  = (|wr_req & rcc_cfgr_sel);
  assign nxt_rcc_cfgr_stopwuck = wdata[6:6];
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cfgr_stopwuck (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cfgr_stopwuck_en),
      .din  (nxt_rcc_cfgr_stopwuck),
      .dout (cur_rcc_cfgr_stopwuck)
  );

  // --------------------------------------------------------------------------------
  // 5:3                 sws                 RO                  0b0                 
  // --------------------------------------------------------------------------------
  mux_n_to_1 #(
      .N(4),
      .m(2)
  ) u_mux_tg_sys_clk_rdy (
      .inp (sys_rdy_candidate),
      .sel (cur_rcc_cfgr_sw[1:0]),
      .mout(tg_sys_clk_rdy)
  );

  assign nxt_rcc_cfgr_sws = cur_rcc_cfgr_sw;
  assign rcc_cfgr_sws_en  = tg_sys_clk_rdy;
  assign sw               = cur_rcc_cfgr_sws[1:0];  //the MSB is not used

  BB_dfflr #(
      .DW(3)
  ) U_rcc_cfgr_sws (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cfgr_sws_en),
      .din  (nxt_rcc_cfgr_sws),
      .dout (cur_rcc_cfgr_sws)
  );

  // --------------------------------------------------------------------------------
  // 2:0                 sw                  RW                  0b10                
  // --------------------------------------------------------------------------------
  //RCC switch logic, sys_clk is set to hsi_clk while sys_rst / hsefail / exit form stop mode and stopwuck is 0  
  assign raw_sw_clr_n = ~(sync_hsecss_fail_rst | (rcc_exit_sys_stop & cur_rcc_cfgr_stopwuck == 0)) & rst_n;

  // sw_clr_n test reset mux
  test_rst_mux u_sw_clr_n_mux (
      .test_rst_n(rst_n),
      .func_rst_n(raw_sw_clr_n),
      .testmode  (testmode),
      .rst_n     (sw_clr_n)
  );
  //sys_clk is set to csi_clk while exit form stop mode and stopwuck is 1
  assign sw_set_n        = ~(rcc_exit_sys_stop & cur_rcc_cfgr_stopwuck == 1);

  assign rcc_cfgr_sw_en  = (|wr_req & rcc_cfgr_sel);
  assign nxt_rcc_cfgr_sw = wdata[2:0];

  BB_dfflrs #(
      .DW     (3),
      .RST_VAL(3'b000),
      .SET_VAL(3'b001)
  ) U_rcc_cfgr_sw (
      .clk  (clk),
      .rst_n(sw_clr_n),
      .set_n(sw_set_n),
      .en   (rcc_cfgr_sw_en),
      .din  (nxt_rcc_cfgr_sw),
      .dout (cur_rcc_cfgr_sw)
  );


  // --------------------------------------------------------------------------------
  // rcc_d1cfgr                              0x18                                    
  // --------------------------------------------------------------------------------
  // 11:8                d1cpre              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:4                 d1ppre              RW                  0b100               
  // --------------------------------------------------------------------------------
  // 3:0                 hpre                RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_d1cfgr read data
  // --------------------------------------------------------------------------------
  assign rcc_d1cfgr_read       = {{20{1'b0}}, cur_rcc_d1cfgr_d1cpre, {1{1'b0}}, cur_rcc_d1cfgr_d1ppre, cur_rcc_d1cfgr_hpre};

  // --------------------------------------------------------------------------------
  // 11:8                d1cpre              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d1cfgr_d1cpre_en  = (|wr_req & rcc_d1cfgr_sel);
  assign nxt_rcc_d1cfgr_d1cpre = wdata[11:8];
  assign d1cpre                = cur_rcc_d1cfgr_d1cpre;
  BB_dfflr #(
      .DW     (4),
      .RST_VAL('h0)
  ) U_rcc_d1cfgr_d1cpre (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d1cfgr_d1cpre_en),
      .din  (nxt_rcc_d1cfgr_d1cpre),
      .dout (cur_rcc_d1cfgr_d1cpre)
  );

  // --------------------------------------------------------------------------------
  // 6:4                 d1ppre              RW                  0b100               
  // --------------------------------------------------------------------------------
  assign rcc_d1cfgr_d1ppre_en  = (|wr_req & rcc_d1cfgr_sel);
  assign nxt_rcc_d1cfgr_d1ppre = wdata[6:4];
  assign d1ppre                = cur_rcc_d1cfgr_d1ppre;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h4)
  ) U_rcc_d1cfgr_d1ppre (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d1cfgr_d1ppre_en),
      .din  (nxt_rcc_d1cfgr_d1ppre),
      .dout (cur_rcc_d1cfgr_d1ppre)
  );

  // --------------------------------------------------------------------------------
  // 3:0                 hpre                RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d1cfgr_hpre_en  = (|wr_req & rcc_d1cfgr_sel);
  assign nxt_rcc_d1cfgr_hpre = wdata[3:0];
  assign hpre                = cur_rcc_d1cfgr_hpre;
  BB_dfflr #(
      .DW     (4),
      .RST_VAL('h0)
  ) U_rcc_d1cfgr_hpre (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d1cfgr_hpre_en),
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
  assign rcc_d2cfgr_read        = {{21{1'b0}}, cur_rcc_d2cfgr_d2ppre2, {1{1'b0}}, cur_rcc_d2cfgr_d2ppre1, {4{1'b0}}};

  // --------------------------------------------------------------------------------
  // 10:8                d2ppre2             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2cfgr_d2ppre2_en  = (|wr_req & rcc_d2cfgr_sel);
  assign nxt_rcc_d2cfgr_d2ppre2 = wdata[10:8];
  assign d2ppre2                = cur_rcc_d2cfgr_d2ppre2;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d2cfgr_d2ppre2 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2cfgr_d2ppre2_en),
      .din  (nxt_rcc_d2cfgr_d2ppre2),
      .dout (cur_rcc_d2cfgr_d2ppre2)
  );

  // --------------------------------------------------------------------------------
  // 6:4                 d2ppre1             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2cfgr_d2ppre1_en  = (|wr_req & rcc_d2cfgr_sel);
  assign nxt_rcc_d2cfgr_d2ppre1 = wdata[6:4];
  assign d2ppre1                = cur_rcc_d2cfgr_d2ppre1;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d2cfgr_d2ppre1 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2cfgr_d2ppre1_en),
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
  assign rcc_d3cfgr_read       = {{25{1'b0}}, cur_rcc_d3cfgr_d3ppre, {4{1'b0}}};

  // --------------------------------------------------------------------------------
  // 6:4                 d3ppre              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d3cfgr_d3ppre_en  = (|wr_req & rcc_d3cfgr_sel);
  assign nxt_rcc_d3cfgr_d3ppre = wdata[6:4];
  assign d3ppre                = cur_rcc_d3cfgr_d3ppre;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d3cfgr_d3ppre (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d3cfgr_d3ppre_en),
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
  assign rcc_pllclkselr_read      = {{6{1'b0}}, cur_rcc_pllclkselr_divm3, {2{1'b0}}, cur_rcc_pllclkselr_divm2, {2{1'b0}}, cur_rcc_pllclkselr_divm1, {2{1'b0}}, cur_rcc_pllclkselr_pllsrc};

  // --------------------------------------------------------------------------------
  // 25:20               divm3               RW                  0b100000            
  // --------------------------------------------------------------------------------
  assign rcc_pllclkselr_divm3_en  = (~cur_rcc_cr_pll3on) && (|wr_req && rcc_pllclkselr_sel);
  assign nxt_rcc_pllclkselr_divm3 = wdata[25:20];
  assign divm3                    = cur_rcc_pllclkselr_divm3;
  BB_dfflr #(
      .DW     (6),
      .RST_VAL('h20)
  ) U_rcc_pllclkselr_divm3 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllclkselr_divm3_en),
      .din  (nxt_rcc_pllclkselr_divm3),
      .dout (cur_rcc_pllclkselr_divm3)
  );

  // --------------------------------------------------------------------------------
  // 17:12               divm2               RW                  0b100000            
  // --------------------------------------------------------------------------------
  assign rcc_pllclkselr_divm2_en  = (~cur_rcc_cr_pll2on) && (|wr_req && rcc_pllclkselr_sel);
  assign nxt_rcc_pllclkselr_divm2 = wdata[17:12];
  assign divm2                    = cur_rcc_pllclkselr_divm2;
  BB_dfflr #(
      .DW     (6),
      .RST_VAL('h20)
  ) U_rcc_pllclkselr_divm2 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllclkselr_divm2_en),
      .din  (nxt_rcc_pllclkselr_divm2),
      .dout (cur_rcc_pllclkselr_divm2)
  );

  // --------------------------------------------------------------------------------
  // 9:4                 divm1               RW                  0b100000            
  // --------------------------------------------------------------------------------
  assign rcc_pllclkselr_divm1_en  = (~cur_rcc_cr_pll1on) && (|wr_req && rcc_pllclkselr_sel);
  assign nxt_rcc_pllclkselr_divm1 = wdata[9:4];
  assign divm1                    = cur_rcc_pllclkselr_divm1;
  BB_dfflr #(
      .DW     (6),
      .RST_VAL('h20)
  ) U_rcc_pllclkselr_divm1 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllclkselr_divm1_en),
      .din  (nxt_rcc_pllclkselr_divm1),
      .dout (cur_rcc_pllclkselr_divm1)
  );

  // --------------------------------------------------------------------------------
  // 1:0                 pllsrc              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign pll3_forbidden            = ~pll3on && ~sync_pll3_rdy;
  assign pll2_forbidden            = ~pll2on && ~sync_pll2_rdy;
  assign pll1_forbidden            = ~pll1on && ~sync_pll1_rdy;
  assign rcc_pllclkselr_pllsrc_en  = (pll3_forbidden && pll2_forbidden && pll1_forbidden) && (|wr_req && rcc_pllclkselr_sel);
  assign nxt_rcc_pllclkselr_pllsrc = wdata[1:0];
  assign pllsrc                    = cur_rcc_pllclkselr_pllsrc;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_pllclkselr_pllsrc (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllclkselr_pllsrc_en),
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
  assign rcc_pllcfgr_read = {
    {7{1'b0}},
    cur_rcc_pllcfgr_divr3en,
    cur_rcc_pllcfgr_divq3en,
    cur_rcc_pllcfgr_divp3en,
    cur_rcc_pllcfgr_divr2en,
    cur_rcc_pllcfgr_divq2en,
    cur_rcc_pllcfgr_divp2en,
    cur_rcc_pllcfgr_divr1en,
    cur_rcc_pllcfgr_divq1en,
    cur_rcc_pllcfgr_divp1en,
    {4{1'b0}},
    cur_rcc_pllcfgr_pll3rge,
    cur_rcc_pllcfgr_pll3vcosel,
    cur_rcc_pllcfgr_pll3fracen,
    cur_rcc_pllcfgr_pll2rge,
    cur_rcc_pllcfgr_pll2vcosel,
    cur_rcc_pllcfgr_pll2fracen,
    cur_rcc_pllcfgr_pll1rge,
    cur_rcc_pllcfgr_pll1vcosel,
    cur_rcc_pllcfgr_pll1fracen
  };

  // --------------------------------------------------------------------------------
  // 24:24               divr3en             RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_divr3en_en = pll3_forbidden && (|wr_req && rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_divr3en = wdata[24:24];
  assign divr3en = cur_rcc_pllcfgr_divr3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_pllcfgr_divr3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_divr3en_en),
      .din  (nxt_rcc_pllcfgr_divr3en),
      .dout (cur_rcc_pllcfgr_divr3en)
  );

  // --------------------------------------------------------------------------------
  // 23:23               divq3en             RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_divq3en_en  = pll3_forbidden && (|wr_req && rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_divq3en = wdata[23:23];
  assign divq3en                 = cur_rcc_pllcfgr_divq3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_pllcfgr_divq3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_divq3en_en),
      .din  (nxt_rcc_pllcfgr_divq3en),
      .dout (cur_rcc_pllcfgr_divq3en)
  );

  // --------------------------------------------------------------------------------
  // 22:22               divp3en             RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_divp3en_en  = pll3_forbidden && (|wr_req && rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_divp3en = wdata[22:22];
  assign divp3en                 = cur_rcc_pllcfgr_divp3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_pllcfgr_divp3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_divp3en_en),
      .din  (nxt_rcc_pllcfgr_divp3en),
      .dout (cur_rcc_pllcfgr_divp3en)
  );

  // --------------------------------------------------------------------------------
  // 21:21               divr2en             RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_divr2en_en  = pll2_forbidden && (|wr_req && rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_divr2en = wdata[21:21];
  assign divr2en                 = cur_rcc_pllcfgr_divr2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_pllcfgr_divr2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_divr2en_en),
      .din  (nxt_rcc_pllcfgr_divr2en),
      .dout (cur_rcc_pllcfgr_divr2en)
  );

  // --------------------------------------------------------------------------------
  // 20:20               divq2en             RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_divq2en_en  = pll2_forbidden && (|wr_req && rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_divq2en = wdata[20:20];
  assign divq2en                 = cur_rcc_pllcfgr_divq2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_pllcfgr_divq2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_divq2en_en),
      .din  (nxt_rcc_pllcfgr_divq2en),
      .dout (cur_rcc_pllcfgr_divq2en)
  );

  // --------------------------------------------------------------------------------
  // 19:19               divp2en             RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_divp2en_en  = pll2_forbidden && (|wr_req && rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_divp2en = wdata[19:19];
  assign divp2en                 = cur_rcc_pllcfgr_divp2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_pllcfgr_divp2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_divp2en_en),
      .din  (nxt_rcc_pllcfgr_divp2en),
      .dout (cur_rcc_pllcfgr_divp2en)
  );

  // --------------------------------------------------------------------------------
  // 18:18               divr1en             RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_divr1en_en  = pll1_forbidden && (|wr_req && rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_divr1en = wdata[18:18];
  assign divr1en                 = cur_rcc_pllcfgr_divr1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_pllcfgr_divr1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_divr1en_en),
      .din  (nxt_rcc_pllcfgr_divr1en),
      .dout (cur_rcc_pllcfgr_divr1en)
  );

  // --------------------------------------------------------------------------------
  // 17:17               divq1en             RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_divq1en_en  = pll1_forbidden && (|wr_req && rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_divq1en = wdata[17:17];
  assign divq1en                 = cur_rcc_pllcfgr_divq1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_pllcfgr_divq1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_divq1en_en),
      .din  (nxt_rcc_pllcfgr_divq1en),
      .dout (cur_rcc_pllcfgr_divq1en)
  );

  // --------------------------------------------------------------------------------
  // 16:16               divp1en             RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_divp1en_en  = pll1_forbidden && (|wr_req && rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_divp1en = wdata[16:16];
  assign divp1en                 = cur_rcc_pllcfgr_divp1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_pllcfgr_divp1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_divp1en_en),
      .din  (nxt_rcc_pllcfgr_divp1en),
      .dout (cur_rcc_pllcfgr_divp1en)
  );

  // --------------------------------------------------------------------------------
  // 11:10               pll3rge             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_pll3rge_en  = (|wr_req & rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_pll3rge = wdata[11:10];
  assign pll3rge                 = cur_rcc_pllcfgr_pll3rge;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_pllcfgr_pll3rge (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_pll3rge_en),
      .din  (nxt_rcc_pllcfgr_pll3rge),
      .dout (cur_rcc_pllcfgr_pll3rge)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 pll3vcosel          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_pll3vcosel_en  = (|wr_req & rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_pll3vcosel = wdata[9:9];
  assign pll3vcosel                 = cur_rcc_pllcfgr_pll3vcosel;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_pllcfgr_pll3vcosel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_pll3vcosel_en),
      .din  (nxt_rcc_pllcfgr_pll3vcosel),
      .dout (cur_rcc_pllcfgr_pll3vcosel)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 pll3fracen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_pll3fracen_en  = (|wr_req & rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_pll3fracen = wdata[8:8];
  assign pll3fracen                 = cur_rcc_pllcfgr_pll3fracen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_pllcfgr_pll3fracen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_pll3fracen_en),
      .din  (nxt_rcc_pllcfgr_pll3fracen),
      .dout (cur_rcc_pllcfgr_pll3fracen)
  );

  // --------------------------------------------------------------------------------
  // 7:6                 pll2rge             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_pll2rge_en  = (|wr_req & rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_pll2rge = wdata[7:6];
  assign pll2rge                 = cur_rcc_pllcfgr_pll2rge;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_pllcfgr_pll2rge (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_pll2rge_en),
      .din  (nxt_rcc_pllcfgr_pll2rge),
      .dout (cur_rcc_pllcfgr_pll2rge)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 pll2vcosel          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_pll2vcosel_en  = (|wr_req & rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_pll2vcosel = wdata[5:5];
  assign pll2vcosel                 = cur_rcc_pllcfgr_pll2vcosel;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_pllcfgr_pll2vcosel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_pll2vcosel_en),
      .din  (nxt_rcc_pllcfgr_pll2vcosel),
      .dout (cur_rcc_pllcfgr_pll2vcosel)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 pll2fracen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_pll2fracen_en  = (|wr_req & rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_pll2fracen = wdata[4:4];
  assign pll2fracen                 = cur_rcc_pllcfgr_pll2fracen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_pllcfgr_pll2fracen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_pll2fracen_en),
      .din  (nxt_rcc_pllcfgr_pll2fracen),
      .dout (cur_rcc_pllcfgr_pll2fracen)
  );

  // --------------------------------------------------------------------------------
  // 3:2                 pll1rge             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_pll1rge_en  = (|wr_req & rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_pll1rge = wdata[3:2];
  assign pll1rge                 = cur_rcc_pllcfgr_pll1rge;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_pllcfgr_pll1rge (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_pll1rge_en),
      .din  (nxt_rcc_pllcfgr_pll1rge),
      .dout (cur_rcc_pllcfgr_pll1rge)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 pll1vcosel          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_pll1vcosel_en  = (|wr_req & rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_pll1vcosel = wdata[1:1];
  assign pll1vcosel                 = cur_rcc_pllcfgr_pll1vcosel;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_pllcfgr_pll1vcosel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_pll1vcosel_en),
      .din  (nxt_rcc_pllcfgr_pll1vcosel),
      .dout (cur_rcc_pllcfgr_pll1vcosel)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 pll1fracen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_pllcfgr_pll1fracen_en  = (|wr_req & rcc_pllcfgr_sel);
  assign nxt_rcc_pllcfgr_pll1fracen = wdata[0:0];
  assign pll1fracen                 = cur_rcc_pllcfgr_pll1fracen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_pllcfgr_pll1fracen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pllcfgr_pll1fracen_en),
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
  assign rcc_pll1divr_read      = {{1{1'b0}}, cur_rcc_pll1divr_divr1, {1{1'b0}}, cur_rcc_pll1divr_divq1, cur_rcc_pll1divr_divp1, cur_rcc_pll1divr_divn1};

  // --------------------------------------------------------------------------------
  // 30:24               divr1               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pll1divr_divr1_en  = pll1_forbidden && (|wr_req && rcc_pll1divr_sel);
  assign nxt_rcc_pll1divr_divr1 = wdata[30:24];
  assign divr1                  = cur_rcc_pll1divr_divr1;
  BB_dfflr #(
      .DW     (7),
      .RST_VAL('h1)
  ) U_rcc_pll1divr_divr1 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll1divr_divr1_en),
      .din  (nxt_rcc_pll1divr_divr1),
      .dout (cur_rcc_pll1divr_divr1)
  );

  // --------------------------------------------------------------------------------
  // 22:16               divq1               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pll1divr_divq1_en  = pll1_forbidden && (|wr_req && rcc_pll1divr_sel);
  assign nxt_rcc_pll1divr_divq1 = wdata[22:16];
  assign divq1                  = cur_rcc_pll1divr_divq1;
  BB_dfflr #(
      .DW     (7),
      .RST_VAL('h1)
  ) U_rcc_pll1divr_divq1 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll1divr_divq1_en),
      .din  (nxt_rcc_pll1divr_divq1),
      .dout (cur_rcc_pll1divr_divq1)
  );

  // --------------------------------------------------------------------------------
  // 15:9                divp1               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pll1divr_divp1_en  = pll1_forbidden && (|wr_req && rcc_pll1divr_sel);
  assign nxt_rcc_pll1divr_divp1 = wdata[15:9];
  assign divp1                  = cur_rcc_pll1divr_divp1;
  BB_dfflr #(
      .DW     (7),
      .RST_VAL('h1)
  ) U_rcc_pll1divr_divp1 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll1divr_divp1_en),
      .din  (nxt_rcc_pll1divr_divp1),
      .dout (cur_rcc_pll1divr_divp1)
  );

  // --------------------------------------------------------------------------------
  // 8:0                 divn1               RW                  0b10000000          
  // --------------------------------------------------------------------------------
  assign rcc_pll1divr_divn1_en  = pll1_forbidden && (|wr_req && rcc_pll1divr_sel);
  assign nxt_rcc_pll1divr_divn1 = wdata[8:0];
  assign divn1                  = cur_rcc_pll1divr_divn1;
  BB_dfflr #(
      .DW     (9),
      .RST_VAL('h80)
  ) U_rcc_pll1divr_divn1 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll1divr_divn1_en),
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
  assign rcc_pll1fracr_read       = {{16{1'b0}}, cur_rcc_pll1fracr_fracn1, {3{1'b0}}};

  // --------------------------------------------------------------------------------
  // 15:3                fracn1              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_pll1fracr_fracn1_en  = (|wr_req & rcc_pll1fracr_sel);
  assign nxt_rcc_pll1fracr_fracn1 = wdata[15:3];
  assign fracn1                   = cur_rcc_pll1fracr_fracn1;
  BB_dfflr #(
      .DW     (13),
      .RST_VAL('h0)
  ) U_rcc_pll1fracr_fracn1 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll1fracr_fracn1_en),
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
  assign rcc_pll2divr_read      = {{1{1'b0}}, cur_rcc_pll2divr_divr2, {1{1'b0}}, cur_rcc_pll2divr_divq2, cur_rcc_pll2divr_divp2, cur_rcc_pll2divr_divn2};

  // --------------------------------------------------------------------------------
  // 30:24               divr2               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pll2divr_divr2_en  = pll2_forbidden && (|wr_req && rcc_pll2divr_sel);
  assign nxt_rcc_pll2divr_divr2 = wdata[30:24];
  assign divr2                  = cur_rcc_pll2divr_divr2;
  BB_dfflr #(
      .DW     (7),
      .RST_VAL('h1)
  ) U_rcc_pll2divr_divr2 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll2divr_divr2_en),
      .din  (nxt_rcc_pll2divr_divr2),
      .dout (cur_rcc_pll2divr_divr2)
  );

  // --------------------------------------------------------------------------------
  // 22:16               divq2               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pll2divr_divq2_en  = pll2_forbidden && (|wr_req && rcc_pll2divr_sel);
  assign nxt_rcc_pll2divr_divq2 = wdata[22:16];
  assign divq2                  = cur_rcc_pll2divr_divq2;
  BB_dfflr #(
      .DW     (7),
      .RST_VAL('h1)
  ) U_rcc_pll2divr_divq2 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll2divr_divq2_en),
      .din  (nxt_rcc_pll2divr_divq2),
      .dout (cur_rcc_pll2divr_divq2)
  );

  // --------------------------------------------------------------------------------
  // 15:9                divp2               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pll2divr_divp2_en  = pll2_forbidden && (|wr_req && rcc_pll2divr_sel);
  assign nxt_rcc_pll2divr_divp2 = wdata[15:9];
  assign divp2                  = cur_rcc_pll2divr_divp2;
  BB_dfflr #(
      .DW     (7),
      .RST_VAL('h1)
  ) U_rcc_pll2divr_divp2 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll2divr_divp2_en),
      .din  (nxt_rcc_pll2divr_divp2),
      .dout (cur_rcc_pll2divr_divp2)
  );

  // --------------------------------------------------------------------------------
  // 8:0                 divn2               RW                  0b10000000          
  // --------------------------------------------------------------------------------
  assign rcc_pll2divr_divn2_en  = pll2_forbidden && (|wr_req && rcc_pll2divr_sel);
  assign nxt_rcc_pll2divr_divn2 = wdata[8:0];
  assign divn2                  = cur_rcc_pll2divr_divn2;
  BB_dfflr #(
      .DW     (9),
      .RST_VAL('h80)
  ) U_rcc_pll2divr_divn2 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll2divr_divn2_en),
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
  assign rcc_pll2fracr_read       = {{16{1'b0}}, cur_rcc_pll2fracr_fracn2, {3{1'b0}}};

  // --------------------------------------------------------------------------------
  // 15:3                fracn2              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_pll2fracr_fracn2_en  = (|wr_req & rcc_pll2fracr_sel);
  assign nxt_rcc_pll2fracr_fracn2 = wdata[15:3];
  assign fracn2                   = cur_rcc_pll2fracr_fracn2;
  BB_dfflr #(
      .DW     (13),
      .RST_VAL('h0)
  ) U_rcc_pll2fracr_fracn2 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll2fracr_fracn2_en),
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
  assign rcc_pll3divr_read      = {{1{1'b0}}, cur_rcc_pll3divr_divr3, {1{1'b0}}, cur_rcc_pll3divr_divq3, cur_rcc_pll3divr_divp3, cur_rcc_pll3divr_divn3};

  // --------------------------------------------------------------------------------
  // 30:24               divr3               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pll3divr_divr3_en  = pll3_forbidden && (|wr_req && rcc_pll3divr_sel);
  assign nxt_rcc_pll3divr_divr3 = wdata[30:24];
  assign divr3                  = cur_rcc_pll3divr_divr3;
  BB_dfflr #(
      .DW     (7),
      .RST_VAL('h1)
  ) U_rcc_pll3divr_divr3 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll3divr_divr3_en),
      .din  (nxt_rcc_pll3divr_divr3),
      .dout (cur_rcc_pll3divr_divr3)
  );

  // --------------------------------------------------------------------------------
  // 22:16               divq3               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pll3divr_divq3_en  = pll3_forbidden && (|wr_req && rcc_pll3divr_sel);
  assign nxt_rcc_pll3divr_divq3 = wdata[22:16];
  assign divq3                  = cur_rcc_pll3divr_divq3;
  BB_dfflr #(
      .DW     (7),
      .RST_VAL('h1)
  ) U_rcc_pll3divr_divq3 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll3divr_divq3_en),
      .din  (nxt_rcc_pll3divr_divq3),
      .dout (cur_rcc_pll3divr_divq3)
  );

  // --------------------------------------------------------------------------------
  // 15:9                divp3               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_pll3divr_divp3_en  = pll3_forbidden && (|wr_req && rcc_pll3divr_sel);
  assign nxt_rcc_pll3divr_divp3 = wdata[15:9];
  assign divp3                  = cur_rcc_pll3divr_divp3;
  BB_dfflr #(
      .DW     (7),
      .RST_VAL('h1)
  ) U_rcc_pll3divr_divp3 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll3divr_divp3_en),
      .din  (nxt_rcc_pll3divr_divp3),
      .dout (cur_rcc_pll3divr_divp3)
  );

  // --------------------------------------------------------------------------------
  // 8:0                 divn3               RW                  0b10000000          
  // --------------------------------------------------------------------------------
  assign rcc_pll3divr_divn3_en  = pll3_forbidden && (|wr_req && rcc_pll3divr_sel);
  assign nxt_rcc_pll3divr_divn3 = wdata[8:0];
  assign divn3                  = cur_rcc_pll3divr_divn3;
  BB_dfflr #(
      .DW     (9),
      .RST_VAL('h80)
  ) U_rcc_pll3divr_divn3 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll3divr_divn3_en),
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
  assign rcc_pll3fracr_read       = {{16{1'b0}}, cur_rcc_pll3fracr_fracn3, {3{1'b0}}};

  // --------------------------------------------------------------------------------
  // 15:3                fracn3              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_pll3fracr_fracn3_en  = (|wr_req & rcc_pll3fracr_sel);
  assign nxt_rcc_pll3fracr_fracn3 = wdata[15:3];
  assign fracn3                   = cur_rcc_pll3fracr_fracn3;
  BB_dfflr #(
      .DW     (13),
      .RST_VAL('h0)
  ) U_rcc_pll3fracr_fracn3 (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_pll3fracr_fracn3_en),
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
  // 5:4                 qspisel             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:0                 fmcsel              RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_d1ccipr read data
  // --------------------------------------------------------------------------------
  assign rcc_d1ccipr_read          = {{2{1'b0}}, cur_rcc_d1ccipr_clkpersel, {11{1'b0}}, cur_rcc_d1ccipr_sdmmcsel, {10{1'b0}}, cur_rcc_d1ccipr_qspisel, {2{1'b0}}, cur_rcc_d1ccipr_fmcsel};

  // --------------------------------------------------------------------------------
  // 29:28               clkpersel           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d1ccipr_clkpersel_en  = (|wr_req & rcc_d1ccipr_sel);
  assign nxt_rcc_d1ccipr_clkpersel = wdata[29:28];
  assign clkpersel                 = cur_rcc_d1ccipr_clkpersel;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_d1ccipr_clkpersel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d1ccipr_clkpersel_en),
      .din  (nxt_rcc_d1ccipr_clkpersel),
      .dout (cur_rcc_d1ccipr_clkpersel)
  );

  // --------------------------------------------------------------------------------
  // 16:16               sdmmcsel            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d1ccipr_sdmmcsel_en  = (|wr_req & rcc_d1ccipr_sel);
  assign nxt_rcc_d1ccipr_sdmmcsel = wdata[16:16];
  assign sdmmcsel                 = cur_rcc_d1ccipr_sdmmcsel;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_d1ccipr_sdmmcsel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d1ccipr_sdmmcsel_en),
      .din  (nxt_rcc_d1ccipr_sdmmcsel),
      .dout (cur_rcc_d1ccipr_sdmmcsel)
  );

  // --------------------------------------------------------------------------------
  // 5:4                 qspisel             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d1ccipr_qspisel_en  = (|wr_req & rcc_d1ccipr_sel);
  assign nxt_rcc_d1ccipr_qspisel = wdata[5:4];
  assign qspisel                 = cur_rcc_d1ccipr_qspisel;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_d1ccipr_qspisel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d1ccipr_qspisel_en),
      .din  (nxt_rcc_d1ccipr_qspisel),
      .dout (cur_rcc_d1ccipr_qspisel)
  );

  // --------------------------------------------------------------------------------
  // 1:0                 fmcsel              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d1ccipr_fmcsel_en  = (|wr_req & rcc_d1ccipr_sel);
  assign nxt_rcc_d1ccipr_fmcsel = wdata[1:0];
  assign fmcsel                 = cur_rcc_d1ccipr_fmcsel;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_d1ccipr_fmcsel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d1ccipr_fmcsel_en),
      .din  (nxt_rcc_d1ccipr_fmcsel),
      .dout (cur_rcc_d1ccipr_fmcsel)
  );


  // --------------------------------------------------------------------------------
  // rcc_d2ccip1r                            0x50                                    
  // --------------------------------------------------------------------------------
  // 31:31               swpmisel            RW                  0b0                 
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
  // 2:0                 sai1sel             RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_d2ccip1r read data
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip1r_read = {
    cur_rcc_d2ccip1r_swpmisel, {1{1'b0}}, cur_rcc_d2ccip1r_fdcansel, {3{1'b0}}, cur_rcc_d2ccip1r_dfsdm1sel, {2{1'b0}}, cur_rcc_d2ccip1r_spdifsel, {1{1'b0}}, cur_rcc_d2ccip1r_spi45sel, {1{1'b0}}, cur_rcc_d2ccip1r_spi123sel, {3{1'b0}}, cur_rcc_d2ccip1r_sai23sel, {3{1'b0}}, cur_rcc_d2ccip1r_sai1sel
  };

  // --------------------------------------------------------------------------------
  // 31:31               swpmisel            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip1r_swpmisel_en = (|wr_req & rcc_d2ccip1r_sel);
  assign nxt_rcc_d2ccip1r_swpmisel = wdata[31:31];
  assign swpmisel = cur_rcc_d2ccip1r_swpmisel;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_d2ccip1r_swpmisel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip1r_swpmisel_en),
      .din  (nxt_rcc_d2ccip1r_swpmisel),
      .dout (cur_rcc_d2ccip1r_swpmisel)
  );

  // --------------------------------------------------------------------------------
  // 29:28               fdcansel            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip1r_fdcansel_en  = (|wr_req & rcc_d2ccip1r_sel);
  assign nxt_rcc_d2ccip1r_fdcansel = wdata[29:28];
  assign fdcansel                  = cur_rcc_d2ccip1r_fdcansel;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_d2ccip1r_fdcansel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip1r_fdcansel_en),
      .din  (nxt_rcc_d2ccip1r_fdcansel),
      .dout (cur_rcc_d2ccip1r_fdcansel)
  );

  // --------------------------------------------------------------------------------
  // 24:24               dfsdm1sel           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip1r_dfsdm1sel_en  = (|wr_req & rcc_d2ccip1r_sel);
  assign nxt_rcc_d2ccip1r_dfsdm1sel = wdata[24:24];
  assign dfsdm1sel                  = cur_rcc_d2ccip1r_dfsdm1sel;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_d2ccip1r_dfsdm1sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip1r_dfsdm1sel_en),
      .din  (nxt_rcc_d2ccip1r_dfsdm1sel),
      .dout (cur_rcc_d2ccip1r_dfsdm1sel)
  );

  // --------------------------------------------------------------------------------
  // 21:20               spdifsel            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip1r_spdifsel_en  = (|wr_req & rcc_d2ccip1r_sel);
  assign nxt_rcc_d2ccip1r_spdifsel = wdata[21:20];
  assign spdifsel                  = cur_rcc_d2ccip1r_spdifsel;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_d2ccip1r_spdifsel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip1r_spdifsel_en),
      .din  (nxt_rcc_d2ccip1r_spdifsel),
      .dout (cur_rcc_d2ccip1r_spdifsel)
  );

  // --------------------------------------------------------------------------------
  // 18:16               spi45sel            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip1r_spi45sel_en  = (|wr_req & rcc_d2ccip1r_sel);
  assign nxt_rcc_d2ccip1r_spi45sel = wdata[18:16];
  assign spi45sel                  = cur_rcc_d2ccip1r_spi45sel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d2ccip1r_spi45sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip1r_spi45sel_en),
      .din  (nxt_rcc_d2ccip1r_spi45sel),
      .dout (cur_rcc_d2ccip1r_spi45sel)
  );

  // --------------------------------------------------------------------------------
  // 14:12               spi123sel           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip1r_spi123sel_en  = (|wr_req & rcc_d2ccip1r_sel);
  assign nxt_rcc_d2ccip1r_spi123sel = wdata[14:12];
  assign spi123sel                  = cur_rcc_d2ccip1r_spi123sel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d2ccip1r_spi123sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip1r_spi123sel_en),
      .din  (nxt_rcc_d2ccip1r_spi123sel),
      .dout (cur_rcc_d2ccip1r_spi123sel)
  );

  // --------------------------------------------------------------------------------
  // 8:6                 sai23sel            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip1r_sai23sel_en  = (|wr_req & rcc_d2ccip1r_sel);
  assign nxt_rcc_d2ccip1r_sai23sel = wdata[8:6];
  assign sai23sel                  = cur_rcc_d2ccip1r_sai23sel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d2ccip1r_sai23sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip1r_sai23sel_en),
      .din  (nxt_rcc_d2ccip1r_sai23sel),
      .dout (cur_rcc_d2ccip1r_sai23sel)
  );

  // --------------------------------------------------------------------------------
  // 2:0                 sai1sel             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip1r_sai1sel_en  = (|wr_req & rcc_d2ccip1r_sel);
  assign nxt_rcc_d2ccip1r_sai1sel = wdata[2:0];
  assign sai1sel                  = cur_rcc_d2ccip1r_sai1sel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d2ccip1r_sai1sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip1r_sai1sel_en),
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
  assign rcc_d2ccip2r_read          = {{1{1'b0}}, cur_rcc_d2ccip2r_lptim1sel, {4{1'b0}}, cur_rcc_d2ccip2r_cecsel, cur_rcc_d2ccip2r_usbsel, {6{1'b0}}, cur_rcc_d2ccip2r_i2c123sel, {2{1'b0}}, cur_rcc_d2ccip2r_rngsel, {2{1'b0}}, cur_rcc_d2ccip2r_usart16sel, cur_rcc_d2ccip2r_usart234578sel};

  // --------------------------------------------------------------------------------
  // 30:28               lptim1sel           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip2r_lptim1sel_en  = (|wr_req & rcc_d2ccip2r_sel);
  assign nxt_rcc_d2ccip2r_lptim1sel = wdata[30:28];
  assign lptim1sel                  = cur_rcc_d2ccip2r_lptim1sel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d2ccip2r_lptim1sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip2r_lptim1sel_en),
      .din  (nxt_rcc_d2ccip2r_lptim1sel),
      .dout (cur_rcc_d2ccip2r_lptim1sel)
  );

  // --------------------------------------------------------------------------------
  // 23:22               cecsel              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip2r_cecsel_en  = (|wr_req & rcc_d2ccip2r_sel);
  assign nxt_rcc_d2ccip2r_cecsel = wdata[23:22];
  assign cecsel                  = cur_rcc_d2ccip2r_cecsel;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_d2ccip2r_cecsel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip2r_cecsel_en),
      .din  (nxt_rcc_d2ccip2r_cecsel),
      .dout (cur_rcc_d2ccip2r_cecsel)
  );

  // --------------------------------------------------------------------------------
  // 21:20               usbsel              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip2r_usbsel_en  = (|wr_req & rcc_d2ccip2r_sel);
  assign nxt_rcc_d2ccip2r_usbsel = wdata[21:20];
  assign usbsel                  = cur_rcc_d2ccip2r_usbsel;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_d2ccip2r_usbsel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip2r_usbsel_en),
      .din  (nxt_rcc_d2ccip2r_usbsel),
      .dout (cur_rcc_d2ccip2r_usbsel)
  );

  // --------------------------------------------------------------------------------
  // 13:12               i2c123sel           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip2r_i2c123sel_en  = (|wr_req & rcc_d2ccip2r_sel);
  assign nxt_rcc_d2ccip2r_i2c123sel = wdata[13:12];
  assign i2c123sel                  = cur_rcc_d2ccip2r_i2c123sel;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_d2ccip2r_i2c123sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip2r_i2c123sel_en),
      .din  (nxt_rcc_d2ccip2r_i2c123sel),
      .dout (cur_rcc_d2ccip2r_i2c123sel)
  );

  // --------------------------------------------------------------------------------
  // 9:8                 rngsel              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip2r_rngsel_en  = (|wr_req & rcc_d2ccip2r_sel);
  assign nxt_rcc_d2ccip2r_rngsel = wdata[9:8];
  assign rngsel                  = cur_rcc_d2ccip2r_rngsel;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_d2ccip2r_rngsel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip2r_rngsel_en),
      .din  (nxt_rcc_d2ccip2r_rngsel),
      .dout (cur_rcc_d2ccip2r_rngsel)
  );

  // --------------------------------------------------------------------------------
  // 5:3                 usart16sel          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip2r_usart16sel_en  = (|wr_req & rcc_d2ccip2r_sel);
  assign nxt_rcc_d2ccip2r_usart16sel = wdata[5:3];
  assign usart16sel                  = cur_rcc_d2ccip2r_usart16sel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d2ccip2r_usart16sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip2r_usart16sel_en),
      .din  (nxt_rcc_d2ccip2r_usart16sel),
      .dout (cur_rcc_d2ccip2r_usart16sel)
  );

  // --------------------------------------------------------------------------------
  // 2:0                 usart234578sel      RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d2ccip2r_usart234578sel_en  = (|wr_req & rcc_d2ccip2r_sel);
  assign nxt_rcc_d2ccip2r_usart234578sel = wdata[2:0];
  assign usart234578sel                  = cur_rcc_d2ccip2r_usart234578sel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d2ccip2r_usart234578sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d2ccip2r_usart234578sel_en),
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
  assign rcc_d3ccipr_read        = {{1{1'b0}}, cur_rcc_d3ccipr_spi6sel, {1{1'b0}}, cur_rcc_d3ccipr_sai4bsel, cur_rcc_d3ccipr_sai4asel, {3{1'b0}}, cur_rcc_d3ccipr_adcsel, cur_rcc_d3ccipr_lptim345sel, cur_rcc_d3ccipr_lptim2sel, cur_rcc_d3ccipr_i2c4sel, {5{1'b0}}, cur_rcc_d3ccipr_lpuart1sel};

  // --------------------------------------------------------------------------------
  // 30:28               spi6sel             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d3ccipr_spi6sel_en  = (|wr_req & rcc_d3ccipr_sel);
  assign nxt_rcc_d3ccipr_spi6sel = wdata[30:28];
  assign spi6sel                 = cur_rcc_d3ccipr_spi6sel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d3ccipr_spi6sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d3ccipr_spi6sel_en),
      .din  (nxt_rcc_d3ccipr_spi6sel),
      .dout (cur_rcc_d3ccipr_spi6sel)
  );

  // --------------------------------------------------------------------------------
  // 26:24               sai4bsel            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d3ccipr_sai4bsel_en  = (|wr_req & rcc_d3ccipr_sel);
  assign nxt_rcc_d3ccipr_sai4bsel = wdata[26:24];
  assign sai4bsel                 = cur_rcc_d3ccipr_sai4bsel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d3ccipr_sai4bsel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d3ccipr_sai4bsel_en),
      .din  (nxt_rcc_d3ccipr_sai4bsel),
      .dout (cur_rcc_d3ccipr_sai4bsel)
  );

  // --------------------------------------------------------------------------------
  // 23:21               sai4asel            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d3ccipr_sai4asel_en  = (|wr_req & rcc_d3ccipr_sel);
  assign nxt_rcc_d3ccipr_sai4asel = wdata[23:21];
  assign sai4asel                 = cur_rcc_d3ccipr_sai4asel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d3ccipr_sai4asel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d3ccipr_sai4asel_en),
      .din  (nxt_rcc_d3ccipr_sai4asel),
      .dout (cur_rcc_d3ccipr_sai4asel)
  );

  // --------------------------------------------------------------------------------
  // 17:16               adcsel              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d3ccipr_adcsel_en  = (|wr_req & rcc_d3ccipr_sel);
  assign nxt_rcc_d3ccipr_adcsel = wdata[17:16];
  assign adcsel                 = cur_rcc_d3ccipr_adcsel;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_d3ccipr_adcsel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d3ccipr_adcsel_en),
      .din  (nxt_rcc_d3ccipr_adcsel),
      .dout (cur_rcc_d3ccipr_adcsel)
  );

  // --------------------------------------------------------------------------------
  // 15:13               lptim345sel         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d3ccipr_lptim345sel_en  = (|wr_req & rcc_d3ccipr_sel);
  assign nxt_rcc_d3ccipr_lptim345sel = wdata[15:13];
  assign lptim345sel                 = cur_rcc_d3ccipr_lptim345sel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d3ccipr_lptim345sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d3ccipr_lptim345sel_en),
      .din  (nxt_rcc_d3ccipr_lptim345sel),
      .dout (cur_rcc_d3ccipr_lptim345sel)
  );

  // --------------------------------------------------------------------------------
  // 12:10               lptim2sel           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d3ccipr_lptim2sel_en  = (|wr_req & rcc_d3ccipr_sel);
  assign nxt_rcc_d3ccipr_lptim2sel = wdata[12:10];
  assign lptim2sel                 = cur_rcc_d3ccipr_lptim2sel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d3ccipr_lptim2sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d3ccipr_lptim2sel_en),
      .din  (nxt_rcc_d3ccipr_lptim2sel),
      .dout (cur_rcc_d3ccipr_lptim2sel)
  );

  // --------------------------------------------------------------------------------
  // 9:8                 i2c4sel             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d3ccipr_i2c4sel_en  = (|wr_req & rcc_d3ccipr_sel);
  assign nxt_rcc_d3ccipr_i2c4sel = wdata[9:8];
  assign i2c4sel                 = cur_rcc_d3ccipr_i2c4sel;
  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_d3ccipr_i2c4sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d3ccipr_i2c4sel_en),
      .din  (nxt_rcc_d3ccipr_i2c4sel),
      .dout (cur_rcc_d3ccipr_i2c4sel)
  );

  // --------------------------------------------------------------------------------
  // 2:0                 lpuart1sel          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_d3ccipr_lpuart1sel_en  = (|wr_req & rcc_d3ccipr_sel);
  assign nxt_rcc_d3ccipr_lpuart1sel = wdata[2:0];
  assign lpuart1sel                 = cur_rcc_d3ccipr_lpuart1sel;
  BB_dfflr #(
      .DW     (3),
      .RST_VAL('h0)
  ) U_rcc_d3ccipr_lpuart1sel (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_d3ccipr_lpuart1sel_en),
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
  assign rcc_cier_read         = {{22{1'b0}}, cur_rcc_cier_lsecssie, cur_rcc_cier_pll3rdyie, cur_rcc_cier_pll2rdyie, cur_rcc_cier_pll1rdyie, cur_rcc_cier_hsi48rdyie, cur_rcc_cier_csirdyie, cur_rcc_cier_hserdyie, cur_rcc_cier_hsirdyie, cur_rcc_cier_lserdyie, cur_rcc_cier_lsirdyie};

  // --------------------------------------------------------------------------------
  // 9:9                 lsecssie            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cier_lsecssie_en  = (|wr_req & rcc_cier_sel);
  assign nxt_rcc_cier_lsecssie = wdata[9:9];
  assign lsecssie              = cur_rcc_cier_lsecssie;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cier_lsecssie (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cier_lsecssie_en),
      .din  (nxt_rcc_cier_lsecssie),
      .dout (cur_rcc_cier_lsecssie)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 pll3rdyie           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cier_pll3rdyie_en  = (|wr_req & rcc_cier_sel);
  assign nxt_rcc_cier_pll3rdyie = wdata[8:8];
  assign pll3rdyie              = cur_rcc_cier_pll3rdyie;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cier_pll3rdyie (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cier_pll3rdyie_en),
      .din  (nxt_rcc_cier_pll3rdyie),
      .dout (cur_rcc_cier_pll3rdyie)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 pll2rdyie           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cier_pll2rdyie_en  = (|wr_req & rcc_cier_sel);
  assign nxt_rcc_cier_pll2rdyie = wdata[7:7];
  assign pll2rdyie              = cur_rcc_cier_pll2rdyie;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cier_pll2rdyie (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cier_pll2rdyie_en),
      .din  (nxt_rcc_cier_pll2rdyie),
      .dout (cur_rcc_cier_pll2rdyie)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 pll1rdyie           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cier_pll1rdyie_en  = (|wr_req & rcc_cier_sel);
  assign nxt_rcc_cier_pll1rdyie = wdata[6:6];
  assign pll1rdyie              = cur_rcc_cier_pll1rdyie;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cier_pll1rdyie (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cier_pll1rdyie_en),
      .din  (nxt_rcc_cier_pll1rdyie),
      .dout (cur_rcc_cier_pll1rdyie)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 hsi48rdyie          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cier_hsi48rdyie_en  = (|wr_req & rcc_cier_sel);
  assign nxt_rcc_cier_hsi48rdyie = wdata[5:5];
  assign hsi48rdyie              = cur_rcc_cier_hsi48rdyie;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cier_hsi48rdyie (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cier_hsi48rdyie_en),
      .din  (nxt_rcc_cier_hsi48rdyie),
      .dout (cur_rcc_cier_hsi48rdyie)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 csirdyie            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cier_csirdyie_en  = (|wr_req & rcc_cier_sel);
  assign nxt_rcc_cier_csirdyie = wdata[4:4];
  assign csirdyie              = cur_rcc_cier_csirdyie;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cier_csirdyie (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cier_csirdyie_en),
      .din  (nxt_rcc_cier_csirdyie),
      .dout (cur_rcc_cier_csirdyie)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 hserdyie            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cier_hserdyie_en  = (|wr_req & rcc_cier_sel);
  assign nxt_rcc_cier_hserdyie = wdata[3:3];
  assign hserdyie              = cur_rcc_cier_hserdyie;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cier_hserdyie (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cier_hserdyie_en),
      .din  (nxt_rcc_cier_hserdyie),
      .dout (cur_rcc_cier_hserdyie)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 hsirdyie            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cier_hsirdyie_en  = (|wr_req & rcc_cier_sel);
  assign nxt_rcc_cier_hsirdyie = wdata[2:2];
  assign hsirdyie              = cur_rcc_cier_hsirdyie;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cier_hsirdyie (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cier_hsirdyie_en),
      .din  (nxt_rcc_cier_hsirdyie),
      .dout (cur_rcc_cier_hsirdyie)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 lserdyie            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cier_lserdyie_en  = (|wr_req & rcc_cier_sel);
  assign nxt_rcc_cier_lserdyie = wdata[1:1];
  assign lserdyie              = cur_rcc_cier_lserdyie;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cier_lserdyie (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cier_lserdyie_en),
      .din  (nxt_rcc_cier_lserdyie),
      .dout (cur_rcc_cier_lserdyie)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 lsirdyie            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cier_lsirdyie_en  = (|wr_req & rcc_cier_sel);
  assign nxt_rcc_cier_lsirdyie = wdata[0:0];
  assign lsirdyie              = cur_rcc_cier_lsirdyie;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cier_lsirdyie (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cier_lsirdyie_en),
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
  assign rcc_cifr_read        = {{21{1'b0}}, cur_rcc_cifr_hsecssf, cur_rcc_cifr_lsecssf, cur_rcc_cifr_pll3rdyf, cur_rcc_cifr_pll2rdyf, cur_rcc_cifr_pll1rdyf, cur_rcc_cifr_hsi48rdyf, cur_rcc_cifr_csirdyf, cur_rcc_cifr_hserdyf, cur_rcc_cifr_hsirdyf, cur_rcc_cifr_lserdyf, cur_rcc_cifr_lsirdyf};

  // --------------------------------------------------------------------------------
  // 10:10               hsecssf             RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cifr_hsecssf_set = sync_hsecss_fail;
  assign rcc_cifr_hsecssf_clr = cur_rcc_cicr_hsecssc;
  assign rcc_cifr_hsecssf_en  = rcc_cifr_hsecssf_set | rcc_cifr_hsecssf_clr;
  assign nxt_rcc_cifr_hsecssf = rcc_cifr_hsecssf_set;
  assign rcc_hsecssf          = cur_rcc_cifr_hsecssf;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cifr_hsecssf (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cifr_hsecssf_en),
      .din  (nxt_rcc_cifr_hsecssf),
      .dout (cur_rcc_cifr_hsecssf)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 lsecssf             RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cifr_lsecssf_set = sync_lsecss_fail;
  assign rcc_cifr_lsecssf_clr = cur_rcc_cicr_lsecssc;
  assign rcc_cifr_lsecssf_en  = rcc_cifr_lsecssf_set | rcc_cifr_lsecssf_clr;
  assign nxt_rcc_cifr_lsecssf = rcc_cifr_lsecssf_set;
  assign rcc_lsecssf          = cur_rcc_cifr_lsecssf;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cifr_lsecssf (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cifr_lsecssf_en),
      .din  (nxt_rcc_cifr_lsecssf),
      .dout (cur_rcc_cifr_lsecssf)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 pll3rdyf            RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cifr_pll3rdyf_set = sync_pll3_rdy;
  assign rcc_cifr_pll3rdyf_clr = cur_rcc_cicr_pll3rdyc;
  assign rcc_cifr_pll3rdyf_en  = rcc_cifr_pll3rdyf_set | rcc_cifr_pll3rdyf_clr;
  assign nxt_rcc_cifr_pll3rdyf = rcc_cifr_pll3rdyf_set;
  assign rcc_pll3rdyf          = cur_rcc_cifr_pll3rdyf;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cifr_pll3rdyf (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cifr_pll3rdyf_en),
      .din  (nxt_rcc_cifr_pll3rdyf),
      .dout (cur_rcc_cifr_pll3rdyf)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 pll2rdyf            RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cifr_pll2rdyf_set = sync_pll2_rdy;
  assign rcc_cifr_pll2rdyf_clr = cur_rcc_cicr_pll2rdyc;
  assign rcc_cifr_pll2rdyf_en  = rcc_cifr_pll2rdyf_set | rcc_cifr_pll2rdyf_clr;
  assign nxt_rcc_cifr_pll2rdyf = rcc_cifr_pll2rdyf_set;
  assign rcc_pll2rdyf          = cur_rcc_cifr_pll2rdyf;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cifr_pll2rdyf (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cifr_pll2rdyf_en),
      .din  (nxt_rcc_cifr_pll2rdyf),
      .dout (cur_rcc_cifr_pll2rdyf)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 pll1rdyf            RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cifr_pll1rdyf_set = sync_pll1_rdy;
  assign rcc_cifr_pll1rdyf_clr = cur_rcc_cicr_pll1rdyc;
  assign rcc_cifr_pll1rdyf_en  = rcc_cifr_pll1rdyf_set | rcc_cifr_pll1rdyf_clr;
  assign nxt_rcc_cifr_pll1rdyf = rcc_cifr_pll1rdyf_set;
  assign rcc_pll1rdyf          = cur_rcc_cifr_pll1rdyf;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cifr_pll1rdyf (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cifr_pll1rdyf_en),
      .din  (nxt_rcc_cifr_pll1rdyf),
      .dout (cur_rcc_cifr_pll1rdyf)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 hsi48rdyf           RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cifr_hsi48rdyf_set = sync_hsi48_rdy;
  assign rcc_cifr_hsi48rdyf_clr = cur_rcc_cicr_hsi48rdyc;
  assign rcc_cifr_hsi48rdyf_en  = rcc_cifr_hsi48rdyf_set | rcc_cifr_hsi48rdyf_clr;
  assign nxt_rcc_cifr_hsi48rdyf = rcc_cifr_hsi48rdyf_set;
  assign rcc_hsi48rdyf          = cur_rcc_cifr_hsi48rdyf;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cifr_hsi48rdyf (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cifr_hsi48rdyf_en),
      .din  (nxt_rcc_cifr_hsi48rdyf),
      .dout (cur_rcc_cifr_hsi48rdyf)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 csirdyf             RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cifr_csirdyf_set = sync_csi_rdy;
  assign rcc_cifr_csirdyf_clr = cur_rcc_cicr_csirdyc;
  assign rcc_cifr_csirdyf_en  = rcc_cifr_csirdyf_set | rcc_cifr_csirdyf_clr;
  assign nxt_rcc_cifr_csirdyf = rcc_cifr_csirdyf_set;
  assign rcc_csirdyf          = cur_rcc_cifr_csirdyf;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cifr_csirdyf (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cifr_csirdyf_en),
      .din  (nxt_rcc_cifr_csirdyf),
      .dout (cur_rcc_cifr_csirdyf)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 hserdyf             RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cifr_hserdyf_set = sync_hse_rdy;
  assign rcc_cifr_hserdyf_clr = cur_rcc_cicr_hserdyc;
  assign rcc_cifr_hserdyf_en  = rcc_cifr_hserdyf_set | rcc_cifr_hserdyf_clr;
  assign nxt_rcc_cifr_hserdyf = rcc_cifr_hserdyf_set;
  assign rcc_hserdyf          = cur_rcc_cifr_hserdyf;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cifr_hserdyf (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cifr_hserdyf_en),
      .din  (nxt_rcc_cifr_hserdyf),
      .dout (cur_rcc_cifr_hserdyf)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 hsirdyf             RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cifr_hsirdyf_set = sync_hsi_rdy;
  assign rcc_cifr_hsirdyf_clr = cur_rcc_cicr_hsirdyc;
  assign rcc_cifr_hsirdyf_en  = rcc_cifr_hsirdyf_set | rcc_cifr_hsirdyf_clr;
  assign nxt_rcc_cifr_hsirdyf = rcc_cifr_hsirdyf_set;
  assign rcc_hsirdyf          = cur_rcc_cifr_hsirdyf;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cifr_hsirdyf (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cifr_hsirdyf_en),
      .din  (nxt_rcc_cifr_hsirdyf),
      .dout (cur_rcc_cifr_hsirdyf)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 lserdyf             RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cifr_lserdyf_set = sync_lse_rdy;
  assign rcc_cifr_lserdyf_clr = cur_rcc_cicr_lserdyc;
  assign rcc_cifr_lserdyf_en  = rcc_cifr_lserdyf_set | rcc_cifr_lserdyf_clr;
  assign nxt_rcc_cifr_lserdyf = rcc_cifr_lserdyf_set;
  assign rcc_lserdyf          = cur_rcc_cifr_lserdyf;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cifr_lserdyf (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cifr_lserdyf_en),
      .din  (nxt_rcc_cifr_lserdyf),
      .dout (cur_rcc_cifr_lserdyf)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 lsirdyf             RO                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cifr_lsirdyf_set = sync_lsi_rdy;
  assign rcc_cifr_lsirdyf_clr = cur_rcc_cicr_lsirdyc;
  assign rcc_cifr_lsirdyf_en  = rcc_cifr_lsirdyf_set | rcc_cifr_lsirdyf_clr;
  assign nxt_rcc_cifr_lsirdyf = rcc_cifr_lsirdyf_set;
  assign rcc_lsirdyf          = cur_rcc_cifr_lsirdyf;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cifr_lsirdyf (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cifr_lsirdyf_en),
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
  assign rcc_cicr_read        = {{21{1'b0}}, cur_rcc_cicr_hsecssc, cur_rcc_cicr_lsecssc, cur_rcc_cicr_pll3rdyc, cur_rcc_cicr_pll2rdyc, cur_rcc_cicr_pll1rdyc, cur_rcc_cicr_hsi48rdyc, cur_rcc_cicr_csirdyc, cur_rcc_cicr_hserdyc, cur_rcc_cicr_hsirdyc, cur_rcc_cicr_lserdyc, cur_rcc_cicr_lsirdyc};

  // --------------------------------------------------------------------------------
  // 10:10               hsecssc             W1C                 0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cicr_hsecssc_set = wdata[10] && (|wr_req && rcc_cicr_sel);
  assign rcc_cicr_hsecssc_clr = ~cur_rcc_cifr_hsecssf;
  assign rcc_cicr_hsecssc_en  = rcc_cicr_hsecssc_set | rcc_cicr_hsecssc_clr;
  assign nxt_rcc_cicr_hsecssc = rcc_cicr_hsecssc_set;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cicr_hsecssc (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cicr_hsecssc_en),
      .din  (nxt_rcc_cicr_hsecssc),
      .dout (cur_rcc_cicr_hsecssc)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 lsecssc             W1C                 0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cicr_lsecssc_set = wdata[9] && (|wr_req && rcc_cicr_sel);
  assign rcc_cicr_lsecssc_clr = ~cur_rcc_cifr_lsecssf;
  assign rcc_cicr_lsecssc_en  = rcc_cicr_lsecssc_set | rcc_cicr_lsecssc_clr;
  assign nxt_rcc_cicr_lsecssc = rcc_cicr_lsecssc_set;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cicr_lsecssc (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cicr_lsecssc_en),
      .din  (nxt_rcc_cicr_lsecssc),
      .dout (cur_rcc_cicr_lsecssc)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 pll3rdyc            W1C                 0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cicr_pll3rdyc_set = wdata[8] && (|wr_req && rcc_cicr_sel);
  assign rcc_cicr_pll3rdyc_clr = ~cur_rcc_cifr_pll3rdyf;
  assign rcc_cicr_pll3rdyc_en  = rcc_cicr_pll3rdyc_set | rcc_cicr_pll3rdyc_clr;
  assign nxt_rcc_cicr_pll3rdyc = rcc_cicr_pll3rdyc_set;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cicr_pll3rdyc (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cicr_pll3rdyc_en),
      .din  (nxt_rcc_cicr_pll3rdyc),
      .dout (cur_rcc_cicr_pll3rdyc)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 pll2rdyc            W1C                 0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cicr_pll2rdyc_set = wdata[7] && (|wr_req && rcc_cicr_sel);
  assign rcc_cicr_pll2rdyc_clr = ~cur_rcc_cifr_pll2rdyf;
  assign rcc_cicr_pll2rdyc_en  = rcc_cicr_pll2rdyc_set | rcc_cicr_pll2rdyc_clr;
  assign nxt_rcc_cicr_pll2rdyc = rcc_cicr_pll2rdyc_set;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cicr_pll2rdyc (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cicr_pll2rdyc_en),
      .din  (nxt_rcc_cicr_pll2rdyc),
      .dout (cur_rcc_cicr_pll2rdyc)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 pll1rdyc            W1C                 0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cicr_pll1rdyc_set = wdata[6] && (|wr_req && rcc_cicr_sel);
  assign rcc_cicr_pll1rdyc_clr = ~cur_rcc_cifr_pll1rdyf;
  assign rcc_cicr_pll1rdyc_en  = rcc_cicr_pll1rdyc_set | rcc_cicr_pll1rdyc_clr;
  assign nxt_rcc_cicr_pll1rdyc = rcc_cicr_pll1rdyc_set;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cicr_pll1rdyc (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cicr_pll1rdyc_en),
      .din  (nxt_rcc_cicr_pll1rdyc),
      .dout (cur_rcc_cicr_pll1rdyc)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 hsi48rdyc           W1C                 0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cicr_hsi48rdyc_set = wdata[5] && (|wr_req && rcc_cicr_sel);
  assign rcc_cicr_hsi48rdyc_clr = ~cur_rcc_cifr_hsi48rdyf;
  assign rcc_cicr_hsi48rdyc_en  = rcc_cicr_hsi48rdyc_set | rcc_cicr_hsi48rdyc_clr;
  assign nxt_rcc_cicr_hsi48rdyc = rcc_cicr_hsi48rdyc_set;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cicr_hsi48rdyc (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cicr_hsi48rdyc_en),
      .din  (nxt_rcc_cicr_hsi48rdyc),
      .dout (cur_rcc_cicr_hsi48rdyc)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 csirdyc             W1C                 0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cicr_csirdyc_set = wdata[4] && (|wr_req && rcc_cicr_sel);
  assign rcc_cicr_csirdyc_clr = ~cur_rcc_cifr_csirdyf;
  assign rcc_cicr_csirdyc_en  = rcc_cicr_csirdyc_set | rcc_cicr_csirdyc_clr;
  assign nxt_rcc_cicr_csirdyc = rcc_cicr_csirdyc_set;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cicr_csirdyc (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cicr_csirdyc_en),
      .din  (nxt_rcc_cicr_csirdyc),
      .dout (cur_rcc_cicr_csirdyc)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 hserdyc             W1C                 0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cicr_hserdyc_set = wdata[3] && (|wr_req && rcc_cicr_sel);
  assign rcc_cicr_hserdyc_clr = ~cur_rcc_cifr_hserdyf;
  assign rcc_cicr_hserdyc_en  = rcc_cicr_hserdyc_set | rcc_cicr_hserdyc_clr;
  assign nxt_rcc_cicr_hserdyc = rcc_cicr_hserdyc_set;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cicr_hserdyc (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cicr_hserdyc_en),
      .din  (nxt_rcc_cicr_hserdyc),
      .dout (cur_rcc_cicr_hserdyc)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 hsirdyc             W1C                 0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cicr_hsirdyc_set = wdata[2] && (|wr_req && rcc_cicr_sel);
  assign rcc_cicr_hsirdyc_clr = ~cur_rcc_cifr_hsirdyf;
  assign rcc_cicr_hsirdyc_en  = rcc_cicr_hsirdyc_set | rcc_cicr_hsirdyc_clr;
  assign nxt_rcc_cicr_hsirdyc = rcc_cicr_hsirdyc_set;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cicr_hsirdyc (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cicr_hsirdyc_en),
      .din  (nxt_rcc_cicr_hsirdyc),
      .dout (cur_rcc_cicr_hsirdyc)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 lserdyc             W1C                 0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cicr_lserdyc_set = wdata[1] && (|wr_req && rcc_cicr_sel);
  assign rcc_cicr_lserdyc_clr = ~cur_rcc_cifr_lserdyf;
  assign rcc_cicr_lserdyc_en  = rcc_cicr_lserdyc_set | rcc_cicr_lserdyc_clr;
  assign nxt_rcc_cicr_lserdyc = rcc_cicr_lserdyc_set;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cicr_lserdyc (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cicr_lserdyc_en),
      .din  (nxt_rcc_cicr_lserdyc),
      .dout (cur_rcc_cicr_lserdyc)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 lsirdyc             W1C                 0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_cicr_lsirdyc_set = wdata[0] && (|wr_req && rcc_cicr_sel);
  assign rcc_cicr_lsirdyc_clr = ~cur_rcc_cifr_lsirdyf;
  assign rcc_cicr_lsirdyc_en  = rcc_cicr_lsirdyc_set | rcc_cicr_lsirdyc_clr;
  assign nxt_rcc_cicr_lsirdyc = rcc_cicr_lsirdyc_set;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_cicr_lsirdyc (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_cicr_lsirdyc_en),
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
  assign rcc_bdcr_read         = {{15{1'b0}}, cur_rcc_bdcr_bdrst, cur_rcc_bdcr_rtcen, {5{1'b0}}, cur_rcc_bdcr_rtcsel, {1{1'b0}}, cur_rcc_bdcr_lsecssd, cur_rcc_bdcr_lsecsson, cur_rcc_bdcr_lsedrv, cur_rcc_bdcr_lsebyp, cur_rcc_bdcr_lserdy, cur_rcc_bdcr_lseon};

  assign nxt_rcc_bdcr_bdrst    = wdata[16:16];
  assign nxt_rcc_bdcr_rtcen    = wdata[15:15];
  assign nxt_rcc_bdcr_rtcsel   = wdata[9:8];
  assign nxt_rcc_bdcr_lsecsson = wdata[5:5];
  assign nxt_rcc_bdcr_lsedrv   = wdata[4:3];
  assign nxt_rcc_bdcr_lsebyp   = wdata[2:2];
  assign nxt_rcc_bdcr_lseon    = wdata[0:0];


  // --------------------------------------------------------------------------------
  // 16:16               bdrst               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_bdcr_byte2_en     = (wr_req[2] & rcc_bdcr_sel & backup_protect);  // RCC_BDCR can be write only when backup_protect == 1
  assign rcc_bdcr_byte1_en     = (wr_req[1] & rcc_bdcr_sel & backup_protect);
  assign rcc_bdcr_byte0_en     = (wr_req[0] & rcc_bdcr_sel & backup_protect);
  // a signal sync to avoid glitch in wren signal , since the signal is used as clock in another domain
  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1),
      .RST_VAL  ('b0)
  ) u_rcc_bdcr_byte2_en_sync (
      .src_signal(rcc_bdcr_byte2_en),
      .rst_n     (rst_n),
      .clk       (clk),
      .gen_signal(rcc_bdcr_byte2_wren)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1),
      .RST_VAL  ('b0)
  ) u_rcc_bdcr_byte1_en_sync (
      .src_signal(rcc_bdcr_byte1_en),
      .rst_n     (rst_n),
      .clk       (clk),
      .gen_signal(rcc_bdcr_byte1_wren)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1),
      .RST_VAL  ('b0)
  ) u_rcc_bdcr_byte0_en_sync (
      .src_signal(rcc_bdcr_byte0_en),
      .rst_n     (rst_n),
      .clk       (clk),
      .gen_signal(rcc_bdcr_byte0_wren)
  );




  // --------------------------------------------------------------------------------
  // rcc_ahb1rstr                            0x7c                                    
  // --------------------------------------------------------------------------------
  // 18:18               romrst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 17:17               tsmsrst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 16:16               smsrst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               xflashrst          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               fftrst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               npurst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               dma1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               dma2rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               dmaschrst          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 qspi1rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 qspi2rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 qspi3rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 qspi4rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 xspirst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 mspirst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 hacif_l1rst        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 hacif_f1rst        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 macrst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 lzrst              RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_ahb1rstr read data
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_read = {
    {13{1'b0}},
    cur_rcc_ahb1rstr_romrst,
    cur_rcc_ahb1rstr_tsmsrst,
    cur_rcc_ahb1rstr_smsrst,
    cur_rcc_ahb1rstr_xflashrst,
    cur_rcc_ahb1rstr_fftrst,
    cur_rcc_ahb1rstr_npurst,
    cur_rcc_ahb1rstr_dma1rst,
    cur_rcc_ahb1rstr_dma2rst,
    cur_rcc_ahb1rstr_dmaschrst,
    cur_rcc_ahb1rstr_qspi1rst,
    cur_rcc_ahb1rstr_qspi2rst,
    cur_rcc_ahb1rstr_qspi3rst,
    cur_rcc_ahb1rstr_qspi4rst,
    cur_rcc_ahb1rstr_xspirst,
    cur_rcc_ahb1rstr_mspirst,
    cur_rcc_ahb1rstr_hacif_l1rst,
    cur_rcc_ahb1rstr_hacif_f1rst,
    cur_rcc_ahb1rstr_macrst,
    cur_rcc_ahb1rstr_lzrst
  };

  // --------------------------------------------------------------------------------
  // 18:18               romrst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_romrst_en = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_romrst = wdata[18:18];
  assign romrst = cur_rcc_ahb1rstr_romrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_romrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_romrst_en),
      .din  (nxt_rcc_ahb1rstr_romrst),
      .dout (cur_rcc_ahb1rstr_romrst)
  );

  // --------------------------------------------------------------------------------
  // 17:17               tsmsrst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_tsmsrst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_tsmsrst = wdata[17:17];
  assign tsmsrst                  = cur_rcc_ahb1rstr_tsmsrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_tsmsrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_tsmsrst_en),
      .din  (nxt_rcc_ahb1rstr_tsmsrst),
      .dout (cur_rcc_ahb1rstr_tsmsrst)
  );

  // --------------------------------------------------------------------------------
  // 16:16               smsrst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_smsrst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_smsrst = wdata[16:16];
  assign smsrst                  = cur_rcc_ahb1rstr_smsrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_smsrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_smsrst_en),
      .din  (nxt_rcc_ahb1rstr_smsrst),
      .dout (cur_rcc_ahb1rstr_smsrst)
  );

  // --------------------------------------------------------------------------------
  // 15:15               xflashrst          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_xflashrst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_xflashrst = wdata[15:15];
  assign xflashrst                  = cur_rcc_ahb1rstr_xflashrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_xflashrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_xflashrst_en),
      .din  (nxt_rcc_ahb1rstr_xflashrst),
      .dout (cur_rcc_ahb1rstr_xflashrst)
  );

  // --------------------------------------------------------------------------------
  // 14:14               fftrst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_fftrst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_fftrst = wdata[14:14];
  assign fftrst                  = cur_rcc_ahb1rstr_fftrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_fftrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_fftrst_en),
      .din  (nxt_rcc_ahb1rstr_fftrst),
      .dout (cur_rcc_ahb1rstr_fftrst)
  );

  // --------------------------------------------------------------------------------
  // 13:13               npurst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_npurst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_npurst = wdata[13:13];
  assign npurst                  = cur_rcc_ahb1rstr_npurst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_npurst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_npurst_en),
      .din  (nxt_rcc_ahb1rstr_npurst),
      .dout (cur_rcc_ahb1rstr_npurst)
  );

  // --------------------------------------------------------------------------------
  // 12:12               dma1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_dma1rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_dma1rst = wdata[12:12];
  assign dma1rst                  = cur_rcc_ahb1rstr_dma1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_dma1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_dma1rst_en),
      .din  (nxt_rcc_ahb1rstr_dma1rst),
      .dout (cur_rcc_ahb1rstr_dma1rst)
  );

  // --------------------------------------------------------------------------------
  // 11:11               dma2rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_dma2rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_dma2rst = wdata[11:11];
  assign dma2rst                  = cur_rcc_ahb1rstr_dma2rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_dma2rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_dma2rst_en),
      .din  (nxt_rcc_ahb1rstr_dma2rst),
      .dout (cur_rcc_ahb1rstr_dma2rst)
  );

  // --------------------------------------------------------------------------------
  // 10:10               dmaschrst          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_dmaschrst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_dmaschrst = wdata[10:10];
  assign dmaschrst                  = cur_rcc_ahb1rstr_dmaschrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_dmaschrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_dmaschrst_en),
      .din  (nxt_rcc_ahb1rstr_dmaschrst),
      .dout (cur_rcc_ahb1rstr_dmaschrst)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 qspi1rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_qspi1rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_qspi1rst = wdata[9:9];
  assign qspi1rst                  = cur_rcc_ahb1rstr_qspi1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_qspi1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_qspi1rst_en),
      .din  (nxt_rcc_ahb1rstr_qspi1rst),
      .dout (cur_rcc_ahb1rstr_qspi1rst)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 qspi2rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_qspi2rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_qspi2rst = wdata[8:8];
  assign qspi2rst                  = cur_rcc_ahb1rstr_qspi2rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_qspi2rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_qspi2rst_en),
      .din  (nxt_rcc_ahb1rstr_qspi2rst),
      .dout (cur_rcc_ahb1rstr_qspi2rst)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 qspi3rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_qspi3rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_qspi3rst = wdata[7:7];
  assign qspi3rst                  = cur_rcc_ahb1rstr_qspi3rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_qspi3rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_qspi3rst_en),
      .din  (nxt_rcc_ahb1rstr_qspi3rst),
      .dout (cur_rcc_ahb1rstr_qspi3rst)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 qspi4rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_qspi4rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_qspi4rst = wdata[6:6];
  assign qspi4rst                  = cur_rcc_ahb1rstr_qspi4rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_qspi4rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_qspi4rst_en),
      .din  (nxt_rcc_ahb1rstr_qspi4rst),
      .dout (cur_rcc_ahb1rstr_qspi4rst)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 xspirst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_xspirst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_xspirst = wdata[5:5];
  assign xspirst                  = cur_rcc_ahb1rstr_xspirst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_xspirst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_xspirst_en),
      .din  (nxt_rcc_ahb1rstr_xspirst),
      .dout (cur_rcc_ahb1rstr_xspirst)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 mspirst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_mspirst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_mspirst = wdata[4:4];
  assign mspirst                  = cur_rcc_ahb1rstr_mspirst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_mspirst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_mspirst_en),
      .din  (nxt_rcc_ahb1rstr_mspirst),
      .dout (cur_rcc_ahb1rstr_mspirst)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 hacif_l1rst        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_hacif_l1rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_hacif_l1rst = wdata[3:3];
  assign hacif_l1rst                  = cur_rcc_ahb1rstr_hacif_l1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_hacif_l1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_hacif_l1rst_en),
      .din  (nxt_rcc_ahb1rstr_hacif_l1rst),
      .dout (cur_rcc_ahb1rstr_hacif_l1rst)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 hacif_f1rst        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_hacif_f1rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_hacif_f1rst = wdata[2:2];
  assign hacif_f1rst                  = cur_rcc_ahb1rstr_hacif_f1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_hacif_f1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_hacif_f1rst_en),
      .din  (nxt_rcc_ahb1rstr_hacif_f1rst),
      .dout (cur_rcc_ahb1rstr_hacif_f1rst)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 macrst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_macrst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_macrst = wdata[1:1];
  assign macrst                  = cur_rcc_ahb1rstr_macrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_macrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_macrst_en),
      .din  (nxt_rcc_ahb1rstr_macrst),
      .dout (cur_rcc_ahb1rstr_macrst)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 lzrst              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_lzrst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_lzrst = wdata[0:0];
  assign lzrst                  = cur_rcc_ahb1rstr_lzrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_lzrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_lzrst_en),
      .din  (nxt_rcc_ahb1rstr_lzrst),
      .dout (cur_rcc_ahb1rstr_lzrst)
  );


  // --------------------------------------------------------------------------------
  // rcc_apb1rstr                            0x80                                    
  // --------------------------------------------------------------------------------
  // 17:17               gtim1rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 16:16               gtim2rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               gtim3rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               gtim4rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spi1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               spi2rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               spi3rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               uart1rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 uart2rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 uart3rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 uart4rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 i2c1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio1rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio2rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 gpio3rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 can1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 can2rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 can3rst            RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_apb1rstr read data
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_read = {
    {14{1'b0}},
    cur_rcc_apb1rstr_gtim1rst,
    cur_rcc_apb1rstr_gtim2rst,
    cur_rcc_apb1rstr_gtim3rst,
    cur_rcc_apb1rstr_gtim4rst,
    cur_rcc_apb1rstr_spi1rst,
    cur_rcc_apb1rstr_spi2rst,
    cur_rcc_apb1rstr_spi3rst,
    cur_rcc_apb1rstr_uart1rst,
    cur_rcc_apb1rstr_uart2rst,
    cur_rcc_apb1rstr_uart3rst,
    cur_rcc_apb1rstr_uart4rst,
    cur_rcc_apb1rstr_i2c1rst,
    cur_rcc_apb1rstr_gpio1rst,
    cur_rcc_apb1rstr_gpio2rst,
    cur_rcc_apb1rstr_gpio3rst,
    cur_rcc_apb1rstr_can1rst,
    cur_rcc_apb1rstr_can2rst,
    cur_rcc_apb1rstr_can3rst
  };

  // --------------------------------------------------------------------------------
  // 17:17               gtim1rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_gtim1rst_en = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_gtim1rst = wdata[17:17];
  assign gtim1rst = cur_rcc_apb1rstr_gtim1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_gtim1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_gtim1rst_en),
      .din  (nxt_rcc_apb1rstr_gtim1rst),
      .dout (cur_rcc_apb1rstr_gtim1rst)
  );

  // --------------------------------------------------------------------------------
  // 16:16               gtim2rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_gtim2rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_gtim2rst = wdata[16:16];
  assign gtim2rst                  = cur_rcc_apb1rstr_gtim2rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_gtim2rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_gtim2rst_en),
      .din  (nxt_rcc_apb1rstr_gtim2rst),
      .dout (cur_rcc_apb1rstr_gtim2rst)
  );

  // --------------------------------------------------------------------------------
  // 15:15               gtim3rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_gtim3rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_gtim3rst = wdata[15:15];
  assign gtim3rst                  = cur_rcc_apb1rstr_gtim3rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_gtim3rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_gtim3rst_en),
      .din  (nxt_rcc_apb1rstr_gtim3rst),
      .dout (cur_rcc_apb1rstr_gtim3rst)
  );

  // --------------------------------------------------------------------------------
  // 14:14               gtim4rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_gtim4rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_gtim4rst = wdata[14:14];
  assign gtim4rst                  = cur_rcc_apb1rstr_gtim4rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_gtim4rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_gtim4rst_en),
      .din  (nxt_rcc_apb1rstr_gtim4rst),
      .dout (cur_rcc_apb1rstr_gtim4rst)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spi1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_spi1rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_spi1rst = wdata[13:13];
  assign spi1rst                  = cur_rcc_apb1rstr_spi1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_spi1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_spi1rst_en),
      .din  (nxt_rcc_apb1rstr_spi1rst),
      .dout (cur_rcc_apb1rstr_spi1rst)
  );

  // --------------------------------------------------------------------------------
  // 12:12               spi2rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_spi2rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_spi2rst = wdata[12:12];
  assign spi2rst                  = cur_rcc_apb1rstr_spi2rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_spi2rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_spi2rst_en),
      .din  (nxt_rcc_apb1rstr_spi2rst),
      .dout (cur_rcc_apb1rstr_spi2rst)
  );

  // --------------------------------------------------------------------------------
  // 11:11               spi3rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_spi3rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_spi3rst = wdata[11:11];
  assign spi3rst                  = cur_rcc_apb1rstr_spi3rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_spi3rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_spi3rst_en),
      .din  (nxt_rcc_apb1rstr_spi3rst),
      .dout (cur_rcc_apb1rstr_spi3rst)
  );

  // --------------------------------------------------------------------------------
  // 10:10               uart1rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_uart1rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_uart1rst = wdata[10:10];
  assign uart1rst                  = cur_rcc_apb1rstr_uart1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_uart1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_uart1rst_en),
      .din  (nxt_rcc_apb1rstr_uart1rst),
      .dout (cur_rcc_apb1rstr_uart1rst)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 uart2rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_uart2rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_uart2rst = wdata[9:9];
  assign uart2rst                  = cur_rcc_apb1rstr_uart2rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_uart2rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_uart2rst_en),
      .din  (nxt_rcc_apb1rstr_uart2rst),
      .dout (cur_rcc_apb1rstr_uart2rst)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 uart3rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_uart3rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_uart3rst = wdata[8:8];
  assign uart3rst                  = cur_rcc_apb1rstr_uart3rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_uart3rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_uart3rst_en),
      .din  (nxt_rcc_apb1rstr_uart3rst),
      .dout (cur_rcc_apb1rstr_uart3rst)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 uart4rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_uart4rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_uart4rst = wdata[7:7];
  assign uart4rst                  = cur_rcc_apb1rstr_uart4rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_uart4rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_uart4rst_en),
      .din  (nxt_rcc_apb1rstr_uart4rst),
      .dout (cur_rcc_apb1rstr_uart4rst)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 i2c1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_i2c1rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_i2c1rst = wdata[6:6];
  assign i2c1rst                  = cur_rcc_apb1rstr_i2c1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_i2c1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_i2c1rst_en),
      .din  (nxt_rcc_apb1rstr_i2c1rst),
      .dout (cur_rcc_apb1rstr_i2c1rst)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 gpio1rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_gpio1rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_gpio1rst = wdata[5:5];
  assign gpio1rst                  = cur_rcc_apb1rstr_gpio1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_gpio1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_gpio1rst_en),
      .din  (nxt_rcc_apb1rstr_gpio1rst),
      .dout (cur_rcc_apb1rstr_gpio1rst)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 gpio2rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_gpio2rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_gpio2rst = wdata[4:4];
  assign gpio2rst                  = cur_rcc_apb1rstr_gpio2rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_gpio2rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_gpio2rst_en),
      .din  (nxt_rcc_apb1rstr_gpio2rst),
      .dout (cur_rcc_apb1rstr_gpio2rst)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 gpio3rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_gpio3rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_gpio3rst = wdata[3:3];
  assign gpio3rst                  = cur_rcc_apb1rstr_gpio3rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_gpio3rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_gpio3rst_en),
      .din  (nxt_rcc_apb1rstr_gpio3rst),
      .dout (cur_rcc_apb1rstr_gpio3rst)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 can1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_can1rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_can1rst = wdata[2:2];
  assign can1rst                  = cur_rcc_apb1rstr_can1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_can1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_can1rst_en),
      .din  (nxt_rcc_apb1rstr_can1rst),
      .dout (cur_rcc_apb1rstr_can1rst)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 can2rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_can2rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_can2rst = wdata[1:1];
  assign can2rst                  = cur_rcc_apb1rstr_can2rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_can2rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_can2rst_en),
      .din  (nxt_rcc_apb1rstr_can2rst),
      .dout (cur_rcc_apb1rstr_can2rst)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 can3rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1rstr_can3rst_en  = (|wr_req & rcc_apb1rstr_sel);
  assign nxt_rcc_apb1rstr_can3rst = wdata[0:0];
  assign can3rst                  = cur_rcc_apb1rstr_can3rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1rstr_can3rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1rstr_can3rst_en),
      .din  (nxt_rcc_apb1rstr_can3rst),
      .dout (cur_rcc_apb1rstr_can3rst)
  );


  // --------------------------------------------------------------------------------
  // rcc_apb2rstr                            0x84                                    
  // --------------------------------------------------------------------------------
  // 15:15               gtim5rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               gtim6rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spi4rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               spi5rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               uart5rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               uart6rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 uart7rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 uart8rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 i2c2rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 i2c3rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 can4rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 can5rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 can6rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 mpptrst        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 gpio4rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 gpio5rst           RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_apb2rstr read data
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_read = {
    {16{1'b0}},
    cur_rcc_apb2rstr_gtim5rst,
    cur_rcc_apb2rstr_gtim6rst,
    cur_rcc_apb2rstr_spi4rst,
    cur_rcc_apb2rstr_spi5rst,
    cur_rcc_apb2rstr_uart5rst,
    cur_rcc_apb2rstr_uart6rst,
    cur_rcc_apb2rstr_uart7rst,
    cur_rcc_apb2rstr_uart8rst,
    cur_rcc_apb2rstr_i2c2rst,
    cur_rcc_apb2rstr_i2c3rst,
    cur_rcc_apb2rstr_can4rst,
    cur_rcc_apb2rstr_can5rst,
    cur_rcc_apb2rstr_can6rst,
    cur_rcc_apb2rstr_mpptrst,
    cur_rcc_apb2rstr_gpio4rst,
    cur_rcc_apb2rstr_gpio5rst
  };

  // --------------------------------------------------------------------------------
  // 15:15               gtim5rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_gtim5rst_en = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_gtim5rst = wdata[15:15];
  assign gtim5rst = cur_rcc_apb2rstr_gtim5rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_gtim5rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_gtim5rst_en),
      .din  (nxt_rcc_apb2rstr_gtim5rst),
      .dout (cur_rcc_apb2rstr_gtim5rst)
  );

  // --------------------------------------------------------------------------------
  // 14:14               gtim6rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_gtim6rst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_gtim6rst = wdata[14:14];
  assign gtim6rst                  = cur_rcc_apb2rstr_gtim6rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_gtim6rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_gtim6rst_en),
      .din  (nxt_rcc_apb2rstr_gtim6rst),
      .dout (cur_rcc_apb2rstr_gtim6rst)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spi4rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_spi4rst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_spi4rst = wdata[13:13];
  assign spi4rst                  = cur_rcc_apb2rstr_spi4rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_spi4rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_spi4rst_en),
      .din  (nxt_rcc_apb2rstr_spi4rst),
      .dout (cur_rcc_apb2rstr_spi4rst)
  );

  // --------------------------------------------------------------------------------
  // 12:12               spi5rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_spi5rst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_spi5rst = wdata[12:12];
  assign spi5rst                  = cur_rcc_apb2rstr_spi5rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_spi5rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_spi5rst_en),
      .din  (nxt_rcc_apb2rstr_spi5rst),
      .dout (cur_rcc_apb2rstr_spi5rst)
  );

  // --------------------------------------------------------------------------------
  // 11:11               uart5rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_uart5rst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_uart5rst = wdata[11:11];
  assign uart5rst                  = cur_rcc_apb2rstr_uart5rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_uart5rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_uart5rst_en),
      .din  (nxt_rcc_apb2rstr_uart5rst),
      .dout (cur_rcc_apb2rstr_uart5rst)
  );

  // --------------------------------------------------------------------------------
  // 10:10               uart6rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_uart6rst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_uart6rst = wdata[10:10];
  assign uart6rst                  = cur_rcc_apb2rstr_uart6rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_uart6rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_uart6rst_en),
      .din  (nxt_rcc_apb2rstr_uart6rst),
      .dout (cur_rcc_apb2rstr_uart6rst)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 uart7rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_uart7rst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_uart7rst = wdata[9:9];
  assign uart7rst                  = cur_rcc_apb2rstr_uart7rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_uart7rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_uart7rst_en),
      .din  (nxt_rcc_apb2rstr_uart7rst),
      .dout (cur_rcc_apb2rstr_uart7rst)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 uart8rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_uart8rst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_uart8rst = wdata[8:8];
  assign uart8rst                  = cur_rcc_apb2rstr_uart8rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_uart8rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_uart8rst_en),
      .din  (nxt_rcc_apb2rstr_uart8rst),
      .dout (cur_rcc_apb2rstr_uart8rst)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 i2c2rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_i2c2rst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_i2c2rst = wdata[7:7];
  assign i2c2rst                  = cur_rcc_apb2rstr_i2c2rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_i2c2rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_i2c2rst_en),
      .din  (nxt_rcc_apb2rstr_i2c2rst),
      .dout (cur_rcc_apb2rstr_i2c2rst)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 i2c3rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_i2c3rst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_i2c3rst = wdata[6:6];
  assign i2c3rst                  = cur_rcc_apb2rstr_i2c3rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_i2c3rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_i2c3rst_en),
      .din  (nxt_rcc_apb2rstr_i2c3rst),
      .dout (cur_rcc_apb2rstr_i2c3rst)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 can4rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_can4rst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_can4rst = wdata[5:5];
  assign can4rst                  = cur_rcc_apb2rstr_can4rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_can4rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_can4rst_en),
      .din  (nxt_rcc_apb2rstr_can4rst),
      .dout (cur_rcc_apb2rstr_can4rst)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 can5rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_can5rst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_can5rst = wdata[4:4];
  assign can5rst                  = cur_rcc_apb2rstr_can5rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_can5rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_can5rst_en),
      .din  (nxt_rcc_apb2rstr_can5rst),
      .dout (cur_rcc_apb2rstr_can5rst)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 can6rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_can6rst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_can6rst = wdata[3:3];
  assign can6rst                  = cur_rcc_apb2rstr_can6rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_can6rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_can6rst_en),
      .din  (nxt_rcc_apb2rstr_can6rst),
      .dout (cur_rcc_apb2rstr_can6rst)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 mpptrst        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_mpptrst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_mpptrst = wdata[2:2];
  assign mpptrst                  = cur_rcc_apb2rstr_mpptrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_mpptrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_mpptrst_en),
      .din  (nxt_rcc_apb2rstr_mpptrst),
      .dout (cur_rcc_apb2rstr_mpptrst)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 gpio4rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_gpio4rst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_gpio4rst = wdata[1:1];
  assign gpio4rst                  = cur_rcc_apb2rstr_gpio4rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_gpio4rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_gpio4rst_en),
      .din  (nxt_rcc_apb2rstr_gpio4rst),
      .dout (cur_rcc_apb2rstr_gpio4rst)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 gpio5rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2rstr_gpio5rst_en  = (|wr_req & rcc_apb2rstr_sel);
  assign nxt_rcc_apb2rstr_gpio5rst = wdata[0:0];
  assign gpio5rst                  = cur_rcc_apb2rstr_gpio5rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2rstr_gpio5rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2rstr_gpio5rst_en),
      .din  (nxt_rcc_apb2rstr_gpio5rst),
      .dout (cur_rcc_apb2rstr_gpio5rst)
  );


  // --------------------------------------------------------------------------------
  // rcc_apb3rstr                            0x88                                    
  // --------------------------------------------------------------------------------
  // 11:11               sysctlrst          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               wwdtrst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 tim1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 tim2rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 adccrst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 gpio6rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio7rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio8rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 iwdtrst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 rtcrst             RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_apb3rstr read data
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_read = {
    {20{1'b0}}, cur_rcc_apb3rstr_sysctlrst, cur_rcc_apb3rstr_wwdtrst, cur_rcc_apb3rstr_tim1rst, cur_rcc_apb3rstr_tim2rst, cur_rcc_apb3rstr_adccrst, cur_rcc_apb3rstr_gpio6rst, cur_rcc_apb3rstr_gpio7rst, cur_rcc_apb3rstr_gpio8rst, cur_rcc_apb3rstr_iwdtrst, {2{1'b0}}, cur_rcc_apb3rstr_rtcrst
  };

  // --------------------------------------------------------------------------------
  // 11:11               sysctlrst          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_sysctlrst_en = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_sysctlrst = wdata[11:11];
  assign sysctlrst = cur_rcc_apb3rstr_sysctlrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3rstr_sysctlrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3rstr_sysctlrst_en),
      .din  (nxt_rcc_apb3rstr_sysctlrst),
      .dout (cur_rcc_apb3rstr_sysctlrst)
  );

  // --------------------------------------------------------------------------------
  // 10:10               wwdtrst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_wwdtrst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_wwdtrst = wdata[10:10];
  assign wwdtrst                  = cur_rcc_apb3rstr_wwdtrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3rstr_wwdtrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3rstr_wwdtrst_en),
      .din  (nxt_rcc_apb3rstr_wwdtrst),
      .dout (cur_rcc_apb3rstr_wwdtrst)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 tim1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_tim1rst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_tim1rst = wdata[9:9];
  assign tim1rst                  = cur_rcc_apb3rstr_tim1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3rstr_tim1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3rstr_tim1rst_en),
      .din  (nxt_rcc_apb3rstr_tim1rst),
      .dout (cur_rcc_apb3rstr_tim1rst)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 tim2rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_tim2rst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_tim2rst = wdata[8:8];
  assign tim2rst                  = cur_rcc_apb3rstr_tim2rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3rstr_tim2rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3rstr_tim2rst_en),
      .din  (nxt_rcc_apb3rstr_tim2rst),
      .dout (cur_rcc_apb3rstr_tim2rst)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 adccrst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_adccrst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_adccrst = wdata[7:7];
  assign adccrst                  = cur_rcc_apb3rstr_adccrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3rstr_adccrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3rstr_adccrst_en),
      .din  (nxt_rcc_apb3rstr_adccrst),
      .dout (cur_rcc_apb3rstr_adccrst)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 gpio6rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_gpio6rst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_gpio6rst = wdata[6:6];
  assign gpio6rst                  = cur_rcc_apb3rstr_gpio6rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3rstr_gpio6rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3rstr_gpio6rst_en),
      .din  (nxt_rcc_apb3rstr_gpio6rst),
      .dout (cur_rcc_apb3rstr_gpio6rst)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 gpio7rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_gpio7rst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_gpio7rst = wdata[5:5];
  assign gpio7rst                  = cur_rcc_apb3rstr_gpio7rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3rstr_gpio7rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3rstr_gpio7rst_en),
      .din  (nxt_rcc_apb3rstr_gpio7rst),
      .dout (cur_rcc_apb3rstr_gpio7rst)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 gpio8rst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_gpio8rst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_gpio8rst = wdata[4:4];
  assign gpio8rst                  = cur_rcc_apb3rstr_gpio8rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3rstr_gpio8rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3rstr_gpio8rst_en),
      .din  (nxt_rcc_apb3rstr_gpio8rst),
      .dout (cur_rcc_apb3rstr_gpio8rst)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 iwdtrst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_iwdtrst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_iwdtrst = wdata[3:3];
  assign iwdtrst                  = cur_rcc_apb3rstr_iwdtrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3rstr_iwdtrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3rstr_iwdtrst_en),
      .din  (nxt_rcc_apb3rstr_iwdtrst),
      .dout (cur_rcc_apb3rstr_iwdtrst)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 rtcrst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_rtcrst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_rtcrst = wdata[0:0];
  assign rtcrst                  = cur_rcc_apb3rstr_rtcrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3rstr_rtcrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3rstr_rtcrst_en),
      .din  (nxt_rcc_apb3rstr_rtcrst),
      .dout (cur_rcc_apb3rstr_rtcrst)
  );


  // --------------------------------------------------------------------------------
  // rcc_gcr                                 0x8c                                    
  // --------------------------------------------------------------------------------
  // 1:1                 ww2rsc              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 ww1rsc              RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_gcr read data
  // --------------------------------------------------------------------------------
  assign rcc_gcr_read       = {{30{1'b0}}, cur_rcc_gcr_ww2rsc, cur_rcc_gcr_ww1rsc};

  // --------------------------------------------------------------------------------
  // 1:1                 ww2rsc              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_gcr_ww2rsc_en  = (|wr_req & rcc_gcr_sel);
  assign nxt_rcc_gcr_ww2rsc = wdata[1:1];
  assign ww2rsc             = cur_rcc_gcr_ww2rsc;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_gcr_ww2rsc (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_gcr_ww2rsc_en),
      .din  (nxt_rcc_gcr_ww2rsc),
      .dout (cur_rcc_gcr_ww2rsc)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 ww1rsc              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_gcr_ww1rsc_en  = (|wr_req & rcc_gcr_sel);
  assign nxt_rcc_gcr_ww1rsc = wdata[0:0];
  assign ww1rsc             = cur_rcc_gcr_ww1rsc;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_gcr_ww1rsc (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_gcr_ww1rsc_en),
      .din  (nxt_rcc_gcr_ww1rsc),
      .dout (cur_rcc_gcr_ww1rsc)
  );



  // --------------------------------------------------------------------------------
  // rcc_ahb1d3amr                           0xa8                                    
  // --------------------------------------------------------------------------------
  // 18:18               romamen             RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 17:17               tsmsamen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 16:16               smsamen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               xflashamen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               fftamen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               npuamen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               dma1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               dma2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               dmaschamen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 qspi1amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 qspi2amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 qspi3amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 qspi4amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 xspiamen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 mspiamen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 hacif_l1amen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 hacif_f1amen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 macamen             RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 0:0                 lzamen              RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_ahb1d3amr read data
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_read = {
    {13{1'b0}},
    cur_rcc_ahb1d3amr_romamen,
    cur_rcc_ahb1d3amr_tsmsamen,
    cur_rcc_ahb1d3amr_smsamen,
    cur_rcc_ahb1d3amr_xflashamen,
    cur_rcc_ahb1d3amr_fftamen,
    cur_rcc_ahb1d3amr_npuamen,
    cur_rcc_ahb1d3amr_dma1amen,
    cur_rcc_ahb1d3amr_dma2amen,
    cur_rcc_ahb1d3amr_dmaschamen,
    cur_rcc_ahb1d3amr_qspi1amen,
    cur_rcc_ahb1d3amr_qspi2amen,
    cur_rcc_ahb1d3amr_qspi3amen,
    cur_rcc_ahb1d3amr_qspi4amen,
    cur_rcc_ahb1d3amr_xspiamen,
    cur_rcc_ahb1d3amr_mspiamen,
    cur_rcc_ahb1d3amr_hacif_l1amen,
    cur_rcc_ahb1d3amr_hacif_f1amen,
    cur_rcc_ahb1d3amr_macamen,
    cur_rcc_ahb1d3amr_lzamen
  };

  // --------------------------------------------------------------------------------
  // 18:18               romamen             RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_romamen_en = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_romamen = wdata[18:18];
  assign rcc_rom_amen = cur_rcc_ahb1d3amr_romamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_ahb1d3amr_romamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_romamen_en),
      .din  (nxt_rcc_ahb1d3amr_romamen),
      .dout (cur_rcc_ahb1d3amr_romamen)
  );

  // --------------------------------------------------------------------------------
  // 17:17               tsmsamen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_tsmsamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_tsmsamen = wdata[17:17];
  assign rcc_tsms_amen              = cur_rcc_ahb1d3amr_tsmsamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_ahb1d3amr_tsmsamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_tsmsamen_en),
      .din  (nxt_rcc_ahb1d3amr_tsmsamen),
      .dout (cur_rcc_ahb1d3amr_tsmsamen)
  );

  // --------------------------------------------------------------------------------
  // 16:16               smsamen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_smsamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_smsamen = wdata[16:16];
  assign rcc_sms_amen              = cur_rcc_ahb1d3amr_smsamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_smsamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_smsamen_en),
      .din  (nxt_rcc_ahb1d3amr_smsamen),
      .dout (cur_rcc_ahb1d3amr_smsamen)
  );

  // --------------------------------------------------------------------------------
  // 15:15               xflashamen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_xflashamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_xflashamen = wdata[15:15];
  assign rcc_xflash_amen              = cur_rcc_ahb1d3amr_xflashamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_xflashamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_xflashamen_en),
      .din  (nxt_rcc_ahb1d3amr_xflashamen),
      .dout (cur_rcc_ahb1d3amr_xflashamen)
  );

  // --------------------------------------------------------------------------------
  // 14:14               fftamen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_fftamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_fftamen = wdata[14:14];
  assign rcc_fft_amen              = cur_rcc_ahb1d3amr_fftamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_fftamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_fftamen_en),
      .din  (nxt_rcc_ahb1d3amr_fftamen),
      .dout (cur_rcc_ahb1d3amr_fftamen)
  );

  // --------------------------------------------------------------------------------
  // 13:13               npuamen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_npuamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_npuamen = wdata[13:13];
  assign rcc_npu_amen              = cur_rcc_ahb1d3amr_npuamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_npuamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_npuamen_en),
      .din  (nxt_rcc_ahb1d3amr_npuamen),
      .dout (cur_rcc_ahb1d3amr_npuamen)
  );

  // --------------------------------------------------------------------------------
  // 12:12               dma1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_dma1amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_dma1amen = wdata[12:12];
  assign rcc_dma1_amen              = cur_rcc_ahb1d3amr_dma1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_dma1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_dma1amen_en),
      .din  (nxt_rcc_ahb1d3amr_dma1amen),
      .dout (cur_rcc_ahb1d3amr_dma1amen)
  );

  // --------------------------------------------------------------------------------
  // 11:11               dma2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_dma2amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_dma2amen = wdata[11:11];
  assign rcc_dma2_amen              = cur_rcc_ahb1d3amr_dma2amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_dma2amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_dma2amen_en),
      .din  (nxt_rcc_ahb1d3amr_dma2amen),
      .dout (cur_rcc_ahb1d3amr_dma2amen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               dmaschamen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_dmaschamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_dmaschamen = wdata[10:10];
  assign rcc_dmasch_amen              = cur_rcc_ahb1d3amr_dmaschamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_dmaschamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_dmaschamen_en),
      .din  (nxt_rcc_ahb1d3amr_dmaschamen),
      .dout (cur_rcc_ahb1d3amr_dmaschamen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 qspi1amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_qspi1amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_qspi1amen = wdata[9:9];
  assign rcc_qspi1_amen              = cur_rcc_ahb1d3amr_qspi1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_qspi1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_qspi1amen_en),
      .din  (nxt_rcc_ahb1d3amr_qspi1amen),
      .dout (cur_rcc_ahb1d3amr_qspi1amen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 qspi2amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_qspi2amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_qspi2amen = wdata[8:8];
  assign rcc_qspi2_amen              = cur_rcc_ahb1d3amr_qspi2amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_qspi2amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_qspi2amen_en),
      .din  (nxt_rcc_ahb1d3amr_qspi2amen),
      .dout (cur_rcc_ahb1d3amr_qspi2amen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 qspi3amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_qspi3amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_qspi3amen = wdata[7:7];
  assign rcc_qspi3_amen              = cur_rcc_ahb1d3amr_qspi3amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_qspi3amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_qspi3amen_en),
      .din  (nxt_rcc_ahb1d3amr_qspi3amen),
      .dout (cur_rcc_ahb1d3amr_qspi3amen)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 qspi4amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_qspi4amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_qspi4amen = wdata[6:6];
  assign rcc_qspi4_amen              = cur_rcc_ahb1d3amr_qspi4amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_qspi4amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_qspi4amen_en),
      .din  (nxt_rcc_ahb1d3amr_qspi4amen),
      .dout (cur_rcc_ahb1d3amr_qspi4amen)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 xspiamen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_xspiamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_xspiamen = wdata[5:5];
  assign rcc_xspi_amen              = cur_rcc_ahb1d3amr_xspiamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_xspiamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_xspiamen_en),
      .din  (nxt_rcc_ahb1d3amr_xspiamen),
      .dout (cur_rcc_ahb1d3amr_xspiamen)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 mspiamen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_mspiamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_mspiamen = wdata[4:4];
  assign rcc_mspi_amen              = cur_rcc_ahb1d3amr_mspiamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_mspiamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_mspiamen_en),
      .din  (nxt_rcc_ahb1d3amr_mspiamen),
      .dout (cur_rcc_ahb1d3amr_mspiamen)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 hacif_l1amen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_hacif_l1amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_hacif_l1amen = wdata[3:3];
  assign rcc_hacif_l1_amen              = cur_rcc_ahb1d3amr_hacif_l1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_hacif_l1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_hacif_l1amen_en),
      .din  (nxt_rcc_ahb1d3amr_hacif_l1amen),
      .dout (cur_rcc_ahb1d3amr_hacif_l1amen)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 hacif_f1amen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_hacif_f1amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_hacif_f1amen = wdata[2:2];
  assign rcc_hacif_f1_amen              = cur_rcc_ahb1d3amr_hacif_f1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_hacif_f1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_hacif_f1amen_en),
      .din  (nxt_rcc_ahb1d3amr_hacif_f1amen),
      .dout (cur_rcc_ahb1d3amr_hacif_f1amen)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 macamen             RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_macamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_macamen = wdata[1:1];
  assign rcc_mac_amen              = cur_rcc_ahb1d3amr_macamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_ahb1d3amr_macamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_macamen_en),
      .din  (nxt_rcc_ahb1d3amr_macamen),
      .dout (cur_rcc_ahb1d3amr_macamen)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 lzamen              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_lzamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_lzamen = wdata[0:0];
  assign rcc_lz_amen              = cur_rcc_ahb1d3amr_lzamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_lzamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_lzamen_en),
      .din  (nxt_rcc_ahb1d3amr_lzamen),
      .dout (cur_rcc_ahb1d3amr_lzamen)
  );


  // --------------------------------------------------------------------------------
  // rcc_apb1d3amr                           0xac                                    
  // --------------------------------------------------------------------------------
  // 17:17               gtim1amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 16:16               gtim2amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               gtim3amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               gtim4amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spi1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               spi2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               spi3amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               uart1amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 uart2amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 uart3amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 uart4amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 i2c1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio1amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio2amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 gpio3amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 can1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 can2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 can3amen            RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_apb1d3amr read data
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_read = {
    {14{1'b0}},
    cur_rcc_apb1d3amr_gtim1amen,
    cur_rcc_apb1d3amr_gtim2amen,
    cur_rcc_apb1d3amr_gtim3amen,
    cur_rcc_apb1d3amr_gtim4amen,
    cur_rcc_apb1d3amr_spi1amen,
    cur_rcc_apb1d3amr_spi2amen,
    cur_rcc_apb1d3amr_spi3amen,
    cur_rcc_apb1d3amr_uart1amen,
    cur_rcc_apb1d3amr_uart2amen,
    cur_rcc_apb1d3amr_uart3amen,
    cur_rcc_apb1d3amr_uart4amen,
    cur_rcc_apb1d3amr_i2c1amen,
    cur_rcc_apb1d3amr_gpio1amen,
    cur_rcc_apb1d3amr_gpio2amen,
    cur_rcc_apb1d3amr_gpio3amen,
    cur_rcc_apb1d3amr_can1amen,
    cur_rcc_apb1d3amr_can2amen,
    cur_rcc_apb1d3amr_can3amen
  };

  // --------------------------------------------------------------------------------
  // 17:17               gtim1amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_gtim1amen_en = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_gtim1amen = wdata[17:17];
  assign rcc_gtim1_amen = cur_rcc_apb1d3amr_gtim1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_gtim1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_gtim1amen_en),
      .din  (nxt_rcc_apb1d3amr_gtim1amen),
      .dout (cur_rcc_apb1d3amr_gtim1amen)
  );

  // --------------------------------------------------------------------------------
  // 16:16               gtim2amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_gtim2amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_gtim2amen = wdata[16:16];
  assign rcc_gtim2_amen              = cur_rcc_apb1d3amr_gtim2amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_gtim2amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_gtim2amen_en),
      .din  (nxt_rcc_apb1d3amr_gtim2amen),
      .dout (cur_rcc_apb1d3amr_gtim2amen)
  );

  // --------------------------------------------------------------------------------
  // 15:15               gtim3amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_gtim3amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_gtim3amen = wdata[15:15];
  assign rcc_gtim3_amen              = cur_rcc_apb1d3amr_gtim3amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_gtim3amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_gtim3amen_en),
      .din  (nxt_rcc_apb1d3amr_gtim3amen),
      .dout (cur_rcc_apb1d3amr_gtim3amen)
  );

  // --------------------------------------------------------------------------------
  // 14:14               gtim4amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_gtim4amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_gtim4amen = wdata[14:14];
  assign rcc_gtim4_amen              = cur_rcc_apb1d3amr_gtim4amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_gtim4amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_gtim4amen_en),
      .din  (nxt_rcc_apb1d3amr_gtim4amen),
      .dout (cur_rcc_apb1d3amr_gtim4amen)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spi1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_spi1amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_spi1amen = wdata[13:13];
  assign rcc_spi1_amen              = cur_rcc_apb1d3amr_spi1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_spi1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_spi1amen_en),
      .din  (nxt_rcc_apb1d3amr_spi1amen),
      .dout (cur_rcc_apb1d3amr_spi1amen)
  );

  // --------------------------------------------------------------------------------
  // 12:12               spi2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_spi2amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_spi2amen = wdata[12:12];
  assign rcc_spi2_amen              = cur_rcc_apb1d3amr_spi2amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_spi2amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_spi2amen_en),
      .din  (nxt_rcc_apb1d3amr_spi2amen),
      .dout (cur_rcc_apb1d3amr_spi2amen)
  );

  // --------------------------------------------------------------------------------
  // 11:11               spi3amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_spi3amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_spi3amen = wdata[11:11];
  assign rcc_spi3_amen              = cur_rcc_apb1d3amr_spi3amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_spi3amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_spi3amen_en),
      .din  (nxt_rcc_apb1d3amr_spi3amen),
      .dout (cur_rcc_apb1d3amr_spi3amen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               uart1amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_uart1amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_uart1amen = wdata[10:10];
  assign rcc_uart1_amen              = cur_rcc_apb1d3amr_uart1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_uart1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_uart1amen_en),
      .din  (nxt_rcc_apb1d3amr_uart1amen),
      .dout (cur_rcc_apb1d3amr_uart1amen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 uart2amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_uart2amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_uart2amen = wdata[9:9];
  assign rcc_uart2_amen              = cur_rcc_apb1d3amr_uart2amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_uart2amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_uart2amen_en),
      .din  (nxt_rcc_apb1d3amr_uart2amen),
      .dout (cur_rcc_apb1d3amr_uart2amen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 uart3amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_uart3amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_uart3amen = wdata[8:8];
  assign rcc_uart3_amen              = cur_rcc_apb1d3amr_uart3amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_uart3amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_uart3amen_en),
      .din  (nxt_rcc_apb1d3amr_uart3amen),
      .dout (cur_rcc_apb1d3amr_uart3amen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 uart4amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_uart4amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_uart4amen = wdata[7:7];
  assign rcc_uart4_amen              = cur_rcc_apb1d3amr_uart4amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_uart4amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_uart4amen_en),
      .din  (nxt_rcc_apb1d3amr_uart4amen),
      .dout (cur_rcc_apb1d3amr_uart4amen)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 i2c1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_i2c1amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_i2c1amen = wdata[6:6];
  assign rcc_i2c1_amen              = cur_rcc_apb1d3amr_i2c1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_i2c1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_i2c1amen_en),
      .din  (nxt_rcc_apb1d3amr_i2c1amen),
      .dout (cur_rcc_apb1d3amr_i2c1amen)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 gpio1amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_gpio1amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_gpio1amen = wdata[5:5];
  assign rcc_gpio1_amen              = cur_rcc_apb1d3amr_gpio1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_gpio1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_gpio1amen_en),
      .din  (nxt_rcc_apb1d3amr_gpio1amen),
      .dout (cur_rcc_apb1d3amr_gpio1amen)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 gpio2amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_gpio2amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_gpio2amen = wdata[4:4];
  assign rcc_gpio2_amen              = cur_rcc_apb1d3amr_gpio2amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_gpio2amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_gpio2amen_en),
      .din  (nxt_rcc_apb1d3amr_gpio2amen),
      .dout (cur_rcc_apb1d3amr_gpio2amen)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 gpio3amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_gpio3amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_gpio3amen = wdata[3:3];
  assign rcc_gpio3_amen              = cur_rcc_apb1d3amr_gpio3amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_gpio3amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_gpio3amen_en),
      .din  (nxt_rcc_apb1d3amr_gpio3amen),
      .dout (cur_rcc_apb1d3amr_gpio3amen)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 can1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_can1amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_can1amen = wdata[2:2];
  assign rcc_can1_amen              = cur_rcc_apb1d3amr_can1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_can1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_can1amen_en),
      .din  (nxt_rcc_apb1d3amr_can1amen),
      .dout (cur_rcc_apb1d3amr_can1amen)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 can2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_can2amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_can2amen = wdata[1:1];
  assign rcc_can2_amen              = cur_rcc_apb1d3amr_can2amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_can2amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_can2amen_en),
      .din  (nxt_rcc_apb1d3amr_can2amen),
      .dout (cur_rcc_apb1d3amr_can2amen)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 can3amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb1d3amr_can3amen_en  = (|wr_req & rcc_apb1d3amr_sel);
  assign nxt_rcc_apb1d3amr_can3amen = wdata[0:0];
  assign rcc_can3_amen              = cur_rcc_apb1d3amr_can3amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb1d3amr_can3amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb1d3amr_can3amen_en),
      .din  (nxt_rcc_apb1d3amr_can3amen),
      .dout (cur_rcc_apb1d3amr_can3amen)
  );


  // --------------------------------------------------------------------------------
  // rcc_apb2d3amr                           0xb0                                    
  // --------------------------------------------------------------------------------
  // 15:15               gtim5amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               gtim6amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spi4amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               spi5amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               uart5amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               uart6amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 uart7amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 uart8amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 i2c2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 i2c3amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 can4amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 can5amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 can6amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 mpptamen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 gpio4amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 gpio5amen           RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_apb2d3amr read data
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_read = {
    {16{1'b0}},
    cur_rcc_apb2d3amr_gtim5amen,
    cur_rcc_apb2d3amr_gtim6amen,
    cur_rcc_apb2d3amr_spi4amen,
    cur_rcc_apb2d3amr_spi5amen,
    cur_rcc_apb2d3amr_uart5amen,
    cur_rcc_apb2d3amr_uart6amen,
    cur_rcc_apb2d3amr_uart7amen,
    cur_rcc_apb2d3amr_uart8amen,
    cur_rcc_apb2d3amr_i2c2amen,
    cur_rcc_apb2d3amr_i2c3amen,
    cur_rcc_apb2d3amr_can4amen,
    cur_rcc_apb2d3amr_can5amen,
    cur_rcc_apb2d3amr_can6amen,
    cur_rcc_apb2d3amr_mpptamen,
    cur_rcc_apb2d3amr_gpio4amen,
    cur_rcc_apb2d3amr_gpio5amen
  };

  // --------------------------------------------------------------------------------
  // 15:15               gtim5amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_gtim5amen_en = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_gtim5amen = wdata[15:15];
  assign rcc_gtim5_amen = cur_rcc_apb2d3amr_gtim5amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_gtim5amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_gtim5amen_en),
      .din  (nxt_rcc_apb2d3amr_gtim5amen),
      .dout (cur_rcc_apb2d3amr_gtim5amen)
  );

  // --------------------------------------------------------------------------------
  // 14:14               gtim6amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_gtim6amen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_gtim6amen = wdata[14:14];
  assign rcc_gtim6_amen              = cur_rcc_apb2d3amr_gtim6amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_gtim6amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_gtim6amen_en),
      .din  (nxt_rcc_apb2d3amr_gtim6amen),
      .dout (cur_rcc_apb2d3amr_gtim6amen)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spi4amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_spi4amen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_spi4amen = wdata[13:13];
  assign rcc_spi4_amen              = cur_rcc_apb2d3amr_spi4amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_spi4amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_spi4amen_en),
      .din  (nxt_rcc_apb2d3amr_spi4amen),
      .dout (cur_rcc_apb2d3amr_spi4amen)
  );

  // --------------------------------------------------------------------------------
  // 12:12               spi5amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_spi5amen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_spi5amen = wdata[12:12];
  assign rcc_spi5_amen              = cur_rcc_apb2d3amr_spi5amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_spi5amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_spi5amen_en),
      .din  (nxt_rcc_apb2d3amr_spi5amen),
      .dout (cur_rcc_apb2d3amr_spi5amen)
  );

  // --------------------------------------------------------------------------------
  // 11:11               uart5amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_uart5amen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_uart5amen = wdata[11:11];
  assign rcc_uart5_amen              = cur_rcc_apb2d3amr_uart5amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_uart5amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_uart5amen_en),
      .din  (nxt_rcc_apb2d3amr_uart5amen),
      .dout (cur_rcc_apb2d3amr_uart5amen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               uart6amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_uart6amen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_uart6amen = wdata[10:10];
  assign rcc_uart6_amen              = cur_rcc_apb2d3amr_uart6amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_uart6amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_uart6amen_en),
      .din  (nxt_rcc_apb2d3amr_uart6amen),
      .dout (cur_rcc_apb2d3amr_uart6amen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 uart7amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_uart7amen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_uart7amen = wdata[9:9];
  assign rcc_uart7_amen              = cur_rcc_apb2d3amr_uart7amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_uart7amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_uart7amen_en),
      .din  (nxt_rcc_apb2d3amr_uart7amen),
      .dout (cur_rcc_apb2d3amr_uart7amen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 uart8amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_uart8amen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_uart8amen = wdata[8:8];
  assign rcc_uart8_amen              = cur_rcc_apb2d3amr_uart8amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_uart8amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_uart8amen_en),
      .din  (nxt_rcc_apb2d3amr_uart8amen),
      .dout (cur_rcc_apb2d3amr_uart8amen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 i2c2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_i2c2amen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_i2c2amen = wdata[7:7];
  assign rcc_i2c2_amen              = cur_rcc_apb2d3amr_i2c2amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_i2c2amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_i2c2amen_en),
      .din  (nxt_rcc_apb2d3amr_i2c2amen),
      .dout (cur_rcc_apb2d3amr_i2c2amen)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 i2c3amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_i2c3amen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_i2c3amen = wdata[6:6];
  assign rcc_i2c3_amen              = cur_rcc_apb2d3amr_i2c3amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_i2c3amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_i2c3amen_en),
      .din  (nxt_rcc_apb2d3amr_i2c3amen),
      .dout (cur_rcc_apb2d3amr_i2c3amen)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 can4amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_can4amen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_can4amen = wdata[5:5];
  assign rcc_can4_amen              = cur_rcc_apb2d3amr_can4amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_can4amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_can4amen_en),
      .din  (nxt_rcc_apb2d3amr_can4amen),
      .dout (cur_rcc_apb2d3amr_can4amen)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 can5amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_can5amen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_can5amen = wdata[4:4];
  assign rcc_can5_amen              = cur_rcc_apb2d3amr_can5amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_can5amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_can5amen_en),
      .din  (nxt_rcc_apb2d3amr_can5amen),
      .dout (cur_rcc_apb2d3amr_can5amen)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 can6amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_can6amen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_can6amen = wdata[3:3];
  assign rcc_can6_amen              = cur_rcc_apb2d3amr_can6amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_can6amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_can6amen_en),
      .din  (nxt_rcc_apb2d3amr_can6amen),
      .dout (cur_rcc_apb2d3amr_can6amen)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 mpptamen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_mpptamen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_mpptamen = wdata[2:2];
  assign rcc_mppt_amen              = cur_rcc_apb2d3amr_mpptamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_mpptamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_mpptamen_en),
      .din  (nxt_rcc_apb2d3amr_mpptamen),
      .dout (cur_rcc_apb2d3amr_mpptamen)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 gpio4amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_gpio4amen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_gpio4amen = wdata[1:1];
  assign rcc_gpio4_amen              = cur_rcc_apb2d3amr_gpio4amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_gpio4amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_gpio4amen_en),
      .din  (nxt_rcc_apb2d3amr_gpio4amen),
      .dout (cur_rcc_apb2d3amr_gpio4amen)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 gpio5amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb2d3amr_gpio5amen_en  = (|wr_req & rcc_apb2d3amr_sel);
  assign nxt_rcc_apb2d3amr_gpio5amen = wdata[0:0];
  assign rcc_gpio5_amen              = cur_rcc_apb2d3amr_gpio5amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb2d3amr_gpio5amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb2d3amr_gpio5amen_en),
      .din  (nxt_rcc_apb2d3amr_gpio5amen),
      .dout (cur_rcc_apb2d3amr_gpio5amen)
  );


  // --------------------------------------------------------------------------------
  // rcc_apb3d3amr                           0xb4                                    
  // --------------------------------------------------------------------------------
  // 11:11               sysctlamen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               wwdtamen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 tim1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 tim2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 adccamen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 gpio6amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio7amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio8amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 iwdtamen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 rtcamen             RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_apb3d3amr read data
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_read = {
    {20{1'b0}},
    cur_rcc_apb3d3amr_sysctlamen,
    cur_rcc_apb3d3amr_wwdtamen,
    cur_rcc_apb3d3amr_tim1amen,
    cur_rcc_apb3d3amr_tim2amen,
    cur_rcc_apb3d3amr_adccamen,
    cur_rcc_apb3d3amr_gpio6amen,
    cur_rcc_apb3d3amr_gpio7amen,
    cur_rcc_apb3d3amr_gpio8amen,
    cur_rcc_apb3d3amr_iwdtamen,
    {2{1'b0}},
    cur_rcc_apb3d3amr_rtcamen
  };

  // --------------------------------------------------------------------------------
  // 11:11               sysctlamen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_sysctlamen_en = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_sysctlamen = wdata[11:11];
  assign rcc_sysctl_amen = cur_rcc_apb3d3amr_sysctlamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3d3amr_sysctlamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3d3amr_sysctlamen_en),
      .din  (nxt_rcc_apb3d3amr_sysctlamen),
      .dout (cur_rcc_apb3d3amr_sysctlamen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               wwdtamen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_wwdtamen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_wwdtamen = wdata[10:10];
  assign rcc_wwdt_amen              = cur_rcc_apb3d3amr_wwdtamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3d3amr_wwdtamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3d3amr_wwdtamen_en),
      .din  (nxt_rcc_apb3d3amr_wwdtamen),
      .dout (cur_rcc_apb3d3amr_wwdtamen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 tim1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_tim1amen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_tim1amen = wdata[9:9];
  assign rcc_tim1_amen              = cur_rcc_apb3d3amr_tim1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3d3amr_tim1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3d3amr_tim1amen_en),
      .din  (nxt_rcc_apb3d3amr_tim1amen),
      .dout (cur_rcc_apb3d3amr_tim1amen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 tim2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_tim2amen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_tim2amen = wdata[8:8];
  assign rcc_tim2_amen              = cur_rcc_apb3d3amr_tim2amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3d3amr_tim2amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3d3amr_tim2amen_en),
      .din  (nxt_rcc_apb3d3amr_tim2amen),
      .dout (cur_rcc_apb3d3amr_tim2amen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 adccamen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_adccamen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_adccamen = wdata[7:7];
  assign rcc_adcc_amen              = cur_rcc_apb3d3amr_adccamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3d3amr_adccamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3d3amr_adccamen_en),
      .din  (nxt_rcc_apb3d3amr_adccamen),
      .dout (cur_rcc_apb3d3amr_adccamen)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 gpio6amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_gpio6amen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_gpio6amen = wdata[6:6];
  assign rcc_gpio6_amen              = cur_rcc_apb3d3amr_gpio6amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3d3amr_gpio6amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3d3amr_gpio6amen_en),
      .din  (nxt_rcc_apb3d3amr_gpio6amen),
      .dout (cur_rcc_apb3d3amr_gpio6amen)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 gpio7amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_gpio7amen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_gpio7amen = wdata[5:5];
  assign rcc_gpio7_amen              = cur_rcc_apb3d3amr_gpio7amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3d3amr_gpio7amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3d3amr_gpio7amen_en),
      .din  (nxt_rcc_apb3d3amr_gpio7amen),
      .dout (cur_rcc_apb3d3amr_gpio7amen)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 gpio8amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_gpio8amen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_gpio8amen = wdata[4:4];
  assign rcc_gpio8_amen              = cur_rcc_apb3d3amr_gpio8amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3d3amr_gpio8amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3d3amr_gpio8amen_en),
      .din  (nxt_rcc_apb3d3amr_gpio8amen),
      .dout (cur_rcc_apb3d3amr_gpio8amen)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 iwdtamen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_iwdtamen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_iwdtamen = wdata[3:3];
  assign rcc_iwdt_amen              = cur_rcc_apb3d3amr_iwdtamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3d3amr_iwdtamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3d3amr_iwdtamen_en),
      .din  (nxt_rcc_apb3d3amr_iwdtamen),
      .dout (cur_rcc_apb3d3amr_iwdtamen)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 rtcamen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_rtcamen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_rtcamen = wdata[0:0];
  assign rcc_rtc_amen              = cur_rcc_apb3d3amr_rtcamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3d3amr_rtcamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3d3amr_rtcamen_en),
      .din  (nxt_rcc_apb3d3amr_rtcamen),
      .dout (cur_rcc_apb3d3amr_rtcamen)
  );





  // --------------------------------------------------------------------------------
  // rcc_c1_ahb1enr                          0xbc                                    
  // --------------------------------------------------------------------------------
  // 18:18               romen               RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 17:17               tsmsen              RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 16:16               smsen               RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               xflashen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               fften               RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               npuen               RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               dma1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               dma2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               dmaschen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 qspi1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 qspi2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 qspi3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 qspi4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 xspien              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 mspien              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 hacif_l1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 hacif_f1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 macen               RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 0:0                 lzen                RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c1_ahb1enr read data
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_read = {
    {13{1'b0}},
    cur_rcc_c1_ahb1enr_romen,
    cur_rcc_c1_ahb1enr_tsmsen,
    cur_rcc_c1_ahb1enr_smsen,
    cur_rcc_c1_ahb1enr_xflashen,
    cur_rcc_c1_ahb1enr_fften,
    cur_rcc_c1_ahb1enr_npuen,
    cur_rcc_c1_ahb1enr_dma1en,
    cur_rcc_c1_ahb1enr_dma2en,
    cur_rcc_c1_ahb1enr_dmaschen,
    cur_rcc_c1_ahb1enr_qspi1en,
    cur_rcc_c1_ahb1enr_qspi2en,
    cur_rcc_c1_ahb1enr_qspi3en,
    cur_rcc_c1_ahb1enr_qspi4en,
    cur_rcc_c1_ahb1enr_xspien,
    cur_rcc_c1_ahb1enr_mspien,
    cur_rcc_c1_ahb1enr_hacif_l1en,
    cur_rcc_c1_ahb1enr_hacif_f1en,
    cur_rcc_c1_ahb1enr_macen,
    cur_rcc_c1_ahb1enr_lzen
  };

  // --------------------------------------------------------------------------------
  // 18:18               romen               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_romen_en = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_romen = wdata[18:18];
  assign rcc_c1_rom_en = cur_rcc_c1_ahb1enr_romen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c1_ahb1enr_romen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_romen_en),
      .din  (nxt_rcc_c1_ahb1enr_romen),
      .dout (cur_rcc_c1_ahb1enr_romen)
  );

  // --------------------------------------------------------------------------------
  // 17:17               tsmsen              RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_tsmsen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_tsmsen = wdata[17:17];
  assign rcc_c1_tsms_en            = cur_rcc_c1_ahb1enr_tsmsen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c1_ahb1enr_tsmsen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_tsmsen_en),
      .din  (nxt_rcc_c1_ahb1enr_tsmsen),
      .dout (cur_rcc_c1_ahb1enr_tsmsen)
  );

  // --------------------------------------------------------------------------------
  // 16:16               smsen               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_smsen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_smsen = wdata[16:16];
  assign rcc_c1_sms_en            = cur_rcc_c1_ahb1enr_smsen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_smsen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_smsen_en),
      .din  (nxt_rcc_c1_ahb1enr_smsen),
      .dout (cur_rcc_c1_ahb1enr_smsen)
  );

  // --------------------------------------------------------------------------------
  // 15:15               xflashen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_xflashen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_xflashen = wdata[15:15];
  assign rcc_c1_xflash_en            = cur_rcc_c1_ahb1enr_xflashen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_xflashen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_xflashen_en),
      .din  (nxt_rcc_c1_ahb1enr_xflashen),
      .dout (cur_rcc_c1_ahb1enr_xflashen)
  );

  // --------------------------------------------------------------------------------
  // 14:14               fften               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_fften_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_fften = wdata[14:14];
  assign rcc_c1_fft_en            = cur_rcc_c1_ahb1enr_fften;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_fften (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_fften_en),
      .din  (nxt_rcc_c1_ahb1enr_fften),
      .dout (cur_rcc_c1_ahb1enr_fften)
  );

  // --------------------------------------------------------------------------------
  // 13:13               npuen               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_npuen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_npuen = wdata[13:13];
  assign rcc_c1_npu_en            = cur_rcc_c1_ahb1enr_npuen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_npuen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_npuen_en),
      .din  (nxt_rcc_c1_ahb1enr_npuen),
      .dout (cur_rcc_c1_ahb1enr_npuen)
  );

  // --------------------------------------------------------------------------------
  // 12:12               dma1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_dma1en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_dma1en = wdata[12:12];
  assign rcc_c1_dma1_en            = cur_rcc_c1_ahb1enr_dma1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_dma1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_dma1en_en),
      .din  (nxt_rcc_c1_ahb1enr_dma1en),
      .dout (cur_rcc_c1_ahb1enr_dma1en)
  );

  // --------------------------------------------------------------------------------
  // 11:11               dma2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_dma2en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_dma2en = wdata[11:11];
  assign rcc_c1_dma2_en            = cur_rcc_c1_ahb1enr_dma2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_dma2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_dma2en_en),
      .din  (nxt_rcc_c1_ahb1enr_dma2en),
      .dout (cur_rcc_c1_ahb1enr_dma2en)
  );

  // --------------------------------------------------------------------------------
  // 10:10               dmaschen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_dmaschen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_dmaschen = wdata[10:10];
  assign rcc_c1_dmasch_en            = cur_rcc_c1_ahb1enr_dmaschen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_dmaschen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_dmaschen_en),
      .din  (nxt_rcc_c1_ahb1enr_dmaschen),
      .dout (cur_rcc_c1_ahb1enr_dmaschen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 qspi1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_qspi1en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_qspi1en = wdata[9:9];
  assign rcc_c1_qspi1_en            = cur_rcc_c1_ahb1enr_qspi1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_qspi1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_qspi1en_en),
      .din  (nxt_rcc_c1_ahb1enr_qspi1en),
      .dout (cur_rcc_c1_ahb1enr_qspi1en)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 qspi2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_qspi2en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_qspi2en = wdata[8:8];
  assign rcc_c1_qspi2_en            = cur_rcc_c1_ahb1enr_qspi2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_qspi2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_qspi2en_en),
      .din  (nxt_rcc_c1_ahb1enr_qspi2en),
      .dout (cur_rcc_c1_ahb1enr_qspi2en)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 qspi3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_qspi3en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_qspi3en = wdata[7:7];
  assign rcc_c1_qspi3_en            = cur_rcc_c1_ahb1enr_qspi3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_qspi3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_qspi3en_en),
      .din  (nxt_rcc_c1_ahb1enr_qspi3en),
      .dout (cur_rcc_c1_ahb1enr_qspi3en)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 qspi4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_qspi4en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_qspi4en = wdata[6:6];
  assign rcc_c1_qspi4_en            = cur_rcc_c1_ahb1enr_qspi4en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_qspi4en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_qspi4en_en),
      .din  (nxt_rcc_c1_ahb1enr_qspi4en),
      .dout (cur_rcc_c1_ahb1enr_qspi4en)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 xspien              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_xspien_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_xspien = wdata[5:5];
  assign rcc_c1_xspi_en            = cur_rcc_c1_ahb1enr_xspien;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_xspien (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_xspien_en),
      .din  (nxt_rcc_c1_ahb1enr_xspien),
      .dout (cur_rcc_c1_ahb1enr_xspien)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 mspien              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_mspien_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_mspien = wdata[4:4];
  assign rcc_c1_mspi_en            = cur_rcc_c1_ahb1enr_mspien;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_mspien (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_mspien_en),
      .din  (nxt_rcc_c1_ahb1enr_mspien),
      .dout (cur_rcc_c1_ahb1enr_mspien)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 hacif_l1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_hacif_l1en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_hacif_l1en = wdata[3:3];
  assign rcc_c1_hacif_l1_en            = cur_rcc_c1_ahb1enr_hacif_l1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_hacif_l1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_hacif_l1en_en),
      .din  (nxt_rcc_c1_ahb1enr_hacif_l1en),
      .dout (cur_rcc_c1_ahb1enr_hacif_l1en)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 hacif_f1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_hacif_f1en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_hacif_f1en = wdata[2:2];
  assign rcc_c1_hacif_f1_en            = cur_rcc_c1_ahb1enr_hacif_f1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_hacif_f1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_hacif_f1en_en),
      .din  (nxt_rcc_c1_ahb1enr_hacif_f1en),
      .dout (cur_rcc_c1_ahb1enr_hacif_f1en)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 macen               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_macen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_macen = wdata[1:1];
  assign rcc_c1_mac_en            = cur_rcc_c1_ahb1enr_macen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c1_ahb1enr_macen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_macen_en),
      .din  (nxt_rcc_c1_ahb1enr_macen),
      .dout (cur_rcc_c1_ahb1enr_macen)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 lzen                RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_lzen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_lzen = wdata[0:0];
  assign rcc_c1_lz_en            = cur_rcc_c1_ahb1enr_lzen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_lzen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_lzen_en),
      .din  (nxt_rcc_c1_ahb1enr_lzen),
      .dout (cur_rcc_c1_ahb1enr_lzen)
  );


  // --------------------------------------------------------------------------------
  // rcc_c1_apb1enr                          0xc0                                    
  // --------------------------------------------------------------------------------
  // 17:17               gtim1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 16:16               gtim2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               gtim3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               gtim4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spi1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               spi2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               spi3en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               uart1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 uart2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 uart3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 uart4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 i2c1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 gpio3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 can1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 can2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 can3en              RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c1_apb1enr read data
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_read = {
    {14{1'b0}},
    cur_rcc_c1_apb1enr_gtim1en,
    cur_rcc_c1_apb1enr_gtim2en,
    cur_rcc_c1_apb1enr_gtim3en,
    cur_rcc_c1_apb1enr_gtim4en,
    cur_rcc_c1_apb1enr_spi1en,
    cur_rcc_c1_apb1enr_spi2en,
    cur_rcc_c1_apb1enr_spi3en,
    cur_rcc_c1_apb1enr_uart1en,
    cur_rcc_c1_apb1enr_uart2en,
    cur_rcc_c1_apb1enr_uart3en,
    cur_rcc_c1_apb1enr_uart4en,
    cur_rcc_c1_apb1enr_i2c1en,
    cur_rcc_c1_apb1enr_gpio1en,
    cur_rcc_c1_apb1enr_gpio2en,
    cur_rcc_c1_apb1enr_gpio3en,
    cur_rcc_c1_apb1enr_can1en,
    cur_rcc_c1_apb1enr_can2en,
    cur_rcc_c1_apb1enr_can3en
  };

  // --------------------------------------------------------------------------------
  // 17:17               gtim1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_gtim1en_en = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_gtim1en = wdata[17:17];
  assign rcc_c1_gtim1_en = cur_rcc_c1_apb1enr_gtim1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_gtim1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_gtim1en_en),
      .din  (nxt_rcc_c1_apb1enr_gtim1en),
      .dout (cur_rcc_c1_apb1enr_gtim1en)
  );

  // --------------------------------------------------------------------------------
  // 16:16               gtim2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_gtim2en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_gtim2en = wdata[16:16];
  assign rcc_c1_gtim2_en            = cur_rcc_c1_apb1enr_gtim2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_gtim2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_gtim2en_en),
      .din  (nxt_rcc_c1_apb1enr_gtim2en),
      .dout (cur_rcc_c1_apb1enr_gtim2en)
  );

  // --------------------------------------------------------------------------------
  // 15:15               gtim3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_gtim3en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_gtim3en = wdata[15:15];
  assign rcc_c1_gtim3_en            = cur_rcc_c1_apb1enr_gtim3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_gtim3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_gtim3en_en),
      .din  (nxt_rcc_c1_apb1enr_gtim3en),
      .dout (cur_rcc_c1_apb1enr_gtim3en)
  );

  // --------------------------------------------------------------------------------
  // 14:14               gtim4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_gtim4en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_gtim4en = wdata[14:14];
  assign rcc_c1_gtim4_en            = cur_rcc_c1_apb1enr_gtim4en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_gtim4en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_gtim4en_en),
      .din  (nxt_rcc_c1_apb1enr_gtim4en),
      .dout (cur_rcc_c1_apb1enr_gtim4en)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spi1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_spi1en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_spi1en = wdata[13:13];
  assign rcc_c1_spi1_en            = cur_rcc_c1_apb1enr_spi1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_spi1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_spi1en_en),
      .din  (nxt_rcc_c1_apb1enr_spi1en),
      .dout (cur_rcc_c1_apb1enr_spi1en)
  );

  // --------------------------------------------------------------------------------
  // 12:12               spi2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_spi2en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_spi2en = wdata[12:12];
  assign rcc_c1_spi2_en            = cur_rcc_c1_apb1enr_spi2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_spi2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_spi2en_en),
      .din  (nxt_rcc_c1_apb1enr_spi2en),
      .dout (cur_rcc_c1_apb1enr_spi2en)
  );

  // --------------------------------------------------------------------------------
  // 11:11               spi3en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_spi3en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_spi3en = wdata[11:11];
  assign rcc_c1_spi3_en            = cur_rcc_c1_apb1enr_spi3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_spi3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_spi3en_en),
      .din  (nxt_rcc_c1_apb1enr_spi3en),
      .dout (cur_rcc_c1_apb1enr_spi3en)
  );

  // --------------------------------------------------------------------------------
  // 10:10               uart1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_uart1en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_uart1en = wdata[10:10];
  assign rcc_c1_uart1_en            = cur_rcc_c1_apb1enr_uart1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_uart1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_uart1en_en),
      .din  (nxt_rcc_c1_apb1enr_uart1en),
      .dout (cur_rcc_c1_apb1enr_uart1en)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 uart2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_uart2en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_uart2en = wdata[9:9];
  assign rcc_c1_uart2_en            = cur_rcc_c1_apb1enr_uart2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_uart2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_uart2en_en),
      .din  (nxt_rcc_c1_apb1enr_uart2en),
      .dout (cur_rcc_c1_apb1enr_uart2en)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 uart3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_uart3en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_uart3en = wdata[8:8];
  assign rcc_c1_uart3_en            = cur_rcc_c1_apb1enr_uart3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_uart3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_uart3en_en),
      .din  (nxt_rcc_c1_apb1enr_uart3en),
      .dout (cur_rcc_c1_apb1enr_uart3en)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 uart4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_uart4en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_uart4en = wdata[7:7];
  assign rcc_c1_uart4_en            = cur_rcc_c1_apb1enr_uart4en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_uart4en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_uart4en_en),
      .din  (nxt_rcc_c1_apb1enr_uart4en),
      .dout (cur_rcc_c1_apb1enr_uart4en)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 i2c1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_i2c1en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_i2c1en = wdata[6:6];
  assign rcc_c1_i2c1_en            = cur_rcc_c1_apb1enr_i2c1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_i2c1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_i2c1en_en),
      .din  (nxt_rcc_c1_apb1enr_i2c1en),
      .dout (cur_rcc_c1_apb1enr_i2c1en)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 gpio1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_gpio1en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_gpio1en = wdata[5:5];
  assign rcc_c1_gpio1_en            = cur_rcc_c1_apb1enr_gpio1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_gpio1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_gpio1en_en),
      .din  (nxt_rcc_c1_apb1enr_gpio1en),
      .dout (cur_rcc_c1_apb1enr_gpio1en)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 gpio2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_gpio2en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_gpio2en = wdata[4:4];
  assign rcc_c1_gpio2_en            = cur_rcc_c1_apb1enr_gpio2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_gpio2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_gpio2en_en),
      .din  (nxt_rcc_c1_apb1enr_gpio2en),
      .dout (cur_rcc_c1_apb1enr_gpio2en)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 gpio3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_gpio3en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_gpio3en = wdata[3:3];
  assign rcc_c1_gpio3_en            = cur_rcc_c1_apb1enr_gpio3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_gpio3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_gpio3en_en),
      .din  (nxt_rcc_c1_apb1enr_gpio3en),
      .dout (cur_rcc_c1_apb1enr_gpio3en)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 can1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_can1en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_can1en = wdata[2:2];
  assign rcc_c1_can1_en            = cur_rcc_c1_apb1enr_can1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_can1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_can1en_en),
      .din  (nxt_rcc_c1_apb1enr_can1en),
      .dout (cur_rcc_c1_apb1enr_can1en)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 can2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_can2en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_can2en = wdata[1:1];
  assign rcc_c1_can2_en            = cur_rcc_c1_apb1enr_can2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_can2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_can2en_en),
      .din  (nxt_rcc_c1_apb1enr_can2en),
      .dout (cur_rcc_c1_apb1enr_can2en)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 can3en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1enr_can3en_en  = (|wr_req & rcc_c1_apb1enr_sel);
  assign nxt_rcc_c1_apb1enr_can3en = wdata[0:0];
  assign rcc_c1_can3_en            = cur_rcc_c1_apb1enr_can3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1enr_can3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1enr_can3en_en),
      .din  (nxt_rcc_c1_apb1enr_can3en),
      .dout (cur_rcc_c1_apb1enr_can3en)
  );


  // --------------------------------------------------------------------------------
  // rcc_c1_apb2enr                          0xc4                                    
  // --------------------------------------------------------------------------------
  // 15:15               gtim5en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               gtim6en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spi4en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               spi5en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               uart5en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               uart6en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 uart7en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 uart8en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 i2c2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 i2c3en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 can4en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 can5en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 can6en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 mppten          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 gpio4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 gpio5en             RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c1_apb2enr read data
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_read = {
    {16{1'b0}},
    cur_rcc_c1_apb2enr_gtim5en,
    cur_rcc_c1_apb2enr_gtim6en,
    cur_rcc_c1_apb2enr_spi4en,
    cur_rcc_c1_apb2enr_spi5en,
    cur_rcc_c1_apb2enr_uart5en,
    cur_rcc_c1_apb2enr_uart6en,
    cur_rcc_c1_apb2enr_uart7en,
    cur_rcc_c1_apb2enr_uart8en,
    cur_rcc_c1_apb2enr_i2c2en,
    cur_rcc_c1_apb2enr_i2c3en,
    cur_rcc_c1_apb2enr_can4en,
    cur_rcc_c1_apb2enr_can5en,
    cur_rcc_c1_apb2enr_can6en,
    cur_rcc_c1_apb2enr_mppten,
    cur_rcc_c1_apb2enr_gpio4en,
    cur_rcc_c1_apb2enr_gpio5en
  };

  // --------------------------------------------------------------------------------
  // 15:15               gtim5en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_gtim5en_en = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_gtim5en = wdata[15:15];
  assign rcc_c1_gtim5_en = cur_rcc_c1_apb2enr_gtim5en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_gtim5en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_gtim5en_en),
      .din  (nxt_rcc_c1_apb2enr_gtim5en),
      .dout (cur_rcc_c1_apb2enr_gtim5en)
  );

  // --------------------------------------------------------------------------------
  // 14:14               gtim6en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_gtim6en_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_gtim6en = wdata[14:14];
  assign rcc_c1_gtim6_en            = cur_rcc_c1_apb2enr_gtim6en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_gtim6en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_gtim6en_en),
      .din  (nxt_rcc_c1_apb2enr_gtim6en),
      .dout (cur_rcc_c1_apb2enr_gtim6en)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spi4en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_spi4en_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_spi4en = wdata[13:13];
  assign rcc_c1_spi4_en            = cur_rcc_c1_apb2enr_spi4en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_spi4en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_spi4en_en),
      .din  (nxt_rcc_c1_apb2enr_spi4en),
      .dout (cur_rcc_c1_apb2enr_spi4en)
  );

  // --------------------------------------------------------------------------------
  // 12:12               spi5en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_spi5en_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_spi5en = wdata[12:12];
  assign rcc_c1_spi5_en            = cur_rcc_c1_apb2enr_spi5en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_spi5en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_spi5en_en),
      .din  (nxt_rcc_c1_apb2enr_spi5en),
      .dout (cur_rcc_c1_apb2enr_spi5en)
  );

  // --------------------------------------------------------------------------------
  // 11:11               uart5en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_uart5en_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_uart5en = wdata[11:11];
  assign rcc_c1_uart5_en            = cur_rcc_c1_apb2enr_uart5en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_uart5en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_uart5en_en),
      .din  (nxt_rcc_c1_apb2enr_uart5en),
      .dout (cur_rcc_c1_apb2enr_uart5en)
  );

  // --------------------------------------------------------------------------------
  // 10:10               uart6en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_uart6en_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_uart6en = wdata[10:10];
  assign rcc_c1_uart6_en            = cur_rcc_c1_apb2enr_uart6en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_uart6en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_uart6en_en),
      .din  (nxt_rcc_c1_apb2enr_uart6en),
      .dout (cur_rcc_c1_apb2enr_uart6en)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 uart7en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_uart7en_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_uart7en = wdata[9:9];
  assign rcc_c1_uart7_en            = cur_rcc_c1_apb2enr_uart7en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_uart7en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_uart7en_en),
      .din  (nxt_rcc_c1_apb2enr_uart7en),
      .dout (cur_rcc_c1_apb2enr_uart7en)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 uart8en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_uart8en_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_uart8en = wdata[8:8];
  assign rcc_c1_uart8_en            = cur_rcc_c1_apb2enr_uart8en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_uart8en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_uart8en_en),
      .din  (nxt_rcc_c1_apb2enr_uart8en),
      .dout (cur_rcc_c1_apb2enr_uart8en)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 i2c2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_i2c2en_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_i2c2en = wdata[7:7];
  assign rcc_c1_i2c2_en            = cur_rcc_c1_apb2enr_i2c2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_i2c2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_i2c2en_en),
      .din  (nxt_rcc_c1_apb2enr_i2c2en),
      .dout (cur_rcc_c1_apb2enr_i2c2en)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 i2c3en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_i2c3en_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_i2c3en = wdata[6:6];
  assign rcc_c1_i2c3_en            = cur_rcc_c1_apb2enr_i2c3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_i2c3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_i2c3en_en),
      .din  (nxt_rcc_c1_apb2enr_i2c3en),
      .dout (cur_rcc_c1_apb2enr_i2c3en)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 can4en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_can4en_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_can4en = wdata[5:5];
  assign rcc_c1_can4_en            = cur_rcc_c1_apb2enr_can4en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_can4en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_can4en_en),
      .din  (nxt_rcc_c1_apb2enr_can4en),
      .dout (cur_rcc_c1_apb2enr_can4en)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 can5en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_can5en_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_can5en = wdata[4:4];
  assign rcc_c1_can5_en            = cur_rcc_c1_apb2enr_can5en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_can5en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_can5en_en),
      .din  (nxt_rcc_c1_apb2enr_can5en),
      .dout (cur_rcc_c1_apb2enr_can5en)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 can6en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_can6en_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_can6en = wdata[3:3];
  assign rcc_c1_can6_en            = cur_rcc_c1_apb2enr_can6en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_can6en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_can6en_en),
      .din  (nxt_rcc_c1_apb2enr_can6en),
      .dout (cur_rcc_c1_apb2enr_can6en)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 mppten          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_mppten_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_mppten = wdata[2:2];
  assign rcc_c1_mppt_en            = cur_rcc_c1_apb2enr_mppten;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_mppten (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_mppten_en),
      .din  (nxt_rcc_c1_apb2enr_mppten),
      .dout (cur_rcc_c1_apb2enr_mppten)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 gpio4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_gpio4en_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_gpio4en = wdata[1:1];
  assign rcc_c1_gpio4_en            = cur_rcc_c1_apb2enr_gpio4en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_gpio4en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_gpio4en_en),
      .din  (nxt_rcc_c1_apb2enr_gpio4en),
      .dout (cur_rcc_c1_apb2enr_gpio4en)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 gpio5en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2enr_gpio5en_en  = (|wr_req & rcc_c1_apb2enr_sel);
  assign nxt_rcc_c1_apb2enr_gpio5en = wdata[0:0];
  assign rcc_c1_gpio5_en            = cur_rcc_c1_apb2enr_gpio5en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2enr_gpio5en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2enr_gpio5en_en),
      .din  (nxt_rcc_c1_apb2enr_gpio5en),
      .dout (cur_rcc_c1_apb2enr_gpio5en)
  );


  // --------------------------------------------------------------------------------
  // rcc_c1_apb3enr                          0xc8                                    
  // --------------------------------------------------------------------------------
  // 11:11               sysctlen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               wwdten              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 tim1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 tim2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 adccen              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 gpio6en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio7en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio8en             RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c1_apb3enr read data
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_read         = {{20{1'b0}}, cur_rcc_c1_apb3enr_sysctlen, cur_rcc_c1_apb3enr_wwdten, cur_rcc_c1_apb3enr_tim1en, cur_rcc_c1_apb3enr_tim2en, cur_rcc_c1_apb3enr_adccen, cur_rcc_c1_apb3enr_gpio6en, cur_rcc_c1_apb3enr_gpio7en, cur_rcc_c1_apb3enr_gpio8en, {4{1'b0}}};

  // --------------------------------------------------------------------------------
  // 11:11               sysctlen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_sysctlen_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_sysctlen = wdata[11:11];
  assign rcc_c1_sysctl_en            = cur_rcc_c1_apb3enr_sysctlen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3enr_sysctlen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3enr_sysctlen_en),
      .din  (nxt_rcc_c1_apb3enr_sysctlen),
      .dout (cur_rcc_c1_apb3enr_sysctlen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               wwdten              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_wwdten_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_wwdten = wdata[10:10];
  assign rcc_c1_wwdt_en            = cur_rcc_c1_apb3enr_wwdten;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3enr_wwdten (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3enr_wwdten_en),
      .din  (nxt_rcc_c1_apb3enr_wwdten),
      .dout (cur_rcc_c1_apb3enr_wwdten)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 tim1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_tim1en_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_tim1en = wdata[9:9];
  assign rcc_c1_tim1_en            = cur_rcc_c1_apb3enr_tim1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3enr_tim1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3enr_tim1en_en),
      .din  (nxt_rcc_c1_apb3enr_tim1en),
      .dout (cur_rcc_c1_apb3enr_tim1en)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 tim2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_tim2en_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_tim2en = wdata[8:8];
  assign rcc_c1_tim2_en            = cur_rcc_c1_apb3enr_tim2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3enr_tim2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3enr_tim2en_en),
      .din  (nxt_rcc_c1_apb3enr_tim2en),
      .dout (cur_rcc_c1_apb3enr_tim2en)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 adccen              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_adccen_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_adccen = wdata[7:7];
  assign rcc_c1_adcc_en            = cur_rcc_c1_apb3enr_adccen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3enr_adccen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3enr_adccen_en),
      .din  (nxt_rcc_c1_apb3enr_adccen),
      .dout (cur_rcc_c1_apb3enr_adccen)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 gpio6en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_gpio6en_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_gpio6en = wdata[6:6];
  assign rcc_c1_gpio6_en            = cur_rcc_c1_apb3enr_gpio6en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3enr_gpio6en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3enr_gpio6en_en),
      .din  (nxt_rcc_c1_apb3enr_gpio6en),
      .dout (cur_rcc_c1_apb3enr_gpio6en)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 gpio7en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_gpio7en_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_gpio7en = wdata[5:5];
  assign rcc_c1_gpio7_en            = cur_rcc_c1_apb3enr_gpio7en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3enr_gpio7en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3enr_gpio7en_en),
      .din  (nxt_rcc_c1_apb3enr_gpio7en),
      .dout (cur_rcc_c1_apb3enr_gpio7en)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 gpio8en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_gpio8en_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_gpio8en = wdata[4:4];
  assign rcc_c1_gpio8_en            = cur_rcc_c1_apb3enr_gpio8en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3enr_gpio8en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3enr_gpio8en_en),
      .din  (nxt_rcc_c1_apb3enr_gpio8en),
      .dout (cur_rcc_c1_apb3enr_gpio8en)
  );


  // --------------------------------------------------------------------------------
  // rcc_c1_ahb1lpenr                        0xcc                                    
  // --------------------------------------------------------------------------------
  // 18:18               romlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 17:17               tsmslpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 16:16               smslpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               xflashlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               fftlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               npulpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               dma1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               dma2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               dmaschlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 qspi1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 qspi2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 qspi3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 qspi4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 xspilpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 mspilpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 hacif_l1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 hacif_f1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 maclpen             RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 0:0                 lzlpen              RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c1_ahb1lpenr read data
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_read = {
    {13{1'b0}},
    cur_rcc_c1_ahb1lpenr_romlpen,
    cur_rcc_c1_ahb1lpenr_tsmslpen,
    cur_rcc_c1_ahb1lpenr_smslpen,
    cur_rcc_c1_ahb1lpenr_xflashlpen,
    cur_rcc_c1_ahb1lpenr_fftlpen,
    cur_rcc_c1_ahb1lpenr_npulpen,
    cur_rcc_c1_ahb1lpenr_dma1lpen,
    cur_rcc_c1_ahb1lpenr_dma2lpen,
    cur_rcc_c1_ahb1lpenr_dmaschlpen,
    cur_rcc_c1_ahb1lpenr_qspi1lpen,
    cur_rcc_c1_ahb1lpenr_qspi2lpen,
    cur_rcc_c1_ahb1lpenr_qspi3lpen,
    cur_rcc_c1_ahb1lpenr_qspi4lpen,
    cur_rcc_c1_ahb1lpenr_xspilpen,
    cur_rcc_c1_ahb1lpenr_mspilpen,
    cur_rcc_c1_ahb1lpenr_hacif_l1lpen,
    cur_rcc_c1_ahb1lpenr_hacif_f1lpen,
    cur_rcc_c1_ahb1lpenr_maclpen,
    cur_rcc_c1_ahb1lpenr_lzlpen
  };

  // --------------------------------------------------------------------------------
  // 18:18               romlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_romlpen_en = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_romlpen = wdata[18:18];
  assign rcc_c1_rom_lpen = cur_rcc_c1_ahb1lpenr_romlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_romlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_romlpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_romlpen),
      .dout (cur_rcc_c1_ahb1lpenr_romlpen)
  );

  // --------------------------------------------------------------------------------
  // 17:17               tsmslpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_tsmslpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_tsmslpen = wdata[17:17];
  assign rcc_c1_tsms_lpen              = cur_rcc_c1_ahb1lpenr_tsmslpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_tsmslpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_tsmslpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_tsmslpen),
      .dout (cur_rcc_c1_ahb1lpenr_tsmslpen)
  );

  // --------------------------------------------------------------------------------
  // 16:16               smslpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_smslpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_smslpen = wdata[16:16];
  assign rcc_c1_sms_lpen              = cur_rcc_c1_ahb1lpenr_smslpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_smslpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_smslpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_smslpen),
      .dout (cur_rcc_c1_ahb1lpenr_smslpen)
  );

  // --------------------------------------------------------------------------------
  // 15:15               xflashlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_xflashlpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_xflashlpen = wdata[15:15];
  assign rcc_c1_xflash_lpen              = cur_rcc_c1_ahb1lpenr_xflashlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_xflashlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_xflashlpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_xflashlpen),
      .dout (cur_rcc_c1_ahb1lpenr_xflashlpen)
  );

  // --------------------------------------------------------------------------------
  // 14:14               fftlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_fftlpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_fftlpen = wdata[14:14];
  assign rcc_c1_fft_lpen              = cur_rcc_c1_ahb1lpenr_fftlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_fftlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_fftlpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_fftlpen),
      .dout (cur_rcc_c1_ahb1lpenr_fftlpen)
  );

  // --------------------------------------------------------------------------------
  // 13:13               npulpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_npulpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_npulpen = wdata[13:13];
  assign rcc_c1_npu_lpen              = cur_rcc_c1_ahb1lpenr_npulpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_npulpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_npulpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_npulpen),
      .dout (cur_rcc_c1_ahb1lpenr_npulpen)
  );

  // --------------------------------------------------------------------------------
  // 12:12               dma1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_dma1lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_dma1lpen = wdata[12:12];
  assign rcc_c1_dma1_lpen              = cur_rcc_c1_ahb1lpenr_dma1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_dma1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_dma1lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_dma1lpen),
      .dout (cur_rcc_c1_ahb1lpenr_dma1lpen)
  );

  // --------------------------------------------------------------------------------
  // 11:11               dma2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_dma2lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_dma2lpen = wdata[11:11];
  assign rcc_c1_dma2_lpen              = cur_rcc_c1_ahb1lpenr_dma2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_dma2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_dma2lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_dma2lpen),
      .dout (cur_rcc_c1_ahb1lpenr_dma2lpen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               dmaschlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_dmaschlpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_dmaschlpen = wdata[10:10];
  assign rcc_c1_dmasch_lpen              = cur_rcc_c1_ahb1lpenr_dmaschlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_dmaschlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_dmaschlpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_dmaschlpen),
      .dout (cur_rcc_c1_ahb1lpenr_dmaschlpen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 qspi1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_qspi1lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_qspi1lpen = wdata[9:9];
  assign rcc_c1_qspi1_lpen              = cur_rcc_c1_ahb1lpenr_qspi1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_qspi1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_qspi1lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_qspi1lpen),
      .dout (cur_rcc_c1_ahb1lpenr_qspi1lpen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 qspi2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_qspi2lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_qspi2lpen = wdata[8:8];
  assign rcc_c1_qspi2_lpen              = cur_rcc_c1_ahb1lpenr_qspi2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_qspi2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_qspi2lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_qspi2lpen),
      .dout (cur_rcc_c1_ahb1lpenr_qspi2lpen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 qspi3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_qspi3lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_qspi3lpen = wdata[7:7];
  assign rcc_c1_qspi3_lpen              = cur_rcc_c1_ahb1lpenr_qspi3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_qspi3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_qspi3lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_qspi3lpen),
      .dout (cur_rcc_c1_ahb1lpenr_qspi3lpen)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 qspi4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_qspi4lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_qspi4lpen = wdata[6:6];
  assign rcc_c1_qspi4_lpen              = cur_rcc_c1_ahb1lpenr_qspi4lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_qspi4lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_qspi4lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_qspi4lpen),
      .dout (cur_rcc_c1_ahb1lpenr_qspi4lpen)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 xspilpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_xspilpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_xspilpen = wdata[5:5];
  assign rcc_c1_xspi_lpen              = cur_rcc_c1_ahb1lpenr_xspilpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_xspilpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_xspilpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_xspilpen),
      .dout (cur_rcc_c1_ahb1lpenr_xspilpen)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 mspilpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_mspilpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_mspilpen = wdata[4:4];
  assign rcc_c1_mspi_lpen              = cur_rcc_c1_ahb1lpenr_mspilpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_mspilpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_mspilpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_mspilpen),
      .dout (cur_rcc_c1_ahb1lpenr_mspilpen)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 hacif_l1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_hacif_l1lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_hacif_l1lpen = wdata[3:3];
  assign rcc_c1_hacif_l1_lpen              = cur_rcc_c1_ahb1lpenr_hacif_l1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_hacif_l1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_hacif_l1lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_hacif_l1lpen),
      .dout (cur_rcc_c1_ahb1lpenr_hacif_l1lpen)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 hacif_f1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_hacif_f1lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_hacif_f1lpen = wdata[2:2];
  assign rcc_c1_hacif_f1_lpen              = cur_rcc_c1_ahb1lpenr_hacif_f1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_hacif_f1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_hacif_f1lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_hacif_f1lpen),
      .dout (cur_rcc_c1_ahb1lpenr_hacif_f1lpen)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 maclpen             RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_maclpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_maclpen = wdata[1:1];
  assign rcc_c1_mac_lpen              = cur_rcc_c1_ahb1lpenr_maclpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c1_ahb1lpenr_maclpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_maclpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_maclpen),
      .dout (cur_rcc_c1_ahb1lpenr_maclpen)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 lzlpen              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_lzlpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_lzlpen = wdata[0:0];
  assign rcc_c1_lz_lpen              = cur_rcc_c1_ahb1lpenr_lzlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_lzlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_lzlpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_lzlpen),
      .dout (cur_rcc_c1_ahb1lpenr_lzlpen)
  );


  // --------------------------------------------------------------------------------
  // rcc_c1_apb1lpenr                        0xd0                                    
  // --------------------------------------------------------------------------------
  // 17:17               gtim1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 16:16               gtim2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               gtim3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               gtim4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spi1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               spi2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               spi3lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               uart1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 uart2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 uart3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 uart4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 i2c1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 gpio3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 can1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 can2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 can3lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c1_apb1lpenr read data
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_read = {
    {14{1'b0}},
    cur_rcc_c1_apb1lpenr_gtim1lpen,
    cur_rcc_c1_apb1lpenr_gtim2lpen,
    cur_rcc_c1_apb1lpenr_gtim3lpen,
    cur_rcc_c1_apb1lpenr_gtim4lpen,
    cur_rcc_c1_apb1lpenr_spi1lpen,
    cur_rcc_c1_apb1lpenr_spi2lpen,
    cur_rcc_c1_apb1lpenr_spi3lpen,
    cur_rcc_c1_apb1lpenr_uart1lpen,
    cur_rcc_c1_apb1lpenr_uart2lpen,
    cur_rcc_c1_apb1lpenr_uart3lpen,
    cur_rcc_c1_apb1lpenr_uart4lpen,
    cur_rcc_c1_apb1lpenr_i2c1lpen,
    cur_rcc_c1_apb1lpenr_gpio1lpen,
    cur_rcc_c1_apb1lpenr_gpio2lpen,
    cur_rcc_c1_apb1lpenr_gpio3lpen,
    cur_rcc_c1_apb1lpenr_can1lpen,
    cur_rcc_c1_apb1lpenr_can2lpen,
    cur_rcc_c1_apb1lpenr_can3lpen
  };

  // --------------------------------------------------------------------------------
  // 17:17               gtim1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_gtim1lpen_en = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_gtim1lpen = wdata[17:17];
  assign rcc_c1_gtim1_lpen = cur_rcc_c1_apb1lpenr_gtim1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_gtim1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_gtim1lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_gtim1lpen),
      .dout (cur_rcc_c1_apb1lpenr_gtim1lpen)
  );

  // --------------------------------------------------------------------------------
  // 16:16               gtim2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_gtim2lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_gtim2lpen = wdata[16:16];
  assign rcc_c1_gtim2_lpen              = cur_rcc_c1_apb1lpenr_gtim2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_gtim2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_gtim2lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_gtim2lpen),
      .dout (cur_rcc_c1_apb1lpenr_gtim2lpen)
  );

  // --------------------------------------------------------------------------------
  // 15:15               gtim3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_gtim3lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_gtim3lpen = wdata[15:15];
  assign rcc_c1_gtim3_lpen              = cur_rcc_c1_apb1lpenr_gtim3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_gtim3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_gtim3lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_gtim3lpen),
      .dout (cur_rcc_c1_apb1lpenr_gtim3lpen)
  );

  // --------------------------------------------------------------------------------
  // 14:14               gtim4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_gtim4lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_gtim4lpen = wdata[14:14];
  assign rcc_c1_gtim4_lpen              = cur_rcc_c1_apb1lpenr_gtim4lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_gtim4lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_gtim4lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_gtim4lpen),
      .dout (cur_rcc_c1_apb1lpenr_gtim4lpen)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spi1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_spi1lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_spi1lpen = wdata[13:13];
  assign rcc_c1_spi1_lpen              = cur_rcc_c1_apb1lpenr_spi1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_spi1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_spi1lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_spi1lpen),
      .dout (cur_rcc_c1_apb1lpenr_spi1lpen)
  );

  // --------------------------------------------------------------------------------
  // 12:12               spi2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_spi2lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_spi2lpen = wdata[12:12];
  assign rcc_c1_spi2_lpen              = cur_rcc_c1_apb1lpenr_spi2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_spi2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_spi2lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_spi2lpen),
      .dout (cur_rcc_c1_apb1lpenr_spi2lpen)
  );

  // --------------------------------------------------------------------------------
  // 11:11               spi3lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_spi3lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_spi3lpen = wdata[11:11];
  assign rcc_c1_spi3_lpen              = cur_rcc_c1_apb1lpenr_spi3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_spi3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_spi3lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_spi3lpen),
      .dout (cur_rcc_c1_apb1lpenr_spi3lpen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               uart1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_uart1lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_uart1lpen = wdata[10:10];
  assign rcc_c1_uart1_lpen              = cur_rcc_c1_apb1lpenr_uart1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_uart1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_uart1lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_uart1lpen),
      .dout (cur_rcc_c1_apb1lpenr_uart1lpen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 uart2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_uart2lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_uart2lpen = wdata[9:9];
  assign rcc_c1_uart2_lpen              = cur_rcc_c1_apb1lpenr_uart2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_uart2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_uart2lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_uart2lpen),
      .dout (cur_rcc_c1_apb1lpenr_uart2lpen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 uart3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_uart3lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_uart3lpen = wdata[8:8];
  assign rcc_c1_uart3_lpen              = cur_rcc_c1_apb1lpenr_uart3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_uart3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_uart3lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_uart3lpen),
      .dout (cur_rcc_c1_apb1lpenr_uart3lpen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 uart4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_uart4lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_uart4lpen = wdata[7:7];
  assign rcc_c1_uart4_lpen              = cur_rcc_c1_apb1lpenr_uart4lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_uart4lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_uart4lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_uart4lpen),
      .dout (cur_rcc_c1_apb1lpenr_uart4lpen)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 i2c1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_i2c1lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_i2c1lpen = wdata[6:6];
  assign rcc_c1_i2c1_lpen              = cur_rcc_c1_apb1lpenr_i2c1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_i2c1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_i2c1lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_i2c1lpen),
      .dout (cur_rcc_c1_apb1lpenr_i2c1lpen)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 gpio1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_gpio1lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_gpio1lpen = wdata[5:5];
  assign rcc_c1_gpio1_lpen              = cur_rcc_c1_apb1lpenr_gpio1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_gpio1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_gpio1lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_gpio1lpen),
      .dout (cur_rcc_c1_apb1lpenr_gpio1lpen)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 gpio2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_gpio2lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_gpio2lpen = wdata[4:4];
  assign rcc_c1_gpio2_lpen              = cur_rcc_c1_apb1lpenr_gpio2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_gpio2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_gpio2lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_gpio2lpen),
      .dout (cur_rcc_c1_apb1lpenr_gpio2lpen)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 gpio3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_gpio3lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_gpio3lpen = wdata[3:3];
  assign rcc_c1_gpio3_lpen              = cur_rcc_c1_apb1lpenr_gpio3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_gpio3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_gpio3lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_gpio3lpen),
      .dout (cur_rcc_c1_apb1lpenr_gpio3lpen)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 can1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_can1lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_can1lpen = wdata[2:2];
  assign rcc_c1_can1_lpen              = cur_rcc_c1_apb1lpenr_can1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_can1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_can1lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_can1lpen),
      .dout (cur_rcc_c1_apb1lpenr_can1lpen)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 can2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_can2lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_can2lpen = wdata[1:1];
  assign rcc_c1_can2_lpen              = cur_rcc_c1_apb1lpenr_can2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_can2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_can2lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_can2lpen),
      .dout (cur_rcc_c1_apb1lpenr_can2lpen)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 can3lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb1lpenr_can3lpen_en  = (|wr_req & rcc_c1_apb1lpenr_sel);
  assign nxt_rcc_c1_apb1lpenr_can3lpen = wdata[0:0];
  assign rcc_c1_can3_lpen              = cur_rcc_c1_apb1lpenr_can3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb1lpenr_can3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb1lpenr_can3lpen_en),
      .din  (nxt_rcc_c1_apb1lpenr_can3lpen),
      .dout (cur_rcc_c1_apb1lpenr_can3lpen)
  );


  // --------------------------------------------------------------------------------
  // rcc_c1_apb2lpenr                        0xd4                                    
  // --------------------------------------------------------------------------------
  // 15:15               gtim5lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               gtim6lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spi4lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               spi5lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               uart5lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               uart6lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 uart7lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 uart8lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 i2c2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 i2c3lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 can4lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 can5lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 can6lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 mpptlpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 gpio4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 gpio5lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c1_apb2lpenr read data
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_read = {
    {16{1'b0}},
    cur_rcc_c1_apb2lpenr_gtim5lpen,
    cur_rcc_c1_apb2lpenr_gtim6lpen,
    cur_rcc_c1_apb2lpenr_spi4lpen,
    cur_rcc_c1_apb2lpenr_spi5lpen,
    cur_rcc_c1_apb2lpenr_uart5lpen,
    cur_rcc_c1_apb2lpenr_uart6lpen,
    cur_rcc_c1_apb2lpenr_uart7lpen,
    cur_rcc_c1_apb2lpenr_uart8lpen,
    cur_rcc_c1_apb2lpenr_i2c2lpen,
    cur_rcc_c1_apb2lpenr_i2c3lpen,
    cur_rcc_c1_apb2lpenr_can4lpen,
    cur_rcc_c1_apb2lpenr_can5lpen,
    cur_rcc_c1_apb2lpenr_can6lpen,
    cur_rcc_c1_apb2lpenr_mpptlpen,
    cur_rcc_c1_apb2lpenr_gpio4lpen,
    cur_rcc_c1_apb2lpenr_gpio5lpen
  };

  // --------------------------------------------------------------------------------
  // 15:15               gtim5lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_gtim5lpen_en = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_gtim5lpen = wdata[15:15];
  assign rcc_c1_gtim5_lpen = cur_rcc_c1_apb2lpenr_gtim5lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_gtim5lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_gtim5lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_gtim5lpen),
      .dout (cur_rcc_c1_apb2lpenr_gtim5lpen)
  );

  // --------------------------------------------------------------------------------
  // 14:14               gtim6lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_gtim6lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_gtim6lpen = wdata[14:14];
  assign rcc_c1_gtim6_lpen              = cur_rcc_c1_apb2lpenr_gtim6lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_gtim6lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_gtim6lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_gtim6lpen),
      .dout (cur_rcc_c1_apb2lpenr_gtim6lpen)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spi4lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_spi4lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_spi4lpen = wdata[13:13];
  assign rcc_c1_spi4_lpen              = cur_rcc_c1_apb2lpenr_spi4lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_spi4lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_spi4lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_spi4lpen),
      .dout (cur_rcc_c1_apb2lpenr_spi4lpen)
  );

  // --------------------------------------------------------------------------------
  // 12:12               spi5lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_spi5lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_spi5lpen = wdata[12:12];
  assign rcc_c1_spi5_lpen              = cur_rcc_c1_apb2lpenr_spi5lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_spi5lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_spi5lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_spi5lpen),
      .dout (cur_rcc_c1_apb2lpenr_spi5lpen)
  );

  // --------------------------------------------------------------------------------
  // 11:11               uart5lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_uart5lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_uart5lpen = wdata[11:11];
  assign rcc_c1_uart5_lpen              = cur_rcc_c1_apb2lpenr_uart5lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_uart5lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_uart5lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_uart5lpen),
      .dout (cur_rcc_c1_apb2lpenr_uart5lpen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               uart6lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_uart6lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_uart6lpen = wdata[10:10];
  assign rcc_c1_uart6_lpen              = cur_rcc_c1_apb2lpenr_uart6lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_uart6lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_uart6lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_uart6lpen),
      .dout (cur_rcc_c1_apb2lpenr_uart6lpen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 uart7lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_uart7lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_uart7lpen = wdata[9:9];
  assign rcc_c1_uart7_lpen              = cur_rcc_c1_apb2lpenr_uart7lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_uart7lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_uart7lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_uart7lpen),
      .dout (cur_rcc_c1_apb2lpenr_uart7lpen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 uart8lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_uart8lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_uart8lpen = wdata[8:8];
  assign rcc_c1_uart8_lpen              = cur_rcc_c1_apb2lpenr_uart8lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_uart8lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_uart8lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_uart8lpen),
      .dout (cur_rcc_c1_apb2lpenr_uart8lpen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 i2c2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_i2c2lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_i2c2lpen = wdata[7:7];
  assign rcc_c1_i2c2_lpen              = cur_rcc_c1_apb2lpenr_i2c2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_i2c2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_i2c2lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_i2c2lpen),
      .dout (cur_rcc_c1_apb2lpenr_i2c2lpen)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 i2c3lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_i2c3lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_i2c3lpen = wdata[6:6];
  assign rcc_c1_i2c3_lpen              = cur_rcc_c1_apb2lpenr_i2c3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_i2c3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_i2c3lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_i2c3lpen),
      .dout (cur_rcc_c1_apb2lpenr_i2c3lpen)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 can4lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_can4lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_can4lpen = wdata[5:5];
  assign rcc_c1_can4_lpen              = cur_rcc_c1_apb2lpenr_can4lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_can4lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_can4lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_can4lpen),
      .dout (cur_rcc_c1_apb2lpenr_can4lpen)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 can5lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_can5lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_can5lpen = wdata[4:4];
  assign rcc_c1_can5_lpen              = cur_rcc_c1_apb2lpenr_can5lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_can5lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_can5lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_can5lpen),
      .dout (cur_rcc_c1_apb2lpenr_can5lpen)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 can6lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_can6lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_can6lpen = wdata[3:3];
  assign rcc_c1_can6_lpen              = cur_rcc_c1_apb2lpenr_can6lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_can6lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_can6lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_can6lpen),
      .dout (cur_rcc_c1_apb2lpenr_can6lpen)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 mpptlpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_mpptlpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_mpptlpen = wdata[2:2];
  assign rcc_c1_mppt_lpen              = cur_rcc_c1_apb2lpenr_mpptlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_mpptlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_mpptlpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_mpptlpen),
      .dout (cur_rcc_c1_apb2lpenr_mpptlpen)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 gpio4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_gpio4lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_gpio4lpen = wdata[1:1];
  assign rcc_c1_gpio4_lpen              = cur_rcc_c1_apb2lpenr_gpio4lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_gpio4lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_gpio4lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_gpio4lpen),
      .dout (cur_rcc_c1_apb2lpenr_gpio4lpen)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 gpio5lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb2lpenr_gpio5lpen_en  = (|wr_req & rcc_c1_apb2lpenr_sel);
  assign nxt_rcc_c1_apb2lpenr_gpio5lpen = wdata[0:0];
  assign rcc_c1_gpio5_lpen              = cur_rcc_c1_apb2lpenr_gpio5lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb2lpenr_gpio5lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb2lpenr_gpio5lpen_en),
      .din  (nxt_rcc_c1_apb2lpenr_gpio5lpen),
      .dout (cur_rcc_c1_apb2lpenr_gpio5lpen)
  );


  // --------------------------------------------------------------------------------
  // rcc_c1_apb3lpenr                        0xd8                                    
  // --------------------------------------------------------------------------------
  // 11:11               sysctllpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               wwdtlpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 tim1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 tim2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 adcclpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 gpio6lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio7lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio8lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c1_apb3lpenr read data
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_read = {
    {20{1'b0}}, cur_rcc_c1_apb3lpenr_sysctllpen, cur_rcc_c1_apb3lpenr_wwdtlpen, cur_rcc_c1_apb3lpenr_tim1lpen, cur_rcc_c1_apb3lpenr_tim2lpen, cur_rcc_c1_apb3lpenr_adcclpen, cur_rcc_c1_apb3lpenr_gpio6lpen, cur_rcc_c1_apb3lpenr_gpio7lpen, cur_rcc_c1_apb3lpenr_gpio8lpen, {4{1'b0}}
  };

  // --------------------------------------------------------------------------------
  // 11:11               sysctllpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_sysctllpen_en = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_sysctllpen = wdata[11:11];
  assign rcc_c1_sysctl_lpen = cur_rcc_c1_apb3lpenr_sysctllpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3lpenr_sysctllpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3lpenr_sysctllpen_en),
      .din  (nxt_rcc_c1_apb3lpenr_sysctllpen),
      .dout (cur_rcc_c1_apb3lpenr_sysctllpen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               wwdtlpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_wwdtlpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_wwdtlpen = wdata[10:10];
  assign rcc_c1_wwdt_lpen              = cur_rcc_c1_apb3lpenr_wwdtlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3lpenr_wwdtlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3lpenr_wwdtlpen_en),
      .din  (nxt_rcc_c1_apb3lpenr_wwdtlpen),
      .dout (cur_rcc_c1_apb3lpenr_wwdtlpen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 tim1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_tim1lpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_tim1lpen = wdata[9:9];
  assign rcc_c1_tim1_lpen              = cur_rcc_c1_apb3lpenr_tim1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3lpenr_tim1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3lpenr_tim1lpen_en),
      .din  (nxt_rcc_c1_apb3lpenr_tim1lpen),
      .dout (cur_rcc_c1_apb3lpenr_tim1lpen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 tim2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_tim2lpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_tim2lpen = wdata[8:8];
  assign rcc_c1_tim2_lpen              = cur_rcc_c1_apb3lpenr_tim2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3lpenr_tim2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3lpenr_tim2lpen_en),
      .din  (nxt_rcc_c1_apb3lpenr_tim2lpen),
      .dout (cur_rcc_c1_apb3lpenr_tim2lpen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 adcclpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_adcclpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_adcclpen = wdata[7:7];
  assign rcc_c1_adcc_lpen              = cur_rcc_c1_apb3lpenr_adcclpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3lpenr_adcclpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3lpenr_adcclpen_en),
      .din  (nxt_rcc_c1_apb3lpenr_adcclpen),
      .dout (cur_rcc_c1_apb3lpenr_adcclpen)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 gpio6lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_gpio6lpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_gpio6lpen = wdata[6:6];
  assign rcc_c1_gpio6_lpen              = cur_rcc_c1_apb3lpenr_gpio6lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3lpenr_gpio6lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3lpenr_gpio6lpen_en),
      .din  (nxt_rcc_c1_apb3lpenr_gpio6lpen),
      .dout (cur_rcc_c1_apb3lpenr_gpio6lpen)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 gpio7lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_gpio7lpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_gpio7lpen = wdata[5:5];
  assign rcc_c1_gpio7_lpen              = cur_rcc_c1_apb3lpenr_gpio7lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3lpenr_gpio7lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3lpenr_gpio7lpen_en),
      .din  (nxt_rcc_c1_apb3lpenr_gpio7lpen),
      .dout (cur_rcc_c1_apb3lpenr_gpio7lpen)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 gpio8lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_gpio8lpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_gpio8lpen = wdata[4:4];
  assign rcc_c1_gpio8_lpen              = cur_rcc_c1_apb3lpenr_gpio8lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3lpenr_gpio8lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3lpenr_gpio8lpen_en),
      .din  (nxt_rcc_c1_apb3lpenr_gpio8lpen),
      .dout (cur_rcc_c1_apb3lpenr_gpio8lpen)
  );

  // --------------------------------------------------------------------------------
  // rcc_c2_ahb1enr                          0xbc                                    
  // --------------------------------------------------------------------------------
  // 18:18               romen               RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 17:17               tsmsen              RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 16:16               smsen               RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               xflashen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               fften               RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               npuen               RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               dma1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               dma2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               dmaschen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 qspi1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 qspi2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 qspi3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 qspi4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 xspien              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 mspien              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 hacif_l1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 hacif_f1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 macen               RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 0:0                 lzen                RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c2_ahb1enr read data
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_read = {
    {13{1'b0}},
    cur_rcc_c2_ahb1enr_romen,
    cur_rcc_c2_ahb1enr_tsmsen,
    cur_rcc_c2_ahb1enr_smsen,
    cur_rcc_c2_ahb1enr_xflashen,
    cur_rcc_c2_ahb1enr_fften,
    cur_rcc_c2_ahb1enr_npuen,
    cur_rcc_c2_ahb1enr_dma1en,
    cur_rcc_c2_ahb1enr_dma2en,
    cur_rcc_c2_ahb1enr_dmaschen,
    cur_rcc_c2_ahb1enr_qspi1en,
    cur_rcc_c2_ahb1enr_qspi2en,
    cur_rcc_c2_ahb1enr_qspi3en,
    cur_rcc_c2_ahb1enr_qspi4en,
    cur_rcc_c2_ahb1enr_xspien,
    cur_rcc_c2_ahb1enr_mspien,
    cur_rcc_c2_ahb1enr_hacif_l1en,
    cur_rcc_c2_ahb1enr_hacif_f1en,
    cur_rcc_c2_ahb1enr_macen,
    cur_rcc_c2_ahb1enr_lzen
  };

  // --------------------------------------------------------------------------------
  // 18:18               romen               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_romen_en = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_romen = wdata[18:18];
  assign rcc_c2_rom_en = cur_rcc_c2_ahb1enr_romen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c2_ahb1enr_romen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_romen_en),
      .din  (nxt_rcc_c2_ahb1enr_romen),
      .dout (cur_rcc_c2_ahb1enr_romen)
  );

  // --------------------------------------------------------------------------------
  // 17:17               tsmsen              RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_tsmsen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_tsmsen = wdata[17:17];
  assign rcc_c2_tsms_en            = cur_rcc_c2_ahb1enr_tsmsen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c2_ahb1enr_tsmsen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_tsmsen_en),
      .din  (nxt_rcc_c2_ahb1enr_tsmsen),
      .dout (cur_rcc_c2_ahb1enr_tsmsen)
  );

  // --------------------------------------------------------------------------------
  // 16:16               smsen               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_smsen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_smsen = wdata[16:16];
  assign rcc_c2_sms_en            = cur_rcc_c2_ahb1enr_smsen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_smsen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_smsen_en),
      .din  (nxt_rcc_c2_ahb1enr_smsen),
      .dout (cur_rcc_c2_ahb1enr_smsen)
  );

  // --------------------------------------------------------------------------------
  // 15:15               xflashen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_xflashen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_xflashen = wdata[15:15];
  assign rcc_c2_xflash_en            = cur_rcc_c2_ahb1enr_xflashen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_xflashen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_xflashen_en),
      .din  (nxt_rcc_c2_ahb1enr_xflashen),
      .dout (cur_rcc_c2_ahb1enr_xflashen)
  );

  // --------------------------------------------------------------------------------
  // 14:14               fften               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_fften_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_fften = wdata[14:14];
  assign rcc_c2_fft_en            = cur_rcc_c2_ahb1enr_fften;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_fften (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_fften_en),
      .din  (nxt_rcc_c2_ahb1enr_fften),
      .dout (cur_rcc_c2_ahb1enr_fften)
  );

  // --------------------------------------------------------------------------------
  // 13:13               npuen               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_npuen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_npuen = wdata[13:13];
  assign rcc_c2_npu_en            = cur_rcc_c2_ahb1enr_npuen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_npuen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_npuen_en),
      .din  (nxt_rcc_c2_ahb1enr_npuen),
      .dout (cur_rcc_c2_ahb1enr_npuen)
  );

  // --------------------------------------------------------------------------------
  // 12:12               dma1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_dma1en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_dma1en = wdata[12:12];
  assign rcc_c2_dma1_en            = cur_rcc_c2_ahb1enr_dma1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_dma1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_dma1en_en),
      .din  (nxt_rcc_c2_ahb1enr_dma1en),
      .dout (cur_rcc_c2_ahb1enr_dma1en)
  );

  // --------------------------------------------------------------------------------
  // 11:11               dma2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_dma2en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_dma2en = wdata[11:11];
  assign rcc_c2_dma2_en            = cur_rcc_c2_ahb1enr_dma2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_dma2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_dma2en_en),
      .din  (nxt_rcc_c2_ahb1enr_dma2en),
      .dout (cur_rcc_c2_ahb1enr_dma2en)
  );

  // --------------------------------------------------------------------------------
  // 10:10               dmaschen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_dmaschen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_dmaschen = wdata[10:10];
  assign rcc_c2_dmasch_en            = cur_rcc_c2_ahb1enr_dmaschen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_dmaschen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_dmaschen_en),
      .din  (nxt_rcc_c2_ahb1enr_dmaschen),
      .dout (cur_rcc_c2_ahb1enr_dmaschen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 qspi1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_qspi1en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_qspi1en = wdata[9:9];
  assign rcc_c2_qspi1_en            = cur_rcc_c2_ahb1enr_qspi1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_qspi1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_qspi1en_en),
      .din  (nxt_rcc_c2_ahb1enr_qspi1en),
      .dout (cur_rcc_c2_ahb1enr_qspi1en)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 qspi2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_qspi2en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_qspi2en = wdata[8:8];
  assign rcc_c2_qspi2_en            = cur_rcc_c2_ahb1enr_qspi2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_qspi2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_qspi2en_en),
      .din  (nxt_rcc_c2_ahb1enr_qspi2en),
      .dout (cur_rcc_c2_ahb1enr_qspi2en)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 qspi3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_qspi3en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_qspi3en = wdata[7:7];
  assign rcc_c2_qspi3_en            = cur_rcc_c2_ahb1enr_qspi3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_qspi3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_qspi3en_en),
      .din  (nxt_rcc_c2_ahb1enr_qspi3en),
      .dout (cur_rcc_c2_ahb1enr_qspi3en)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 qspi4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_qspi4en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_qspi4en = wdata[6:6];
  assign rcc_c2_qspi4_en            = cur_rcc_c2_ahb1enr_qspi4en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_qspi4en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_qspi4en_en),
      .din  (nxt_rcc_c2_ahb1enr_qspi4en),
      .dout (cur_rcc_c2_ahb1enr_qspi4en)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 xspien              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_xspien_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_xspien = wdata[5:5];
  assign rcc_c2_xspi_en            = cur_rcc_c2_ahb1enr_xspien;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_xspien (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_xspien_en),
      .din  (nxt_rcc_c2_ahb1enr_xspien),
      .dout (cur_rcc_c2_ahb1enr_xspien)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 mspien              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_mspien_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_mspien = wdata[4:4];
  assign rcc_c2_mspi_en            = cur_rcc_c2_ahb1enr_mspien;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_mspien (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_mspien_en),
      .din  (nxt_rcc_c2_ahb1enr_mspien),
      .dout (cur_rcc_c2_ahb1enr_mspien)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 hacif_l1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_hacif_l1en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_hacif_l1en = wdata[3:3];
  assign rcc_c2_hacif_l1_en            = cur_rcc_c2_ahb1enr_hacif_l1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_hacif_l1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_hacif_l1en_en),
      .din  (nxt_rcc_c2_ahb1enr_hacif_l1en),
      .dout (cur_rcc_c2_ahb1enr_hacif_l1en)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 hacif_f1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_hacif_f1en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_hacif_f1en = wdata[2:2];
  assign rcc_c2_hacif_f1_en            = cur_rcc_c2_ahb1enr_hacif_f1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_hacif_f1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_hacif_f1en_en),
      .din  (nxt_rcc_c2_ahb1enr_hacif_f1en),
      .dout (cur_rcc_c2_ahb1enr_hacif_f1en)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 macen               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_macen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_macen = wdata[1:1];
  assign rcc_c2_mac_en            = cur_rcc_c2_ahb1enr_macen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c2_ahb1enr_macen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_macen_en),
      .din  (nxt_rcc_c2_ahb1enr_macen),
      .dout (cur_rcc_c2_ahb1enr_macen)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 lzen                RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_lzen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_lzen = wdata[0:0];
  assign rcc_c2_lz_en            = cur_rcc_c2_ahb1enr_lzen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_lzen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_lzen_en),
      .din  (nxt_rcc_c2_ahb1enr_lzen),
      .dout (cur_rcc_c2_ahb1enr_lzen)
  );


  // --------------------------------------------------------------------------------
  // rcc_c2_apb1enr                          0xc0                                    
  // --------------------------------------------------------------------------------
  // 17:17               gtim1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 16:16               gtim2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               gtim3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               gtim4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spi1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               spi2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               spi3en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               uart1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 uart2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 uart3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 uart4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 i2c2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 gpio3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 can1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 can2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 can3en              RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c2_apb1enr read data
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_read = {
    {14{1'b0}},
    cur_rcc_c2_apb1enr_gtim1en,
    cur_rcc_c2_apb1enr_gtim2en,
    cur_rcc_c2_apb1enr_gtim3en,
    cur_rcc_c2_apb1enr_gtim4en,
    cur_rcc_c2_apb1enr_spi1en,
    cur_rcc_c2_apb1enr_spi2en,
    cur_rcc_c2_apb1enr_spi3en,
    cur_rcc_c2_apb1enr_uart1en,
    cur_rcc_c2_apb1enr_uart2en,
    cur_rcc_c2_apb1enr_uart3en,
    cur_rcc_c2_apb1enr_uart4en,
    cur_rcc_c2_apb1enr_i2c2en,
    cur_rcc_c2_apb1enr_gpio1en,
    cur_rcc_c2_apb1enr_gpio2en,
    cur_rcc_c2_apb1enr_gpio3en,
    cur_rcc_c2_apb1enr_can1en,
    cur_rcc_c2_apb1enr_can2en,
    cur_rcc_c2_apb1enr_can3en
  };

  // --------------------------------------------------------------------------------
  // 17:17               gtim1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_gtim1en_en = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_gtim1en = wdata[17:17];
  assign rcc_c2_gtim1_en = cur_rcc_c2_apb1enr_gtim1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_gtim1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_gtim1en_en),
      .din  (nxt_rcc_c2_apb1enr_gtim1en),
      .dout (cur_rcc_c2_apb1enr_gtim1en)
  );

  // --------------------------------------------------------------------------------
  // 16:16               gtim2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_gtim2en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_gtim2en = wdata[16:16];
  assign rcc_c2_gtim2_en            = cur_rcc_c2_apb1enr_gtim2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_gtim2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_gtim2en_en),
      .din  (nxt_rcc_c2_apb1enr_gtim2en),
      .dout (cur_rcc_c2_apb1enr_gtim2en)
  );

  // --------------------------------------------------------------------------------
  // 15:15               gtim3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_gtim3en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_gtim3en = wdata[15:15];
  assign rcc_c2_gtim3_en            = cur_rcc_c2_apb1enr_gtim3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_gtim3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_gtim3en_en),
      .din  (nxt_rcc_c2_apb1enr_gtim3en),
      .dout (cur_rcc_c2_apb1enr_gtim3en)
  );

  // --------------------------------------------------------------------------------
  // 14:14               gtim4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_gtim4en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_gtim4en = wdata[14:14];
  assign rcc_c2_gtim4_en            = cur_rcc_c2_apb1enr_gtim4en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_gtim4en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_gtim4en_en),
      .din  (nxt_rcc_c2_apb1enr_gtim4en),
      .dout (cur_rcc_c2_apb1enr_gtim4en)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spi1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_spi1en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_spi1en = wdata[13:13];
  assign rcc_c2_spi1_en            = cur_rcc_c2_apb1enr_spi1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_spi1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_spi1en_en),
      .din  (nxt_rcc_c2_apb1enr_spi1en),
      .dout (cur_rcc_c2_apb1enr_spi1en)
  );

  // --------------------------------------------------------------------------------
  // 12:12               spi2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_spi2en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_spi2en = wdata[12:12];
  assign rcc_c2_spi2_en            = cur_rcc_c2_apb1enr_spi2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_spi2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_spi2en_en),
      .din  (nxt_rcc_c2_apb1enr_spi2en),
      .dout (cur_rcc_c2_apb1enr_spi2en)
  );

  // --------------------------------------------------------------------------------
  // 11:11               spi3en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_spi3en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_spi3en = wdata[11:11];
  assign rcc_c2_spi3_en            = cur_rcc_c2_apb1enr_spi3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_spi3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_spi3en_en),
      .din  (nxt_rcc_c2_apb1enr_spi3en),
      .dout (cur_rcc_c2_apb1enr_spi3en)
  );

  // --------------------------------------------------------------------------------
  // 10:10               uart1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_uart1en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_uart1en = wdata[10:10];
  assign rcc_c2_uart1_en            = cur_rcc_c2_apb1enr_uart1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_uart1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_uart1en_en),
      .din  (nxt_rcc_c2_apb1enr_uart1en),
      .dout (cur_rcc_c2_apb1enr_uart1en)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 uart2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_uart2en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_uart2en = wdata[9:9];
  assign rcc_c2_uart2_en            = cur_rcc_c2_apb1enr_uart2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_uart2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_uart2en_en),
      .din  (nxt_rcc_c2_apb1enr_uart2en),
      .dout (cur_rcc_c2_apb1enr_uart2en)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 uart3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_uart3en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_uart3en = wdata[8:8];
  assign rcc_c2_uart3_en            = cur_rcc_c2_apb1enr_uart3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_uart3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_uart3en_en),
      .din  (nxt_rcc_c2_apb1enr_uart3en),
      .dout (cur_rcc_c2_apb1enr_uart3en)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 uart4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_uart4en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_uart4en = wdata[7:7];
  assign rcc_c2_uart4_en            = cur_rcc_c2_apb1enr_uart4en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_uart4en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_uart4en_en),
      .din  (nxt_rcc_c2_apb1enr_uart4en),
      .dout (cur_rcc_c2_apb1enr_uart4en)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 i2c2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_i2c2en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_i2c2en = wdata[6:6];
  assign rcc_c2_i2c2_en            = cur_rcc_c2_apb1enr_i2c2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_i2c2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_i2c2en_en),
      .din  (nxt_rcc_c2_apb1enr_i2c2en),
      .dout (cur_rcc_c2_apb1enr_i2c2en)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 gpio1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_gpio1en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_gpio1en = wdata[5:5];
  assign rcc_c2_gpio1_en            = cur_rcc_c2_apb1enr_gpio1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_gpio1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_gpio1en_en),
      .din  (nxt_rcc_c2_apb1enr_gpio1en),
      .dout (cur_rcc_c2_apb1enr_gpio1en)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 gpio2en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_gpio2en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_gpio2en = wdata[4:4];
  assign rcc_c2_gpio2_en            = cur_rcc_c2_apb1enr_gpio2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_gpio2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_gpio2en_en),
      .din  (nxt_rcc_c2_apb1enr_gpio2en),
      .dout (cur_rcc_c2_apb1enr_gpio2en)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 gpio3en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_gpio3en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_gpio3en = wdata[3:3];
  assign rcc_c2_gpio3_en            = cur_rcc_c2_apb1enr_gpio3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_gpio3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_gpio3en_en),
      .din  (nxt_rcc_c2_apb1enr_gpio3en),
      .dout (cur_rcc_c2_apb1enr_gpio3en)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 can1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_can1en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_can1en = wdata[2:2];
  assign rcc_c2_can1_en            = cur_rcc_c2_apb1enr_can1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_can1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_can1en_en),
      .din  (nxt_rcc_c2_apb1enr_can1en),
      .dout (cur_rcc_c2_apb1enr_can1en)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 can2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_can2en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_can2en = wdata[1:1];
  assign rcc_c2_can2_en            = cur_rcc_c2_apb1enr_can2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_can2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_can2en_en),
      .din  (nxt_rcc_c2_apb1enr_can2en),
      .dout (cur_rcc_c2_apb1enr_can2en)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 can3en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_can3en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_can3en = wdata[0:0];
  assign rcc_c2_can3_en            = cur_rcc_c2_apb1enr_can3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_can3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_can3en_en),
      .din  (nxt_rcc_c2_apb1enr_can3en),
      .dout (cur_rcc_c2_apb1enr_can3en)
  );


  // --------------------------------------------------------------------------------
  // rcc_c2_apb2enr                          0xc4                                    
  // --------------------------------------------------------------------------------
  // 15:15               gtim5en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               gtim6en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spi4en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               spi5en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               uart5en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               uart6en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 uart7en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 uart8en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 i2c2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 i2c3en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 can4en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 can5en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 can6en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 mppten          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 gpio4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 gpio5en             RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c2_apb2enr read data
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_read = {
    {16{1'b0}},
    cur_rcc_c2_apb2enr_gtim5en,
    cur_rcc_c2_apb2enr_gtim6en,
    cur_rcc_c2_apb2enr_spi4en,
    cur_rcc_c2_apb2enr_spi5en,
    cur_rcc_c2_apb2enr_uart5en,
    cur_rcc_c2_apb2enr_uart6en,
    cur_rcc_c2_apb2enr_uart7en,
    cur_rcc_c2_apb2enr_uart8en,
    cur_rcc_c2_apb2enr_i2c2en,
    cur_rcc_c2_apb2enr_i2c3en,
    cur_rcc_c2_apb2enr_can4en,
    cur_rcc_c2_apb2enr_can5en,
    cur_rcc_c2_apb2enr_can6en,
    cur_rcc_c2_apb2enr_mppten,
    cur_rcc_c2_apb2enr_gpio4en,
    cur_rcc_c2_apb2enr_gpio5en
  };

  // --------------------------------------------------------------------------------
  // 15:15               gtim5en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_gtim5en_en = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_gtim5en = wdata[15:15];
  assign rcc_c2_gtim5_en = cur_rcc_c2_apb2enr_gtim5en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_gtim5en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_gtim5en_en),
      .din  (nxt_rcc_c2_apb2enr_gtim5en),
      .dout (cur_rcc_c2_apb2enr_gtim5en)
  );

  // --------------------------------------------------------------------------------
  // 14:14               gtim6en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_gtim6en_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_gtim6en = wdata[14:14];
  assign rcc_c2_gtim6_en            = cur_rcc_c2_apb2enr_gtim6en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_gtim6en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_gtim6en_en),
      .din  (nxt_rcc_c2_apb2enr_gtim6en),
      .dout (cur_rcc_c2_apb2enr_gtim6en)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spi4en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_spi4en_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_spi4en = wdata[13:13];
  assign rcc_c2_spi4_en            = cur_rcc_c2_apb2enr_spi4en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_spi4en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_spi4en_en),
      .din  (nxt_rcc_c2_apb2enr_spi4en),
      .dout (cur_rcc_c2_apb2enr_spi4en)
  );

  // --------------------------------------------------------------------------------
  // 12:12               spi5en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_spi5en_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_spi5en = wdata[12:12];
  assign rcc_c2_spi5_en            = cur_rcc_c2_apb2enr_spi5en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_spi5en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_spi5en_en),
      .din  (nxt_rcc_c2_apb2enr_spi5en),
      .dout (cur_rcc_c2_apb2enr_spi5en)
  );

  // --------------------------------------------------------------------------------
  // 11:11               uart5en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_uart5en_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_uart5en = wdata[11:11];
  assign rcc_c2_uart5_en            = cur_rcc_c2_apb2enr_uart5en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_uart5en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_uart5en_en),
      .din  (nxt_rcc_c2_apb2enr_uart5en),
      .dout (cur_rcc_c2_apb2enr_uart5en)
  );

  // --------------------------------------------------------------------------------
  // 10:10               uart6en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_uart6en_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_uart6en = wdata[10:10];
  assign rcc_c2_uart6_en            = cur_rcc_c2_apb2enr_uart6en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_uart6en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_uart6en_en),
      .din  (nxt_rcc_c2_apb2enr_uart6en),
      .dout (cur_rcc_c2_apb2enr_uart6en)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 uart7en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_uart7en_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_uart7en = wdata[9:9];
  assign rcc_c2_uart7_en            = cur_rcc_c2_apb2enr_uart7en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_uart7en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_uart7en_en),
      .din  (nxt_rcc_c2_apb2enr_uart7en),
      .dout (cur_rcc_c2_apb2enr_uart7en)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 uart8en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_uart8en_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_uart8en = wdata[8:8];
  assign rcc_c2_uart8_en            = cur_rcc_c2_apb2enr_uart8en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_uart8en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_uart8en_en),
      .din  (nxt_rcc_c2_apb2enr_uart8en),
      .dout (cur_rcc_c2_apb2enr_uart8en)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 i2c2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_i2c2en_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_i2c2en = wdata[7:7];
  assign rcc_c2_i2c2_en            = cur_rcc_c2_apb2enr_i2c2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_i2c2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_i2c2en_en),
      .din  (nxt_rcc_c2_apb2enr_i2c2en),
      .dout (cur_rcc_c2_apb2enr_i2c2en)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 i2c3en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_i2c3en_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_i2c3en = wdata[6:6];
  assign rcc_c2_i2c3_en            = cur_rcc_c2_apb2enr_i2c3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_i2c3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_i2c3en_en),
      .din  (nxt_rcc_c2_apb2enr_i2c3en),
      .dout (cur_rcc_c2_apb2enr_i2c3en)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 can4en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_can4en_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_can4en = wdata[5:5];
  assign rcc_c2_can4_en            = cur_rcc_c2_apb2enr_can4en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_can4en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_can4en_en),
      .din  (nxt_rcc_c2_apb2enr_can4en),
      .dout (cur_rcc_c2_apb2enr_can4en)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 can5en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_can5en_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_can5en = wdata[4:4];
  assign rcc_c2_can5_en            = cur_rcc_c2_apb2enr_can5en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_can5en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_can5en_en),
      .din  (nxt_rcc_c2_apb2enr_can5en),
      .dout (cur_rcc_c2_apb2enr_can5en)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 can6en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_can6en_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_can6en = wdata[3:3];
  assign rcc_c2_can6_en            = cur_rcc_c2_apb2enr_can6en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_can6en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_can6en_en),
      .din  (nxt_rcc_c2_apb2enr_can6en),
      .dout (cur_rcc_c2_apb2enr_can6en)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 mppten          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_mppten_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_mppten = wdata[2:2];
  assign rcc_c2_mppt_en            = cur_rcc_c2_apb2enr_mppten;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_mppten (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_mppten_en),
      .din  (nxt_rcc_c2_apb2enr_mppten),
      .dout (cur_rcc_c2_apb2enr_mppten)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 gpio4en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_gpio4en_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_gpio4en = wdata[1:1];
  assign rcc_c2_gpio4_en            = cur_rcc_c2_apb2enr_gpio4en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_gpio4en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_gpio4en_en),
      .din  (nxt_rcc_c2_apb2enr_gpio4en),
      .dout (cur_rcc_c2_apb2enr_gpio4en)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 gpio5en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2enr_gpio5en_en  = (|wr_req & rcc_c2_apb2enr_sel);
  assign nxt_rcc_c2_apb2enr_gpio5en = wdata[0:0];
  assign rcc_c2_gpio5_en            = cur_rcc_c2_apb2enr_gpio5en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2enr_gpio5en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2enr_gpio5en_en),
      .din  (nxt_rcc_c2_apb2enr_gpio5en),
      .dout (cur_rcc_c2_apb2enr_gpio5en)
  );


  // --------------------------------------------------------------------------------
  // rcc_c2_apb3enr                          0xc8                                    
  // --------------------------------------------------------------------------------
  // 11:11               sysctlen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               wwdten              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 tim1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 tim2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 adccen              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 gpio6en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio7en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio8en             RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c2_apb3enr read data
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_read         = {{20{1'b0}}, cur_rcc_c2_apb3enr_sysctlen, cur_rcc_c2_apb3enr_wwdten, cur_rcc_c2_apb3enr_tim1en, cur_rcc_c2_apb3enr_tim2en, cur_rcc_c2_apb3enr_adccen, cur_rcc_c2_apb3enr_gpio6en, cur_rcc_c2_apb3enr_gpio7en, cur_rcc_c2_apb3enr_gpio8en, {4{1'b0}}};

  // --------------------------------------------------------------------------------
  // 11:11               sysctlen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_sysctlen_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_sysctlen = wdata[11:11];
  assign rcc_c2_sysctl_en            = cur_rcc_c2_apb3enr_sysctlen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3enr_sysctlen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3enr_sysctlen_en),
      .din  (nxt_rcc_c2_apb3enr_sysctlen),
      .dout (cur_rcc_c2_apb3enr_sysctlen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               wwdten              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_wwdten_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_wwdten = wdata[10:10];
  assign rcc_c2_wwdt_en            = cur_rcc_c2_apb3enr_wwdten;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3enr_wwdten (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3enr_wwdten_en),
      .din  (nxt_rcc_c2_apb3enr_wwdten),
      .dout (cur_rcc_c2_apb3enr_wwdten)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 tim1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_tim1en_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_tim1en = wdata[9:9];
  assign rcc_c2_tim1_en            = cur_rcc_c2_apb3enr_tim1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3enr_tim1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3enr_tim1en_en),
      .din  (nxt_rcc_c2_apb3enr_tim1en),
      .dout (cur_rcc_c2_apb3enr_tim1en)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 tim2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_tim2en_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_tim2en = wdata[8:8];
  assign rcc_c2_tim2_en            = cur_rcc_c2_apb3enr_tim2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3enr_tim2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3enr_tim2en_en),
      .din  (nxt_rcc_c2_apb3enr_tim2en),
      .dout (cur_rcc_c2_apb3enr_tim2en)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 adccen              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_adccen_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_adccen = wdata[7:7];
  assign rcc_c2_adcc_en            = cur_rcc_c2_apb3enr_adccen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3enr_adccen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3enr_adccen_en),
      .din  (nxt_rcc_c2_apb3enr_adccen),
      .dout (cur_rcc_c2_apb3enr_adccen)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 gpio6en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_gpio6en_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_gpio6en = wdata[6:6];
  assign rcc_c2_gpio6_en            = cur_rcc_c2_apb3enr_gpio6en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3enr_gpio6en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3enr_gpio6en_en),
      .din  (nxt_rcc_c2_apb3enr_gpio6en),
      .dout (cur_rcc_c2_apb3enr_gpio6en)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 gpio7en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_gpio7en_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_gpio7en = wdata[5:5];
  assign rcc_c2_gpio7_en            = cur_rcc_c2_apb3enr_gpio7en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3enr_gpio7en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3enr_gpio7en_en),
      .din  (nxt_rcc_c2_apb3enr_gpio7en),
      .dout (cur_rcc_c2_apb3enr_gpio7en)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 gpio8en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_gpio8en_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_gpio8en = wdata[4:4];
  assign rcc_c2_gpio8_en            = cur_rcc_c2_apb3enr_gpio8en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3enr_gpio8en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3enr_gpio8en_en),
      .din  (nxt_rcc_c2_apb3enr_gpio8en),
      .dout (cur_rcc_c2_apb3enr_gpio8en)
  );


  // --------------------------------------------------------------------------------
  // rcc_c2_ahb1lpenr                        0xcc                                    
  // --------------------------------------------------------------------------------
  // 18:18               romlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 17:17               tsmslpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 16:16               smslpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               xflashlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               fftlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               npulpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               dma1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               dma2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               dmaschlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 qspi1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 qspi2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 qspi3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 qspi4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 xspilpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 mspilpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 hacif_l1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 hacif_f1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 maclpen             RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 0:0                 lzlpen              RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c2_ahb1lpenr read data
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_read = {
    {13{1'b0}},
    cur_rcc_c2_ahb1lpenr_romlpen,
    cur_rcc_c2_ahb1lpenr_tsmslpen,
    cur_rcc_c2_ahb1lpenr_smslpen,
    cur_rcc_c2_ahb1lpenr_xflashlpen,
    cur_rcc_c2_ahb1lpenr_fftlpen,
    cur_rcc_c2_ahb1lpenr_npulpen,
    cur_rcc_c2_ahb1lpenr_dma1lpen,
    cur_rcc_c2_ahb1lpenr_dma2lpen,
    cur_rcc_c2_ahb1lpenr_dmaschlpen,
    cur_rcc_c2_ahb1lpenr_qspi1lpen,
    cur_rcc_c2_ahb1lpenr_qspi2lpen,
    cur_rcc_c2_ahb1lpenr_qspi3lpen,
    cur_rcc_c2_ahb1lpenr_qspi4lpen,
    cur_rcc_c2_ahb1lpenr_xspilpen,
    cur_rcc_c2_ahb1lpenr_mspilpen,
    cur_rcc_c2_ahb1lpenr_hacif_l1lpen,
    cur_rcc_c2_ahb1lpenr_hacif_f1lpen,
    cur_rcc_c2_ahb1lpenr_maclpen,
    cur_rcc_c2_ahb1lpenr_lzlpen
  };

  // --------------------------------------------------------------------------------
  // 18:18               romlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_romlpen_en = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_romlpen = wdata[18:18];
  assign rcc_c2_rom_lpen = cur_rcc_c2_ahb1lpenr_romlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_romlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_romlpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_romlpen),
      .dout (cur_rcc_c2_ahb1lpenr_romlpen)
  );

  // --------------------------------------------------------------------------------
  // 17:17               tsmslpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_tsmslpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_tsmslpen = wdata[17:17];
  assign rcc_c2_tsms_lpen              = cur_rcc_c2_ahb1lpenr_tsmslpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_tsmslpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_tsmslpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_tsmslpen),
      .dout (cur_rcc_c2_ahb1lpenr_tsmslpen)
  );

  // --------------------------------------------------------------------------------
  // 16:16               smslpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_smslpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_smslpen = wdata[16:16];
  assign rcc_c2_sms_lpen              = cur_rcc_c2_ahb1lpenr_smslpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_smslpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_smslpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_smslpen),
      .dout (cur_rcc_c2_ahb1lpenr_smslpen)
  );

  // --------------------------------------------------------------------------------
  // 15:15               xflashlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_xflashlpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_xflashlpen = wdata[15:15];
  assign rcc_c2_xflash_lpen              = cur_rcc_c2_ahb1lpenr_xflashlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_xflashlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_xflashlpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_xflashlpen),
      .dout (cur_rcc_c2_ahb1lpenr_xflashlpen)
  );

  // --------------------------------------------------------------------------------
  // 14:14               fftlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_fftlpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_fftlpen = wdata[14:14];
  assign rcc_c2_fft_lpen              = cur_rcc_c2_ahb1lpenr_fftlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_fftlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_fftlpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_fftlpen),
      .dout (cur_rcc_c2_ahb1lpenr_fftlpen)
  );

  // --------------------------------------------------------------------------------
  // 13:13               npulpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_npulpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_npulpen = wdata[13:13];
  assign rcc_c2_npu_lpen              = cur_rcc_c2_ahb1lpenr_npulpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_npulpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_npulpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_npulpen),
      .dout (cur_rcc_c2_ahb1lpenr_npulpen)
  );

  // --------------------------------------------------------------------------------
  // 12:12               dma1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_dma1lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_dma1lpen = wdata[12:12];
  assign rcc_c2_dma1_lpen              = cur_rcc_c2_ahb1lpenr_dma1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_dma1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_dma1lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_dma1lpen),
      .dout (cur_rcc_c2_ahb1lpenr_dma1lpen)
  );

  // --------------------------------------------------------------------------------
  // 11:11               dma2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_dma2lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_dma2lpen = wdata[11:11];
  assign rcc_c2_dma2_lpen              = cur_rcc_c2_ahb1lpenr_dma2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_dma2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_dma2lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_dma2lpen),
      .dout (cur_rcc_c2_ahb1lpenr_dma2lpen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               dmaschlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_dmaschlpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_dmaschlpen = wdata[10:10];
  assign rcc_c2_dmasch_lpen              = cur_rcc_c2_ahb1lpenr_dmaschlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_dmaschlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_dmaschlpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_dmaschlpen),
      .dout (cur_rcc_c2_ahb1lpenr_dmaschlpen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 qspi1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_qspi1lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_qspi1lpen = wdata[9:9];
  assign rcc_c2_qspi1_lpen              = cur_rcc_c2_ahb1lpenr_qspi1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_qspi1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_qspi1lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_qspi1lpen),
      .dout (cur_rcc_c2_ahb1lpenr_qspi1lpen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 qspi2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_qspi2lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_qspi2lpen = wdata[8:8];
  assign rcc_c2_qspi2_lpen              = cur_rcc_c2_ahb1lpenr_qspi2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_qspi2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_qspi2lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_qspi2lpen),
      .dout (cur_rcc_c2_ahb1lpenr_qspi2lpen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 qspi3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_qspi3lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_qspi3lpen = wdata[7:7];
  assign rcc_c2_qspi3_lpen              = cur_rcc_c2_ahb1lpenr_qspi3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_qspi3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_qspi3lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_qspi3lpen),
      .dout (cur_rcc_c2_ahb1lpenr_qspi3lpen)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 qspi4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_qspi4lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_qspi4lpen = wdata[6:6];
  assign rcc_c2_qspi4_lpen              = cur_rcc_c2_ahb1lpenr_qspi4lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_qspi4lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_qspi4lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_qspi4lpen),
      .dout (cur_rcc_c2_ahb1lpenr_qspi4lpen)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 xspilpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_xspilpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_xspilpen = wdata[5:5];
  assign rcc_c2_xspi_lpen              = cur_rcc_c2_ahb1lpenr_xspilpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_xspilpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_xspilpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_xspilpen),
      .dout (cur_rcc_c2_ahb1lpenr_xspilpen)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 mspilpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_mspilpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_mspilpen = wdata[4:4];
  assign rcc_c2_mspi_lpen              = cur_rcc_c2_ahb1lpenr_mspilpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_mspilpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_mspilpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_mspilpen),
      .dout (cur_rcc_c2_ahb1lpenr_mspilpen)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 hacif_l1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_hacif_l1lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_hacif_l1lpen = wdata[3:3];
  assign rcc_c2_hacif_l1_lpen              = cur_rcc_c2_ahb1lpenr_hacif_l1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_hacif_l1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_hacif_l1lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_hacif_l1lpen),
      .dout (cur_rcc_c2_ahb1lpenr_hacif_l1lpen)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 hacif_f1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_hacif_f1lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_hacif_f1lpen = wdata[2:2];
  assign rcc_c2_hacif_f1_lpen              = cur_rcc_c2_ahb1lpenr_hacif_f1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_hacif_f1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_hacif_f1lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_hacif_f1lpen),
      .dout (cur_rcc_c2_ahb1lpenr_hacif_f1lpen)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 maclpen             RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_maclpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_maclpen = wdata[1:1];
  assign rcc_c2_mac_lpen              = cur_rcc_c2_ahb1lpenr_maclpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c2_ahb1lpenr_maclpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_maclpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_maclpen),
      .dout (cur_rcc_c2_ahb1lpenr_maclpen)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 lzlpen              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_lzlpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_lzlpen = wdata[0:0];
  assign rcc_c2_lz_lpen              = cur_rcc_c2_ahb1lpenr_lzlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_lzlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_lzlpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_lzlpen),
      .dout (cur_rcc_c2_ahb1lpenr_lzlpen)
  );


  // --------------------------------------------------------------------------------
  // rcc_c2_apb1lpenr                        0xd0                                    
  // --------------------------------------------------------------------------------
  // 17:17               gtim1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 16:16               gtim2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               gtim3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               gtim4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spi1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               spi2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               spi3lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               uart1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 uart2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 uart3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 uart4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 i2c2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 gpio3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 can1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 can2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 can3lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c2_apb1lpenr read data
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_read = {
    {14{1'b0}},
    cur_rcc_c2_apb1lpenr_gtim1lpen,
    cur_rcc_c2_apb1lpenr_gtim2lpen,
    cur_rcc_c2_apb1lpenr_gtim3lpen,
    cur_rcc_c2_apb1lpenr_gtim4lpen,
    cur_rcc_c2_apb1lpenr_spi1lpen,
    cur_rcc_c2_apb1lpenr_spi2lpen,
    cur_rcc_c2_apb1lpenr_spi3lpen,
    cur_rcc_c2_apb1lpenr_uart1lpen,
    cur_rcc_c2_apb1lpenr_uart2lpen,
    cur_rcc_c2_apb1lpenr_uart3lpen,
    cur_rcc_c2_apb1lpenr_uart4lpen,
    cur_rcc_c2_apb1lpenr_i2c2lpen,
    cur_rcc_c2_apb1lpenr_gpio1lpen,
    cur_rcc_c2_apb1lpenr_gpio2lpen,
    cur_rcc_c2_apb1lpenr_gpio3lpen,
    cur_rcc_c2_apb1lpenr_can1lpen,
    cur_rcc_c2_apb1lpenr_can2lpen,
    cur_rcc_c2_apb1lpenr_can3lpen
  };

  // --------------------------------------------------------------------------------
  // 17:17               gtim1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_gtim1lpen_en = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_gtim1lpen = wdata[17:17];
  assign rcc_c2_gtim1_lpen = cur_rcc_c2_apb1lpenr_gtim1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_gtim1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_gtim1lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_gtim1lpen),
      .dout (cur_rcc_c2_apb1lpenr_gtim1lpen)
  );

  // --------------------------------------------------------------------------------
  // 16:16               gtim2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_gtim2lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_gtim2lpen = wdata[16:16];
  assign rcc_c2_gtim2_lpen              = cur_rcc_c2_apb1lpenr_gtim2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_gtim2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_gtim2lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_gtim2lpen),
      .dout (cur_rcc_c2_apb1lpenr_gtim2lpen)
  );

  // --------------------------------------------------------------------------------
  // 15:15               gtim3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_gtim3lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_gtim3lpen = wdata[15:15];
  assign rcc_c2_gtim3_lpen              = cur_rcc_c2_apb1lpenr_gtim3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_gtim3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_gtim3lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_gtim3lpen),
      .dout (cur_rcc_c2_apb1lpenr_gtim3lpen)
  );

  // --------------------------------------------------------------------------------
  // 14:14               gtim4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_gtim4lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_gtim4lpen = wdata[14:14];
  assign rcc_c2_gtim4_lpen              = cur_rcc_c2_apb1lpenr_gtim4lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_gtim4lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_gtim4lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_gtim4lpen),
      .dout (cur_rcc_c2_apb1lpenr_gtim4lpen)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spi1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_spi1lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_spi1lpen = wdata[13:13];
  assign rcc_c2_spi1_lpen              = cur_rcc_c2_apb1lpenr_spi1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_spi1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_spi1lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_spi1lpen),
      .dout (cur_rcc_c2_apb1lpenr_spi1lpen)
  );

  // --------------------------------------------------------------------------------
  // 12:12               spi2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_spi2lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_spi2lpen = wdata[12:12];
  assign rcc_c2_spi2_lpen              = cur_rcc_c2_apb1lpenr_spi2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_spi2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_spi2lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_spi2lpen),
      .dout (cur_rcc_c2_apb1lpenr_spi2lpen)
  );

  // --------------------------------------------------------------------------------
  // 11:11               spi3lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_spi3lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_spi3lpen = wdata[11:11];
  assign rcc_c2_spi3_lpen              = cur_rcc_c2_apb1lpenr_spi3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_spi3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_spi3lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_spi3lpen),
      .dout (cur_rcc_c2_apb1lpenr_spi3lpen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               uart1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_uart1lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_uart1lpen = wdata[10:10];
  assign rcc_c2_uart1_lpen              = cur_rcc_c2_apb1lpenr_uart1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_uart1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_uart1lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_uart1lpen),
      .dout (cur_rcc_c2_apb1lpenr_uart1lpen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 uart2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_uart2lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_uart2lpen = wdata[9:9];
  assign rcc_c2_uart2_lpen              = cur_rcc_c2_apb1lpenr_uart2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_uart2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_uart2lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_uart2lpen),
      .dout (cur_rcc_c2_apb1lpenr_uart2lpen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 uart3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_uart3lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_uart3lpen = wdata[8:8];
  assign rcc_c2_uart3_lpen              = cur_rcc_c2_apb1lpenr_uart3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_uart3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_uart3lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_uart3lpen),
      .dout (cur_rcc_c2_apb1lpenr_uart3lpen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 uart4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_uart4lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_uart4lpen = wdata[7:7];
  assign rcc_c2_uart4_lpen              = cur_rcc_c2_apb1lpenr_uart4lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_uart4lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_uart4lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_uart4lpen),
      .dout (cur_rcc_c2_apb1lpenr_uart4lpen)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 i2c2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_i2c2lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_i2c2lpen = wdata[6:6];
  assign rcc_c2_i2c2_lpen              = cur_rcc_c2_apb1lpenr_i2c2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_i2c2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_i2c2lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_i2c2lpen),
      .dout (cur_rcc_c2_apb1lpenr_i2c2lpen)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 gpio1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_gpio1lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_gpio1lpen = wdata[5:5];
  assign rcc_c2_gpio1_lpen              = cur_rcc_c2_apb1lpenr_gpio1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_gpio1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_gpio1lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_gpio1lpen),
      .dout (cur_rcc_c2_apb1lpenr_gpio1lpen)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 gpio2lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_gpio2lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_gpio2lpen = wdata[4:4];
  assign rcc_c2_gpio2_lpen              = cur_rcc_c2_apb1lpenr_gpio2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_gpio2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_gpio2lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_gpio2lpen),
      .dout (cur_rcc_c2_apb1lpenr_gpio2lpen)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 gpio3lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_gpio3lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_gpio3lpen = wdata[3:3];
  assign rcc_c2_gpio3_lpen              = cur_rcc_c2_apb1lpenr_gpio3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_gpio3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_gpio3lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_gpio3lpen),
      .dout (cur_rcc_c2_apb1lpenr_gpio3lpen)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 can1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_can1lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_can1lpen = wdata[2:2];
  assign rcc_c2_can1_lpen              = cur_rcc_c2_apb1lpenr_can1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_can1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_can1lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_can1lpen),
      .dout (cur_rcc_c2_apb1lpenr_can1lpen)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 can2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_can2lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_can2lpen = wdata[1:1];
  assign rcc_c2_can2_lpen              = cur_rcc_c2_apb1lpenr_can2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_can2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_can2lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_can2lpen),
      .dout (cur_rcc_c2_apb1lpenr_can2lpen)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 can3lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_can3lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_can3lpen = wdata[0:0];
  assign rcc_c2_can3_lpen              = cur_rcc_c2_apb1lpenr_can3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_can3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_can3lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_can3lpen),
      .dout (cur_rcc_c2_apb1lpenr_can3lpen)
  );


  // --------------------------------------------------------------------------------
  // rcc_c2_apb2lpenr                        0xd4                                    
  // --------------------------------------------------------------------------------
  // 15:15               gtim5lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               gtim6lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spi4lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               spi5lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               uart5lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               uart6lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 uart7lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 uart8lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 i2c2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 i2c3lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 can4lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 can5lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 can6lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 mpptlpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 gpio4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 gpio5lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c2_apb2lpenr read data
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_read = {
    {16{1'b0}},
    cur_rcc_c2_apb2lpenr_gtim5lpen,
    cur_rcc_c2_apb2lpenr_gtim6lpen,
    cur_rcc_c2_apb2lpenr_spi4lpen,
    cur_rcc_c2_apb2lpenr_spi5lpen,
    cur_rcc_c2_apb2lpenr_uart5lpen,
    cur_rcc_c2_apb2lpenr_uart6lpen,
    cur_rcc_c2_apb2lpenr_uart7lpen,
    cur_rcc_c2_apb2lpenr_uart8lpen,
    cur_rcc_c2_apb2lpenr_i2c2lpen,
    cur_rcc_c2_apb2lpenr_i2c3lpen,
    cur_rcc_c2_apb2lpenr_can4lpen,
    cur_rcc_c2_apb2lpenr_can5lpen,
    cur_rcc_c2_apb2lpenr_can6lpen,
    cur_rcc_c2_apb2lpenr_mpptlpen,
    cur_rcc_c2_apb2lpenr_gpio4lpen,
    cur_rcc_c2_apb2lpenr_gpio5lpen
  };

  // --------------------------------------------------------------------------------
  // 15:15               gtim5lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_gtim5lpen_en = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_gtim5lpen = wdata[15:15];
  assign rcc_c2_gtim5_lpen = cur_rcc_c2_apb2lpenr_gtim5lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_gtim5lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_gtim5lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_gtim5lpen),
      .dout (cur_rcc_c2_apb2lpenr_gtim5lpen)
  );

  // --------------------------------------------------------------------------------
  // 14:14               gtim6lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_gtim6lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_gtim6lpen = wdata[14:14];
  assign rcc_c2_gtim6_lpen              = cur_rcc_c2_apb2lpenr_gtim6lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_gtim6lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_gtim6lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_gtim6lpen),
      .dout (cur_rcc_c2_apb2lpenr_gtim6lpen)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spi4lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_spi4lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_spi4lpen = wdata[13:13];
  assign rcc_c2_spi4_lpen              = cur_rcc_c2_apb2lpenr_spi4lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_spi4lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_spi4lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_spi4lpen),
      .dout (cur_rcc_c2_apb2lpenr_spi4lpen)
  );

  // --------------------------------------------------------------------------------
  // 12:12               spi5lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_spi5lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_spi5lpen = wdata[12:12];
  assign rcc_c2_spi5_lpen              = cur_rcc_c2_apb2lpenr_spi5lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_spi5lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_spi5lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_spi5lpen),
      .dout (cur_rcc_c2_apb2lpenr_spi5lpen)
  );

  // --------------------------------------------------------------------------------
  // 11:11               uart5lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_uart5lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_uart5lpen = wdata[11:11];
  assign rcc_c2_uart5_lpen              = cur_rcc_c2_apb2lpenr_uart5lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_uart5lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_uart5lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_uart5lpen),
      .dout (cur_rcc_c2_apb2lpenr_uart5lpen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               uart6lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_uart6lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_uart6lpen = wdata[10:10];
  assign rcc_c2_uart6_lpen              = cur_rcc_c2_apb2lpenr_uart6lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_uart6lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_uart6lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_uart6lpen),
      .dout (cur_rcc_c2_apb2lpenr_uart6lpen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 uart7lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_uart7lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_uart7lpen = wdata[9:9];
  assign rcc_c2_uart7_lpen              = cur_rcc_c2_apb2lpenr_uart7lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_uart7lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_uart7lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_uart7lpen),
      .dout (cur_rcc_c2_apb2lpenr_uart7lpen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 uart8lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_uart8lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_uart8lpen = wdata[8:8];
  assign rcc_c2_uart8_lpen              = cur_rcc_c2_apb2lpenr_uart8lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_uart8lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_uart8lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_uart8lpen),
      .dout (cur_rcc_c2_apb2lpenr_uart8lpen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 i2c2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_i2c2lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_i2c2lpen = wdata[7:7];
  assign rcc_c2_i2c2_lpen              = cur_rcc_c2_apb2lpenr_i2c2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_i2c2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_i2c2lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_i2c2lpen),
      .dout (cur_rcc_c2_apb2lpenr_i2c2lpen)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 i2c3lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_i2c3lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_i2c3lpen = wdata[6:6];
  assign rcc_c2_i2c3_lpen              = cur_rcc_c2_apb2lpenr_i2c3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_i2c3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_i2c3lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_i2c3lpen),
      .dout (cur_rcc_c2_apb2lpenr_i2c3lpen)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 can4lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_can4lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_can4lpen = wdata[5:5];
  assign rcc_c2_can4_lpen              = cur_rcc_c2_apb2lpenr_can4lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_can4lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_can4lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_can4lpen),
      .dout (cur_rcc_c2_apb2lpenr_can4lpen)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 can5lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_can5lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_can5lpen = wdata[4:4];
  assign rcc_c2_can5_lpen              = cur_rcc_c2_apb2lpenr_can5lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_can5lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_can5lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_can5lpen),
      .dout (cur_rcc_c2_apb2lpenr_can5lpen)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 can6lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_can6lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_can6lpen = wdata[3:3];
  assign rcc_c2_can6_lpen              = cur_rcc_c2_apb2lpenr_can6lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_can6lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_can6lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_can6lpen),
      .dout (cur_rcc_c2_apb2lpenr_can6lpen)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 mpptlpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_mpptlpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_mpptlpen = wdata[2:2];
  assign rcc_c2_mppt_lpen              = cur_rcc_c2_apb2lpenr_mpptlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_mpptlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_mpptlpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_mpptlpen),
      .dout (cur_rcc_c2_apb2lpenr_mpptlpen)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 gpio4lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_gpio4lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_gpio4lpen = wdata[1:1];
  assign rcc_c2_gpio4_lpen              = cur_rcc_c2_apb2lpenr_gpio4lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_gpio4lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_gpio4lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_gpio4lpen),
      .dout (cur_rcc_c2_apb2lpenr_gpio4lpen)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 gpio5lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb2lpenr_gpio5lpen_en  = (|wr_req & rcc_c2_apb2lpenr_sel);
  assign nxt_rcc_c2_apb2lpenr_gpio5lpen = wdata[0:0];
  assign rcc_c2_gpio5_lpen              = cur_rcc_c2_apb2lpenr_gpio5lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb2lpenr_gpio5lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb2lpenr_gpio5lpen_en),
      .din  (nxt_rcc_c2_apb2lpenr_gpio5lpen),
      .dout (cur_rcc_c2_apb2lpenr_gpio5lpen)
  );


  // --------------------------------------------------------------------------------
  // rcc_c2_apb3lpenr                        0xd8                                    
  // --------------------------------------------------------------------------------
  // 11:11               sysctllpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               wwdtlpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 tim1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 tim2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 adcclpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 gpio6lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio7lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio8lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c2_apb3lpenr read data
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_read = {
    {20{1'b0}}, cur_rcc_c2_apb3lpenr_sysctllpen, cur_rcc_c2_apb3lpenr_wwdtlpen, cur_rcc_c2_apb3lpenr_tim1lpen, cur_rcc_c2_apb3lpenr_tim2lpen, cur_rcc_c2_apb3lpenr_adcclpen, cur_rcc_c2_apb3lpenr_gpio6lpen, cur_rcc_c2_apb3lpenr_gpio7lpen, cur_rcc_c2_apb3lpenr_gpio8lpen, {4{1'b0}}
  };

  // --------------------------------------------------------------------------------
  // 11:11               sysctllpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_sysctllpen_en = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_sysctllpen = wdata[11:11];
  assign rcc_c2_sysctl_lpen = cur_rcc_c2_apb3lpenr_sysctllpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3lpenr_sysctllpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3lpenr_sysctllpen_en),
      .din  (nxt_rcc_c2_apb3lpenr_sysctllpen),
      .dout (cur_rcc_c2_apb3lpenr_sysctllpen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               wwdtlpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_wwdtlpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_wwdtlpen = wdata[10:10];
  assign rcc_c2_wwdt_lpen              = cur_rcc_c2_apb3lpenr_wwdtlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3lpenr_wwdtlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3lpenr_wwdtlpen_en),
      .din  (nxt_rcc_c2_apb3lpenr_wwdtlpen),
      .dout (cur_rcc_c2_apb3lpenr_wwdtlpen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 tim1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_tim1lpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_tim1lpen = wdata[9:9];
  assign rcc_c2_tim1_lpen              = cur_rcc_c2_apb3lpenr_tim1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3lpenr_tim1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3lpenr_tim1lpen_en),
      .din  (nxt_rcc_c2_apb3lpenr_tim1lpen),
      .dout (cur_rcc_c2_apb3lpenr_tim1lpen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 tim2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_tim2lpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_tim2lpen = wdata[8:8];
  assign rcc_c2_tim2_lpen              = cur_rcc_c2_apb3lpenr_tim2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3lpenr_tim2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3lpenr_tim2lpen_en),
      .din  (nxt_rcc_c2_apb3lpenr_tim2lpen),
      .dout (cur_rcc_c2_apb3lpenr_tim2lpen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 adcclpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_adcclpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_adcclpen = wdata[7:7];
  assign rcc_c2_adcc_lpen              = cur_rcc_c2_apb3lpenr_adcclpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3lpenr_adcclpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3lpenr_adcclpen_en),
      .din  (nxt_rcc_c2_apb3lpenr_adcclpen),
      .dout (cur_rcc_c2_apb3lpenr_adcclpen)
  );

  // --------------------------------------------------------------------------------
  // 6:6                 gpio6lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_gpio6lpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_gpio6lpen = wdata[6:6];
  assign rcc_c2_gpio6_lpen              = cur_rcc_c2_apb3lpenr_gpio6lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3lpenr_gpio6lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3lpenr_gpio6lpen_en),
      .din  (nxt_rcc_c2_apb3lpenr_gpio6lpen),
      .dout (cur_rcc_c2_apb3lpenr_gpio6lpen)
  );

  // --------------------------------------------------------------------------------
  // 5:5                 gpio7lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_gpio7lpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_gpio7lpen = wdata[5:5];
  assign rcc_c2_gpio7_lpen              = cur_rcc_c2_apb3lpenr_gpio7lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3lpenr_gpio7lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3lpenr_gpio7lpen_en),
      .din  (nxt_rcc_c2_apb3lpenr_gpio7lpen),
      .dout (cur_rcc_c2_apb3lpenr_gpio7lpen)
  );

  // --------------------------------------------------------------------------------
  // 4:4                 gpio8lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_gpio8lpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_gpio8lpen = wdata[4:4];
  assign rcc_c2_gpio8_lpen              = cur_rcc_c2_apb3lpenr_gpio8lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3lpenr_gpio8lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3lpenr_gpio8lpen_en),
      .din  (nxt_rcc_c2_apb3lpenr_gpio8lpen),
      .dout (cur_rcc_c2_apb3lpenr_gpio8lpen)
  );





  // --------------------------------------------------------------------------------
  // rcc_c1_rsr read data
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_read = {
    cur_rcc_c1_rsr_lpwr2rstf,
    cur_rcc_c1_rsr_lpwr1rstf,
    cur_rcc_c1_rsr_wwdg2rstf,
    cur_rcc_c1_rsr_wwdg1rstf,
    cur_rcc_c1_rsr_iwdg2rstf,
    cur_rcc_c1_rsr_iwdg1rstf,
    cur_rcc_c1_rsr_sft2rstf,
    cur_rcc_c1_rsr_sft1rstf,
    cur_rcc_c1_rsr_porrstf,
    cur_rcc_c1_rsr_pinrstf,
    cur_rcc_c1_rsr_borrstf,
    cur_rcc_c1_rsr_d2rstf,
    cur_rcc_c1_rsr_d1rstf,
    {1{1'b0}},
    cur_rcc_c1_rsr_oblrstf,
    cur_rcc_c1_rsr_rmvf,
    {16{1'b0}}
  };
  assign rcc_c1_rsr_rmvf_en = (wr_req[2] & rcc_c1_rsr_sel);

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1),
      .RST_VAL  ('b0)
  ) u_rcc_c1_rsr_rmvf_en_sync (
      .src_signal(rcc_c1_rsr_rmvf_en),
      .rst_n     (rst_n),
      .clk       (clk),
      .gen_signal(rcc_c1_rsr_rmvf_wren)
  );

  // --------------------------------------------------------------------------------
  // rcc_c2_rsr read data
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_read = {
    cur_rcc_c2_rsr_lpwr2rstf,
    cur_rcc_c2_rsr_lpwr1rstf,
    cur_rcc_c2_rsr_wwdg2rstf,
    cur_rcc_c2_rsr_wwdg1rstf,
    cur_rcc_c2_rsr_iwdg2rstf,
    cur_rcc_c2_rsr_iwdg1rstf,
    cur_rcc_c2_rsr_sft2rstf,
    cur_rcc_c2_rsr_sft1rstf,
    cur_rcc_c2_rsr_porrstf,
    cur_rcc_c2_rsr_pinrstf,
    cur_rcc_c2_rsr_borrstf,
    cur_rcc_c2_rsr_d2rstf,
    cur_rcc_c2_rsr_d1rstf,
    {1{1'b0}},
    cur_rcc_c2_rsr_oblrstf,
    cur_rcc_c2_rsr_rmvf,
    {16{1'b0}}
  };
  assign rcc_c2_rsr_rmvf_en = (wr_req[2] & rcc_c2_rsr_sel);

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1),
      .RST_VAL  ('b0)
  ) u_rcc_c2_rsr_rmvf_en_sync (
      .src_signal(rcc_c2_rsr_rmvf_en),
      .rst_n     (rst_n),
      .clk       (clk),
      .gen_signal(rcc_c2_rsr_rmvf_wren)
  );
  // --------------------------------------------------------------------------------
  // rcc_csr read data
  // --------------------------------------------------------------------------------
  assign rcc_csr_read     = {{30{1'b0}}, cur_rcc_csr_lsirdy, cur_rcc_csr_lsion};
  assign rcc_csr_lsion_en = (wr_req[0] & rcc_csr_sel);

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1),
      .RST_VAL  ('b0)
  ) u_rcc_csr_lsion_en_sync (
      .src_signal(rcc_csr_lsion_en),
      .rst_n     (rst_n),
      .clk       (clk),
      .gen_signal(rcc_csr_lsion_wren)
  );

  assign rcc_vdd_wdata = (rcc_c1_rsr_sel | rcc_c2_rsr_sel) ? wdata[17] : wdata[0];

endmodule
// spyglass enable_block Clock_info05c
