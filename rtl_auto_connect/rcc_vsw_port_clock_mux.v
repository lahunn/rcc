module rcc_vsw_port_clock_mux (
    input  raw_rcc_bdcr_byte2_wren,
    input  raw_rcc_bdcr_byte1_wren,
    input  raw_rcc_bdcr_byte0_wren,
    input  raw_hse_rtc_clk,
    input  lse_clk,
    input  scan_mode,
    input  test_clk,
    output rcc_bdcr_byte2_wren,
    output rcc_bdcr_byte1_wren,
    output rcc_bdcr_byte0_wren,
    output gen_lse_clk,
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
      .func_clk (lse_clk),
      .scan_mode(scan_mode),
      .gen_clk  (gen_lse_clk)
  );

  test_clk_mux u_hse_rtc_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_hse_rtc_clk),
      .scan_mode(scan_mode),
      .gen_clk  (hse_rtc_clk)
  );

endmodule
