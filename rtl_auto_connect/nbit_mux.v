module nbit_mux #(
    parameter WIDTH = 1
) (
    input  [WIDTH-1:0] in0,
    input  [WIDTH-1:0] in1,
    input              sel,
    output [WIDTH-1:0] out
);

  generate
    genvar i;
    for (i = 0; i < WIDTH; i = i + 1) begin : onebit_mux
      BB_mux_cell u_mux_cell (
          .ina(in0[i]),  //0
          .inb(in1[i]),  //1
          .sel(sel),
          .out(out[i])
      );
    end
  endgenerate

endmodule
