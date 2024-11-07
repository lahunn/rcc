module rcc_vsw_clk_rst_ctrl (
    input        pwr_vsw_rst,
    input        bdrst,
    input        sync_vsw_rst_n,   // vsw reset signal sync with sys clk
    //hse rtc clk
    input        hse_rtc_clk,      //hse clock from vcore domain
    input        lsi_clk,          //lsi clock from vdd domain
    input        lse_clk,          //lsi clock from vsw domain
    input        lsecss_fail,
    input        lse_rdy,
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
  wire gated_lse_clk;
  wire lse_clk_en;

  assign pre_vsw_rst_n = (~bdrst) && (~pwr_vsw_rst);

  // rtc ker clock gate
  rst_sync_clk_gating u_rtc_ker_clk_gating (
      .raw_clk(rcc_rtcsel_clk),
      .active (rtcen),
      .bypass (testmode),
      .rst_n  (pre_vsw_rst_n),
      .gen_clk(rcc_rtc_ker_clk)
  );

  // rtc ker clock select logic
  zero_glitch_free_clk_switch #(
      .CLK_NUM(4)
  ) rcc_rtc_clk_switch (
      .i_clk   ({hse_rtc_clk, lsi_clk, gated_lse_clk, 1'b0}),
      .clk_fail({2'b0, lsecss_fail, 1'b0}),
      .sel     (rtcsel),
      .rst_n   (sync_vsw_rst_n),
      .o_clk   (rcc_rtcsel_clk)
  );

  // lse clock gate
  assign lse_clk_en = lse_rdy;

  rst_sync_clk_gating u_lse_clk_gating (
      .raw_clk(lse_clk),
      .active (lse_clk_en),
      .bypass (testmode),
      .rst_n  (pre_vsw_rst_n),
      .gen_clk(gated_lse_clk)
  );

endmodule
