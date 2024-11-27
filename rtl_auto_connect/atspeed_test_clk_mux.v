module atspeed_test_clk_mux (
    input  test_clk,
    input  atspeed_test_clk,
    input  func_clk,
    input  scan_mode,
    input  atspeed_mode,
    output gen_clk
);

  assign gen_clk = atspeed_mode ? atspeed_test_clk
                                : (scan_mode ? test_clk 
                                             : func_clk);

endmodule
