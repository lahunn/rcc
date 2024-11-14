// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : N-to-1 multiplexer
// ****************************************************************
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
    //================================================================
    // the last stage mux
    //================================================================
    if (N == 1) assign mout = inp[0];
    else if (N == 2) begin : M2_blk
      BB_mux_cell u_mux_cell_0 (
          .ina(inp[0]),
          .inb(inp[1]),
          .sel(sel[0]),
          .out(mout)
      );
    end
    //===============================================================
    // when N > 2 , the middle stage mux
    //================================================================
    else if (N > 2) begin : Mx_blk
      if ((N & (N - 1)) == 0) begin : M_2_x_blk  // N is power of 2
        mux_n_to_1 #(
            .N(N / 2),
            .m(m - 1)
        ) M1 (
            .inp (inp[N/2-1:0]),
            .sel (sel[m-2:0]),
            .mout(temp[0])
        );
        mux_n_to_1 #(
            .N(N / 2),
            .m(m - 1)
        ) M2 (
            .inp (inp[N-1:N/2]),
            .sel (sel[m-2:0]),
            .mout(temp[1])
        );
        BB_mux_cell u_mux_cell_1 (
          .ina(temp[0]),
          .inb(temp[1]),
          .sel(sel[m-1]),
          .out(mout)
        );

      end else if (((N - 1) & (N - 2)) == 0) begin : M_2_x_minus_1_blk  // N is the power of 2 + 1
        mux_n_to_1 #(
            .N(2 ** (m - 1)),
            .m(m - 1)
        ) M4 (
            .inp (inp[(2**(m-1)-1):0]),
            .sel (sel[m-2:0]),
            .mout(temp[0])
        );
        assign temp[1] = inp[N-1];
        BB_mux_cell u_mux_cell_2 (
          .ina(temp[0]),
          .inb(temp[1]),
          .sel(sel[m-1]),
          .out(mout)
        );
      end else if (((N - 2) & (N - 3)) == 0) begin : M_2_x_minus_2_blk  // N is the power of 2 + 2
        mux_n_to_1 #(
            .N(2 ** (m - 1)),
            .m(m - 1)
        ) M6 (
            .inp (inp[(2**(m-1)-1):0]),
            .sel (sel[m-2:0]),
            .mout(temp[0])
        );
        
        BB_mux_cell u_mux_cell_3 (
          .ina(inp[N-2]),
          .inb(inp[N-1]),
          .sel(sel[0]),
          .out(temp[1])
        );

        BB_mux_cell u_mux_cell_4 (
          .ina(temp[0]),
          .inb(temp[1]),
          .sel(sel[m-1]),
          .out(mout)
        );
      end else begin : M_normal_blk  // N is not power of 2 / power of 2 + 1 / power of 2 + 2
        mux_n_to_1 #(
            .N(2 ** (m - 1)),
            .m(m - 1)
        ) M8 (
            .inp (inp[(2**(m-1)-1):0]),
            .sel (sel[m-2:0]),
            .mout(temp[0])
        );
        mux_n_to_1 #(
            .N(N - (2 ** (m - 1))),
            .m(m - 1)
        ) M9 (
            .inp (inp[N-1:(2**(m-1))]),
            .sel (sel[m-2:0]),
            .mout(temp[1])
        );
        BB_mux_cell u_mux_cell_4 (
          .ina(temp[0]),
          .inb(temp[1]),
          .sel(sel[m-1]),
          .out(mout)
        );
      end
    end
  endgenerate
endmodule
