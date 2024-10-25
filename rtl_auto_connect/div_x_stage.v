module div_x_stage 
#(
    parameter  STAGE_NUM = 4,  // the number of dff
    parameter  IS_STAGE_REMOVE = 0, // remove a stage 0: don't remove, 1: remove a stage
    parameter  STAGE_REMOVED = 0 // the stage to be removed , it can't be 0 or STAGE_NUM
)
(
    input wire clk_in,
    input wire rst_n,
    input wire [$clog2(STAGE_NUM-IS_STAGE_REMOVE+1)-1:0] div_sel,
    output wire clk_out
);
    wire [STAGE_NUM:0] clk_temp;
    wire clk_out_0;
    assign clk_temp[0] = clk_in;


// we must be careful 
    genvar i;
    generate
        for(i = 0; i < STAGE_NUM; i = i + 1) begin : div_2_gen
            BB_dfflr #(
                .DW      ( 1 ),
                .RST_VAL ( 0 ))
            u_BB_dfflr (
                .clk                     ( clk_temp[i]    ),
                .rst_n                   ( rst_n   ),
                .en                      ( 1'b1     ),
                .din                     ( ~clk_temp[i+1]    ),
                .dout                    ( clk_temp[i+1]    )
            );
        end
    endgenerate


    generate
        if (IS_STAGE_REMOVE == 0) begin : clk_out_without_remove
            glitch_free_clk_switch #(
                .CLK_NUM(STAGE_NUM)
            )
            glitch_free_clk_switch_inst_0 (
                .clk_in(clk_temp[STAGE_NUM:1]),
                .rst_n(rst_n),
                .sel(div_sel[$clog2(STAGE_NUM)-1:0]),
                .clk_out(clk_out_0)
            );  // select clock from 2 to 2^STAGE_NUM
            glitch_free_clk_switch #(
                .CLK_NUM(2)
            )glitch_free_clk_switch_inst_1 (
                .clk_in({clk_out_0, clk_in}),
                .rst_n(rst_n),
                .sel(div_sel[$clog2(STAGE_NUM)]),
                .clk_out(clk_out)
            );
        end
        else if(STAGE_REMOVED == 1) begin : clk_out_remove_stage_1
            glitch_free_clk_switch #(
                .CLK_NUM(STAGE_NUM-1)
            )
            glitch_free_clk_switch_inst_0 (
                .clk_in({clk_temp[STAGE_NUM:2]}),
                .rst_n(rst_n),
                .sel(div_sel[$clog2(STAGE_NUM-1)-1:0]),
                .clk_out(clk_out_0)
            );  // select clock from 2 to 2^STAGE_NUM
            glitch_free_clk_switch #(
                .CLK_NUM(2)
            )glitch_free_clk_switch_inst_1 (
                .clk_in({clk_out_0, clk_in}),
                .rst_n(rst_n),
                .sel(div_sel[$clog2(STAGE_NUM-1)]),
                .clk_out(clk_out)
            );
        end
        else begin : clk_out_remove_stage_x
            glitch_free_clk_switch #(
                .CLK_NUM(STAGE_NUM-1)
            )
            glitch_free_clk_switch_inst_0 (
                .clk_in({clk_temp[STAGE_NUM:STAGE_REMOVED+1], clk_temp[STAGE_REMOVED-1:1]}),
                .rst_n(rst_n),
                .sel(div_sel[$clog2(STAGE_NUM-1)-1:0]),
                .clk_out(clk_out_0)
            );  // select clock from 2 to 2^STAGE_NUM
            glitch_free_clk_switch #(
                .CLK_NUM(2)
            )glitch_free_clk_switch_inst_1 (
                .clk_in({clk_out_0, clk_in}),
                .rst_n(rst_n),
                .sel(div_sel[$clog2(STAGE_NUM-1)]),
                .clk_out(clk_out)
            );
        end
    endgenerate
    
    

endmodule
