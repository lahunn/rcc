/* verilator lint_off UNUSEDPARAM */
/* verilator lint_off UNUSEDSIGNAL */
/* verilator lint_off UNDRIVEN */
module BB_ahb2reg #(
    parameter DW = 32,
    parameter AW = 32,
    parameter WW = 4
) (
    input           hclk,
    input           hresetn,
    input           hready,
    input           hsel,
    input  [   1:0] htrans,
    input           hwrite,
    input  [  31:0] haddr,
    input  [   2:0] hsize,
    input  [DW-1:0] hwdata,
    input  [DW-1:0] hrdata,
    output          hreadyout,
    output          hresp,

    output          mreq,
    output          mwrite,
    output [AW-1:0] maddr,
    output [WW-1:0] mstrb,
    output [DW-1:0] mdata,
    input  [DW-1:0] sdata,
    input           sready,
    input           sresp
);
  // NULL MODULE

  // rcc_ahb_lite_bus Outputs
  assign hreadyout = sready;
  assign hresp     = sresp;
  assign mreq      = hready;
  assign mwrite    = hwrite;
  assign maddr     = haddr;
  assign mstrb     = {hsel, htrans};
  assign mdata     = hwdata;


endmodule
