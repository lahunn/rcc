module rcc_pclk_timer_div (
    input        i_clk,
    input        rst_n,
    input  [2:0] div_sel,
    input        timpre,
    output       tim_ker_clk,
    output       pclk
);
  wire [4:0] clk_temp;
  wire       pclk_pre;
  wire       tim_ker_clk_pre_1;
  wire       tim_ker_clk_pre_0;
  assign clk_temp[0] = i_clk;


  // 4 stage of div_2
  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1) begin : div_2_gen
      BB_dfflr #(
          .DW     (1),
          .RST_VAL(0)
      ) u_BB_dfflr (
          .clk  (clk_temp[i]),
          .rst_n(rst_n),
          .en   (1'b1),
          .din  (~clk_temp[i+1]),
          .dout (clk_temp[i+1])
      );
    end
  endgenerate



  mux_n_to_1 #(
      .N(4),
      .m(2)
  ) u_pclk_pre_mux_n_to_1 (
      .inp   (clk_temp[4:1]),
      .select(div_sel[1:0]),
      .out   (pclk_pre)
  );  // select clock from 2 to 2^4



  mux_n_to_1 #(
      .N(2),
      .m(1)
  ) u_pclk_mux_n_to_1 (
      .inp   ({pclk_pre, i_clk}),
      .select(div_sel[2]),
      .out   (pclk)
  );



  mux_n_to_1 #(
      .N(2),
      .m(1)
  ) u_tim_ker_clk_pre_1_mux_n_to_1 (  //select from 2 div clock ,4 div clock 
      .inp   (clk_temp[2:1]),
      .select(div_sel[0]),
      .out   (tim_ker_clk_pre_1)
  );



  mux_n_to_1 #(
      .N(2),
      .m(1)
  ) u_tim_ker_clk_pre_0_mux_n_to_1 (  //select from 2 div clock ,4 div clock 
      .inp   ({tim_ker_clk_pre_1, i_clk}),
      .select(div_sel[1] & div_sel[2]),
      .out   (tim_ker_clk_pre_0)
  );


  mux_n_to_1 #(
      .N(2),
      .m(1)
  ) u_tim_ker_clk_mux_n_to_1 (  //select from 2 div clock ,4 div clock 
      .inp   ({tim_ker_clk_pre_0, pclk}),
      .select(timpre),
      .out   (tim_ker_clk)
  );

endmodule
