module rcc_clk_div_d #(
    parameter RATIO_WID = 8
) (
    input                  rst_n,
    input                  i_clk,
    input  [RATIO_WID-1:0] ratio,
    output                 o_clk,
    output                 div_en
);

  wire                 div_disable;
  wire [RATIO_WID-1:0] ratio_f;
  wire [RATIO_WID-1:0] ratio_ff;
  //==========================================================================
  // syncronize the input ratio
  //==========================================================================

  BB_dffr #(
      .DW     (RATIO_WID),
      .RST_VAL(0)
  ) u_BB_0_dffr (
      .clk  (i_clk),
      .rst_n(rst_n),
      .din  (ratio),
      .dout (ratio_f)
  );

  BB_dffr #(
      .DW     (RATIO_WID),
      .RST_VAL(0)
  ) u_BB_1_dffr (
      .clk  (i_clk),
      .rst_n(rst_n),
      .din  (ratio_f),
      .dout (ratio_ff)
  );

  assign div_disable = (ratio_ff == 0);

  BB_clk_div_d #(
      .RATIO_WID(RATIO_WID)
  ) u_BB_clk_div_d (
      .rst_n (rst_n && ~div_disable),
      .i_clk (i_clk),
      .ratio (ratio),
      .o_clk (o_clk),
      .div_en(div_en)
  );

endmodule
