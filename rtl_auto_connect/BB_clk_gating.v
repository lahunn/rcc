/* verilator lint_off UNUSEDPARAM */
/* verilator lint_off UNUSEDSIGNAL */
/* verilator lint_off UNDRIVEN */
module BB_clk_gating (
    input  raw_clk,
    input  active,
    input  bypass,
    output gen_clk
);
  /* verilator lint_off Latch*/
  reg [2:0] clk_en;

  always @(posedge raw_clk) begin
    clk_en[2] <= clk_en[1];
    clk_en[1] <= clk_en[0];
    clk_en[0] <= active || bypass;
  end

  assign gen_clk = raw_clk && clk_en[2];

endmodule
