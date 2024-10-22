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
    //peripheral allocate signal
    input ahb1_per_allocate,
    input ahb2_per_allocate,
    input ahb3_per_allocate,
    input apb1_per_allocate,
    input apb2_per_allocate,
    input apb3_per_allocate,
    // indicate busy state 
    input  axibridge_d1_busy,
    input  ahb3bridge_d1_busy,
    input  apb3bridge_d1_busy,
    input  ahb1bridge_d2_busy,
    input  ahb2bridge_d2_busy,
    input  apb1bridge_d2_busy,
    input  apb2bridge_d2_busy,
    input  ahb4bridge_d3_busy,
    input  apb4bridge_d3_busy,
    input  flash_busy,
    //system stop signal
    input  rcc_d1_stop,
    input  rcc_d2_stop,
    input  rcc_sys_stop,
    //system clock
    output sys_clk,
    output sys_clk_pre    //sys_clk but not gated
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
  ///////////////////////////////////////
  // clock gate control /////////////////
  ///////////////////////////////////////
  assign sys_clk_en               = ~rcc_sys_stop & sys_clk_arcg_en;
  assign rcc_c1_clk_en            = ~c1_deepsleep & ~c1_sleep & cpu1_clk_arcg_en;
  assign rcc_c2_clk_en            = ~c2_deepsleep & ~c2_sleep & cpu2_clk_arcg_en;

  assign rcc_d1_bus_clk_en        = rcc_d1_stop & d1_clk_arcg_en;
  assign rcc_d2_bus_clk_en        = rcc_d2_stop & d2_clk_arcg_en;
  assign rcc_d3_bus_clk_en        = sys_clk_en;

  assign rcc_axibridge_d1_clk_en  = ~c1_sleep | axibridge_d1_busy;

  assign rcc_ahb1bridge_d2_clk_en = ~c2_sleep | ((c2_sleep & ~c2_sleep) & ahb1_per_allocate | apb1_per_allocate | apb2_per_allocate) | ahb1bridge_d2_busy;
  assign rcc_ahb2bridge_d2_clk_en = ~c2_sleep | ((c2_sleep & ~c2_sleep) & ahb2_per_allocate | apb1_per_allocate | apb2_per_allocate) | ahb2bridge_d2_busy;
  assign rcc_ahb3bridge_d1_clk_en = ~c1_sleep | ((c1_sleep & ~c1_sleep) & ahb3_per_allocate | apb3_per_allocate) | ahb3bridge_d1_busy | flash_busy;
  assign rcc_ahb4bridge_d3_clk_en = ~rcc_sys_stop;
  assign rcc_apb1bridge_d2_clk_en = ~c2_sleep | ((c2_sleep & ~c2_sleep) & apb1_per_allocate) | apb1bridge_d2_busy;
  assign rcc_apb2bridge_d2_clk_en = ~c2_sleep | ((c2_sleep & ~c2_sleep) & apb2_per_allocate) | apb2bridge_d2_busy;
  assign rcc_apb3bridge_d1_clk_en = ~c1_sleep | ((c1_sleep & ~c1_sleep) & apb3_per_allocate) | apb3bridge_d1_busy;
  assign rcc_apb4bridge_d3_clk_en = ~rcc_sys_stop;



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
  rcc_clk_gate_cell sys_clk_gate (
      .clk_in (sys_clk_pre),
      .clk_out(sys_clk),
      .clk_en (sys_clk_en)
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
  rcc_clk_gate_cell rcc_c1_clk_gate (
      .clk_in (sys_d1cpre_clk),
      .clk_out(rcc_c1_clk),
      .clk_en (rcc_c1_clk_en)
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

  rcc_clk_gate_cell rcc_d1_bus_clk_gate (
      .clk_in (sys_hpre_clk),
      .clk_out(rcc_d1_bus_clk),
      .clk_en (rcc_d1_bus_clk_en)
  );

  rcc_clk_gate_cell rcc_axibridge_d1_clk_gate (
      .clk_in (rcc_d1_bus_clk),
      .clk_out(rcc_axibridge_d1_clk),
      .clk_en (rcc_axibridge_d1_clk_en)
  );

  rcc_clk_gate_cell rcc_ahb3bridge_d1_clk_gate (
      .clk_in (rcc_d1_bus_clk),
      .clk_out(rcc_ahb3bridge_d1_clk),
      .clk_en (rcc_ahb3bridge_d1_clk_en)
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

  rcc_clk_gate_cell rcc_apb3bridge_d1_clk_gate (
      .clk_in (rcc_apb3bridge_d1_clk_pre),
      .clk_out(rcc_apb3bridge_d1_clk),
      .clk_en (rcc_apb3bridge_d1_clk_en)
  );

  ///////////////////////////////////////
  // d2 domian clock generate///////////
  ///////////////////////////////////////

  rcc_clk_gate_cell rcc_c2_clk_gate (
      .clk_in (sys_hpre_clk),
      .clk_out(rcc_c2_clk),
      .clk_en (rcc_c2_clk_en)
  );

  assign rcc_fclk_c2 = rcc_c2_clk;

  div_2_to_xth #(
      .SQUARE(3)
  ) c2_systick_clk_div (
      .clk_in (rcc_c2_clk),
      .rst_n  (sys_rst_n),
      .clk_out(rcc_c2_systick_clk)
  );

  rcc_clk_gate_cell rcc_d2_bus_clk_gate (
      .clk_in (sys_hpre_clk),
      .clk_out(rcc_d2_bus_clk),
      .clk_en (rcc_d2_bus_clk_en)
  );

  rcc_clk_gate_cell rcc_ahb1bridge_d2_clk_gate (
      .clk_in (rcc_d2_bus_clk),
      .clk_out(rcc_ahb1bridge_d2_clk),
      .clk_en (rcc_ahb1bridge_d2_clk_en)
  );

  rcc_clk_gate_cell rcc_ahb2bridge_d2_clk_gate (
      .clk_in (rcc_d2_bus_clk),
      .clk_out(rcc_ahb2bridge_d2_clk),
      .clk_en (rcc_ahb2bridge_d2_clk_en)
  );

  rcc_pclk_timer_div rcc_apb1clk_timer_div (
      .clk_in     (rcc_d2_bus_clk),
      .rst_n      (sys_rst_n),
      .div_sel    (d2ppre1),
      .timpre     (timpre),
      .tim_ker_clk(rcc_timx_ker_clk),
      .pclk       (rcc_apb1bridge_d2_clk_pre)
  );

  rcc_clk_gate_cell rcc_apb1bridge_d2_clk_gate (
      .clk_in (rcc_apb1bridge_d2_clk_pre),
      .clk_out(rcc_apb1bridge_d2_clk),
      .clk_en (rcc_apb1bridge_d2_clk_en)
  );

  rcc_pclk_timer_div rcc_apb2clk_timer_div (
      .clk_in     (rcc_d2_bus_clk),
      .rst_n      (sys_rst_n),
      .div_sel    (d2ppre2),
      .timpre     (timpre),
      .tim_ker_clk(rcc_timy_ker_clk),
      .pclk       (rcc_apb2bridge_d2_clk_pre)
  );

  rcc_clk_gate_cell rcc_apb2bridge_d2_clk_gate (
      .clk_in (rcc_apb2bridge_d2_clk_pre),
      .clk_out(rcc_apb2bridge_d2_clk),
      .clk_en (rcc_apb2bridge_d2_clk_en)
  );

  assign rcc_hrtimer_prescalar_clk = hrtimsel ? rcc_timy_ker_clk : rcc_c1_clk;

  ///////////////////////////////////////
  // d3 domian clock generate///////////
  ///////////////////////////////////////

  rcc_clk_gate_cell rcc_d3_bus_clk_gate (
      .clk_in (sys_hpre_clk),
      .clk_out(rcc_d3_bus_clk),
      .clk_en (rcc_d3_bus_clk_en)
  );

  rcc_clk_gate_cell rcc_ahb4bridge_d3_clk_gate (
      .clk_in (rcc_d3_bus_clk),
      .clk_out(rcc_ahb4bridge_d3_clk),
      .clk_en (rcc_ahb4bridge_d3_clk_en)
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

  rcc_clk_gate_cell rcc_apb4bridge_d3_clk_gate (
      .clk_in (rcc_apb4bridge_d3_clk_pre),
      .clk_out(rcc_apb4bridge_d3_clk),
      .clk_en (rcc_apb4bridge_d3_clk_en)
  );

endmodule
