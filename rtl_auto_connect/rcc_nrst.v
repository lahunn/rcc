module rcc_nrst #(
    parameter NRST_PULSE_WIDTH = 400
) (
    input  clk,
    input  pad_nrst,  //active high
    input  nrst_in,   //active high
    output nrst_out   //active high
);
  localparam CNT_WD = $clog2(NRST_PULSE_WIDTH);
  wire              nrst_in_n;
  wire [CNT_WD-1:0] cur_count;
  wire [CNT_WD-1:0] nxt_count;
  wire [CNT_WD-1:0] count_en;
  wire              cur_nrst_out;
  wire              nxt_nrst_out;
  wire              nrst_out_en;

  assign nrst_in_n    = ~nrst_in;

  //================================================================
  // PAD NRST generation
  // reset pulse width 20us at least , assume that hse is 20MHz , so we need 400 cycles
  //================================================================
  assign nxt_nrst_out = 1'b0;
  assign nrst_out_en  = (cur_count == NRST_PULSE_WIDTH);

  BB_dfflr #(
      .DW     (1),
      .RST_VAL(0)
  ) u_nrst_out_dfflr (
      .clk  (clk),
      .rst_n(nrst_in_n),
      .en   (nrst_out_en),
      .din  (nxt_nrst_out),
      .dout (cur_nrst_out)
  );

  assign nxt_count = cur_count + 1;
  assign count_en  = (cur_count != NRST_PULSE_WIDTH);
  BB_dfflr #(
      .DW     (CNT_WD),
      .RST_VAL(0)
  ) u_count_dfflr (
      .clk  (clk),
      .rst_n(nrst_in_n),
      .en   (count_en),
      .din  (nxt_count),
      .dout (cur_count)
  );





endmodule
