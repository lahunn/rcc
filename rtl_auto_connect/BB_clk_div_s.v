module BB_clk_div_s #(
    parameter DIV_RATIO = 3
) (
    input  rst_n,
    input  i_clk,
    output o_clk,
    output div_en
);
  //=========================================================================================
  //FIXED PARAMETERS
  //=========================================================================================
  localparam CNT_CEIL = (DIV_RATIO % 2 == 0) ? (DIV_RATIO / 2 - 1) : (DIV_RATIO - 1);
  localparam CNT_CEIL_PLUS = CNT_CEIL + 1;
  localparam CNT_WID = (CNT_CEIL_PLUS > 1) ? $clog2(CNT_CEIL_PLUS) : 1;

  //=========================================================================================
  //INTERNAL SIGNALS  DECLEARATION
  //=========================================================================================
  reg  [CNT_WID-1:0] cnt;
  reg                tff0;
  reg                tff1;
  wire               tff0_en;
  wire               tff1_en;
  wire               eql_to_cell;

  generate
    if (DIV_RATIO == 1) begin : no_div_blk
      assign o_clk  = i_clk;
      assign div_en = 1'b1;
    end else begin : div_blk
      //========================================================================================
      //COUNTER
      //========================================================================================
      always @(posedge i_clk, negedge rst_n) begin
        if (~rst_n) cnt <= 'b0;
        else if (eql_to_cell) cnt <= 'b0;
        else cnt <= cnt + 'b1;
      end

      assign eql_to_cell = (cnt == CNT_CEIL);
      //========================================================================================
      //T FLIP-FLOP 0, REUSABLE
      //========================================================================================
      always @(posedge i_clk or negedge rst_n) begin
        if (~rst_n) tff0 <= 'b0;
        else if (tff0_en) tff0 <= !tff0;
      end

      if (DIV_RATIO % 2 == 0) begin : even_blk  //even ratio
        assign tff0_en = eql_to_cell;
        assign o_clk   = tff0;
        assign div_en  = (cnt == 'b0) && tff0;
      end else begin : odd_blk
        //========================================================================================
        //T FLIP-FLOP 1
        //========================================================================================
        always @(posedge i_clk or negedge rst_n) begin
          if (~rst_n) tff1 <= 'b0;
          else if (tff1_en) tff1 <= !tff1;
        end

        assign tff0_en = (cnt == 'b0);
        assign tff1_en = (cnt == ((DIV_RATIO + 1) / 2));
        assign o_clk   = tff0 ^ tff1;
        assign div_en  = (cnt == 'b1);
      end
    end
  endgenerate
endmodule  //moduleName
