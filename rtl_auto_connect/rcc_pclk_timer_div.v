// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : generate APB BUS clock and timer clock
// ****************************************************************
module rcc_pclk_timer_div (
    input        i_clk,
    input        rst_n,
    input  [2:0] div_sel,
    input        timpre,
    output       tim_ker_clk,
    output       div_en,
    output       pclk
);

  reg [2:0] tim_div_ratio;

  rcc_16_div u_rcc_pclk_divider (
      .i_clk  (i_clk),
      .rst_n  (rst_n),
      .div_sel(div_sel),
      .div_en (div_en),
      .o_clk  (pclk)
  );

  always @(*) begin
    case ({
      timpre, div_sel
    })
      4'b0000: tim_div_ratio = 3'b001;  //DIV_RATIO = 1
      4'b0001: tim_div_ratio = 3'b001;  //DIV_RATIO = 1
      4'b0010: tim_div_ratio = 3'b001;  //DIV_RATIO = 1
      4'b0011: tim_div_ratio = 3'b001;  //DIV_RATIO = 1
      4'b0100: tim_div_ratio = 3'b001;  //DIV_RATIO = 1
      4'b0101: tim_div_ratio = 3'b010;  //DIV_RATIO = 2
      4'b0110: tim_div_ratio = 3'b100;  //DIV_RATIO = 4
      4'b0111: tim_div_ratio = 3'b000;  //DIV_RATIO = 8
      4'b1000: tim_div_ratio = 3'b001;  //DIV_RATIO = 1
      4'b1001: tim_div_ratio = 3'b001;  //DIV_RATIO = 1
      4'b1010: tim_div_ratio = 3'b001;  //DIV_RATIO = 1
      4'b1011: tim_div_ratio = 3'b001;  //DIV_RATIO = 1
      4'b1100: tim_div_ratio = 3'b001;  //DIV_RATIO = 1
      4'b1101: tim_div_ratio = 3'b001;  //DIV_RATIO = 1
      4'b1110: tim_div_ratio = 3'b010;  //DIV_RATIO = 2
      4'b1111: tim_div_ratio = 3'b100;  //DIV_RATIO = 4
    endcase
  end

  clk_div_d #(
      .RATIO_WID(3)
  ) u_tim_clk_div_d (
      .rst_n (rst_n),
      .i_clk (i_clk),
      .ratio (tim_div_ratio),
      .o_clk (tim_ker_clk),
      .div_en()
  );

endmodule
