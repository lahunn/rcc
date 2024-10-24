module rcc_vcore_clk_ctrl (
    output wire sys_clk,
    output wire sys_clk_pre,
    // signals connected to PAD 
    output      mco1,
    output      mco2,
    input       pad_rcc_eth_mii_tx_clk,
    input       pad_rcc_eth_mii_rx_clk,
    input       USB_PHY1,
    // signals connected to PWR 
    input       d3_deepsleep,
    output      c2_per_alloc_d1,
    output      c1_per_alloc_d2,
    // signals connected to CPU 
    input       c2_sleep,
    input       c2_deepsleep,
    input       c1_sleep,
    input       c1_deepsleep,
    output      rcc_c2_clk,
    output      rcc_fclk_c2,
    output      rcc_c2_systick_clk,
    output      rcc_c1_clk,
    output      rcc_fclk_c1,
    output      rcc_c1_systick_clk,
    // timer clocks
    output wire rcc_timx_ker_clk,
    output wire rcc_timy_ker_clk,
    output wire rcc_hrtimer_prescalar_clk,
    output wire sys_d1cpre_clk,
    output wire sys_hpre_clk,
    //rtc clocks
    output wire hse_rtc_clk,

    // stop mode signals
    input wire rcc_d1_stop,
    input wire rcc_d2_stop,
    input wire rcc_sys_stop,
    // signals connected to HSE
    input      hsecss_fail,
    input      hse_clk_pre,
    // lse lsi clock
    input      lse_clk,
    input      lsi_clk,
    // signals connected to HSI48 
    input      hsi48_clk,
    // signals connected to CSI
    input      csi_clk_pre,
    // signals connected to HSI
    input      hsi_origin_clk,

    // reset signals 
    input wire sys_rst_n,

    //bus clock signals
    output wire       rcc_axibridge_d1_clk,
    output wire       rcc_ahb3bridge_d1_clk,
    output wire       rcc_apb3bridge_d1_clk,
    output wire       rcc_ahb1bridge_d2_clk,
    output wire       rcc_ahb2bridge_d2_clk,
    output wire       rcc_apb1bridge_d2_clk,
    output wire       rcc_apb2bridge_d2_clk,
    output wire       rcc_ahb4bridge_d3_clk,
    output wire       rcc_apb4bridge_d3_clk,
    //pll , oscilator and pad clocks
    input  wire [1:0] pll_src_sel,
    input  wire       pll1_q_clk,
    input  wire       pll1_p_clk,
    input  wire       pll2_p_clk,
    input  wire       pll2_q_clk,
    input  wire       pll2_r_clk,
    input  wire       pll3_p_clk,
    input  wire       pll3_q_clk,
    input  wire       pll3_r_clk,
    input  wire       I2S_clk_IN,
    output            pll1_src_clk,
    output            pll2_src_clk,
    output            pll3_src_clk,
    //signals from eth and to eth
    input             eth_rcc_fes,
    input             eth_rcc_epis_2,
    output            rcc_eth_mii_tx_clk,
    output            rcc_eth_mii_rx_clk,
    output            rcc_eth_rmii_ref_clk,
    // register signals
    input       [2:0] mco1sel,
    input       [2:0] mco2sel,
    input       [3:0] mco1pre,
    input       [3:0] mco2pre,
    input       [5:0] rtcpre,
    input       [1:0] hsidiv,
    input       [1:0] sys_clk_sw,
    input       [3:0] d1cpre,
    input       [2:0] d1ppre,
    input       [3:0] hpre,
    input       [2:0] d2ppre1,
    input       [2:0] d2ppre2,
    input       [2:0] d3ppre,
    input             timpre,
    input             hrtimsel,
    input       [1:0] clkpersel,
    input       [5:0] divm1,
    input       [5:0] divm2,
    input       [5:0] divm3,

    input csi_rdy,
    input hsi_rdy

    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);

  /*AUTOWIRE*/


  //option byte load module clock
  assign rcc_obl_clk = sys_clk;
  
  //////////////////////////////////
  // HSI CSI clock control /////////
  //////////////////////////////////

  assign hsi_clk_en     = hsi_rdy & (~rcc_sys_stop);
  assign hsi_ker_clk_en = hsi_rdy & (~rcc_sys_stop | hsi_ker_clk_req);
  assign csi_clk_en     = csi_rdy & (~rcc_sys_stop);
  assign csi_ker_clk_en = csi_rdy & (~rcc_sys_stop | csi_ker_clk_req);
  assign hse_clk_en     = ~hsecss_fail;

  //option byte load module set


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

  div_odd_even #(
      .MAX_DIV_FAC(15)
  ) mco1_clk_divider (
      .clk_in (mco1_clk_pre),
      .rst_n  (sys_rst_n),
      .div_sel(mco1pre),

      .clk_out(mco1)
  );

  mux_N_to_1 #(
      .N(6),
      .m(3)
  ) mco2_clk_switch_cell (
      .inp   ({lsi_clk, csi_clk, pll1_p_clk, hse_clk, pll2_p_clk, sys_clk}),
      .select(mco2sel),

      .out(mco2_clk_pre)
  );

  div_odd_even #(
      .MAX_DIV_FAC(15)
  ) mco2_clk_divider (
      .clk_in (mco2_clk_pre),
      .rst_n  (sys_rst_n),
      .div_sel(mco2pre),

      .clk_out(mco2)
  );


  //////////////////////////////////
  // hse_rtc_clk generate
  //////////////////////////////////

  div_odd_even #(
      .MAX_DIV_FAC(63)
  ) hse_rtc_clk_div (
      .clk_in (hse_clk_pre),
      .rst_n  (sys_rst_n),
      .div_sel(rtcpre),

      .clk_out(hse_rtc_clk)
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

  rcc_clk_gate_cell hsi_clk_gate (
      .clk_in(hsi_clk_pre),
      .clk_en(hsi_clk_en),

      .clk_out(hsi_clk)
  );

  rcc_clk_gate_cell hsi_ker_clk_gate (
      .clk_in(hsi_clk_pre),
      .clk_en(hsi_ker_clk_en),

      .clk_out(hsi_ker_clk)
  );

  //////////////////////////////
  //hse clk gate
  /////////////////////////////
  rcc_clk_gate_cell hse_clk_gate (
      .clk_in (hse_clk_pre),
      .clk_en (hse_clk_en),
      .clk_out(hse_clk)
  );

  ////////////////////////////
  //csi clock gate
  ///////////////////////////

  rcc_clk_gate_cell csi_clk_gate (
      .clk_in(csi_clk_pre),
      .clk_en(csi_clk_en),

      .clk_out(csi_clk)
  );

  rcc_clk_gate_cell csi_ker_clk_gate (
      .clk_in(csi_clk_pre),
      .clk_en(csi_ker_clk_en),

      .clk_out(csi_ker_clk)
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
  rcc_sys_clk_gen u_rcc_sys_clk_gen (  /*AUTOINST*/

  );

  rcc_eth_ker_clk_ctrl u_rcc_eth_ker_clk_ctrl (  /*AUTOINST*/
  );

  rcc_per_clk_control u_rcc_per_clk_control (  /*AUTOINST*/
  );


endmodule
