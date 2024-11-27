// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : MUX cell mainly for generated clock and reset
// ****************************************************************

module BB_mux_cell (
    //================================================================
    // PIN
    //================================================================
    input  ina,
    input  inb,
    input  sel,
    output out
);
  assign out = (sel) ? inb : ina;

endmodule
