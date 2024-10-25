module rcc_sys_clk_gen (
    input wire sys_rst_n,

    // clock source of sys_clk
    input wire hsi_clk,
    input wire csi_clk,
    input wire hse_clk,
    input wire pll1_p_clk,

    //clock select
    input wire [1:0] sys_clk_sw,

    //divide factor
    input wire [3:0] d1cpre,
    input wire [2:0] d1ppre,
    input wire [3:0] hpre,
    input wire [2:0] d2ppre1,
    input wire [2:0] d2ppre2,
    input wire [2:0] d3ppre,

    input wire timpre,
    input wire hrtimsel,

    //control signals of sys_clk
    input wire c2_sleep,
    input wire c2_deepsleep,
    input wire c1_sleep,
    input wire c1_deepsleep,

    //output clocks
    output wire rcc_c2_clk,
    output wire rcc_fclk_c2,
    output wire rcc_c2_systick_clk,
    output wire rcc_c1_clk,
    output wire rcc_fclk_c1,
    output wire rcc_c1_systick_clk,
    output wire rcc_axibridge_d1_clk,
    output wire rcc_ahb3bridge_d1_clk,
    output wire rcc_apb3bridge_d1_clk,
    output wire rcc_ahb1bridge_d2_clk,
    output wire rcc_ahb2bridge_d2_clk,
    output wire rcc_apb1bridge_d2_clk,
    output wire rcc_apb2bridge_d2_clk,
    output wire rcc_ahb4bridge_d3_clk,
    output wire rcc_apb4bridge_d3_clk,
    output wire rcc_timx_ker_clk,
    output wire rcc_timy_ker_clk,
    output wire rcc_hrtimer_prescalar_clk,
    output wire sys_d1cpre_clk,
    output wire sys_hpre_clk,

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
    output sys_clk,
    output sys_clk_pre          //sys_clk but not gated
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);
  // sys_clk_generate
  wire sys_clk_en;

  wire rcc_d1_bus_clk;
  wire rcc_d2_bus_clk;
  wire rcc_d3_bus_clk;
  wire rcc_apb1bridge_d2_clk_pre;
  wire rcc_apb2bridge_d2_clk_pre;
  wire rcc_apb3bridge_d1_clk_pre;
  wire rcc_apb4bridge_d3_clk_pre;

  wire rcc_d1_bus_clk_en;
  wire rcc_d2_bus_clk_en;
  wire rcc_d3_bus_clk_en;
  wire rcc_c1_clk_en;
  wire rcc_c2_clk_en;
  wire rcc_axibridge_d1_clk_en;
  wire rcc_ahb3bridge_d1_clk_en;
  wire rcc_apb3bridge_d1_clk_en;
  wire rcc_ahb1bridge_d2_clk_en;
  wire rcc_ahb2bridge_d2_clk_en;
  wire rcc_apb1bridge_d2_clk_en;
  wire rcc_apb2bridge_d2_clk_en;
  wire rcc_ahb4bridge_d3_clk_en;
  wire rcc_apb4bridge_d3_clk_en;
  wire c2_sleep_mode;
  wire c1_sleep_mode;

  /*AUTOWIRE*/
  /*AUTO DECLARE*/


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
  assign rcc_obl_clk    = sys_clk;

  //////////////////////////////////
  // HSI CSI clock control /////////
  //////////////////////////////////

  assign hsi_clk_en     = hsi_rdy & (~rcc_sys_stop);
  assign hsi_ker_clk_en = hsi_rdy & (~rcc_sys_stop | hsi_ker_clk_req);
  assign csi_clk_en     = csi_rdy & (~rcc_sys_stop);
  assign csi_ker_clk_en = csi_rdy & (~rcc_sys_stop | csi_ker_clk_req);
  assign hse_clk_en     = ~hsecss_fail;

  //////////////////////////////////
  // MCO clock out
  //////////////////////////////////

  mux_N_to_1 #(
      .N(5),
      .m(3)
  ) mco1_clk_switch_cell (
      .inp   ({hsi48_clk, pll1_q_clk, hse_clk, lse_clk, hsi_clk}),
      .select(mco1sel),

      .out(mco1_clk_pre)
  );



  BB_clk_div_d #(
      .RATIO_WID(8)
  ) mco1_clk_divider (
      .rst_n(sys_rst_n),
      .i_clk(mco1_clk_pre),
      .ratio(mco1pre),

      .o_clk (mco1),
      .div_en(1'b1)
  );

  mux_N_to_1 #(
      .N(6),
      .m(3)
  ) mco2_clk_switch_cell (
      .inp   ({lsi_clk, csi_clk, pll1_p_clk, hse_clk, pll2_p_clk, sys_clk}),
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
  glitch_free_clk_switch #(
      .CLK_NUM(3)
  ) per_clk_switch (
      .clk_in ({hse_clk, csi_ker_clk, hsi_ker_clk}),
      .rst_n  (sys_rst_n),
      .sel    (clkpersel),
      .clk_out(per_clk)
  );



  ////////////////////////////
  //pll source clock generate
  ///////////////////////////

  glitch_free_clk_switch #(
      .CLK_NUM(3)
  ) pll_src_clk_switch (
      .clk_in({hse_clk, csi_clk, hsi_clk}),
      .rst_n (sys_rst_n),
      .sel   (pll_src_sel),

      .clk_out(pll_src_clk)
  );

  div_odd_even #(
      .MAX_DIV_FAC(63)
  ) pll1_src_clk_div (
      .clk_in (pll_src_clk),
      .rst_n  (sys_rst_n),
      .div_sel(divm1),

      .clk_out(pll1_src_clk)
  );

  div_odd_even #(
      .MAX_DIV_FAC(63)
  ) pll2_src_clk_div (
      .clk_in (pll_src_clk),
      .rst_n  (sys_rst_n),
      .div_sel(divm2),

      .clk_out(pll2_src_clk)
  );

  div_odd_even #(
      .MAX_DIV_FAC(63)
  ) pll3_src_clk_div (
      .clk_in (pll_src_clk),
      .rst_n  (sys_rst_n),
      .div_sel(divm3),

      .clk_out(pll3_src_clk)
  );


  ///////////////////////////////////////
  // system clock generate///////////////
  ///////////////////////////////////////

  glitch_free_clk_switch #(
      .CLK_NUM(4)
  ) sys_clk_switch (
      .clk_in ({pll1_p_clk, hse_clk, csi_clk, hsi_clk}),
      .rst_n  (sys_rst_n),
      .sel    (sys_clk_sw),
      .clk_out(sys_clk_pre)
  );
  BB_clk_gating sys_clk_gate (
      .raw_clk(sys_clk_pre),
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
