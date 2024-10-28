module rcc_vsw_clk_rst_ctrl (
    input        pwr_vsw_rst,
    input        bdrst,
    input        sync_vsw_rst_n,   // vsw reset signal sync with sys clk
    //hse rtc clk
    input        hse_rtc_clk,      //hse clock from vcore domain
    input        lsi_clk,          //lsi clock from vdd domain
    input        lse_clk,          //lsi clock from vsw domain
    input        lsecss_fail,
    //rtc clock control
    input        rtcen,
    input  [1:0] rtcsel,
    //rtc kernel clk
    output       rcc_rtc_ker_clk,
    //vsw reset signal not sync with sys clk
    output       pre_vsw_rst_n,
    //test mode
    input        testmode
);
  wire rcc_rtcsel_clk;
  wire lse_clk_gated;

  assign pre_vsw_rst_n = (~bdrst) & (~pwr_vsw_rst);

  // rtc ker clock gate
  BB_clk_gating rcc_rtc_ker_clk_gate (
      .raw_clk(rcc_rtcsel_clk),
      .active (rtcen),
      .bypass (testmode),
      .gen_clk(rcc_rtc_ker_clk)
  );

  // rtc ker clock select logic
  glitch_free_clk_switch #(
      .CLK_NUM(4)
  ) rcc_rtc_clk_switch (
      .i_clk   ({hse_rtc_clk, lsi_clk, lse_clk_gated, 1'b0}),
      .clk_fail({2'b0, lsecss_fail, 1'b1}),
      .sel     (rtcsel),
      .rst_n   (sync_vsw_rst_n),
      .o_clk   (rcc_rtcsel_clk)
  );

  // lse clock gate
  BB_clk_gating rcc_lse_clk_gate (
      .raw_clk(lse_clk),
      .active (~lsecss_fail),
      .bypass (testmode),
      .gen_clk(lse_clk_gated)
  );

endmodule