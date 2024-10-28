/* verilator lint_off UNUSEDPARAM */
/* verilator lint_off UNUSEDSIGNAL */
/* verilator lint_off UNDRIVEN */
module BB_ahb2reg #(
  parameter DW = 64,
  parameter AW = 15,
  parameter WW = DW/8
)(
    input  hclk,
    input  hresetn,
    input hready,
    input hsel,
    input [1:0] htrans,
    input hwrite,
    input [31:0] haddr,
    input [2:0] hsize,
    input [DW-1:0] hwdata,
    input [DW-1:0] hrdata,
    output hreadyout,
    output hresp,

    output mreq,
    output mwrite,
    output [AW-1:0] maddr,
    output [WW-1:0] mstrb,
    output [DW-1:0] mdata,
    input [DW-1:0] sdata,
    input sready,
    input sresp
);
// NULL MODULE

// rcc_ahb_lite_bus Outputs
assign hreadyout = 1'b0;
assign hresp = 1'b0;
assign mreq = 1'b0;
assign mwrite = 1'b0;
assign maddr = 'b0;
assign mstrb = 'b0;
assign mdata = 'b0;


endmodule
