module rcc_vsw_port_clock_mux (
    //================================================================
    // testmode singals
    //================================================================
    input  scan_mode,
    input  test_clk,
    input  raw_rcc_bdcr_byte2_wren,
    input  raw_rcc_bdcr_byte1_wren,
    input  raw_rcc_bdcr_byte0_wren,
    input  raw_hse_rtc_clk,
    input  raw_lse_clk,
    input  raw_lsi_clk,
    output rcc_bdcr_byte2_wren,
    output rcc_bdcr_byte1_wren,
    output rcc_bdcr_byte0_wren,
    output lse_clk,
    output lsi_clk,
    output hse_rtc_clk
);

  // rcc_bdcr_byte2_wren test clock mux
  test_clk_mux u_rcc_bdcr_byte2_wren_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_bdcr_byte2_wren),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_bdcr_byte2_wren)
  );

  // rcc_bdcr_byte1_wren test clock mux
  test_clk_mux u_rcc_bdcr_byte1_wren_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_bdcr_byte1_wren),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_bdcr_byte1_wren)
  );

  // rcc_bdcr_byte0_wren test clock mux
  test_clk_mux u_rcc_bdcr_byte0_wren_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_bdcr_byte0_wren),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_bdcr_byte0_wren)
  );

  //lse clock mux 
  test_clk_mux u_lse_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_lse_clk),
      .scan_mode(scan_mode),
      .gen_clk  (lse_clk)
  );

  //lsi clock mux 
  test_clk_mux u_lsi_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_lsi_clk),
      .scan_mode(scan_mode),
      .gen_clk  (lsi_clk)
  );

  test_clk_mux u_hse_rtc_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_hse_rtc_clk),
      .scan_mode(scan_mode),
      .gen_clk  (hse_rtc_clk)
  );

endmodule
