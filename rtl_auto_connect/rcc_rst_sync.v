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
    input  i2s_clk_in,
    //input resets
    input  hsecss_fail,
    input  sys_rst_n,
    input  test_rst_n,
    input  testmode,
    //output resets
    output sync_hsecss_fail_rst,      //async reset sync release
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
    output i2s_clk_in_sync_sys_rst_n

);

  wire sync_hsecss_fail_rst_n;
  wire hsecss_fail_n;
  wire raw_hsecss_fail_n;
  wire raw_sync_hsecss_fail_rst_n;
  wire raw_pll1_p_sync_sys_rst_n;
  wire raw_pll1_q_sync_sys_rst_n;
  wire raw_pll2_p_sync_sys_rst_n;
  wire raw_pll2_q_sync_sys_rst_n;
  wire raw_pll2_r_sync_sys_rst_n;
  wire raw_pll3_p_sync_sys_rst_n;
  wire raw_pll3_q_sync_sys_rst_n;
  wire raw_pll3_r_sync_sys_rst_n;
  wire raw_hse_sync_sys_rst_n;
  wire raw_hsi_ker_sync_sys_rst_n;
  wire raw_csi_ker_sync_sys_rst_n;
  wire raw_hsi48_sync_sys_rst_n;
  wire raw_lse_sync_sys_rst_n;
  wire raw_lsi_sync_sys_rst_n;
  wire raw_per_sync_sys_rst_n;
  wire raw_i2s_clk_in_sync_sys_rst_n;

  assign sync_hsecss_fail_rst = ~sync_hsecss_fail_rst_n;
  assign raw_hsecss_fail_n    = ~hsecss_fail;

  //===============================================================
  // sync with sys_clk
  //===============================================================
  test_rst_mux u_hsecss_fail_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_hsecss_fail_n),
      .testmode  (testmode),
      .rst_n     (hsecss_fail_n)
  );
  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_BB_reset_sync (
      .src_rst_n(hsecss_fail_n),
      .clk      (sys_clk),
      .gen_rst_n(raw_sync_hsecss_fail_rst_n)
  );
  test_rst_mux u_sync_hsecss_fail_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_sync_hsecss_fail_rst_n),
      .testmode  (testmode),
      .rst_n     (sync_hsecss_fail_rst_n)
  );
  //===============================================================
  // sync with other clocks
  //===============================================================

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_pll1_p_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (pll1_p_clk),
      .gen_rst_n(raw_pll1_p_sync_sys_rst_n)
  );

  test_rst_mux u_pll1_p_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_pll1_p_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (pll1_p_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_pll1_q_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (pll1_q_clk),
      .gen_rst_n(raw_pll1_q_sync_sys_rst_n)
  );

  test_rst_mux u_pll1_q_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_pll1_q_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (pll1_q_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_pll2_p_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (pll2_p_clk),
      .gen_rst_n(raw_pll2_p_sync_sys_rst_n)
  );

  test_rst_mux u_pll2_p_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_pll2_p_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (pll2_p_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_pll2_q_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (pll2_q_clk),
      .gen_rst_n(raw_pll2_q_sync_sys_rst_n)
  );

  test_rst_mux u_pll2_q_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_pll2_q_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (pll2_q_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_pll2_r_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (pll2_r_clk),
      .gen_rst_n(raw_pll2_r_sync_sys_rst_n)
  );

  test_rst_mux u_pll2_r_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_pll2_r_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (pll2_r_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_pll3_p_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (pll3_p_clk),
      .gen_rst_n(raw_pll3_p_sync_sys_rst_n)
  );

  test_rst_mux u_pll3_p_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_pll3_p_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (pll3_p_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_pll3_q_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (pll3_q_clk),
      .gen_rst_n(raw_pll3_q_sync_sys_rst_n)
  );

  test_rst_mux u_pll3_q_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_pll3_q_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (pll3_q_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_pll3_r_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (pll3_r_clk),
      .gen_rst_n(raw_pll3_r_sync_sys_rst_n)
  );

  test_rst_mux u_pll3_r_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_pll3_r_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (pll3_r_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_hse_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (hse_origin_clk),
      .gen_rst_n(raw_hse_sync_sys_rst_n)
  );

  test_rst_mux u_hse_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_hse_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (hse_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_hsi_ker_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (hsi_origin_clk),
      .gen_rst_n(raw_hsi_ker_sync_sys_rst_n)
  );

  test_rst_mux u_hsi_ker_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_hsi_ker_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (hsi_ker_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_csi_ker_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (csi_origin_clk),
      .gen_rst_n(raw_csi_ker_sync_sys_rst_n)
  );

  test_rst_mux u_csi_ker_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_csi_ker_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (csi_ker_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_hsi48_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (hsi48_clk),
      .gen_rst_n(raw_hsi48_sync_sys_rst_n)
  );

  test_rst_mux u_hsi48_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_hsi48_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (hsi48_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_lse_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (lse_clk),
      .gen_rst_n(raw_lse_sync_sys_rst_n)
  );

  test_rst_mux u_lse_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_lse_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (lse_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_lsi_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (lsi_clk),
      .gen_rst_n(raw_lsi_sync_sys_rst_n)
  );

  test_rst_mux u_lsi_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_lsi_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (lsi_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_per_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (per_clk),
      .gen_rst_n(raw_per_sync_sys_rst_n)
  );

  test_rst_mux u_per_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_per_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (per_sync_sys_rst_n)
  );

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_i2s_clk_in_rst_sync (
      .src_rst_n(sys_rst_n),
      .clk      (i2s_clk_in),
      .gen_rst_n(raw_i2s_clk_in_sync_sys_rst_n)
  );

  test_rst_mux u_i2s_clk_in_sync_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_i2s_clk_in_sync_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (i2s_clk_in_sync_sys_rst_n)
  );

endmodule
