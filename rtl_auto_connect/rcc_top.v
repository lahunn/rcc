// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : RCC TOP MODULE
// ****************************************************************
module rcc_top #(
    parameter CLK_ON_AFTER_PER_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_SYS_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_D1_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_D2_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_CPU1_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_CPU2_RST_RELEASE = 8,
    parameter D2_RST_DURATION = 10,
    parameter D1_RST_DURATION = 10,
    // ================================================================================
    // CONFIGURABLE PARAMETERS
    // ================================================================================
    parameter AW = 29,
    parameter DW = 32,
    parameter WW = DW / 8
) (
    // Beginning of automatic inputs (from unused autoinst inputs)
    //clock input from PAD
    input           i2s_clk_in,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input           usb_phy1,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // bus bridge signals
    //================================================================
    input           ahb1bridge_d2_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input           ahb2bridge_d2_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input           ahb3bridge_d1_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input           ahb4bridge_d3_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input           apb1bridge_d2_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input           apb2bridge_d2_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input           apb3bridge_d1_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input           apb4bridge_d3_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input           axibridge_d1_busy,          // To u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // pwr signals
    //================================================================
    input           d3_deepsleep,               // To u_rcc_vcore_top of rcc_vcore_top.v
    input           backup_protect,             // To u_rcc_vcore_top of rcc_vcore_top.v
    input           lpwr1_rst,                  // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input           lpwr2_rst,                  // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input           pwr_bor_rst,                // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input           pwr_d1_ok,                  // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pwr_d1_wkup,                // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pwr_d2_ok,                  // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pwr_d2_wkup,                // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pwr_d3_wkup,                // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pwr_por_rst,                // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input           pwr_vcore_ok,               // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pwr_vsw_rst,                // To u_rcc_vsw_top of rcc_vsw_top.v, ...
    //================================================================
    // cpu signals
    //================================================================
    input           c1_deepsleep,               // To u_rcc_vcore_top of rcc_vcore_top.v
    input           c1_sleep,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    input           c2_deepsleep,               // To u_rcc_vcore_top of rcc_vcore_top.v
    input           c2_sleep,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    input           cpu1_sftrst,                // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input           cpu2_sftrst,                // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    //================================================================
    // triming signals
    //================================================================
    input  [   9:0] crs_hsi48_trim,             // To u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // oscilator signals
    //================================================================
    //csi
    input           csi_origin_clk,             // To u_rcc_vcore_top of rcc_vcore_top.v
    input           csi_rdy,                    // To u_rcc_vcore_top of rcc_vcore_top.v
    //hse
    input           hse_origin_clk,             // To u_rcc_vcore_top of rcc_vcore_top.v
    input           hse_rdy,                    // To u_rcc_vcore_top of rcc_vcore_top.v
    input           hsecss_fail,                // To u_rcc_vcore_top of rcc_vcore_top.v
    //hsi 48
    input           hsi48_origin_clk,           // To u_rcc_vcore_top of rcc_vcore_top.v
    input           hsi48_rdy,                  // To u_rcc_vcore_top of rcc_vcore_top.v
    //hsi
    input           hsi_origin_clk,             // To u_rcc_vcore_top of rcc_vcore_top.v
    input           hsi_rdy,                    // To u_rcc_vcore_top of rcc_vcore_top.v
    //lse
    input           lse_clk,                    // To u_rcc_vsw_top of rcc_vsw_top.v, ...
    input           lse_rdy,                    // To u_rcc_vcore_top of rcc_vcore_top.v
    input           lsecss_fail,                // To u_rcc_vsw_top of rcc_vsw_top.v, ...
    //lsi
    input           lsi_clk,                    // To u_rcc_vsw_top of rcc_vsw_top.v, ...
    input           lsi_rdy,                    // To u_rcc_vcore_top of rcc_vcore_top.v
    //eth
    input           eth_rcc_epis_2,             // To u_rcc_vcore_top of rcc_vcore_top.v
    input           eth_rcc_fes,                // To u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // falsh signals
    //================================================================
    input           flash_busy,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input  [   7:0] flash_csi_opt,              // To u_rcc_vcore_top of rcc_vcore_top.v
    input  [  11:0] flash_hsi_opt,              // To u_rcc_vcore_top of rcc_vcore_top.v
    input           flash_obl_reload,           // To u_rcc_vcore_top of rcc_vcore_top.v
    input           flash_power_ok,             // To u_rcc_vcore_top of rcc_vcore_top.v
    input           obl_done,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // ahb lite bus
    //================================================================
    input  [  31:0] haddr,                      // To u_rcc_vcore_top of rcc_vcore_top.v
    input           hmaster,                    // To u_rcc_vcore_top of rcc_vcore_top.v
    input           hready,                     // To u_rcc_vcore_top of rcc_vcore_top.v
    input           hsel,                       // To u_rcc_vcore_top of rcc_vcore_top.v
    input  [   2:0] hsize,                      // To u_rcc_vcore_top of rcc_vcore_top.v
    input  [   1:0] htrans,                     // To u_rcc_vcore_top of rcc_vcore_top.v
    input  [DW-1:0] hwdata,                     // To u_rcc_vcore_top of rcc_vcore_top.v
    input           hwrite,                     // To u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // peripheral signals
    //================================================================
    //ker clk req
    input           i2c1_ker_clk_req,           // To u_rcc_vcore_top of rcc_vcore_top.v
    input           i2c2_ker_clk_req,           // To u_rcc_vcore_top of rcc_vcore_top.v
    input           i2c3_ker_clk_req,           // To u_rcc_vcore_top of rcc_vcore_top.v
    input           i2c4_ker_clk_req,           // To u_rcc_vcore_top of rcc_vcore_top.v
    input           lpuart1_ker_clk_req,        // To u_rcc_vcore_top of rcc_vcore_top.v
    input           uart4_ker_clk_req,          // To u_rcc_vcore_top of rcc_vcore_top.v
    input           uart5_ker_clk_req,          // To u_rcc_vcore_top of rcc_vcore_top.v
    input           uart7_ker_clk_req,          // To u_rcc_vcore_top of rcc_vcore_top.v
    input           uart8_ker_clk_req,          // To u_rcc_vcore_top of rcc_vcore_top.v
    input           usart1_ker_clk_req,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input           usart2_ker_clk_req,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input           usart3_ker_clk_req,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input           usart6_ker_clk_req,         // To u_rcc_vcore_top of rcc_vcore_top.v
    //iwdg
    input           iwdg1_out_rst,              // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input           iwdg2_out_rst,              // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    //wwdg
    input           wwdg1_out_rst,              // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input           wwdg2_out_rst,              // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input           pad_rcc_eth_mii_rx_clk,     // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pad_rcc_eth_mii_tx_clk,     // To u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // NRST PAD
    //================================================================
    input           nrst_in,                    // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    //================================================================
    // PLL signals
    //================================================================
    input           pll1_p_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pll1_q_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pll1_rdy,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pll2_p_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pll2_q_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pll2_r_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pll2_rdy,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pll3_p_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pll3_q_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pll3_r_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input           pll3_rdy,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // ARCG ON
    //================================================================
    input           rcc_arcg_on,                // To u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // TESTMODE
    //================================================================
    input           testmode,                   // To u_rcc_vsw_top of rcc_vsw_top.v, ...
    input           test_rst_n,
    input           test_clk,
    input           scan_mode,
    input           atspeed_mode,
    input           atspeed_test_clk,
    //================================================================
    // CPU signals
    //================================================================
    output          rcc_c1_rst_n,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_c2_rst_n,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_c1_clk,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_c1_systick_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_c2_clk,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_c2_systick_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // Oscillator signals
    //================================================================
    output          csikeron,                   // From u_rcc_vcore_top of rcc_vcore_top.v
    output          csion,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          hsebyp,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          hsecsson,                   // From u_rcc_vcore_top of rcc_vcore_top.v
    output          hseon,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          hsi48on,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output          hsikeron,                   // From u_rcc_vcore_top of rcc_vcore_top.v
    output          hsion,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          lsebyp,                     // From u_rcc_vsw_top of rcc_vsw_top.v
    output          lsecssd,                    // From u_rcc_vsw_top of rcc_vsw_top.v
    output          lsecsson,                   // From u_rcc_vsw_top of rcc_vsw_top.v
    output [   1:0] lsedrv,                     // From u_rcc_vsw_top of rcc_vsw_top.v
    output          lseon,                      // From u_rcc_vsw_top of rcc_vsw_top.v
    //triming signals
    output [   7:0] rcc_csi_triming,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output [  11:0] rcc_hsi_triming,            // From u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // BUS bridge signals
    //================================================================
    output          d1_bus_rst_n,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          d2_bus_rst_n,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          d3_bus_rst_n,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          c1_to_axi_div_en,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          d1_h2b_div_en,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          d2_h2b1_div_en,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          d2_h2b2_div_en,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          d3_h2b_div_en,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_ahb1bridge_d2_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_ahb2bridge_d2_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_ahb3bridge_d1_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_ahb4bridge_d3_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_apb1bridge_d2_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_apb2bridge_d2_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_apb3bridge_d1_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_apb4bridge_d3_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_axibridge_d1_clk,       // From u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // PLL signals
    //================================================================
    output          pll1_src_clk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          pll1fracen,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output          pll1on,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   1:0] pll1rge,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output          pll1vcosel,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output          pll2_src_clk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          pll2fracen,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output          pll2on,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   1:0] pll2rge,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output          pll2vcosel,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output          pll3_src_clk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          pll3fracen,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output          pll3on,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   1:0] pll3rge,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output          pll3vcosel,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   8:0] divn1,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   8:0] divn2,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   8:0] divn3,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   6:0] divp1,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          divp1en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   6:0] divp2,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          divp2en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   6:0] divp3,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          divp3en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   6:0] divq1,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          divq1en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   6:0] divq2,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          divq2en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   6:0] divq3,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          divq3en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   6:0] divr1,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          divr1en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   6:0] divr2,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          divr2en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   6:0] divr3,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          divr3en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [  12:0] fracn1,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output [  12:0] fracn2,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output [  12:0] fracn3,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // AHB lite bus
    //================================================================
    output [DW-1:0] hrdata,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          hreadyout,                  // From u_rcc_vcore_top of rcc_vcore_top.v
    output          hresp,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    //MCO signals
    //================================================================
    output          mco1,                       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          mco2,                       // From u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // NRST PAD
    //================================================================
    output          nrst_out,                   // From u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // VSW domain reset signals
    //================================================================
    output          vsw_rst_n,                  // From u_rcc_vsw_top of rcc_vsw_top.v
    output          sync_vsw_rst_n,             // sync with sys_clk
    output          rtc_clk_sync_vsw_rst_n,     // From u_rcc_vsw_top of rcc_vsw_top.v
    //================================================================
    // interrupt signals
    //================================================================
    output          rcc_hsecss_it,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lsecss_it,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_it,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // peripheral clock and reset
    //================================================================
    output          rcc_adc12_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_adc12_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_adc12_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_adc3_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_adc3_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_adc3_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_axisram_aclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_axisram_sync_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_bdma_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_bdma_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_bkpram_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_bkpram_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_comp12_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_comp12_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_crc_hclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_crc_sync_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_crs_pclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_crs_sync_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_crypt_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_crypt_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dac12_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dac12_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dcmi_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dcmi_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   1:0] rcc_dfsdm1_ker_clks,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dfsdm1_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dfsdm1_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dma1_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dma1_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dma2_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dma2_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dma2d_aclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dma2d_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dma2d_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dtcm1_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dtcm1_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dtcm2_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dtcm2_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_eth1mac_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_eth1mac_sync_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_eth1rx_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_eth1rx_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_eth1tx_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_eth1tx_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_eth_mii_rx_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_eth_mii_tx_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_eth_rmii_ref_clk,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_exti_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_exti_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_fclk_c1,                // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_fclk_c2,                // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_fdcan_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_fdcan_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_fdcan_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_flash_aclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_flash_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_flash_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_fmc_aclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_fmc_hclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_fmc_ker_clk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_fmc_sync_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpioa_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpioa_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpiob_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpiob_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpioc_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpioc_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpiod_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpiod_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpioe_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpioe_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpiof_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpiof_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpiog_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpiog_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpioh_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpioh_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpioi_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpioi_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpioj_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpioj_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpiok_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpiok_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpv_hclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpv_sync_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hash_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hash_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hdmicec_ker_clk,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hdmicec_pclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hdmicec_sync_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hrtim_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hrtim_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hrtim_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hrtimer_prescalar_clk,  // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hsem_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hsem_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c1_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c1_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c1_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c2_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c2_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c2_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c3_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c3_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c3_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c4_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c4_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c4_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_itcm_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_itcm_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_iwdg1_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_iwdg1_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_iwdg2_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_iwdg2_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_jpgdec_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_jpgdec_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim1_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim1_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim1_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim2_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim2_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim2_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim3_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim3_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim3_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim4_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim4_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim4_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim5_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim5_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lptim5_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lpuart1_ker_clk,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lpuart1_pclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lpuart1_sync_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_ltdc_aclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_ltdc_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_ltdc_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_ltdc_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mdios_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mdios_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mdma_aclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mdma_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mdma_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_obl_clk,                // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_obl_rst_n,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_opamp_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_opamp_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_pwr_d1_req,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_pwr_d2_req,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_pwr_d3_req,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_pwr_hclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_pwr_sync_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_qspi_aclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_qspi_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_qspi_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_qspi_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_ramecc1_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_ramecc1_sync_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_ramecc2_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_ramecc2_sync_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_ramecc3_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_ramecc3_sync_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_rng_hclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_rng_ker_clk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_rng_sync_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_rtc_ker_clk,            // From u_rcc_vsw_top of rcc_vsw_top.v
    output          rcc_rtc_pclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_rtc_sync_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sai1_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sai1_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sai1_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sai2_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sai2_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sai2_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sai3_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sai3_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sai3_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output [   1:0] rcc_sai4_ker_clks,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sai4_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sai4_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sdmmc1_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sdmmc1_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sdmmc1_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sdmmc2_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sdmmc2_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sdmmc2_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spdifrx_ker_clk,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spdifrx_pclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spdifrx_sync_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi1_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi1_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi1_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi2_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi2_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi2_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi3_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi3_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi3_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi4_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi4_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi4_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi5_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi5_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi5_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi6_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi6_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi6_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sram1_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sram1_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sram2_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sram2_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sram3_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sram3_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sram4_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sram4_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_swpmi_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_swpmi_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_swpmi_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_syscfg_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_syscfg_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim12_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim12_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim12_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim13_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim13_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim13_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim14_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim14_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim14_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim15_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim15_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim15_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim16_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim16_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim16_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim17_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim17_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim17_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim1_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim1_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim1_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim2_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim2_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim2_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim3_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim3_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim3_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim4_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim4_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim4_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim5_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim5_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim5_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim6_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim6_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim6_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim7_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim7_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim7_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim8_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim8_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim8_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_timx_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_timy_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart4_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart4_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart4_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart5_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart5_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart5_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart7_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart7_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart7_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart8_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart8_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart8_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usart1_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usart1_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usart1_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usart2_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usart2_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usart2_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usart3_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usart3_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usart3_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usart6_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usart6_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usart6_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usb1otg_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usb1otg_ker_clk,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usb1otg_sync_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usb1ulpi_hclk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usb1ulpi_ker_clk,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usb1ulpi_sync_rst_n,    // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usb2otg_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usb2otg_ker_clk,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usb2otg_sync_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usb2ulpi_hclk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_usb2ulpi_sync_rst_n,    // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_vref_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_vref_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_wwdg1_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_wwdg1_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_wwdg2_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_wwdg2_sync_rst_n        // From u_rcc_vcore_top of rcc_vcore_top.v
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);

  /*AUTOWIRE*/
  /*AUTO DECLARE*/

  //INSTANTCE

  rcc_vsw_top u_rcc_vsw_top (
      .gen_lse_clk  (gen_lse_clk)
      /*AUTOINST*/
  );

  rcc_vdd_top u_rcc_vdd_top (
      .rcc_vdd_wdata(rcc_vdd_wdata),
      .gen_lsi_clk  (gen_lsi_clk)
      /*AUTOINST*/
  );

  rcc_vcore_top #(  /*AUTOINSTPARAM*/
  ) u_rcc_vcore_top (
      .lsi_clk                   (gen_lsi_clk),
      .lse_clk                   (gen_lse_clk),
      .raw_i2s_clk_in            (i2s_clk_in),
      .raw_i2s_clk_in            (i2s_clk_in),
      .raw_usb_phy1              (usb_phy1),
      .raw_csi_origin_clk        (csi_origin_clk),
      .raw_hse_origin_clk        (hse_origin_clk),
      .raw_hsi48_origin_clk      (hsi48_origin_clk),
      .raw_hsi_origin_clk        (hsi_origin_clk),
      .raw_pad_rcc_eth_mii_tx_clk(pad_rcc_eth_mii_tx_clk),
      .raw_pad_rcc_eth_mii_rx_clk(pad_rcc_eth_mii_rx_clk),
      .raw_pll1_p_clk            (pll1_p_clk),
      .raw_pll1_q_clk            (pll1_q_clk),
      .raw_pll2_p_clk            (pll2_p_clk),
      .raw_pll2_q_clk            (pll2_q_clk),
      .raw_pll2_r_clk            (pll2_r_clk),
      .raw_pll3_p_clk            (pll3_p_clk),
      .raw_pll3_q_clk            (pll3_q_clk),
      .raw_pll3_r_clk            (pll3_r_clk)
      /*AUTOINST*/
  );


endmodule
