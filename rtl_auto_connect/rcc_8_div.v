module rcc_8_div (
    input        i_clk,
    input        rst_n,
    input  [1:0] div_sel,
    output       div_en,
    output       o_clk
);

  reg [2:0] div_ratio;

  always @(*) begin
    case (div_sel)
      2'b00:  div_ratio = 3'b001;  //DIV_RATIO = 1
      2'b01:  div_ratio = 3'b010;  //DIV_RATIO = 2
      2'b10:  div_ratio = 3'b100;  //DIV_RATIO = 4
      2'b11:  div_ratio = 3'b000;  //DIV_RATIO = 8
    endcase
  end

  BB_clk_div_d #(
      .RATIO_WID(3)
  ) u_BB_clk_div_d (
      .rst_n (rst_n),
      .i_clk (i_clk),
      .ratio (div_ratio),
      .o_clk (o_clk),
      .div_en(div_en)
  );

endmodule
