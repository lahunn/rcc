module rcc_pclk_timer_div (
    input clk_in,
    input rst_n,
    input [2:0] div_sel,
    input timpre,
    output tim_ker_clk,
    output pclk
);
    wire [4:0] clk_temp;
    wire pclk_pre;
    wire tim_ker_clk_pre_1;
    wire tim_ker_clk_pre_0;
    assign clk_temp[0] = clk_in;


// 4 stage of div_2
    genvar i;
    generate
        for(i = 0; i < 4; i = i + 1) begin : div_2_gen
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


    glitch_free_clk_switch #(
        .CLK_NUM(4)
    )
    glitch_free_clk_switch_pclk_pre (
        .clk_in(clk_temp[4:1]),
        .rst_n(rst_n),
        .sel(div_sel[1:0]),
        .clk_out(pclk_pre)
    );  // select clock from 2 to 2^4
    glitch_free_clk_switch #(
        .CLK_NUM(2)
    )glitch_free_clk_switch_pclk (
        .clk_in({pclk_pre, clk_in}),
        .rst_n(rst_n),
        .sel(div_sel[2]),
        .clk_out(pclk)
    );

    glitch_free_clk_switch #(    //select from 2 div clock ,4 div clock 
        .CLK_NUM(2)
    )glitch_free_clk_switch_tim_ker_clk_pre_1 (
        .clk_in(clk_temp[2:1]),
        .rst_n(rst_n),
        .sel(div_sel[0]),
        .clk_out(tim_ker_clk_pre_1)
    );

    glitch_free_clk_switch #(
        .CLK_NUM(2)
    )glitch_free_clk_switch_tim_ker_clk_pre_0(
        .clk_in({tim_ker_clk_pre_1, clk_in}),
        .rst_n(rst_n),
        .sel(div_sel[1] & div_sel[2]),
        .clk_out(tim_ker_clk_pre_0)
    );

    glitch_free_clk_switch #(
        .CLK_NUM(2)
    )glitch_free_clk_switch_tim_ker_clk(
        .clk_in({tim_ker_clk_pre_0,pclk}),
        .rst_n(rst_n),
        .sel(timpre),
        .clk_out(tim_ker_clk)
    );

endmodule
