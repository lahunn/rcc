//消除双边毛刺
module glitch_filter #(
    parameter FILTER_WIDTH = 160000  //glitch filter width , unit is clk cycle , for button , we assume that filter width should be larger than 8ms
) (
    input  clk,
    input  rst_n,
    input  din,
    output dout
);
  localparam CNT_WD = $clog2(FILTER_WIDTH);
  wire              d1_din;
  wire              both_edge;
  wire [CNT_WD-1:0] cur_count;
  wire [CNT_WD-1:0] nxt_count;
  wire [CNT_WD-1:0] count_en;
  wire              cur_dout;
  wire              nxt_dout;
  wire              dout_en;



  BB_dffr #(
      .DW     (CNT_WD),
      .RST_VAL(0)
  ) u_d1_din_dfflr (
      .clk  (clk),
      .rst_n(rst_n),
      .din  (din),
      .dout (d1_din)
  );

  //edge detect
  assign both_edge = d1_din ^ din;  // up_edge | down_edge

  //counter for glitch filter
  assign nxt_count = (both_edge) ? 0 : cur_count + 1;
  assign count_en  = (both_edge) || (cur_count != FILTER_WIDTH);
  BB_dfflr #(
      .DW     (CNT_WD),
      .RST_VAL(0)
  ) u_count_dfflr (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (count_en),
      .din  (nxt_count),
      .dout (cur_count)
  );

  // generate dout

  assign nxt_dout = d1_din;
  assign dout_en  = (cur_count == FILTER_WIDTH);
  assign dout     = cur_dout;

  BB_dfflr #(
      .DW     (1),
      .RST_VAL(0)
  ) u_dout_dfflr (
      .clk  (clk),
      .rst_n(rst_n),
      .en   (dout_en),
      .din  (nxt_dout),
      .dout (cur_dout)
  );

endmodule
