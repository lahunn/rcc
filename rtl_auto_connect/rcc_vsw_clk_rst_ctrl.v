// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : RCC VSW domain clock and reset control
// ****************************************************************
module rcc_vsw_clk_rst_ctrl (
    //test mode
    input        testmode,
    input        test_rst_n,
    input        test_clk,
    input        scan_mode,
    //reset signals
    input        pwr_vsw_rst,
    input        bdrst,
    //hse rtc clk
    input        hse_rtc_clk,            //hse clock from vcore domain
    input        lsi_clk,                //lsi clock from vdd domain
    input        lse_clk,                //lsi clock from vsw domain
    input        lsecss_fail,
    //rtc clock control
    input        rtcen,
    input  [1:0] rtcsel,
    //rtc kernel clk
    output       rcc_rtc_ker_clk,
    //vsw reset signal not sync with sys clk
    output       vsw_rst_n,
    output       rtc_clk_sync_vsw_rst_n
);
  wire rcc_rtcsel_clk;
  wire rtcsel_clk_0;
  wire hse_rtc_sync_vsw_rst_n;
  wire lsi_sync_vsw_rst_n;
  wire lse_sync_vsw_rst_n;
  wire raw_vsw_rst_n;
  wire rtcsel_clk_rst_0;

  //================================================================
  // vsw rst control
  //================================================================
  assign raw_vsw_rst_n = (~bdrst) && (~pwr_vsw_rst);

  test_rst_mux u_vsw_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_vsw_rst_n),
      .testmode  (testmode),
      .rst_n     (vsw_rst_n)
  );

  //================================================================
  // vsw_rst_n sync with different clocks
  //================================================================

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_rtc_clk_sync_vsw_rst_n_sync (
      .src_rst_n(vsw_rst_n),
      .clk      (rcc_rtcsel_clk),
      .testmode (testmode),
      .gen_rst_n(rtc_clk_sync_vsw_rst_n)
  );


  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_hse_rtc_vsw_rst_sync (
      .src_rst_n(vsw_rst_n),
      .clk      (hse_rtc_clk),
      .testmode (testmode),
      .gen_rst_n(hse_rtc_sync_vsw_rst_n)
  );


  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_lsi_vsw_rst_sync (
      .src_rst_n(vsw_rst_n),
      .clk      (lsi_clk),
      .testmode (testmode),
      .gen_rst_n(lsi_sync_vsw_rst_n)
  );


  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_lse_vsw_rst_sync (
      .src_rst_n(vsw_rst_n),
      .clk      (lse_clk),
      .testmode (testmode),
      .gen_rst_n(lse_sync_vsw_rst_n)
  );

  //================================================================
  // vsw clock control
  //================================================================

  // rtcsel_clk_0 test clock mux
  test_clk_mux u_rtcsel_clk_0_tmux (
      .test_clk (test_clk),
      .func_clk (1'b0),
      .scan_mode(scan_mode),
      .gen_clk  (rtcsel_clk_0)
  );

  // rtcsel_clk_rst_0 test reset mux
  test_rst_mux u_rtcsel_clk_rst_0_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(1'b0),
      .testmode  (testmode),
      .rst_n     (rtcsel_clk_rst_0)
  );
  // rtc ker clock select logic
  glitch_free_clk_switch #(
      .CLK_NUM(4)
  ) u_rcc_rtc_clk_switch (
      .i_clk    ({hse_rtc_clk, lsi_clk, lse_clk, rtcsel_clk_0}),
      .clk_fail ({2'b0, lsecss_fail, 1'b1}),
      .sel      (rtcsel),
      .rst_n    ({hse_rtc_sync_vsw_rst_n, lsi_sync_vsw_rst_n, lse_sync_vsw_rst_n, rtcsel_clk_rst_0}),
      .scan_mode(scan_mode),
      .test_clk (test_clk),
      .o_clk    (rcc_rtcsel_clk)
  );

  // rtc ker clock gate
  en_as_clk_gating u_rtc_ker_clk_gating (
      .raw_clk(rcc_rtcsel_clk),
      .active (rtcen),
      .bypass (testmode),
      .rst_n  (rtc_clk_sync_vsw_rst_n),
      .gen_clk(rcc_rtc_ker_clk)
  );

endmodule
