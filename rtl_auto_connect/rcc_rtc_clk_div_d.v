module rcc_rtc_clk_div_d #(
    parameter RATIO_WID = 6
) (
    input                  rst_n,
    input                  i_clk,
    input  [RATIO_WID-1:0] ratio,
    output                 o_clk,
    output                 div_en
);
  wire                 div_i_clk;
  wire                 div_disable;
  wire [RATIO_WID-1:0] sync_ratio;
  //==========================================================================
  // syncronize the input ratio
  //==========================================================================

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (RATIO_WID)
  ) u_sync_ratio (
      .src_signal(ratio),
      .rst_n     (rst_n),
      .clk       (i_clk),
      .gen_signal(sync_ratio)
  );


  assign div_disable = (sync_ratio == 'b0 || sync_ratio == 'b1);
  assign div_i_clk   = (~div_disable) || i_clk;

  BB_clk_div_d #(
      .RATIO_WID(RATIO_WID)
  ) u_BB_clk_div_d (
      .rst_n (rst_n),
      .i_clk (div_i_clk),
      .ratio (sync_ratio),
      .o_clk (o_clk),
      .div_en(div_en)
  );

endmodule
