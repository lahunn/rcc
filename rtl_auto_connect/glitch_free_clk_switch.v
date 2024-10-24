module glitch_free_clk_switch 
#(
    parameter    CLK_NUM = 4
)
(
    input [CLK_NUM-1:0] clk_in,
    input [$clog2(CLK_NUM)-1: 0] sel,
    input rst_n,
    output clk_out
);
    wire [CLK_NUM-1:0] onehot_sel;
    wire [CLK_NUM-1:0] clk_sel;
    reg [CLK_NUM-1:0] clk_sel_f;
    reg [CLK_NUM-1:0] clk_sel_ff;
    wire [CLK_NUM-1:0] clk_sel_ff_n;
    wire [CLK_NUM-1:0] clk_pre_out;

    wire [$clog2(CLK_NUM)-1: 0] sel_temp [CLK_NUM-1:0];

    genvar i;  // generate variable can not be initalized
    generate 
        for(i=0; i<CLK_NUM; i=i+1) begin:sel_temp_gen
            assign sel_temp[i] = i;   // it may not be compitable with some tools
        end
    endgenerate
    generate
        for(i=0; i<CLK_NUM; i=i+1) begin:sel_decode
            assign onehot_sel[i] = &(~(sel_temp[i] ^ sel));
        end
    endgenerate

// generate clk_sel
    assign clk_sel[0] = onehot_sel[0] & ( & clk_sel_ff_n[CLK_NUM-1:1]);
    generate
        for(i=1;i<CLK_NUM-1;i=i+1) begin:clk_sel_gen
            assign clk_sel[i] = onehot_sel[i] & ( & clk_sel_ff_n[i-1:0]) & ( & clk_sel_ff_n[CLK_NUM-1:i]);
        end
    endgenerate
    assign clk_sel[CLK_NUM-1] = onehot_sel[CLK_NUM-1] & ( & clk_sel_ff_n[CLK_NUM-2:0]);

//generate two stage flip-flop    
    generate
        for(i=0;i<CLK_NUM;i=i+1) begin:clock_flip_flops
            BB_dfflr #(
                .DW      (1),
                .RST_VAL (0))
            u_BB_dfflr_0 (
                .clk  ( clk_in[i]  ),
                .rst_n( rst_n   ),
                .en   ( 1'b1    ),
                .din  ( clk_sel[i]    ),
                .dout ( clk_sel_f[i]  )
            );

            BB_dfflr #(
                .DW      (1),
                .RST_VAL (0))
            u_BB_dfflr_1 (
                .clk  ( clk_in[i]  ),
                .rst_n( rst_n   ),
                .en   ( 1'b1    ),
                .din  ( clk_sel_f[i]    ),
                .dout ( clk_sel_ff[i]  )
            );
        end
    endgenerate


//
assign clk_sel_ff_n = ~clk_sel_ff;

//generate clk_pre_out
    generate
        for(i=0;i<CLK_NUM;i=i+1) begin:clk_pre_out_gen
            assign clk_pre_out[i] = clk_in[i] & clk_sel_ff[i];
        end
    endgenerate

assign clk_out = |clk_pre_out;

endmodule
