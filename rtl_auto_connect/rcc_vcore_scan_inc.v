module rcc_vcore_scan_inc #(
    parameter AW = 32,
    parameter DW = 32,
    parameter WW = 4
) (
    input  [DW-1:0] mdata,
    input           qspisel_scan_inc,
    input           fmcsel_scan_inc,
    input           sdmmcsel_scan_inc,
    input           usbsel_scan_inc,
    input           adcsel_scan_inc,
    input           rngsel_scan_inc,
    input           usart234578sel_scan_inc,
    input           cecsel_scan_inc,
    input           i2c123sel_scan_inc,
    input           spdifsel_scan_inc,
    input           spi123sel_scan_inc,
    input           lptim1sel_scan_inc,
    input           fdcansel_scan_inc,
    input           swpmisel_scan_inc,
    input           sai1sel_scan_inc,
    input           dfsdm1sel_scan_inc,
    input           sai23sel_scan_inc,
    input           spi45sel_scan_inc,
    input           usart16sel_scan_inc,
    input           sai4asel_scan_inc,
    input           sai4bsel_scan_inc,
    input           lptim345sel_scan_inc,
    input           lptim2sel_scan_inc,
    input           i2c4sel_scan_inc,
    input           spi6sel_scan_inc,
    input           lpuart1sel_scan_inc,
    input           nrst_out_scan_inc,
    input           mco1_scan_inc,
    input           mco2_scan_inc,
    input           pll_src_clk_scan_inc,
    output [DW-1:0] wdata
);
  wire [31:0] group0;
  // wire [31:0] group1;
  // wire [31:0] group2;
  // wire [31:0] group3;
  // wire [31:0] group4;

  assign group0 = {
    qspisel_scan_inc,
    fmcsel_scan_inc,
    sdmmcsel_scan_inc,
    usbsel_scan_inc,
    adcsel_scan_inc,
    rngsel_scan_inc,
    usart234578sel_scan_inc,
    cecsel_scan_inc,
    i2c123sel_scan_inc,
    spdifsel_scan_inc,
    spi123sel_scan_inc,
    lptim1sel_scan_inc,
    fdcansel_scan_inc,
    swpmisel_scan_inc,
    sai1sel_scan_inc,
    dfsdm1sel_scan_inc,
    sai23sel_scan_inc,
    spi45sel_scan_inc,
    usart16sel_scan_inc,
    sai4asel_scan_inc,
    sai4bsel_scan_inc,
    lptim345sel_scan_inc,
    lptim2sel_scan_inc,
    i2c4sel_scan_inc,
    spi6sel_scan_inc,
    lpuart1sel_scan_inc,
    nrst_out_scan_inc,
    mco1_scan_inc,
    mco2_scan_inc,
    pll_src_clk_scan_inc,
    2'b0
  };

  generate
    if (DW == 32) begin : dw32
      assign wdata = mdata || group0;
    end
  endgenerate
endmodule  //rcc_scan_inc
