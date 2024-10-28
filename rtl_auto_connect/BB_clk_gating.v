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
  reg  cur_en;
  wire nxt_en;

  always @(*) begin
    if (!raw_clk) begin
      cur_en = active;
    end
  end

  assign nxt_en  = active || bypass;
  assign gen_clk = raw_clk && cur_en;

endmodule