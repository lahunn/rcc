module div_2
(
    input wire clk_in,
    input wire rst_n,
    output wire clk_out
);

    
    BB_dfflr #(
        .DW      ( 1 ),
        .RST_VAL ( 0 ))
    u_BB_dfflr (
        .clk                     ( clk_in),
        .rst_n                   ( rst_n   ),
        .en                      ( 1'b1    ),
        .din                     ( ~clk_out   ),
        .dout                    ( clk_out    )
    );


endmodule
