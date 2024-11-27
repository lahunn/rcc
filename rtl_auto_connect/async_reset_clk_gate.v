// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : asynchronous reset control clock gating
//            the clock would be gated until DELAY cycles after reset release
//            and the reset signal would be synchronized with i_clk 
// ****************************************************************
module async_reset_clk_gate #(
    parameter DELAY = 8
) (
    input  src_rst_n,
    input  i_clk,
    input  arcg_on,
    output clk_en,
    output sync_rst_n
);

  localparam CNT_WD = $clog2(DELAY) + 1;

  wire              counter_wren;
  wire [CNT_WD-1:0] nxt_counter;
  wire [CNT_WD-1:0] cur_counter;

  wire              cur_clk_en;
  wire              nxt_clk_en;


  assign clk_en = arcg_on ? cur_clk_en : 1'b1;

  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_BB_reset_sync (
      .src_rst_n(src_rst_n),
      .clk      (i_clk),
      .gen_rst_n(sync_rst_n)
  );

  assign counter_wren = (cur_counter < DELAY);
  assign nxt_counter  = cur_counter + {{(CNT_WD - 1) {1'b0}}, 1'b1};

  BB_dfflr #(
      .DW     (CNT_WD),
      .RST_VAL(0)
  ) u_BB_counter_dfflr (
      .clk  (i_clk),
      .rst_n(sync_rst_n),
      .en   (counter_wren),
      .din  (nxt_counter),
      .dout (cur_counter)
  );


  assign nxt_clk_en = counter_wren;

  BB_dffr #(
      .DW     (1),
      .RST_VAL(0)
  ) u_BB_clk_en_dfflr (
      .clk  (i_clk),
      .rst_n(sync_rst_n),
      .din  (nxt_clk_en),
      .dout (cur_clk_en)
  );



endmodule  //moduleName
