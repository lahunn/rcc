// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : hsi clock divider , generate 1/2/4/8 divided his clock
// ****************************************************************
module rcc_hsi_div (
    input        i_clk,
    input        rst_n,
    input  [1:0] div_sel,
    output       o_clk
);
  wire       sync_rst_n;
  wire [1:0] sync_div_sel;
  reg  [2:0] div_ratio;
  //================================================================
  // syncronize the input ratio and reset
  //================================================================
  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_BB_reset_sync (
      .src_rst_n(rst_n),
      .clk      (i_clk),
      .gen_rst_n(sync_rst_n)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (2)
  ) u_sync_div_sel (
      .src_signal(div_sel),
      .rst_n     (sync_rst_n),
      .clk       (i_clk),
      .gen_signal(sync_div_sel)
  );

  always @(*) begin
    case (sync_div_sel)
      2'b00: div_ratio = 3'b001;  //DIV_RATIO = 1
      2'b01: div_ratio = 3'b010;  //DIV_RATIO = 2
      2'b10: div_ratio = 3'b100;  //DIV_RATIO = 4
      2'b11: div_ratio = 3'b000;  //DIV_RATIO = 8
    endcase
  end

  BB_clk_div_d #(
      .RATIO_WID(3)
  ) u_BB_clk_div_d (
      .rst_n (sync_rst_n),
      .i_clk (i_clk),
      .ratio (div_ratio),
      .o_clk (o_clk),
      .div_en()
  );

endmodule
