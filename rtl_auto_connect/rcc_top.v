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
    input           mac1_rcc_epis_2,            // To u_rcc_vcore_top of rcc_vcore_top.v
    input           mac1_rcc_fes,               // To u_rcc_vcore_top of rcc_vcore_top.v
    input           mac2_rcc_epis_2,            // To u_rcc_vcore_top of rcc_vcore_top.v
    input           mac2_rcc_fes,               // To u_rcc_vcore_top of rcc_vcore_top.v
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
    //iwdg
    input           iwdg1_out_rst,              // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input           iwdg2_out_rst,              // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    //wwdg
    input           wwdg1_out_rst,              // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input           wwdg2_out_rst,              // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input           pad_rcc_mac1_mii_tx_clk,
    input           pad_rcc_mac1_mii_rx_clk,
    input           pad_rcc_mac2_mii_tx_clk,
    input           pad_rcc_mac2_mii_rx_clk,
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
    input           mbist_mode,
    //================================================================
    // sel and div signals at atspeed mode
    //================================================================
    //select signals for atspeed mode
    input  [   1:0] atspeed_pllsrc,
    input  [   2:0] atspeed_mco1sel,
    input  [   2:0] atspeed_mco2sel,
    input  [   1:0] atspeed_sw,
    input           atspeed_hrtimsel,
    input  [   1:0] atspeed_clkpersel,
    //division ratio signals for atspeed mode
    input  [   1:0] atspeed_hsidiv,
    input  [   5:0] atspeed_divm1,
    input  [   5:0] atspeed_divm2,
    input  [   5:0] atspeed_divm3,
    input  [   3:0] atspeed_mco1pre,
    input  [   3:0] atspeed_mco2pre,
    input  [   5:0] atspeed_rtcpre,
    input  [   3:0] atspeed_d1cpre,
    input  [   2:0] atspeed_d1ppre,
    input  [   3:0] atspeed_hpre,
    input  [   2:0] atspeed_d2ppre1,
    input  [   2:0] atspeed_d2ppre2,
    input  [   2:0] atspeed_d3ppre,
    input           atspeed_timpre,
    input           atspeed_mac1_rcc_fes,
    input           atspeed_mac1_rcc_epis_2,
    input           atspeed_mac2_rcc_fes,
    input           atspeed_mac2_rcc_epis_2,
    //================================================================
    // sel and div signals at mbist mode
    //================================================================
    input  [   1:0] mbist_pllsrc,
    input  [   2:0] mbist_mco1sel,
    input  [   2:0] mbist_mco2sel,
    input  [   1:0] mbist_sw,
    input           mbist_hrtimsel,
    input  [   1:0] mbist_clkpersel,
    //division ratio signals for mbist mode
    input  [   1:0] mbist_hsidiv,
    input  [   5:0] mbist_divm1,
    input  [   5:0] mbist_divm2,
    input  [   5:0] mbist_divm3,
    input  [   3:0] mbist_mco1pre,
    input  [   3:0] mbist_mco2pre,
    input  [   5:0] mbist_rtcpre,
    input  [   3:0] mbist_d1cpre,
    input  [   2:0] mbist_d1ppre,
    input  [   3:0] mbist_hpre,
    input  [   2:0] mbist_d2ppre1,
    input  [   2:0] mbist_d2ppre2,
    input  [   2:0] mbist_d3ppre,
    input           mbist_timpre,
    input           mbist_mac1_rcc_fes,
    input           mbist_mac1_rcc_epis_2,
    input           mbist_mac2_rcc_fes,
    input           mbist_mac2_rcc_epis_2,
    //================================================================
    // CPU signals
    //================================================================
    output          rcc_c1_rst_n,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_c2_rst_n,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_c1_clk,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_c1_systick_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_c2_clk,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_c2_systick_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_fclk_c1,                // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_fclk_c2,                // From u_rcc_vcore_top of rcc_vcore_top.v
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
    output          lsion,
    //triming signals
    output [   7:0] csi_trim,                   // From u_rcc_vcore_top of rcc_vcore_top.v
    output [  11:0] hsi_trim,                   // From u_rcc_vcore_top of rcc_vcore_top.v
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
    // vsw clock signals
    //================================================================
    output          vsw_rcc_rtc_ker_clk,
    //================================================================
    // interrupt signals
    //================================================================
    output          rcc_hsecss_it,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lsecss_it,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_it,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // PWR signals
    //================================================================
    output          rcc_pwr_d1_req,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_pwr_d2_req,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_pwr_d3_req,             // From u_rcc_vcore_top of rcc_vcore_top.v
    //================================================================
    // eth clocks
    //================================================================
    output          rcc_mac1_mii_tx_clk,
    output          rcc_mac1_mii_rx_clk,
    output          rcc_mac1_mii_tx_180_clk,
    output          rcc_mac1_mii_rx_180_clk,
    output          rcc_mac1_rmii_ref_clk,
    output          rcc_mac2_mii_tx_clk,
    output          rcc_mac2_mii_rx_clk,
    output          rcc_mac2_mii_tx_180_clk,
    output          rcc_mac2_mii_rx_180_clk,
    output          rcc_mac2_rmii_ref_clk,
    //================================================================
    // peripheral clock and reset
    //================================================================
    output          rcc_adcspi1_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_adcspi1_sync_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_adcspi2_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_adcspi2_sync_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_adcspi3_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_adcspi3_sync_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_can1_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_can1_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_can2_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_can2_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_can3_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_can3_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_can4_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_can4_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_can5_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_can5_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_can6_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_can6_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_cspi_f_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_cspi_f_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_cspi_l_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_cspi_l_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_cspi_l_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dma1_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dma1_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dma2_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dma2_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dmasch_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_dmasch_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_fft_hclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_fft_sync_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio1_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio1_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio2_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio2_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio3_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio3_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio4_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio4_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio5_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio5_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio6_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio6_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio7_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio7_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio8_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gpio8_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gtim1_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gtim1_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gtim2_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gtim2_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gtim3_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gtim3_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gtim4_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gtim4_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gtim5_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gtim5_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gtim6_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_gtim6_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hacif_f1_hclk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hacif_f1_sync_rst_n,    // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hacif_l1_hclk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hacif_l1_pclk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hacif_l1_sync_rst_n,    // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_hrtimer_prescalar_clk,  // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c1_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c1_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c2_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c2_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c3_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_i2c3_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_iwdt_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_iwdt_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_iwdt_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lz_hclk,                // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_lz_sync_rst_n,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mac1_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mac1_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mac2_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mac2_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mailbox1_pclk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mailbox1_sync_rst_n,    // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mailbox2_pclk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mailbox2_sync_rst_n,    // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mppt_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mppt_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mppt_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mspi_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_mspi_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_npu_hclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_npu_pclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_npu_sync_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_obl_clk,                // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_obl_rst_n,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_qspi1_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_qspi1_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_rom_hclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_rom_sync_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_rtc_ker_clk,
    output          rcc_rtc_pclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_rtc_sync_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_smc1_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_smc1_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_smc2_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_smc2_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi1_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi1_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi2_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi2_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi3_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi3_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi4_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi4_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi5_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spi5_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spl1_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spl1_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spl2_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_spl2_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sysctl_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_sysctl_sync_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim1_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim1_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim2_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_tim2_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_timx_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_timy_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart1_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart1_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart2_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart2_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart3_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart3_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart4_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart4_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart5_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart5_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart6_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart6_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart7_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart7_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart8_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_uart8_sync_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_wwdt_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_wwdt_sync_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_xflash_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output          rcc_xflash_sync_rst_n       // From u_rcc_vcore_top of rcc_vcore_top.v
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);
  wire hse_rtc_clk;
  wire rcc_bdcr_byte0_wren;
  wire rcc_bdcr_byte1_wren;
  wire rcc_bdcr_byte2_wren;
  wire rcc_c1_rsr_rmvf_wren;
  wire rcc_c2_rsr_rmvf_wren;
  wire rcc_csr_lsion_wren;
  /*AUTOWIRE*/
  /*AUTO DECLARE*/

  //INSTANTCE

  rcc_vsw_top u_rcc_vsw_top (
      .raw_hse_rtc_clk        (hse_rtc_clk),
      .raw_lsi_clk            (lsi_clk),
      .raw_lse_clk            (lse_clk),
      .raw_rcc_bdcr_byte2_wren(rcc_bdcr_byte2_wren),
      .raw_rcc_bdcr_byte1_wren(rcc_bdcr_byte1_wren),
      .raw_rcc_bdcr_byte0_wren(rcc_bdcr_byte0_wren),
      .rcc_rtc_ker_clk        (vsw_rcc_rtc_ker_clk)
      /*AUTOINST*/
  );

  rcc_vdd_top u_rcc_vdd_top (
      .raw_rcc_c1_rsr_rmvf_wren(rcc_c1_rsr_rmvf_wren),
      .raw_rcc_c2_rsr_rmvf_wren(rcc_c2_rsr_rmvf_wren),
      .raw_rcc_csr_lsion_wren  (rcc_csr_lsion_wren)
      /*AUTOINST*/
  );

  rcc_vcore_top #(  /*AUTOINSTPARAM*/
  ) u_rcc_vcore_top (
      .hse_rtc_clk                (hse_rtc_clk),
      .raw_lsi_clk                (lsi_clk),
      .raw_lse_clk                (lse_clk),
      .raw_csi_origin_clk         (csi_origin_clk),
      .raw_hse_origin_clk         (hse_origin_clk),
      .raw_hsi48_origin_clk       (hsi48_origin_clk),
      .raw_hsi_origin_clk         (hsi_origin_clk),
      .raw_pad_rcc_mac1_mii_tx_clk(pad_rcc_mac1_mii_tx_clk),
      .raw_pad_rcc_mac1_mii_rx_clk(pad_rcc_mac1_mii_rx_clk),
      .raw_pad_rcc_mac2_mii_tx_clk(pad_rcc_mac2_mii_tx_clk),
      .raw_pad_rcc_mac2_mii_rx_clk(pad_rcc_mac2_mii_rx_clk),
      .raw_pll1_p_clk             (pll1_p_clk),
      .raw_pll1_q_clk             (pll1_q_clk),
      .raw_pll2_p_clk             (pll2_p_clk),
      .raw_pll2_q_clk             (pll2_q_clk),
      .raw_pll2_r_clk             (pll2_r_clk),
      .raw_pll3_p_clk             (pll3_p_clk),
      .raw_pll3_q_clk             (pll3_q_clk),
      .raw_pll3_r_clk             (pll3_r_clk),
      .raw_pwr_d1_wkup            (pwr_d1_wkup),
      .raw_pwr_d2_wkup            (pwr_d2_wkup),
      .raw_pwr_d3_wkup            (pwr_d3_wkup),
      .raw_mac1_rcc_fes           (mac1_rcc_fes),
      .raw_mac1_rcc_epis_2        (mac1_rcc_epis_2),
      .raw_mac2_rcc_fes           (mac2_rcc_fes),
      .raw_mac2_rcc_epis_2        (mac2_rcc_epis_2),
      .rcc_bdcr_byte0_wren        (rcc_bdcr_byte0_wren),
      .rcc_bdcr_byte1_wren        (rcc_bdcr_byte1_wren),
      .rcc_bdcr_byte2_wren        (rcc_bdcr_byte2_wren),
      .rcc_c1_rsr_rmvf_wren       (rcc_c1_rsr_rmvf_wren),
      .rcc_c2_rsr_rmvf_wren       (rcc_c2_rsr_rmvf_wren),
      .rcc_csr_lsion_wren         (rcc_csr_lsion_wren)
      /*AUTOINST*/
  );


endmodule
