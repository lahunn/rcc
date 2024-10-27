module rcc_sys_clk_rst_ctrl #(
    parameter D2_RST_DURATION = 10,
    parameter D1_RST_DURATION = 10,
    parameter CLK_ON_AFTER_SYS_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_D1_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_D2_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_CPU1_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_CPU2_RST_RELEASE = 8
) (
    // reset signal sources
    input nrst_in,
    input iwdg1_out_rst,
    input wwdg1_out_rst,
    input iwdg2_out_rst,
    input wwdg2_out_rst,
    input lpwr2_rst,
    input lpwr1_rst,
    input pwr_bor_rst,
    input pwr_por_rst,
    input cpu2_sftrst,
    input cpu1_sftrst,
    input pre_vsw_rst_n,

    //pwr signals 
    input pwr_vcore_ok,
    input pwr_d1_ok,
    input pwr_d2_ok,
    input d3_deepsleep,
    // flash signals
    input flash_obl_reload,
    input obl_done,
    input flash_power_ok,

    //input arcg on
    input  rcc_arcg_on,
    // output reset signals
    output pwr_por_rst_n,
    output sys_arcg_rst_n,
    output d1_arcg_rst_n,
    output d2_arcg_rst_n,

    output cpu1_arcg_rst_n,
    output cpu2_arcg_rst_n,
    output d1_bus_arcg_rst_n,
    output d2_bus_arcg_rst_n,
    output d3_bus_arcg_rst_n,

    output sync_vsw_rst_n,

    // nrst output 
    output nrst_out,
    output cpu1_rst_n,
    output cpu2_rst_n,
    output rcc_obl_rst_n,
    output stby_rst_n,
    input  pwr_d1_wkup,
    input  pwr_d2_wkup,
    input  pwr_d3_wkup,
    output rcc_pwr_d1_req,
    output rcc_pwr_d2_req,
    output rcc_pwr_d3_req,



    // sys clocks
    output sys_clk,
    output pre_sys_clk,
    //PAD signals 
    output mco1,
    output mco2,

    //indicate peripheral alloction
    input  c2_per_alloc_d1,
    input  c1_per_alloc_d2,
    // signals connected to CPU 
    input  c2_sleep,
    input  c2_deepsleep,
    input  c1_sleep,
    input  c1_deepsleep,
    output rcc_c2_clk,
    output rcc_fclk_c2,
    output rcc_c2_systick_clk,
    output rcc_c1_clk,
    output rcc_fclk_c1,
    output rcc_c1_systick_clk,
    // timer clocks
    output rcc_timx_ker_clk,
    output rcc_timy_ker_clk,
    output rcc_hrtimer_prescalar_clk,
    //rtc clocks
    output hse_rtc_clk,
    // sys clocks
    output sys_d1cpre_clk,
    output sys_hpre_clk,
    // stop mode signals
    output rcc_d1_stop,
    output rcc_d2_stop,
    output rcc_sys_stop,
    //--------------------
    // oscilator signals
    //--------------------
    // signals connected to HSE
    input  hsecss_fail,
    input  hse_clk_pre,
    // lse lsi clock
    input  lse_clk,
    input  lsi_clk,
    // signals connected to HSI48 
    input  hsi48_clk,
    // signals connected to CSI
    input  csi_rdy,
    input  csi_clk_pre,
    // signals connected to HSI
    input  hsi_rdy,
    input  hsi_origin_clk,


    // indicate busy state 
    input        axibridge_d1_busy,
    input        ahb3bridge_d1_busy,
    input        apb3bridge_d1_busy,
    input        ahb1bridge_d2_busy,
    input        ahb2bridge_d2_busy,
    input        apb1bridge_d2_busy,
    input        apb2bridge_d2_busy,
    input        ahb4bridge_d3_busy,
    input        apb4bridge_d3_busy,
    input        flash_busy,
    //bus clock signals
    output       rcc_axibridge_d1_clk,
    output       rcc_ahb3bridge_d1_clk,
    output       rcc_apb3bridge_d1_clk,
    output       rcc_ahb1bridge_d2_clk,
    output       rcc_ahb2bridge_d2_clk,
    output       rcc_apb1bridge_d2_clk,
    output       rcc_apb2bridge_d2_clk,
    output       rcc_ahb4bridge_d3_clk,
    output       rcc_apb4bridge_d3_clk,
    //pll signals
    input  [1:0] pllsrc,
    output       pll1_src_clk,
    output       pll2_src_clk,
    output       pll3_src_clk,
    //--------------------
    // register signals
    //--------------------
    //wwdg rst control
    input        ww2rsc,
    input        ww1rsc,
    //select signals
    input  [2:0] mco1sel,
    input  [2:0] mco2sel,
    input  [3:0] mco1pre,
    input  [3:0] mco2pre,
    input  [5:0] rtcpre,
    input  [1:0] sw,
    input  [3:0] d1cpre,
    input  [2:0] d1ppre,
    input  [3:0] hpre,
    input  [2:0] d2ppre1,
    input  [2:0] d2ppre2,
    input  [2:0] d3ppre,
    input        timpre,
    input        hrtimsel,
    input  [1:0] clkpersel,
    //division ratio signals
    input  [1:0] hsidiv,
    input  [5:0] divm1,
    input  [5:0] divm2,
    input  [5:0] divm3,

    output rcc_exit_sys_stop,
    input  test_mode

    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);
  wire [$clog2(D1_RST_DURATION)-1:0] cur_d1_rst_n_counter;
  wire [$clog2(D1_RST_DURATION)-1:0] nxt_d1_rst_n_counter;
  wire [$clog2(D1_RST_DURATION)-1:0] cur_d2_rst_n_counter;
  wire [$clog2(D1_RST_DURATION)-1:0] nxt_d2_rst_n_counter;
  /*AUTOWIRE*/
  wire                               sys_clk_arcg_en;
  wire                               d1_clk_arcg_en;
  wire                               d1_rst_n;
  wire                               d2_clk_arcg_en;
  wire                               d2_rst_n;
  wire                               cpu1_clk_arcg_en;
  wire                               cpu2_clk_arcg_en;
  //Define assign wires here
  wire                               rcc_d1_busy;
  wire                               rcc_d2_busy;
  wire                               rcc_d3_busy;
  wire                               sys_rst_n;
  wire                               hw_init_done;
  wire                               obl_rst;
  wire                               rcc_vcore_rst;
  //Define instance wires here
  wire                               rcc_pwr_d1_req_set_n;
  wire                               rcc_pwr_d2_req_set_n;
  wire                               rcc_pwr_d3_req_set_n;
  wire                               d1_rst_n_counter_wren;
  wire                               nxt_d1_rst_n;
  wire                               cur_d1_rst_n;
  wire                               d2_rst_n_counter_wren;
  wire                               nxt_d2_rst_n;
  wire                               cur_d2_rst_n;
  wire                               sys_rst_n_assert;
  wire                               nxt_sys_rst_n;
  wire                               cur_sys_rst_n;
  /*AUTO DECLARE*/


  ///////////////////////////////////////
  // dx_req signal generate /////////////
  ///////////////////////////////////////

  assign rcc_exit_sys_stop    = pwr_d3_wkup;

  assign rcc_d1_busy          = axibridge_d1_busy | ahb3bridge_d1_busy | apb3bridge_d1_busy | flash_busy;
  assign rcc_d2_busy          = ahb1bridge_d2_busy | ahb2bridge_d2_busy | apb1bridge_d2_busy | apb2bridge_d2_busy;
  assign rcc_d3_busy          = rcc_d1_busy | rcc_d2_busy | ahb4bridge_d3_busy | apb4bridge_d3_busy;


  assign rcc_pwr_d1_req_set_n = ~(c1_deepsleep & (~c2_per_alloc_d1 | c2_deepsleep) & ~rcc_d1_busy);  // 'c1 stop' and 'c2 stop or no peripherals in d1 allocate to c2' and 'd1 not busy' 
  assign rcc_pwr_d2_req_set_n = ~(c2_deepsleep & (~c1_per_alloc_d2 | c1_deepsleep) & ~rcc_d2_busy);  // 'c2 stop' and 'c1 stop or no peripherals in d2 allocate to c1' and 'd2 not busy'
  assign rcc_pwr_d3_req_set_n = ~((c1_deepsleep & c2_deepsleep & d3_deepsleep) & ~rcc_d3_busy);  // 'c1 stop' and 'c2 stop' and 'd3 stop' and 'd3 not busy'

  assign rcc_d1_stop          = rcc_pwr_d1_req;
  assign rcc_d2_stop          = rcc_pwr_d2_req;
  assign rcc_sys_stop         = rcc_pwr_d3_req;

  BB_dfflrs #(
      .DW     (1),
      .RST_VAL(0),
      .SET_VAL(1)
  ) u_rcc_pwr_d1_req_dfflrs (
      .clk  (sys_clk),
      .rst_n(sys_arcg_rst_n),
      .set_n(rcc_pwr_d1_req_set_n),
      .en   (pwr_d1_wkup),
      .din  (1'b0),

      .dout(rcc_pwr_d1_req)
  );  // it could be chnaged with no reset

  BB_dfflrs #(
      .DW     (1),
      .RST_VAL(0),
      .SET_VAL(1)
  ) u_rcc_pwr_d2_req_dfflrs (
      .clk  (sys_clk),
      .rst_n(sys_arcg_rst_n),
      .set_n(rcc_pwr_d2_req_set_n),
      .en   (pwr_d2_wkup),
      .din  (1'b0),

      .dout(rcc_pwr_d2_req)
  );

  BB_dfflrs #(
      .DW     (1),
      .RST_VAL(0),
      .SET_VAL(1)
  ) u_rcc_pwr_d3_req_dfflrs (
      .clk  (sys_clk),
      .rst_n(sys_arcg_rst_n),
      .set_n(rcc_pwr_d3_req_set_n),
      .en   (pwr_d3_wkup),
      .din  (1'b0),

      .dout(rcc_pwr_d3_req)
  );


  //generate rst_n for pwr_por_rst
  assign pwr_por_rst_n         = ~pwr_por_rst;
  //generate reset for option byte load module
  assign rcc_obl_rst_n         = pwr_por_rst_n & pwr_vcore_ok;  // option byte load reset release until power on and vcore power ok

  ///////////////////////////////
  //nrst_out
  ///////////////////////////////
  assign nrst_out              = obl_rst | pwr_por_rst_n | pwr_bor_rst | lpwr1_rst | lpwr2_rst | (wwdg1_out_rst & ww1rsc) | (wwdg2_out_rst & ww2rsc) | iwdg1_out_rst | iwdg2_out_rst | cpu2_sftrst | cpu1_sftrst;

  //--------------------------------------------------------------------------------
  //d1 d2 system standby reset generate/////////////////////////////////////////////
  //--------------------------------------------------------------------------------

  assign d1_rst_n_counter_wren = (cur_d1_rst_n_counter < D1_RST_DURATION);
  assign nxt_d1_rst_n_counter  = cur_d1_rst_n_counter + {{($clog2(D1_RST_DURATION) - 1) {1'b0}}, 1'b1};

  BB_dfflr #(
      .DW     ($clog2(D1_RST_DURATION)),
      .RST_VAL(0)
  ) u_d1_rst_n_counter_dfflr (
      .clk  (sys_d1cpre_clk),
      .rst_n(pwr_d1_ok),
      .en   (d1_rst_n_counter_wren),
      .din  (nxt_d1_rst_n_counter),
      .dout (cur_d1_rst_n_counter)
  );

  assign nxt_d1_rst_n = d1_rst_n_counter_wren;
  assign d1_rst_n     = cur_d1_rst_n;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL(0)
  ) u_d1_rst_n_dfflr (
      .clk  (sys_d1cpre_clk),
      .rst_n(pwr_d1_ok),
      .en   (flash_power_ok),
      .din  (nxt_d1_rst_n),
      .dout (cur_d1_rst_n)
  );


  assign d2_rst_n_counter_wren = (cur_d2_rst_n_counter < D2_RST_DURATION);
  assign nxt_d2_rst_n_counter  = cur_d2_rst_n_counter + {{($clog2(D2_RST_DURATION) - 1) {1'b0}}, 1'b1};

  BB_dfflr #(
      .DW     ($clog2(D2_RST_DURATION)),
      .RST_VAL(0)
  ) u_d2_rst_n_counter_dfflr (
      .clk  (sys_hpre_clk),
      .rst_n(pwr_d2_ok),
      .en   (d2_rst_n_counter_wren),
      .din  (nxt_d2_rst_n_counter),
      .dout (cur_d2_rst_n_counter)
  );

  assign nxt_d2_rst_n = d2_rst_n_counter_wren;
  assign d2_rst_n     = cur_d2_rst_n;
  BB_dfflr #(
      .DW     (1),
      .RST_VAL(0)
  ) u_d2_rst_n_dfflr (
      .clk  (sys_hpre_clk),
      .rst_n(pwr_d2_ok),
      .en   (flash_power_ok),
      .din  (nxt_d2_rst_n),
      .dout (cur_d2_rst_n)
  );

  ///////////////////////////////
  //system reset generate
  ///////////////////////////////

  assign sys_rst_n_assert = ~nrst_in & hw_init_done;
  assign nxt_sys_rst_n    = hsi_rdy & flash_power_ok;
  assign sys_rst_n        = cur_sys_rst_n;
  BB_dffr #(
      .DW     (1),
      .RST_VAL(0)
  ) u_sys_rst_n_dfflr (
      .clk  (pre_sys_clk),
      .rst_n(sys_rst_n_assert),
      .din  (nxt_sys_rst_n),
      .dout (cur_sys_rst_n)
  );

  ///////////////////////////////
  //hw init done generate 
  ///////////////////////////////
  assign hw_init_done      = ~pwr_por_rst & pwr_vcore_ok & ~flash_obl_reload & obl_done;

  ///////////////////////////////
  //obl reset generate
  ///////////////////////////////
  assign obl_rst           = ~obl_done | flash_obl_reload;

  ///////////////////////////////
  //rcc vcore reset generate
  ///////////////////////////////
  assign rcc_vcore_rst     = pwr_por_rst | ~pwr_vcore_ok | ~obl_done;

  ///////////////////////////////
  //standby reset generate
  ///////////////////////////////
  assign stby_rst_n        = ~rcc_vcore_rst;

  //////////////////////////////////
  //cpu and bus reset generate
  /////////////////////////////////
  assign cpu1_rst_n        = sys_rst_n & d1_rst_n & ~wwdg1_out_rst;
  assign cpu2_rst_n        = sys_rst_n & d2_rst_n & ~wwdg2_out_rst;


  //---------------------------------------------------------
  //sys rst arcg 
  //---------------------------------------------------------
  //dx_bus_arcg_rst_n generate
  assign d1_bus_arcg_rst_n = sys_arcg_rst_n & d1_arcg_rst_n;
  assign d2_bus_arcg_rst_n = sys_arcg_rst_n & d2_arcg_rst_n;
  assign d3_bus_arcg_rst_n = sys_arcg_rst_n;

  // system clock asynchoronous reset clock gating
  async_reset_clk_gate #(
      .DELAY(CLK_ON_AFTER_SYS_RST_RELEASE)
  ) sys_clk_async_reset_clk_gate (
      .src_rst_n (sys_rst_n),
      .i_clk     (sys_clk),
      .arcg_on   (rcc_arcg_on),
      .clk_en    (sys_clk_arcg_en),
      .sync_rst_n(sys_arcg_rst_n)
  );

  // d1 domain clock asynchoronous reset clock gating
  async_reset_clk_gate #(
      .DELAY(CLK_ON_AFTER_D1_RST_RELEASE)
  ) d1_clk_async_reset_clk_gate (
      .src_rst_n (d1_rst_n),
      .i_clk     (sys_d1cpre_clk),
      .arcg_on   (rcc_arcg_on),
      .clk_en    (d1_clk_arcg_en),
      .sync_rst_n(d1_arcg_rst_n)
  );

  // d2 domain clock asynchoronous reset clock gating
  async_reset_clk_gate #(
      .DELAY(CLK_ON_AFTER_D2_RST_RELEASE)
  ) d2_clk_async_reset_clk_gate (
      .src_rst_n (d2_rst_n),
      .i_clk     (sys_hpre_clk),
      .arcg_on   (rcc_arcg_on),
      .clk_en    (d2_clk_arcg_en),
      .sync_rst_n(d2_arcg_rst_n)
  );

  // cpu1 clock asynchoronous reset clock gating
  async_reset_clk_gate #(
      .DELAY(CLK_ON_AFTER_CPU1_RST_RELEASE)
  ) cpu1_clk_async_reset_clk_gate (
      .src_rst_n (cpu1_rst_n),
      .i_clk     (sys_d1cpre_clk),
      .arcg_on   (rcc_arcg_on),
      .clk_en    (cpu1_clk_arcg_en),
      .sync_rst_n(cpu1_arcg_rst_n)
  );
  // cpu2 clock asynchoronous reset clock gating
  async_reset_clk_gate #(
      .DELAY(CLK_ON_AFTER_CPU2_RST_RELEASE)
  ) cpu2_clk_async_reset_clk_gate (
      .src_rst_n (cpu2_rst_n),
      .i_clk     (sys_d1cpre_clk),
      .arcg_on   (rcc_arcg_on),
      .clk_en    (cpu2_clk_arcg_en),
      .sync_rst_n(cpu2_arcg_rst_n)
  );


  //-------------------------------------------------
  //vsw reset sync
  //-------------------------------------------------
  BB_reset_sync #(
      .STAGE_NUM(2)
  ) u_BB_reset_sync (
      .src_rst_n(pre_vsw_rst_n),
      .clk      (pre_sys_clk),
      .gen_rst_n(sync_vsw_rst_n)
  );

  rcc_sys_clk_gen u_rcc_sys_clk_gen (  /*AUTOINST*/

  );
endmodule
