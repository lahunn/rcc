module rcc_vdd_port_clock_mux (
    input  raw_rcc_c1_rsr_rmvf_wren,
    input  raw_rcc_c2_rsr_rmvf_wren,
    input  raw_rcc_csr_lsion_wren,
    input  lsi_clk,
    input  scan_mode,
    input  test_clk,
    output rcc_c1_rsr_rmvf_wren,
    output rcc_c2_rsr_rmvf_wren,
    output rcc_csr_lsion_wren,
    output gen_lsi_clk
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

  test_clk_mux u_lsi_clk_tmux (
      .test_clk (test_clk),
      .func_clk (lsi_clk),
      .scan_mode(scan_mode),
      .gen_clk  (gen_lsi_clk)
  );


endmodule
