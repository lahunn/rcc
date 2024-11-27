module BB_dff #(
    parameter DW = 1
) (
    input  wire          clk,
    input  wire [DW-1:0] din,
    output reg  [DW-1:0] dout
);

  always @(posedge clk) begin
    dout <= din;
  end

endmodule
