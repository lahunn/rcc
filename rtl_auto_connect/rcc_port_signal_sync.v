// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : synchronize signals from ports with different clocks
// ****************************************************************
module rcc_port_signal_sync (
    input  rcc_rcc_hclk,
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
    output sync_hsi_rdy,
    output sync_csi_rdy,
    output sync_hsi48_rdy,
    output sync_hse_rdy,
    output sync_lsi_rdy,
    output sync_lse_rdy,
    output sync_pll1_rdy,
    output sync_pll2_rdy,
    output sync_pll3_rdy
);

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

endmodule
