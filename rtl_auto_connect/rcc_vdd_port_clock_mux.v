module rcc_vdd_port_clock_mux (
    //================================================================
    // test mode signals
    //================================================================
    input  scan_mode,
    input  test_clk,
    input  raw_rcc_c1_rsr_rmvf_wren,
    input  raw_rcc_c2_rsr_rmvf_wren,
    input  raw_rcc_csr_lsion_wren,
    output rcc_c1_rsr_rmvf_wren,
    output rcc_c2_rsr_rmvf_wren,
    output rcc_csr_lsion_wren
);

  // rcc_c1_rsr_rmvf_wren test clock mux
  test_clk_mux u_rcc_c1_rsr_rmvf_wren_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_c1_rsr_rmvf_wren),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_c1_rsr_rmvf_wren)
  );

  // rcc_c2_rsr_rmvf_wren test clock mux
  test_clk_mux u_rcc_c2_rsr_rmvf_wren_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_c2_rsr_rmvf_wren),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_c2_rsr_rmvf_wren)
  );

  // rcc_csr_lsion_wren test clock mux
  test_clk_mux u_rcc_csr_lsion_wren_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_csr_lsion_wren),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_csr_lsion_wren)
  );

endmodule
