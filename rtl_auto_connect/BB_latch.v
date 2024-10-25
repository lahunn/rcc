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