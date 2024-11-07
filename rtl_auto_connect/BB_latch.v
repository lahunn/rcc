// spyglass disable_block InferLatch
module BB_latch(
  input D,
  input GN,
  output reg Q
);
// NULL MODULE
  always @(*) begin
    if(GN)begin
      Q = D;
    end
  end

endmodule
//spyglass enable_block InferLatch
