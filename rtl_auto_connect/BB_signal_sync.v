module BB_signal_sync #(
    parameter STAGE_NUM = 2,  //no less than 2
    parameter DW = 1
) (
    input  [DW-1:0] src_signal,
    input           rst_n,
    input           clk,
    output [DW-1:0] gen_signal
);


  wire [DW-1:0] sync_signal[STAGE_NUM:0];
  assign sync_signal[0] = src_signal;
  assign gen_signal     = sync_signal[STAGE_NUM];
  generate
    genvar i;
    for (i = 0; i < STAGE_NUM; i = i + 1) begin : SYNC_SIGNAL
      BB_dffr #(
          .DW     (DW),
          .RST_VAL('h0)
      ) reset_sync_1 (
          .clk  (clk),
          .rst_n(rst_n),
          .din  (sync_signal[i]),
          .dout (sync_signal[i+1])
      );
    end
  endgenerate

endmodule
