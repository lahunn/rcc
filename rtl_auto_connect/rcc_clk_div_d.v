module rcc_clk_div_d #(
    parameter RATIO_WID = 8
) (
    input                  rst_n,
    input                  i_clk,
    input  [RATIO_WID-1:0] ratio,
    output                 o_clk,
    output                 div_en
);

  wire div_disable;

  assign div_disable = (ratio == 0);

  BB_clk_div_d #(
      .RATIO_WID(RATIO_WID)
  ) u_BB_clk_div_d (
      .rst_n (rst_n & ~div_disable),
      .i_clk (i_clk),
      .ratio (ratio),
      .o_clk (o_clk),
      .div_en(div_en)
  );

endmodule
