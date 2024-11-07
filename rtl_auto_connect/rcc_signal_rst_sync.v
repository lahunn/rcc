module rcc_signal_rst_sync (
    //input clocks
    input  sys_clk,
    input  rcc_rcc_hclk,
    input  pll1_q_clk,
    input  pll2_p_clk,
    input  pll2_q_clk,
    input  pll2_r_clk,
    input  pll3_p_clk,
    input  pll3_q_clk,
    input  pll3_r_clk,
    input  hse_clk,
    input  hsi_ker_clk,
    input  csi_ker_clk,
    input  hsi48_clk,
    input  lse_clk,
    input  lsi_clk,
    input  per_clk,
    input  I2S_clk_IN,
    input  USB_PHY1,
    input  rcc_rcc_sync_rst_n,
    input  lsecss_fail,
    input  hsecss_fail,
    input  hsi_rdy,
    input  csi_rdy,
    input  hsi48_rdy,
    input  hse_rdy,
    input  lsi_rdy,
    input  lse_rdy,
    input  pll1_rdy,
    input  pll2_rdy,
    input  pll3_rdy,
    output sync_lsecss_fail,
    output sync_hsecss_fail,
    output async_hsecss_fail,          //async reset sync release
    output sync_hsi_rdy,
    output sync_csi_rdy,
    output sync_hsi48_rdy,
    output sync_hse_rdy,
    output sync_lsi_rdy,
    output sync_lse_rdy,
    output sync_pll1_rdy,
    output sync_pll2_rdy,
    output sync_pll3_rdy,
    output pll1_q_sync_sys_rst_n,
    output pll2_p_sync_sys_rst_n,
    output pll2_q_sync_sys_rst_n,
    output pll2_r_sync_sys_rst_n,
    output pll3_p_sync_sys_rst_n,
    output pll3_q_sync_sys_rst_n,
    output pll3_r_sync_sys_rst_n,
    output hse_sync_sys_rst_n,
    output hsi_ker_sync_sys_rst_n,
    output csi_ker_sync_sys_rst_n,
    output hsi48_sync_sys_rst_n,
    output lse_sync_sys_rst_n,
    output lsi_sync_sys_rst_n,
    output per_sync_sys_rst_n,
    output I2S_clk_IN_sync_sys_rst_n,
    output USB_PHY1_sync_sys_rst_n

);

  wire async_hsecss_fail_n;
  assign async_hsecss_fail = ~async_hsecss_fail_n;
  //===============================================================
  // sync with rcc_hclk and convert it to registers 
  //===============================================================
  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1)
  ) u_lsecss_fail_sync (
      .src_signal(lsecss_fail),
      .rst_n     (rcc_rcc_sync_rst_n),
      .clk       (rcc_rcc_hclk),
      .gen_signal(sync_lsecss_fail)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1)
  ) u_hsecss_fail_sync (
      .src_signal(hsecss_fail),
      .rst_n     (rcc_rcc_sync_rst_n),
      .clk       (rcc_rcc_hclk),
      .gen_signal(sync_hsecss_fail)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1)
  ) u_hsi_rdy_sync (
      .src_signal(hsi_rdy),
      .rst_n     (rcc_rcc_sync_rst_n),
      .clk       (rcc_rcc_hclk),
      .gen_signal(sync_hsi_rdy)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1)
  ) u_csi_rdy_sync (
      .src_signal(csi_rdy),
      .rst_n     (rcc_rcc_sync_rst_n),
      .clk       (rcc_rcc_hclk),
      .gen_signal(sync_csi_rdy)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1)
  ) u_hsi48_rdy_sync (
      .src_signal(hsi48_rdy),
      .rst_n     (rcc_rcc_sync_rst_n),
      .clk       (rcc_rcc_hclk),
      .gen_signal(sync_hsi48_rdy)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1)
  ) u_hse_rdy_sync (
      .src_signal(hse_rdy),
      .rst_n     (rcc_rcc_sync_rst_n),
      .clk       (rcc_rcc_hclk),
      .gen_signal(sync_hse_rdy)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1)
  ) u_lsi_rdy_sync (
      .src_signal(lsi_rdy),
      .rst_n     (rcc_rcc_sync_rst_n),
      .clk       (rcc_rcc_hclk),
      .gen_signal(sync_lsi_rdy)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1)
  ) u_lse_rdy_sync (
      .src_signal(lse_rdy),
      .rst_n     (rcc_rcc_sync_rst_n),
      .clk       (rcc_rcc_hclk),
      .gen_signal(sync_lse_rdy)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1)
  ) u_pll1_rdy_sync (
      .src_signal(pll1_rdy),
      .rst_n     (rcc_rcc_sync_rst_n),
      .clk       (rcc_rcc_hclk),
      .gen_signal(sync_pll1_rdy)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1)
  ) u_pll2_rdy_sync (
      .src_signal(pll2_rdy),
      .rst_n     (rcc_rcc_sync_rst_n),
      .clk       (rcc_rcc_hclk),
      .gen_signal(sync_pll2_rdy)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1)
  ) u_pll3_rdy_sync (
      .src_signal(pll3_rdy),
      .rst_n     (rcc_rcc_sync_rst_n),
      .clk       (rcc_rcc_hclk),
      .gen_signal(sync_pll3_rdy)
  );
  //===============================================================
  // sync with sys_clk
  //===============================================================
  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_BB_reset_sync (
      .src_rst_n(~hsecss_fail),
      .clk      (sys_clk),
      .gen_rst_n(async_hsecss_fail_n)
  );


  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_pll1_q_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (sys_clk),
      .gen_rst_n(pll1_q_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_pll2_p_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (sys_clk),
      .gen_rst_n(pll2_p_sync_sys_rst_n)
  );
  
  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_pll2_q_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (sys_clk),
    .gen_rst_n(pll2_q_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_pll2_r_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (sys_clk),
    .gen_rst_n(pll2_r_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_pll3_p_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (sys_clk),
    .gen_rst_n(pll3_p_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_pll3_q_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (sys_clk),
    .gen_rst_n(pll3_q_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_pll3_r_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (sys_clk),
    .gen_rst_n(pll3_r_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_hse_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (sys_clk),
    .gen_rst_n(hse_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_hsi_ker_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (sys_clk),
    .gen_rst_n(hsi_ker_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_csi_ker_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (sys_clk),
    .gen_rst_n(csi_ker_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_hsi48_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (sys_clk),
    .gen_rst_n(hsi48_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_lse_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (sys_clk),
    .gen_rst_n(lse_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_lsi_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (sys_clk),
    .gen_rst_n(lsi_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_per_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (sys_clk),
    .gen_rst_n(per_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_I2S_clk_IN_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (sys_clk),
    .gen_rst_n(I2S_clk_IN_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_USB_PHY1_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (sys_clk),
    .gen_rst_n(USB_PHY1_sync_sys_rst_n)
  );


endmodule
