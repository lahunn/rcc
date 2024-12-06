// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : generate system clock and reset for different domains
// ****************************************************************
module rcc_sys_clk_rst_ctrl #(
    parameter D2_RST_DURATION = 10,
    parameter D1_RST_DURATION = 10,
    parameter CLK_ON_AFTER_SYS_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_D1_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_D2_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_CPU1_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_CPU2_RST_RELEASE = 8
) (
    //==============================================================================================
    // reset signal sources
    //==============================================================================================
    input        nrst_in,
    input        iwdg1_out_rst,
    input        wwdg1_out_rst,
    input        iwdg2_out_rst,
    input        wwdg2_out_rst,
    input        lpwr2_rst,
    input        lpwr1_rst,
    input        pwr_bor_rst,
    input        pwr_por_rst,
    input        cpu2_sftrst,
    input        cpu1_sftrst,
    input        pwr_vsw_rst,
    input        bdrst,
    //==============================================================================================
    //testmode signal
    //==============================================================================================
    input        testmode,
    input        test_rst_n,
    input        test_clk,
    input        scan_mode,
    input        atspeed_mode,
    input        atspeed_test_clk,
    //==============================================================================================
    // oscilator signals
    //==============================================================================================
    // signals connected to HSE
    // input        hse_rdy,
    input        hsecss_fail,
    input        hse_origin_clk,
    // lse lsi clock
    input        lse_clk,
    input        lsi_clk,
    // signals connected to HSI48 
    input        hsi48_origin_clk,
    // signals connected to CSI
    input        csi_rdy,
    input        csi_origin_clk,
    // signals connected to HSI
    input        hsi_rdy,
    input        hsi_origin_clk,
    //pll clocks
    input        pll1_p_clk,
    input        pll1_q_clk,
    input        pll2_p_clk,
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
    //==============================================================================================
    // register signals
    //==============================================================================================
    //wwdg rst control
    input        ww2rsc,
    input        ww1rsc,
    //select signals
    input  [1:0] pllsrc,
    input  [2:0] mco1sel,
    input  [2:0] mco2sel,
    input  [1:0] sw,
    input        hrtimsel,
    input  [1:0] clkpersel,
    //division ratio signals
    input  [1:0] hsidiv,
    input  [5:0] divm1,
    input  [5:0] divm2,
    input  [5:0] divm3,
    input  [3:0] mco1pre,
    input  [3:0] mco2pre,
    input  [5:0] rtcpre,
    input  [3:0] d1cpre,
    input  [2:0] d1ppre,
    input  [3:0] hpre,
    input  [2:0] d2ppre1,
    input  [2:0] d2ppre2,
    input  [2:0] d3ppre,
    input        timpre,
    // peripheral allocate  signals
    input        c1_per_alloc_ahb1,
    input        c1_per_alloc_ahb2,
    input        c1_per_alloc_ahb3,
    input        c1_per_alloc_apb1,
    input        c1_per_alloc_apb2,
    input        c1_per_alloc_apb3,
    input        c2_per_alloc_ahb1,
    input        c2_per_alloc_ahb2,
    input        c2_per_alloc_ahb3,
    input        c2_per_alloc_apb1,
    input        c2_per_alloc_apb2,
    input        c2_per_alloc_apb3,
    //peripheral kernel clock request
    input        csi_ker_clk_req,
    input        hsi_ker_clk_req,
    //input synced reset signals
    input        hse_sync_sys_rst_n,
    input        csi_ker_sync_sys_rst_n,
    input        hsi_ker_sync_sys_rst_n,
    input        pll1_p_sync_sys_rst_n,
    //pwr signals 
    input        pwr_vcore_ok,
    input        pwr_d1_ok,
    input        pwr_d2_ok,
    input        d3_deepsleep,
    // flash signals
    input        flash_obl_reload,
    input        obl_done,
    input        flash_power_ok,
    //input arcg on
    input        rcc_arcg_on,
    // pwr signals
    input        pwr_d1_wkup,
    input        pwr_d2_wkup,
    input        pwr_d3_wkup,
    output       rcc_pwr_d1_req,
    output       rcc_pwr_d2_req,
    output       rcc_pwr_d3_req,
    // sys clocks
    output       sys_clk,
    //PAD signals 
    output       mco1,
    output       mco2,
    //indicate peripheral alloction
    input        c2_per_alloc_d1,
    input        c1_per_alloc_d2,
    // signals connected to CPU 
    input        c2_sleep,
    input        c2_deepsleep,
    input        c1_sleep,
    input        c1_deepsleep,
    output       rcc_c2_clk,
    output       rcc_fclk_c2,
    output       rcc_c2_systick_clk,
    output       rcc_c1_clk,
    output       rcc_fclk_c1,
    output       rcc_c1_systick_clk,
    // timer clocks
    output       rcc_timx_ker_clk,
    output       rcc_timy_ker_clk,
    output       rcc_hrtimer_prescalar_clk,
    //rtc clocks
    output       hse_rtc_clk,
    //per clock source
    output       rcc_obl_clk,
    output       hsi_ker_clk,
    output       csi_ker_clk,
    output       per_clk,
    // stop mode signals
    output       rcc_d1_stop,
    output       rcc_d2_stop,
    output       rcc_sys_stop,
    // output reset signals
    output       sys_rst_n,
    output       d1_rst_n,
    output       d2_rst_n,
    output       rcc_c1_rst_n,
    output       rcc_c2_rst_n,
    output       d1_bus_rst_n,
    output       d2_bus_rst_n,
    output       d3_bus_rst_n,
    output       sync_vsw_rst_n,
    output       obl_rst,
    output       d1_rst,
    output       d2_rst,
    // nrst output 
    output       nrst_out,
    output       rcc_obl_rst_n,

    //bus clock signals
    output rcc_axibridge_d1_clk,
    output rcc_ahb3bridge_d1_clk,
    output rcc_apb3bridge_d1_clk,
    output rcc_ahb1bridge_d2_clk,
    output rcc_ahb2bridge_d2_clk,
    output rcc_apb1bridge_d2_clk,
    output rcc_apb2bridge_d2_clk,
    output rcc_ahb4bridge_d3_clk,
    output rcc_apb4bridge_d3_clk,
    //bus clock div en
    output c1_to_axi_div_en,
    output d1_h2b_div_en,
    output d2_h2b1_div_en,
    output d2_h2b2_div_en,
    output d3_h2b_div_en,
    //pll signals
    output pll1_src_clk,
    output pll2_src_clk,
    output pll3_src_clk,
    //system state
    output rcc_exit_sys_stop,
    //==============================================================================================
    //testmode signal to increase scan coverage
    //==============================================================================================
    output nrst_out_scan_inc
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);

  wire                               rcc_obl_clk_arcg_en;
  wire                               sys_clk_arcg_en;
  wire                               d1_clk_arcg_en;
  wire                               pwr_por_rst_n;
  wire                               d2_clk_arcg_en;
  wire                               cpu1_clk_arcg_en;
  wire                               cpu2_clk_arcg_en;
  //Define assign wires here
  wire                               rcc_d1_busy;
  wire                               rcc_d2_busy;
  wire                               rcc_d3_busy;
  wire                               hw_init_done;
  // wire                               rcc_vcore_rst;
  wire                               stby_rst_n;
  // wire                               rcc_obl_rst_n;
  //Define instance wires here
  wire                               rcc_pwr_d1_req_set;
  wire                               rcc_pwr_d2_req_set;
  wire                               rcc_pwr_d3_req_set;
  wire                               d1_rst_n_counter_wren;
  wire                               nxt_d1_rst_n;
  wire                               cur_d1_rst_n;
  wire                               d2_rst_n_counter_wren;
  wire                               nxt_d2_rst_n;
  wire                               cur_d2_rst_n;
  wire                               sys_rst_n_assert_n;
  wire                               sys_rst_n_release;
  wire                               sync_sys_rst_n_assert_n;
  wire                               sync_sys_rst_n_release;
  wire                               nxt_sys_rst_n;
  wire                               cur_sys_rst_n;
  wire                               stby_rst_n_assert_n;
  wire                               stby_rst_n_release;
  wire                               sync_stby_rst_n_assert_n;
  wire                               sync_stby_rst_n_release;
  wire                               nxt_stby_rst_n;
  wire                               cur_stby_rst_n;
  wire                               sys_d1cpre_clk;
  wire                               sys_hpre_clk;
  // sys_clk_generate
  wire                               pre_sys_clk;
  wire                               pll_src_clk;
  wire                               sys_clk_en;
  wire                               hsi_clk;
  wire                               csi_clk;
  wire                               hsi48_clk;
  wire                               rcc_d1_bus_clk;
  wire                               rcc_d2_bus_clk;
  wire                               rcc_d3_bus_clk;
  wire                               rcc_apb1bridge_d2_pre_clk;
  wire                               rcc_apb2bridge_d2_pre_clk;
  wire                               rcc_apb3bridge_d1_pre_clk;
  wire                               rcc_apb4bridge_d3_pre_clk;

  wire                               rcc_d1_bus_clk_en;
  wire                               rcc_d2_bus_clk_en;
  wire                               rcc_d3_bus_clk_en;
  wire                               rcc_c1_clk_en;
  wire                               rcc_c2_clk_en;
  wire                               rcc_axibridge_d1_clk_en;
  wire                               rcc_ahb3bridge_d1_clk_en;
  wire                               rcc_apb3bridge_d1_clk_en;
  wire                               rcc_ahb1bridge_d2_clk_en;
  wire                               rcc_ahb2bridge_d2_clk_en;
  wire                               rcc_apb1bridge_d2_clk_en;
  wire                               rcc_apb2bridge_d2_clk_en;
  wire                               rcc_ahb4bridge_d3_clk_en;
  wire                               rcc_apb4bridge_d3_clk_en;
  wire                               c2_sleep_mode;
  wire                               c1_sleep_mode;
  wire                               mco1_pre_clk;
  wire                               mco2_pre_clk;
  wire                               hsi_pre_clk;
  wire                               hse_clk;

  wire [                        4:0] mco1_clk_src;
  wire [                        5:0] mco2_clk_src;
  wire [                        2:0] per_clk_src;
  wire [                        2:0] pll_clk_src;
  wire [                        3:0] sys_clk_src;
  wire                               hsi_clk_en;
  wire                               hsi_ker_clk_en;
  wire                               csi_clk_en;
  wire                               csi_ker_clk_en;

  // wire                               hse_clk_en;

  wire                               sync_flash_power_ok;
  wire                               sync_pwr_d1_ok;
  wire                               sync_pwr_d2_ok;
  wire                               c1_rst_n;
  wire                               c2_rst_n;

  wire [$clog2(D1_RST_DURATION)-1:0] cur_d1_rst_n_counter;
  wire [$clog2(D1_RST_DURATION)-1:0] nxt_d1_rst_n_counter;
  wire [$clog2(D1_RST_DURATION)-1:0] cur_d2_rst_n_counter;
  wire [$clog2(D1_RST_DURATION)-1:0] nxt_d2_rst_n_counter;
  //vsw signal sync 
  wire                               sync_bdrst;
  wire                               sync_pwr_vsw_rst;

  wire                               d1_pwr_d1_wkup;
  wire                               d2_pwr_d1_wkup;
  wire                               d1_pwr_d2_wkup;
  wire                               d2_pwr_d2_wkup;
  wire                               d1_pwr_d3_wkup;
  wire                               d2_pwr_d3_wkup;
  wire                               rcc_pwr_d1_req_wren;
  wire                               nxt_rcc_pwr_d1_req;
  wire                               cur_rcc_pwr_d1_req;
  wire                               rcc_pwr_d2_req_wren;
  wire                               nxt_rcc_pwr_d2_req;
  wire                               cur_rcc_pwr_d2_req;
  wire                               rcc_pwr_d3_req_wren;
  wire                               nxt_rcc_pwr_d3_req;
  wire                               cur_rcc_pwr_d3_req;

  wire                               raw_stby_rst_n_assert_n;
  wire                               raw_stby_rst_n;
  wire                               raw_sys_rst_n_assert_n;
  wire                               raw_sys_rst_n;
  wire                               raw_nrst_out;
  wire                               raw_d1_rst_n;
  wire                               raw_d2_rst_n;
  wire                               raw_c1_rst_n;
  wire                               raw_c2_rst_n;
  wire                               raw_d1_bus_rst_n;
  wire                               raw_d2_bus_rst_n;
  wire                               raw_d3_bus_rst_n;
  wire                               raw_sync_vsw_rst_n;
  wire                               gen_pwr_d1_ok;
  wire                               gen_pwr_d2_ok;
  wire                               raw_sync_pwr_d1_ok;
  wire                               raw_sync_pwr_d2_ok;
  wire                               gen_pwr_vsw_rst;

  wire                               raw_hsi_pre_clk;
  wire                               raw_mco1_pre_clk;
  wire                               raw_mco2_pre_clk;
  wire                               raw_pll_src_clk;
  wire                               raw_sys_d1cpre_clk;
  wire                               raw_sys_hpre_clk;
  wire                               raw_rcc_c1_systick_clk;
  wire                               raw_rcc_c2_systick_clk;
  wire                               raw_rcc_timx_ker_clk;
  wire                               raw_rcc_timy_ker_clk;
  wire                               raw_rcc_apb1bridge_d2_pre_clk;
  wire                               raw_rcc_apb2bridge_d2_pre_clk;
  wire                               raw_rcc_hrtimer_prescalar_clk;
  wire                               raw_rcc_apb3bridge_d1_pre_clk;
  wire                               raw_rcc_apb4bridge_d3_pre_clk;
  /*AUTOWIRE*/
  /*AUTO DECLARE*/

  //==============================================================================================
  // dx_req signal generate
  //==============================================================================================
  //exit system stop, while pwr_d3_wkup is high  
  assign rcc_exit_sys_stop  = d2_pwr_d3_wkup;

  assign rcc_d1_busy        = axibridge_d1_busy || ahb3bridge_d1_busy || apb3bridge_d1_busy || flash_busy;
  assign rcc_d2_busy        = ahb1bridge_d2_busy || ahb2bridge_d2_busy || apb1bridge_d2_busy || apb2bridge_d2_busy;
  assign rcc_d3_busy        = rcc_d1_busy || rcc_d2_busy || ahb4bridge_d3_busy || apb4bridge_d3_busy;

  assign rcc_pwr_d1_req_set = c1_deepsleep && (~c2_per_alloc_d1 || c2_deepsleep) && ~rcc_d1_busy;
  // 'c1 stop' and 'c2 stop or no peripherals in d1 allocate to c2' and 'd1 not busy' 
  assign rcc_pwr_d2_req_set = c2_deepsleep && (~c1_per_alloc_d2 || c1_deepsleep) && ~rcc_d2_busy;
  // 'c2 stop' and 'c1 stop or no peripherals in d2 allocate to c1' and 'd2 not busy'
  assign rcc_pwr_d3_req_set = (c1_deepsleep && c2_deepsleep && d3_deepsleep) && ~rcc_d3_busy;
  // 'c1 stop' and 'c2 stop' and 'd3 stop' and 'd3 not busy'
  // d3_deepsleep is aynchrous signal, so it need to be synchronized

  assign rcc_d1_stop        = rcc_pwr_d1_req;
  assign rcc_d2_stop        = rcc_pwr_d2_req;
  assign rcc_sys_stop       = rcc_pwr_d3_req;

  // pwr_dx_wkup is aynchrous signal, so it need to be synchronized
  // rcc_pwr_dx_req_set_n can set rcc_pwr_dx_req to 1 but can't set rcc_pwr_dx_req to 0
  // pwr_dx_wkup would set rcc_pwr_d1_req to 0 but can't set rcc_pwr_dx_req to 1

  //================================================================
  // rcc_pwr_d1_req generate
  //================================================================
  // pwr_d1_wkup might be pulse, so we should be able to store the value of pwr_d1_wkup
  // d2_pwr_d1_wkup would not be release ultil rcc_pwr_d1_req is cleared
  BB_dffr #(
      .DW     (1),
      .RST_VAL(1)
  ) u_pwr_d1_wkup_dffr (
      .clk  (sys_clk),
      .rst_n(~pwr_d1_wkup),
      .din  (rcc_pwr_d1_req),
      .dout (d1_pwr_d1_wkup)
  );

  BB_dffr #(
      .DW     (1),
      .RST_VAL(1)
  ) u_d1_pwr_d1_wkup_dffr (
      .clk  (sys_clk),
      .rst_n(~pwr_d1_wkup),
      .din  (d1_pwr_d1_wkup),
      .dout (d2_pwr_d1_wkup)
  );

  assign rcc_pwr_d1_req_wren = d2_pwr_d1_wkup || rcc_pwr_d1_req_set;
  assign nxt_rcc_pwr_d1_req  = rcc_pwr_d1_req_set;
  assign rcc_pwr_d1_req      = cur_rcc_pwr_d1_req;
  // rcc_pwr_d1_req would be cleared when d2_pwr_d1_wkup is 1 and rcc_pwr_d1_req_set is 0
  BB_dfflr #(
      .DW     (1),
      .RST_VAL(0)
  ) u_rcc_pwr_d1_req_dfflr (
      .clk  (sys_clk),
      .rst_n(sys_rst_n),
      .en   (rcc_pwr_d1_req_wren),
      .din  (nxt_rcc_pwr_d1_req),
      .dout (cur_rcc_pwr_d1_req)
  );

  //================================================================
  // rcc_pwr_d2_req generate
  //================================================================
  // pwr_d2_wkup might be pulse, so we should be able to store the value of pwr_d2_wkup
  // d2_pwr_d2_wkup_n would not be release ultil rcc_pwr_d2_req is cleared
  BB_dffr #(
      .DW     (1),
      .RST_VAL(1)
  ) u_pwr_d2_wkup_dffr (
      .clk  (sys_clk),
      .rst_n(~pwr_d2_wkup),
      .din  (rcc_pwr_d2_req),
      .dout (d1_pwr_d2_wkup)
  );

  BB_dffr #(
      .DW     (1),
      .RST_VAL(1)
  ) u_d1_pwr_d2_wkup_dffr (
      .clk  (sys_clk),
      .rst_n(~pwr_d2_wkup),
      .din  (d1_pwr_d2_wkup),
      .dout (d2_pwr_d2_wkup)
  );

  assign rcc_pwr_d2_req_wren = d2_pwr_d2_wkup || rcc_pwr_d2_req_set;
  assign nxt_rcc_pwr_d2_req  = rcc_pwr_d2_req_set;
  assign rcc_pwr_d2_req      = cur_rcc_pwr_d2_req;
  // rcc_pwr_d2_req would be cleared when d2_pwr_d2_wkup is 1 and rcc_pwr_d2_req_set is 0
  BB_dfflr #(
      .DW     (1),
      .RST_VAL(0)
  ) u_rcc_pwr_d2_req_dfflr (
      .clk  (sys_clk),
      .rst_n(sys_rst_n),
      .en   (rcc_pwr_d2_req_wren),
      .din  (nxt_rcc_pwr_d2_req),
      .dout (cur_rcc_pwr_d2_req)
  );

  //================================================================
  // rcc_pwr_d3_req generate
  //================================================================
  // pwr_d3_wkup might be pulse, so we should be able to store the value of pwr_d3_wkup
  // d2_pwr_d3_wkup_n would not be release ultil rcc_pwr_d3_req is cleared
  BB_dffr #(
      .DW     (1),
      .RST_VAL(1)
  ) u_pwr_d3_wkup_dffr (
      .clk  (sys_clk),
      .rst_n(~pwr_d3_wkup),
      .din  (rcc_pwr_d3_req),
      .dout (d1_pwr_d3_wkup)
  );

  BB_dffr #(
      .DW     (1),
      .RST_VAL(1)
  ) u_d1_pwr_d3_wkup_dffr (
      .clk  (sys_clk),
      .rst_n(~pwr_d3_wkup),
      .din  (d1_pwr_d3_wkup),
      .dout (d2_pwr_d3_wkup)
  );

  assign rcc_pwr_d3_req_wren = d2_pwr_d3_wkup || rcc_pwr_d3_req_set;
  assign nxt_rcc_pwr_d3_req  = rcc_pwr_d3_req_set;
  assign rcc_pwr_d3_req      = cur_rcc_pwr_d3_req;
  // rcc_pwr_d3_req would be cleared when d2_pwr_d3_wkup is 1 and rcc_pwr_d3_req_set is 0 and hsi or csi is ready
  BB_dfflr #(
      .DW     (1),
      .RST_VAL(0)
  ) u_rcc_pwr_d3_req_dfflr (
      .clk  (sys_clk),
      .rst_n(sys_rst_n),
      .en   (rcc_pwr_d3_req_wren),
      .din  (nxt_rcc_pwr_d3_req),
      .dout (cur_rcc_pwr_d3_req)
  );

  //generate rst_n for pwr_por_rst
  assign pwr_por_rst_n           = ~pwr_por_rst;
  //==============================================================================================
  //standby reset generate
  //==============================================================================================

  // stby_rst_n_assert_n test mux 
  assign raw_stby_rst_n_assert_n = pwr_por_rst_n && pwr_vcore_ok;  // stby_rst_n is asserted when power on reset or vcore not ok
  test_rst_mux u_stby_rst_n_assert_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_stby_rst_n_assert_n),
      .testmode  (testmode),
      .rst_n     (stby_rst_n_assert_n)
  );

  assign stby_rst_n_release = hsi_rdy && flash_power_ok;  // stby_rst_n is released when hsi_rdy and flash power ok
  rcc_reset_sync #(
      .STAGE_NUM(2)
  ) u_stby_rst_n_assert_n_sync (
      .src_rst_n(stby_rst_n_assert_n),
      .clk      (pre_sys_clk),
      .testmode (testmode),
      .gen_rst_n(raw_sync_stby_rst_n_assert_n)
  );

  // sync_stby_rst_n_assert_n test mux
  test_rst_mux u_sync_stby_rst_n_assert_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_sync_stby_rst_n_assert_n),
      .testmode  (testmode),
      .rst_n     (sync_stby_rst_n_assert_n)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1),
      .RST_VAL  ('b0)
  ) u_stby_rst_n_release_sync (
      .src_signal(stby_rst_n_release),
      .rst_n     (sync_stby_rst_n_assert_n),
      .clk       (pre_sys_clk),
      .gen_signal(sync_stby_rst_n_release)
  );

  // stby_rst_n is asserted when power on reset or vcore not ok
  // stby_rst_n is released when hsi_rdy and flash power ok
  assign nxt_stby_rst_n = 1'b1;  //
  assign raw_stby_rst_n = cur_stby_rst_n;
  test_rst_mux u_stby_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_stby_rst_n),
      .testmode  (testmode),
      .rst_n     (stby_rst_n)
  );

  BB_dfflr #(
      .DW     (1),
      .RST_VAL(0)
  ) u_stby_rst_n_dfflr (
      .clk  (pre_sys_clk),
      .rst_n(sync_stby_rst_n_assert_n),
      .en   (sync_stby_rst_n_release),
      .din  (nxt_stby_rst_n),
      .dout (cur_stby_rst_n)
  );

  //==============================================================================================
  //hw init done generate 
  //==============================================================================================
  assign hw_init_done           = stby_rst_n && (~obl_rst);

  //==============================================================================================
  //system reset generate
  //==============================================================================================
  // sys reset is asserted when power on reset or hw init not finished , and reset release when hsi_rdy and flash power ok
  assign raw_sys_rst_n_assert_n = ~nrst_in && hw_init_done;
  assign sys_rst_n_release      = hsi_rdy && flash_power_ok;

  test_rst_mux u_sys_rst_n_assert_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_sys_rst_n_assert_n),
      .testmode  (testmode),
      .rst_n     (sys_rst_n_assert_n)
  );

  rcc_reset_sync #(
      .STAGE_NUM(2)
  ) u_sys_rst_n_assert_n_sync (
      .src_rst_n(sys_rst_n_assert_n),
      .clk      (pre_sys_clk),
      .testmode (testmode),
      .gen_rst_n(raw_sync_sys_rst_n_assert_n)
  );

  test_rst_mux u_sync_sys_rst_n_assert_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_sync_sys_rst_n_assert_n),
      .testmode  (testmode),
      .rst_n     (sync_sys_rst_n_assert_n)
  );

  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1),
      .RST_VAL  ('b0)
  ) u_sys_rst_n_release_sync (
      .src_signal(sys_rst_n_release),
      .rst_n     (sync_sys_rst_n_assert_n),
      .clk       (pre_sys_clk),
      .gen_signal(sync_sys_rst_n_release)
  );

  assign nxt_sys_rst_n = 1'b1;  //
  assign raw_sys_rst_n = cur_sys_rst_n;

  test_rst_mux u_sys_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_sys_rst_n),
      .testmode  (testmode),
      .rst_n     (sys_rst_n)
  );

  BB_dfflr #(
      .DW     (1),
      .RST_VAL(0)
  ) u_sys_rst_n_dfflr (
      .clk  (pre_sys_clk),
      .rst_n(sync_sys_rst_n_assert_n),
      .en   (sync_sys_rst_n_release),
      .din  (nxt_sys_rst_n),
      .dout (cur_sys_rst_n)
  );

  //==============================================================================================
  //nrst_out
  //==============================================================================================
  assign raw_nrst_out      = obl_rst || pwr_por_rst || pwr_bor_rst || lpwr1_rst || lpwr2_rst || (wwdg1_out_rst && ww1rsc) || (wwdg2_out_rst && ww2rsc) || iwdg1_out_rst || iwdg2_out_rst || cpu2_sftrst || cpu1_sftrst;
  assign nrst_out_scan_inc = scan_mode && raw_nrst_out;
  test_rst_mux u_nrst_out_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_nrst_out),
      .testmode  (testmode),
      .rst_n     (nrst_out)
  );


  //==============================================================================================
  //d1 system standby reset generate
  //==============================================================================================
  assign d1_rst_n_counter_wren = (cur_d1_rst_n_counter < D1_RST_DURATION);
  assign nxt_d1_rst_n_counter  = cur_d1_rst_n_counter + {{($clog2(D1_RST_DURATION) - 1) {1'b0}}, 1'b1};

  test_rst_mux u_pwr_d1_ok_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(pwr_d1_ok),
      .testmode  (testmode),
      .rst_n     (gen_pwr_d1_ok)
  );

  rcc_reset_sync #(
      .STAGE_NUM(2)
  ) u_pwr_d1_ok_sync (
      .src_rst_n(gen_pwr_d1_ok),
      .clk      (sys_d1cpre_clk),
      .testmode (testmode),
      .gen_rst_n(raw_sync_pwr_d1_ok)
  );

  test_rst_mux u_sync_pwr_d1_ok_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_sync_pwr_d1_ok),
      .testmode  (testmode),
      .rst_n     (sync_pwr_d1_ok)
  );

  BB_dfflr #(
      .DW     ($clog2(D1_RST_DURATION)),
      .RST_VAL(0)
  ) u_d1_rst_n_counter_dfflr (
      .clk  (sys_d1cpre_clk),
      .rst_n(sync_pwr_d1_ok),
      .en   (d1_rst_n_counter_wren),
      .din  (nxt_d1_rst_n_counter),
      .dout (cur_d1_rst_n_counter)
  );

  assign nxt_d1_rst_n = !d1_rst_n_counter_wren;
  assign raw_d1_rst_n = cur_d1_rst_n;
  assign d1_rst       = ~cur_d1_rst_n;
  test_rst_mux u_d1_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_d1_rst_n),
      .testmode  (testmode),
      .rst_n     (d1_rst_n)
  );
  //flash in d1 , so d1 reset release have to wait until falsh power ok
  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1)
  ) u_flash_power_ok_sync (
      .src_signal(flash_power_ok),
      .rst_n     (sync_pwr_d1_ok),
      .clk       (sys_d1cpre_clk),
      .gen_signal(sync_flash_power_ok)
  );

  BB_dfflr #(
      .DW     (1),
      .RST_VAL(0)
  ) u_d1_rst_n_dfflr (
      .clk  (sys_d1cpre_clk),
      .rst_n(sync_pwr_d1_ok),
      .en   (sync_flash_power_ok),
      .din  (nxt_d1_rst_n),
      .dout (cur_d1_rst_n)
  );

  //==============================================================================================
  //d2 system standby reset generate
  //==============================================================================================
  assign d2_rst_n_counter_wren = (cur_d2_rst_n_counter < D2_RST_DURATION);
  assign nxt_d2_rst_n_counter  = cur_d2_rst_n_counter + {{($clog2(D2_RST_DURATION) - 1) {1'b0}}, 1'b1};

  test_rst_mux u_pwr_d2_ok_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(pwr_d2_ok),
      .testmode  (testmode),
      .rst_n     (gen_pwr_d2_ok)
  );

  rcc_reset_sync #(
      .STAGE_NUM(2)
  ) u_pwr_d2_ok_sync (
      .src_rst_n(gen_pwr_d2_ok),
      .clk      (sys_hpre_clk),
      .testmode (testmode),
      .gen_rst_n(raw_sync_pwr_d2_ok)
  );

  test_rst_mux u_sync_pwr_d2_ok_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_sync_pwr_d2_ok),
      .testmode  (testmode),
      .rst_n     (sync_pwr_d2_ok)
  );

  BB_dfflr #(
      .DW     ($clog2(D2_RST_DURATION)),
      .RST_VAL(0)
  ) u_d2_rst_n_counter_dfflr (
      .clk  (sys_hpre_clk),
      .rst_n(sync_pwr_d2_ok),
      .en   (d2_rst_n_counter_wren),
      .din  (nxt_d2_rst_n_counter),
      .dout (cur_d2_rst_n_counter)
  );

  assign nxt_d2_rst_n = !d2_rst_n_counter_wren;
  assign raw_d2_rst_n = cur_d2_rst_n;
  assign d2_rst       = ~cur_d2_rst_n;
  test_rst_mux u_d2_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_d2_rst_n),
      .testmode  (testmode),
      .rst_n     (d2_rst_n)
  );
  //falsh not in d2, so d2_rst_n don't have to wait flash power ok
  BB_dffr #(
      .DW     (1),
      .RST_VAL(0)
  ) u_d2_rst_n_dfflr (
      .clk  (sys_hpre_clk),
      .rst_n(sync_pwr_d2_ok),
      .din  (nxt_d2_rst_n),
      .dout (cur_d2_rst_n)
  );

  //==============================================================================================
  //obl reset generate , option byte load module request reset
  //==============================================================================================
  assign obl_rst      = (~obl_done) || flash_obl_reload;

  //==============================================================================================
  //rcc vcore reset generate
  //==============================================================================================
  // assign rcc_vcore_rst   = pwr_por_rst || ~pwr_vcore_ok || ~obl_done;

  //==============================================================================================
  //cpu reset generate
  //==============================================================================================
  assign raw_c1_rst_n = sys_rst_n && d1_rst_n && (~wwdg1_out_rst);
  assign raw_c2_rst_n = sys_rst_n && d2_rst_n && (~wwdg2_out_rst);

  test_rst_mux u_c1_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_c1_rst_n),
      .testmode  (testmode),
      .rst_n     (c1_rst_n)
  );
  test_rst_mux u_c2_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_c2_rst_n),
      .testmode  (testmode),
      .rst_n     (c2_rst_n)
  );

  // to ensure c1 and c2 reset release after d1 and d2 reset release
  rcc_reset_sync #(
      .STAGE_NUM(2)
  ) u_c1_rst_n_delay (
      .src_rst_n(c1_rst_n),
      .clk      (rcc_c1_clk),
      .testmode (testmode),
      .gen_rst_n(raw_rcc_c1_rst_n)
  );

  rcc_reset_sync #(
      .STAGE_NUM(2)
  ) u_c2_rst_n_delay (
      .src_rst_n(c2_rst_n),
      .clk      (rcc_c2_clk),
      .testmode (testmode),
      .gen_rst_n(raw_rcc_c2_rst_n)
  );

  test_rst_mux u_rcc_c1_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_rcc_c1_rst_n),
      .testmode  (testmode),
      .rst_n     (rcc_c1_rst_n)
  );
  test_rst_mux u_rcc_c2_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_rcc_c2_rst_n),
      .testmode  (testmode),
      .rst_n     (rcc_c2_rst_n)
  );

  //================================================================
  // dx_bus_rst_n generate
  //================================================================

  assign raw_d1_bus_rst_n = sys_rst_n && d1_rst_n;
  assign raw_d2_bus_rst_n = sys_rst_n && d2_rst_n;
  assign raw_d3_bus_rst_n = sys_rst_n;

  test_rst_mux u_d1_bus_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_d1_bus_rst_n),
      .testmode  (testmode),
      .rst_n     (d1_bus_rst_n)
  );
  test_rst_mux u_d2_bus_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_d2_bus_rst_n),
      .testmode  (testmode),
      .rst_n     (d2_bus_rst_n)
  );
  test_rst_mux u_d3_bus_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_d3_bus_rst_n),
      .testmode  (testmode),
      .rst_n     (d3_bus_rst_n)
  );
  //==============================================================================================
  //vsw reset sync
  //==============================================================================================
  // to avoid combinational loop, use 2 flip flop to sync the vsw reset
  BB_signal_sync #(
      .STAGE_NUM(2),
      .DW       (1),
      .RST_VAL  ('b1)
  ) u_vsw_bdrst_sync (
      .src_signal(bdrst),
      .rst_n     (sys_rst_n),
      .clk       (pre_sys_clk),
      .gen_signal(sync_bdrst)
  );

  // to ensure that when pwr_vsw_rst is assert, sync_vsw_rst_n is asserted , even when sys_clk doesn't exist
  test_rst_mux u_pwr_vsw_rst_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(pwr_vsw_rst),
      .testmode  (testmode),
      .rst_n     (gen_pwr_vsw_rst)
  );
  rcc_reset_sync #(
      .STAGE_NUM(2)
  ) u_vsw_pwr_vsw_rst_sync (
      .src_rst_n(gen_pwr_vsw_rst),
      .clk      (pre_sys_clk),
      .testmode (testmode),
      .gen_rst_n(sync_pwr_vsw_rst)
  );

  assign raw_sync_vsw_rst_n = ~sync_bdrst && ~sync_pwr_vsw_rst;
  test_rst_mux u_sync_vsw_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(raw_sync_vsw_rst_n),
      .testmode  (testmode),
      .rst_n     (sync_vsw_rst_n)
  );
  //==============================================================================================
  //sys rst arcg 
  //==============================================================================================

  // system clock asynchoronous reset clock gating
  sync_reset_clk_gate #(
      .DELAY(CLK_ON_AFTER_SYS_RST_RELEASE)
  ) sys_clk_async_reset_clk_gate (
      .src_rst_n(sys_rst_n),
      .i_clk    (pre_sys_clk),
      .arcg_on  (rcc_arcg_on),
      .clk_en   (sys_clk_arcg_en)
  );

  //obl reset and clock generate
  sync_reset_clk_gate #(
      .DELAY(CLK_ON_AFTER_SYS_RST_RELEASE)
  ) rcc_obl_clk_async_reset_clk_gate (
      .src_rst_n(stby_rst_n),
      .i_clk    (pre_sys_clk),
      .arcg_on  (rcc_arcg_on),
      .clk_en   (rcc_obl_clk_arcg_en)
  );
  assign rcc_obl_rst_n = stby_rst_n;

  // d1 domain clock asynchoronous reset clock gating
  sync_reset_clk_gate #(
      .DELAY(CLK_ON_AFTER_D1_RST_RELEASE)
  ) d1_clk_async_reset_clk_gate (
      .src_rst_n(d1_rst_n),
      .i_clk    (sys_hpre_clk),
      .arcg_on  (rcc_arcg_on),
      .clk_en   (d1_clk_arcg_en)
  );

  // d2 domain clock asynchoronous reset clock gating
  sync_reset_clk_gate #(
      .DELAY(CLK_ON_AFTER_D2_RST_RELEASE)
  ) d2_clk_async_reset_clk_gate (
      .src_rst_n(d2_rst_n),
      .i_clk    (sys_hpre_clk),
      .arcg_on  (rcc_arcg_on),
      .clk_en   (d2_clk_arcg_en)
  );

  // cpu1 clock asynchoronous reset clock gating
  sync_reset_clk_gate #(
      .DELAY(CLK_ON_AFTER_CPU1_RST_RELEASE)
  ) cpu1_clk_async_reset_clk_gate (
      .src_rst_n(rcc_c1_rst_n),
      .i_clk    (sys_d1cpre_clk),
      .arcg_on  (rcc_arcg_on),
      .clk_en   (cpu1_clk_arcg_en)
  );
  // cpu2 clock asynchoronous reset clock gating
  sync_reset_clk_gate #(
      .DELAY(CLK_ON_AFTER_CPU2_RST_RELEASE)
  ) cpu2_clk_async_reset_clk_gate (
      .src_rst_n(rcc_c2_rst_n),
      .i_clk    (sys_hpre_clk),
      .arcg_on  (rcc_arcg_on),
      .clk_en   (cpu2_clk_arcg_en)
  );

  //==============================================================================================
  //==============================================================================================
  //  RCC sys clock gen
  //==============================================================================================
  //==============================================================================================

  //====================================================================
  // hsi_div
  //====================================================================

  rcc_hsi_div u_hsi_clk_div (
      .i_clk   (hsi_origin_clk),
      .rst_n   (hsi_ker_sync_sys_rst_n),
      .testmode(testmode),
      .div_sel (hsidiv),
      .o_clk   (raw_hsi_pre_clk)
  );

  test_clk_mux u_hsi_pre_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_hsi_pre_clk),
      .scan_mode(scan_mode),
      .gen_clk  (hsi_pre_clk)
  );
  //====================================================================
  //hsi clk gate
  //====================================================================

  en_as_clk_gating #(
      .RST_VAL(1)
  ) u_hsi_clk_gating (
      .raw_clk(hsi_pre_clk),
      .active (hsi_clk_en),
      .bypass (testmode),
      .rst_n  (hsi_ker_sync_sys_rst_n),
      .gen_clk(hsi_clk)
  );

  en_as_clk_gating #(
      .RST_VAL(1)
  ) u_hsi_ker_clk_gating (
      .raw_clk(hsi_pre_clk),
      .active (hsi_ker_clk_en),
      .bypass (testmode),
      .rst_n  (hsi_ker_sync_sys_rst_n),
      .gen_clk(hsi_ker_clk)
  );

  //====================================================================
  //hse clk gate
  //====================================================================
  assign hse_clk = hse_origin_clk;
  // en_as_clk_gating u_hse_clk_gating (
  //     .raw_clk(hse_origin_clk),
  //     .active (hse_clk_en),
  //     .bypass (testmode),
  //     .rst_n  (hse_sync_sys_rst_n),
  //     .gen_clk(hse_clk)
  // );

  //====================================================================
  //csi clock gate
  //====================================================================
  en_as_clk_gating #(
      .RST_VAL(1)
  ) u_csi_clk_gating (
      .raw_clk(csi_origin_clk),
      .active (csi_clk_en),
      .bypass (testmode),
      .rst_n  (csi_ker_sync_sys_rst_n),
      .gen_clk(csi_clk)
  );

  en_as_clk_gating #(
      .RST_VAL(1)
  ) u_csi_ker_clk_gating (
      .raw_clk(csi_origin_clk),
      .active (csi_ker_clk_en),
      .bypass (testmode),
      .rst_n  (csi_ker_sync_sys_rst_n),
      .gen_clk(csi_ker_clk)
  );
  //================================================================
  // hsi48_clk gating
  //================================================================
  assign hsi48_clk                = hsi48_origin_clk;
  //====================================================================
  // clock gate control 
  //====================================================================
  assign sys_clk_en               = (~rcc_sys_stop) && sys_clk_arcg_en;
  assign rcc_c1_clk_en            = ~c1_deepsleep && ~c1_sleep && cpu1_clk_arcg_en;
  assign rcc_c2_clk_en            = ~c2_deepsleep && ~c2_sleep && cpu2_clk_arcg_en;
  assign c2_sleep_mode            = c2_sleep && ~c2_deepsleep;
  assign c1_sleep_mode            = c1_sleep && ~c1_deepsleep;

  assign rcc_d1_bus_clk_en        = (~rcc_d1_stop) && d1_clk_arcg_en;
  assign rcc_d2_bus_clk_en        = (~rcc_d2_stop) && d2_clk_arcg_en;
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

  //option byte load module clock gating
  en_as_clk_gating #(
      .RST_VAL(1)
  ) u_obl_clk_gating (
      .raw_clk(pre_sys_clk),
      .active (rcc_obl_clk_arcg_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_obl_clk)
  );


  //====================================================================
  // HSI CSI clock control 
  //====================================================================

  assign hsi_clk_en     = hsi_rdy && (~rcc_sys_stop);
  assign hsi_ker_clk_en = hsi_rdy && (~rcc_sys_stop || hsi_ker_clk_req);
  assign csi_clk_en     = csi_rdy && (~rcc_sys_stop);
  assign csi_ker_clk_en = csi_rdy && (~rcc_sys_stop || csi_ker_clk_req);
  // assign hse_clk_en     = hse_rdy && ~hsecss_fail;

  //====================================================================
  // MCO clock out
  //====================================================================
  //MCO1
  assign mco1_clk_src   = {hsi48_clk, pll1_q_clk, hse_clk, lse_clk, hsi_clk};
  // assign mco1_scan_inc  = scan_mode && raw_mco1_pre_clk;

  mux_n_to_1 #(
      .N(5),
      .m(3)
  ) mco1_clk_switch_cell (
      .inp (mco1_clk_src),
      .sel (mco1sel),
      .mout(raw_mco1_pre_clk)
  );

  test_clk_mux u_mco1_pre_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_mco1_pre_clk),
      .scan_mode(scan_mode),
      .gen_clk  (mco1_pre_clk)
  );


  rcc_clk_div_d #(
      .RATIO_WID(4)
  ) u_mco1_clk_divider (
      .rst_n   (sys_rst_n),
      .i_clk   (mco1_pre_clk),
      .ratio   (mco1pre),
      .testmode(testmode),
      .o_clk   (mco1),
      .div_en  ()
  );
  //MCO2
  assign mco2_clk_src  = {lsi_clk, csi_clk, pll1_p_clk, hse_clk, pll2_p_clk, sys_clk};
  // assign mco2_scan_inc = scan_mode && raw_mco2_pre_clk;
  mux_n_to_1 #(
      .N(6),
      .m(3)
  ) mco2_clk_switch_cell (
      .inp (mco2_clk_src),
      .sel (mco2sel),
      .mout(raw_mco2_pre_clk)
  );

  test_clk_mux u_mco2_pre_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_mco2_pre_clk),
      .scan_mode(scan_mode),
      .gen_clk  (mco2_pre_clk)
  );

  rcc_clk_div_d #(
      .RATIO_WID(4)
  ) u_mco2_clk_divider (
      .rst_n   (sys_rst_n),
      .i_clk   (mco2_pre_clk),
      .ratio   (mco2pre),
      .testmode(testmode),
      .o_clk   (mco2),
      .div_en  ()
  );


  //====================================================================
  // hse_rtc_clk generate
  //====================================================================

  rcc_rtc_clk_div_d #(
      .RATIO_WID(6)
  ) u_hse_rtc_clk_div (
      .rst_n   (stby_rst_n),
      .i_clk   (hse_clk),
      .ratio   (rtcpre),
      .testmode(testmode),
      .o_clk   (hse_rtc_clk),
      .div_en  ()
  );


  //====================================================================
  //per_clk selection
  //====================================================================

  assign per_clk_src = {hse_clk, csi_ker_clk, hsi_ker_clk};

  glitch_free_clk_switch #(
      .CLK_NUM(3)
  ) u_per_clk_switch (
      .i_clk    (per_clk_src),
      .clk_fail ({hsecss_fail, 2'b0}),
      .rst_n    ({hse_sync_sys_rst_n, csi_ker_sync_sys_rst_n, hsi_ker_sync_sys_rst_n}),
      .sel      (clkpersel),
      .testmode (testmode),
      .scan_mode(scan_mode),
      .test_clk (test_clk),
      .o_clk    (per_clk)
  );

  //====================================================================
  //pll source clock generate
  //====================================================================

  assign pll_clk_src          = {hse_clk, csi_clk, hsi_clk};
  // assign pll_src_clk_scan_inc = scan_mode && raw_pll_src_clk;

  mux_n_to_1 #(
      .N(3),
      .m(2)
  ) u_pll_src_clk_switch (
      .inp (pll_clk_src),
      .sel (pllsrc),
      .mout(raw_pll_src_clk)
  );

  atspeed_test_clk_mux u_atspeed_test_clk_mux (
      .test_clk        (test_clk),
      .atspeed_test_clk(atspeed_test_clk),
      .func_clk        (raw_pll_src_clk),
      .scan_mode       (scan_mode),
      .atspeed_mode    (atspeed_mode),
      .gen_clk         (pll_src_clk)
  );

  rcc_clk_div_d #(
      .RATIO_WID(6)
  ) u_pll1_src_clk_div (
      .i_clk   (pll_src_clk),
      .rst_n   (sys_rst_n),
      .ratio   (divm1),
      .testmode(testmode),
      .o_clk   (pll1_src_clk),
      .div_en  ()
  );

  rcc_clk_div_d #(
      .RATIO_WID(6)
  ) u_pll2_src_clk_div (
      .i_clk   (pll_src_clk),
      .rst_n   (sys_rst_n),
      .ratio   (divm2),
      .testmode(testmode),
      .o_clk   (pll2_src_clk),
      .div_en  ()
  );

  rcc_clk_div_d #(
      .RATIO_WID(6)
  ) u_pll3_src_clk_div (
      .i_clk   (pll_src_clk),
      .rst_n   (sys_rst_n),
      .ratio   (divm3),
      .testmode(testmode),
      .o_clk   (pll3_src_clk),
      .div_en  ()
  );


  //====================================================================
  // system clock generate
  //====================================================================

  assign sys_clk_src = {pll1_p_clk, hse_clk, csi_clk, hsi_clk};

  sys_clk_switch #(
      .CLK_NUM(4)
  ) u_sys_clk_switch (
      .i_clk    (sys_clk_src),
      .clk_fail ({1'b0, hsecss_fail, 2'b0}),
      .rst_n    ({pll1_p_sync_sys_rst_n, hse_sync_sys_rst_n, csi_ker_sync_sys_rst_n, hsi_ker_sync_sys_rst_n}),
      .sel      (sw),
      .testmode (testmode),
      .scan_mode(scan_mode),
      .test_clk (test_clk),
      .o_clk    (pre_sys_clk)
  );

  en_as_clk_gating #(
      .RST_VAL(1)
  ) u_sys_clk_gating (
      .raw_clk(pre_sys_clk),
      .active (sys_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(sys_clk)
  );

  rcc_512_div u_sys_d1cpre_clk_divider (
      .i_clk  (sys_clk),
      .rst_n  (sys_rst_n),
      .div_sel(d1cpre),
      .div_en (),
      .o_clk  (raw_sys_d1cpre_clk)
  );

  test_clk_mux u_sys_d1cpre_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_sys_d1cpre_clk),
      .scan_mode(scan_mode),
      .gen_clk  (sys_d1cpre_clk)
  );
  //====================================================================
  // d1 domian clock generate
  //====================================================================

  en_as_clk_gating u_c1_clk_gating (
      .raw_clk(sys_d1cpre_clk),
      .active (rcc_c1_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_c1_clk)
  );

  assign rcc_fclk_c1 = rcc_c1_clk;

  clk_div_s #(
      .DIV_RATIO(8)
  ) u_c1_systick_clk_div (
      .i_clk (rcc_c1_clk),
      .rst_n (sys_rst_n),
      .o_clk (raw_rcc_c1_systick_clk),
      .div_en()
  );

  // rcc_c1_systick_clk test clock mux
  test_clk_mux u_rcc_c1_systick_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_c1_systick_clk),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_c1_systick_clk)
  );

  rcc_512_div u_sys_hpre_clk_divider (
      .i_clk  (sys_d1cpre_clk),
      .rst_n  (sys_rst_n),
      .div_sel(hpre),
      .div_en (c1_to_axi_div_en),
      .o_clk  (raw_sys_hpre_clk)
  );

  // sys_hpre_clk test clock mux
  test_clk_mux u_sys_hpre_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_sys_hpre_clk),
      .scan_mode(scan_mode),
      .gen_clk  (sys_hpre_clk)
  );

  en_as_clk_gating u_d1_bus_clk_gating (
      .raw_clk(sys_hpre_clk),
      .active (rcc_d1_bus_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_d1_bus_clk)
  );

  en_as_clk_gating u_axibridge_d1_clk_gating (
      .raw_clk(rcc_d1_bus_clk),
      .active (rcc_axibridge_d1_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_axibridge_d1_clk)
  );

  en_as_clk_gating u_ahb3bridge_d1_clk_gating (
      .raw_clk(rcc_d1_bus_clk),
      .active (rcc_ahb3bridge_d1_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_ahb3bridge_d1_clk)
  );

  rcc_16_div u_rcc_d2_bus_clk_divider (
      .i_clk  (rcc_d1_bus_clk),
      .rst_n  (sys_rst_n),
      .div_sel(d1ppre),
      .div_en (d1_h2b_div_en),
      .o_clk  (raw_rcc_apb3bridge_d1_pre_clk)
  );

  // rcc_apb3bridge_d1_pre_clk test clock mux
  test_clk_mux u_rcc_apb3bridge_d1_pre_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_apb3bridge_d1_pre_clk),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_apb3bridge_d1_pre_clk)
  );

  en_as_clk_gating u_apb3bridge_d1_clk_gating (
      .raw_clk(rcc_apb3bridge_d1_pre_clk),
      .active (rcc_apb3bridge_d1_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_apb3bridge_d1_clk)
  );

  //====================================================================
  // d2 domian clock generate
  //====================================================================

  en_as_clk_gating u_c2_clk_gating (
      .raw_clk(sys_hpre_clk),
      .active (rcc_c2_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_c2_clk)
  );

  assign rcc_fclk_c2 = rcc_c2_clk;

  clk_div_s #(
      .DIV_RATIO(8)
  ) u_c2_systick_clk_div (
      .i_clk (rcc_c2_clk),
      .rst_n (sys_rst_n),
      .o_clk (raw_rcc_c2_systick_clk),
      .div_en()
  );
  // rcc_c2_systick_clk test clock mux
  test_clk_mux u_rcc_c2_systick_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_c2_systick_clk),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_c2_systick_clk)
  );

  en_as_clk_gating u_d2_bus_clk_gating (
      .raw_clk(sys_hpre_clk),
      .active (rcc_d2_bus_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_d2_bus_clk)
  );

  en_as_clk_gating u_ahb1bridge_d2_clk_gating (
      .raw_clk(rcc_d2_bus_clk),
      .active (rcc_ahb1bridge_d2_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_ahb1bridge_d2_clk)
  );

  en_as_clk_gating u_ahb2bridge_d2_clk_gating (
      .raw_clk(rcc_d2_bus_clk),
      .active (rcc_ahb2bridge_d2_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_ahb2bridge_d2_clk)
  );

  rcc_pclk_timer_div u_rcc_apb1clk_timer_div (
      .i_clk      (rcc_d2_bus_clk),
      .rst_n      (sys_rst_n),
      .div_sel    (d2ppre1),
      .div_en     (d2_h2b1_div_en),
      .timpre     (timpre),
      .tim_ker_clk(raw_rcc_timx_ker_clk),
      .pclk       (raw_rcc_apb1bridge_d2_pre_clk)
  );

  // rcc_timx_ker_clk test clock mux
  test_clk_mux u_rcc_timx_ker_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_timx_ker_clk),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_timx_ker_clk)
  );

  // rcc_apb1bridge_d2_pre_clk test clock mux
  test_clk_mux u_rcc_apb1bridge_d2_pre_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_apb1bridge_d2_pre_clk),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_apb1bridge_d2_pre_clk)
  );

  en_as_clk_gating u_apb1bridge_d2_clk_gate (
      .raw_clk(rcc_apb1bridge_d2_pre_clk),
      .active (rcc_apb1bridge_d2_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_apb1bridge_d2_clk)
  );

  rcc_pclk_timer_div u_rcc_apb2clk_timer_div (
      .i_clk      (rcc_d2_bus_clk),
      .rst_n      (sys_rst_n),
      .div_sel    (d2ppre2),
      .div_en     (d2_h2b2_div_en),
      .timpre     (timpre),
      .tim_ker_clk(raw_rcc_timy_ker_clk),
      .pclk       (raw_rcc_apb2bridge_d2_pre_clk)
  );

  // rcc_timy_ker_clk test clock mux
  test_clk_mux u_rcc_timy_ker_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_timy_ker_clk),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_timy_ker_clk)
  );

  // rcc_apb2bridge_d2_pre_clk test clock mux
  test_clk_mux u_rcc_apb2bridge_d2_pre_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_apb2bridge_d2_pre_clk),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_apb2bridge_d2_pre_clk)
  );

  en_as_clk_gating u_apb2bridge_d2_clk_gate (
      .raw_clk(rcc_apb2bridge_d2_pre_clk),
      .active (rcc_apb2bridge_d2_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_apb2bridge_d2_clk)
  );

  // hrtimer_prescalar_clk_mux , 1: rcc_c1_clk 0: rcc_timy_ker_clk
  BB_mux_cell u_hrtimer_prescalar_clk_mux_cell (
      .ina(rcc_timy_ker_clk),              // 0
      .inb(rcc_c1_clk),                    // 1
      .sel(hrtimsel),
      .out(raw_rcc_hrtimer_prescalar_clk)
  );

  // rcc_hrtimer_prescalar_clk test clock mux
  test_clk_mux u_rcc_hrtimer_prescalar_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_hrtimer_prescalar_clk),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_hrtimer_prescalar_clk)
  );

  //====================================================================
  // d3 domian clock generate
  //====================================================================

  en_as_clk_gating u_d3_bus_clk_gating (
      .raw_clk(sys_hpre_clk),
      .active (rcc_d3_bus_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_d3_bus_clk)
  );

  en_as_clk_gating u_ahb4bridge_d3_clk_gating (
      .raw_clk(rcc_d3_bus_clk),
      .active (rcc_ahb4bridge_d3_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_ahb4bridge_d3_clk)
  );

  rcc_16_div u_rcc_d3_bus_clk_divider (
      .i_clk  (rcc_d3_bus_clk),
      .rst_n  (sys_rst_n),
      .div_sel(d3ppre),
      .div_en (d3_h2b_div_en),
      .o_clk  (raw_rcc_apb4bridge_d3_pre_clk)
  );

  // rcc_apb4bridge_d3_pre_clk test clock mux
  test_clk_mux u_rcc_apb4bridge_d3_pre_clk_tmux (
      .test_clk (test_clk),
      .func_clk (raw_rcc_apb4bridge_d3_pre_clk),
      .scan_mode(scan_mode),
      .gen_clk  (rcc_apb4bridge_d3_pre_clk)
  );

  en_as_clk_gating u_apb4bridge_d3_clk_gate (
      .raw_clk(rcc_apb4bridge_d3_pre_clk),
      .active (rcc_apb4bridge_d3_clk_en),
      .bypass (testmode),
      .rst_n  (sys_rst_n),
      .gen_clk(rcc_apb4bridge_d3_clk)
  );

endmodule
