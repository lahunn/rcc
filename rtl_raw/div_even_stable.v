module div_even_stable #(
    parameter DIVISION = 20  // the max divide factor , must be larger than 2
) (
    input wire clk_in,
    input wire rst_n,
    output wire clk_out
);

    reg [$clog2(DIVISION)-1:0] counter;
    reg clk_out_pre;

    assign clk_out = clk_out_pre;

// when the div factor is odd
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            clk_out_pre <= 0;
        end else begin
            if (counter < DIVISION/2 -1) begin
                clk_out_pre <= clk_out_pre;
                counter <= counter + 1;
            end
            else begin
                counter <= 0;
                clk_out_pre <= ~clk_out_pre;
            end
        end
    end
    
endmodule
