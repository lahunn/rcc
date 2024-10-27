module rcc_vsw_reg (
    input        rst_n,
    //--------------------------------------------------------------------------------
    //register signals
    //--------------------------------------------------------------------------------
    output       bdrst,
    output       rtcen,
    output [1:0] rtcsel,

    input        lsecss_fail,
    input        lserdy,
    output       lsecssd,
    output       lsecsson,
    output [1:0] lsedrv,
    output       lsebyp,
    output       lseon,

    input rcc_bdcr_byte2_wren,
    input rcc_bdcr_byte1_wren,
    input rcc_bdcr_byte0_wren,

    // rcc_bdcr
    input            nxt_rcc_bdcr_bdrst,
    input            nxt_rcc_bdcr_rtcen,
    input      [1:0] nxt_rcc_bdcr_rtcsel,
    input            nxt_rcc_bdcr_lsecsson,
    input      [1:0] nxt_rcc_bdcr_lsedrv,
    input            nxt_rcc_bdcr_lsebyp,
    input            nxt_rcc_bdcr_lseon,
    output           cur_rcc_bdcr_lserdy,
    output           cur_rcc_bdcr_bdrst,
    output           cur_rcc_bdcr_rtcen,
    output     [1:0] cur_rcc_bdcr_rtcsel,
    output reg       cur_rcc_bdcr_lsecssd,
    output           cur_rcc_bdcr_lsecsson,
    output     [1:0] cur_rcc_bdcr_lsedrv,
    output           cur_rcc_bdcr_lsebyp,
    output           cur_rcc_bdcr_lseon
);
  /* verilator lint_off LATCH */
  /*AUTOWIRE*/
  wire rcc_bdcr_lsecssd_set;
  wire rcc_bdcr_lsecssd_clr;
  wire rtcsel_wren_n;
  wire lsecsson_wren_n;
  //End of automatic wire
  /*AUTO DECLARE*/

  // --------------------------------------------------------------------------------
  // 16:16               bdrst              RW                  1'b0                 
  // --------------------------------------------------------------------------------
  assign bdrst = cur_rcc_bdcr_bdrst;

  BB_dffr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_bdcr_bdrst (
      .clk  (rcc_bdcr_byte2_wren),
      .rst_n(rst_n),
      .din  (nxt_rcc_bdcr_bdrst),
      .dout (cur_rcc_bdcr_bdrst)
  );





  // --------------------------------------------------------------------------------
  // 15:15               rtcen              RW                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rtcen = cur_rcc_bdcr_rtcen;

  BB_dffr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_bdcr_rtcen (
      .clk  (rcc_bdcr_byte1_wren),
      .rst_n(rst_n),
      .din  (nxt_rcc_bdcr_rtcen),
      .dout (cur_rcc_bdcr_rtcen)
  );





  // --------------------------------------------------------------------------------
  // 9:8               rtcsel              RWOnce                  2'b0                 
  // --------------------------------------------------------------------------------
  assign rtcsel = cur_rcc_bdcr_rtcsel;

  BB_dffr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_bdcr_rtcsel_wren (
      .clk  (rcc_bdcr_byte1_wren),
      .rst_n(rst_n & (~lsecss_fail)),
      .din  ((nxt_rcc_bdcr_rtcsel != 2'b00) | (cur_rcc_bdcr_rtcsel != 2'b00)),
      .dout (rtcsel_wren_n)
  );

  BB_dffr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_bdcr_rtcsel (
      .clk  (rcc_bdcr_byte1_wren & ~rtcsel_wren_n),
      .rst_n(rst_n),
      .din  (nxt_rcc_bdcr_rtcsel),
      .dout (cur_rcc_bdcr_rtcsel)
  );





  // --------------------------------------------------------------------------------
  // 6:6               lsecssd              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_bdcr_lsecssd_set = lsecss_fail;
  assign rcc_bdcr_lsecssd_clr = ~rst_n;
  assign lsecssd              = cur_rcc_bdcr_lsecssd;
  always @(*) begin
    if (rcc_bdcr_lsecssd_clr) begin
      cur_rcc_bdcr_lsecssd = 1'b0;
    end else if (rcc_bdcr_lsecssd_set) begin
      cur_rcc_bdcr_lsecssd = 1'b1;
    end
  end


  // --------------------------------------------------------------------------------
  // 5:5               lsecsson              W1S                  1'b0                 
  // --------------------------------------------------------------------------------
  assign lsecsson = cur_rcc_bdcr_lsecsson;

  BB_dffr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_bdcr_lsecsson_wren (
      .clk  (rcc_bdcr_byte0_wren),
      .rst_n(rst_n & (~lsecss_fail)),
      .din  ((nxt_rcc_bdcr_lsecsson != 1'b0) | (cur_rcc_bdcr_lsecsson != 1'b0)),  //when lsecsson is set to 1, it can not be cleared until lsecss_fail
      .dout (lsecsson_wren_n)
  );

  BB_dffr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_bdcr_lsecsson (
      .clk  (rcc_bdcr_byte0_wren & lsecsson_wren_n),
      .rst_n(rst_n),
      .din  (nxt_rcc_bdcr_lsecsson),
      .dout (cur_rcc_bdcr_lsecsson)
  );





  // --------------------------------------------------------------------------------
  // 4:3               lsedrv              RW                  2'b0                 
  // --------------------------------------------------------------------------------
  assign lsedrv = cur_rcc_bdcr_lsedrv;

  BB_dffr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_bdcr_lsedrv (
      .clk  (rcc_bdcr_byte0_wren),
      .rst_n(rst_n),
      .din  (nxt_rcc_bdcr_lsedrv),
      .dout (cur_rcc_bdcr_lsedrv)
  );





  // --------------------------------------------------------------------------------
  // 2:2               lsebyp              RW                  1'b0                 
  // --------------------------------------------------------------------------------
  assign lsebyp = cur_rcc_bdcr_lsebyp;

  BB_dffr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_bdcr_lsebyp (
      .clk  (rcc_bdcr_byte0_wren),
      .rst_n(rst_n),
      .din  (nxt_rcc_bdcr_lsebyp),
      .dout (cur_rcc_bdcr_lsebyp)
  );





  // --------------------------------------------------------------------------------
  // 1:1               lserdy              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign cur_rcc_bdcr_lserdy = lserdy;

  // --------------------------------------------------------------------------------
  // 0:0               lseon              RW                  1'b0                 
  // --------------------------------------------------------------------------------
  assign lseon               = cur_rcc_bdcr_lseon;

  BB_dffr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_bdcr_lseon (
      .clk  (rcc_bdcr_byte0_wren),
      .rst_n(rst_n),
      .din  (nxt_rcc_bdcr_lseon),
      .dout (cur_rcc_bdcr_lseon)
  );

endmodule
