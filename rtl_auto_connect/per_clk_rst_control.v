module per_clk_rst_control #(
  parameter KER_CLK_SRC_NUM = 2,
  parameter CLK_ON_AFTER_PER_RST_RELEASE = 2
)(
  input clk_in,
  input [KER_CLK_SRC_NUM-1:0] ker_src_clks,
  input rst_n,
  output clk_out
)