// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : RCC VCORE TOP
// ****************************************************************
module rcc_vcore_top #(
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
    parameter AW = 32,
    parameter DW = 32,
    parameter WW = 4
) (
    /*AUTOINPUT*/
    input        raw_i2s_clk_in,
    input        raw_usb_phy1,
    input        raw_lsi_clk,
    input        raw_lse_clk,
    input        raw_csi_origin_clk,
    input        raw_hse_origin_clk,
    input        raw_hsi48_origin_clk,
    input        raw_hsi_origin_clk,
    input        raw_pad_rcc_eth_mii_tx_clk,
    input        raw_pad_rcc_eth_mii_rx_clk,
    input        raw_pll1_p_clk,
    input        raw_pll1_q_clk,
    input        raw_pll2_p_clk,
    input        raw_pll2_q_clk,
    input        raw_pll2_r_clk,
    input        raw_pll3_p_clk,
    input        raw_pll3_q_clk,
    input        raw_pll3_r_clk,
    //rcc_vsw reg outputs
    input        cur_rcc_bdcr_bdrst,          // vsw to vcore
    input        cur_rcc_bdcr_lsebyp,         // vsw to vcore
    input        cur_rcc_bdcr_lsecssd,        // vsw to vcore
    input        cur_rcc_bdcr_lsecsson,       // vsw to vcore
    input  [1:0] cur_rcc_bdcr_lsedrv,         // vsw to vcore
    input        cur_rcc_bdcr_lseon,          // vsw to vcore
    input        cur_rcc_bdcr_rtcen,          // vsw to vcore
    input  [1:0] cur_rcc_bdcr_rtcsel,         // vsw to vcore
    // rcc_vdd_reg Outputs
    input        cur_rcc_c1_rsr_lpwr2rstf,    //vdd to vcore
    input        cur_rcc_c1_rsr_lpwr1rstf,    //vdd to vcore
    input        cur_rcc_c1_rsr_wwdg2rstf,    //vdd to vcore
    input        cur_rcc_c1_rsr_wwdg1rstf,    //vdd to vcore
    input        cur_rcc_c1_rsr_iwdg2rstf,    //vdd to vcore
    input        cur_rcc_c1_rsr_iwdg1rstf,    //vdd to vcore
    input        cur_rcc_c1_rsr_sft2rstf,     //vdd to vcore
    input        cur_rcc_c1_rsr_sft1rstf,     //vdd to vcore
    input        cur_rcc_c1_rsr_porrstf,      //vdd to vcore
    input        cur_rcc_c1_rsr_pinrstf,      //vdd to vcore
    input        cur_rcc_c1_rsr_borrstf,      //vdd to vcore
    input        cur_rcc_c1_rsr_d2rstf,       //vdd to vcore
    input        cur_rcc_c1_rsr_d1rstf,       //vdd to vcore
    input        cur_rcc_c1_rsr_oblrstf,      //vdd to vcore
    input        cur_rcc_c1_rsr_rmvf,         //vdd to vcore
    input        cur_rcc_c2_rsr_lpwr2rstf,    //vdd to vcore
    input        cur_rcc_c2_rsr_lpwr1rstf,    //vdd to vcore
    input        cur_rcc_c2_rsr_wwdg2rstf,    //vdd to vcore
    input        cur_rcc_c2_rsr_wwdg1rstf,    //vdd to vcore
    input        cur_rcc_c2_rsr_iwdg2rstf,    //vdd to vcore
    input        cur_rcc_c2_rsr_iwdg1rstf,    //vdd to vcore
    input        cur_rcc_c2_rsr_sft2rstf,     //vdd to vcore
    input        cur_rcc_c2_rsr_sft1rstf,     //vdd to vcore
    input        cur_rcc_c2_rsr_porrstf,      //vdd to vcore
    input        cur_rcc_c2_rsr_pinrstf,      //vdd to vcore
    input        cur_rcc_c2_rsr_borrstf,      //vdd to vcore
    input        cur_rcc_c2_rsr_d2rstf,       //vdd to vcore
    input        cur_rcc_c2_rsr_d1rstf,       //vdd to vcore
    input        cur_rcc_c2_rsr_oblrstf,      //vdd to vcore
    input        cur_rcc_c2_rsr_rmvf,         //vdd to vcore
    input        cur_rcc_csr_lsion,           //vdd to vcore
    /*AUTOOUTPUT*/
    //bus clock signals
    output       rcc_axibridge_d1_clk,
    output       rcc_ahb3bridge_d1_clk,
    output       rcc_apb3bridge_d1_clk,
    output       rcc_ahb1bridge_d2_clk,
    output       rcc_ahb2bridge_d2_clk,
    output       rcc_apb1bridge_d2_clk,
    output       rcc_apb2bridge_d2_clk,
    output       rcc_ahb4bridge_d3_clk,
    output       rcc_apb4bridge_d3_clk
);
  wire [DW-1:0] rdata;
  wire [   1:0] rsp;
  wire          mreq;
  wire [AW-1:0] maddr;
  wire [WW-1:0] mwstrb;
  wire          sync_lsecss_fail;
  wire          sync_hsecss_fail;
  wire          sync_hsecss_fail_rst;  //async reset sync release

  //select signals
  wire [   1:0] raw_pllsrc;
  wire [   2:0] raw_mco1sel;
  wire [   2:0] raw_mco2sel;
  wire [   1:0] raw_sw;
  wire          raw_hrtimsel;
  wire [   1:0] raw_clkpersel;
  //division ratio signals
  wire [   1:0] raw_hsidiv;
  wire [   5:0] raw_divm1;
  wire [   5:0] raw_divm2;
  wire [   5:0] raw_divm3;
  wire [   3:0] raw_mco1pre;
  wire [   3:0] raw_mco2pre;
  wire [   5:0] raw_rtcpre;
  wire [   3:0] raw_d1cpre;
  wire [   2:0] raw_d1ppre;
  wire [   3:0] raw_hpre;
  wire [   2:0] raw_d2ppre1;
  wire [   2:0] raw_d2ppre2;
  wire [   2:0] raw_d3ppre;
  wire          raw_timpre;

  wire          gen_eth_rcc_fes;
  wire          gen_eth_rcc_epis_2;

  // rcc_vcore_dft_sig_loopback Outputs
  wire          gen_cur_rcc_bdcr_bdrst;
  wire          gen_cur_rcc_bdcr_lsebyp;
  wire          gen_cur_rcc_bdcr_lsecssd;
  wire          gen_cur_rcc_bdcr_lsecsson;
  wire [   1:0] gen_cur_rcc_bdcr_lsedrv;
  wire          gen_cur_rcc_bdcr_lseon;
  wire          gen_cur_rcc_bdcr_rtcen;
  wire [   1:0] gen_cur_rcc_bdcr_rtcsel;
  wire          gen_cur_rcc_c1_rsr_lpwr2rstf;
  wire          gen_cur_rcc_c1_rsr_lpwr1rstf;
  wire          gen_cur_rcc_c1_rsr_wwdg2rstf;
  wire          gen_cur_rcc_c1_rsr_wwdg1rstf;
  wire          gen_cur_rcc_c1_rsr_iwdg2rstf;
  wire          gen_cur_rcc_c1_rsr_iwdg1rstf;
  wire          gen_cur_rcc_c1_rsr_sft2rstf;
  wire          gen_cur_rcc_c1_rsr_sft1rstf;
  wire          gen_cur_rcc_c1_rsr_porrstf;
  wire          gen_cur_rcc_c1_rsr_pinrstf;
  wire          gen_cur_rcc_c1_rsr_borrstf;
  wire          gen_cur_rcc_c1_rsr_d2rstf;
  wire          gen_cur_rcc_c1_rsr_d1rstf;
  wire          gen_cur_rcc_c1_rsr_oblrstf;
  wire          gen_cur_rcc_c1_rsr_rmvf;
  wire          gen_cur_rcc_c2_rsr_lpwr2rstf;
  wire          gen_cur_rcc_c2_rsr_lpwr1rstf;
  wire          gen_cur_rcc_c2_rsr_wwdg2rstf;
  wire          gen_cur_rcc_c2_rsr_wwdg1rstf;
  wire          gen_cur_rcc_c2_rsr_iwdg2rstf;
  wire          gen_cur_rcc_c2_rsr_iwdg1rstf;
  wire          gen_cur_rcc_c2_rsr_sft2rstf;
  wire          gen_cur_rcc_c2_rsr_sft1rstf;
  wire          gen_cur_rcc_c2_rsr_porrstf;
  wire          gen_cur_rcc_c2_rsr_pinrstf;
  wire          gen_cur_rcc_c2_rsr_borrstf;
  wire          gen_cur_rcc_c2_rsr_d2rstf;
  wire          gen_cur_rcc_c2_rsr_d1rstf;
  wire          gen_cur_rcc_c2_rsr_oblrstf;
  wire          gen_cur_rcc_c2_rsr_rmvf;
  wire          gen_cur_rcc_csr_lsion;
  /*AUTOWIRE*/


  //==============================================================================
  //rcc_ahb_lite bus
  //==============================================================================

  rcc_ahb2reg #(  /*AUTOINSTPARAM*/
  ) u_rcc_ahb2reg (
      .hclk   (rcc_rcc_hclk),
      .hresetn(rcc_rcc_sync_rst_n),
      .mwrite (),
      .sready (1'b1),
      .sresp  (rsp[0]),
      .sdata  (rdata),
      .mreq   (mreq),
      .mwstrb (mwstrb),
      .maddr  (maddr)
      /*AUTOINST*/
  );
  //================================================================
  //================================================================
  // DFT logic
  //================================================================
  //================================================================
  //scan_chain logic to increase the scan coverage
  rcc_vcore_scan_inc #(  /*AUTOINSTPARAM*/
  ) u_rcc_vcore_scan_inc (
  /*AUTOINST*/
  );

  //================================================================
  // rcc port clock mux 
  //================================================================
  rcc_vcore_port_clock_rst_mux u_rcc_vcore_port_clock_rst_mux (
  /*AUTOINST*/
  );
  //================================================================
  // cross domian signal loopback in dft mode
  //================================================================
  rcc_vcore_dft_sig_loopback u_rcc_vcore_dft_sig_loopback (
      .testmode                     (testmode),
      .rcc_vdd_wdata                (rcc_vdd_wdata),
      .nxt_rcc_bdcr_bdrst           (nxt_rcc_bdcr_bdrst),
      .nxt_rcc_bdcr_lsebyp          (nxt_rcc_bdcr_lsebyp),
      .nxt_rcc_bdcr_lsecsson        (nxt_rcc_bdcr_lsecsson),
      .nxt_rcc_bdcr_lsedrv          (nxt_rcc_bdcr_lsedrv),
      .nxt_rcc_bdcr_lseon           (nxt_rcc_bdcr_lseon),
      .nxt_rcc_bdcr_rtcen           (nxt_rcc_bdcr_rtcen),
      .nxt_rcc_bdcr_rtcsel          (nxt_rcc_bdcr_rtcsel),
      .func_cur_rcc_bdcr_bdrst      (cur_rcc_bdcr_bdrst),
      .func_cur_rcc_bdcr_lsebyp     (cur_rcc_bdcr_lsebyp),
      .func_cur_rcc_bdcr_lsecssd    (cur_rcc_bdcr_lsecssd),
      .func_cur_rcc_bdcr_lsecsson   (cur_rcc_bdcr_lsecsson),
      .func_cur_rcc_bdcr_lsedrv     (cur_rcc_bdcr_lsedrv),
      .func_cur_rcc_bdcr_lseon      (cur_rcc_bdcr_lseon),
      .func_cur_rcc_bdcr_rtcen      (cur_rcc_bdcr_rtcen),
      .func_cur_rcc_bdcr_rtcsel     (cur_rcc_bdcr_rtcsel),
      .func_cur_rcc_c1_rsr_lpwr2rstf(cur_rcc_c1_rsr_lpwr2rstf),
      .func_cur_rcc_c1_rsr_lpwr1rstf(cur_rcc_c1_rsr_lpwr1rstf),
      .func_cur_rcc_c1_rsr_wwdg2rstf(cur_rcc_c1_rsr_wwdg2rstf),
      .func_cur_rcc_c1_rsr_wwdg1rstf(cur_rcc_c1_rsr_wwdg1rstf),
      .func_cur_rcc_c1_rsr_iwdg2rstf(cur_rcc_c1_rsr_iwdg2rstf),
      .func_cur_rcc_c1_rsr_iwdg1rstf(cur_rcc_c1_rsr_iwdg1rstf),
      .func_cur_rcc_c1_rsr_sft2rstf (cur_rcc_c1_rsr_sft2rstf),
      .func_cur_rcc_c1_rsr_sft1rstf (cur_rcc_c1_rsr_sft1rstf),
      .func_cur_rcc_c1_rsr_porrstf  (cur_rcc_c1_rsr_porrstf),
      .func_cur_rcc_c1_rsr_pinrstf  (cur_rcc_c1_rsr_pinrstf),
      .func_cur_rcc_c1_rsr_borrstf  (cur_rcc_c1_rsr_borrstf),
      .func_cur_rcc_c1_rsr_d2rstf   (cur_rcc_c1_rsr_d2rstf),
      .func_cur_rcc_c1_rsr_d1rstf   (cur_rcc_c1_rsr_d1rstf),
      .func_cur_rcc_c1_rsr_oblrstf  (cur_rcc_c1_rsr_oblrstf),
      .func_cur_rcc_c1_rsr_rmvf     (cur_rcc_c1_rsr_rmvf),
      .func_cur_rcc_c2_rsr_lpwr2rstf(cur_rcc_c2_rsr_lpwr2rstf),
      .func_cur_rcc_c2_rsr_lpwr1rstf(cur_rcc_c2_rsr_lpwr1rstf),
      .func_cur_rcc_c2_rsr_wwdg2rstf(cur_rcc_c2_rsr_wwdg2rstf),
      .func_cur_rcc_c2_rsr_wwdg1rstf(cur_rcc_c2_rsr_wwdg1rstf),
      .func_cur_rcc_c2_rsr_iwdg2rstf(cur_rcc_c2_rsr_iwdg2rstf),
      .func_cur_rcc_c2_rsr_iwdg1rstf(cur_rcc_c2_rsr_iwdg1rstf),
      .func_cur_rcc_c2_rsr_sft2rstf (cur_rcc_c2_rsr_sft2rstf),
      .func_cur_rcc_c2_rsr_sft1rstf (cur_rcc_c2_rsr_sft1rstf),
      .func_cur_rcc_c2_rsr_porrstf  (cur_rcc_c2_rsr_porrstf),
      .func_cur_rcc_c2_rsr_pinrstf  (cur_rcc_c2_rsr_pinrstf),
      .func_cur_rcc_c2_rsr_borrstf  (cur_rcc_c2_rsr_borrstf),
      .func_cur_rcc_c2_rsr_d2rstf   (cur_rcc_c2_rsr_d2rstf),
      .func_cur_rcc_c2_rsr_d1rstf   (cur_rcc_c2_rsr_d1rstf),
      .func_cur_rcc_c2_rsr_oblrstf  (cur_rcc_c2_rsr_oblrstf),
      .func_cur_rcc_c2_rsr_rmvf     (cur_rcc_c2_rsr_rmvf),
      .func_cur_rcc_csr_lsion       (cur_rcc_csr_lsion),

      .gen_cur_rcc_bdcr_bdrst      (gen_cur_rcc_bdcr_bdrst),
      .gen_cur_rcc_bdcr_lsebyp     (gen_cur_rcc_bdcr_lsebyp),
      .gen_cur_rcc_bdcr_lsecssd    (gen_cur_rcc_bdcr_lsecssd),
      .gen_cur_rcc_bdcr_lsecsson   (gen_cur_rcc_bdcr_lsecsson),
      .gen_cur_rcc_bdcr_lsedrv     (gen_cur_rcc_bdcr_lsedrv),
      .gen_cur_rcc_bdcr_lseon      (gen_cur_rcc_bdcr_lseon),
      .gen_cur_rcc_bdcr_rtcen      (gen_cur_rcc_bdcr_rtcen),
      .gen_cur_rcc_bdcr_rtcsel     (gen_cur_rcc_bdcr_rtcsel),
      .gen_cur_rcc_c1_rsr_lpwr2rstf(gen_cur_rcc_c1_rsr_lpwr2rstf),
      .gen_cur_rcc_c1_rsr_lpwr1rstf(gen_cur_rcc_c1_rsr_lpwr1rstf),
      .gen_cur_rcc_c1_rsr_wwdg2rstf(gen_cur_rcc_c1_rsr_wwdg2rstf),
      .gen_cur_rcc_c1_rsr_wwdg1rstf(gen_cur_rcc_c1_rsr_wwdg1rstf),
      .gen_cur_rcc_c1_rsr_iwdg2rstf(gen_cur_rcc_c1_rsr_iwdg2rstf),
      .gen_cur_rcc_c1_rsr_iwdg1rstf(gen_cur_rcc_c1_rsr_iwdg1rstf),
      .gen_cur_rcc_c1_rsr_sft2rstf (gen_cur_rcc_c1_rsr_sft2rstf),
      .gen_cur_rcc_c1_rsr_sft1rstf (gen_cur_rcc_c1_rsr_sft1rstf),
      .gen_cur_rcc_c1_rsr_porrstf  (gen_cur_rcc_c1_rsr_porrstf),
      .gen_cur_rcc_c1_rsr_pinrstf  (gen_cur_rcc_c1_rsr_pinrstf),
      .gen_cur_rcc_c1_rsr_borrstf  (gen_cur_rcc_c1_rsr_borrstf),
      .gen_cur_rcc_c1_rsr_d2rstf   (gen_cur_rcc_c1_rsr_d2rstf),
      .gen_cur_rcc_c1_rsr_d1rstf   (gen_cur_rcc_c1_rsr_d1rstf),
      .gen_cur_rcc_c1_rsr_oblrstf  (gen_cur_rcc_c1_rsr_oblrstf),
      .gen_cur_rcc_c1_rsr_rmvf     (gen_cur_rcc_c1_rsr_rmvf),
      .gen_cur_rcc_c2_rsr_lpwr2rstf(gen_cur_rcc_c2_rsr_lpwr2rstf),
      .gen_cur_rcc_c2_rsr_lpwr1rstf(gen_cur_rcc_c2_rsr_lpwr1rstf),
      .gen_cur_rcc_c2_rsr_wwdg2rstf(gen_cur_rcc_c2_rsr_wwdg2rstf),
      .gen_cur_rcc_c2_rsr_wwdg1rstf(gen_cur_rcc_c2_rsr_wwdg1rstf),
      .gen_cur_rcc_c2_rsr_iwdg2rstf(gen_cur_rcc_c2_rsr_iwdg2rstf),
      .gen_cur_rcc_c2_rsr_iwdg1rstf(gen_cur_rcc_c2_rsr_iwdg1rstf),
      .gen_cur_rcc_c2_rsr_sft2rstf (gen_cur_rcc_c2_rsr_sft2rstf),
      .gen_cur_rcc_c2_rsr_sft1rstf (gen_cur_rcc_c2_rsr_sft1rstf),
      .gen_cur_rcc_c2_rsr_porrstf  (gen_cur_rcc_c2_rsr_porrstf),
      .gen_cur_rcc_c2_rsr_pinrstf  (gen_cur_rcc_c2_rsr_pinrstf),
      .gen_cur_rcc_c2_rsr_borrstf  (gen_cur_rcc_c2_rsr_borrstf),
      .gen_cur_rcc_c2_rsr_d2rstf   (gen_cur_rcc_c2_rsr_d2rstf),
      .gen_cur_rcc_c2_rsr_d1rstf   (gen_cur_rcc_c2_rsr_d1rstf),
      .gen_cur_rcc_c2_rsr_oblrstf  (gen_cur_rcc_c2_rsr_oblrstf),
      .gen_cur_rcc_c2_rsr_rmvf     (gen_cur_rcc_c2_rsr_rmvf),
      .gen_cur_rcc_csr_lsion       (gen_cur_rcc_csr_lsion)
  );


  //==============================================================================
  //signal synchronize 
  //==============================================================================

  rcc_port_signal_sync u_rcc_port_signal_sync (
  /*AUTOINST*/
  );

  rcc_port_rst_sync u_rcc_port_rst_sync (
  /*AUTOINST*/
  );


  //==============================================================================
  //clock and reset control
  //==============================================================================
  rcc_sys_clk_rst_ctrl #(  /*AUTOINSTPARAM*/
  ) u_rcc_sys_clk_rst_ctrl (
      .bdrst(gen_cur_rcc_bdcr_bdrst)
      /*AUTOINST*/
  );

  //rcc_per_clk_rst_control

  rcc_per_clk_rst_control #(  /*AUTOINSTPARAM*/
  ) u_rcc_per_clk_rst_control (
  /*AUTOINST*/
  );

  //rcc_eth_ker_clk_ctrl
  rcc_eth_ker_clk_ctrl u_rcc_eth_ker_clk_ctrl (
      .rst_n             (sys_rst_n),
      .eth_rcc_fes       (gen_eth_rcc_fes),
      .eth_rcc_epis_2    (gen_eth_rcc_epis_2),
      .rcc_c1_eth1rx_en  (rcc_c1_mac_en),
      .rcc_c1_eth1rx_lpen(rcc_c1_mac_lpen),
      .rcc_c1_eth1tx_en  (rcc_c1_mac_en),
      .rcc_c1_eth1tx_lpen(rcc_c1_mac_lpen)
      /*AUTOINST*/
  );

  //================================================================
  // rcc config mux for atspeed test
  //================================================================
  rcc_config_mux u_rcc_config_mux (
      .gen_eth_rcc_fes   (gen_eth_rcc_fes),
      .gen_eth_rcc_epis_2(gen_eth_rcc_epis_2)
      /*AUTOINST*/
  );



  //==============================================================================
  //rcc_vcore_reg
  //==============================================================================
  rcc_vcore_reg #(  /*AUTOINSTPARAM*/
  ) u_rcc_vcore_reg (
      .clk                     (rcc_rcc_hclk),
      .rst_n                   (rcc_rcc_sync_rst_n),
      .req                     (mreq),
      .we                      (mwstrb),
      .addr                    (maddr),
      .rdata                   (rdata),
      .rsp                     (rsp),
      .cur_rcc_csr_lsirdy      (sync_lsi_rdy),
      .cur_rcc_bdcr_lserdy     (sync_lse_rdy),
      .pllsrc                  (raw_pllsrc),
      .mco1sel                 (raw_mco1sel),
      .mco2sel                 (raw_mco2sel),
      .sw                      (raw_sw),
      .hrtimsel                (raw_hrtimsel),
      .clkpersel               (raw_clkpersel),
      .hsidiv                  (raw_hsidiv),
      .divm1                   (raw_divm1),
      .divm2                   (raw_divm2),
      .divm3                   (raw_divm3),
      .mco1pre                 (raw_mco1pre),
      .mco2pre                 (raw_mco2pre),
      .rtcpre                  (raw_rtcpre),
      .d1cpre                  (raw_d1cpre),
      .d1ppre                  (raw_d1ppre),
      .hpre                    (raw_hpre),
      .d2ppre1                 (raw_d2ppre1),
      .d2ppre2                 (raw_d2ppre2),
      .d3ppre                  (raw_d3ppre),
      .timpre                  (raw_timpre),
      .cur_rcc_bdcr_bdrst      (gen_cur_rcc_bdcr_bdrst),
      .cur_rcc_bdcr_lsebyp     (gen_cur_rcc_bdcr_lsebyp),
      .cur_rcc_bdcr_lsecssd    (gen_cur_rcc_bdcr_lsecssd),
      .cur_rcc_bdcr_lsecsson   (gen_cur_rcc_bdcr_lsecsson),
      .cur_rcc_bdcr_lsedrv     (gen_cur_rcc_bdcr_lsedrv),
      .cur_rcc_bdcr_lseon      (gen_cur_rcc_bdcr_lseon),
      .cur_rcc_bdcr_rtcen      (gen_cur_rcc_bdcr_rtcen),
      .cur_rcc_bdcr_rtcsel     (gen_cur_rcc_bdcr_rtcsel),
      .cur_rcc_c1_rsr_lpwr2rstf(gen_cur_rcc_c1_rsr_lpwr2rstf),
      .cur_rcc_c1_rsr_lpwr1rstf(gen_cur_rcc_c1_rsr_lpwr1rstf),
      .cur_rcc_c1_rsr_wwdg2rstf(gen_cur_rcc_c1_rsr_wwdg2rstf),
      .cur_rcc_c1_rsr_wwdg1rstf(gen_cur_rcc_c1_rsr_wwdg1rstf),
      .cur_rcc_c1_rsr_iwdg2rstf(gen_cur_rcc_c1_rsr_iwdg2rstf),
      .cur_rcc_c1_rsr_iwdg1rstf(gen_cur_rcc_c1_rsr_iwdg1rstf),
      .cur_rcc_c1_rsr_sft2rstf (gen_cur_rcc_c1_rsr_sft2rstf),
      .cur_rcc_c1_rsr_sft1rstf (gen_cur_rcc_c1_rsr_sft1rstf),
      .cur_rcc_c1_rsr_porrstf  (gen_cur_rcc_c1_rsr_porrstf),
      .cur_rcc_c1_rsr_pinrstf  (gen_cur_rcc_c1_rsr_pinrstf),
      .cur_rcc_c1_rsr_borrstf  (gen_cur_rcc_c1_rsr_borrstf),
      .cur_rcc_c1_rsr_d2rstf   (gen_cur_rcc_c1_rsr_d2rstf),
      .cur_rcc_c1_rsr_d1rstf   (gen_cur_rcc_c1_rsr_d1rstf),
      .cur_rcc_c1_rsr_oblrstf  (gen_cur_rcc_c1_rsr_oblrstf),
      .cur_rcc_c1_rsr_rmvf     (gen_cur_rcc_c1_rsr_rmvf),
      .cur_rcc_c2_rsr_lpwr2rstf(gen_cur_rcc_c2_rsr_lpwr2rstf),
      .cur_rcc_c2_rsr_lpwr1rstf(gen_cur_rcc_c2_rsr_lpwr1rstf),
      .cur_rcc_c2_rsr_wwdg2rstf(gen_cur_rcc_c2_rsr_wwdg2rstf),
      .cur_rcc_c2_rsr_wwdg1rstf(gen_cur_rcc_c2_rsr_wwdg1rstf),
      .cur_rcc_c2_rsr_iwdg2rstf(gen_cur_rcc_c2_rsr_iwdg2rstf),
      .cur_rcc_c2_rsr_iwdg1rstf(gen_cur_rcc_c2_rsr_iwdg1rstf),
      .cur_rcc_c2_rsr_sft2rstf (gen_cur_rcc_c2_rsr_sft2rstf),
      .cur_rcc_c2_rsr_sft1rstf (gen_cur_rcc_c2_rsr_sft1rstf),
      .cur_rcc_c2_rsr_porrstf  (gen_cur_rcc_c2_rsr_porrstf),
      .cur_rcc_c2_rsr_pinrstf  (gen_cur_rcc_c2_rsr_pinrstf),
      .cur_rcc_c2_rsr_borrstf  (gen_cur_rcc_c2_rsr_borrstf),
      .cur_rcc_c2_rsr_d2rstf   (gen_cur_rcc_c2_rsr_d2rstf),
      .cur_rcc_c2_rsr_d1rstf   (gen_cur_rcc_c2_rsr_d1rstf),
      .cur_rcc_c2_rsr_oblrstf  (gen_cur_rcc_c2_rsr_oblrstf),
      .cur_rcc_c2_rsr_rmvf     (gen_cur_rcc_c2_rsr_rmvf),
      .cur_rcc_csr_lsion       (gen_cur_rcc_csr_lsion),
      .rngsel                  (),
      .rtcsel                  (),
      .sai1sel                 (),
      .sai23sel                (),
      .sai4asel                (),
      .sai4bsel                (),
      .sdmmcsel                (),
      .spdifsel                (),
      .spi123sel               (),
      .spi45sel                (),
      .spi6sel                 (),
      .swpmisel                (),
      .usart16sel              (),
      .usart234578sel          (),
      .usbsel                  (),
      .adcsel                  (),
      .cecsel                  (),
      .dfsdm1sel               (),
      .fdcansel                (),
      .fmcsel                  (),
      .i2c123sel               (),
      .i2c4sel                 (),
      .lptim1sel               (),
      .lptim2sel               (),
      .lptim345sel             (),
      .lpuart1sel              (),
      .qspisel                 ()
      /*AUTOINST*/
  );

endmodule
