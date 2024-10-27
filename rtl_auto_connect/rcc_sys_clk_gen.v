module rcc_sys_clk_gen (
    input sys_rst_n,

    // clock source of sys_clk
    input lse_clk,
    input hsi48_clk,
    input hse_clk_pre,
    input lsi_clk,
    input pll1_p_clk,
    input pll1_q_clk,
    input pll2_p_clk,

    //clock select
    input [1:0] sw,
    input       hrtimsel,
    input [1:0] clkpersel,
    input [2:0] mco1sel,
    input [2:0] mco2sel,

    //divide factor
    input [3:0] mco1pre,
    input [3:0] mco2pre,
    input [5:0] rtcpre,
    input [3:0] d1cpre,
    input [2:0] d1ppre,
    input [3:0] hpre,
    input [2:0] d2ppre1,
    input [2:0] d2ppre2,
    input [2:0] d3ppre,
    input       timpre,


    //control signals of sys_clk
    input c2_sleep,
    input c2_deepsleep,
    input c1_sleep,
    input c1_deepsleep,

    //output clocks
    output rcc_c2_clk,
    output rcc_fclk_c2,
    output rcc_c2_systick_clk,
    output rcc_c1_clk,
    output rcc_fclk_c1,
    output rcc_c1_systick_clk,
    output rcc_axibridge_d1_clk,
    output rcc_ahb3bridge_d1_clk,
    output rcc_apb3bridge_d1_clk,
    output rcc_ahb1bridge_d2_clk,
    output rcc_ahb2bridge_d2_clk,
    output rcc_apb1bridge_d2_clk,
    output rcc_apb2bridge_d2_clk,
    output rcc_ahb4bridge_d3_clk,
    output rcc_apb4bridge_d3_clk,
    output rcc_timx_ker_clk,
    output rcc_timy_ker_clk,
    output rcc_hrtimer_prescalar_clk,
    output sys_d1cpre_clk,
    output sys_hpre_clk,

    //arcg enable signal
    input d1_clk_arcg_en,
    input d2_clk_arcg_en,
    input cpu1_clk_arcg_en,
    input cpu2_clk_arcg_en,
    input sys_clk_arcg_en,
    //peripheral alloc signal
    input c1_per_alloc_ahb1,
    input c1_per_alloc_ahb2,
    input c1_per_alloc_ahb3,
    input c1_per_alloc_apb1,
    input c1_per_alloc_apb2,
    input c1_per_alloc_apb3,

    input  c2_per_alloc_ahb1,
    input  c2_per_alloc_ahb2,
    input  c2_per_alloc_ahb3,
    input  c2_per_alloc_apb1,
    input  c2_per_alloc_apb2,
    input  c2_per_alloc_apb3,
    // indicate busy state 
    input  axibridge_d1_busy,
    input  ahb3bridge_d1_busy,
    input  apb3bridge_d1_busy,
    input  ahb1bridge_d2_busy,
    input  ahb2bridge_d2_busy,
    input  apb1bridge_d2_busy,
    input  apb2bridge_d2_busy,
    input  flash_busy,
    //system stop signal
    input  rcc_d1_stop,
    input  rcc_d2_stop,
    input  rcc_sys_stop,
    //system clock
    output rcc_obl_clk,
    output sys_clk,
    output pre_sys_clk,         //sys_clk but not gated


    output       mco1,
    output       mco2,
    output       hse_rtc_clk,
    input        hsi_origin_clk,
    input  [1:0] hsidiv,
    input        test_mode,
    input        csi_clk_pre,
    output       per_clk,
    input  [1:0] pllsrc,
    input  [5:0] divm1,
    input  [5:0] divm2,
    input  [5:0] divm3,
    output       pll1_src_clk,
    output       pll2_src_clk,
    output       pll3_src_clk,
    input        hsi_rdy,
    input        hsi_ker_clk_req,
    input        csi_rdy,
    input        csi_ker_clk_req,
    input        hsecss_fail
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);
  // sys_clk_generate
  wire       pll_src_clk;
  wire       sys_clk_en;

  wire       rcc_d1_bus_clk;
  wire       rcc_d2_bus_clk;
  wire       rcc_d3_bus_clk;
  wire       rcc_apb1bridge_d2_clk_pre;
  wire       rcc_apb2bridge_d2_clk_pre;
  wire       rcc_apb3bridge_d1_clk_pre;
  wire       rcc_apb4bridge_d3_clk_pre;

  wire       rcc_d1_bus_clk_en;
  wire       rcc_d2_bus_clk_en;
  wire       rcc_d3_bus_clk_en;
  wire       rcc_c1_clk_en;
  wire       rcc_c2_clk_en;
  wire       rcc_axibridge_d1_clk_en;
  wire       rcc_ahb3bridge_d1_clk_en;
  wire       rcc_apb3bridge_d1_clk_en;
  wire       rcc_ahb1bridge_d2_clk_en;
  wire       rcc_ahb2bridge_d2_clk_en;
  wire       rcc_apb1bridge_d2_clk_en;
  wire       rcc_apb2bridge_d2_clk_en;
  wire       rcc_ahb4bridge_d3_clk_en;
  wire       rcc_apb4bridge_d3_clk_en;
  wire       c2_sleep_mode;
  wire       c1_sleep_mode;

  /*AUTOWIRE*/
  //Start of automatic wire
  //Define assign wires here
  //Define instance wires here
  wire       mco1_clk_pre;
  wire       mco2_clk_pre;
  wire       hsi_clk_pre;
  wire       hsi_clk;
  wire       hsi_ker_clk;
  wire       hse_clk;
  wire       csi_clk;
  wire       csi_ker_clk;
  //End of automatic wire
  wire [4:0] mco1_clk_src;
  wire [5:0] mco2_clk_src;
  wire [2:0] per_clk_src;
  wire [2:0] pll_clk_src;
  wire [3:0] sys_clk_src;
  wire       hsi_clk_en;
  wire       hsi_ker_clk_en;
  wire       csi_clk_en;
  wire       csi_ker_clk_en;
  wire       hse_clk_en;

  ///////////////////////////////////////
  // clock gate control /////////////////
  ///////////////////////////////////////
  assign sys_clk_en               = ~rcc_sys_stop & sys_clk_arcg_en;
  assign rcc_c1_clk_en            = ~c1_deepsleep & ~c1_sleep & cpu1_clk_arcg_en;
  assign rcc_c2_clk_en            = ~c2_deepsleep & ~c2_sleep & cpu2_clk_arcg_en;
  assign c2_sleep_mode            = c2_sleep & ~c2_deepsleep;
  assign c1_sleep_mode            = c1_sleep & ~c1_deepsleep;

  assign rcc_d1_bus_clk_en        = rcc_d1_stop & d1_clk_arcg_en;
  assign rcc_d2_bus_clk_en        = rcc_d2_stop & d2_clk_arcg_en;
  assign rcc_d3_bus_clk_en        = sys_clk_en;

  assign rcc_axibridge_d1_clk_en  = ~c1_sleep | axibridge_d1_busy;

  assign rcc_ahb1bridge_d2_clk_en = ~c2_sleep | (c2_sleep_mode & c2_per_alloc_ahb1) | (c1_sleep_mode & c1_per_alloc_ahb1) | rcc_apb1bridge_d2_clk_en | rcc_apb2bridge_d2_clk_en | ahb1bridge_d2_busy;  // apb1 apb2 are connected to ahb1
  assign rcc_ahb2bridge_d2_clk_en = ~c2_sleep | (c2_sleep_mode & c2_per_alloc_ahb2) | (c1_sleep_mode & c1_per_alloc_ahb2) | ahb2bridge_d2_busy;
  assign rcc_ahb3bridge_d1_clk_en = ~c1_sleep | (c1_sleep_mode & c1_per_alloc_ahb3) | (c2_sleep_mode & c2_per_alloc_ahb3) | rcc_apb3bridge_d1_clk_en | ahb3bridge_d1_busy | flash_busy;
  assign rcc_ahb4bridge_d3_clk_en = ~rcc_sys_stop;
  assign rcc_apb1bridge_d2_clk_en = ~c2_sleep | (c2_sleep_mode & c2_per_alloc_apb1) | (c1_sleep_mode & c1_per_alloc_apb1) | apb1bridge_d2_busy;
  assign rcc_apb2bridge_d2_clk_en = ~c2_sleep | (c2_sleep_mode & c2_per_alloc_apb2) | (c1_sleep_mode & c1_per_alloc_apb2) | apb2bridge_d2_busy;
  assign rcc_apb3bridge_d1_clk_en = ~c1_sleep | (c1_sleep_mode & c1_per_alloc_apb3) | (c2_sleep_mode & c2_per_alloc_apb3) | apb3bridge_d1_busy;
  assign rcc_apb4bridge_d3_clk_en = ~rcc_sys_stop;

  //option byte load module clock
  assign rcc_obl_clk              = sys_clk;

  //////////////////////////////////
  // HSI CSI clock control /////////
  //////////////////////////////////

  assign hsi_clk_en               = hsi_rdy & (~rcc_sys_stop);
  assign hsi_ker_clk_en           = hsi_rdy & (~rcc_sys_stop | hsi_ker_clk_req);
  assign csi_clk_en               = csi_rdy & (~rcc_sys_stop);
  assign csi_ker_clk_en           = csi_rdy & (~rcc_sys_stop | csi_ker_clk_req);
  assign hse_clk_en               = ~hsecss_fail;

  //////////////////////////////////
  // MCO clock out
  //////////////////////////////////
  assign mco1_clk_src             = {hsi48_clk, pll1_q_clk, hse_clk, lse_clk, hsi_clk};

  mux_N_to_1 #(
      .N(5),
      .m(3)
  ) mco1_clk_switch_cell (
      .inp   (mco1_clk_src),
      .select(mco1sel),

      .out(mco1_clk_pre)
  );



  BB_clk_div_d #(
      .RATIO_WID(15)
  ) mco1_clk_divider (
      .rst_n(sys_rst_n),
      .i_clk(mco1_clk_pre),
      .ratio(mco1pre),

      .o_clk (mco1),
      .div_en(1'b1)
  );

  assign mco2_clk_src = {lsi_clk, csi_clk, pll1_p_clk, hse_clk, pll2_p_clk, sys_clk};
  mux_N_to_1 #(
      .N(6),
      .m(3)
  ) mco2_clk_switch_cell (
      .inp   (mco2_clk_src),
      .select(mco2sel),

      .out(mco2_clk_pre)
  );

  BB_clk_div_d #(
      .RATIO_WID(15)
  ) mco2_clk_divider (
      .rst_n(sys_rst_n),
      .i_clk(mco2_clk_pre),
      .ratio(mco2pre),

      .o_clk (mco2),
      .div_en(1'b1)
  );


  //////////////////////////////////
  // hse_rtc_clk generate
  //////////////////////////////////


  BB_clk_div_d #(
      .RATIO_WID(63)
  ) hse_rtc_clk_div (
      .rst_n (sys_rst_n),
      .i_clk (hse_clk_pre),
      .ratio (rtcpre),
      .o_clk (hse_rtc_clk),
      .div_en(1'b1)
  );

  //////////////////////////////////
  // hsi_div
  //////////////////////////////////

  div_x_stage #(
      .STAGE_NUM      (3),
      .IS_STAGE_REMOVE(0),
      .STAGE_REMOVED  (0)
  ) hsi_clk_div (
      .clk_in (hsi_origin_clk),
      .rst_n  (sys_rst_n),
      .div_sel(hsidiv),

      .clk_out(hsi_clk_pre)
  );

  ////////////////////////////////
  //hsi clk gate
  ///////////////////////////////

  BB_clk_gating hsi_clk_gate (
      .raw_clk(hsi_clk_pre),
      .active (hsi_clk_en),
      .bypass (test_mode),
      .gen_clk(hsi_clk)
  );

  BB_clk_gating hsi_ker_clk_gate (
      .raw_clk(hsi_clk_pre),
      .active (hsi_ker_clk_en),
      .bypass (test_mode),
      .gen_clk(hsi_ker_clk)
  );

  //////////////////////////////
  //hse clk gate
  /////////////////////////////
  BB_clk_gating hse_clk_gate (
      .raw_clk(hse_clk_pre),
      .active (hse_clk_en),
      .bypass (test_mode),
      .gen_clk(hse_clk)
  );

  ////////////////////////////
  //csi clock gate
  ///////////////////////////

  BB_clk_gating csi_clk_gate (
      .raw_clk(csi_clk_pre),
      .active (csi_clk_en),
      .bypass (test_mode),
      .gen_clk(csi_clk)
  );

  BB_clk_gating csi_ker_clk_gate (
      .raw_clk(csi_clk_pre),
      .active (csi_ker_clk_en),
      .bypass (test_mode),
      .gen_clk(csi_ker_clk)
  );

  ////////////////////////////
  //per_clk selection
  ///////////////////////////

  assign per_clk_src = {hse_clk, csi_ker_clk, hsi_ker_clk};

  glitch_free_clk_switch #(
      .CLK_NUM(3)
  ) per_clk_switch (
      .clk_in (per_clk_src),
      .rst_n  (sys_rst_n),
      .sel    (clkpersel),
      .clk_out(per_clk)
  );



  ////////////////////////////
  //pll source clock generate
  ///////////////////////////

  assign pll_clk_src = {hse_clk, csi_clk, hsi_clk};

  glitch_free_clk_switch #(
      .CLK_NUM(3)
  ) pll_src_clk_switch (
      .clk_in(pll_clk_src),
      .rst_n (sys_rst_n),
      .sel   (pllsrc),

      .clk_out(pll_src_clk)
  );

  BB_clk_div_d #(
      .RATIO_WID(63)
  ) pll1_src_clk_div (
      .i_clk (pll_src_clk),
      .rst_n (sys_rst_n),
      .ratio (divm1),
      .o_clk (pll1_src_clk),
      .div_en(1'b1)
  );

  BB_clk_div_d #(
      .RATIO_WID(63)
  ) pll2_src_clk_div (
      .i_clk (pll_src_clk),
      .rst_n (sys_rst_n),
      .ratio (divm2),
      .o_clk (pll2_src_clk),
      .div_en(1'b1)
  );

  BB_clk_div_d #(
      .RATIO_WID(63)
  ) pll3_src_clk_div (
      .i_clk (pll_src_clk),
      .rst_n (sys_rst_n),
      .ratio (divm3),
      .o_clk (pll3_src_clk),
      .div_en(1'b1)
  );


  ///////////////////////////////////////
  // system clock generate///////////////
  ///////////////////////////////////////

  assign sys_clk_src = {pll1_p_clk, hse_clk, csi_clk, hsi_clk};

  glitch_free_clk_switch #(
      .CLK_NUM(4)
  ) sys_clk_switch (
      .clk_in (sys_clk_src),
      .rst_n  (sys_rst_n),
      .sel    (sw),
      .clk_out(pre_sys_clk)
  );
  BB_clk_gating sys_clk_gate (
      .raw_clk(pre_sys_clk),
      .active (sys_clk_en),
      .bypass (test_mode),
      .gen_clk(sys_clk)
  );

  div_x_stage #(
      .STAGE_NUM(9),  // 2 ^ 9 = 512
      .IS_STAGE_REMOVE(1),
      .STAGE_REMOVED(5)  // remove 32 divided clock
  ) sys_d1cpre_clk_divider (
      .clk_in (sys_clk),
      .rst_n  (sys_rst_n),
      .div_sel(d1cpre),
      .clk_out(sys_d1cpre_clk)
  );

  ///////////////////////////////////////
  // d1 domian clock generate///////////
  ///////////////////////////////////////
  BB_clk_gating rcc_c1_clk_gate (
      .raw_clk(sys_d1cpre_clk),
      .active (rcc_c1_clk_en),
      .bypass (test_mode),
      .gen_clk(rcc_c1_clk)
  );
  assign rcc_fclk_c1 = rcc_c1_clk;

  div_2_to_xth #(
      .SQUARE(3)
  ) c1_systick_clk_div (
      .clk_in (rcc_c1_clk),
      .rst_n  (sys_rst_n),
      .clk_out(rcc_c1_systick_clk)
  );

  div_x_stage #(
      .STAGE_NUM(9),  // 2 ^ 9 = 512
      .IS_STAGE_REMOVE(1),
      .STAGE_REMOVED(5)  // remove 32 divided clock
  ) sys_hpre_clk_divider (
      .clk_in (sys_d1cpre_clk),
      .rst_n  (sys_rst_n),
      .div_sel(hpre),
      .clk_out(sys_hpre_clk)
  );

  BB_clk_gating rcc_d1_bus_clk_gate (
      .raw_clk(sys_hpre_clk),
      .active (rcc_d1_bus_clk_en),
      .bypass (test_mode),
      .gen_clk(rcc_d1_bus_clk)
  );

  BB_clk_gating rcc_axibridge_d1_clk_gate (
      .raw_clk(rcc_d1_bus_clk),
      .active (rcc_axibridge_d1_clk_en),
      .bypass (test_mode),
      .gen_clk(rcc_axibridge_d1_clk)
  );

  BB_clk_gating rcc_ahb3bridge_d1_clk_gate (
      .raw_clk(rcc_d1_bus_clk),
      .active (rcc_ahb3bridge_d1_clk_en),
      .bypass (test_mode),
      .gen_clk(rcc_ahb3bridge_d1_clk)
  );

  div_x_stage #(
      .STAGE_NUM(4),  // 2 ^ 4 = 16
      .IS_STAGE_REMOVE(0),  // don't remove
      .STAGE_REMOVED(0)
  ) rcc_d2_bus_clk_divider (
      .clk_in (rcc_d1_bus_clk),
      .rst_n  (sys_rst_n),
      .div_sel(d1ppre),
      .clk_out(rcc_apb3bridge_d1_clk_pre)
  );

  BB_clk_gating rcc_apb3bridge_d1_clk_gate (
      .raw_clk(rcc_apb3bridge_d1_clk_pre),
      .active (rcc_apb3bridge_d1_clk_en),
      .bypass (test_mode),
      .gen_clk(rcc_apb3bridge_d1_clk)
  );

  ///////////////////////////////////////
  // d2 domian clock generate///////////
  ///////////////////////////////////////

  BB_clk_gating rcc_c2_clk_gate (
      .raw_clk(sys_hpre_clk),
      .active (rcc_c2_clk_en),
      .bypass (test_mode),
      .gen_clk(rcc_c2_clk)
  );

  assign rcc_fclk_c2 = rcc_c2_clk;

  div_2_to_xth #(
      .SQUARE(3)
  ) c2_systick_clk_div (
      .clk_in (rcc_c2_clk),
      .rst_n  (sys_rst_n),
      .clk_out(rcc_c2_systick_clk)
  );

  BB_clk_gating rcc_d2_bus_clk_gate (
      .raw_clk(sys_hpre_clk),
      .active (rcc_d2_bus_clk_en),
      .bypass (test_mode),
      .gen_clk(rcc_d2_bus_clk)
  );

  BB_clk_gating rcc_ahb1bridge_d2_clk_gate (
      .raw_clk(rcc_d2_bus_clk),
      .active (rcc_ahb1bridge_d2_clk_en),
      .bypass (test_mode),
      .gen_clk(rcc_ahb1bridge_d2_clk)
  );

  BB_clk_gating rcc_ahb2bridge_d2_clk_gate (
      .raw_clk(rcc_d2_bus_clk),
      .active (rcc_ahb2bridge_d2_clk_en),
      .bypass (test_mode),
      .gen_clk(rcc_ahb2bridge_d2_clk)
  );

  rcc_pclk_timer_div rcc_apb1clk_timer_div (
      .clk_in     (rcc_d2_bus_clk),
      .rst_n      (sys_rst_n),
      .div_sel    (d2ppre1),
      .timpre     (timpre),
      .tim_ker_clk(rcc_timx_ker_clk),
      .pclk       (rcc_apb1bridge_d2_clk_pre)
  );

  BB_clk_gating rcc_apb1bridge_d2_clk_gate (
      .raw_clk(rcc_apb1bridge_d2_clk_pre),
      .active (rcc_apb1bridge_d2_clk_en),
      .bypass (test_mode),
      .gen_clk(rcc_apb1bridge_d2_clk)
  );

  rcc_pclk_timer_div rcc_apb2clk_timer_div (
      .clk_in     (rcc_d2_bus_clk),
      .rst_n      (sys_rst_n),
      .div_sel    (d2ppre2),
      .timpre     (timpre),
      .tim_ker_clk(rcc_timy_ker_clk),
      .pclk       (rcc_apb2bridge_d2_clk_pre)
  );

  BB_clk_gating rcc_apb2bridge_d2_clk_gate (
      .raw_clk(rcc_apb2bridge_d2_clk_pre),
      .active (rcc_apb2bridge_d2_clk_en),
      .bypass (test_mode),
      .gen_clk(rcc_apb2bridge_d2_clk)
  );

  assign rcc_hrtimer_prescalar_clk = hrtimsel ? rcc_timy_ker_clk : rcc_c1_clk;

  ///////////////////////////////////////
  // d3 domian clock generate///////////
  ///////////////////////////////////////

  BB_clk_gating rcc_d3_bus_clk_gate (
      .raw_clk(sys_hpre_clk),
      .active (rcc_d3_bus_clk_en),
      .bypass (test_mode),
      .gen_clk(rcc_d3_bus_clk)
  );

  BB_clk_gating rcc_ahb4bridge_d3_clk_gate (
      .raw_clk(rcc_d3_bus_clk),
      .active (rcc_ahb4bridge_d3_clk_en),
      .bypass (test_mode),
      .gen_clk(rcc_ahb4bridge_d3_clk)
  );

  div_x_stage #(
      .STAGE_NUM(4),  // 2 ^ 4 = 16
      .IS_STAGE_REMOVE(0),  // don't remove
      .STAGE_REMOVED(0)
  ) rcc_d3_bus_clk_divider (
      .clk_in (rcc_d3_bus_clk),
      .rst_n  (sys_rst_n),
      .div_sel(d3ppre),
      .clk_out(rcc_apb4bridge_d3_clk_pre)
  );

  BB_clk_gating rcc_apb4bridge_d3_clk_gate (
      .raw_clk(rcc_apb4bridge_d3_clk_pre),
      .active (rcc_apb4bridge_d3_clk_en),
      .bypass (test_mode),
      .gen_clk(rcc_apb4bridge_d3_clk)
  );

endmodule
