module rcc_vsw_reg (
    input        rst_n,
    //--------------------------------------------------------------------------------
    //register signals
    //--------------------------------------------------------------------------------
    output       bdrst,
    output       rtcen,
    output [1:0] rtcsel,

    input        lsecss_fail,
    input        lse_rdy,
    output       lsecssd,
    output       lsecsson,
    output [1:0] lsedrv,
    output       lsebyp,
    output       lseon,
    //write enable signals
    input        rcc_bdcr_byte2_wren,
    input        rcc_bdcr_byte1_wren,
    input        rcc_bdcr_byte0_wren,

    // rcc_bdcr
    input        nxt_rcc_bdcr_bdrst,
    input        nxt_rcc_bdcr_rtcen,
    input  [1:0] nxt_rcc_bdcr_rtcsel,
    input        nxt_rcc_bdcr_lsecsson,
    input  [1:0] nxt_rcc_bdcr_lsedrv,
    input        nxt_rcc_bdcr_lsebyp,
    input        nxt_rcc_bdcr_lseon,
    output       cur_rcc_bdcr_lserdy,
    output       cur_rcc_bdcr_bdrst,
    output       cur_rcc_bdcr_rtcen,
    output [1:0] cur_rcc_bdcr_rtcsel,
    output       cur_rcc_bdcr_lsecssd,
    output       cur_rcc_bdcr_lsecsson,
    output [1:0] cur_rcc_bdcr_lsedrv,
    output       cur_rcc_bdcr_lsebyp,
    output       cur_rcc_bdcr_lseon
);
  /* verilator lint_off LATCH */
  /*AUTOWIRE*/
  wire rcc_bdcr_lsecssd_set;
  wire rcc_bdcr_lsecssd_clr;
  wire rtcsel_wren_n;
  wire lsecsson_wren_n;
  wire rcc_bdcr_rtcsel_wren;
  wire nxt_rcc_bdcr_rtcsel_wren;
  wire cur_rcc_bdcr_rtcsel_wren;
  wire rcc_bdcr_lsecsson_wren;
  wire cur_rcc_bdcr_lsecsson_wren;
  wire nxt_rcc_bdcr_lsecsson_wren;
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

  assign rtcsel                   = cur_rcc_bdcr_rtcsel;
  assign rcc_bdcr_rtcsel_wren     = cur_rcc_bdcr_rtcsel_wren || lsecss_fail;  //rtcsel can not be changed ， until lsecss_fail or vsw reset
  assign nxt_rcc_bdcr_rtcsel_wren = (nxt_rcc_bdcr_rtcsel == 2'b00) && (cur_rcc_bdcr_rtcsel == 2'b00);  //when rtc sel not changed, rtcsel_wren is 1

  BB_dffr #(
      .DW     (1),
      .RST_VAL('h1)
  ) U_rcc_bdcr_rtcsel_wren (
      .clk  (rcc_bdcr_byte1_wren),
      .rst_n(rst_n),
      .din  (nxt_rcc_bdcr_rtcsel_wren),
      .dout (cur_rcc_bdcr_rtcsel_wren)
  );

  BB_dfflr #(
      .DW     (2),
      .RST_VAL('h0)
  ) U_rcc_bdcr_rtcsel (
      .clk  (rcc_bdcr_byte1_wren && (~rtcsel_wren_n)),
      .en   (rcc_bdcr_rtcsel_wren),
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

  BB_latch u_BB_rcc_bdcr_lsecssd_latch (
      .D (~rcc_bdcr_lsecssd_clr),
      .GN(rcc_bdcr_lsecssd_set || rcc_bdcr_lsecssd_clr),
      .Q (cur_rcc_bdcr_lsecssd)
  );


  // --------------------------------------------------------------------------------
  // 5:5               lsecsson              W1S                  1'b0                 
  // --------------------------------------------------------------------------------
  assign lsecsson                   = cur_rcc_bdcr_lsecsson;
  assign nxt_rcc_bdcr_lsecsson_wren = (nxt_rcc_bdcr_lsecsson == 1'b0) && (cur_rcc_bdcr_lsecsson == 1'b0);  //when lsecsson not changed, lsecsson_wren is 1
  assign rcc_bdcr_lsecsson_wren     = cur_rcc_bdcr_lsecsson_wren || lsecss_fail;  //lsecsson can not be changed ， until lsecss_fail or vsw reset

  BB_dffr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_bdcr_lsecsson_wren (
      .clk  (rcc_bdcr_byte0_wren),
      .rst_n(rst_n),
      .din  (nxt_rcc_bdcr_lsecsson_wren),  //when lsecsson is set to 1, it can not be cleared until lsecss_fail
      .dout (cur_rcc_bdcr_lsecsson_wren)
  );

  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_bdcr_lsecsson (
      .clk  (rcc_bdcr_byte0_wren),
      .en   (rcc_bdcr_lsecsson_wren),
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
  // 1:1               lse_rdy              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign cur_rcc_bdcr_lserdy = lse_rdy;

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
