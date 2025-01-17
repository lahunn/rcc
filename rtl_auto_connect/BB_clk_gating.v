/* verilator lint_off LATCH */
// spyglass disable_block InferLatch
// spyglass disable_block Clock_glitch05
module BB_clk_gating (
    input  raw_clk,
    input  active,
    input  bypass,
    output gen_clk
);
  reg  cur_en;
  wire nxt_en;

  always @(*) begin
    if (!raw_clk) begin
      cur_en = nxt_en;
    end
  end

  assign nxt_en  = active || bypass;
  assign gen_clk = raw_clk && cur_en;

endmodule
// spyglass enable_block InferLatch
// spyglass enable_block Clock_glitch05
