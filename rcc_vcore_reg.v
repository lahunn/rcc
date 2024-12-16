module rcc_reg #(
    // ================================================================================
    // CONFIGURABLE PARAMETERS
    // ================================================================================
    parameter AW = 5,
    parameter DW = 32,
    parameter WW = DW / 8
) (
    // ================================================================================
    // PINS
    // ================================================================================
    input           clk,
    input           rst_n,
    input           req,
    input  [WW-1:0] we,
    input  [AW-1:0] addr,
    input  [DW-1:0] wdata,
    output [DW-1:0] rdata,
    output [   1:0] rsp,
    output          romrst,
    output          smc2rst,
    output          smc1rst,
    output          xflashrst,
    output          fftrst,
    output          npurst,
    output          dma1rst,
    output          dma2rst,
    output          dmaschrst,
    output          qspi1rst,
    output          adcspi3rst,
    output          adcspi2rst,
    output          adcspi1rst,
    output          mspirst,
    output          hacif_l1rst,
    output          hacif_f1rst,
    output          cspi_lrst,
    output          cspi_frst,
    output          mac2rst,
    output          mac1rst,
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
    output          spl2rst,
    output          spl1rst,
    output          mailbox2rst,
    output          mailbox1rst,
    output          sysctlrst,
    output          wwdtrst,
    output          tim1rst,
    output          tim2rst,
    output          gpio6rst,
    output          gpio7rst,
    output          gpio8rst,
    output          iwdtrst,
    output          rtcrst,
    output          rcc_rom_amen,
    output          rcc_smc2_amen,
    output          rcc_smc1_amen,
    output          rcc_xflash_amen,
    output          rcc_fft_amen,
    output          rcc_npu_amen,
    output          rcc_dma1_amen,
    output          rcc_dma2_amen,
    output          rcc_dmasch_amen,
    output          rcc_qspi1_amen,
    output          rcc_adcspi3_amen,
    output          rcc_adcspi2_amen,
    output          rcc_adcspi1_amen,
    output          rcc_mspi_amen,
    output          rcc_hacif_l1_amen,
    output          rcc_hacif_f1_amen,
    output          rcc_cspi_l_amen,
    output          rcc_cspi_f_amen,
    output          rcc_mac2_amen,
    output          rcc_mac1_amen,
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
    output          rcc_spl2_amen,
    output          rcc_spl1_amen,
    output          rcc_mailbox2_amen,
    output          rcc_mailbox1_amen,
    output          rcc_sysctl_amen,
    output          rcc_wwdt_amen,
    output          rcc_tim1_amen,
    output          rcc_tim2_amen,
    output          rcc_gpio6_amen,
    output          rcc_gpio7_amen,
    output          rcc_gpio8_amen,
    output          rcc_iwdt_amen,
    output          rcc_rtc_amen,
    output          rcc_c1_rom_en,
    output          rcc_c1_smc2_en,
    output          rcc_c1_smc1_en,
    output          rcc_c1_xflash_en,
    output          rcc_c1_fft_en,
    output          rcc_c1_npu_en,
    output          rcc_c1_dma1_en,
    output          rcc_c1_dma2_en,
    output          rcc_c1_dmasch_en,
    output          rcc_c1_qspi1_en,
    output          rcc_c1_adcspi3_en,
    output          rcc_c1_adcspi2_en,
    output          rcc_c1_adcspi1_en,
    output          rcc_c1_mspi_en,
    output          rcc_c1_hacif_l1_en,
    output          rcc_c1_hacif_f1_en,
    output          rcc_c1_cspi_l_en,
    output          rcc_c1_cspi_f_en,
    output          rcc_c1_mac2_en,
    output          rcc_c1_mac1_en,
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
    output          rcc_c1_spl2_en,
    output          rcc_c1_spl1_en,
    output          rcc_c1_mailbox2_en,
    output          rcc_c1_mailbox1_en,
    output          rcc_c1_sysctl_en,
    output          rcc_c1_wwdt_en,
    output          rcc_c1_tim1_en,
    output          rcc_c1_tim2_en,
    output          rcc_c1_gpio6_en,
    output          rcc_c1_gpio7_en,
    output          rcc_c1_gpio8_en,
    output          rcc_c1_iwdt_en,
    output          rcc_c1_rtc_en,
    output          rcc_c1_rom_lpen,
    output          rcc_c1_smc2_lpen,
    output          rcc_c1_smc1_lpen,
    output          rcc_c1_xflash_lpen,
    output          rcc_c1_fft_lpen,
    output          rcc_c1_npu_lpen,
    output          rcc_c1_dma1_lpen,
    output          rcc_c1_dma2_lpen,
    output          rcc_c1_dmasch_lpen,
    output          rcc_c1_qspi1_lpen,
    output          rcc_c1_adcspi3_lpen,
    output          rcc_c1_adcspi2_lpen,
    output          rcc_c1_adcspi1_lpen,
    output          rcc_c1_mspi_lpen,
    output          rcc_c1_hacif_l1_lpen,
    output          rcc_c1_hacif_f1_lpen,
    output          rcc_c1_cspi_l_lpen,
    output          rcc_c1_cspi_f_lpen,
    output          rcc_c1_mac2_lpen,
    output          rcc_c1_mac1_lpen,
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
    output          rcc_c1_spl2_lpen,
    output          rcc_c1_spl1_lpen,
    output          rcc_c1_mailbox2_lpen,
    output          rcc_c1_mailbox1_lpen,
    output          rcc_c1_sysctl_lpen,
    output          rcc_c1_wwdt_lpen,
    output          rcc_c1_tim1_lpen,
    output          rcc_c1_tim2_lpen,
    output          rcc_c1_gpio6_lpen,
    output          rcc_c1_gpio7_lpen,
    output          rcc_c1_gpio8_lpen,
    output          rcc_c1_iwdt_lpen,
    output          rcc_c1_rtc_lpen,
    output          rcc_c2_rom_en,
    output          rcc_c2_smc2_en,
    output          rcc_c2_smc1_en,
    output          rcc_c2_xflash_en,
    output          rcc_c2_fft_en,
    output          rcc_c2_npu_en,
    output          rcc_c2_dma1_en,
    output          rcc_c2_dma2_en,
    output          rcc_c2_dmasch_en,
    output          rcc_c2_qspi1_en,
    output          rcc_c2_adcspi3_en,
    output          rcc_c2_adcspi2_en,
    output          rcc_c2_adcspi1_en,
    output          rcc_c2_mspi_en,
    output          rcc_c2_hacif_l1_en,
    output          rcc_c2_hacif_f1_en,
    output          rcc_c2_cspi_l_en,
    output          rcc_c2_cspi_f_en,
    output          rcc_c2_mac2_en,
    output          rcc_c2_mac1_en,
    output          rcc_c2_lz_en,
    output          rcc_c2_gtim1_en,
    output          rcc_c2_gtim2_en,
    output          rcc_c2_gtim3_en,
    output          rcc_c2_gtim4_en,
    output          rcc_c2_spi1_en,
    output          rcc_c2_spi2_en,
    output          rcc_c2_spi3_en,
    output          rcc_c2_uart1_en,
    output          rcc_c2_uart2_en,
    output          rcc_c2_uart3_en,
    output          rcc_c2_uart4_en,
    output          rcc_c2_i2c1_en,
    output          rcc_c2_gpio1_en,
    output          rcc_c2_gpio2_en,
    output          rcc_c2_gpio3_en,
    output          rcc_c2_can1_en,
    output          rcc_c2_can2_en,
    output          rcc_c2_can3_en,
    output          rcc_c2_gtim5_en,
    output          rcc_c2_gtim6_en,
    output          rcc_c2_spi4_en,
    output          rcc_c2_spi5_en,
    output          rcc_c2_uart5_en,
    output          rcc_c2_uart6_en,
    output          rcc_c2_uart7_en,
    output          rcc_c2_uart8_en,
    output          rcc_c2_i2c2_en,
    output          rcc_c2_i2c3_en,
    output          rcc_c2_can4_en,
    output          rcc_c2_can5_en,
    output          rcc_c2_can6_en,
    output          rcc_c2_mppt_en,
    output          rcc_c2_gpio4_en,
    output          rcc_c2_gpio5_en,
    output          rcc_c2_spl2_en,
    output          rcc_c2_spl1_en,
    output          rcc_c2_mailbox2_en,
    output          rcc_c2_mailbox1_en,
    output          rcc_c2_sysctl_en,
    output          rcc_c2_wwdt_en,
    output          rcc_c2_tim1_en,
    output          rcc_c2_tim2_en,
    output          rcc_c2_gpio6_en,
    output          rcc_c2_gpio7_en,
    output          rcc_c2_gpio8_en,
    output          rcc_c2_iwdt_en,
    output          rcc_c2_rtc_en,
    output          rcc_c2_rom_lpen,
    output          rcc_c2_smc2_lpen,
    output          rcc_c2_smc1_lpen,
    output          rcc_c2_xflash_lpen,
    output          rcc_c2_fft_lpen,
    output          rcc_c2_npu_lpen,
    output          rcc_c2_dma1_lpen,
    output          rcc_c2_dma2_lpen,
    output          rcc_c2_dmasch_lpen,
    output          rcc_c2_qspi1_lpen,
    output          rcc_c2_adcspi3_lpen,
    output          rcc_c2_adcspi2_lpen,
    output          rcc_c2_adcspi1_lpen,
    output          rcc_c2_mspi_lpen,
    output          rcc_c2_hacif_l1_lpen,
    output          rcc_c2_hacif_f1_lpen,
    output          rcc_c2_cspi_l_lpen,
    output          rcc_c2_cspi_f_lpen,
    output          rcc_c2_mac2_lpen,
    output          rcc_c2_mac1_lpen,
    output          rcc_c2_lz_lpen,
    output          rcc_c2_gtim1_lpen,
    output          rcc_c2_gtim2_lpen,
    output          rcc_c2_gtim3_lpen,
    output          rcc_c2_gtim4_lpen,
    output          rcc_c2_spi1_lpen,
    output          rcc_c2_spi2_lpen,
    output          rcc_c2_spi3_lpen,
    output          rcc_c2_uart1_lpen,
    output          rcc_c2_uart2_lpen,
    output          rcc_c2_uart3_lpen,
    output          rcc_c2_uart4_lpen,
    output          rcc_c2_i2c1_lpen,
    output          rcc_c2_gpio1_lpen,
    output          rcc_c2_gpio2_lpen,
    output          rcc_c2_gpio3_lpen,
    output          rcc_c2_can1_lpen,
    output          rcc_c2_can2_lpen,
    output          rcc_c2_can3_lpen,
    output          rcc_c2_gtim5_lpen,
    output          rcc_c2_gtim6_lpen,
    output          rcc_c2_spi4_lpen,
    output          rcc_c2_spi5_lpen,
    output          rcc_c2_uart5_lpen,
    output          rcc_c2_uart6_lpen,
    output          rcc_c2_uart7_lpen,
    output          rcc_c2_uart8_lpen,
    output          rcc_c2_i2c2_lpen,
    output          rcc_c2_i2c3_lpen,
    output          rcc_c2_can4_lpen,
    output          rcc_c2_can5_lpen,
    output          rcc_c2_can6_lpen,
    output          rcc_c2_mppt_lpen,
    output          rcc_c2_gpio4_lpen,
    output          rcc_c2_gpio5_lpen,
    output          rcc_c2_spl2_lpen,
    output          rcc_c2_spl1_lpen,
    output          rcc_c2_mailbox2_lpen,
    output          rcc_c2_mailbox1_lpen,
    output          rcc_c2_sysctl_lpen,
    output          rcc_c2_wwdt_lpen,
    output          rcc_c2_tim1_lpen,
    output          rcc_c2_tim2_lpen,
    output          rcc_c2_gpio6_lpen,
    output          rcc_c2_gpio7_lpen,
    output          rcc_c2_gpio8_lpen,
    output          rcc_c2_iwdt_lpen,
    output          rcc_c2_rtc_lpen,
    input           rcc_sys_stop,
    input           rcc_hsecss_fail
);
  // ================================================================================
  // LOCAL PARAMETERS
  // ================================================================================
  // rcc_reg
  localparam RCC_REG = 'h0;
  localparam RCC_AHB1RSTR = (RCC_REG + 'h0) >> 2;
  localparam RCC_APB1RSTR = (RCC_REG + 'h4) >> 2;
  localparam RCC_APB2RSTR = (RCC_REG + 'h8) >> 2;
  localparam RCC_APB3RSTR = (RCC_REG + 'hC) >> 2;
  localparam RCC_AHB1D3AMR = (RCC_REG + 'h10) >> 2;
  localparam RCC_APB1D3AMR = (RCC_REG + 'h14) >> 2;
  localparam RCC_APB2D3AMR = (RCC_REG + 'h18) >> 2;
  localparam RCC_APB3D3AMR = (RCC_REG + 'h1C) >> 2;
  localparam RCC_C1_AHB1ENR = (RCC_REG + 'h20) >> 2;
  localparam RCC_C1_APB1ENR = (RCC_REG + 'h24) >> 2;
  localparam RCC_C1_APB2ENR = (RCC_REG + 'h28) >> 2;
  localparam RCC_C1_APB3ENR = (RCC_REG + 'h2C) >> 2;
  localparam RCC_C1_AHB1LPENR = (RCC_REG + 'h30) >> 2;
  localparam RCC_C1_APB1LPENR = (RCC_REG + 'h34) >> 2;
  localparam RCC_C1_APB2LPENR = (RCC_REG + 'h38) >> 2;
  localparam RCC_C1_APB3LPENR = (RCC_REG + 'h3C) >> 2;
  localparam RCC_C2_AHB1ENR = (RCC_REG + 'h40) >> 2;
  localparam RCC_C2_APB1ENR = (RCC_REG + 'h44) >> 2;
  localparam RCC_C2_APB2ENR = (RCC_REG + 'h48) >> 2;
  localparam RCC_C2_APB3ENR = (RCC_REG + 'h4C) >> 2;
  localparam RCC_C2_AHB1LPENR = (RCC_REG + 'h50) >> 2;
  localparam RCC_C2_APB1LPENR = (RCC_REG + 'h54) >> 2;
  localparam RCC_C2_APB2LPENR = (RCC_REG + 'h58) >> 2;
  localparam RCC_C2_APB3LPENR = (RCC_REG + 'h5C) >> 2;
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
  // rcc_reg
  // rcc_ahb1rstr
  wire [  31:0] rcc_ahb1rstr_read;
  wire          rcc_ahb1rstr_sel;
  wire          cur_rcc_ahb1rstr_romrst;
  wire          nxt_rcc_ahb1rstr_romrst;
  wire          rcc_ahb1rstr_romrst_en;
  wire          cur_rcc_ahb1rstr_smc2rst;
  wire          nxt_rcc_ahb1rstr_smc2rst;
  wire          rcc_ahb1rstr_smc2rst_en;
  wire          cur_rcc_ahb1rstr_smc1rst;
  wire          nxt_rcc_ahb1rstr_smc1rst;
  wire          rcc_ahb1rstr_smc1rst_en;
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
  wire          cur_rcc_ahb1rstr_adcspi3rst;
  wire          nxt_rcc_ahb1rstr_adcspi3rst;
  wire          rcc_ahb1rstr_adcspi3rst_en;
  wire          cur_rcc_ahb1rstr_adcspi2rst;
  wire          nxt_rcc_ahb1rstr_adcspi2rst;
  wire          rcc_ahb1rstr_adcspi2rst_en;
  wire          cur_rcc_ahb1rstr_adcspi1rst;
  wire          nxt_rcc_ahb1rstr_adcspi1rst;
  wire          rcc_ahb1rstr_adcspi1rst_en;
  wire          cur_rcc_ahb1rstr_mspirst;
  wire          nxt_rcc_ahb1rstr_mspirst;
  wire          rcc_ahb1rstr_mspirst_en;
  wire          cur_rcc_ahb1rstr_hacif_l1rst;
  wire          nxt_rcc_ahb1rstr_hacif_l1rst;
  wire          rcc_ahb1rstr_hacif_l1rst_en;
  wire          cur_rcc_ahb1rstr_hacif_f1rst;
  wire          nxt_rcc_ahb1rstr_hacif_f1rst;
  wire          rcc_ahb1rstr_hacif_f1rst_en;
  wire          cur_rcc_ahb1rstr_cspi_lrst;
  wire          nxt_rcc_ahb1rstr_cspi_lrst;
  wire          rcc_ahb1rstr_cspi_lrst_en;
  wire          cur_rcc_ahb1rstr_cspi_frst;
  wire          nxt_rcc_ahb1rstr_cspi_frst;
  wire          rcc_ahb1rstr_cspi_frst_en;
  wire          cur_rcc_ahb1rstr_mac2rst;
  wire          nxt_rcc_ahb1rstr_mac2rst;
  wire          rcc_ahb1rstr_mac2rst_en;
  wire          cur_rcc_ahb1rstr_mac1rst;
  wire          nxt_rcc_ahb1rstr_mac1rst;
  wire          rcc_ahb1rstr_mac1rst_en;
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
  wire          cur_rcc_apb3rstr_spl2rst;
  wire          nxt_rcc_apb3rstr_spl2rst;
  wire          rcc_apb3rstr_spl2rst_en;
  wire          cur_rcc_apb3rstr_spl1rst;
  wire          nxt_rcc_apb3rstr_spl1rst;
  wire          rcc_apb3rstr_spl1rst_en;
  wire          cur_rcc_apb3rstr_mailbox2rst;
  wire          nxt_rcc_apb3rstr_mailbox2rst;
  wire          rcc_apb3rstr_mailbox2rst_en;
  wire          cur_rcc_apb3rstr_mailbox1rst;
  wire          nxt_rcc_apb3rstr_mailbox1rst;
  wire          rcc_apb3rstr_mailbox1rst_en;
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
  // rcc_ahb1d3amr
  wire [  31:0] rcc_ahb1d3amr_read;
  wire          rcc_ahb1d3amr_sel;
  wire          cur_rcc_ahb1d3amr_romamen;
  wire          nxt_rcc_ahb1d3amr_romamen;
  wire          rcc_ahb1d3amr_romamen_en;
  wire          cur_rcc_ahb1d3amr_smc2amen;
  wire          nxt_rcc_ahb1d3amr_smc2amen;
  wire          rcc_ahb1d3amr_smc2amen_en;
  wire          cur_rcc_ahb1d3amr_smc1amen;
  wire          nxt_rcc_ahb1d3amr_smc1amen;
  wire          rcc_ahb1d3amr_smc1amen_en;
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
  wire          cur_rcc_ahb1d3amr_adcspi3amen;
  wire          nxt_rcc_ahb1d3amr_adcspi3amen;
  wire          rcc_ahb1d3amr_adcspi3amen_en;
  wire          cur_rcc_ahb1d3amr_adcspi2amen;
  wire          nxt_rcc_ahb1d3amr_adcspi2amen;
  wire          rcc_ahb1d3amr_adcspi2amen_en;
  wire          cur_rcc_ahb1d3amr_adcspi1amen;
  wire          nxt_rcc_ahb1d3amr_adcspi1amen;
  wire          rcc_ahb1d3amr_adcspi1amen_en;
  wire          cur_rcc_ahb1d3amr_mspiamen;
  wire          nxt_rcc_ahb1d3amr_mspiamen;
  wire          rcc_ahb1d3amr_mspiamen_en;
  wire          cur_rcc_ahb1d3amr_hacif_l1amen;
  wire          nxt_rcc_ahb1d3amr_hacif_l1amen;
  wire          rcc_ahb1d3amr_hacif_l1amen_en;
  wire          cur_rcc_ahb1d3amr_hacif_f1amen;
  wire          nxt_rcc_ahb1d3amr_hacif_f1amen;
  wire          rcc_ahb1d3amr_hacif_f1amen_en;
  wire          cur_rcc_ahb1d3amr_cspi_lamen;
  wire          nxt_rcc_ahb1d3amr_cspi_lamen;
  wire          rcc_ahb1d3amr_cspi_lamen_en;
  wire          cur_rcc_ahb1d3amr_cspi_famen;
  wire          nxt_rcc_ahb1d3amr_cspi_famen;
  wire          rcc_ahb1d3amr_cspi_famen_en;
  wire          cur_rcc_ahb1d3amr_mac2amen;
  wire          nxt_rcc_ahb1d3amr_mac2amen;
  wire          rcc_ahb1d3amr_mac2amen_en;
  wire          cur_rcc_ahb1d3amr_mac1amen;
  wire          nxt_rcc_ahb1d3amr_mac1amen;
  wire          rcc_ahb1d3amr_mac1amen_en;
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
  wire          cur_rcc_apb3d3amr_spl2amen;
  wire          nxt_rcc_apb3d3amr_spl2amen;
  wire          rcc_apb3d3amr_spl2amen_en;
  wire          cur_rcc_apb3d3amr_spl1amen;
  wire          nxt_rcc_apb3d3amr_spl1amen;
  wire          rcc_apb3d3amr_spl1amen_en;
  wire          cur_rcc_apb3d3amr_mailbox2amen;
  wire          nxt_rcc_apb3d3amr_mailbox2amen;
  wire          rcc_apb3d3amr_mailbox2amen_en;
  wire          cur_rcc_apb3d3amr_mailbox1amen;
  wire          nxt_rcc_apb3d3amr_mailbox1amen;
  wire          rcc_apb3d3amr_mailbox1amen_en;
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
  // rcc_c1_ahb1enr
  wire [  31:0] rcc_c1_ahb1enr_read;
  wire          rcc_c1_ahb1enr_sel;
  wire          cur_rcc_c1_ahb1enr_romen;
  wire          nxt_rcc_c1_ahb1enr_romen;
  wire          rcc_c1_ahb1enr_romen_en;
  wire          cur_rcc_c1_ahb1enr_smc2en;
  wire          nxt_rcc_c1_ahb1enr_smc2en;
  wire          rcc_c1_ahb1enr_smc2en_en;
  wire          cur_rcc_c1_ahb1enr_smc1en;
  wire          nxt_rcc_c1_ahb1enr_smc1en;
  wire          rcc_c1_ahb1enr_smc1en_en;
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
  wire          cur_rcc_c1_ahb1enr_adcspi3en;
  wire          nxt_rcc_c1_ahb1enr_adcspi3en;
  wire          rcc_c1_ahb1enr_adcspi3en_en;
  wire          cur_rcc_c1_ahb1enr_adcspi2en;
  wire          nxt_rcc_c1_ahb1enr_adcspi2en;
  wire          rcc_c1_ahb1enr_adcspi2en_en;
  wire          cur_rcc_c1_ahb1enr_adcspi1en;
  wire          nxt_rcc_c1_ahb1enr_adcspi1en;
  wire          rcc_c1_ahb1enr_adcspi1en_en;
  wire          cur_rcc_c1_ahb1enr_mspien;
  wire          nxt_rcc_c1_ahb1enr_mspien;
  wire          rcc_c1_ahb1enr_mspien_en;
  wire          cur_rcc_c1_ahb1enr_hacif_l1en;
  wire          nxt_rcc_c1_ahb1enr_hacif_l1en;
  wire          rcc_c1_ahb1enr_hacif_l1en_en;
  wire          cur_rcc_c1_ahb1enr_hacif_f1en;
  wire          nxt_rcc_c1_ahb1enr_hacif_f1en;
  wire          rcc_c1_ahb1enr_hacif_f1en_en;
  wire          cur_rcc_c1_ahb1enr_cspi_len;
  wire          nxt_rcc_c1_ahb1enr_cspi_len;
  wire          rcc_c1_ahb1enr_cspi_len_en;
  wire          cur_rcc_c1_ahb1enr_cspi_fen;
  wire          nxt_rcc_c1_ahb1enr_cspi_fen;
  wire          rcc_c1_ahb1enr_cspi_fen_en;
  wire          cur_rcc_c1_ahb1enr_mac2en;
  wire          nxt_rcc_c1_ahb1enr_mac2en;
  wire          rcc_c1_ahb1enr_mac2en_en;
  wire          cur_rcc_c1_ahb1enr_mac1en;
  wire          nxt_rcc_c1_ahb1enr_mac1en;
  wire          rcc_c1_ahb1enr_mac1en_en;
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
  wire          cur_rcc_c1_apb3enr_spl2en;
  wire          nxt_rcc_c1_apb3enr_spl2en;
  wire          rcc_c1_apb3enr_spl2en_en;
  wire          cur_rcc_c1_apb3enr_spl1en;
  wire          nxt_rcc_c1_apb3enr_spl1en;
  wire          rcc_c1_apb3enr_spl1en_en;
  wire          cur_rcc_c1_apb3enr_mailbox2en;
  wire          nxt_rcc_c1_apb3enr_mailbox2en;
  wire          rcc_c1_apb3enr_mailbox2en_en;
  wire          cur_rcc_c1_apb3enr_mailbox1en;
  wire          nxt_rcc_c1_apb3enr_mailbox1en;
  wire          rcc_c1_apb3enr_mailbox1en_en;
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
  wire          cur_rcc_c1_apb3enr_gpio6en;
  wire          nxt_rcc_c1_apb3enr_gpio6en;
  wire          rcc_c1_apb3enr_gpio6en_en;
  wire          cur_rcc_c1_apb3enr_gpio7en;
  wire          nxt_rcc_c1_apb3enr_gpio7en;
  wire          rcc_c1_apb3enr_gpio7en_en;
  wire          cur_rcc_c1_apb3enr_gpio8en;
  wire          nxt_rcc_c1_apb3enr_gpio8en;
  wire          rcc_c1_apb3enr_gpio8en_en;
  wire          cur_rcc_c1_apb3enr_iwdten;
  wire          nxt_rcc_c1_apb3enr_iwdten;
  wire          rcc_c1_apb3enr_iwdten_en;
  wire          cur_rcc_c1_apb3enr_rtcen;
  wire          nxt_rcc_c1_apb3enr_rtcen;
  wire          rcc_c1_apb3enr_rtcen_en;
  // rcc_c1_ahb1lpenr
  wire [  31:0] rcc_c1_ahb1lpenr_read;
  wire          rcc_c1_ahb1lpenr_sel;
  wire          cur_rcc_c1_ahb1lpenr_romlpen;
  wire          nxt_rcc_c1_ahb1lpenr_romlpen;
  wire          rcc_c1_ahb1lpenr_romlpen_en;
  wire          cur_rcc_c1_ahb1lpenr_smc2lpen;
  wire          nxt_rcc_c1_ahb1lpenr_smc2lpen;
  wire          rcc_c1_ahb1lpenr_smc2lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_smc1lpen;
  wire          nxt_rcc_c1_ahb1lpenr_smc1lpen;
  wire          rcc_c1_ahb1lpenr_smc1lpen_en;
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
  wire          cur_rcc_c1_ahb1lpenr_adcspi3lpen;
  wire          nxt_rcc_c1_ahb1lpenr_adcspi3lpen;
  wire          rcc_c1_ahb1lpenr_adcspi3lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_adcspi2lpen;
  wire          nxt_rcc_c1_ahb1lpenr_adcspi2lpen;
  wire          rcc_c1_ahb1lpenr_adcspi2lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_adcspi1lpen;
  wire          nxt_rcc_c1_ahb1lpenr_adcspi1lpen;
  wire          rcc_c1_ahb1lpenr_adcspi1lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_mspilpen;
  wire          nxt_rcc_c1_ahb1lpenr_mspilpen;
  wire          rcc_c1_ahb1lpenr_mspilpen_en;
  wire          cur_rcc_c1_ahb1lpenr_hacif_l1lpen;
  wire          nxt_rcc_c1_ahb1lpenr_hacif_l1lpen;
  wire          rcc_c1_ahb1lpenr_hacif_l1lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_hacif_f1lpen;
  wire          nxt_rcc_c1_ahb1lpenr_hacif_f1lpen;
  wire          rcc_c1_ahb1lpenr_hacif_f1lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_cspi_llpen;
  wire          nxt_rcc_c1_ahb1lpenr_cspi_llpen;
  wire          rcc_c1_ahb1lpenr_cspi_llpen_en;
  wire          cur_rcc_c1_ahb1lpenr_cspi_flpen;
  wire          nxt_rcc_c1_ahb1lpenr_cspi_flpen;
  wire          rcc_c1_ahb1lpenr_cspi_flpen_en;
  wire          cur_rcc_c1_ahb1lpenr_mac2lpen;
  wire          nxt_rcc_c1_ahb1lpenr_mac2lpen;
  wire          rcc_c1_ahb1lpenr_mac2lpen_en;
  wire          cur_rcc_c1_ahb1lpenr_mac1lpen;
  wire          nxt_rcc_c1_ahb1lpenr_mac1lpen;
  wire          rcc_c1_ahb1lpenr_mac1lpen_en;
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
  wire          cur_rcc_c1_apb3lpenr_spl2lpen;
  wire          nxt_rcc_c1_apb3lpenr_spl2lpen;
  wire          rcc_c1_apb3lpenr_spl2lpen_en;
  wire          cur_rcc_c1_apb3lpenr_spl1lpen;
  wire          nxt_rcc_c1_apb3lpenr_spl1lpen;
  wire          rcc_c1_apb3lpenr_spl1lpen_en;
  wire          cur_rcc_c1_apb3lpenr_mailbox2lpen;
  wire          nxt_rcc_c1_apb3lpenr_mailbox2lpen;
  wire          rcc_c1_apb3lpenr_mailbox2lpen_en;
  wire          cur_rcc_c1_apb3lpenr_mailbox1lpen;
  wire          nxt_rcc_c1_apb3lpenr_mailbox1lpen;
  wire          rcc_c1_apb3lpenr_mailbox1lpen_en;
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
  wire          cur_rcc_c1_apb3lpenr_gpio6lpen;
  wire          nxt_rcc_c1_apb3lpenr_gpio6lpen;
  wire          rcc_c1_apb3lpenr_gpio6lpen_en;
  wire          cur_rcc_c1_apb3lpenr_gpio7lpen;
  wire          nxt_rcc_c1_apb3lpenr_gpio7lpen;
  wire          rcc_c1_apb3lpenr_gpio7lpen_en;
  wire          cur_rcc_c1_apb3lpenr_gpio8lpen;
  wire          nxt_rcc_c1_apb3lpenr_gpio8lpen;
  wire          rcc_c1_apb3lpenr_gpio8lpen_en;
  wire          cur_rcc_c1_apb3lpenr_iwdtlpen;
  wire          nxt_rcc_c1_apb3lpenr_iwdtlpen;
  wire          rcc_c1_apb3lpenr_iwdtlpen_en;
  wire          cur_rcc_c1_apb3lpenr_rtclpen;
  wire          nxt_rcc_c1_apb3lpenr_rtclpen;
  wire          rcc_c1_apb3lpenr_rtclpen_en;
  // rcc_c2_ahb1enr
  wire [  31:0] rcc_c2_ahb1enr_read;
  wire          rcc_c2_ahb1enr_sel;
  wire          cur_rcc_c2_ahb1enr_romen;
  wire          nxt_rcc_c2_ahb1enr_romen;
  wire          rcc_c2_ahb1enr_romen_en;
  wire          cur_rcc_c2_ahb1enr_smc2en;
  wire          nxt_rcc_c2_ahb1enr_smc2en;
  wire          rcc_c2_ahb1enr_smc2en_en;
  wire          cur_rcc_c2_ahb1enr_smc1en;
  wire          nxt_rcc_c2_ahb1enr_smc1en;
  wire          rcc_c2_ahb1enr_smc1en_en;
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
  wire          cur_rcc_c2_ahb1enr_adcspi3en;
  wire          nxt_rcc_c2_ahb1enr_adcspi3en;
  wire          rcc_c2_ahb1enr_adcspi3en_en;
  wire          cur_rcc_c2_ahb1enr_adcspi2en;
  wire          nxt_rcc_c2_ahb1enr_adcspi2en;
  wire          rcc_c2_ahb1enr_adcspi2en_en;
  wire          cur_rcc_c2_ahb1enr_adcspi1en;
  wire          nxt_rcc_c2_ahb1enr_adcspi1en;
  wire          rcc_c2_ahb1enr_adcspi1en_en;
  wire          cur_rcc_c2_ahb1enr_mspien;
  wire          nxt_rcc_c2_ahb1enr_mspien;
  wire          rcc_c2_ahb1enr_mspien_en;
  wire          cur_rcc_c2_ahb1enr_hacif_l1en;
  wire          nxt_rcc_c2_ahb1enr_hacif_l1en;
  wire          rcc_c2_ahb1enr_hacif_l1en_en;
  wire          cur_rcc_c2_ahb1enr_hacif_f1en;
  wire          nxt_rcc_c2_ahb1enr_hacif_f1en;
  wire          rcc_c2_ahb1enr_hacif_f1en_en;
  wire          cur_rcc_c2_ahb1enr_cspi_len;
  wire          nxt_rcc_c2_ahb1enr_cspi_len;
  wire          rcc_c2_ahb1enr_cspi_len_en;
  wire          cur_rcc_c2_ahb1enr_cspi_fen;
  wire          nxt_rcc_c2_ahb1enr_cspi_fen;
  wire          rcc_c2_ahb1enr_cspi_fen_en;
  wire          cur_rcc_c2_ahb1enr_mac2en;
  wire          nxt_rcc_c2_ahb1enr_mac2en;
  wire          rcc_c2_ahb1enr_mac2en_en;
  wire          cur_rcc_c2_ahb1enr_mac1en;
  wire          nxt_rcc_c2_ahb1enr_mac1en;
  wire          rcc_c2_ahb1enr_mac1en_en;
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
  wire          cur_rcc_c2_apb1enr_i2c1en;
  wire          nxt_rcc_c2_apb1enr_i2c1en;
  wire          rcc_c2_apb1enr_i2c1en_en;
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
  wire          cur_rcc_c2_apb3enr_spl2en;
  wire          nxt_rcc_c2_apb3enr_spl2en;
  wire          rcc_c2_apb3enr_spl2en_en;
  wire          cur_rcc_c2_apb3enr_spl1en;
  wire          nxt_rcc_c2_apb3enr_spl1en;
  wire          rcc_c2_apb3enr_spl1en_en;
  wire          cur_rcc_c2_apb3enr_mailbox2en;
  wire          nxt_rcc_c2_apb3enr_mailbox2en;
  wire          rcc_c2_apb3enr_mailbox2en_en;
  wire          cur_rcc_c2_apb3enr_mailbox1en;
  wire          nxt_rcc_c2_apb3enr_mailbox1en;
  wire          rcc_c2_apb3enr_mailbox1en_en;
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
  wire          cur_rcc_c2_apb3enr_gpio6en;
  wire          nxt_rcc_c2_apb3enr_gpio6en;
  wire          rcc_c2_apb3enr_gpio6en_en;
  wire          cur_rcc_c2_apb3enr_gpio7en;
  wire          nxt_rcc_c2_apb3enr_gpio7en;
  wire          rcc_c2_apb3enr_gpio7en_en;
  wire          cur_rcc_c2_apb3enr_gpio8en;
  wire          nxt_rcc_c2_apb3enr_gpio8en;
  wire          rcc_c2_apb3enr_gpio8en_en;
  wire          cur_rcc_c2_apb3enr_iwdten;
  wire          nxt_rcc_c2_apb3enr_iwdten;
  wire          rcc_c2_apb3enr_iwdten_en;
  wire          cur_rcc_c2_apb3enr_rtcen;
  wire          nxt_rcc_c2_apb3enr_rtcen;
  wire          rcc_c2_apb3enr_rtcen_en;
  // rcc_c2_ahb1lpenr
  wire [  31:0] rcc_c2_ahb1lpenr_read;
  wire          rcc_c2_ahb1lpenr_sel;
  wire          cur_rcc_c2_ahb1lpenr_romlpen;
  wire          nxt_rcc_c2_ahb1lpenr_romlpen;
  wire          rcc_c2_ahb1lpenr_romlpen_en;
  wire          cur_rcc_c2_ahb1lpenr_smc2lpen;
  wire          nxt_rcc_c2_ahb1lpenr_smc2lpen;
  wire          rcc_c2_ahb1lpenr_smc2lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_smc1lpen;
  wire          nxt_rcc_c2_ahb1lpenr_smc1lpen;
  wire          rcc_c2_ahb1lpenr_smc1lpen_en;
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
  wire          cur_rcc_c2_ahb1lpenr_adcspi3lpen;
  wire          nxt_rcc_c2_ahb1lpenr_adcspi3lpen;
  wire          rcc_c2_ahb1lpenr_adcspi3lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_adcspi2lpen;
  wire          nxt_rcc_c2_ahb1lpenr_adcspi2lpen;
  wire          rcc_c2_ahb1lpenr_adcspi2lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_adcspi1lpen;
  wire          nxt_rcc_c2_ahb1lpenr_adcspi1lpen;
  wire          rcc_c2_ahb1lpenr_adcspi1lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_mspilpen;
  wire          nxt_rcc_c2_ahb1lpenr_mspilpen;
  wire          rcc_c2_ahb1lpenr_mspilpen_en;
  wire          cur_rcc_c2_ahb1lpenr_hacif_l1lpen;
  wire          nxt_rcc_c2_ahb1lpenr_hacif_l1lpen;
  wire          rcc_c2_ahb1lpenr_hacif_l1lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_hacif_f1lpen;
  wire          nxt_rcc_c2_ahb1lpenr_hacif_f1lpen;
  wire          rcc_c2_ahb1lpenr_hacif_f1lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_cspi_llpen;
  wire          nxt_rcc_c2_ahb1lpenr_cspi_llpen;
  wire          rcc_c2_ahb1lpenr_cspi_llpen_en;
  wire          cur_rcc_c2_ahb1lpenr_cspi_flpen;
  wire          nxt_rcc_c2_ahb1lpenr_cspi_flpen;
  wire          rcc_c2_ahb1lpenr_cspi_flpen_en;
  wire          cur_rcc_c2_ahb1lpenr_mac2lpen;
  wire          nxt_rcc_c2_ahb1lpenr_mac2lpen;
  wire          rcc_c2_ahb1lpenr_mac2lpen_en;
  wire          cur_rcc_c2_ahb1lpenr_mac1lpen;
  wire          nxt_rcc_c2_ahb1lpenr_mac1lpen;
  wire          rcc_c2_ahb1lpenr_mac1lpen_en;
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
  wire          cur_rcc_c2_apb1lpenr_i2c1lpen;
  wire          nxt_rcc_c2_apb1lpenr_i2c1lpen;
  wire          rcc_c2_apb1lpenr_i2c1lpen_en;
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
  wire          cur_rcc_c2_apb3lpenr_spl2lpen;
  wire          nxt_rcc_c2_apb3lpenr_spl2lpen;
  wire          rcc_c2_apb3lpenr_spl2lpen_en;
  wire          cur_rcc_c2_apb3lpenr_spl1lpen;
  wire          nxt_rcc_c2_apb3lpenr_spl1lpen;
  wire          rcc_c2_apb3lpenr_spl1lpen_en;
  wire          cur_rcc_c2_apb3lpenr_mailbox2lpen;
  wire          nxt_rcc_c2_apb3lpenr_mailbox2lpen;
  wire          rcc_c2_apb3lpenr_mailbox2lpen_en;
  wire          cur_rcc_c2_apb3lpenr_mailbox1lpen;
  wire          nxt_rcc_c2_apb3lpenr_mailbox1lpen;
  wire          rcc_c2_apb3lpenr_mailbox1lpen_en;
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
  wire          cur_rcc_c2_apb3lpenr_gpio6lpen;
  wire          nxt_rcc_c2_apb3lpenr_gpio6lpen;
  wire          rcc_c2_apb3lpenr_gpio6lpen_en;
  wire          cur_rcc_c2_apb3lpenr_gpio7lpen;
  wire          nxt_rcc_c2_apb3lpenr_gpio7lpen;
  wire          rcc_c2_apb3lpenr_gpio7lpen_en;
  wire          cur_rcc_c2_apb3lpenr_gpio8lpen;
  wire          nxt_rcc_c2_apb3lpenr_gpio8lpen;
  wire          rcc_c2_apb3lpenr_gpio8lpen_en;
  wire          cur_rcc_c2_apb3lpenr_iwdtlpen;
  wire          nxt_rcc_c2_apb3lpenr_iwdtlpen;
  wire          rcc_c2_apb3lpenr_iwdtlpen_en;
  wire          cur_rcc_c2_apb3lpenr_rtclpen;
  wire          nxt_rcc_c2_apb3lpenr_rtclpen;
  wire          rcc_c2_apb3lpenr_rtclpen_en;

  // ================================================================================
  // R/W INDICATOR
  // ================================================================================
  assign rd_req = req && !(|we);
  assign wr_req = {WW{req}} & we;

  // ================================================================================
  // ADDRESS DECODER
  // ================================================================================
  // rcc_reg
  assign rcc_ahb1rstr_sel = (addr == RCC_AHB1RSTR);
  assign rcc_apb1rstr_sel = (addr == RCC_APB1RSTR);
  assign rcc_apb2rstr_sel = (addr == RCC_APB2RSTR);
  assign rcc_apb3rstr_sel = (addr == RCC_APB3RSTR);
  assign rcc_ahb1d3amr_sel = (addr == RCC_AHB1D3AMR);
  assign rcc_apb1d3amr_sel = (addr == RCC_APB1D3AMR);
  assign rcc_apb2d3amr_sel = (addr == RCC_APB2D3AMR);
  assign rcc_apb3d3amr_sel = (addr == RCC_APB3D3AMR);
  assign rcc_c1_ahb1enr_sel = (addr == RCC_C1_AHB1ENR);
  assign rcc_c1_apb1enr_sel = (addr == RCC_C1_APB1ENR);
  assign rcc_c1_apb2enr_sel = (addr == RCC_C1_APB2ENR);
  assign rcc_c1_apb3enr_sel = (addr == RCC_C1_APB3ENR);
  assign rcc_c1_ahb1lpenr_sel = (addr == RCC_C1_AHB1LPENR);
  assign rcc_c1_apb1lpenr_sel = (addr == RCC_C1_APB1LPENR);
  assign rcc_c1_apb2lpenr_sel = (addr == RCC_C1_APB2LPENR);
  assign rcc_c1_apb3lpenr_sel = (addr == RCC_C1_APB3LPENR);
  assign rcc_c2_ahb1enr_sel = (addr == RCC_C2_AHB1ENR);
  assign rcc_c2_apb1enr_sel = (addr == RCC_C2_APB1ENR);
  assign rcc_c2_apb2enr_sel = (addr == RCC_C2_APB2ENR);
  assign rcc_c2_apb3enr_sel = (addr == RCC_C2_APB3ENR);
  assign rcc_c2_ahb1lpenr_sel = (addr == RCC_C2_AHB1LPENR);
  assign rcc_c2_apb1lpenr_sel = (addr == RCC_C2_APB1LPENR);
  assign rcc_c2_apb2lpenr_sel = (addr == RCC_C2_APB2LPENR);
  assign rcc_c2_apb3lpenr_sel = (addr == RCC_C2_APB3LPENR);

  // ================================================================================
  // REG ACCESS ERROR
  // ================================================================================
  assign rsv_reg_sel = (addr > RCC_C2_APB3LPENR);

  assign rsv_acs_err = rsv_reg_sel && req;
  assign rsp = {1'b0, rsv_acs_err};

  // ================================================================================
  // DATA READ
  // ================================================================================
  assign rdata_tmp = ({DW{rcc_ahb1rstr_sel}} & rcc_ahb1rstr_read)
                 | ({DW{rcc_apb1rstr_sel}} & rcc_apb1rstr_read)
                 | ({DW{rcc_apb2rstr_sel}} & rcc_apb2rstr_read)
                 | ({DW{rcc_apb3rstr_sel}} & rcc_apb3rstr_read)
                 | ({DW{rcc_ahb1d3amr_sel}} & rcc_ahb1d3amr_read)
                 | ({DW{rcc_apb1d3amr_sel}} & rcc_apb1d3amr_read)
                 | ({DW{rcc_apb2d3amr_sel}} & rcc_apb2d3amr_read)
                 | ({DW{rcc_apb3d3amr_sel}} & rcc_apb3d3amr_read)
                 | ({DW{rcc_c1_ahb1enr_sel}} & rcc_c1_ahb1enr_read)
                 | ({DW{rcc_c1_apb1enr_sel}} & rcc_c1_apb1enr_read)
                 | ({DW{rcc_c1_apb2enr_sel}} & rcc_c1_apb2enr_read)
                 | ({DW{rcc_c1_apb3enr_sel}} & rcc_c1_apb3enr_read)
                 | ({DW{rcc_c1_ahb1lpenr_sel}} & rcc_c1_ahb1lpenr_read)
                 | ({DW{rcc_c1_apb1lpenr_sel}} & rcc_c1_apb1lpenr_read)
                 | ({DW{rcc_c1_apb2lpenr_sel}} & rcc_c1_apb2lpenr_read)
                 | ({DW{rcc_c1_apb3lpenr_sel}} & rcc_c1_apb3lpenr_read)
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
  // rcc_ahb1rstr                            0x0                                     
  // --------------------------------------------------------------------------------
  // 20:20               romrst              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 19:19               smc2rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 18:18               smc1rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 17:17               xflashrst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 16:16               fftrst              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               npurst              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               dma1rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               dma2rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               dmaschrst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               qspi1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               adcspi3rst          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 adcspi2rst          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 adcspi1rst          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 mspirst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 hacif_l1rst         RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 hacif_f1rst         RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 cspi_lrst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 cspi_frst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 mac2rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 mac1rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 lzrst               RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_ahb1rstr read data
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_read = {
    {11{1'b0}},
    cur_rcc_ahb1rstr_romrst,
    cur_rcc_ahb1rstr_smc2rst,
    cur_rcc_ahb1rstr_smc1rst,
    cur_rcc_ahb1rstr_xflashrst,
    cur_rcc_ahb1rstr_fftrst,
    cur_rcc_ahb1rstr_npurst,
    cur_rcc_ahb1rstr_dma1rst,
    cur_rcc_ahb1rstr_dma2rst,
    cur_rcc_ahb1rstr_dmaschrst,
    cur_rcc_ahb1rstr_qspi1rst,
    cur_rcc_ahb1rstr_adcspi3rst,
    cur_rcc_ahb1rstr_adcspi2rst,
    cur_rcc_ahb1rstr_adcspi1rst,
    cur_rcc_ahb1rstr_mspirst,
    cur_rcc_ahb1rstr_hacif_l1rst,
    cur_rcc_ahb1rstr_hacif_f1rst,
    cur_rcc_ahb1rstr_cspi_lrst,
    cur_rcc_ahb1rstr_cspi_frst,
    cur_rcc_ahb1rstr_mac2rst,
    cur_rcc_ahb1rstr_mac1rst,
    cur_rcc_ahb1rstr_lzrst
  };

  // --------------------------------------------------------------------------------
  // 20:20               romrst              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_romrst_en = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_romrst = wdata[20:20];
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
  // 19:19               smc2rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_smc2rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_smc2rst = wdata[19:19];
  assign smc2rst                  = cur_rcc_ahb1rstr_smc2rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_smc2rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_smc2rst_en),
      .din  (nxt_rcc_ahb1rstr_smc2rst),
      .dout (cur_rcc_ahb1rstr_smc2rst)
  );

  // --------------------------------------------------------------------------------
  // 18:18               smc1rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_smc1rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_smc1rst = wdata[18:18];
  assign smc1rst                  = cur_rcc_ahb1rstr_smc1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_smc1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_smc1rst_en),
      .din  (nxt_rcc_ahb1rstr_smc1rst),
      .dout (cur_rcc_ahb1rstr_smc1rst)
  );

  // --------------------------------------------------------------------------------
  // 17:17               xflashrst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_xflashrst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_xflashrst = wdata[17:17];
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
  // 16:16               fftrst              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_fftrst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_fftrst = wdata[16:16];
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
  // 15:15               npurst              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_npurst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_npurst = wdata[15:15];
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
  // 14:14               dma1rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_dma1rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_dma1rst = wdata[14:14];
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
  // 13:13               dma2rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_dma2rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_dma2rst = wdata[13:13];
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
  // 12:12               dmaschrst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_dmaschrst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_dmaschrst = wdata[12:12];
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
  // 11:11               qspi1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_qspi1rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_qspi1rst = wdata[11:11];
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
  // 10:10               adcspi3rst          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_adcspi3rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_adcspi3rst = wdata[10:10];
  assign adcspi3rst                  = cur_rcc_ahb1rstr_adcspi3rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_adcspi3rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_adcspi3rst_en),
      .din  (nxt_rcc_ahb1rstr_adcspi3rst),
      .dout (cur_rcc_ahb1rstr_adcspi3rst)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 adcspi2rst          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_adcspi2rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_adcspi2rst = wdata[9:9];
  assign adcspi2rst                  = cur_rcc_ahb1rstr_adcspi2rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_adcspi2rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_adcspi2rst_en),
      .din  (nxt_rcc_ahb1rstr_adcspi2rst),
      .dout (cur_rcc_ahb1rstr_adcspi2rst)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 adcspi1rst          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_adcspi1rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_adcspi1rst = wdata[8:8];
  assign adcspi1rst                  = cur_rcc_ahb1rstr_adcspi1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_adcspi1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_adcspi1rst_en),
      .din  (nxt_rcc_ahb1rstr_adcspi1rst),
      .dout (cur_rcc_ahb1rstr_adcspi1rst)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 mspirst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_mspirst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_mspirst = wdata[7:7];
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
  // 6:6                 hacif_l1rst         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_hacif_l1rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_hacif_l1rst = wdata[6:6];
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
  // 5:5                 hacif_f1rst         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_hacif_f1rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_hacif_f1rst = wdata[5:5];
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
  // 4:4                 cspi_lrst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_cspi_lrst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_cspi_lrst = wdata[4:4];
  assign cspi_lrst                  = cur_rcc_ahb1rstr_cspi_lrst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_cspi_lrst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_cspi_lrst_en),
      .din  (nxt_rcc_ahb1rstr_cspi_lrst),
      .dout (cur_rcc_ahb1rstr_cspi_lrst)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 cspi_frst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_cspi_frst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_cspi_frst = wdata[3:3];
  assign cspi_frst                  = cur_rcc_ahb1rstr_cspi_frst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_cspi_frst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_cspi_frst_en),
      .din  (nxt_rcc_ahb1rstr_cspi_frst),
      .dout (cur_rcc_ahb1rstr_cspi_frst)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 mac2rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_mac2rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_mac2rst = wdata[2:2];
  assign mac2rst                  = cur_rcc_ahb1rstr_mac2rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_mac2rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_mac2rst_en),
      .din  (nxt_rcc_ahb1rstr_mac2rst),
      .dout (cur_rcc_ahb1rstr_mac2rst)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 mac1rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1rstr_mac1rst_en  = (|wr_req & rcc_ahb1rstr_sel);
  assign nxt_rcc_ahb1rstr_mac1rst = wdata[1:1];
  assign mac1rst                  = cur_rcc_ahb1rstr_mac1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1rstr_mac1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1rstr_mac1rst_en),
      .din  (nxt_rcc_ahb1rstr_mac1rst),
      .dout (cur_rcc_ahb1rstr_mac1rst)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 lzrst               RW                  0b0                 
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
  // rcc_apb1rstr                            0x4                                     
  // --------------------------------------------------------------------------------
  // 17:17               gtim1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 16:16               gtim2rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               gtim3rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               gtim4rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spi1rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               spi2rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               spi3rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               uart1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 uart2rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 uart3rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 uart4rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 i2c1rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio1rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio2rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 gpio3rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 can1rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 can2rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 can3rst             RW                  0b0                 
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
  // 17:17               gtim1rst            RW                  0b0                 
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
  // 16:16               gtim2rst            RW                  0b0                 
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
  // 15:15               gtim3rst            RW                  0b0                 
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
  // 14:14               gtim4rst            RW                  0b0                 
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
  // 13:13               spi1rst             RW                  0b0                 
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
  // 12:12               spi2rst             RW                  0b0                 
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
  // 11:11               spi3rst             RW                  0b0                 
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
  // 10:10               uart1rst            RW                  0b0                 
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
  // 9:9                 uart2rst            RW                  0b0                 
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
  // 8:8                 uart3rst            RW                  0b0                 
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
  // 7:7                 uart4rst            RW                  0b0                 
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
  // 6:6                 i2c1rst             RW                  0b0                 
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
  // 5:5                 gpio1rst            RW                  0b0                 
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
  // 4:4                 gpio2rst            RW                  0b0                 
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
  // 3:3                 gpio3rst            RW                  0b0                 
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
  // 2:2                 can1rst             RW                  0b0                 
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
  // 1:1                 can2rst             RW                  0b0                 
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
  // 0:0                 can3rst             RW                  0b0                 
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
  // rcc_apb2rstr                            0x8                                     
  // --------------------------------------------------------------------------------
  // 15:15               gtim5rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               gtim6rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spi4rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               spi5rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               uart5rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               uart6rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 uart7rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 uart8rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 i2c2rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 i2c3rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 can4rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 can5rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 can6rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 mpptrst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 gpio4rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 gpio5rst            RW                  0b0                 
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
  // 15:15               gtim5rst            RW                  0b0                 
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
  // 14:14               gtim6rst            RW                  0b0                 
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
  // 13:13               spi4rst             RW                  0b0                 
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
  // 12:12               spi5rst             RW                  0b0                 
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
  // 11:11               uart5rst            RW                  0b0                 
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
  // 10:10               uart6rst            RW                  0b0                 
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
  // 9:9                 uart7rst            RW                  0b0                 
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
  // 8:8                 uart8rst            RW                  0b0                 
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
  // 7:7                 i2c2rst             RW                  0b0                 
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
  // 6:6                 i2c3rst             RW                  0b0                 
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
  // 5:5                 can4rst             RW                  0b0                 
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
  // 4:4                 can5rst             RW                  0b0                 
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
  // 3:3                 can6rst             RW                  0b0                 
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
  // 2:2                 mpptrst             RW                  0b0                 
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
  // 1:1                 gpio4rst            RW                  0b0                 
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
  // 0:0                 gpio5rst            RW                  0b0                 
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
  // rcc_apb3rstr                            0xc                                     
  // --------------------------------------------------------------------------------
  // 14:14               spl2rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spl1rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               mailbox2rst         RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               mailbox1rst         RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               sysctlrst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 wwdtrst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 tim1rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 tim2rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 gpio6rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio7rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio8rst            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 iwdtrst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 rtcrst              RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_apb3rstr read data
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_read = {
    {17{1'b0}},
    cur_rcc_apb3rstr_spl2rst,
    cur_rcc_apb3rstr_spl1rst,
    cur_rcc_apb3rstr_mailbox2rst,
    cur_rcc_apb3rstr_mailbox1rst,
    cur_rcc_apb3rstr_sysctlrst,
    cur_rcc_apb3rstr_wwdtrst,
    cur_rcc_apb3rstr_tim1rst,
    cur_rcc_apb3rstr_tim2rst,
    cur_rcc_apb3rstr_gpio6rst,
    cur_rcc_apb3rstr_gpio7rst,
    cur_rcc_apb3rstr_gpio8rst,
    cur_rcc_apb3rstr_iwdtrst,
    {2{1'b0}},
    cur_rcc_apb3rstr_rtcrst
  };

  // --------------------------------------------------------------------------------
  // 14:14               spl2rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_spl2rst_en = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_spl2rst = wdata[14:14];
  assign spl2rst = cur_rcc_apb3rstr_spl2rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3rstr_spl2rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3rstr_spl2rst_en),
      .din  (nxt_rcc_apb3rstr_spl2rst),
      .dout (cur_rcc_apb3rstr_spl2rst)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spl1rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_spl1rst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_spl1rst = wdata[13:13];
  assign spl1rst                  = cur_rcc_apb3rstr_spl1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3rstr_spl1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3rstr_spl1rst_en),
      .din  (nxt_rcc_apb3rstr_spl1rst),
      .dout (cur_rcc_apb3rstr_spl1rst)
  );

  // --------------------------------------------------------------------------------
  // 12:12               mailbox2rst         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_mailbox2rst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_mailbox2rst = wdata[12:12];
  assign mailbox2rst                  = cur_rcc_apb3rstr_mailbox2rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3rstr_mailbox2rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3rstr_mailbox2rst_en),
      .din  (nxt_rcc_apb3rstr_mailbox2rst),
      .dout (cur_rcc_apb3rstr_mailbox2rst)
  );

  // --------------------------------------------------------------------------------
  // 11:11               mailbox1rst         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_mailbox1rst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_mailbox1rst = wdata[11:11];
  assign mailbox1rst                  = cur_rcc_apb3rstr_mailbox1rst;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3rstr_mailbox1rst (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3rstr_mailbox1rst_en),
      .din  (nxt_rcc_apb3rstr_mailbox1rst),
      .dout (cur_rcc_apb3rstr_mailbox1rst)
  );

  // --------------------------------------------------------------------------------
  // 10:10               sysctlrst           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_sysctlrst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_sysctlrst = wdata[10:10];
  assign sysctlrst                  = cur_rcc_apb3rstr_sysctlrst;
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
  // 9:9                 wwdtrst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_wwdtrst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_wwdtrst = wdata[9:9];
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
  // 8:8                 tim1rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_tim1rst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_tim1rst = wdata[8:8];
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
  // 7:7                 tim2rst             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3rstr_tim2rst_en  = (|wr_req & rcc_apb3rstr_sel);
  assign nxt_rcc_apb3rstr_tim2rst = wdata[7:7];
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
  // 6:6                 gpio6rst            RW                  0b0                 
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
  // 5:5                 gpio7rst            RW                  0b0                 
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
  // 4:4                 gpio8rst            RW                  0b0                 
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
  // 3:3                 iwdtrst             RW                  0b0                 
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
  // 0:0                 rtcrst              RW                  0b0                 
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
  // rcc_ahb1d3amr                           0x10                                    
  // --------------------------------------------------------------------------------
  // 20:20               romamen             RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 19:19               smc2amen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 18:18               smc1amen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 17:17               xflashamen          RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 16:16               fftamen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               npuamen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               dma1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               dma2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               dmaschamen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               qspi1amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               adcspi3amen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 adcspi2amen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 adcspi1amen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 mspiamen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 hacif_l1amen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 hacif_f1amen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 cspi_lamen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 cspi_famen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 mac2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 mac1amen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 0:0                 lzamen              RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_ahb1d3amr read data
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_read = {
    {11{1'b0}},
    cur_rcc_ahb1d3amr_romamen,
    cur_rcc_ahb1d3amr_smc2amen,
    cur_rcc_ahb1d3amr_smc1amen,
    cur_rcc_ahb1d3amr_xflashamen,
    cur_rcc_ahb1d3amr_fftamen,
    cur_rcc_ahb1d3amr_npuamen,
    cur_rcc_ahb1d3amr_dma1amen,
    cur_rcc_ahb1d3amr_dma2amen,
    cur_rcc_ahb1d3amr_dmaschamen,
    cur_rcc_ahb1d3amr_qspi1amen,
    cur_rcc_ahb1d3amr_adcspi3amen,
    cur_rcc_ahb1d3amr_adcspi2amen,
    cur_rcc_ahb1d3amr_adcspi1amen,
    cur_rcc_ahb1d3amr_mspiamen,
    cur_rcc_ahb1d3amr_hacif_l1amen,
    cur_rcc_ahb1d3amr_hacif_f1amen,
    cur_rcc_ahb1d3amr_cspi_lamen,
    cur_rcc_ahb1d3amr_cspi_famen,
    cur_rcc_ahb1d3amr_mac2amen,
    cur_rcc_ahb1d3amr_mac1amen,
    cur_rcc_ahb1d3amr_lzamen
  };

  // --------------------------------------------------------------------------------
  // 20:20               romamen             RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_romamen_en = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_romamen = wdata[20:20];
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
  // 19:19               smc2amen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_smc2amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_smc2amen = wdata[19:19];
  assign rcc_smc2_amen              = cur_rcc_ahb1d3amr_smc2amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_ahb1d3amr_smc2amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_smc2amen_en),
      .din  (nxt_rcc_ahb1d3amr_smc2amen),
      .dout (cur_rcc_ahb1d3amr_smc2amen)
  );

  // --------------------------------------------------------------------------------
  // 18:18               smc1amen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_smc1amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_smc1amen = wdata[18:18];
  assign rcc_smc1_amen              = cur_rcc_ahb1d3amr_smc1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_ahb1d3amr_smc1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_smc1amen_en),
      .din  (nxt_rcc_ahb1d3amr_smc1amen),
      .dout (cur_rcc_ahb1d3amr_smc1amen)
  );

  // --------------------------------------------------------------------------------
  // 17:17               xflashamen          RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_xflashamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_xflashamen = wdata[17:17];
  assign rcc_xflash_amen              = cur_rcc_ahb1d3amr_xflashamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_ahb1d3amr_xflashamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_xflashamen_en),
      .din  (nxt_rcc_ahb1d3amr_xflashamen),
      .dout (cur_rcc_ahb1d3amr_xflashamen)
  );

  // --------------------------------------------------------------------------------
  // 16:16               fftamen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_fftamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_fftamen = wdata[16:16];
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
  // 15:15               npuamen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_npuamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_npuamen = wdata[15:15];
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
  // 14:14               dma1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_dma1amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_dma1amen = wdata[14:14];
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
  // 13:13               dma2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_dma2amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_dma2amen = wdata[13:13];
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
  // 12:12               dmaschamen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_dmaschamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_dmaschamen = wdata[12:12];
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
  // 11:11               qspi1amen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_qspi1amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_qspi1amen = wdata[11:11];
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
  // 10:10               adcspi3amen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_adcspi3amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_adcspi3amen = wdata[10:10];
  assign rcc_adcspi3_amen              = cur_rcc_ahb1d3amr_adcspi3amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_adcspi3amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_adcspi3amen_en),
      .din  (nxt_rcc_ahb1d3amr_adcspi3amen),
      .dout (cur_rcc_ahb1d3amr_adcspi3amen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 adcspi2amen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_adcspi2amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_adcspi2amen = wdata[9:9];
  assign rcc_adcspi2_amen              = cur_rcc_ahb1d3amr_adcspi2amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_adcspi2amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_adcspi2amen_en),
      .din  (nxt_rcc_ahb1d3amr_adcspi2amen),
      .dout (cur_rcc_ahb1d3amr_adcspi2amen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 adcspi1amen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_adcspi1amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_adcspi1amen = wdata[8:8];
  assign rcc_adcspi1_amen              = cur_rcc_ahb1d3amr_adcspi1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_adcspi1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_adcspi1amen_en),
      .din  (nxt_rcc_ahb1d3amr_adcspi1amen),
      .dout (cur_rcc_ahb1d3amr_adcspi1amen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 mspiamen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_mspiamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_mspiamen = wdata[7:7];
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
  // 6:6                 hacif_l1amen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_hacif_l1amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_hacif_l1amen = wdata[6:6];
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
  // 5:5                 hacif_f1amen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_hacif_f1amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_hacif_f1amen = wdata[5:5];
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
  // 4:4                 cspi_lamen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_cspi_lamen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_cspi_lamen = wdata[4:4];
  assign rcc_cspi_l_amen              = cur_rcc_ahb1d3amr_cspi_lamen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_cspi_lamen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_cspi_lamen_en),
      .din  (nxt_rcc_ahb1d3amr_cspi_lamen),
      .dout (cur_rcc_ahb1d3amr_cspi_lamen)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 cspi_famen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_cspi_famen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_cspi_famen = wdata[3:3];
  assign rcc_cspi_f_amen              = cur_rcc_ahb1d3amr_cspi_famen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_cspi_famen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_cspi_famen_en),
      .din  (nxt_rcc_ahb1d3amr_cspi_famen),
      .dout (cur_rcc_ahb1d3amr_cspi_famen)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 mac2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_mac2amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_mac2amen = wdata[2:2];
  assign rcc_mac2_amen              = cur_rcc_ahb1d3amr_mac2amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_ahb1d3amr_mac2amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_mac2amen_en),
      .din  (nxt_rcc_ahb1d3amr_mac2amen),
      .dout (cur_rcc_ahb1d3amr_mac2amen)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 mac1amen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_ahb1d3amr_mac1amen_en  = (|wr_req & rcc_ahb1d3amr_sel);
  assign nxt_rcc_ahb1d3amr_mac1amen = wdata[1:1];
  assign rcc_mac1_amen              = cur_rcc_ahb1d3amr_mac1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_ahb1d3amr_mac1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_ahb1d3amr_mac1amen_en),
      .din  (nxt_rcc_ahb1d3amr_mac1amen),
      .dout (cur_rcc_ahb1d3amr_mac1amen)
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
  // rcc_apb1d3amr                           0x14                                    
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
  // rcc_apb2d3amr                           0x18                                    
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
  // 2:2                 mpptamen            RW                  0b0                 
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
  // 2:2                 mpptamen            RW                  0b0                 
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
  // rcc_apb3d3amr                           0x1c                                    
  // --------------------------------------------------------------------------------
  // 14:14               spl2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spl1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               mailbox2amen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               mailbox1amen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               sysctlamen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 wwdtamen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 tim1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 tim2amen            RW                  0b0                 
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
    {17{1'b0}},
    cur_rcc_apb3d3amr_spl2amen,
    cur_rcc_apb3d3amr_spl1amen,
    cur_rcc_apb3d3amr_mailbox2amen,
    cur_rcc_apb3d3amr_mailbox1amen,
    cur_rcc_apb3d3amr_sysctlamen,
    cur_rcc_apb3d3amr_wwdtamen,
    cur_rcc_apb3d3amr_tim1amen,
    cur_rcc_apb3d3amr_tim2amen,
    cur_rcc_apb3d3amr_gpio6amen,
    cur_rcc_apb3d3amr_gpio7amen,
    cur_rcc_apb3d3amr_gpio8amen,
    cur_rcc_apb3d3amr_iwdtamen,
    {2{1'b0}},
    cur_rcc_apb3d3amr_rtcamen
  };

  // --------------------------------------------------------------------------------
  // 14:14               spl2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_spl2amen_en = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_spl2amen = wdata[14:14];
  assign rcc_spl2_amen = cur_rcc_apb3d3amr_spl2amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3d3amr_spl2amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3d3amr_spl2amen_en),
      .din  (nxt_rcc_apb3d3amr_spl2amen),
      .dout (cur_rcc_apb3d3amr_spl2amen)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spl1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_spl1amen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_spl1amen = wdata[13:13];
  assign rcc_spl1_amen              = cur_rcc_apb3d3amr_spl1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3d3amr_spl1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3d3amr_spl1amen_en),
      .din  (nxt_rcc_apb3d3amr_spl1amen),
      .dout (cur_rcc_apb3d3amr_spl1amen)
  );

  // --------------------------------------------------------------------------------
  // 12:12               mailbox2amen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_mailbox2amen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_mailbox2amen = wdata[12:12];
  assign rcc_mailbox2_amen              = cur_rcc_apb3d3amr_mailbox2amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3d3amr_mailbox2amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3d3amr_mailbox2amen_en),
      .din  (nxt_rcc_apb3d3amr_mailbox2amen),
      .dout (cur_rcc_apb3d3amr_mailbox2amen)
  );

  // --------------------------------------------------------------------------------
  // 11:11               mailbox1amen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_mailbox1amen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_mailbox1amen = wdata[11:11];
  assign rcc_mailbox1_amen              = cur_rcc_apb3d3amr_mailbox1amen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_apb3d3amr_mailbox1amen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_apb3d3amr_mailbox1amen_en),
      .din  (nxt_rcc_apb3d3amr_mailbox1amen),
      .dout (cur_rcc_apb3d3amr_mailbox1amen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               sysctlamen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_sysctlamen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_sysctlamen = wdata[10:10];
  assign rcc_sysctl_amen              = cur_rcc_apb3d3amr_sysctlamen;
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
  // 9:9                 wwdtamen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_wwdtamen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_wwdtamen = wdata[9:9];
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
  // 8:8                 tim1amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_tim1amen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_tim1amen = wdata[8:8];
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
  // 7:7                 tim2amen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_apb3d3amr_tim2amen_en  = (|wr_req & rcc_apb3d3amr_sel);
  assign nxt_rcc_apb3d3amr_tim2amen = wdata[7:7];
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
  // rcc_c1_ahb1enr                          0x20                                    
  // --------------------------------------------------------------------------------
  // 20:20               romen               RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 19:19               smc2en              RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 18:18               smc1en              RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 17:17               xflashen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 16:16               fften               RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               npuen               RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               dma1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               dma2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               dmaschen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               qspi1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               adcspi3en           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 adcspi2en           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 adcspi1en           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 mspien              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 hacif_l1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 hacif_f1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 cspi_len            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 cspi_fen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 mac2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 mac1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 lzen                RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c1_ahb1enr read data
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_read = {
    {11{1'b0}},
    cur_rcc_c1_ahb1enr_romen,
    cur_rcc_c1_ahb1enr_smc2en,
    cur_rcc_c1_ahb1enr_smc1en,
    cur_rcc_c1_ahb1enr_xflashen,
    cur_rcc_c1_ahb1enr_fften,
    cur_rcc_c1_ahb1enr_npuen,
    cur_rcc_c1_ahb1enr_dma1en,
    cur_rcc_c1_ahb1enr_dma2en,
    cur_rcc_c1_ahb1enr_dmaschen,
    cur_rcc_c1_ahb1enr_qspi1en,
    cur_rcc_c1_ahb1enr_adcspi3en,
    cur_rcc_c1_ahb1enr_adcspi2en,
    cur_rcc_c1_ahb1enr_adcspi1en,
    cur_rcc_c1_ahb1enr_mspien,
    cur_rcc_c1_ahb1enr_hacif_l1en,
    cur_rcc_c1_ahb1enr_hacif_f1en,
    cur_rcc_c1_ahb1enr_cspi_len,
    cur_rcc_c1_ahb1enr_cspi_fen,
    cur_rcc_c1_ahb1enr_mac2en,
    cur_rcc_c1_ahb1enr_mac1en,
    cur_rcc_c1_ahb1enr_lzen
  };

  // --------------------------------------------------------------------------------
  // 20:20               romen               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_romen_en = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_romen = wdata[20:20];
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
  // 19:19               smc2en              RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_smc2en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_smc2en = wdata[19:19];
  assign rcc_c1_smc2_en            = cur_rcc_c1_ahb1enr_smc2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c1_ahb1enr_smc2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_smc2en_en),
      .din  (nxt_rcc_c1_ahb1enr_smc2en),
      .dout (cur_rcc_c1_ahb1enr_smc2en)
  );

  // --------------------------------------------------------------------------------
  // 18:18               smc1en              RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_smc1en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_smc1en = wdata[18:18];
  assign rcc_c1_smc1_en            = cur_rcc_c1_ahb1enr_smc1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c1_ahb1enr_smc1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_smc1en_en),
      .din  (nxt_rcc_c1_ahb1enr_smc1en),
      .dout (cur_rcc_c1_ahb1enr_smc1en)
  );

  // --------------------------------------------------------------------------------
  // 17:17               xflashen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_xflashen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_xflashen = wdata[17:17];
  assign rcc_c1_xflash_en            = cur_rcc_c1_ahb1enr_xflashen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c1_ahb1enr_xflashen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_xflashen_en),
      .din  (nxt_rcc_c1_ahb1enr_xflashen),
      .dout (cur_rcc_c1_ahb1enr_xflashen)
  );

  // --------------------------------------------------------------------------------
  // 16:16               fften               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_fften_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_fften = wdata[16:16];
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
  // 15:15               npuen               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_npuen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_npuen = wdata[15:15];
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
  // 14:14               dma1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_dma1en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_dma1en = wdata[14:14];
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
  // 13:13               dma2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_dma2en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_dma2en = wdata[13:13];
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
  // 12:12               dmaschen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_dmaschen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_dmaschen = wdata[12:12];
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
  // 11:11               qspi1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_qspi1en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_qspi1en = wdata[11:11];
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
  // 10:10               adcspi3en           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_adcspi3en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_adcspi3en = wdata[10:10];
  assign rcc_c1_adcspi3_en            = cur_rcc_c1_ahb1enr_adcspi3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_adcspi3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_adcspi3en_en),
      .din  (nxt_rcc_c1_ahb1enr_adcspi3en),
      .dout (cur_rcc_c1_ahb1enr_adcspi3en)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 adcspi2en           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_adcspi2en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_adcspi2en = wdata[9:9];
  assign rcc_c1_adcspi2_en            = cur_rcc_c1_ahb1enr_adcspi2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_adcspi2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_adcspi2en_en),
      .din  (nxt_rcc_c1_ahb1enr_adcspi2en),
      .dout (cur_rcc_c1_ahb1enr_adcspi2en)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 adcspi1en           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_adcspi1en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_adcspi1en = wdata[8:8];
  assign rcc_c1_adcspi1_en            = cur_rcc_c1_ahb1enr_adcspi1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_adcspi1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_adcspi1en_en),
      .din  (nxt_rcc_c1_ahb1enr_adcspi1en),
      .dout (cur_rcc_c1_ahb1enr_adcspi1en)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 mspien              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_mspien_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_mspien = wdata[7:7];
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
  // 6:6                 hacif_l1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_hacif_l1en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_hacif_l1en = wdata[6:6];
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
  // 5:5                 hacif_f1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_hacif_f1en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_hacif_f1en = wdata[5:5];
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
  // 4:4                 cspi_len            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_cspi_len_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_cspi_len = wdata[4:4];
  assign rcc_c1_cspi_l_en            = cur_rcc_c1_ahb1enr_cspi_len;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_cspi_len (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_cspi_len_en),
      .din  (nxt_rcc_c1_ahb1enr_cspi_len),
      .dout (cur_rcc_c1_ahb1enr_cspi_len)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 cspi_fen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_cspi_fen_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_cspi_fen = wdata[3:3];
  assign rcc_c1_cspi_f_en            = cur_rcc_c1_ahb1enr_cspi_fen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_cspi_fen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_cspi_fen_en),
      .din  (nxt_rcc_c1_ahb1enr_cspi_fen),
      .dout (cur_rcc_c1_ahb1enr_cspi_fen)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 mac2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_mac2en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_mac2en = wdata[2:2];
  assign rcc_c1_mac2_en            = cur_rcc_c1_ahb1enr_mac2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_mac2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_mac2en_en),
      .din  (nxt_rcc_c1_ahb1enr_mac2en),
      .dout (cur_rcc_c1_ahb1enr_mac2en)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 mac1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1enr_mac1en_en  = (|wr_req & rcc_c1_ahb1enr_sel);
  assign nxt_rcc_c1_ahb1enr_mac1en = wdata[1:1];
  assign rcc_c1_mac1_en            = cur_rcc_c1_ahb1enr_mac1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1enr_mac1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1enr_mac1en_en),
      .din  (nxt_rcc_c1_ahb1enr_mac1en),
      .dout (cur_rcc_c1_ahb1enr_mac1en)
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
  // rcc_c1_apb1enr                          0x24                                    
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
  // rcc_c1_apb2enr                          0x28                                    
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
  // 2:2                 mppten              RW                  0b0                 
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
  // 2:2                 mppten              RW                  0b0                 
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
  // rcc_c1_apb3enr                          0x2c                                    
  // --------------------------------------------------------------------------------
  // 14:14               spl2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spl1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               mailbox2en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               mailbox1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               sysctlen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 wwdten              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 tim1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 tim2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 gpio6en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio7en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio8en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 iwdten              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 rtcen               RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c1_apb3enr read data
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_read = {
    {17{1'b0}},
    cur_rcc_c1_apb3enr_spl2en,
    cur_rcc_c1_apb3enr_spl1en,
    cur_rcc_c1_apb3enr_mailbox2en,
    cur_rcc_c1_apb3enr_mailbox1en,
    cur_rcc_c1_apb3enr_sysctlen,
    cur_rcc_c1_apb3enr_wwdten,
    cur_rcc_c1_apb3enr_tim1en,
    cur_rcc_c1_apb3enr_tim2en,
    cur_rcc_c1_apb3enr_gpio6en,
    cur_rcc_c1_apb3enr_gpio7en,
    cur_rcc_c1_apb3enr_gpio8en,
    cur_rcc_c1_apb3enr_iwdten,
    {2{1'b0}},
    cur_rcc_c1_apb3enr_rtcen
  };

  // --------------------------------------------------------------------------------
  // 14:14               spl2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_spl2en_en = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_spl2en = wdata[14:14];
  assign rcc_c1_spl2_en = cur_rcc_c1_apb3enr_spl2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3enr_spl2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3enr_spl2en_en),
      .din  (nxt_rcc_c1_apb3enr_spl2en),
      .dout (cur_rcc_c1_apb3enr_spl2en)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spl1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_spl1en_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_spl1en = wdata[13:13];
  assign rcc_c1_spl1_en            = cur_rcc_c1_apb3enr_spl1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3enr_spl1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3enr_spl1en_en),
      .din  (nxt_rcc_c1_apb3enr_spl1en),
      .dout (cur_rcc_c1_apb3enr_spl1en)
  );

  // --------------------------------------------------------------------------------
  // 12:12               mailbox2en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_mailbox2en_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_mailbox2en = wdata[12:12];
  assign rcc_c1_mailbox2_en            = cur_rcc_c1_apb3enr_mailbox2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3enr_mailbox2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3enr_mailbox2en_en),
      .din  (nxt_rcc_c1_apb3enr_mailbox2en),
      .dout (cur_rcc_c1_apb3enr_mailbox2en)
  );

  // --------------------------------------------------------------------------------
  // 11:11               mailbox1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_mailbox1en_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_mailbox1en = wdata[11:11];
  assign rcc_c1_mailbox1_en            = cur_rcc_c1_apb3enr_mailbox1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3enr_mailbox1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3enr_mailbox1en_en),
      .din  (nxt_rcc_c1_apb3enr_mailbox1en),
      .dout (cur_rcc_c1_apb3enr_mailbox1en)
  );

  // --------------------------------------------------------------------------------
  // 10:10               sysctlen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_sysctlen_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_sysctlen = wdata[10:10];
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
  // 9:9                 wwdten              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_wwdten_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_wwdten = wdata[9:9];
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
  // 8:8                 tim1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_tim1en_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_tim1en = wdata[8:8];
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
  // 7:7                 tim2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_tim2en_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_tim2en = wdata[7:7];
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
  // 3:3                 iwdten              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_iwdten_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_iwdten = wdata[3:3];
  assign rcc_c1_iwdt_en            = cur_rcc_c1_apb3enr_iwdten;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3enr_iwdten (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3enr_iwdten_en),
      .din  (nxt_rcc_c1_apb3enr_iwdten),
      .dout (cur_rcc_c1_apb3enr_iwdten)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 rtcen               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3enr_rtcen_en  = (|wr_req & rcc_c1_apb3enr_sel);
  assign nxt_rcc_c1_apb3enr_rtcen = wdata[0:0];
  assign rcc_c1_rtc_en            = cur_rcc_c1_apb3enr_rtcen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3enr_rtcen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3enr_rtcen_en),
      .din  (nxt_rcc_c1_apb3enr_rtcen),
      .dout (cur_rcc_c1_apb3enr_rtcen)
  );


  // --------------------------------------------------------------------------------
  // rcc_c1_ahb1lpenr                        0x30                                    
  // --------------------------------------------------------------------------------
  // 20:20               romlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 19:19               smc2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 18:18               smc1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 17:17               xflashlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 16:16               fftlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               npulpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               dma1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               dma2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               dmaschlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               qspi1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               adcspi3lpen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 adcspi2lpen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 adcspi1lpen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 mspilpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 hacif_l1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 hacif_f1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 cspi_llpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 cspi_flpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 mac2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 mac1lpen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 0:0                 lzlpen              RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c1_ahb1lpenr read data
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_read = {
    {11{1'b0}},
    cur_rcc_c1_ahb1lpenr_romlpen,
    cur_rcc_c1_ahb1lpenr_smc2lpen,
    cur_rcc_c1_ahb1lpenr_smc1lpen,
    cur_rcc_c1_ahb1lpenr_xflashlpen,
    cur_rcc_c1_ahb1lpenr_fftlpen,
    cur_rcc_c1_ahb1lpenr_npulpen,
    cur_rcc_c1_ahb1lpenr_dma1lpen,
    cur_rcc_c1_ahb1lpenr_dma2lpen,
    cur_rcc_c1_ahb1lpenr_dmaschlpen,
    cur_rcc_c1_ahb1lpenr_qspi1lpen,
    cur_rcc_c1_ahb1lpenr_adcspi3lpen,
    cur_rcc_c1_ahb1lpenr_adcspi2lpen,
    cur_rcc_c1_ahb1lpenr_adcspi1lpen,
    cur_rcc_c1_ahb1lpenr_mspilpen,
    cur_rcc_c1_ahb1lpenr_hacif_l1lpen,
    cur_rcc_c1_ahb1lpenr_hacif_f1lpen,
    cur_rcc_c1_ahb1lpenr_cspi_llpen,
    cur_rcc_c1_ahb1lpenr_cspi_flpen,
    cur_rcc_c1_ahb1lpenr_mac2lpen,
    cur_rcc_c1_ahb1lpenr_mac1lpen,
    cur_rcc_c1_ahb1lpenr_lzlpen
  };

  // --------------------------------------------------------------------------------
  // 20:20               romlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_romlpen_en = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_romlpen = wdata[20:20];
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
  // 19:19               smc2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_smc2lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_smc2lpen = wdata[19:19];
  assign rcc_c1_smc2_lpen              = cur_rcc_c1_ahb1lpenr_smc2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_smc2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_smc2lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_smc2lpen),
      .dout (cur_rcc_c1_ahb1lpenr_smc2lpen)
  );

  // --------------------------------------------------------------------------------
  // 18:18               smc1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_smc1lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_smc1lpen = wdata[18:18];
  assign rcc_c1_smc1_lpen              = cur_rcc_c1_ahb1lpenr_smc1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_smc1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_smc1lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_smc1lpen),
      .dout (cur_rcc_c1_ahb1lpenr_smc1lpen)
  );

  // --------------------------------------------------------------------------------
  // 17:17               xflashlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_xflashlpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_xflashlpen = wdata[17:17];
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
  // 16:16               fftlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_fftlpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_fftlpen = wdata[16:16];
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
  // 15:15               npulpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_npulpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_npulpen = wdata[15:15];
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
  // 14:14               dma1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_dma1lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_dma1lpen = wdata[14:14];
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
  // 13:13               dma2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_dma2lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_dma2lpen = wdata[13:13];
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
  // 12:12               dmaschlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_dmaschlpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_dmaschlpen = wdata[12:12];
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
  // 11:11               qspi1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_qspi1lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_qspi1lpen = wdata[11:11];
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
  // 10:10               adcspi3lpen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_adcspi3lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_adcspi3lpen = wdata[10:10];
  assign rcc_c1_adcspi3_lpen              = cur_rcc_c1_ahb1lpenr_adcspi3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_adcspi3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_adcspi3lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_adcspi3lpen),
      .dout (cur_rcc_c1_ahb1lpenr_adcspi3lpen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 adcspi2lpen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_adcspi2lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_adcspi2lpen = wdata[9:9];
  assign rcc_c1_adcspi2_lpen              = cur_rcc_c1_ahb1lpenr_adcspi2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_adcspi2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_adcspi2lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_adcspi2lpen),
      .dout (cur_rcc_c1_ahb1lpenr_adcspi2lpen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 adcspi1lpen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_adcspi1lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_adcspi1lpen = wdata[8:8];
  assign rcc_c1_adcspi1_lpen              = cur_rcc_c1_ahb1lpenr_adcspi1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_adcspi1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_adcspi1lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_adcspi1lpen),
      .dout (cur_rcc_c1_ahb1lpenr_adcspi1lpen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 mspilpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_mspilpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_mspilpen = wdata[7:7];
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
  // 6:6                 hacif_l1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_hacif_l1lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_hacif_l1lpen = wdata[6:6];
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
  // 5:5                 hacif_f1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_hacif_f1lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_hacif_f1lpen = wdata[5:5];
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
  // 4:4                 cspi_llpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_cspi_llpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_cspi_llpen = wdata[4:4];
  assign rcc_c1_cspi_l_lpen              = cur_rcc_c1_ahb1lpenr_cspi_llpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_cspi_llpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_cspi_llpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_cspi_llpen),
      .dout (cur_rcc_c1_ahb1lpenr_cspi_llpen)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 cspi_flpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_cspi_flpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_cspi_flpen = wdata[3:3];
  assign rcc_c1_cspi_f_lpen              = cur_rcc_c1_ahb1lpenr_cspi_flpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_cspi_flpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_cspi_flpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_cspi_flpen),
      .dout (cur_rcc_c1_ahb1lpenr_cspi_flpen)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 mac2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_mac2lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_mac2lpen = wdata[2:2];
  assign rcc_c1_mac2_lpen              = cur_rcc_c1_ahb1lpenr_mac2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_ahb1lpenr_mac2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_mac2lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_mac2lpen),
      .dout (cur_rcc_c1_ahb1lpenr_mac2lpen)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 mac1lpen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_ahb1lpenr_mac1lpen_en  = (|wr_req & rcc_c1_ahb1lpenr_sel);
  assign nxt_rcc_c1_ahb1lpenr_mac1lpen = wdata[1:1];
  assign rcc_c1_mac1_lpen              = cur_rcc_c1_ahb1lpenr_mac1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c1_ahb1lpenr_mac1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_ahb1lpenr_mac1lpen_en),
      .din  (nxt_rcc_c1_ahb1lpenr_mac1lpen),
      .dout (cur_rcc_c1_ahb1lpenr_mac1lpen)
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
  // rcc_c1_apb1lpenr                        0x34                                    
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
  // rcc_c1_apb2lpenr                        0x38                                    
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
  // 2:2                 mpptlpen            RW                  0b0                 
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
  // 2:2                 mpptlpen            RW                  0b0                 
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
  // rcc_c1_apb3lpenr                        0x3c                                    
  // --------------------------------------------------------------------------------
  // 14:14               spl2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spl1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               mailbox2lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               mailbox1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               sysctllpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 wwdtlpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 tim1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 tim2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 gpio6lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio7lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio8lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 iwdtlpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 rtclpen             RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c1_apb3lpenr read data
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_read = {
    {17{1'b0}},
    cur_rcc_c1_apb3lpenr_spl2lpen,
    cur_rcc_c1_apb3lpenr_spl1lpen,
    cur_rcc_c1_apb3lpenr_mailbox2lpen,
    cur_rcc_c1_apb3lpenr_mailbox1lpen,
    cur_rcc_c1_apb3lpenr_sysctllpen,
    cur_rcc_c1_apb3lpenr_wwdtlpen,
    cur_rcc_c1_apb3lpenr_tim1lpen,
    cur_rcc_c1_apb3lpenr_tim2lpen,
    cur_rcc_c1_apb3lpenr_gpio6lpen,
    cur_rcc_c1_apb3lpenr_gpio7lpen,
    cur_rcc_c1_apb3lpenr_gpio8lpen,
    cur_rcc_c1_apb3lpenr_iwdtlpen,
    {2{1'b0}},
    cur_rcc_c1_apb3lpenr_rtclpen
  };

  // --------------------------------------------------------------------------------
  // 14:14               spl2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_spl2lpen_en = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_spl2lpen = wdata[14:14];
  assign rcc_c1_spl2_lpen = cur_rcc_c1_apb3lpenr_spl2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3lpenr_spl2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3lpenr_spl2lpen_en),
      .din  (nxt_rcc_c1_apb3lpenr_spl2lpen),
      .dout (cur_rcc_c1_apb3lpenr_spl2lpen)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spl1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_spl1lpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_spl1lpen = wdata[13:13];
  assign rcc_c1_spl1_lpen              = cur_rcc_c1_apb3lpenr_spl1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3lpenr_spl1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3lpenr_spl1lpen_en),
      .din  (nxt_rcc_c1_apb3lpenr_spl1lpen),
      .dout (cur_rcc_c1_apb3lpenr_spl1lpen)
  );

  // --------------------------------------------------------------------------------
  // 12:12               mailbox2lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_mailbox2lpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_mailbox2lpen = wdata[12:12];
  assign rcc_c1_mailbox2_lpen              = cur_rcc_c1_apb3lpenr_mailbox2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3lpenr_mailbox2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3lpenr_mailbox2lpen_en),
      .din  (nxt_rcc_c1_apb3lpenr_mailbox2lpen),
      .dout (cur_rcc_c1_apb3lpenr_mailbox2lpen)
  );

  // --------------------------------------------------------------------------------
  // 11:11               mailbox1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_mailbox1lpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_mailbox1lpen = wdata[11:11];
  assign rcc_c1_mailbox1_lpen              = cur_rcc_c1_apb3lpenr_mailbox1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3lpenr_mailbox1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3lpenr_mailbox1lpen_en),
      .din  (nxt_rcc_c1_apb3lpenr_mailbox1lpen),
      .dout (cur_rcc_c1_apb3lpenr_mailbox1lpen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               sysctllpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_sysctllpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_sysctllpen = wdata[10:10];
  assign rcc_c1_sysctl_lpen              = cur_rcc_c1_apb3lpenr_sysctllpen;
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
  // 9:9                 wwdtlpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_wwdtlpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_wwdtlpen = wdata[9:9];
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
  // 8:8                 tim1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_tim1lpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_tim1lpen = wdata[8:8];
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
  // 7:7                 tim2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_tim2lpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_tim2lpen = wdata[7:7];
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
  // 3:3                 iwdtlpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_iwdtlpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_iwdtlpen = wdata[3:3];
  assign rcc_c1_iwdt_lpen              = cur_rcc_c1_apb3lpenr_iwdtlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3lpenr_iwdtlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3lpenr_iwdtlpen_en),
      .din  (nxt_rcc_c1_apb3lpenr_iwdtlpen),
      .dout (cur_rcc_c1_apb3lpenr_iwdtlpen)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 rtclpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_apb3lpenr_rtclpen_en  = (|wr_req & rcc_c1_apb3lpenr_sel);
  assign nxt_rcc_c1_apb3lpenr_rtclpen = wdata[0:0];
  assign rcc_c1_rtc_lpen              = cur_rcc_c1_apb3lpenr_rtclpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_apb3lpenr_rtclpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c1_apb3lpenr_rtclpen_en),
      .din  (nxt_rcc_c1_apb3lpenr_rtclpen),
      .dout (cur_rcc_c1_apb3lpenr_rtclpen)
  );


  // --------------------------------------------------------------------------------
  // rcc_c2_ahb1enr                          0x40                                    
  // --------------------------------------------------------------------------------
  // 20:20               romen               RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 19:19               smc2en              RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 18:18               smc1en              RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 17:17               xflashen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 16:16               fften               RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               npuen               RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               dma1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               dma2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               dmaschen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               qspi1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               adcspi3en           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 adcspi2en           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 adcspi1en           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 mspien              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 hacif_l1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 hacif_f1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 cspi_len            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 cspi_fen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 mac2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 mac1en              RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 0:0                 lzen                RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c2_ahb1enr read data
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_read = {
    {11{1'b0}},
    cur_rcc_c2_ahb1enr_romen,
    cur_rcc_c2_ahb1enr_smc2en,
    cur_rcc_c2_ahb1enr_smc1en,
    cur_rcc_c2_ahb1enr_xflashen,
    cur_rcc_c2_ahb1enr_fften,
    cur_rcc_c2_ahb1enr_npuen,
    cur_rcc_c2_ahb1enr_dma1en,
    cur_rcc_c2_ahb1enr_dma2en,
    cur_rcc_c2_ahb1enr_dmaschen,
    cur_rcc_c2_ahb1enr_qspi1en,
    cur_rcc_c2_ahb1enr_adcspi3en,
    cur_rcc_c2_ahb1enr_adcspi2en,
    cur_rcc_c2_ahb1enr_adcspi1en,
    cur_rcc_c2_ahb1enr_mspien,
    cur_rcc_c2_ahb1enr_hacif_l1en,
    cur_rcc_c2_ahb1enr_hacif_f1en,
    cur_rcc_c2_ahb1enr_cspi_len,
    cur_rcc_c2_ahb1enr_cspi_fen,
    cur_rcc_c2_ahb1enr_mac2en,
    cur_rcc_c2_ahb1enr_mac1en,
    cur_rcc_c2_ahb1enr_lzen
  };

  // --------------------------------------------------------------------------------
  // 20:20               romen               RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_romen_en = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_romen = wdata[20:20];
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
  // 19:19               smc2en              RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_smc2en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_smc2en = wdata[19:19];
  assign rcc_c2_smc2_en            = cur_rcc_c2_ahb1enr_smc2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c2_ahb1enr_smc2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_smc2en_en),
      .din  (nxt_rcc_c2_ahb1enr_smc2en),
      .dout (cur_rcc_c2_ahb1enr_smc2en)
  );

  // --------------------------------------------------------------------------------
  // 18:18               smc1en              RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_smc1en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_smc1en = wdata[18:18];
  assign rcc_c2_smc1_en            = cur_rcc_c2_ahb1enr_smc1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c2_ahb1enr_smc1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_smc1en_en),
      .din  (nxt_rcc_c2_ahb1enr_smc1en),
      .dout (cur_rcc_c2_ahb1enr_smc1en)
  );

  // --------------------------------------------------------------------------------
  // 17:17               xflashen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_xflashen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_xflashen = wdata[17:17];
  assign rcc_c2_xflash_en            = cur_rcc_c2_ahb1enr_xflashen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c2_ahb1enr_xflashen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_xflashen_en),
      .din  (nxt_rcc_c2_ahb1enr_xflashen),
      .dout (cur_rcc_c2_ahb1enr_xflashen)
  );

  // --------------------------------------------------------------------------------
  // 16:16               fften               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_fften_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_fften = wdata[16:16];
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
  // 15:15               npuen               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_npuen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_npuen = wdata[15:15];
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
  // 14:14               dma1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_dma1en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_dma1en = wdata[14:14];
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
  // 13:13               dma2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_dma2en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_dma2en = wdata[13:13];
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
  // 12:12               dmaschen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_dmaschen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_dmaschen = wdata[12:12];
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
  // 11:11               qspi1en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_qspi1en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_qspi1en = wdata[11:11];
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
  // 10:10               adcspi3en           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_adcspi3en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_adcspi3en = wdata[10:10];
  assign rcc_c2_adcspi3_en            = cur_rcc_c2_ahb1enr_adcspi3en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_adcspi3en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_adcspi3en_en),
      .din  (nxt_rcc_c2_ahb1enr_adcspi3en),
      .dout (cur_rcc_c2_ahb1enr_adcspi3en)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 adcspi2en           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_adcspi2en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_adcspi2en = wdata[9:9];
  assign rcc_c2_adcspi2_en            = cur_rcc_c2_ahb1enr_adcspi2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_adcspi2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_adcspi2en_en),
      .din  (nxt_rcc_c2_ahb1enr_adcspi2en),
      .dout (cur_rcc_c2_ahb1enr_adcspi2en)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 adcspi1en           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_adcspi1en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_adcspi1en = wdata[8:8];
  assign rcc_c2_adcspi1_en            = cur_rcc_c2_ahb1enr_adcspi1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_adcspi1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_adcspi1en_en),
      .din  (nxt_rcc_c2_ahb1enr_adcspi1en),
      .dout (cur_rcc_c2_ahb1enr_adcspi1en)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 mspien              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_mspien_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_mspien = wdata[7:7];
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
  // 6:6                 hacif_l1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_hacif_l1en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_hacif_l1en = wdata[6:6];
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
  // 5:5                 hacif_f1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_hacif_f1en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_hacif_f1en = wdata[5:5];
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
  // 4:4                 cspi_len            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_cspi_len_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_cspi_len = wdata[4:4];
  assign rcc_c2_cspi_l_en            = cur_rcc_c2_ahb1enr_cspi_len;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_cspi_len (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_cspi_len_en),
      .din  (nxt_rcc_c2_ahb1enr_cspi_len),
      .dout (cur_rcc_c2_ahb1enr_cspi_len)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 cspi_fen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_cspi_fen_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_cspi_fen = wdata[3:3];
  assign rcc_c2_cspi_f_en            = cur_rcc_c2_ahb1enr_cspi_fen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_cspi_fen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_cspi_fen_en),
      .din  (nxt_rcc_c2_ahb1enr_cspi_fen),
      .dout (cur_rcc_c2_ahb1enr_cspi_fen)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 mac2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_mac2en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_mac2en = wdata[2:2];
  assign rcc_c2_mac2_en            = cur_rcc_c2_ahb1enr_mac2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1enr_mac2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_mac2en_en),
      .din  (nxt_rcc_c2_ahb1enr_mac2en),
      .dout (cur_rcc_c2_ahb1enr_mac2en)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 mac1en              RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1enr_mac1en_en  = (|wr_req & rcc_c2_ahb1enr_sel);
  assign nxt_rcc_c2_ahb1enr_mac1en = wdata[1:1];
  assign rcc_c2_mac1_en            = cur_rcc_c2_ahb1enr_mac1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c2_ahb1enr_mac1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1enr_mac1en_en),
      .din  (nxt_rcc_c2_ahb1enr_mac1en),
      .dout (cur_rcc_c2_ahb1enr_mac1en)
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
  // rcc_c2_apb1enr                          0x44                                    
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
    cur_rcc_c2_apb1enr_i2c1en,
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
  // 6:6                 i2c1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1enr_i2c1en_en  = (|wr_req & rcc_c2_apb1enr_sel);
  assign nxt_rcc_c2_apb1enr_i2c1en = wdata[6:6];
  assign rcc_c2_i2c1_en            = cur_rcc_c2_apb1enr_i2c1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1enr_i2c1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1enr_i2c1en_en),
      .din  (nxt_rcc_c2_apb1enr_i2c1en),
      .dout (cur_rcc_c2_apb1enr_i2c1en)
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
  // rcc_c2_apb2enr                          0x48                                    
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
  // 2:2                 mppten              RW                  0b0                 
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
  // 2:2                 mppten              RW                  0b0                 
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
  // rcc_c2_apb3enr                          0x4c                                    
  // --------------------------------------------------------------------------------
  // 14:14               spl2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spl1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               mailbox2en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               mailbox1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               sysctlen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 wwdten              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 tim1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 tim2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 gpio6en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio7en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio8en             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 iwdten              RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 rtcen               RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c2_apb3enr read data
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_read = {
    {17{1'b0}},
    cur_rcc_c2_apb3enr_spl2en,
    cur_rcc_c2_apb3enr_spl1en,
    cur_rcc_c2_apb3enr_mailbox2en,
    cur_rcc_c2_apb3enr_mailbox1en,
    cur_rcc_c2_apb3enr_sysctlen,
    cur_rcc_c2_apb3enr_wwdten,
    cur_rcc_c2_apb3enr_tim1en,
    cur_rcc_c2_apb3enr_tim2en,
    cur_rcc_c2_apb3enr_gpio6en,
    cur_rcc_c2_apb3enr_gpio7en,
    cur_rcc_c2_apb3enr_gpio8en,
    cur_rcc_c2_apb3enr_iwdten,
    {2{1'b0}},
    cur_rcc_c2_apb3enr_rtcen
  };

  // --------------------------------------------------------------------------------
  // 14:14               spl2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_spl2en_en = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_spl2en = wdata[14:14];
  assign rcc_c2_spl2_en = cur_rcc_c2_apb3enr_spl2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3enr_spl2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3enr_spl2en_en),
      .din  (nxt_rcc_c2_apb3enr_spl2en),
      .dout (cur_rcc_c2_apb3enr_spl2en)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spl1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_spl1en_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_spl1en = wdata[13:13];
  assign rcc_c2_spl1_en            = cur_rcc_c2_apb3enr_spl1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3enr_spl1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3enr_spl1en_en),
      .din  (nxt_rcc_c2_apb3enr_spl1en),
      .dout (cur_rcc_c2_apb3enr_spl1en)
  );

  // --------------------------------------------------------------------------------
  // 12:12               mailbox2en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_mailbox2en_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_mailbox2en = wdata[12:12];
  assign rcc_c2_mailbox2_en            = cur_rcc_c2_apb3enr_mailbox2en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3enr_mailbox2en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3enr_mailbox2en_en),
      .din  (nxt_rcc_c2_apb3enr_mailbox2en),
      .dout (cur_rcc_c2_apb3enr_mailbox2en)
  );

  // --------------------------------------------------------------------------------
  // 11:11               mailbox1en          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_mailbox1en_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_mailbox1en = wdata[11:11];
  assign rcc_c2_mailbox1_en            = cur_rcc_c2_apb3enr_mailbox1en;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3enr_mailbox1en (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3enr_mailbox1en_en),
      .din  (nxt_rcc_c2_apb3enr_mailbox1en),
      .dout (cur_rcc_c2_apb3enr_mailbox1en)
  );

  // --------------------------------------------------------------------------------
  // 10:10               sysctlen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_sysctlen_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_sysctlen = wdata[10:10];
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
  // 9:9                 wwdten              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_wwdten_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_wwdten = wdata[9:9];
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
  // 8:8                 tim1en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_tim1en_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_tim1en = wdata[8:8];
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
  // 7:7                 tim2en              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_tim2en_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_tim2en = wdata[7:7];
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
  // 3:3                 iwdten              RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_iwdten_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_iwdten = wdata[3:3];
  assign rcc_c2_iwdt_en            = cur_rcc_c2_apb3enr_iwdten;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3enr_iwdten (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3enr_iwdten_en),
      .din  (nxt_rcc_c2_apb3enr_iwdten),
      .dout (cur_rcc_c2_apb3enr_iwdten)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 rtcen               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3enr_rtcen_en  = (|wr_req & rcc_c2_apb3enr_sel);
  assign nxt_rcc_c2_apb3enr_rtcen = wdata[0:0];
  assign rcc_c2_rtc_en            = cur_rcc_c2_apb3enr_rtcen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3enr_rtcen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3enr_rtcen_en),
      .din  (nxt_rcc_c2_apb3enr_rtcen),
      .dout (cur_rcc_c2_apb3enr_rtcen)
  );


  // --------------------------------------------------------------------------------
  // rcc_c2_ahb1lpenr                        0x50                                    
  // --------------------------------------------------------------------------------
  // 20:20               romlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 19:19               smc2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 18:18               smc1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 17:17               xflashlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 16:16               fftlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 15:15               npulpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 14:14               dma1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               dma2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               dmaschlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               qspi1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               adcspi3lpen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 adcspi2lpen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 adcspi1lpen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 mspilpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 hacif_l1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 hacif_f1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 cspi_llpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 cspi_flpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 2:2                 mac2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 1:1                 mac1lpen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  // 0:0                 lzlpen              RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c2_ahb1lpenr read data
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_read = {
    {11{1'b0}},
    cur_rcc_c2_ahb1lpenr_romlpen,
    cur_rcc_c2_ahb1lpenr_smc2lpen,
    cur_rcc_c2_ahb1lpenr_smc1lpen,
    cur_rcc_c2_ahb1lpenr_xflashlpen,
    cur_rcc_c2_ahb1lpenr_fftlpen,
    cur_rcc_c2_ahb1lpenr_npulpen,
    cur_rcc_c2_ahb1lpenr_dma1lpen,
    cur_rcc_c2_ahb1lpenr_dma2lpen,
    cur_rcc_c2_ahb1lpenr_dmaschlpen,
    cur_rcc_c2_ahb1lpenr_qspi1lpen,
    cur_rcc_c2_ahb1lpenr_adcspi3lpen,
    cur_rcc_c2_ahb1lpenr_adcspi2lpen,
    cur_rcc_c2_ahb1lpenr_adcspi1lpen,
    cur_rcc_c2_ahb1lpenr_mspilpen,
    cur_rcc_c2_ahb1lpenr_hacif_l1lpen,
    cur_rcc_c2_ahb1lpenr_hacif_f1lpen,
    cur_rcc_c2_ahb1lpenr_cspi_llpen,
    cur_rcc_c2_ahb1lpenr_cspi_flpen,
    cur_rcc_c2_ahb1lpenr_mac2lpen,
    cur_rcc_c2_ahb1lpenr_mac1lpen,
    cur_rcc_c2_ahb1lpenr_lzlpen
  };

  // --------------------------------------------------------------------------------
  // 20:20               romlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_romlpen_en = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_romlpen = wdata[20:20];
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
  // 19:19               smc2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_smc2lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_smc2lpen = wdata[19:19];
  assign rcc_c2_smc2_lpen              = cur_rcc_c2_ahb1lpenr_smc2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_smc2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_smc2lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_smc2lpen),
      .dout (cur_rcc_c2_ahb1lpenr_smc2lpen)
  );

  // --------------------------------------------------------------------------------
  // 18:18               smc1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_smc1lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_smc1lpen = wdata[18:18];
  assign rcc_c2_smc1_lpen              = cur_rcc_c2_ahb1lpenr_smc1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_smc1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_smc1lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_smc1lpen),
      .dout (cur_rcc_c2_ahb1lpenr_smc1lpen)
  );

  // --------------------------------------------------------------------------------
  // 17:17               xflashlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_xflashlpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_xflashlpen = wdata[17:17];
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
  // 16:16               fftlpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_fftlpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_fftlpen = wdata[16:16];
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
  // 15:15               npulpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_npulpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_npulpen = wdata[15:15];
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
  // 14:14               dma1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_dma1lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_dma1lpen = wdata[14:14];
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
  // 13:13               dma2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_dma2lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_dma2lpen = wdata[13:13];
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
  // 12:12               dmaschlpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_dmaschlpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_dmaschlpen = wdata[12:12];
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
  // 11:11               qspi1lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_qspi1lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_qspi1lpen = wdata[11:11];
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
  // 10:10               adcspi3lpen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_adcspi3lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_adcspi3lpen = wdata[10:10];
  assign rcc_c2_adcspi3_lpen              = cur_rcc_c2_ahb1lpenr_adcspi3lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_adcspi3lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_adcspi3lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_adcspi3lpen),
      .dout (cur_rcc_c2_ahb1lpenr_adcspi3lpen)
  );

  // --------------------------------------------------------------------------------
  // 9:9                 adcspi2lpen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_adcspi2lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_adcspi2lpen = wdata[9:9];
  assign rcc_c2_adcspi2_lpen              = cur_rcc_c2_ahb1lpenr_adcspi2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_adcspi2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_adcspi2lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_adcspi2lpen),
      .dout (cur_rcc_c2_ahb1lpenr_adcspi2lpen)
  );

  // --------------------------------------------------------------------------------
  // 8:8                 adcspi1lpen         RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_adcspi1lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_adcspi1lpen = wdata[8:8];
  assign rcc_c2_adcspi1_lpen              = cur_rcc_c2_ahb1lpenr_adcspi1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_adcspi1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_adcspi1lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_adcspi1lpen),
      .dout (cur_rcc_c2_ahb1lpenr_adcspi1lpen)
  );

  // --------------------------------------------------------------------------------
  // 7:7                 mspilpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_mspilpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_mspilpen = wdata[7:7];
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
  // 6:6                 hacif_l1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_hacif_l1lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_hacif_l1lpen = wdata[6:6];
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
  // 5:5                 hacif_f1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_hacif_f1lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_hacif_f1lpen = wdata[5:5];
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
  // 4:4                 cspi_llpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_cspi_llpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_cspi_llpen = wdata[4:4];
  assign rcc_c2_cspi_l_lpen              = cur_rcc_c2_ahb1lpenr_cspi_llpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_cspi_llpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_cspi_llpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_cspi_llpen),
      .dout (cur_rcc_c2_ahb1lpenr_cspi_llpen)
  );

  // --------------------------------------------------------------------------------
  // 3:3                 cspi_flpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_cspi_flpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_cspi_flpen = wdata[3:3];
  assign rcc_c2_cspi_f_lpen              = cur_rcc_c2_ahb1lpenr_cspi_flpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_cspi_flpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_cspi_flpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_cspi_flpen),
      .dout (cur_rcc_c2_ahb1lpenr_cspi_flpen)
  );

  // --------------------------------------------------------------------------------
  // 2:2                 mac2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_mac2lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_mac2lpen = wdata[2:2];
  assign rcc_c2_mac2_lpen              = cur_rcc_c2_ahb1lpenr_mac2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_ahb1lpenr_mac2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_mac2lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_mac2lpen),
      .dout (cur_rcc_c2_ahb1lpenr_mac2lpen)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 mac1lpen            RW                  0b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_ahb1lpenr_mac1lpen_en  = (|wr_req & rcc_c2_ahb1lpenr_sel);
  assign nxt_rcc_c2_ahb1lpenr_mac1lpen = wdata[1:1];
  assign rcc_c2_mac1_lpen              = cur_rcc_c2_ahb1lpenr_mac1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_c2_ahb1lpenr_mac1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_ahb1lpenr_mac1lpen_en),
      .din  (nxt_rcc_c2_ahb1lpenr_mac1lpen),
      .dout (cur_rcc_c2_ahb1lpenr_mac1lpen)
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
  // rcc_c2_apb1lpenr                        0x54                                    
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
    cur_rcc_c2_apb1lpenr_i2c1lpen,
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
  // 6:6                 i2c1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb1lpenr_i2c1lpen_en  = (|wr_req & rcc_c2_apb1lpenr_sel);
  assign nxt_rcc_c2_apb1lpenr_i2c1lpen = wdata[6:6];
  assign rcc_c2_i2c1_lpen              = cur_rcc_c2_apb1lpenr_i2c1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb1lpenr_i2c1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb1lpenr_i2c1lpen_en),
      .din  (nxt_rcc_c2_apb1lpenr_i2c1lpen),
      .dout (cur_rcc_c2_apb1lpenr_i2c1lpen)
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
  // rcc_c2_apb2lpenr                        0x58                                    
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
  // 2:2                 mpptlpen            RW                  0b0                 
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
  // 2:2                 mpptlpen            RW                  0b0                 
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
  // rcc_c2_apb3lpenr                        0x5c                                    
  // --------------------------------------------------------------------------------
  // 14:14               spl2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 13:13               spl1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 12:12               mailbox2lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 11:11               mailbox1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 10:10               sysctllpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 9:9                 wwdtlpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 8:8                 tim1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 7:7                 tim2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 6:6                 gpio6lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 5:5                 gpio7lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 4:4                 gpio8lpen           RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 3:3                 iwdtlpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  // 0:0                 rtclpen             RW                  0b0                 
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // rcc_c2_apb3lpenr read data
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_read = {
    {17{1'b0}},
    cur_rcc_c2_apb3lpenr_spl2lpen,
    cur_rcc_c2_apb3lpenr_spl1lpen,
    cur_rcc_c2_apb3lpenr_mailbox2lpen,
    cur_rcc_c2_apb3lpenr_mailbox1lpen,
    cur_rcc_c2_apb3lpenr_sysctllpen,
    cur_rcc_c2_apb3lpenr_wwdtlpen,
    cur_rcc_c2_apb3lpenr_tim1lpen,
    cur_rcc_c2_apb3lpenr_tim2lpen,
    cur_rcc_c2_apb3lpenr_gpio6lpen,
    cur_rcc_c2_apb3lpenr_gpio7lpen,
    cur_rcc_c2_apb3lpenr_gpio8lpen,
    cur_rcc_c2_apb3lpenr_iwdtlpen,
    {2{1'b0}},
    cur_rcc_c2_apb3lpenr_rtclpen
  };

  // --------------------------------------------------------------------------------
  // 14:14               spl2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_spl2lpen_en = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_spl2lpen = wdata[14:14];
  assign rcc_c2_spl2_lpen = cur_rcc_c2_apb3lpenr_spl2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3lpenr_spl2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3lpenr_spl2lpen_en),
      .din  (nxt_rcc_c2_apb3lpenr_spl2lpen),
      .dout (cur_rcc_c2_apb3lpenr_spl2lpen)
  );

  // --------------------------------------------------------------------------------
  // 13:13               spl1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_spl1lpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_spl1lpen = wdata[13:13];
  assign rcc_c2_spl1_lpen              = cur_rcc_c2_apb3lpenr_spl1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3lpenr_spl1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3lpenr_spl1lpen_en),
      .din  (nxt_rcc_c2_apb3lpenr_spl1lpen),
      .dout (cur_rcc_c2_apb3lpenr_spl1lpen)
  );

  // --------------------------------------------------------------------------------
  // 12:12               mailbox2lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_mailbox2lpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_mailbox2lpen = wdata[12:12];
  assign rcc_c2_mailbox2_lpen              = cur_rcc_c2_apb3lpenr_mailbox2lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3lpenr_mailbox2lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3lpenr_mailbox2lpen_en),
      .din  (nxt_rcc_c2_apb3lpenr_mailbox2lpen),
      .dout (cur_rcc_c2_apb3lpenr_mailbox2lpen)
  );

  // --------------------------------------------------------------------------------
  // 11:11               mailbox1lpen        RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_mailbox1lpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_mailbox1lpen = wdata[11:11];
  assign rcc_c2_mailbox1_lpen              = cur_rcc_c2_apb3lpenr_mailbox1lpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3lpenr_mailbox1lpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3lpenr_mailbox1lpen_en),
      .din  (nxt_rcc_c2_apb3lpenr_mailbox1lpen),
      .dout (cur_rcc_c2_apb3lpenr_mailbox1lpen)
  );

  // --------------------------------------------------------------------------------
  // 10:10               sysctllpen          RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_sysctllpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_sysctllpen = wdata[10:10];
  assign rcc_c2_sysctl_lpen              = cur_rcc_c2_apb3lpenr_sysctllpen;
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
  // 9:9                 wwdtlpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_wwdtlpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_wwdtlpen = wdata[9:9];
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
  // 8:8                 tim1lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_tim1lpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_tim1lpen = wdata[8:8];
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
  // 7:7                 tim2lpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_tim2lpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_tim2lpen = wdata[7:7];
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
  // 3:3                 iwdtlpen            RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_iwdtlpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_iwdtlpen = wdata[3:3];
  assign rcc_c2_iwdt_lpen              = cur_rcc_c2_apb3lpenr_iwdtlpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3lpenr_iwdtlpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3lpenr_iwdtlpen_en),
      .din  (nxt_rcc_c2_apb3lpenr_iwdtlpen),
      .dout (cur_rcc_c2_apb3lpenr_iwdtlpen)
  );

  // --------------------------------------------------------------------------------
  // 0:0                 rtclpen             RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_apb3lpenr_rtclpen_en  = (|wr_req & rcc_c2_apb3lpenr_sel);
  assign nxt_rcc_c2_apb3lpenr_rtclpen = wdata[0:0];
  assign rcc_c2_rtc_lpen              = cur_rcc_c2_apb3lpenr_rtclpen;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_apb3lpenr_rtclpen (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (rcc_c2_apb3lpenr_rtclpen_en),
      .din  (nxt_rcc_c2_apb3lpenr_rtclpen),
      .dout (cur_rcc_c2_apb3lpenr_rtclpen)
  );


endmodule
