// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : when active is not synchronized with raw_clk,
//            the active signal should be synchronized first
// ****************************************************************
module en_as_clk_gating #(
    parameter RST_VAL = 0
) (
    input  raw_clk,
    input  active,
    input  bypass,
    input  rst_n,
    output gen_clk
);

  wire sync_active;

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1),
      .RST_VAL  (RST_VAL)
  ) u_BB_signal_sync (
      .src_signal(active),
      .rst_n     (rst_n),
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
