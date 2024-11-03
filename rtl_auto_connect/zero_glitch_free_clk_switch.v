module zero_glitch_free_clk_switch #(
    parameter CLK_NUM = 4
) (
    input  [        CLK_NUM-1:0] i_clk,
    input  [        CLK_NUM-1:0] clk_fail,
    input  [$clog2(CLK_NUM)-1:0] sel,
    input                        rst_n,
    output                       o_clk
);

  wire                         u_o_clk;
  wire [$clog2(CLK_NUM-1)-1:0] u_sel;
  wire [          CLK_NUM-2:0] u_i_clk;
  wire [          CLK_NUM-2:0] u_clk_fail;
  wire                         o_clk_en;

  assign o_clk_en = (sel != 'b0);
  assign u_i_clk = i_clk[CLK_NUM-1:1];
  assign u_clk_fail = clk_fail[CLK_NUM-1:1];
  assign u_sel = sel - 'b1;

  BB_clk_gating u_BB_clk_gating (
      .raw_clk(u_o_clk),
      .active (o_clk_en),
      .bypass (1'b0),
      .gen_clk(o_clk)
  );

  glitch_free_clk_switch #(
      .CLK_NUM(CLK_NUM - 1)
  ) u_glitch_free_clk_switch (
      .i_clk   (u_i_clk),
      .clk_fail(u_clk_fail),
      .sel     (u_sel),
      .rst_n   (rst_n),
      .o_clk   (u_o_clk)
  );
endmodule
