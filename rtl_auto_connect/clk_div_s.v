module clk_div_s #(
    parameter DIV_RATIO = 3  // DIV_RATIO MUST BE GREATER THAN 1
) (
    input  rst_n,
    input  i_clk,
    output o_clk,
    output div_en
);
  //=========================================================================================
  //FIXED PARAMETERS
  //=========================================================================================
  localparam CNT_WID    = (DIV_RATIO % 2 == 0) ? $clog2(DIV_RATIO / 2) : $clog2(DIV_RATIO);
  localparam RATIO_WID  = CNT_WID;
  localparam HALF_RATIO = DIV_RATIO / 2;

  //=========================================================================================
  //INTERNAL SIGNALS  DECLEARATION
  //=========================================================================================
  wire [CNT_WID-1:0] cur_cnt;
  wire [CNT_WID-1:0] nxt_cnt;
  wire               cur_o_clk;
  wire               nxt_o_clk;
  wire               o_clk_wren;

  generate
    if (DIV_RATIO % 2 == 0) begin : even_divider
      //================================================================
      // counter for the division
      //================================================================

      assign nxt_cnt = (cur_cnt >= HALF_RATIO - 1) ? 'b0 : cur_cnt + 'b1;
      BB_dffr #(
          .DW     (RATIO_WID),
          .RST_VAL('b0)
      ) u_cnt_dffr (
          .clk  (i_clk),
          .rst_n(rst_n),
          .din  (nxt_cnt),
          .dout (cur_cnt)
      );

      //================================================================
      // clock generate
      //================================================================
      assign nxt_o_clk  = ~o_clk;
      assign o_clk_wren = (cur_cnt == HALF_RATIO - 1);
      assign o_clk      = cur_o_clk;

      BB_dfflr #(
          .DW     (1),
          .RST_VAL(0)
      ) u_o_clk_dfflr (
          .clk  (i_clk),
          .rst_n(rst_n),
          .en   (o_clk_wren),
          .din  (nxt_o_clk),
          .dout (cur_o_clk)
      );
      //================================================================
      // div enable
      //================================================================
      assign div_en = (cur_cnt == HALF_RATIO - 1) && (cur_o_clk == 1'b1);
    end else begin : odd_divider
      //================================================================
      // counter for the division
      //================================================================

      assign nxt_cnt = (cur_cnt >= RATIO_WID - 1) ? 'b0 : cur_cnt + 'b1;
      BB_dffr #(
          .DW     (RATIO_WID),
          .RST_VAL('b0)
      ) u_cnt_dffr (
          .clk  (i_clk),
          .rst_n(rst_n),
          .din  (nxt_cnt),
          .dout (cur_cnt)
      );

      //================================================================
      // clock generate
      //================================================================
      assign nxt_o_clk  = ~o_clk;
      assign o_clk_wren = (cur_cnt == HALF_RATIO - 1) || (cur_cnt == RATIO_WID - 1);
      assign o_clk      = cur_o_clk;

      BB_dfflr #(
          .DW     (1),
          .RST_VAL(0)
      ) u_o_clk_dfflr (
          .clk  (i_clk),
          .rst_n(rst_n),
          .en   (o_clk_wren),
          .din  (nxt_o_clk),
          .dout (cur_o_clk)
      );

      //================================================================
      // div en
      //================================================================
      assign div_en = (cur_cnt == RATIO_WID - 1);
    end
  endgenerate

endmodule  //moduleName
