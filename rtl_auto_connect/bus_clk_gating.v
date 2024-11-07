module bus_clk_gating #(
    parameter DOMAIN = 1
) (
    input  raw_clk,
    input  active,
    input  bypass,
    input  rst_n,
    output gen_clk
);

  wire sync_active;

  generate
    if (DOMAIN == 3) begin : domain_3
      BB_signal_sync #(
          .STAGE_NUM(2),
          .DW       (1)
      ) u_BB_signal_sync (
          .src_signal(active),
          .rst_n     (rst_n),
          .clk       (raw_clk),
          .gen_signal(sync_active)
      );
    end else begin :domain_1_2
      assign sync_active = active;
    end
  endgenerate

  BB_clk_gating u_BB_clk_gating (
      .raw_clk(raw_clk),
      .active (sync_active),
      .bypass (bypass),
      .gen_clk(gen_clk)
  );

endmodule