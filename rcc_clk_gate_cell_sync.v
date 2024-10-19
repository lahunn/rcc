module rcc_clk_gate_cell_sync(
    input wire clk_in,
    input wire clk_en,
    output wire clk_out
);
    reg clk_en_f;

    always @(posedge clk_in)begin
        clk_en_f <= clk_en;
    end
    
    assign clk_out = clk_en_f ? clk_in : 1'b0;

endmodule //rcc_clk_gate_cell
