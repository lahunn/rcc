module BB_reset_sync #(
  parameter STAGE_NUM = 2//no less than 2
)
(
  input src_rst_n,
  input clk,
  output gen_rst_n
);


wire [STAGE_NUM-1:0] cur_sync;
wire [STAGE_NUM-1:0] nxt_sync;

BB_dffr #(
  .DW     (STAGE_NUM),
  .RST_VAL('b0)
) reset_sync_1 (
  .clk  (clk       ),
  .rst_n(src_rst_n ),
  .din  (nxt_sync  ),
  .dout (cur_sync  )
);

assign nxt_sync = {cur_sync[STAGE_NUM-2:0], 1'b1};
assign gen_rst_n = cur_sync[STAGE_NUM-1];

endmodule
