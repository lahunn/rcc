module test_rst_mux (
    input  test_rst_n,
    input  func_rst_n,
    input  testmode,
    output rst_n
);
  assign rst_n = testmode ? test_rst_n 
                          : func_rst_n;
endmodule
