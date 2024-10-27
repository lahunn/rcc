module rcc_vsw_top (
  input pwr_vsw_rst,
  input sync_vsw_rst_n,// vsw reset signal sync with sys clk
  //hse rtc clk
  input hse_rtc_clk,//hse clock from vcore domain
  input lsi_clk,//lsi clock from vdd domain
  input lse_clk,//lsi clock from vsw domain
  //test mode
  input test_mode,
  /*AUTOINPUT*/
  /*AUTOOUTPUT*/
  //rtc kernel clk
  output rcc_rtc_ker_clk,
  //vsw reset signal not sync with sys clk
  output pre_vsw_rst_n
);

  /*AUTOWIRE*/
  wire rcc_rtcsel_clk;
  wire rcc_vsw_rst_n;
  wire lse_clk_gated;

  // End of automatics
  assign pre_vsw_rst_n = (~bdrst) & (~pwr_vsw_rst);
  assign rcc_vsw_rst_n = sync_vsw_rst_n;

  // rcc vsw registers
  rcc_vsw_reg u_rcc_vsw_reg (
      .rst_n(rcc_vsw_rst_n),
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
