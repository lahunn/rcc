// spyglass disable_block InferLatch
module BB_latch #(
    parameter TEST_VALUE = 'b0
) (
    input  D,
    input  GN,
    input  testmode,
    output Q
);
  reg  raw_Q;
  wire gen_GN;
  BB_mux_cell u_GN_mux_cell (
      .ina(GN),        //0
      .inb(1'b1),      //1
      .sel(testmode),
      .out(gen_GN)
  );
  always @(*) begin
    if (gen_GN) begin
      raw_Q = D;
    end
  end

  assign Q = raw_Q;
endmodule
//spyglass enable_block InferLatch
