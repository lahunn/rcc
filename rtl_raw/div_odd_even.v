module div_odd_even #(
    parameter MAX_DIV_FAC = 3  // the max divide factor , must be larger than 2
) (
    input wire clk_in,
    input wire rst_n,
    input wire [$clog2(MAX_DIV_FAC)-1:0] div_sel,
    output wire clk_out
);


    reg [$clog2(MAX_DIV_FAC)-1:0] counter;
    reg clk_out_pre;

    assign clk_out =  div_sel == 0 ? 1'b0 : (div_sel == 1 ? clk_in : clk_out_pre);

// when the div factor is odd
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            clk_out_pre <= 0;
        end else begin
            if (counter == div_sel[$clog2(MAX_DIV_FAC)-1:1]-1) begin
                clk_out_pre <= ~clk_out_pre;
                counter <= counter + 1;
            end
            else if (counter == div_sel[$clog2(MAX_DIV_FAC)-1:0]-1) begin
                counter <= 0;
                clk_out_pre <= ~clk_out_pre;
            end 
            else begin
                counter <= counter + 1;
            end
        end
    end
    
endmodule
