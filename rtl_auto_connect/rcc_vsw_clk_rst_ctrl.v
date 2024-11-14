// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : RCC VSW domain clock and reset control
// ****************************************************************
module rcc_vsw_clk_rst_ctrl (
    //test mode
    input        testmode,
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
    output       pre_vsw_rst_n,
    output       rtc_clk_sync_vsw_rst_n
);
  wire rcc_rtcsel_clk;
  wire hse_rtc_sync_vsw_rst_n;
  wire lsi_sync_vsw_rst_n;
  wire lse_sync_vsw_rst_n;

  assign pre_vsw_rst_n = (~bdrst) && (~pwr_vsw_rst);

  // rtc ker clock gate
  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_BB_reset_sync (
      .src_rst_n(pre_vsw_rst_n),
      .clk      (rcc_rtcsel_clk),
      .gen_rst_n(rtc_clk_sync_vsw_rst_n)
  );

  async_clk_gating u_rtc_ker_clk_gating (
      .raw_clk(rcc_rtcsel_clk),
      .active (rtcen),
      .bypass (testmode),
      .rst_n  (rtc_clk_sync_vsw_rst_n),
      .gen_clk(rcc_rtc_ker_clk)
  );

  // reset sync
  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_hse_rtc_vsw_rst_sync (
      .src_rst_n(pre_vsw_rst_n),
      .clk      (hse_rtc_clk),
      .gen_rst_n(hse_rtc_sync_vsw_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_lsi_vsw_rst_sync (
      .src_rst_n(pre_vsw_rst_n),
      .clk      (lsi_clk),
      .gen_rst_n(lsi_sync_vsw_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_lse_vsw_rst_sync (
      .src_rst_n(pre_vsw_rst_n),
      .clk      (lse_clk),
      .gen_rst_n(lse_sync_vsw_rst_n)
  );

  // rtc ker clock select logic
  glitch_free_clk_switch #(
      .CLK_NUM(4)
  ) u_rcc_rtc_clk_switch (
      .i_clk   ({hse_rtc_clk, lsi_clk, lse_clk, 1'b0}),
      .clk_fail({2'b0, lsecss_fail, 1'b1}),
      .sel     (rtcsel),
      .rst_n   ({hse_rtc_sync_vsw_rst_n, lsi_sync_vsw_rst_n, lse_sync_vsw_rst_n, 1'b0}),
      .o_clk   (rcc_rtcsel_clk)
  );

endmodule
