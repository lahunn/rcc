module rcc_ahb_lite_bus(
    input wire ahb_hclk,
    input wire ahb_hresetn,
    input wire [31:0] ahb_haddr,
    input wire [2:0] ahb_hburst,
    input wire [2:0] ahb_hprot,
    output wire [31:0] ahb_hrdata,
    input wire ahb_hready_in,
    output wire ahb_hready_out,
    output wire ahb_hresp,
    input wire [2:0] ahb_hsize,
    input wire [1:0] ahb_htrans,
    input wire [31:0] ahb_hwdata,
    input wire ahb_hwrite,
    input wire ahb_hsel,
    input wire ahb_hmaster,

    output clk,
    output rst_n,
    output req,
    output [3:0] we,
    output [28:0] addr,
    output [31:0] wdata,
    input [31:0] rdata,
    input [1:0] rsp
);





// rcc_ahb_lite_bus Outputs
assign  ahb_hrdata = 32'b0;
assign  ahb_hready_out = 1'b0;
assign  ahb_hresp = 1'b0;
assign  clk = 1'b0;
assign  rst_n = 1'b0;
assign  req = 1'b0;
assign  we =4'b0;
assign  addr = 29'b0;
assign  wdata = 32'b0;







endmodule