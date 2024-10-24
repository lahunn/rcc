module rcc_vsw_top (
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
    // lse signals
    input  lsecss_fail,
    input  lse_clk,
    input  lserdy,          //hign to low level, default 0
    // lsi signals
    input  lsi_clk,         //high to high level, default 0
    // rtc CLK SEL
    input  hse_rtc_clk,     //low to high level, default 0
    //rtc CLK
    output rcc_rtc_ker_clk,

    //reset signals
    input pwr_vsw_rst,  //low to high level, default 0

    // register signals
    // rcc_vsw_reg Inputs
    input rcc_bdcr_byte2_wren,  //low to high level, default 0
    input rcc_bdcr_byte1_wren,  //low to high level, default 0
    input rcc_bdcr_byte0_wren,  //low to high level, default 0

    input       nxt_rcc_bdcr_bdrst,     //low to high level, default 0
    input       nxt_rcc_bdcr_rtcen,     //low to high level, default 0
    input [1:0] nxt_rcc_bdcr_rtcsel,    //low to high level, default 0
    input       nxt_rcc_bdcr_lsecsson,  //low to high level, default 0
    input [1:0] nxt_rcc_bdcr_lsedrv,    //low to high level, default 0
    input       nxt_rcc_bdcr_lsebyp,    //low to high level, default 0
    input       nxt_rcc_bdcr_lseon,     //low to high level, default 0

    // rcc_vsw_reg 
    output       bdrst,
    output       rtcen,
    output [1:0] rtcsel,
    output       lsecssd,
    output       lsecsson,
    output [1:0] lsedrv,
    output       lsebyp,
    output       lseon,

    output       cur_rcc_bdcr_bdrst,     //hign to low level, default 0
    output       cur_rcc_bdcr_rtcen,     //hign to low level, default 0
    output [1:0] cur_rcc_bdcr_rtcsel,    //hign to low level, default 0
    output       cur_rcc_bdcr_lsecssd,   //hign to low level, default 0
    output       cur_rcc_bdcr_lsecsson,  //hign to low level, default 0
    output [1:0] cur_rcc_bdcr_lsedrv,    //hign to low level, default 0
    output       cur_rcc_bdcr_lsebyp,    //hign to low level, default 0
    output       cur_rcc_bdcr_lserdy,    //hign to low level, default 0
    output       cur_rcc_bdcr_lseon      //hign to low level, default 0
);

 /*AUTOWIRE*/
 /*AUTOREG*/
  assign bdrst_n       = ~bdrst;
  assign rcc_vsw_rst_n = bdrst_n & ~pwr_vsw_rst;

  // rcc vsw registers
  rcc_vsw_reg u_rcc_vsw_reg (
      .rst_n                (bdrst_n),
      .lsecss_fail          (lsecss_fail),
      .lserdy               (lserdy),
      .rcc_bdcr_byte2_wren  (rcc_bdcr_byte2_wren),
      .rcc_bdcr_byte1_wren  (rcc_bdcr_byte1_wren),
      .rcc_bdcr_byte0_wren  (rcc_bdcr_byte0_wren),
      .nxt_rcc_bdcr_bdrst   (nxt_rcc_bdcr_bdrst),
      .nxt_rcc_bdcr_rtcen   (nxt_rcc_bdcr_rtcen),
      .nxt_rcc_bdcr_rtcsel  (nxt_rcc_bdcr_rtcsel),
      .nxt_rcc_bdcr_lsecsson(nxt_rcc_bdcr_lsecsson),
      .nxt_rcc_bdcr_lsedrv  (nxt_rcc_bdcr_lsedrv),
      .nxt_rcc_bdcr_lsebyp  (nxt_rcc_bdcr_lsebyp),
      .nxt_rcc_bdcr_lseon   (nxt_rcc_bdcr_lseon),

      .bdrst                (bdrst),
      .rtcen                (rtcen),
      .rtcsel               (rtcsel),
      .lsecssd              (lsecssd),
      .lsecsson             (lsecsson),
      .lsedrv               (lsedrv),
      .lsebyp               (lsebyp),
      .lseon                (lseon),
      .cur_rcc_bdcr_lserdy  (cur_rcc_bdcr_lserdy),
      .cur_rcc_bdcr_bdrst   (cur_rcc_bdcr_bdrst),
      .cur_rcc_bdcr_rtcen   (cur_rcc_bdcr_rtcen),
      .cur_rcc_bdcr_rtcsel  (cur_rcc_bdcr_rtcsel),
      .cur_rcc_bdcr_lsecssd (cur_rcc_bdcr_lsecssd),
      .cur_rcc_bdcr_lsecsson(cur_rcc_bdcr_lsecsson),
      .cur_rcc_bdcr_lsedrv  (cur_rcc_bdcr_lsedrv),
      .cur_rcc_bdcr_lsebyp  (cur_rcc_bdcr_lsebyp),
      .cur_rcc_bdcr_lseon   (cur_rcc_bdcr_lseon)
  );
  // rtc ker clock gate
  rcc_clk_gate_cell_sync rcc_rtc_ker_clk_gate (
      .clk_in (rcc_rtcsel_clk),
      .clk_en (rtcen),
      .clk_out(rcc_rtc_ker_clk)
  );

  // rtc ker clock select logic
  glitch_free_clk_switch #(
      .CLK_NUM(4)
  ) rcc_rtc_clk_switch (
      .clk_in ({hse_rtc_clk, lsi_clk, lse_clk_gated, 1'b0}),
      .sel    (rtcsel),
      .rst_n  (rcc_vsw_rst_n),
      .clk_out(rcc_rtcsel_clk)
  );

  // lse clock gate
  rcc_clk_gate_cell_sync rcc_lse_clk_gate (
      .clk_in (lse_clk),
      .clk_en (~lsecss_fail),
      .clk_out(lse_clk_gated)
  );


  // level shift
  // level shift should be added in integration
  // voltage isolation 
  // voltage isolation should be added in integration
endmodule
