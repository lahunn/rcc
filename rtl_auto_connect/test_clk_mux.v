module test_clk_mux (
    input  test_clk,
    input  func_clk,
    input  scan_mode,
    output gen_clk
);

  assign gen_clk = scan_mode ? test_clk 
                             : func_clk;

endmodule
