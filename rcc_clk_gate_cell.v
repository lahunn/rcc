module rcc_clk_gate_cell(
    input wire clk_in,
    input wire clk_en,
    output wire clk_out
);
`ifdef FPGA
    assign clk_out = clk_en ? clk_in : 1'b0;
`else
    clock_gate #(
        .CLK_GATE_DELAY(0)
    ) clk_gate_inst (
        .clk_in(clk_in),
        .clk_out(clk_out),
        .clk_gate(clk_en)
    );
`endif


endmodule //rcc_clk_gate_cell