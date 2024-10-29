module BB_clk_div_d #(
  parameter RATIO_WID = 8
) (
    input                  rst_n,
    input                  i_clk,
    input  [RATIO_WID-1:0] ratio,
    output                 o_clk,
    output                 div_en
);

  //=========================================================================================
  //FIXED PARAMETERS
  //=========================================================================================
  localparam CNT_WID = RATIO_WID;

  //=========================================================================================
  //INTERNAL SIGNALS  DECLEARATION
  //=========================================================================================
  reg  [CNT_WID-1:0] cnt;
  reg                tff0;
  reg                tff1;
  wire [CNT_WID-1:0] half_ratio;
  wire [CNT_WID-1:0] minuend;
  wire [CNT_WID-1:0] cnt_cell;
  wire               tff0_en;
  wire               tff1_en;
  wire               eql_to_cell;
  wire               eql_to_mid;
  wire               eql_to_one;
  wire               eql_to_zero;
  wire               cnt_en;

  //half of the ratio
  assign half_ratio = {1'b0, ratio[RATIO_WID-1:1]};

  //minuend of the counter cell
  assign minuend    = ratio[0] ? ratio : half_ratio;
  //========================================================================================
  //COUNTER
  //========================================================================================
  always @(posedge i_clk or negedge rst_n) begin
    if (~rst_n) cnt <= 'b0;
    else if (cnt_en)
      if (eql_to_cell) cnt <= 'b0;
      else cnt <= cnt + 'b1;
    else cnt <= 'b0;
  end

  assign cnt_en      = (ratio != 'b1);

  assign cnt_cell    = minuend - 'b1;

  //counter comparator
  assign eql_to_cell = (cnt == cnt_cell);
  assign eql_to_mid  = (cnt == (half_ratio + 'b1));
  assign eql_to_one  = (cnt == 'b1);
  assign eql_to_zero = (cnt == 'b0);

  //========================================================================================
  //T FLIP-FLOP 0, REUSABLE
  //========================================================================================
  always @(posedge i_clk or negedge rst_n) begin
    if (~rst_n) tff0 <= 'b0;
    else if (tff0_en) tff0 <= !tff0;
  end

  assign tff0_en = ratio[0] ? eql_to_zero : eql_to_cell;

  //========================================================================================
  //T FLIP-FLOP 1
  //========================================================================================
  always @(posedge i_clk or negedge rst_n) begin
    if (~rst_n) tff1 <= 'b0;
    else if (tff1_en) tff1 <= !tff1;
  end

  assign tff1_en = ratio[0] && eql_to_mid;

  //========================================================================================
  //clock output and enable
  //========================================================================================
  assign o_clk   = cnt_en ? (ratio[0] ? (tff0 ^ tff1) : tff0) : i_clk;

  assign div_en  = cnt_en ? (ratio[0] ? eql_to_one : (eql_to_zero && tff0)) : 1'b1;

endmodule
