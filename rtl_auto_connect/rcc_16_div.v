// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : 1/2/4/8/16 dynamic clock divider
// ****************************************************************
module rcc_16_div (
    input        i_clk,
    input        rst_n,
    input  [2:0] div_sel,
    output       div_en,
    output       o_clk
);

  reg [3:0] div_ratio;

  always @(*) begin
    case (div_sel)
      3'b100:  div_ratio = 4'b0010;  //DIV_RATIO = 2
      3'b101:  div_ratio = 4'b0100;  //DIV_RATIO = 4
      3'b110:  div_ratio = 4'b1000;  //DIV_RATIO = 8
      3'b111:  div_ratio = 4'b0000;  //DIV_RATIO = 16
      default: div_ratio = 4'b0001;  //DIV_RATIO = 1
    endcase
  end

  clk_div_d #(
      .RATIO_WID(4)
  ) u_clk_div_d (
      .rst_n (rst_n),
      .i_clk (i_clk),
      .ratio (div_ratio),
      .o_clk (o_clk),
      .div_en(div_en)
  );


endmodule
