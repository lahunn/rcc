module rcc_512_div (
    input        i_clk,
    input        rst_n,
    input  [3:0] div_sel,
    output       div_en,
    output       o_clk
);

  reg [8:0] div_ratio;

  always @(*) begin
    case (div_sel)
      4'b1000: div_ratio = 9'b10;  //DIV_RATIO = 2
      4'b1001: div_ratio = 9'b100;  //DIV_RATIO = 4
      4'b1010: div_ratio = 9'b1000;  //DIV_RATIO = 8
      4'b1011: div_ratio = 9'b10000;  //DIV_RATIO = 16
      4'b1100: div_ratio = 9'b1000000;  //DIV_RATIO = 64
      4'b1101: div_ratio = 9'b10000000;  //DIV_RATIO = 128
      4'b1110: div_ratio = 9'b100000000;  //DIV_RATIO = 256
      4'b1111: div_ratio = 9'b0;  //DIV_RATIO = 512
      default: div_ratio = 9'b1;  //DIV_RATIO = 1
    endcase
  end

  BB_clk_div_d #(
      .RATIO_WID(9)
  ) u_BB_clk_div_d (
      .rst_n (rst_n),
      .i_clk (i_clk),
      .ratio (div_ratio),
      .o_clk (o_clk),
      .div_en(div_en)
  );

endmodule
