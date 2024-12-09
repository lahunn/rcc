// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : glitch free clock switch, the sel could be changed at any time
//            and the output clock would not have glitches,
//            if all reset signals are asserted, the output clock would be 0
// ****************************************************************
// spyglass disable_block Clock_info05b
// Clock_info05b (46) : Reports clock signals converging at a combinational gate other than a MUX
// spyglass disable_block Clock_glitch05
// spyglass disable_block Diagnose_02
// Diagnose_02 (1) : At-speed paths must not be blocked by testmode signals
// spyglass disable_block Diagnose_04
module glitch_free_clk_switch #(
    parameter CLK_NUM = 4
) (
    input  [        CLK_NUM-1:0] i_clk,
    input  [        CLK_NUM-1:0] clk_fail,
    input  [$clog2(CLK_NUM)-1:0] sel,
    input  [        CLK_NUM-1:0] rst_n,
    input                        testmode,
    input                        scan_mode,
    input                        test_clk,
    output                       o_clk
);
  wire [        CLK_NUM-1:0] onehot_sel;
  wire [        CLK_NUM-1:0] clk_sel;
  wire [        CLK_NUM-1:0] clk_sel_f;
  wire [        CLK_NUM-1:0] clk_sel_ff;
  wire [        CLK_NUM-1:0] clk_sel_ff_n;
  wire [        CLK_NUM-1:0] clk_pre_out;
  wire [        CLK_NUM-1:0] raw_clk_rst_n;
  wire [        CLK_NUM-1:0] clk_rst_n;
  wire [$clog2(CLK_NUM)-1:0] sel_temp      [CLK_NUM-1:0];
  wire                       raw_o_clk;

  assign raw_clk_rst_n = (~clk_fail) & rst_n;  // Bitwise operation 
  generate
    genvar n;
    for (n = 0; n < CLK_NUM; n = n + 1) begin : test_rst_mux
      // clk_rst_n test reset mux
      test_rst_mux u_clk_rst_n_mux (
          .test_rst_n(rst_n[n]),
          .func_rst_n(raw_clk_rst_n[n]),
          .testmode  (testmode),
          .rst_n     (clk_rst_n[n])
      );
    end
  endgenerate

  //================================================================
  // generate onehot_sel 
  //================================================================
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

  //================================================================
  // generate clk_sel
  //================================================================
  assign clk_sel[0] = onehot_sel[0] && (&clk_sel_ff_n[CLK_NUM-1:1]);
  generate
    genvar j;
    for (j = 1; j < CLK_NUM - 1; j = j + 1) begin : clk_sel_gen
      assign clk_sel[j] = onehot_sel[j] && (&clk_sel_ff_n[j-1:0]) && (&clk_sel_ff_n[CLK_NUM-1:j+1]);
    end
  endgenerate
  assign clk_sel[CLK_NUM-1] = onehot_sel[CLK_NUM-1] && (&clk_sel_ff_n[CLK_NUM-2:0]);

  //================================================================
  // two stage flip-flop to synchronize the sel signal
  //================================================================ 
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

  assign clk_sel_ff_n = ~clk_sel_ff;

  //================================================================
  // clk_pre_out is i_clk gating by onehot_sel , 
  // only one clk is active at the same time
  //================================================================
  generate
    genvar m;
    for (m = 0; m < CLK_NUM; m = m + 1) begin : clk_pre_out_gen
      assign clk_pre_out[m] = i_clk[m] && clk_sel_ff[m];
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
// spyglass enable_block Diagnose_02
// spyglass enable_block Diagnose_04