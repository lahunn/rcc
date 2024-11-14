// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : synchronize reset signals with different clocks
// ****************************************************************
module rcc_rst_sync (
    //input clocks
    input  sys_clk,
    input  pll1_p_clk,
    input  pll1_q_clk,
    input  pll2_p_clk,
    input  pll2_q_clk,
    input  pll2_r_clk,
    input  pll3_p_clk,
    input  pll3_q_clk,
    input  pll3_r_clk,
    input  hse_origin_clk,
    input  hsi_origin_clk,
    input  csi_origin_clk,
    input  hsi48_clk,
    input  lse_clk,
    input  lsi_clk,
    input  per_clk,
    input  I2S_clk_IN,
    //input resets
    input  hsecss_fail,
    input  sys_rst_n,
    //output resets
    output sync_hsecss_fail_rst,          //async reset sync release
    output pll1_p_sync_sys_rst_n,
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
    output I2S_clk_IN_sync_sys_rst_n

);

  wire sync_hsecss_fail_rst_n;
  assign sync_hsecss_fail_rst = ~sync_hsecss_fail_rst_n;

  //===============================================================
  // sync with sys_clk
  //===============================================================
  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_BB_reset_sync (
      .src_rst_n(~hsecss_fail),
      .clk      (sys_clk),
      .gen_rst_n(sync_hsecss_fail_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_pll1_p_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (pll1_p_clk),
      .gen_rst_n(pll1_p_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_pll1_q_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (pll1_q_clk),
      .gen_rst_n(pll1_q_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_pll2_p_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (pll2_p_clk),
      .gen_rst_n(pll2_p_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_pll2_q_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (pll2_q_clk),
    .gen_rst_n(pll2_q_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_pll2_r_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (pll2_r_clk),
    .gen_rst_n(pll2_r_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_pll3_p_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (pll3_p_clk),
    .gen_rst_n(pll3_p_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_pll3_q_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (pll3_q_clk),
    .gen_rst_n(pll3_q_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_pll3_r_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (pll3_r_clk),
    .gen_rst_n(pll3_r_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_hse_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (hse_origin_clk),
    .gen_rst_n(hse_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_hsi_ker_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (hsi_origin_clk),
    .gen_rst_n(hsi_ker_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_csi_ker_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (csi_origin_clk),
    .gen_rst_n(csi_ker_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_hsi48_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (hsi48_clk),
    .gen_rst_n(hsi48_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_lse_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (lse_clk),
    .gen_rst_n(lse_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_lsi_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (lsi_clk),
    .gen_rst_n(lsi_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_per_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (per_clk),
    .gen_rst_n(per_sync_sys_rst_n)
  );

  BB_reset_sync #(
    .STAGE_NUM(2)
  ) u_I2S_clk_IN_rst_sync (
    .src_rst_n(sys_rst_n),
    .clk      (I2S_clk_IN),
    .gen_rst_n(I2S_clk_IN_sync_sys_rst_n)
  );

endmodule
