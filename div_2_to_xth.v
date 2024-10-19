module div_2_to_xth
#(
    parameter SQUARE = 0
)
(
    input wire clk_in,
    input wire rst_n,
    output wire clk_out
);
    wire [SQUARE:0] clk_temp;
    assign clk_temp[0] = clk_in;
    assign clk_out = clk_temp[SQUARE];

    genvar i;
    generate
        for(i = 0; i < SQUARE; i = i + 1) begin : div_2_gen
            dff_cell dff_cell_inst (
                .clk(clk_temp[i]),
                .rst_n(rst_n),
                .d(~clk_temp[i+1]),
                .q(clk_temp[i+1])
            );
        end
    endgenerate


endmodule
