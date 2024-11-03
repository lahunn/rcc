module mux_n_to_1 #(
    parameter N = 9,
    parameter m = 4
) (
    input  [N-1:0] inp,
    input  [m-1:0] sel,
    output         mout
);
  wire [1:0] temp;
  generate
    if (N == 1) assign mout = inp[0];
    else if (N == 2) begin: M2_blk
      assign mout = (sel[0]) ? inp[1] : inp[0];
    end else if (N > 2) begin: Mx_blk
      if ((N & (N - 1)) == 0) begin: M_2_x_blk   // N is power of 2
        mux_n_to_1 #(
            .N(N / 2),
            .m(m - 1)
        ) M1 (
            .inp   (inp[N/2-1:0]),
            .sel(sel[m-2:0]),
            .mout   (temp[0])
        );
        mux_n_to_1 #(
            .N(N / 2),
            .m(m - 1)
        ) M2 (
            .inp   (inp[N-1:N/2]),
            .sel(sel[m-2:0]),
            .mout   (temp[1])
        );
        assign mout = (sel[m-1]) ? temp[1] : temp[0];
      end else if (((N - 1) & (N - 2)) == 0) begin:M_2_x_minus_1_blk // N is the power of 2 - 1
        mux_n_to_1 #(
            .N(2 ** (m - 1)),
            .m(m - 1)
        ) M4 (
            .inp   (inp[(2**(m-1)-1):0]),
            .sel(sel[m-2:0]),
            .mout   (temp[0])
        );
        assign temp[1] = inp[N-1];
        assign mout     = (sel[m-1]) ? temp[1] : temp[0];
      end else if (((N - 2) & (N - 3)) == 0) begin:M_2_x_minus_2_blk // N is the power of 2 - 2
        mux_n_to_1 #(
            .N(2 ** (m - 1)),
            .m(m - 1)
        ) M6 (
            .inp   (inp[(2**(m-1)-1):0]),
            .sel(sel[m-2:0]),
            .mout   (temp[0])
        );
        assign temp[1] = (sel[0]) ? inp[N-1] : inp[N-2];
        assign mout     = (sel[m-1]) ? temp[1] : temp[0];
      end else begin:M_normal_blk
        mux_n_to_1 #(
            .N(2 ** (m - 1)),
            .m(m - 1)
        ) M8 (
            .inp   (inp[(2**(m-1)-1):0]),
            .sel(sel[m-2:0]),
            .mout   (temp[0])
        );
        mux_n_to_1 #(
            .N(N - (2 ** (m - 1))),
            .m(m - 1)
        ) M9 (
            .inp   (inp[N-1:(2**(m-1))]),
            .sel(sel[m-2:0]),
            .mout   (temp[1])
        );
        assign mout = (sel[m-1]) ? temp[1] : temp[0];
      end
    end
  endgenerate
endmodule
