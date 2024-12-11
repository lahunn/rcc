module clk_inv (
    input  clk,
    output inv_clk
);
  assign inv_clk = ~clk;

endmodule
