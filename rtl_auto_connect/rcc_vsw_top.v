module rcc_vsw_top (
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);

  /*AUTOWIRE*/
  /*AUTO DECLARE*/

  // Beginning of automatic regs (for this module's undeclared outputs)
  reg rcc_rtc_ker_clk;
  // End of automatics
  assign bdrst_n       = ~bdrst;
  assign rcc_vsw_rst_n = bdrst_n & ~pwr_vsw_rst;

  // rcc vsw registers
  rcc_vsw_reg u_rcc_vsw_reg (
      .rst_n(bdrst_n),
      /*AUTOINST*/
  );
  // rtc ker clock gate
  BB_clk_gating rcc_rtc_ker_clk_gate (
      .raw_clk(rcc_rtcsel_clk),
      .active (rtcen),
      .bypass (test_mode),
      .gen_clk(rcc_rtc_ker_clk)
  );

  // rtc ker clock select logic
  glitch_free_clk_switch #(
      .CLK_NUM(4)
  ) rcc_rtc_clk_switch (
      .clk_in ({hse_rtc_clk, lsi_clk, lse_clk_gated, 1'b0}),
      .sel    (rtcsel),
      .rst_n  (rcc_vsw_rst_n),
      .clk_out(rcc_rtcsel_clk)
  );

  // lse clock gate
  BB_clk_gating rcc_lse_clk_gate (
      .raw_clk(lse_clk),
      .active (~lsecss_fail),
      .bypass (test_mode),
      .gen_clk(lse_clk_gated)
  );


  // level shift
  // level shift should be added in integration
  // voltage isolation 
  // voltage isolation should be added in integration
endmodule
