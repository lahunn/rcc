module async_reset_clk_gate #(
    parameter DELAY = 8
)
(
    input rst_n_in,
    input clk_in,
    input arcg_on,
    output clk_en,
    output reg rst_n_clk_g
);

wire rst_n_f;//
wire rst_n_ff;//
reg clk_en_f;
reg [$clog2(DELAY)-1:0] counter;

assign clk_en = aarcg_on ? clk_en_f : 1'b1;

BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) reset_sync_1 (
  .clk  (clk_in                   ),
  .rst_n(rst_n_in                 ),
  .en   (1'b1 ),
  .din  (1'b1 ),
  .dout (rst_n_f)
);

BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) reset_sync_1 (
  .clk  (clk_in                   ),
  .rst_n(rst_n_f                  ),
  .en   (1'b1 ),
  .din  (1'b1 ),
  .dout (rst_n_ff)
);

always @(posedge clk_in or negedge rst_n_ff)begin
    if(~rst_n_ff)begin
        rst_n_clk_g <= 1'b0;
        clk_en_f <= 1'b0;
        counter <= {$clog2(DELAY){1'b0}};
    end else begin
        rst_n_clk_g <= 1'b1;
        if(counter < DELAY)begin
            counter <= counter + 1'b1;
            clk_en_f <= 1'b0;
        end else begin
            counter <= counter;
            clk_en_f <= 1'b1;
        end
    end
end



    
endmodule //moduleName
