module div_2_to_xth
#(
    parameter SQUARE = 1  // the max divide factor , must be larger than 1
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
            BB_dfflr #(
                .DW      ( 1 ),
                .RST_VAL ( 0 ))
            u_BB_dfflr (
                .clk                     ( clk_temp[i]),
                .rst_n                   ( rst_n   ),
                .en                      ( 1'b1    ),
                .din                     ( ~clk_temp[i+1]   ),
                .dout                    ( clk_temp[i+1]    )
            );
        end
    endgenerate


endmodule
