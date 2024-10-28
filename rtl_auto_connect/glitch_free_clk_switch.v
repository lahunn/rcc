module glitch_free_clk_switch #(
    parameter CLK_NUM = 4
) (
    input  [        CLK_NUM-1:0] i_clk,
    input  [        CLK_NUM-1:0] clk_fail,
    input  [$clog2(CLK_NUM)-1:0] sel,
    input                        rst_n,
    output                       o_clk
);
  wire [        CLK_NUM-1:0] onehot_sel;
  wire [        CLK_NUM-1:0] clk_sel;
  wire [        CLK_NUM-1:0] clk_sel_f;
  wire [        CLK_NUM-1:0] clk_sel_ff;
  wire [        CLK_NUM-1:0] clk_sel_ff_n;
  wire [        CLK_NUM-1:0] clk_pre_out;
  wire [        CLK_NUM-1:0] clk_rst_n;
  wire [$clog2(CLK_NUM)-1:0] sel_temp     [CLK_NUM-1:0];


  assign clk_rst_n = (~clk_fail) & {CLK_NUM{rst_n}};  // Bitwise operation 

  generate
    genvar i;  // generate variable can not be initalized
    for (i = 0; i < CLK_NUM; i = i + 1) begin : sel_temp_gen
      assign sel_temp[i] = i;  // it may not be compitable with some tools
    end
  endgenerate
  generate
    genvar l;
    for (l = 0; l < CLK_NUM; l = l + 1) begin : sel_decode
      assign onehot_sel[l] = &(~(sel_temp[l] ^ sel));
    end
  endgenerate

  // generate clk_sel
  assign clk_sel[0] = onehot_sel[0] && (&clk_sel_ff_n[CLK_NUM-1:1]);
  generate
    genvar j;
    for (j = 1; j < CLK_NUM - 1; j = j + 1) begin : clk_sel_gen
      assign clk_sel[j] = onehot_sel[j] && (&clk_sel_ff_n[j-1:0]) && (&clk_sel_ff_n[CLK_NUM-1:j]);
    end
  endgenerate
  assign clk_sel[CLK_NUM-1] = onehot_sel[CLK_NUM-1] && (&clk_sel_ff_n[CLK_NUM-2:0]);

  //generate two stage flip-flop    
  generate
    genvar k;
    for (k = 0; k < CLK_NUM; k = k + 1) begin : clock_flip_flops
      BB_dffr #(
          .DW     (1),
          .RST_VAL(0)
      ) u_BB_dffr_0 (
          .clk  (i_clk[k]),
          .rst_n(clk_rst_n[k]),
          .din  (clk_sel[k]),
          .dout (clk_sel_f[k])
      );

      BB_dffr #(
          .DW     (1),
          .RST_VAL(0)
      ) u_BB_dffr_1 (
          .clk  (i_clk[k]),
          .rst_n(clk_rst_n[k]),
          .din  (clk_sel_f[k]),
          .dout (clk_sel_ff[k])
      );
    end
  endgenerate


  //
  assign clk_sel_ff_n = ~clk_sel_ff;

  //generate clk_pre_out
  generate
    genvar m;
    for (m = 0; m < CLK_NUM; m = m + 1) begin : clk_pre_out_gen
      assign clk_pre_out[m] = i_clk[m] && clk_sel_ff[m];
    end
  endgenerate

  assign o_clk = |clk_pre_out;

endmodule
