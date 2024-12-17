module nbit_mux_3 #(
    parameter WIDTH = 1
) (
    input  [WIDTH-1:0] in0,
    input  [WIDTH-1:0] in1,
    input  [WIDTH-1:0] in2,
    input  [      1:0] sel,
    output [WIDTH-1:0] out
);

  generate
    genvar i;
    for (i = 0; i < WIDTH; i = i + 1) begin : onebit_mux
      mux_n_to_1 #(
          .N(3),
          .m(2)
      ) u_mux_n_to_1 (
          .inp ({in2[i], in1[i], in0[i]}),
          .sel (sel),
          .mout(out[i])
      );
    end
  endgenerate

endmodule
