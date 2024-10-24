module rcc_clk_gate_cell(
    input wire clk_in,
    input wire clk_en,
    output wire clk_out
);
    assign clk_out = clk_en ? clk_in : 1'b0;

endmodule //rcc_clk_gate_cell
