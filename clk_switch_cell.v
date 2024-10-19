module clk_switch_cell #(
    parameter CLK_NUM = 3  // CLK_NUM >= 2
)
(
    input wire [CLK_NUM-1:0] clk_in,
    input wire [$clog2(CLK_NUM)-1: 0] sel,
    output reg clk_out
);

    always @(*) begin
        case(sel) 
            2'b0: clk_out = clk_in[0];
            2'b1: clk_out = clk_in[1];
            2'b10: clk_out = clk_in[2];
            default: clk_out = clk_in[0];
        endcase
    end

endmodule //clk_switch_cell
