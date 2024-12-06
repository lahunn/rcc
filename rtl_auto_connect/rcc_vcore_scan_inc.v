module rcc_vcore_scan_inc #(
    parameter AW = 32,
    parameter DW = 32,
    parameter WW = 4
) (
    input  [DW-1:0] mdata,
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
    nrst_out_scan_inc,
    31'b0
  };

  generate
    if (DW == 32) begin : dw32
      assign wdata = mdata || group0;
    end
  endgenerate
endmodule  //rcc_scan_inc
