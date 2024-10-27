/* verilator lint_off UNUSEDPARAM */
/* verilator lint_off UNUSEDSIGNAL */
/* verilator lint_off UNDRIVEN */
module BB_clk_div_d #(
    parameter RATIO_WID = 8
) (
    input  rst_n,
    input  i_clk,
    input [$clog2(RATIO_WID)-1:0] ratio,
    output o_clk,
    input  div_en
);
// NULL MODULE

endmodule  //moduleName
