// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : active and rst_n is not synchronized with raw_clk,
//            active and rst_n should be synchronized first
// ****************************************************************
module rst_as_en_as_clk_gating (
    input  raw_clk,
    input  active,
    input  bypass,
    input  rst_n,
    output gen_clk
);

  wire sync_active;
  wire sync_rst_n;

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_BB_reset_sync (
      .src_rst_n(rst_n),
      .clk      (raw_clk),
      .gen_rst_n(sync_rst_n)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1)
  ) u_BB_signal_sync (
      .src_signal(active),
      .rst_n     (sync_rst_n),
      .clk       (raw_clk),
      .gen_signal(sync_active)
  );

  BB_clk_gating u_BB_clk_gating (
      .raw_clk(raw_clk),
      .active (sync_active),
      .bypass (bypass),
      .gen_clk(gen_clk)
  );

endmodule
