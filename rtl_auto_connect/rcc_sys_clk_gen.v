/* verilator lint_off PINCONNECTEMPTY */
module rcc_sys_clk_gen (
    input sys_rst_n,
    input sys_sync_rst_n,
    input pwr_por_hsi_sync_rst_n,
    input pwr_por_hse_sync_rst_n,
    input testmode,
    // input clocks
    input hsi_origin_clk,
    input csi_origin_clk,
    input lse_clk,
    input hsi48_clk,
    input hse_origin_clk,
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
    input [1:0] pllsrc,

    //divide factor
    input [5:0] divm1,
    input [5:0] divm2,
    input [5:0] divm3,
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
    input [1:0] hsidiv,

    //osc state
    input hsi_rdy,
    input csi_rdy,
    input hse_rdy,
    input hsecss_fail,
    //hsi csi request
    input hsi_ker_clk_req,
    input csi_ker_clk_req,

    //control signals of sys_clk
    input c2_sleep,
    input c2_deepsleep,
    input c1_sleep,
    input c1_deepsleep,

    //arcg enable signal
    input d1_clk_arcg_en,
    input d2_clk_arcg_en,
    input cpu1_clk_arcg_en,
    input cpu2_clk_arcg_en,
    input sys_clk_arcg_en,
    input rcc_obl_clk_arcg_en,
    //peripheral alloc signal
    input c1_per_alloc_ahb1,
    input c1_per_alloc_ahb2,
    input c1_per_alloc_ahb3,
    input c1_per_alloc_apb1,
    input c1_per_alloc_apb2,
    input c1_per_alloc_apb3,

    input c2_per_alloc_ahb1,
    input c2_per_alloc_ahb2,
    input c2_per_alloc_ahb3,
    input c2_per_alloc_apb1,
    input c2_per_alloc_apb2,
    input c2_per_alloc_apb3,
    // indicate busy state 
    input axibridge_d1_busy,
    input ahb3bridge_d1_busy,
    input apb3bridge_d1_busy,
    input ahb1bridge_d2_busy,
    input ahb2bridge_d2_busy,
    input apb1bridge_d2_busy,
    input apb2bridge_d2_busy,
    input flash_busy,
    //system stop signal
    input rcc_d1_stop,
    input rcc_d2_stop,
    input rcc_sys_stop,

    //output clocks
    //osc clock
    output csi_ker_clk,
    output hsi_ker_clk,
    output hse_clk,
    //cpu clocks
    output rcc_c2_clk,
    output rcc_fclk_c2,
    output rcc_c2_systick_clk,
    output rcc_c1_clk,
    output rcc_fclk_c1,
    output rcc_c1_systick_clk,
    //bus clock
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
    //system clock
    output rcc_obl_clk,
    output sys_clk,
    output pre_sys_clk,                //sys_clk but not gated
    //div en 
    output c1_to_axi_div_en,
    output d1_h2b_div_en,
    output d2_h2b1_div_en,
    output d2_h2b2_div_en,
    output d3_h2b_div_en,

    output mco1,
    output mco2,
    output hse_rtc_clk,
    output per_clk,
    output pll1_src_clk,
    output pll2_src_clk,
    output pll3_src_clk
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);
  // sys_clk_generate
  wire       pll_src_clk;
  wire       sys_clk_en;

  wire       hsi_clk;
  wire       csi_clk;
  wire       rcc_d1_bus_clk;
  wire       rcc_d2_bus_clk;
  wire       rcc_d3_bus_clk;
  wire       rcc_apb1bridge_d2_pre_clk;
  wire       rcc_apb2bridge_d2_pre_clk;
  wire       rcc_apb3bridge_d1_pre_clk;
  wire       rcc_apb4bridge_d3_pre_clk;

  wire       rcc_obl_clk_en;
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
  wire       mco1_pre_clk;
  wire       mco2_pre_clk;
  wire       hsi_pre_clk;
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

  //====================================================================
  // clock gate control 
  //====================================================================
  assign sys_clk_en               = ~rcc_sys_stop && sys_clk_arcg_en;
  assign rcc_c1_clk_en            = ~c1_deepsleep && ~c1_sleep && cpu1_clk_arcg_en;
  assign rcc_c2_clk_en            = ~c2_deepsleep && ~c2_sleep && cpu2_clk_arcg_en;
  assign c2_sleep_mode            = c2_sleep && ~c2_deepsleep;
  assign c1_sleep_mode            = c1_sleep && ~c1_deepsleep;

  assign rcc_d1_bus_clk_en        = rcc_d1_stop && d1_clk_arcg_en;
  assign rcc_d2_bus_clk_en        = rcc_d2_stop && d2_clk_arcg_en;
  assign rcc_d3_bus_clk_en        = sys_clk_en;

  assign rcc_axibridge_d1_clk_en  = ~c1_sleep || axibridge_d1_busy;

  assign rcc_ahb1bridge_d2_clk_en = ~c2_sleep || (c2_sleep_mode && c2_per_alloc_ahb1) || (c1_sleep_mode && c1_per_alloc_ahb1) || rcc_apb1bridge_d2_clk_en || rcc_apb2bridge_d2_clk_en || ahb1bridge_d2_busy;  // apb1 apb2 are connected to ahb1
  assign rcc_ahb2bridge_d2_clk_en = ~c2_sleep || (c2_sleep_mode && c2_per_alloc_ahb2) || (c1_sleep_mode && c1_per_alloc_ahb2) || ahb2bridge_d2_busy;
  assign rcc_ahb3bridge_d1_clk_en = ~c1_sleep || (c1_sleep_mode && c1_per_alloc_ahb3) || (c2_sleep_mode && c2_per_alloc_ahb3) || rcc_apb3bridge_d1_clk_en || ahb3bridge_d1_busy || flash_busy;
  assign rcc_ahb4bridge_d3_clk_en = ~rcc_sys_stop;
  assign rcc_apb1bridge_d2_clk_en = ~c2_sleep || (c2_sleep_mode && c2_per_alloc_apb1) || (c1_sleep_mode && c1_per_alloc_apb1) || apb1bridge_d2_busy;
  assign rcc_apb2bridge_d2_clk_en = ~c2_sleep || (c2_sleep_mode && c2_per_alloc_apb2) || (c1_sleep_mode && c1_per_alloc_apb2) || apb2bridge_d2_busy;
  assign rcc_apb3bridge_d1_clk_en = ~c1_sleep || (c1_sleep_mode && c1_per_alloc_apb3) || (c2_sleep_mode && c2_per_alloc_apb3) || apb3bridge_d1_busy;
  assign rcc_apb4bridge_d3_clk_en = ~rcc_sys_stop;

  //option byte load module clock
  BB_clk_gating rcc_obl_clk_gate (
      .raw_clk(pre_sys_clk),
      .active (rcc_obl_clk_arcg_en),
      .bypass (testmode),
      .gen_clk(rcc_obl_clk)
  );
  //====================================================================
  // HSI CSI clock control 
  //====================================================================

  assign hsi_clk_en     = hsi_rdy && (~rcc_sys_stop);
  assign hsi_ker_clk_en = hsi_rdy && (~rcc_sys_stop || hsi_ker_clk_req);
  assign csi_clk_en     = csi_rdy && (~rcc_sys_stop);
  assign csi_ker_clk_en = csi_rdy && (~rcc_sys_stop || csi_ker_clk_req);
  assign hse_clk_en     = hse_rdy && ~hsecss_fail;

  //====================================================================
  // MCO clock out
  //====================================================================
  assign mco1_clk_src   = {hsi48_clk, pll1_q_clk, hse_clk, lse_clk, hsi_clk};

  mux_n_to_1 #(
      .N(5),
      .m(3)
  ) mco1_clk_switch_cell (
      .inp   (mco1_clk_src),
      .select(mco1sel),

      .out(mco1_pre_clk)
  );



  rcc_clk_div_d #(
      .RATIO_WID(4)
  ) mco1_clk_divider (
      .rst_n (sys_sync_rst_n),
      .i_clk (mco1_pre_clk),
      .ratio (mco1pre),
      .o_clk (mco1),
      .div_en()
  );

  assign mco2_clk_src = {lsi_clk, csi_clk, pll1_p_clk, hse_clk, pll2_p_clk, sys_clk};
  mux_n_to_1 #(
      .N(6),
      .m(3)
  ) mco2_clk_switch_cell (
      .inp   (mco2_clk_src),
      .select(mco2sel),

      .out(mco2_pre_clk)
  );

  rcc_clk_div_d #(
      .RATIO_WID(4)
  ) mco2_clk_divider (
      .rst_n (sys_sync_rst_n),
      .i_clk (mco2_pre_clk),
      .ratio (mco2pre),
      .o_clk (mco2),
      .div_en()
  );


  //====================================================================
  // hse_rtc_clk generate
  //====================================================================

  rcc_rtc_clk_div_d #(
      .RATIO_WID(6)
  ) hse_rtc_clk_div (
      .rst_n (pwr_por_hse_sync_rst_n),
      .i_clk (hse_clk),
      .ratio (rtcpre),
      .o_clk (hse_rtc_clk),
      .div_en()
  );

  //====================================================================
  // hsi_div
  //====================================================================

  rcc_hsi_div hsi_clk_div (
      .i_clk  (hsi_origin_clk),
      .rst_n  (pwr_por_hsi_sync_rst_n),
      .div_sel(hsidiv),
      .o_clk  (hsi_pre_clk)
  );



  //====================================================================
  //hsi clk gate
  //====================================================================

  BB_clk_gating hsi_clk_gate (
      .raw_clk(hsi_pre_clk),
      .active (hsi_clk_en),
      .bypass (testmode),
      .gen_clk(hsi_clk)
  );

  BB_clk_gating hsi_ker_clk_gate (
      .raw_clk(hsi_pre_clk),
      .active (hsi_ker_clk_en),
      .bypass (testmode),
      .gen_clk(hsi_ker_clk)
  );

  //====================================================================
  //hse clk gate
  //====================================================================
  BB_clk_gating hse_clk_gate (
      .raw_clk(hse_origin_clk),
      .active (hse_clk_en),
      .bypass (testmode),
      .gen_clk(hse_clk)
  );

  //====================================================================
  //csi clock gate
  //====================================================================

  BB_clk_gating csi_clk_gate (
      .raw_clk(csi_origin_clk),
      .active (csi_clk_en),
      .bypass (testmode),
      .gen_clk(csi_clk)
  );

  BB_clk_gating csi_ker_clk_gate (
      .raw_clk(csi_origin_clk),
      .active (csi_ker_clk_en),
      .bypass (testmode),
      .gen_clk(csi_ker_clk)
  );

  //====================================================================
  //per_clk selection
  //====================================================================

  assign per_clk_src = {hse_clk, csi_ker_clk, hsi_ker_clk};

  glitch_free_clk_switch #(
      .CLK_NUM(3)
  ) per_clk_switch (
      .i_clk   (per_clk_src),
      .clk_fail({hsecss_fail, 2'b0}),
      .rst_n   (sys_rst_n),
      .sel     (clkpersel),
      .o_clk   (per_clk)
  );



  //====================================================================
  //pll source clock generate
  //====================================================================

  assign pll_clk_src = {hse_clk, csi_clk, hsi_clk};

  glitch_free_clk_switch #(
      .CLK_NUM(3)
  ) pll_src_clk_switch (
      .i_clk   (pll_clk_src),
      .clk_fail({hsecss_fail, 2'b0}),
      .rst_n   (sys_rst_n),
      .sel     (pllsrc),
      .o_clk   (pll_src_clk)
  );

  rcc_clk_div_d #(
      .RATIO_WID(6)
  ) pll1_src_clk_div (
      .i_clk (pll_src_clk),
      .rst_n (sys_sync_rst_n),
      .ratio (divm1),
      .o_clk (pll1_src_clk),
      .div_en()
  );

  rcc_clk_div_d #(
      .RATIO_WID(6)
  ) pll2_src_clk_div (
      .i_clk (pll_src_clk),
      .rst_n (sys_sync_rst_n),
      .ratio (divm2),
      .o_clk (pll2_src_clk),
      .div_en()
  );

  rcc_clk_div_d #(
      .RATIO_WID(6)
  ) pll3_src_clk_div (
      .i_clk (pll_src_clk),
      .rst_n (sys_sync_rst_n),
      .ratio (divm3),
      .o_clk (pll3_src_clk),
      .div_en()
  );


  //====================================================================
  // system clock generate
  //====================================================================

  assign sys_clk_src = {pll1_p_clk, hse_clk, csi_clk, hsi_clk};

  glitch_free_clk_switch #(
      .CLK_NUM(4)
  ) sys_clk_switch (
      .i_clk   (sys_clk_src),
      .clk_fail({1'b0, hsecss_fail, 2'b0}),
      .rst_n   (sys_rst_n),
      .sel     (sw),
      .o_clk   (pre_sys_clk)
  );
  BB_clk_gating sys_clk_gate (
      .raw_clk(pre_sys_clk),
      .active (sys_clk_en),
      .bypass (testmode),
      .gen_clk(sys_clk)
  );

  rcc_512_div u_sys_d1cpre_clk_divider (
      .i_clk  (sys_clk),
      .rst_n  (sys_sync_rst_n),
      .div_sel(d1cpre),
      .div_en (),
      .o_clk  (sys_d1cpre_clk)
  );

  //====================================================================
  // d1 domian clock generate
  //====================================================================
  BB_clk_gating rcc_c1_clk_gate (
      .raw_clk(sys_d1cpre_clk),
      .active (rcc_c1_clk_en),
      .bypass (testmode),
      .gen_clk(rcc_c1_clk)
  );
  assign rcc_fclk_c1 = rcc_c1_clk;

  BB_clk_div_s #(
      .DIV_RATIO(8)
  ) c1_systick_clk_div (
      .i_clk (rcc_c1_clk),
      .rst_n (sys_sync_rst_n),
      .o_clk (rcc_c1_systick_clk),
      .div_en()
  );

  rcc_512_div sys_hpre_clk_divider (
      .i_clk  (sys_d1cpre_clk),
      .rst_n  (sys_sync_rst_n),
      .div_sel(hpre),
      .div_en (c1_to_axi_div_en),
      .o_clk  (sys_hpre_clk)
  );

  BB_clk_gating rcc_d1_bus_clk_gate (
      .raw_clk(sys_hpre_clk),
      .active (rcc_d1_bus_clk_en),
      .bypass (testmode),
      .gen_clk(rcc_d1_bus_clk)
  );

  BB_clk_gating rcc_axibridge_d1_clk_gate (
      .raw_clk(rcc_d1_bus_clk),
      .active (rcc_axibridge_d1_clk_en),
      .bypass (testmode),
      .gen_clk(rcc_axibridge_d1_clk)
  );

  BB_clk_gating rcc_ahb3bridge_d1_clk_gate (
      .raw_clk(rcc_d1_bus_clk),
      .active (rcc_ahb3bridge_d1_clk_en),
      .bypass (testmode),
      .gen_clk(rcc_ahb3bridge_d1_clk)
  );

  rcc_16_div rcc_d2_bus_clk_divider (
      .i_clk  (rcc_d1_bus_clk),
      .rst_n  (sys_sync_rst_n),
      .div_sel(d1ppre),
      .div_en (d1_h2b_div_en),
      .o_clk  (rcc_apb3bridge_d1_pre_clk)
  );

  BB_clk_gating rcc_apb3bridge_d1_clk_gate (
      .raw_clk(rcc_apb3bridge_d1_pre_clk),
      .active (rcc_apb3bridge_d1_clk_en),
      .bypass (testmode),
      .gen_clk(rcc_apb3bridge_d1_clk)
  );

  //====================================================================
  // d2 domian clock generate
  //====================================================================

  BB_clk_gating rcc_c2_clk_gate (
      .raw_clk(sys_hpre_clk),
      .active (rcc_c2_clk_en),
      .bypass (testmode),
      .gen_clk(rcc_c2_clk)
  );

  assign rcc_fclk_c2 = rcc_c2_clk;

  BB_clk_div_s #(
      .DIV_RATIO(8)
  ) c2_systick_clk_div (
      .i_clk (rcc_c2_clk),
      .rst_n (sys_sync_rst_n),
      .o_clk (rcc_c2_systick_clk),
      .div_en()
  );

  BB_clk_gating rcc_d2_bus_clk_gate (
      .raw_clk(sys_hpre_clk),
      .active (rcc_d2_bus_clk_en),
      .bypass (testmode),
      .gen_clk(rcc_d2_bus_clk)
  );

  BB_clk_gating rcc_ahb1bridge_d2_clk_gate (
      .raw_clk(rcc_d2_bus_clk),
      .active (rcc_ahb1bridge_d2_clk_en),
      .bypass (testmode),
      .gen_clk(rcc_ahb1bridge_d2_clk)
  );

  BB_clk_gating rcc_ahb2bridge_d2_clk_gate (
      .raw_clk(rcc_d2_bus_clk),
      .active (rcc_ahb2bridge_d2_clk_en),
      .bypass (testmode),
      .gen_clk(rcc_ahb2bridge_d2_clk)
  );

  rcc_pclk_timer_div rcc_apb1clk_timer_div (
      .i_clk      (rcc_d2_bus_clk),
      .rst_n      (sys_sync_rst_n),
      .div_sel    (d2ppre1),
      .div_en     (d2_h2b1_div_en),
      .timpre     (timpre),
      .tim_ker_clk(rcc_timx_ker_clk),
      .pclk       (rcc_apb1bridge_d2_pre_clk)
  );

  BB_clk_gating rcc_apb1bridge_d2_clk_gate (
      .raw_clk(rcc_apb1bridge_d2_pre_clk),
      .active (rcc_apb1bridge_d2_clk_en),
      .bypass (testmode),
      .gen_clk(rcc_apb1bridge_d2_clk)
  );

  rcc_pclk_timer_div rcc_apb2clk_timer_div (
      .i_clk      (rcc_d2_bus_clk),
      .rst_n      (sys_sync_rst_n),
      .div_sel    (d2ppre2),
      .div_en     (d2_h2b2_div_en),
      .timpre     (timpre),
      .tim_ker_clk(rcc_timy_ker_clk),
      .pclk       (rcc_apb2bridge_d2_pre_clk)
  );

  BB_clk_gating rcc_apb2bridge_d2_clk_gate (
      .raw_clk(rcc_apb2bridge_d2_pre_clk),
      .active (rcc_apb2bridge_d2_clk_en),
      .bypass (testmode),
      .gen_clk(rcc_apb2bridge_d2_clk)
  );

  assign rcc_hrtimer_prescalar_clk = hrtimsel ? rcc_timy_ker_clk : rcc_c1_clk;

  //====================================================================
  // d3 domian clock generate
  //====================================================================

  BB_clk_gating rcc_d3_bus_clk_gate (
      .raw_clk(sys_hpre_clk),
      .active (rcc_d3_bus_clk_en),
      .bypass (testmode),
      .gen_clk(rcc_d3_bus_clk)
  );

  BB_clk_gating rcc_ahb4bridge_d3_clk_gate (
      .raw_clk(rcc_d3_bus_clk),
      .active (rcc_ahb4bridge_d3_clk_en),
      .bypass (testmode),
      .gen_clk(rcc_ahb4bridge_d3_clk)
  );

  rcc_16_div rcc_d3_bus_clk_divider (
      .i_clk  (rcc_d3_bus_clk),
      .rst_n  (sys_sync_rst_n),
      .div_sel(d3ppre),
      .div_en (d3_h2b_div_en),
      .o_clk  (rcc_apb4bridge_d3_pre_clk)
  );

  BB_clk_gating rcc_apb4bridge_d3_clk_gate (
      .raw_clk(rcc_apb4bridge_d3_pre_clk),
      .active (rcc_apb4bridge_d3_clk_en),
      .bypass (testmode),
      .gen_clk(rcc_apb4bridge_d3_clk)
  );

endmodule
