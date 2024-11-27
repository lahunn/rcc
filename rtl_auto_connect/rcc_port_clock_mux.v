module rcc_port_clock_mux (
    input  raw_i2s_clk_in,
    input  raw_usb_phy1,
    input  raw_csi_origin_clk,
    input  raw_hse_origin_clk,
    input  raw_hsi48_origin_clk,
    input  raw_hsi_origin_clk,
    input  raw_pad_rcc_eth_mii_tx_clk,
    input  raw_pad_rcc_eth_mii_rx_clk,
    input  raw_pll1_p_clk,
    input  raw_pll1_q_clk,
    input  raw_pll2_p_clk,
    input  raw_pll2_q_clk,
    input  raw_pll2_r_clk,
    input  raw_pll3_p_clk,
    input  raw_pll3_q_clk,
    input  raw_pll3_r_clk,
    //================================================================
    // scan_mode
    //================================================================
    input  testmode,
    input  test_clk,
    output i2s_clk_in,
    output usb_phy1,
    output csi_origin_clk,
    output hse_origin_clk,
    output hsi48_origin_clk,
    output hsi_origin_clk,
    output pad_rcc_eth_mii_tx_clk,
    output pad_rcc_eth_mii_rx_clk,
    output pll1_p_clk,
    output pll1_q_clk,
    output pll2_p_clk,
    output pll2_q_clk,
    output pll2_r_clk,
    output pll3_p_clk,
    output pll3_q_clk,
    output pll3_r_clk
);
  // i2s_clk_in test clock mux
  test_clk_mux u_i2s_clk_in_tmux (
      .test_clk (test_clk),
      .func_clk (raw_i2s_clk_in),
      .scan_mode(scan_mode),
      .gen_clk  (i2s_clk_in)
  );

  // usb_phy1 test clock mux
  test_clk_mux u_usb_phy1_tmux (
      .test_clk (test_clk),
      .func_clk (raw_usb_phy1),
      .scan_mode(scan_mode),
      .gen_clk  (usb_phy1)
  );

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

  // pad_rcc_eth_mii_tx_clk test clock mux
  test_clk_mux u_pad_rcc_eth_mii_tx_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_pad_rcc_eth_mii_tx_clk),
      .scan_mode(scan_mode),
      .gen_clk  (pad_rcc_eth_mii_tx_clk)
  );

  // pad_rcc_eth_mii_rx_clk test clock mux
  test_clk_mux u_pad_rcc_eth_mii_rx_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_pad_rcc_eth_mii_rx_clk),
      .scan_mode(scan_mode),
      .gen_clk  (pad_rcc_eth_mii_rx_clk)
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

endmodule
