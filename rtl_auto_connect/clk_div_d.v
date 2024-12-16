// ****************************************************************
// DATA : 2024-11-28
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : 
// when ratio equals to 1, the output clock is the same as the input clock
// when ratio equals to 0, the output clock is 2^(RATIO_WID) times slower than the input clock
// ****************************************************************
// spyglass disable_block STARC05-1.4.3.4
// STARC05-1.4.3.4 (28) : Flip-flop clock signals must not be used as non-clock signals

module clk_div_d #(
    parameter RATIO_WID = 8
) (
    input                  rst_n,
    input                  i_clk,
    input  [RATIO_WID-1:0] ratio,
    input                  testmode,
    output                 o_clk,
    output                 div_en
);

  //=========================================================================================
  //FIXED PARAMETERS
  //=========================================================================================
  localparam CNT_WID = RATIO_WID;

  //=========================================================================================
  //INTERNAL SIGNALS  DECLEARATION
  //=========================================================================================
  wire [  CNT_WID-1:0] cur_cnt;
  wire [  CNT_WID-1:0] nxt_cnt;
  wire [RATIO_WID-1:0] half_ratio;
  wire [RATIO_WID-1:0] minus_one_ratio;
  wire [RATIO_WID-1:0] minus_one_half_ratio;
  wire                 cur_o_clk;
  wire                 nxt_o_clk;
  wire                 o_clk_wren;
  wire                 zero_ratio;
  wire                 no_div;

  assign minus_one_ratio      = zero_ratio ? {RATIO_WID{1'b1}} : (ratio - 'b1);
  assign minus_one_half_ratio = half_ratio - 'b1;
  //half of the ratio
  assign zero_ratio           = (ratio == 'b0);
  assign no_div               = (ratio == 'b1);
  assign half_ratio           = zero_ratio ? {1'b1, {(RATIO_WID - 1) {1'b0}}} : {1'b0, ratio[RATIO_WID-1:1]};
  //================================================================
  // counter for the division
  //================================================================

  assign nxt_cnt              = (cur_cnt >= minus_one_ratio) ? 'b0 : cur_cnt + 'b1;
  BB_dffr #(
      .DW     (RATIO_WID),
      .RST_VAL('b0)
  ) u_cnt_dffr (
      .clk  (i_clk),
      .rst_n(rst_n),
      .din  (nxt_cnt),
      .dout (cur_cnt)
  );

  //================================================================
  // clock generate
  //================================================================
  clk_inv u_clk_inv (
      .clk    (cur_o_clk),
      .inv_clk(nxt_o_clk)
  );
  assign o_clk_wren = (cur_cnt == minus_one_half_ratio) || (cur_cnt == minus_one_ratio);

  sys_clk_switch #(
      .CLK_NUM(2)
  ) u_o_clk_mux (
      .i_clk    ({cur_o_clk, i_clk}),
      .clk_fail (2'b0),
      .sel      (!no_div),
      .rst_n    ({2{rst_n}}),
      .testmode (testmode),
      .scan_mode(1'b0),
      .test_clk (1'b0),
      .o_clk    (o_clk)
  );

  BB_dfflr #(
      .DW     (1),
      .RST_VAL(0)
  ) u_o_clk_dfflr (
      .clk  (i_clk),
      .rst_n(rst_n),
      .en   (o_clk_wren),
      .din  (nxt_o_clk),
      .dout (cur_o_clk)
  );

  //================================================================
  // div enable
  //================================================================
  assign div_en = (cur_cnt == minus_one_ratio);

endmodule

// spyglass enable_block STARC05-1.4.3.4
