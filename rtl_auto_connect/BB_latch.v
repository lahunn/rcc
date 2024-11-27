// spyglass disable_block InferLatch
module BB_latch #(
    parameter TEST_VALUE = 0
) (
    input  D,
    input  GN,
    input  testmode,
    output Q
);
  reg raw_Q;
  BB_mux_cell u_BB_mux_cell (
      .ina(raw_Q),       //0
      .inb(TEST_VALUE),  //1
      .sel(testmode),
      .out(Q)
  );
  always @(*) begin
    if (GN) begin
      raw_Q = D;
    end
  end

endmodule
//spyglass enable_block InferLatch
