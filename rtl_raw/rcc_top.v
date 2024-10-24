module rcc_top #(
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
    /*AUTOINPUT*/
    // Beginning of automatic inputs (from unused autoinst inputs)
    input         I2S_clk_IN,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input         USB_PHY1,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    input         ahb1bridge_d2_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input         ahb2bridge_d2_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input         ahb3bridge_d1_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input         ahb4bridge_d3_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input  [31:0] ahb_haddr,                  // To u_rcc_vcore_top of rcc_vcore_top.v
    input  [ 2:0] ahb_hburst,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input         ahb_hclk,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    input         ahb_hmaster,                // To u_rcc_vcore_top of rcc_vcore_top.v
    input  [ 2:0] ahb_hprot,                  // To u_rcc_vcore_top of rcc_vcore_top.v
    input         ahb_hready_in,              // To u_rcc_vcore_top of rcc_vcore_top.v
    input         ahb_hresetn,                // To u_rcc_vcore_top of rcc_vcore_top.v
    input         ahb_hsel,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    input  [ 2:0] ahb_hsize,                  // To u_rcc_vcore_top of rcc_vcore_top.v
    input  [ 1:0] ahb_htrans,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input  [31:0] ahb_hwdata,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input         ahb_hwrite,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input         apb1bridge_d2_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input         apb2bridge_d2_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input         apb3bridge_d1_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input         apb4bridge_d3_busy,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input         axibridge_d1_busy,          // To u_rcc_vcore_top of rcc_vcore_top.v
    input         backup_protect,             // To u_rcc_vcore_top of rcc_vcore_top.v
    input         c1_deepsleep,               // To u_rcc_vcore_top of rcc_vcore_top.v
    input         c1_sleep,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    input         c2_deepsleep,               // To u_rcc_vcore_top of rcc_vcore_top.v
    input         c2_sleep,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    input         cpu1_sftrst,                // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input         cpu2_sftrst,                // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input  [ 9:0] crs_hsi48_trim,             // To u_rcc_vcore_top of rcc_vcore_top.v
    input         csi_clk_pre,                // To u_rcc_vcore_top of rcc_vcore_top.v
    input         csi_rdy,                    // To u_rcc_vcore_top of rcc_vcore_top.v
    input         d3_deepsleep,               // To u_rcc_vcore_top of rcc_vcore_top.v
    input         eth_rcc_epis_2,             // To u_rcc_vcore_top of rcc_vcore_top.v
    input         eth_rcc_fes,                // To u_rcc_vcore_top of rcc_vcore_top.v
    input         flash_busy,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input  [ 7:0] flash_csi_opt,              // To u_rcc_vcore_top of rcc_vcore_top.v
    input  [11:0] flash_hsi_opt,              // To u_rcc_vcore_top of rcc_vcore_top.v
    input         flash_obl_reload,           // To u_rcc_vcore_top of rcc_vcore_top.v
    input         flash_power_ok,             // To u_rcc_vcore_top of rcc_vcore_top.v
    input         hse_clk_pre,                // To u_rcc_vcore_top of rcc_vcore_top.v
    input         hse_rdy,                    // To u_rcc_vcore_top of rcc_vcore_top.v
    input         hsecss_fail,                // To u_rcc_vcore_top of rcc_vcore_top.v
    input         hsi48_clk,                  // To u_rcc_vcore_top of rcc_vcore_top.v
    input         hsi48_rdy,                  // To u_rcc_vcore_top of rcc_vcore_top.v
    input         hsi_origin_clk,             // To u_rcc_vcore_top of rcc_vcore_top.v
    input         hsi_rdy,                    // To u_rcc_vcore_top of rcc_vcore_top.v
    input         i2c1_ker_clk_req,           // To u_rcc_vcore_top of rcc_vcore_top.v
    input         i2c2_ker_clk_req,           // To u_rcc_vcore_top of rcc_vcore_top.v
    input         i2c3_ker_clk_req,           // To u_rcc_vcore_top of rcc_vcore_top.v
    input         i2c4_ker_clk_req,           // To u_rcc_vcore_top of rcc_vcore_top.v
    input         iwdg1_out_rst,              // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input         iwdg2_out_rst,              // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input         lpuart1_ker_clk_req,        // To u_rcc_vcore_top of rcc_vcore_top.v
    input         lpwr1_rst,                  // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input         lpwr2_rst,                  // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input         lse_clk,                    // To u_rcc_vsw_top of rcc_vsw_top.v, ...
    input         lsecss_fail,                // To u_rcc_vsw_top of rcc_vsw_top.v, ...
    input         lserdy,                     // To u_rcc_vsw_top of rcc_vsw_top.v
    input         lsi_clk,                    // To u_rcc_vsw_top of rcc_vsw_top.v, ...
    input         lsi_rdy,                    // To u_rcc_vdd_top of rcc_vdd_top.v
    input         nrst_in,                    // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input         obl_done,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pad_rcc_eth_mii_rx_clk,     // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pad_rcc_eth_mii_tx_clk,     // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pll1_p_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pll1_q_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pll1_rdy,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pll2_p_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pll2_q_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pll2_r_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pll2_rdy,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pll3_p_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pll3_q_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pll3_r_clk,                 // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pll3_rdy,                   // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pwr_bor_rst,                // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input         pwr_d1_ok,                  // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pwr_d1_wkup,                // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pwr_d2_ok,                  // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pwr_d2_wkup,                // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pwr_d3_wkup,                // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pwr_por_rst,                // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input         pwr_vcore_ok,               // To u_rcc_vcore_top of rcc_vcore_top.v
    input         pwr_vsw_rst,                // To u_rcc_vsw_top of rcc_vsw_top.v
    input         rcc_arcg_on,                // To u_rcc_vcore_top of rcc_vcore_top.v
    input         uart4_ker_clk_req,          // To u_rcc_vcore_top of rcc_vcore_top.v
    input         uart5_ker_clk_req,          // To u_rcc_vcore_top of rcc_vcore_top.v
    input         uart7_ker_clk_req,          // To u_rcc_vcore_top of rcc_vcore_top.v
    input         uart8_ker_clk_req,          // To u_rcc_vcore_top of rcc_vcore_top.v
    input         usart1_ker_clk_req,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input         usart2_ker_clk_req,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input         usart3_ker_clk_req,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input         usart6_ker_clk_req,         // To u_rcc_vcore_top of rcc_vcore_top.v
    input         wdata,                      // To u_rcc_vdd_top of rcc_vdd_top.v
    input         wwdg1_out_rst,              // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    input         wwdg2_out_rst,              // To u_rcc_vdd_top of rcc_vdd_top.v, ...
    // End of automatics
    /*AUTOOUTPUT*/
    // Beginning of automatic outputs (from unused autoinst outputs)
    output [31:0] ahb_hrdata,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output        ahb_hready_out,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        ahb_hresp,                  // From u_rcc_vcore_top of rcc_vcore_top.v
    output        bdrst,                      // From u_rcc_vsw_top of rcc_vsw_top.v
    output        c1_per_alloc_d2,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        c2_per_alloc_d1,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        cpu1_arcg_rst_n,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        cpu2_arcg_rst_n,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        csikeron,                   // From u_rcc_vcore_top of rcc_vcore_top.v
    output        csion,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        d1_arcg_rst_n,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        d1_bus_arcg_rst_n,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        d2_arcg_rst_n,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        d2_bus_arcg_rst_n,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        d3_bus_arcg_rst_n,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 8:0] divn1,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 8:0] divn2,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 8:0] divn3,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 6:0] divp1,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        divp1en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 6:0] divp2,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        divp2en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 6:0] divp3,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        divp3en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 6:0] divq1,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        divq1en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 6:0] divq2,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        divq2en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 6:0] divq3,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        divq3en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 6:0] divr1,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        divr1en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 6:0] divr2,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        divr2en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 6:0] divr3,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        divr3en,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [12:0] fracn1,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output [12:0] fracn2,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output [12:0] fracn3,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output        hsebyp,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output        hsecsson,                   // From u_rcc_vcore_top of rcc_vcore_top.v
    output        hseon,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        hsi48on,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 1:0] hsidiv,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output        hsikeron,                   // From u_rcc_vcore_top of rcc_vcore_top.v
    output        hsion,                      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        lsebyp,                     // From u_rcc_vsw_top of rcc_vsw_top.v
    output        lsecssd,                    // From u_rcc_vsw_top of rcc_vsw_top.v
    output        lsecsson,                   // From u_rcc_vsw_top of rcc_vsw_top.v
    output [ 1:0] lsedrv,                     // From u_rcc_vsw_top of rcc_vsw_top.v
    output        lseon,                      // From u_rcc_vsw_top of rcc_vsw_top.v
    output        mco1,                       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        mco2,                       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        nrst_out,                   // From u_rcc_vcore_top of rcc_vcore_top.v
    output        pll1_src_clk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output        pll1fracen,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output        pll1on,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 1:0] pll1rge,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output        pll1vcosel,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output        pll2_src_clk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output        pll2fracen,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output        pll2on,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 1:0] pll2rge,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output        pll2vcosel,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output        pll3_src_clk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output        pll3fracen,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output        pll3on,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 1:0] pll3rge,                    // From u_rcc_vcore_top of rcc_vcore_top.v
    output        pll3vcosel,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output        pwr_por_rst_n,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_adc12_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_adc12_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_adc12_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_adc3_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_adc3_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_adc3_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_ahb1bridge_d2_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_ahb2bridge_d2_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_ahb3bridge_d1_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_ahb4bridge_d3_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_apb1bridge_d2_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_apb2bridge_d2_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_apb3bridge_d1_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_apb4bridge_d3_clk,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_axibridge_d1_clk,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_axisram_aclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_axisram_arcg_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_bdma_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_bdma_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_bkpram_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_bkpram_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_c1_clk,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_c1_systick_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_c2_clk,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_c2_systick_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_comp12_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_comp12_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_crc_arcg_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_crc_hclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_crs_arcg_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_crs_pclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_crypt_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_crypt_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output [ 7:0] rcc_csi_triming,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dac12_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dac12_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dcmi_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dcmi_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dfsdm1_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dfsdm1_ker_clk_0,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dfsdm1_ker_clk_1,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dfsdm1_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dma1_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dma1_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dma2_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dma2_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dma2d_aclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dma2d_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dma2d_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dtcm1_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dtcm1_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dtcm2_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_dtcm2_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_eth1mac_arcg_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_eth1mac_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_eth1rx_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_eth1rx_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_eth1tx_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_eth1tx_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_eth_mii_rx_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_eth_mii_tx_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_eth_rmii_ref_clk,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_exti_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_exti_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_fclk_c1,                // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_fclk_c2,                // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_fdcan_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_fdcan_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_fdcan_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_flash_aclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_flash_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_flash_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_fmc_aclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_fmc_arcg_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_fmc_hclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_fmc_ker_clk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpioa_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpioa_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpiob_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpiob_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpioc_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpioc_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpiod_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpiod_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpioe_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpioe_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpiof_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpiof_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpiog_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpiog_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpioh_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpioh_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpioi_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpioi_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpioj_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpioj_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpiok_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpiok_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpv_arcg_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_gpv_hclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_hash_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_hash_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_hdmicec_arcg_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_hdmicec_ker_clk,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_hdmicec_pclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_hrtim_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_hrtim_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_hrtim_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_hrtimer_prescalar_clk,  // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_hsefail_it,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_hsem_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_hsem_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output [11:0] rcc_hsi_triming,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_i2c1_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_i2c1_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_i2c1_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_i2c2_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_i2c2_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_i2c2_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_i2c3_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_i2c3_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_i2c3_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_i2c4_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_i2c4_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_i2c4_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_it,                     // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_itcm_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_itcm_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_iwdg1_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_iwdg1_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_iwdg2_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_iwdg2_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_jpgdec_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_jpgdec_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim1_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim1_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim1_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim2_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim2_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim2_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim3_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim3_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim3_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim4_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim4_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim4_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim5_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim5_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lptim5_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lpuart1_arcg_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lpuart1_ker_clk,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lpuart1_pclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_lsefail_it,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_ltdc_aclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_ltdc_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_ltdc_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_ltdc_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_mdios_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_mdios_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_mdma_aclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_mdma_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_mdma_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_opamp_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_opamp_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_pwr_arcg_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_pwr_d1_req,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_pwr_d2_req,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_pwr_d3_req,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_pwr_hclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_qspi_aclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_qspi_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_qspi_hclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_qspi_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_ramecc1_arcg_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_ramecc1_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_ramecc2_arcg_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_ramecc2_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_ramecc3_arcg_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_ramecc3_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_rcc_arcg_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_rcc_hclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_rng_arcg_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_rng_hclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_rng_ker_clk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_rtc_arcg_rst_n,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_rtc_ker_clk,            // From u_rcc_vsw_top of rcc_vsw_top.v
    output        rcc_rtc_pclk,               // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sai1_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sai1_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sai1_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sai2_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sai2_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sai2_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sai3_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sai3_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sai3_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sai4_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sai4_ker_clk_0,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sai4_ker_clk_1,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sai4_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sdmmc1_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sdmmc1_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sdmmc1_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sdmmc2_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sdmmc2_hclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sdmmc2_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spdifrx_arcg_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spdifrx_ker_clk,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spdifrx_pclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi1_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi1_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi1_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi2_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi2_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi2_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi3_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi3_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi3_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi4_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi4_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi4_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi5_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi5_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi5_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi6_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi6_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_spi6_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sram1_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sram1_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sram2_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sram2_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sram3_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sram3_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sram4_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_sram4_hclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_swpmi_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_swpmi_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_swpmi_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_syscfg_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_syscfg_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim12_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim12_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim12_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim13_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim13_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim13_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim14_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim14_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim14_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim15_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim15_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim15_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim16_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim16_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim16_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim17_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim17_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim17_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim1_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim1_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim1_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim2_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim2_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim2_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim3_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim3_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim3_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim4_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim4_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim4_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim5_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim5_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim5_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim6_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim6_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim6_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim7_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim7_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim7_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim8_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim8_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_tim8_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_timx_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_timy_ker_clk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_uart4_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_uart4_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_uart4_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_uart5_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_uart5_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_uart5_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_uart7_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_uart7_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_uart7_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_uart8_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_uart8_ker_clk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_uart8_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usart1_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usart1_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usart1_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usart2_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usart2_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usart2_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usart3_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usart3_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usart3_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usart6_arcg_rst_n,      // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usart6_ker_clk,         // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usart6_pclk,            // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usb1otg_arcg_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usb1otg_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usb1otg_ker_clk,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usb1ulpi_arcg_rst_n,    // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usb1ulpi_hclk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usb1ulpi_ker_clk,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usb2otg_arcg_rst_n,     // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usb2otg_hclk,           // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usb2otg_ker_clk,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usb2ulpi_arcg_rst_n,    // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_usb2ulpi_hclk,          // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_vdd_wdata,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_vref_arcg_rst_n,        // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_vref_pclk,              // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_wwdg1_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_wwdg1_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_wwdg2_arcg_rst_n,       // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rcc_wwdg2_pclk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        rtcen,                      // From u_rcc_vsw_top of rcc_vsw_top.v
    output [ 1:0] rtcsel,                     // From u_rcc_vsw_top of rcc_vsw_top.v
    output        stby_rst_n,                 // From u_rcc_vcore_top of rcc_vcore_top.v
    output        sys_arcg_rst_n,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        sys_d1cpre_clk,             // From u_rcc_vcore_top of rcc_vcore_top.v
    output        sys_hpre_clk                // From u_rcc_vcore_top of rcc_vcore_top.v
    // End of automatics
);

  /*AUTOWIRE*/
  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire       cur_rcc_bdcr_bdrst;  // From u_rcc_vsw_top of rcc_vsw_top.v
  wire       cur_rcc_bdcr_lsebyp;  // From u_rcc_vsw_top of rcc_vsw_top.v
  wire       cur_rcc_bdcr_lsecssd;  // From u_rcc_vsw_top of rcc_vsw_top.v
  wire       cur_rcc_bdcr_lsecsson;  // From u_rcc_vsw_top of rcc_vsw_top.v
  wire [1:0] cur_rcc_bdcr_lsedrv;  // From u_rcc_vsw_top of rcc_vsw_top.v
  wire       cur_rcc_bdcr_lseon;  // From u_rcc_vsw_top of rcc_vsw_top.v
  wire       cur_rcc_bdcr_lserdy;  // From u_rcc_vsw_top of rcc_vsw_top.v
  wire       cur_rcc_bdcr_rtcen;  // From u_rcc_vsw_top of rcc_vsw_top.v
  wire [1:0] cur_rcc_bdcr_rtcsel;  // From u_rcc_vsw_top of rcc_vsw_top.v
  wire       cur_rcc_c1_rsr_borrstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c1_rsr_d1rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c1_rsr_d2rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c1_rsr_iwdg1rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c1_rsr_iwdg2rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c1_rsr_lpwr1rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c1_rsr_lpwr2rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c1_rsr_oblrstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c1_rsr_pinrstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c1_rsr_porrstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c1_rsr_rmvf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c1_rsr_sft1rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c1_rsr_sft2rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c1_rsr_wwdg1rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c1_rsr_wwdg2rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_borrstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_d1rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_d2rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_iwdg1rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_iwdg2rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_lpwr1rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_lpwr2rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_oblrstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_pinrstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_porrstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_rmvf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_sft1rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_sft2rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_wwdg1rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_c2_rsr_wwdg2rstf;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_csr_lsion;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       cur_rcc_csr_lsirdy;  // From u_rcc_vdd_top of rcc_vdd_top.v
  wire       d1_rst;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire       d2_rst;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire       hse_rtc_clk;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire       nxt_rcc_bdcr_bdrst;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire       nxt_rcc_bdcr_lsebyp;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire       nxt_rcc_bdcr_lsecsson;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire [1:0] nxt_rcc_bdcr_lsedrv;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire       nxt_rcc_bdcr_lseon;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire       nxt_rcc_bdcr_rtcen;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire [1:0] nxt_rcc_bdcr_rtcsel;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire       obl_rst;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire       rcc_bdcr_byte0_wren;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire       rcc_bdcr_byte1_wren;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire       rcc_bdcr_byte2_wren;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire       rcc_c1_rsr_rmvf_wren;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire       rcc_c2_rsr_rmvf_wren;  // From u_rcc_vcore_top of rcc_vcore_top.v
  wire       rcc_csr_lsion_wren;  // From u_rcc_vcore_top of rcc_vcore_top.v
  // End of automatics
  /*AUTOREG*/
  //INSTANTCE

  rcc_vsw_top u_rcc_vsw_top (  /*AUTOINST*/
      // Outputs
      .rcc_rtc_ker_clk      (rcc_rtc_ker_clk),
      .bdrst                (bdrst),
      .rtcen                (rtcen),
      .rtcsel               (rtcsel[1:0]),
      .lsecssd              (lsecssd),
      .lsecsson             (lsecsson),
      .lsedrv               (lsedrv[1:0]),
      .lsebyp               (lsebyp),
      .lseon                (lseon),
      .cur_rcc_bdcr_bdrst   (cur_rcc_bdcr_bdrst),
      .cur_rcc_bdcr_rtcen   (cur_rcc_bdcr_rtcen),
      .cur_rcc_bdcr_rtcsel  (cur_rcc_bdcr_rtcsel[1:0]),
      .cur_rcc_bdcr_lsecssd (cur_rcc_bdcr_lsecssd),
      .cur_rcc_bdcr_lsecsson(cur_rcc_bdcr_lsecsson),
      .cur_rcc_bdcr_lsedrv  (cur_rcc_bdcr_lsedrv[1:0]),
      .cur_rcc_bdcr_lsebyp  (cur_rcc_bdcr_lsebyp),
      .cur_rcc_bdcr_lserdy  (cur_rcc_bdcr_lserdy),
      .cur_rcc_bdcr_lseon   (cur_rcc_bdcr_lseon),
      // Inputs
      .lsecss_fail          (lsecss_fail),
      .lse_clk              (lse_clk),
      .lserdy               (lserdy),
      .lsi_clk              (lsi_clk),
      .hse_rtc_clk          (hse_rtc_clk),
      .pwr_vsw_rst          (pwr_vsw_rst),
      .rcc_bdcr_byte2_wren  (rcc_bdcr_byte2_wren),
      .rcc_bdcr_byte1_wren  (rcc_bdcr_byte1_wren),
      .rcc_bdcr_byte0_wren  (rcc_bdcr_byte0_wren),
      .nxt_rcc_bdcr_bdrst   (nxt_rcc_bdcr_bdrst),
      .nxt_rcc_bdcr_rtcen   (nxt_rcc_bdcr_rtcen),
      .nxt_rcc_bdcr_rtcsel  (nxt_rcc_bdcr_rtcsel[1:0]),
      .nxt_rcc_bdcr_lsecsson(nxt_rcc_bdcr_lsecsson),
      .nxt_rcc_bdcr_lsedrv  (nxt_rcc_bdcr_lsedrv[1:0]),
      .nxt_rcc_bdcr_lsebyp  (nxt_rcc_bdcr_lsebyp),
      .nxt_rcc_bdcr_lseon   (nxt_rcc_bdcr_lseon)
  );

  rcc_vdd_top u_rcc_vdd_top (  /*AUTOINST*/
      // Outputs
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
      .cur_rcc_csr_lsion       (cur_rcc_csr_lsion),
      // Inputs
      .wdata                   (wdata),
      .rcc_c1_rsr_rmvf_wren    (rcc_c1_rsr_rmvf_wren),
      .rcc_c2_rsr_rmvf_wren    (rcc_c2_rsr_rmvf_wren),
      .rcc_csr_lsion_wren      (rcc_csr_lsion_wren),
      .nrst_in                 (nrst_in),
      .obl_rst                 (obl_rst),
      .lpwr2_rst               (lpwr2_rst),
      .lpwr1_rst               (lpwr1_rst),
      .wwdg1_out_rst           (wwdg1_out_rst),
      .wwdg2_out_rst           (wwdg2_out_rst),
      .iwdg1_out_rst           (iwdg1_out_rst),
      .iwdg2_out_rst           (iwdg2_out_rst),
      .cpu2_sftrst             (cpu2_sftrst),
      .cpu1_sftrst             (cpu1_sftrst),
      .pwr_por_rst             (pwr_por_rst),
      .pwr_bor_rst             (pwr_bor_rst),
      .d2_rst                  (d2_rst),
      .d1_rst                  (d1_rst),
      .lsi_rdy                 (lsi_rdy)
  );

  rcc_vcore_top #(  /*AUTOINSTPARAM*/
      // Parameters
      .CLK_ON_AFTER_PER_RST_RELEASE (CLK_ON_AFTER_PER_RST_RELEASE),
      .CLK_ON_AFTER_SYS_RST_RELEASE (CLK_ON_AFTER_SYS_RST_RELEASE),
      .CLK_ON_AFTER_D1_RST_RELEASE  (CLK_ON_AFTER_D1_RST_RELEASE),
      .CLK_ON_AFTER_D2_RST_RELEASE  (CLK_ON_AFTER_D2_RST_RELEASE),
      .CLK_ON_AFTER_CPU1_RST_RELEASE(CLK_ON_AFTER_CPU1_RST_RELEASE),
      .CLK_ON_AFTER_CPU2_RST_RELEASE(CLK_ON_AFTER_CPU2_RST_RELEASE)
  ) u_rcc_vcore_top (  /*AUTOINST*/
      // Outputs
      .nrst_out                 (nrst_out),
      .obl_rst                  (obl_rst),
      .d1_rst                   (d1_rst),
      .d2_rst                   (d2_rst),
      .rcc_pwr_d1_req           (rcc_pwr_d1_req),
      .rcc_pwr_d2_req           (rcc_pwr_d2_req),
      .rcc_pwr_d3_req           (rcc_pwr_d3_req),
      .c2_per_alloc_d1          (c2_per_alloc_d1),
      .c1_per_alloc_d2          (c1_per_alloc_d2),
      .rcc_c2_clk               (rcc_c2_clk),
      .rcc_fclk_c2              (rcc_fclk_c2),
      .rcc_c2_systick_clk       (rcc_c2_systick_clk),
      .rcc_c1_clk               (rcc_c1_clk),
      .rcc_fclk_c1              (rcc_fclk_c1),
      .rcc_c1_systick_clk       (rcc_c1_systick_clk),
      .cpu1_arcg_rst_n          (cpu1_arcg_rst_n),
      .cpu2_arcg_rst_n          (cpu2_arcg_rst_n),
      .d1_bus_arcg_rst_n        (d1_bus_arcg_rst_n),
      .d2_bus_arcg_rst_n        (d2_bus_arcg_rst_n),
      .d3_bus_arcg_rst_n        (d3_bus_arcg_rst_n),
      .rcc_timx_ker_clk         (rcc_timx_ker_clk),
      .rcc_timy_ker_clk         (rcc_timy_ker_clk),
      .rcc_hrtimer_prescalar_clk(rcc_hrtimer_prescalar_clk),
      .sys_d1cpre_clk           (sys_d1cpre_clk),
      .sys_hpre_clk             (sys_hpre_clk),
      .hse_rtc_clk              (hse_rtc_clk),
      .mco1                     (mco1),
      .mco2                     (mco2),
      .rcc_hsefail_it           (rcc_hsefail_it),
      .rcc_lsefail_it           (rcc_lsefail_it),
      .rcc_it                   (rcc_it),
      .pwr_por_rst_n            (pwr_por_rst_n),
      .sys_arcg_rst_n           (sys_arcg_rst_n),
      .d1_arcg_rst_n            (d1_arcg_rst_n),
      .d2_arcg_rst_n            (d2_arcg_rst_n),
      .stby_rst_n               (stby_rst_n),
      .rcc_flash_arcg_rst_n     (rcc_flash_arcg_rst_n),
      .rcc_qspi_arcg_rst_n      (rcc_qspi_arcg_rst_n),
      .rcc_axisram_arcg_rst_n   (rcc_axisram_arcg_rst_n),
      .rcc_fmc_arcg_rst_n       (rcc_fmc_arcg_rst_n),
      .rcc_dma2d_arcg_rst_n     (rcc_dma2d_arcg_rst_n),
      .rcc_mdma_arcg_rst_n      (rcc_mdma_arcg_rst_n),
      .rcc_ltdc_arcg_rst_n      (rcc_ltdc_arcg_rst_n),
      .rcc_ramecc1_arcg_rst_n   (rcc_ramecc1_arcg_rst_n),
      .rcc_gpv_arcg_rst_n       (rcc_gpv_arcg_rst_n),
      .rcc_itcm_arcg_rst_n      (rcc_itcm_arcg_rst_n),
      .rcc_dtcm2_arcg_rst_n     (rcc_dtcm2_arcg_rst_n),
      .rcc_dtcm1_arcg_rst_n     (rcc_dtcm1_arcg_rst_n),
      .rcc_jpgdec_arcg_rst_n    (rcc_jpgdec_arcg_rst_n),
      .rcc_sdmmc1_arcg_rst_n    (rcc_sdmmc1_arcg_rst_n),
      .rcc_wwdg1_arcg_rst_n     (rcc_wwdg1_arcg_rst_n),
      .rcc_usb2ulpi_arcg_rst_n  (rcc_usb2ulpi_arcg_rst_n),
      .rcc_usb2otg_arcg_rst_n   (rcc_usb2otg_arcg_rst_n),
      .rcc_usb1ulpi_arcg_rst_n  (rcc_usb1ulpi_arcg_rst_n),
      .rcc_usb1otg_arcg_rst_n   (rcc_usb1otg_arcg_rst_n),
      .rcc_eth1rx_arcg_rst_n    (rcc_eth1rx_arcg_rst_n),
      .rcc_eth1tx_arcg_rst_n    (rcc_eth1tx_arcg_rst_n),
      .rcc_eth1mac_arcg_rst_n   (rcc_eth1mac_arcg_rst_n),
      .rcc_adc12_arcg_rst_n     (rcc_adc12_arcg_rst_n),
      .rcc_dma2_arcg_rst_n      (rcc_dma2_arcg_rst_n),
      .rcc_dma1_arcg_rst_n      (rcc_dma1_arcg_rst_n),
      .rcc_sram3_arcg_rst_n     (rcc_sram3_arcg_rst_n),
      .rcc_sram2_arcg_rst_n     (rcc_sram2_arcg_rst_n),
      .rcc_sram1_arcg_rst_n     (rcc_sram1_arcg_rst_n),
      .rcc_sdmmc2_arcg_rst_n    (rcc_sdmmc2_arcg_rst_n),
      .rcc_rng_arcg_rst_n       (rcc_rng_arcg_rst_n),
      .rcc_hash_arcg_rst_n      (rcc_hash_arcg_rst_n),
      .rcc_crypt_arcg_rst_n     (rcc_crypt_arcg_rst_n),
      .rcc_dcmi_arcg_rst_n      (rcc_dcmi_arcg_rst_n),
      .rcc_ramecc2_arcg_rst_n   (rcc_ramecc2_arcg_rst_n),
      .rcc_uart8_arcg_rst_n     (rcc_uart8_arcg_rst_n),
      .rcc_uart7_arcg_rst_n     (rcc_uart7_arcg_rst_n),
      .rcc_dac12_arcg_rst_n     (rcc_dac12_arcg_rst_n),
      .rcc_hdmicec_arcg_rst_n   (rcc_hdmicec_arcg_rst_n),
      .rcc_i2c3_arcg_rst_n      (rcc_i2c3_arcg_rst_n),
      .rcc_i2c2_arcg_rst_n      (rcc_i2c2_arcg_rst_n),
      .rcc_i2c1_arcg_rst_n      (rcc_i2c1_arcg_rst_n),
      .rcc_uart5_arcg_rst_n     (rcc_uart5_arcg_rst_n),
      .rcc_uart4_arcg_rst_n     (rcc_uart4_arcg_rst_n),
      .rcc_usart3_arcg_rst_n    (rcc_usart3_arcg_rst_n),
      .rcc_usart2_arcg_rst_n    (rcc_usart2_arcg_rst_n),
      .rcc_spdifrx_arcg_rst_n   (rcc_spdifrx_arcg_rst_n),
      .rcc_spi3_arcg_rst_n      (rcc_spi3_arcg_rst_n),
      .rcc_spi2_arcg_rst_n      (rcc_spi2_arcg_rst_n),
      .rcc_wwdg2_arcg_rst_n     (rcc_wwdg2_arcg_rst_n),
      .rcc_lptim1_arcg_rst_n    (rcc_lptim1_arcg_rst_n),
      .rcc_tim14_arcg_rst_n     (rcc_tim14_arcg_rst_n),
      .rcc_tim13_arcg_rst_n     (rcc_tim13_arcg_rst_n),
      .rcc_tim12_arcg_rst_n     (rcc_tim12_arcg_rst_n),
      .rcc_tim7_arcg_rst_n      (rcc_tim7_arcg_rst_n),
      .rcc_tim6_arcg_rst_n      (rcc_tim6_arcg_rst_n),
      .rcc_tim5_arcg_rst_n      (rcc_tim5_arcg_rst_n),
      .rcc_tim4_arcg_rst_n      (rcc_tim4_arcg_rst_n),
      .rcc_tim3_arcg_rst_n      (rcc_tim3_arcg_rst_n),
      .rcc_tim2_arcg_rst_n      (rcc_tim2_arcg_rst_n),
      .rcc_fdcan_arcg_rst_n     (rcc_fdcan_arcg_rst_n),
      .rcc_mdios_arcg_rst_n     (rcc_mdios_arcg_rst_n),
      .rcc_opamp_arcg_rst_n     (rcc_opamp_arcg_rst_n),
      .rcc_swpmi_arcg_rst_n     (rcc_swpmi_arcg_rst_n),
      .rcc_crs_arcg_rst_n       (rcc_crs_arcg_rst_n),
      .rcc_hrtim_arcg_rst_n     (rcc_hrtim_arcg_rst_n),
      .rcc_dfsdm1_arcg_rst_n    (rcc_dfsdm1_arcg_rst_n),
      .rcc_sai3_arcg_rst_n      (rcc_sai3_arcg_rst_n),
      .rcc_sai2_arcg_rst_n      (rcc_sai2_arcg_rst_n),
      .rcc_sai1_arcg_rst_n      (rcc_sai1_arcg_rst_n),
      .rcc_spi5_arcg_rst_n      (rcc_spi5_arcg_rst_n),
      .rcc_tim17_arcg_rst_n     (rcc_tim17_arcg_rst_n),
      .rcc_tim16_arcg_rst_n     (rcc_tim16_arcg_rst_n),
      .rcc_tim15_arcg_rst_n     (rcc_tim15_arcg_rst_n),
      .rcc_spi4_arcg_rst_n      (rcc_spi4_arcg_rst_n),
      .rcc_spi1_arcg_rst_n      (rcc_spi1_arcg_rst_n),
      .rcc_usart6_arcg_rst_n    (rcc_usart6_arcg_rst_n),
      .rcc_usart1_arcg_rst_n    (rcc_usart1_arcg_rst_n),
      .rcc_tim8_arcg_rst_n      (rcc_tim8_arcg_rst_n),
      .rcc_tim1_arcg_rst_n      (rcc_tim1_arcg_rst_n),
      .rcc_sram4_arcg_rst_n     (rcc_sram4_arcg_rst_n),
      .rcc_bkpram_arcg_rst_n    (rcc_bkpram_arcg_rst_n),
      .rcc_ramecc3_arcg_rst_n   (rcc_ramecc3_arcg_rst_n),
      .rcc_hsem_arcg_rst_n      (rcc_hsem_arcg_rst_n),
      .rcc_adc3_arcg_rst_n      (rcc_adc3_arcg_rst_n),
      .rcc_bdma_arcg_rst_n      (rcc_bdma_arcg_rst_n),
      .rcc_crc_arcg_rst_n       (rcc_crc_arcg_rst_n),
      .rcc_gpiok_arcg_rst_n     (rcc_gpiok_arcg_rst_n),
      .rcc_gpioj_arcg_rst_n     (rcc_gpioj_arcg_rst_n),
      .rcc_gpioi_arcg_rst_n     (rcc_gpioi_arcg_rst_n),
      .rcc_gpioh_arcg_rst_n     (rcc_gpioh_arcg_rst_n),
      .rcc_gpiog_arcg_rst_n     (rcc_gpiog_arcg_rst_n),
      .rcc_gpiof_arcg_rst_n     (rcc_gpiof_arcg_rst_n),
      .rcc_gpioe_arcg_rst_n     (rcc_gpioe_arcg_rst_n),
      .rcc_gpiod_arcg_rst_n     (rcc_gpiod_arcg_rst_n),
      .rcc_gpioc_arcg_rst_n     (rcc_gpioc_arcg_rst_n),
      .rcc_gpiob_arcg_rst_n     (rcc_gpiob_arcg_rst_n),
      .rcc_gpioa_arcg_rst_n     (rcc_gpioa_arcg_rst_n),
      .rcc_rcc_arcg_rst_n       (rcc_rcc_arcg_rst_n),
      .rcc_pwr_arcg_rst_n       (rcc_pwr_arcg_rst_n),
      .rcc_sai4_arcg_rst_n      (rcc_sai4_arcg_rst_n),
      .rcc_rtc_arcg_rst_n       (rcc_rtc_arcg_rst_n),
      .rcc_vref_arcg_rst_n      (rcc_vref_arcg_rst_n),
      .rcc_comp12_arcg_rst_n    (rcc_comp12_arcg_rst_n),
      .rcc_lptim5_arcg_rst_n    (rcc_lptim5_arcg_rst_n),
      .rcc_lptim4_arcg_rst_n    (rcc_lptim4_arcg_rst_n),
      .rcc_lptim3_arcg_rst_n    (rcc_lptim3_arcg_rst_n),
      .rcc_lptim2_arcg_rst_n    (rcc_lptim2_arcg_rst_n),
      .rcc_i2c4_arcg_rst_n      (rcc_i2c4_arcg_rst_n),
      .rcc_spi6_arcg_rst_n      (rcc_spi6_arcg_rst_n),
      .rcc_lpuart1_arcg_rst_n   (rcc_lpuart1_arcg_rst_n),
      .rcc_syscfg_arcg_rst_n    (rcc_syscfg_arcg_rst_n),
      .rcc_iwdg2_arcg_rst_n     (rcc_iwdg2_arcg_rst_n),
      .rcc_iwdg1_arcg_rst_n     (rcc_iwdg1_arcg_rst_n),
      .rcc_exti_arcg_rst_n      (rcc_exti_arcg_rst_n),
      .ahb_hrdata               (ahb_hrdata[31:0]),
      .ahb_hready_out           (ahb_hready_out),
      .ahb_hresp                (ahb_hresp),
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
      .pll3on                   (pll3on),
      .pll2on                   (pll2on),
      .pll1on                   (pll1on),
      .hsecsson                 (hsecsson),
      .hsebyp                   (hsebyp),
      .hseon                    (hseon),
      .hsi48on                  (hsi48on),
      .csikeron                 (csikeron),
      .csion                    (csion),
      .hsidiv                   (hsidiv[1:0]),
      .hsikeron                 (hsikeron),
      .hsion                    (hsion),
      .rcc_csi_triming          (rcc_csi_triming[7:0]),
      .rcc_hsi_triming          (rcc_hsi_triming[11:0]),
      .divr3en                  (divr3en),
      .divq3en                  (divq3en),
      .divp3en                  (divp3en),
      .divr2en                  (divr2en),
      .divq2en                  (divq2en),
      .divp2en                  (divp2en),
      .divr1en                  (divr1en),
      .divq1en                  (divq1en),
      .divp1en                  (divp1en),
      .pll3rge                  (pll3rge[1:0]),
      .pll3vcosel               (pll3vcosel),
      .pll3fracen               (pll3fracen),
      .pll2rge                  (pll2rge[1:0]),
      .pll2vcosel               (pll2vcosel),
      .pll2fracen               (pll2fracen),
      .pll1rge                  (pll1rge[1:0]),
      .pll1vcosel               (pll1vcosel),
      .pll1fracen               (pll1fracen),
      .divr1                    (divr1[6:0]),
      .divq1                    (divq1[6:0]),
      .divp1                    (divp1[6:0]),
      .divn1                    (divn1[8:0]),
      .fracn1                   (fracn1[12:0]),
      .divr2                    (divr2[6:0]),
      .divq2                    (divq2[6:0]),
      .divp2                    (divp2[6:0]),
      .divn2                    (divn2[8:0]),
      .fracn2                   (fracn2[12:0]),
      .divr3                    (divr3[6:0]),
      .divq3                    (divq3[6:0]),
      .divp3                    (divp3[6:0]),
      .divn3                    (divn3[8:0]),
      .fracn3                   (fracn3[12:0]),
      .rcc_eth_mii_tx_clk       (rcc_eth_mii_tx_clk),
      .rcc_eth_mii_rx_clk       (rcc_eth_mii_rx_clk),
      .rcc_eth_rmii_ref_clk     (rcc_eth_rmii_ref_clk),
      .rcc_c1_rsr_rmvf_wren     (rcc_c1_rsr_rmvf_wren),
      .rcc_c2_rsr_rmvf_wren     (rcc_c2_rsr_rmvf_wren),
      .rcc_csr_lsion_wren       (rcc_csr_lsion_wren),
      .rcc_bdcr_byte2_wren      (rcc_bdcr_byte2_wren),
      .rcc_bdcr_byte1_wren      (rcc_bdcr_byte1_wren),
      .rcc_bdcr_byte0_wren      (rcc_bdcr_byte0_wren),
      .nxt_rcc_bdcr_bdrst       (nxt_rcc_bdcr_bdrst),
      .nxt_rcc_bdcr_rtcen       (nxt_rcc_bdcr_rtcen),
      .nxt_rcc_bdcr_rtcsel      (nxt_rcc_bdcr_rtcsel[1:0]),
      .nxt_rcc_bdcr_lsecsson    (nxt_rcc_bdcr_lsecsson),
      .nxt_rcc_bdcr_lsedrv      (nxt_rcc_bdcr_lsedrv[1:0]),
      .nxt_rcc_bdcr_lsebyp      (nxt_rcc_bdcr_lsebyp),
      .nxt_rcc_bdcr_lseon       (nxt_rcc_bdcr_lseon),
      .rcc_vdd_wdata            (rcc_vdd_wdata),
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
      // Inputs
      .nrst_in                  (nrst_in),
      .iwdg1_out_rst            (iwdg1_out_rst),
      .wwdg1_out_rst            (wwdg1_out_rst),
      .iwdg2_out_rst            (iwdg2_out_rst),
      .wwdg2_out_rst            (wwdg2_out_rst),
      .lpwr2_rst                (lpwr2_rst),
      .lpwr1_rst                (lpwr1_rst),
      .pwr_bor_rst              (pwr_bor_rst),
      .pwr_por_rst              (pwr_por_rst),
      .cpu2_sftrst              (cpu2_sftrst),
      .cpu1_sftrst              (cpu1_sftrst),
      .d3_deepsleep             (d3_deepsleep),
      .pwr_d1_wkup              (pwr_d1_wkup),
      .pwr_d2_wkup              (pwr_d2_wkup),
      .pwr_d3_wkup              (pwr_d3_wkup),
      .flash_power_ok           (flash_power_ok),
      .pwr_d1_ok                (pwr_d1_ok),
      .pwr_d2_ok                (pwr_d2_ok),
      .pwr_vcore_ok             (pwr_vcore_ok),
      .backup_protect           (backup_protect),
      .c2_sleep                 (c2_sleep),
      .c2_deepsleep             (c2_deepsleep),
      .c1_sleep                 (c1_sleep),
      .c1_deepsleep             (c1_deepsleep),
      .pad_rcc_eth_mii_tx_clk   (pad_rcc_eth_mii_tx_clk),
      .pad_rcc_eth_mii_rx_clk   (pad_rcc_eth_mii_rx_clk),
      .USB_PHY1                 (USB_PHY1),
      .flash_obl_reload         (flash_obl_reload),
      .obl_done                 (obl_done),
      .rcc_arcg_on              (rcc_arcg_on),
      .pll3_rdy                 (pll3_rdy),
      .pll2_rdy                 (pll2_rdy),
      .pll1_rdy                 (pll1_rdy),
      .hse_rdy                  (hse_rdy),
      .hsi48_rdy                (hsi48_rdy),
      .csi_rdy                  (csi_rdy),
      .hsi_rdy                  (hsi_rdy),
      .flash_csi_opt            (flash_csi_opt[7:0]),
      .flash_hsi_opt            (flash_hsi_opt[11:0]),
      .crs_hsi48_trim           (crs_hsi48_trim[9:0]),
      .hsecss_fail              (hsecss_fail),
      .lsecss_fail              (lsecss_fail),
      .hse_clk_pre              (hse_clk_pre),
      .lse_clk                  (lse_clk),
      .lsi_clk                  (lsi_clk),
      .hsi48_clk                (hsi48_clk),
      .csi_clk_pre              (csi_clk_pre),
      .hsi_origin_clk           (hsi_origin_clk),
      .ahb_hclk                 (ahb_hclk),
      .ahb_hresetn              (ahb_hresetn),
      .ahb_haddr                (ahb_haddr[31:0]),
      .ahb_hburst               (ahb_hburst[2:0]),
      .ahb_hprot                (ahb_hprot[2:0]),
      .ahb_hready_in            (ahb_hready_in),
      .ahb_hsize                (ahb_hsize[2:0]),
      .ahb_htrans               (ahb_htrans[1:0]),
      .ahb_hwdata               (ahb_hwdata[31:0]),
      .ahb_hwrite               (ahb_hwrite),
      .ahb_hsel                 (ahb_hsel),
      .ahb_hmaster              (ahb_hmaster),
      .uart8_ker_clk_req        (uart8_ker_clk_req),
      .uart7_ker_clk_req        (uart7_ker_clk_req),
      .i2c3_ker_clk_req         (i2c3_ker_clk_req),
      .i2c2_ker_clk_req         (i2c2_ker_clk_req),
      .i2c1_ker_clk_req         (i2c1_ker_clk_req),
      .uart5_ker_clk_req        (uart5_ker_clk_req),
      .uart4_ker_clk_req        (uart4_ker_clk_req),
      .usart3_ker_clk_req       (usart3_ker_clk_req),
      .usart2_ker_clk_req       (usart2_ker_clk_req),
      .usart6_ker_clk_req       (usart6_ker_clk_req),
      .usart1_ker_clk_req       (usart1_ker_clk_req),
      .i2c4_ker_clk_req         (i2c4_ker_clk_req),
      .lpuart1_ker_clk_req      (lpuart1_ker_clk_req),
      .pll1_p_clk               (pll1_p_clk),
      .pll1_q_clk               (pll1_q_clk),
      .pll2_p_clk               (pll2_p_clk),
      .pll2_q_clk               (pll2_q_clk),
      .pll2_r_clk               (pll2_r_clk),
      .pll3_p_clk               (pll3_p_clk),
      .pll3_q_clk               (pll3_q_clk),
      .pll3_r_clk               (pll3_r_clk),
      .I2S_clk_IN               (I2S_clk_IN),
      .axibridge_d1_busy        (axibridge_d1_busy),
      .ahb3bridge_d1_busy       (ahb3bridge_d1_busy),
      .apb3bridge_d1_busy       (apb3bridge_d1_busy),
      .ahb1bridge_d2_busy       (ahb1bridge_d2_busy),
      .ahb2bridge_d2_busy       (ahb2bridge_d2_busy),
      .apb1bridge_d2_busy       (apb1bridge_d2_busy),
      .apb2bridge_d2_busy       (apb2bridge_d2_busy),
      .ahb4bridge_d3_busy       (ahb4bridge_d3_busy),
      .apb4bridge_d3_busy       (apb4bridge_d3_busy),
      .flash_busy               (flash_busy),
      .eth_rcc_fes              (eth_rcc_fes),
      .eth_rcc_epis_2           (eth_rcc_epis_2),
      .cur_rcc_bdcr_bdrst       (cur_rcc_bdcr_bdrst),
      .cur_rcc_bdcr_rtcen       (cur_rcc_bdcr_rtcen),
      .cur_rcc_bdcr_rtcsel      (cur_rcc_bdcr_rtcsel[1:0]),
      .cur_rcc_bdcr_lsecssd     (cur_rcc_bdcr_lsecssd),
      .cur_rcc_bdcr_lsecsson    (cur_rcc_bdcr_lsecsson),
      .cur_rcc_bdcr_lsedrv      (cur_rcc_bdcr_lsedrv[1:0]),
      .cur_rcc_bdcr_lsebyp      (cur_rcc_bdcr_lsebyp),
      .cur_rcc_bdcr_lserdy      (cur_rcc_bdcr_lserdy),
      .cur_rcc_bdcr_lseon       (cur_rcc_bdcr_lseon),
      .cur_rcc_c1_rsr_lpwr2rstf (cur_rcc_c1_rsr_lpwr2rstf),
      .cur_rcc_c1_rsr_lpwr1rstf (cur_rcc_c1_rsr_lpwr1rstf),
      .cur_rcc_c1_rsr_wwdg2rstf (cur_rcc_c1_rsr_wwdg2rstf),
      .cur_rcc_c1_rsr_wwdg1rstf (cur_rcc_c1_rsr_wwdg1rstf),
      .cur_rcc_c1_rsr_iwdg2rstf (cur_rcc_c1_rsr_iwdg2rstf),
      .cur_rcc_c1_rsr_iwdg1rstf (cur_rcc_c1_rsr_iwdg1rstf),
      .cur_rcc_c1_rsr_sft2rstf  (cur_rcc_c1_rsr_sft2rstf),
      .cur_rcc_c1_rsr_sft1rstf  (cur_rcc_c1_rsr_sft1rstf),
      .cur_rcc_c1_rsr_porrstf   (cur_rcc_c1_rsr_porrstf),
      .cur_rcc_c1_rsr_pinrstf   (cur_rcc_c1_rsr_pinrstf),
      .cur_rcc_c1_rsr_borrstf   (cur_rcc_c1_rsr_borrstf),
      .cur_rcc_c1_rsr_d2rstf    (cur_rcc_c1_rsr_d2rstf),
      .cur_rcc_c1_rsr_d1rstf    (cur_rcc_c1_rsr_d1rstf),
      .cur_rcc_c1_rsr_oblrstf   (cur_rcc_c1_rsr_oblrstf),
      .cur_rcc_c1_rsr_rmvf      (cur_rcc_c1_rsr_rmvf),
      .cur_rcc_c2_rsr_lpwr2rstf (cur_rcc_c2_rsr_lpwr2rstf),
      .cur_rcc_c2_rsr_lpwr1rstf (cur_rcc_c2_rsr_lpwr1rstf),
      .cur_rcc_c2_rsr_wwdg2rstf (cur_rcc_c2_rsr_wwdg2rstf),
      .cur_rcc_c2_rsr_wwdg1rstf (cur_rcc_c2_rsr_wwdg1rstf),
      .cur_rcc_c2_rsr_iwdg2rstf (cur_rcc_c2_rsr_iwdg2rstf),
      .cur_rcc_c2_rsr_iwdg1rstf (cur_rcc_c2_rsr_iwdg1rstf),
      .cur_rcc_c2_rsr_sft2rstf  (cur_rcc_c2_rsr_sft2rstf),
      .cur_rcc_c2_rsr_sft1rstf  (cur_rcc_c2_rsr_sft1rstf),
      .cur_rcc_c2_rsr_porrstf   (cur_rcc_c2_rsr_porrstf),
      .cur_rcc_c2_rsr_pinrstf   (cur_rcc_c2_rsr_pinrstf),
      .cur_rcc_c2_rsr_borrstf   (cur_rcc_c2_rsr_borrstf),
      .cur_rcc_c2_rsr_d2rstf    (cur_rcc_c2_rsr_d2rstf),
      .cur_rcc_c2_rsr_d1rstf    (cur_rcc_c2_rsr_d1rstf),
      .cur_rcc_c2_rsr_oblrstf   (cur_rcc_c2_rsr_oblrstf),
      .cur_rcc_c2_rsr_rmvf      (cur_rcc_c2_rsr_rmvf),
      .cur_rcc_csr_lsirdy       (cur_rcc_csr_lsirdy),
      .cur_rcc_csr_lsion        (cur_rcc_csr_lsion)
  );


endmodule
