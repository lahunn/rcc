module BB_dfflrs #(
    parameter DW = 2,
    parameter RST_VAL = 0,
    parameter SET_VAL = 1
) (
    input  wire          clk,
    input  wire          rst_n,
    input  wire          set_n,
    input  wire          en,
    input  wire [DW-1:0] din,
    output reg  [DW-1:0] dout
);

  always @(posedge clk or negedge rst_n or negedge set_n) begin
    if (~rst_n) begin
      dout <= RST_VAL;
    end else if (~set_n) begin
      dout <= SET_VAL;
    end else begin
      if (en) begin
        dout <= din;
      end
    end
  end

endmodule
