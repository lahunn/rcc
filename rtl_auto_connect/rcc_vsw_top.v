// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : RCC VSW top module
// ****************************************************************
module rcc_vsw_top (
    input pwr_vsw_rst,      // in vsw domain
    input sync_vsw_rst_n,   // vsw reset signal sync with sys clk
    //hse rtc clk
    input raw_hse_rtc_clk,  //hse clock from vcore domain
    input raw_lsi_clk,          //lsi clock from vdd domain
    input raw_lse_clk,          //lsi clock from vsw domain
    //test mode
    input testmode,
    input scan_mode,
    input test_clk,
    input test_rst_n,

    input       lsecss_fail,              // in vsw domain
    input       nxt_rcc_bdcr_bdrst,       // vcore to vsw
    input       nxt_rcc_bdcr_lsebyp,      // vcore to vsw
    input       nxt_rcc_bdcr_lsecsson,    // vcore to vsw
    input [1:0] nxt_rcc_bdcr_lsedrv,      // vcore to vsw
    input       nxt_rcc_bdcr_lseon,       // vcore to vsw
    input       nxt_rcc_bdcr_rtcen,       // vcore to vsw
    input [1:0] nxt_rcc_bdcr_rtcsel,      // vcore to vsw
    input       raw_rcc_bdcr_byte0_wren,  // vcore to vsw
    input       raw_rcc_bdcr_byte1_wren,  // vcore to vsw
    input       raw_rcc_bdcr_byte2_wren,  // vcore to vsw

    //rtc kernel clk
    output       rcc_rtc_ker_clk,        // in vsw domain
    //vsw reset signal not sync with sys clk
    output       vsw_rst_n,              // in vsw domain
    output       cur_rcc_bdcr_bdrst,     // vsw to vcore
    output       cur_rcc_bdcr_lsebyp,    // vsw to vcore
    output       cur_rcc_bdcr_lsecssd,   // vsw to vcore
    output       cur_rcc_bdcr_lsecsson,  // vsw to vcore
    output [1:0] cur_rcc_bdcr_lsedrv,    // vsw to vcore
    output       cur_rcc_bdcr_lseon,     // vsw to vcore
    output       cur_rcc_bdcr_rtcen,     // vsw to vcore
    output [1:0] cur_rcc_bdcr_rtcsel,    // vsw to vcore
    output       lsebyp,                 // in vsw domain
    output       lsecssd,                // in vsw domain
    output       lsecsson,               // in vsw domain
    output [1:0] lsedrv,                 // in vsw domain
    output       lseon,                  // in vsw domain
    output       rtc_clk_sync_vsw_rst_n  // in vsw domain
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);

  /*AUTOWIRE*/
  // rcc_vsw_dft_sig_loopback Outputs
  wire       gen_nxt_rcc_bdcr_bdrst;
  wire       gen_nxt_rcc_bdcr_lsebyp;
  wire       gen_nxt_rcc_bdcr_lsecsson;
  wire [1:0] gen_nxt_rcc_bdcr_lsedrv;
  wire       gen_nxt_rcc_bdcr_lseon;
  wire       gen_nxt_rcc_bdcr_rtcen;
  wire [1:0] gen_nxt_rcc_bdcr_rtcsel;
  ///================================================================
  // rcc vsw domain test clock mux 
  //================================================================

  rcc_vsw_port_clock_mux u_rcc_vsw_port_clock_mux (
      /*AUTOINST*/
  );

  rcc_vsw_dft_sig_loopback u_rcc_vsw_dft_sig_loopback (
      .testmode                  (testmode),
      .func_nxt_rcc_bdcr_bdrst   (nxt_rcc_bdcr_bdrst),
      .func_nxt_rcc_bdcr_lsebyp  (nxt_rcc_bdcr_lsebyp),
      .func_nxt_rcc_bdcr_lsecsson(nxt_rcc_bdcr_lsecsson),
      .func_nxt_rcc_bdcr_lsedrv  (nxt_rcc_bdcr_lsedrv),
      .func_nxt_rcc_bdcr_lseon   (nxt_rcc_bdcr_lseon),
      .func_nxt_rcc_bdcr_rtcen   (nxt_rcc_bdcr_rtcen),
      .func_nxt_rcc_bdcr_rtcsel  (nxt_rcc_bdcr_rtcsel),
      .cur_rcc_bdcr_bdrst        (cur_rcc_bdcr_bdrst),
      .cur_rcc_bdcr_lsebyp       (cur_rcc_bdcr_lsebyp),
      .cur_rcc_bdcr_lsecssd      (cur_rcc_bdcr_lsecssd),
      .cur_rcc_bdcr_lsecsson     (cur_rcc_bdcr_lsecsson),
      .cur_rcc_bdcr_lsedrv       (cur_rcc_bdcr_lsedrv),
      .cur_rcc_bdcr_lseon        (cur_rcc_bdcr_lseon),
      .cur_rcc_bdcr_rtcen        (cur_rcc_bdcr_rtcen),
      .cur_rcc_bdcr_rtcsel       (cur_rcc_bdcr_rtcsel),

      .gen_nxt_rcc_bdcr_bdrst   (gen_nxt_rcc_bdcr_bdrst),
      .gen_nxt_rcc_bdcr_lsebyp  (gen_nxt_rcc_bdcr_lsebyp),
      .gen_nxt_rcc_bdcr_lsecsson(gen_nxt_rcc_bdcr_lsecsson),
      .gen_nxt_rcc_bdcr_lsedrv  (gen_nxt_rcc_bdcr_lsedrv),
      .gen_nxt_rcc_bdcr_lseon   (gen_nxt_rcc_bdcr_lseon),
      .gen_nxt_rcc_bdcr_rtcen   (gen_nxt_rcc_bdcr_rtcen),
      .gen_nxt_rcc_bdcr_rtcsel  (gen_nxt_rcc_bdcr_rtcsel)
  );

  // rcc vsw registers
  rcc_vsw_reg u_rcc_vsw_reg (
      .rst_n                (sync_vsw_rst_n),
      .nxt_rcc_bdcr_bdrst   (gen_nxt_rcc_bdcr_bdrst),
      .nxt_rcc_bdcr_lsebyp  (gen_nxt_rcc_bdcr_lsebyp),
      .nxt_rcc_bdcr_lsecsson(gen_nxt_rcc_bdcr_lsecsson),
      .nxt_rcc_bdcr_lsedrv  (gen_nxt_rcc_bdcr_lsedrv),
      .nxt_rcc_bdcr_lseon   (gen_nxt_rcc_bdcr_lseon),
      .nxt_rcc_bdcr_rtcen   (gen_nxt_rcc_bdcr_rtcen),
      .nxt_rcc_bdcr_rtcsel  (gen_nxt_rcc_bdcr_rtcsel)
      /*AUTOINST*/
  );
  rcc_vsw_clk_rst_ctrl u_rcc_vsw_clk_rst_ctrl (
      /*AUTOINST*/
  );
  // level shift
  // level shift should be added in integration
  // voltage isolation 
  // voltage isolation should be added in integration
endmodule
