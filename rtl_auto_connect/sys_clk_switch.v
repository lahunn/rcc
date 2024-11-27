// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : glitch free clock switch, the sel could be changed at any time
//            and the output clock would not have glitches,
//            if all reset signals are asserted, the output clock would be i_clk[0]
// ****************************************************************
// spyglass disable_block Clock_info05b
// Clock_info05b (46) : Reports clock signals converging at a combinational gate other than a MUX
// spyglass disable_block Clock_glitch05
module sys_clk_switch #(
    parameter CLK_NUM = 4
) (
    input  [        CLK_NUM-1:0] i_clk,
    input  [        CLK_NUM-1:0] clk_fail,
    input  [$clog2(CLK_NUM)-1:0] sel,
    input  [        CLK_NUM-1:0] rst_n,
    input                        scan_mode,
    input                        test_clk,
    output                       o_clk
);
  wire [        CLK_NUM-1:0] onehot_sel;
  wire [        CLK_NUM-1:0] clk_sel;
  wire [        CLK_NUM-1:0] d1_clk_sel;
  wire [        CLK_NUM-1:0] d2_clk_sel;
  wire [        CLK_NUM-1:0] d2_clk_sel_n;
  wire [        CLK_NUM-1:0] clk_pre_out;
  wire [        CLK_NUM-1:0] clk_rst_n;
  wire [$clog2(CLK_NUM)-1:0] sel_temp     [CLK_NUM-1:0];


  assign clk_rst_n = (~clk_fail) & rst_n;  // Bitwise operation

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
  assign d2_clk_sel_n = ~d2_clk_sel;
  assign clk_sel[0]   = onehot_sel[0] && (&d2_clk_sel_n[CLK_NUM-1:1]);
  generate
    genvar j;
    for (j = 1; j < CLK_NUM - 1; j = j + 1) begin : clk_sel_gen
      assign clk_sel[j] = onehot_sel[j] && (&d2_clk_sel_n[j-1:0]) && (&d2_clk_sel_n[CLK_NUM-1:j]);
    end
  endgenerate
  assign clk_sel[CLK_NUM-1] = onehot_sel[CLK_NUM-1] && (&d2_clk_sel_n[CLK_NUM-2:0]);

  //===================================================================
  //generate two stage flip-flop
  //===================================================================

  //in default case, pre_sys_clk choose hsi_clk , and pre_sys_clk should be generated before reset release
  BB_dffrs #(
      .DW     (1),
      .RST_VAL(1),
      .SET_VAL(0)
  ) u_BB_dffrs0_0 (
      .clk  (i_clk[0]),
      .rst_n(rst_n[0]),
      .set_n(~clk_fail[0]),
      .din  (clk_sel[0]),
      .dout (d1_clk_sel[0])
  );

  BB_dffrs #(
      .DW     (1),
      .RST_VAL(1),
      .SET_VAL(0)
  ) u_BB_dffrs0_1 (
      .clk  (i_clk[0]),
      .rst_n(rst_n[0]),
      .set_n(~clk_fail[0]),
      .din  (d1_clk_sel[0]),
      .dout (d2_clk_sel[0])
  );
  generate
    genvar k;
    for (k = 1; k < CLK_NUM; k = k + 1) begin : clock_flip_flops
      BB_dffr #(
          .DW     (1),
          .RST_VAL(0)
      ) u_BB_dffr_0 (
          .clk  (i_clk[k]),
          .rst_n(clk_rst_n[k]),
          .din  (clk_sel[k]),
          .dout (d1_clk_sel[k])
      );

      BB_dffr #(
          .DW     (1),
          .RST_VAL(0)
      ) u_BB_dffr_1 (
          .clk  (i_clk[k]),
          .rst_n(clk_rst_n[k]),
          .din  (d1_clk_sel[k]),
          .dout (d2_clk_sel[k])
      );
    end
  endgenerate


  //generate clk_pre_out
  generate
    genvar m;
    for (m = 0; m < CLK_NUM; m = m + 1) begin : clk_pre_out_gen
      assign clk_pre_out[m] = i_clk[m] && d2_clk_sel[m];
    end
  endgenerate

  //================================================================
  // o_clk is OR of clk_pre_out
  //================================================================
  assign raw_o_clk = |clk_pre_out;

  // o_clk test clock mux
  test_clk_mux u_o_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_o_clk),
      .scan_mode(scan_mode),
      .gen_clk  (o_clk)
  );

endmodule
// spyglass enable_block Clock_info05b
// spyglass enable_block Clock_glitch05
