module rcc_eth_ker_clk_ctrl (
    input pad_rcc_eth_mii_tx_clk,
    input pad_rcc_eth_mii_rx_clk,
    input eth_rcc_fes,
    input eth_rcc_epis_2,

    // reset signal
    input rst_n,

    //output
    output rcc_eth_mii_tx_clk,
    output rcc_eth_mii_rx_clk,
    output rcc_eth_rmii_ref_clk,

    // control signals
    input c1_sleep,
    input c1_deepsleep,
    input c2_sleep,
    input c2_deepsleep,
    //test mode
    input testmode,

    //register signals
    // eth1rx control signals
    input rcc_c1_eth1rx_en,
    input rcc_c2_eth1rx_en,
    input rcc_c1_eth1rx_lpen,
    input rcc_c2_eth1rx_lpen,
    // eth1tx control signals
    input rcc_c1_eth1tx_en,
    input rcc_c2_eth1tx_en,
    input rcc_c1_eth1tx_lpen,
    input rcc_c2_eth1tx_lpen
);
  wire rcc_eth_mii_tx_clk_pre;
  wire rcc_eth_mii_rx_clk_pre;
  wire pad_rcc_eth_mii_rx_clk_divided;
  wire pad_rcc_eth_mii_rx_clk_div_2;
  wire pad_rcc_eth_mii_rx_clk_div_20;

  wire rcc_eth1rx_clk_en;
  wire rcc_eth1tx_clk_en;
  wire rcc_eth_rmii_ref_clk_en;
  wire sync_eth_rcc_fes;
  wire eth_rx_clk_sync_rst_n;



  //=========================================================================
  //  synchrounous signals
  //=========================================================================
  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_eth_rst_sync (
      .src_rst_n(rst_n),
      .clk      (pad_rcc_eth_mii_rx_clk),
      .gen_rst_n(eth_rx_clk_sync_rst_n)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1)
  ) u_fes_sync (
      .src_signal(eth_rcc_fes),
      .rst_n     (eth_rx_clk_sync_rst_n),
      .clk       (pad_rcc_eth_mii_rx_clk),
      .gen_signal(sync_eth_rcc_fes)
  );
  //=========================================================================
  //  eth clock control
  //=========================================================================

  glitch_free_clk_switch #(
      .CLK_NUM(2)
  ) eth_mii_tx_clk_switch (
      .i_clk   ({pad_rcc_eth_mii_rx_clk_divided, pad_rcc_eth_mii_tx_clk}),
      .clk_fail(2'b0),
      .rst_n   (rst_n),
      .sel     (eth_rcc_epis_2),
      .o_clk   (rcc_eth_mii_tx_clk_pre)
  );

  glitch_free_clk_switch #(
      .CLK_NUM(2)
  ) eth_mii_rx_clk_switch (
      .i_clk   ({pad_rcc_eth_mii_rx_clk_divided, pad_rcc_eth_mii_rx_clk}),
      .clk_fail(2'b0),
      .rst_n   (rst_n),
      .sel     (eth_rcc_epis_2),
      .o_clk   (rcc_eth_mii_rx_clk_pre)
  );

  BB_clk_div_s #(
      .DIV_RATIO(2)
  ) eth_mii_rx_clk_divider_2 (
      .rst_n (eth_rx_clk_sync_rst_n),
      .i_clk (pad_rcc_eth_mii_rx_clk),
      .o_clk (pad_rcc_eth_mii_rx_clk_div_2),
      .div_en()
  );

  BB_clk_div_s #(
      .DIV_RATIO(20)
  ) eth_mii_rx_clk_divider_20 (
      .rst_n (eth_rx_clk_sync_rst_n),
      .i_clk (pad_rcc_eth_mii_rx_clk),
      .o_clk (pad_rcc_eth_mii_rx_clk_div_20),
      .div_en()
  );

  assign pad_rcc_eth_mii_rx_clk_divided = sync_eth_rcc_fes ? pad_rcc_eth_mii_rx_clk_div_2 : pad_rcc_eth_mii_rx_clk_div_20;

  // gates

  assign rcc_eth1rx_clk_en              = (rcc_c1_eth1rx_en && (~c1_sleep || rcc_c1_eth1rx_lpen) && ~c1_deepsleep) || (rcc_c2_eth1rx_en && (~c2_sleep || rcc_c2_eth1rx_lpen) && ~c2_deepsleep);
  assign rcc_eth1tx_clk_en              = (rcc_c1_eth1tx_en && (~c1_sleep || rcc_c1_eth1tx_lpen) && ~c1_deepsleep) || (rcc_c2_eth1tx_en && (~c2_sleep || rcc_c2_eth1tx_lpen) && ~c2_deepsleep);
  assign rcc_eth_rmii_ref_clk_en        = rcc_eth1rx_clk_en || rcc_eth1tx_clk_en;

  async_clk_gating u_eth_mii_tx_clk_gating (
      .raw_clk(rcc_eth_mii_tx_clk_pre),
      .active (rcc_eth1rx_clk_en),
      .bypass (testmode),
      .rst_n  (rst_n),
      .gen_clk(rcc_eth_mii_tx_clk)
  );

  async_clk_gating u_eth_mii_rx_clk_gating (
      .raw_clk(rcc_eth_mii_rx_clk_pre),
      .active (rcc_eth1tx_clk_en),
      .bypass (testmode),
      .rst_n  (rst_n),
      .gen_clk(rcc_eth_mii_rx_clk)
  );

  async_clk_gating u_eth_rmii_ref_clk_gating (
      .raw_clk(pad_rcc_eth_mii_rx_clk),
      .active (rcc_eth_rmii_ref_clk_en),
      .bypass (testmode),
      .rst_n  (rst_n),
      .gen_clk(rcc_eth_rmii_ref_clk)
  );

endmodule
