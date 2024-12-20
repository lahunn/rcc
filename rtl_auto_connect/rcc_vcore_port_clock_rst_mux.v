module rcc_vcore_port_clock_rst_mux (
    input  raw_csi_origin_clk,
    input  raw_hse_origin_clk,
    input  raw_hsi48_origin_clk,
    input  raw_hsi_origin_clk,
    input  raw_pad_rcc_mac1_mii_tx_clk,
    input  raw_pad_rcc_mac1_mii_rx_clk,
    input  raw_pad_rcc_mac2_mii_tx_clk,
    input  raw_pad_rcc_mac2_mii_rx_clk,
    input  raw_pll1_p_clk,
    input  raw_pll1_q_clk,
    input  raw_pll2_p_clk,
    input  raw_pll2_q_clk,
    input  raw_pll2_r_clk,
    input  raw_pll3_p_clk,
    input  raw_pll3_q_clk,
    input  raw_pll3_r_clk,
    input  raw_lsi_clk,
    input  raw_lse_clk,
    //rst
    input  raw_pwr_d1_wkup,
    input  raw_pwr_d2_wkup,
    input  raw_pwr_d3_wkup,
    //================================================================
    // test_mode signals
    //================================================================
    input  testmode,
    input  scan_mode,
    input  test_clk,
    input  test_rst_n,
    //================================================================
    // output
    //================================================================
    output csi_origin_clk,
    output hse_origin_clk,
    output hsi48_origin_clk,
    output hsi_origin_clk,
    output pad_rcc_mac1_mii_tx_clk,
    output pad_rcc_mac1_mii_rx_clk,
    output pad_rcc_mac2_mii_tx_clk,
    output pad_rcc_mac2_mii_rx_clk,
    output pll1_p_clk,
    output pll1_q_clk,
    output pll2_p_clk,
    output pll2_q_clk,
    output pll2_r_clk,
    output pll3_p_clk,
    output pll3_q_clk,
    output pll3_r_clk,
    output lsi_clk,
    output lse_clk,
    //rst
    output pwr_d1_wkup,
    output pwr_d2_wkup,
    output pwr_d3_wkup
);

  //================================================================
  // clock mux for testmode
  //================================================================

  // csi_origin_clk test clock mux
  test_clk_mux u_csi_origin_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_csi_origin_clk),
      .scan_mode(scan_mode),
      .gen_clk  (csi_origin_clk)
  );

  // hse_origin_clk test clock mux
  test_clk_mux u_hse_origin_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_hse_origin_clk),
      .scan_mode(scan_mode),
      .gen_clk  (hse_origin_clk)
  );

  // hsi48_origin_clk test clock mux
  test_clk_mux u_hsi48_origin_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_hsi48_origin_clk),
      .scan_mode(scan_mode),
      .gen_clk  (hsi48_origin_clk)
  );

  // hsi_origin_clk test clock mux
  test_clk_mux u_hsi_origin_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_hsi_origin_clk),
      .scan_mode(scan_mode),
      .gen_clk  (hsi_origin_clk)
  );

  // pad_rcc_mac1_mii_tx_clk test clock mux
  test_clk_mux u_pad_rcc_mac1_mii_tx_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_pad_rcc_mac1_mii_tx_clk),
      .scan_mode(scan_mode),
      .gen_clk  (pad_rcc_mac1_mii_tx_clk)
  );

  // pad_rcc_mac1_mii_rx_clk test clock mux
  test_clk_mux u_pad_rcc_mac1_mii_rx_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_pad_rcc_mac1_mii_rx_clk),
      .scan_mode(scan_mode),
      .gen_clk  (pad_rcc_mac1_mii_rx_clk)
  );

  // pad_rcc_mac2_mii_tx_clk test clock mux
  test_clk_mux u_pad_rcc_mac2_mii_tx_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_pad_rcc_mac2_mii_tx_clk),
      .scan_mode(scan_mode),
      .gen_clk  (pad_rcc_mac2_mii_tx_clk)
  );

  // pad_rcc_mac2_mii_rx_clk test clock mux
  test_clk_mux u_pad_rcc_mac2_mii_rx_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_pad_rcc_mac2_mii_rx_clk),
      .scan_mode(scan_mode),
      .gen_clk  (pad_rcc_mac2_mii_rx_clk)
  );


  // pll1_p_clk test clock mux
  test_clk_mux u_pll1_p_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_pll1_p_clk),
      .scan_mode(scan_mode),
      .gen_clk  (pll1_p_clk)
  );

  // pll1_q_clk test clock mux
  test_clk_mux u_pll1_q_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_pll1_q_clk),
      .scan_mode(scan_mode),
      .gen_clk  (pll1_q_clk)
  );

  // pll2_p_clk test clock mux
  test_clk_mux u_pll2_p_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_pll2_p_clk),
      .scan_mode(scan_mode),
      .gen_clk  (pll2_p_clk)
  );

  // pll2_q_clk test clock mux
  test_clk_mux u_pll2_q_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_pll2_q_clk),
      .scan_mode(scan_mode),
      .gen_clk  (pll2_q_clk)
  );

  // pll2_r_clk test clock mux
  test_clk_mux u_pll2_r_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_pll2_r_clk),
      .scan_mode(scan_mode),
      .gen_clk  (pll2_r_clk)
  );

  // pll3_p_clk test clock mux
  test_clk_mux u_pll3_p_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_pll3_p_clk),
      .scan_mode(scan_mode),
      .gen_clk  (pll3_p_clk)
  );

  // pll3_q_clk test clock mux
  test_clk_mux u_pll3_q_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_pll3_q_clk),
      .scan_mode(scan_mode),
      .gen_clk  (pll3_q_clk)
  );

  // pll3_r_clk test clock mux
  test_clk_mux u_pll3_r_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_pll3_r_clk),
      .scan_mode(scan_mode),
      .gen_clk  (pll3_r_clk)
  );

  // lsi_clk test clock mux
  test_clk_mux u_lsi_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_lsi_clk),
      .scan_mode(scan_mode),
      .gen_clk  (lsi_clk)
  );

  // lse_clk test clock mux
  test_clk_mux u_lse_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_lse_clk),
      .scan_mode(scan_mode),
      .gen_clk  (lse_clk)
  );

  //================================================================
  // reset mux for testmode
  //================================================================

  // pwr_d1_wkup test reset mux
  // pwr_d1_wkup active high
  test_rst_mux u_pwr_d1_wkup_mux (
      .test_rst_n(~test_rst_n),
      .func_rst_n(raw_pwr_d1_wkup),
      .testmode  (testmode),
      .rst_n     (pwr_d1_wkup)
  );

  // pwr_d2_wkup test reset mux
  // pwr_d2_wkup active high
  test_rst_mux u_pwr_d2_wkup_mux (
      .test_rst_n(~test_rst_n),
      .func_rst_n(raw_pwr_d2_wkup),
      .testmode  (testmode),
      .rst_n     (pwr_d2_wkup)
  );

  // pwr_d3_wkup test reset mux
  // pwr_d3_wkup active high
  test_rst_mux u_pwr_d3_wkup_mux (
      .test_rst_n(~test_rst_n),
      .func_rst_n(raw_pwr_d3_wkup),
      .testmode  (testmode),
      .rst_n     (pwr_d3_wkup)
  );

endmodule
