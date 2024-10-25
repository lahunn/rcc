module BB_dfflr #(
  parameter DW = 1,
  parameter RST_VAL = 0 
)(
  input wire clk,
  input wire rst_n,
  input wire [DW-1:0] din,
  output reg [DW-1:0] dout
);

always @(posedge clk or negedge rst_n)begin
    if(~rst_n)begin
        dout <= RST_VAL;
    end else begin
        dout <= din;
    end
end
    
endmodule
