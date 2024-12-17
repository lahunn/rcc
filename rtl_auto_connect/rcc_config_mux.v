module rcc_config_mux (
    //================================================================
    // original signals
    //================================================================
    //select signals
    input [1:0] raw_pllsrc,
    input [2:0] raw_mco1sel,
    input [2:0] raw_mco2sel,
    input [1:0] raw_sw,
    input       raw_hrtimsel,
    input [1:0] raw_clkpersel,
    //division ratio signals
    input [1:0] raw_hsidiv,
    input [5:0] raw_divm1,
    input [5:0] raw_divm2,
    input [5:0] raw_divm3,
    input [3:0] raw_mco1pre,
    input [3:0] raw_mco2pre,
    input [5:0] raw_rtcpre,
    input [3:0] raw_d1cpre,
    input [2:0] raw_d1ppre,
    input [3:0] raw_hpre,
    input [2:0] raw_d2ppre1,
    input [2:0] raw_d2ppre2,
    input [2:0] raw_d3ppre,
    input       raw_timpre,
    input       raw_mac1_rcc_fes,
    input       raw_mac1_rcc_epis_2,
    input       raw_mac2_rcc_fes,
    input       raw_mac2_rcc_epis_2,
    //================================================================
    // test mode signals
    //================================================================
    // input        scan_mode,
    input       atspeed_mode,
    input       mbist_mode,
    //================================================================
    // sel and div signals at atspeed mode
    //================================================================
    //select signals for atspeed mode
    input [1:0] atspeed_pllsrc,
    input [2:0] atspeed_mco1sel,
    input [2:0] atspeed_mco2sel,
    input [1:0] atspeed_sw,
    input       atspeed_hrtimsel,
    input [1:0] atspeed_clkpersel,
    //division ratio signals for atspeed mode
    input [1:0] atspeed_hsidiv,
    input [5:0] atspeed_divm1,
    input [5:0] atspeed_divm2,
    input [5:0] atspeed_divm3,
    input [3:0] atspeed_mco1pre,
    input [3:0] atspeed_mco2pre,
    input [5:0] atspeed_rtcpre,
    input [3:0] atspeed_d1cpre,
    input [2:0] atspeed_d1ppre,
    input [3:0] atspeed_hpre,
    input [2:0] atspeed_d2ppre1,
    input [2:0] atspeed_d2ppre2,
    input [2:0] atspeed_d3ppre,
    input       atspeed_timpre,
    input       atspeed_mac1_rcc_fes,
    input       atspeed_mac1_rcc_epis_2,
    input       atspeed_mac2_rcc_fes,
    input       atspeed_mac2_rcc_epis_2,

    //================================================================
    // sel and div signals at mbist mode
    //================================================================
    input [1:0] mbist_pllsrc,
    input [2:0] mbist_mco1sel,
    input [2:0] mbist_mco2sel,
    input [1:0] mbist_sw,
    input       mbist_hrtimsel,
    input [1:0] mbist_clkpersel,
    //division ratio signals for mbist mode
    input [1:0] mbist_hsidiv,
    input [5:0] mbist_divm1,
    input [5:0] mbist_divm2,
    input [5:0] mbist_divm3,
    input [3:0] mbist_mco1pre,
    input [3:0] mbist_mco2pre,
    input [5:0] mbist_rtcpre,
    input [3:0] mbist_d1cpre,
    input [2:0] mbist_d1ppre,
    input [3:0] mbist_hpre,
    input [2:0] mbist_d2ppre1,
    input [2:0] mbist_d2ppre2,
    input [2:0] mbist_d3ppre,
    input       mbist_timpre,
    input       mbist_mac1_rcc_fes,
    input       mbist_mac1_rcc_epis_2,
    input       mbist_mac2_rcc_fes,
    input       mbist_mac2_rcc_epis_2,

    //================================================================
    // output signals
    //================================================================
    //select signals
    output [1:0] pllsrc,
    output [2:0] mco1sel,
    output [2:0] mco2sel,
    output [1:0] sw,
    output       hrtimsel,
    output [1:0] clkpersel,
    //division ratio signals
    output [1:0] hsidiv,
    output [5:0] divm1,
    output [5:0] divm2,
    output [5:0] divm3,
    output [3:0] mco1pre,
    output [3:0] mco2pre,
    output [5:0] rtcpre,
    output [3:0] d1cpre,
    output [2:0] d1ppre,
    output [3:0] hpre,
    output [2:0] d2ppre1,
    output [2:0] d2ppre2,
    output [2:0] d3ppre,
    output       timpre,
    output       mac1_rcc_fes,
    output       mac1_rcc_epis_2,
    output       mac2_rcc_fes,
    output       mac2_rcc_epis_2
);

  nbit_mux_3 #(
      .WIDTH(2)
  ) u_pllsrc_mux (
      .in0(raw_pllsrc),
      .in1(atspeed_pllsrc),
      .in2(mbist_pllsrc),
      .sel({mbist_mode, atspeed_mode}),
      .out(pllsrc)
  );

  nbit_mux_3 #(
      .WIDTH(3)
  ) u_mco1sel_mux (
      .in0(raw_mco1sel),
      .in1(atspeed_mco1sel),
      .in2(mbist_mco1sel),
      .sel({mbist_mode, atspeed_mode}),
      .out(mco1sel)
  );
  nbit_mux_3 #(
      .WIDTH(3)
  ) u_mco2sel_mux (
      .in0(raw_mco2sel),
      .in1(atspeed_mco2sel),
      .in2(mbist_mco2sel),
      .sel({mbist_mode, atspeed_mode}),
      .out(mco2sel)
  );

  nbit_mux_3 #(
      .WIDTH(2)
  ) u_sw_mux (
      .in0(raw_sw),
      .in1(atspeed_sw),
      .in2(mbist_sw),
      .sel({mbist_mode, atspeed_mode}),
      .out(sw)
  );

  nbit_mux_3 #(
      .WIDTH(1)
  ) u_hrtimsel_mux (
      .in0(raw_hrtimsel),
      .in1(atspeed_hrtimsel),
      .in2(mbist_hrtimsel),
      .sel({mbist_mode, atspeed_mode}),
      .out(hrtimsel)
  );

  nbit_mux_3 #(
      .WIDTH(2)
  ) u_clkpersel_mux (
      .in0(raw_clkpersel),
      .in1(atspeed_clkpersel),
      .in2(mbist_clkpersel),
      .sel({mbist_mode, atspeed_mode}),
      .out(clkpersel)
  );

  nbit_mux_3 #(
      .WIDTH(2)
  ) u_hsidiv_mux (
      .in0(raw_hsidiv),
      .in1(atspeed_hsidiv),
      .in2(mbist_hsidiv),
      .sel({mbist_mode, atspeed_mode}),
      .out(hsidiv)
  );

  nbit_mux_3 #(
      .WIDTH(6)
  ) u_divm1_mux (
      .in0(raw_divm1),
      .in1(atspeed_divm1),
      .in2(mbist_divm1),
      .sel({mbist_mode, atspeed_mode}),
      .out(divm1)
  );

  nbit_mux_3 #(
      .WIDTH(6)
  ) u_divm2_mux (
      .in0(raw_divm2),
      .in1(atspeed_divm2),
      .in2(mbist_divm2),
      .sel({mbist_mode, atspeed_mode}),
      .out(divm2)
  );

  nbit_mux_3 #(
      .WIDTH(6)
  ) u_divm3_mux (
      .in0(raw_divm3),
      .in1(atspeed_divm3),
      .in2(mbist_divm3),
      .sel({mbist_mode, atspeed_mode}),
      .out(divm3)
  );

  nbit_mux_3 #(
      .WIDTH(4)
  ) u_mco1pre_mux (
      .in0(raw_mco1pre),
      .in1(atspeed_mco1pre),
      .in2(mbist_mco1pre),
      .sel({mbist_mode, atspeed_mode}),
      .out(mco1pre)
  );

  nbit_mux_3 #(
      .WIDTH(4)
  ) u_mco2pre_mux (
      .in0(raw_mco2pre),
      .in1(atspeed_mco2pre),
      .in2(mbist_mco2pre),
      .sel({mbist_mode, atspeed_mode}),
      .out(mco2pre)
  );

  nbit_mux_3 #(
      .WIDTH(6)
  ) u_rtcpre_mux (
      .in0(raw_rtcpre),
      .in1(atspeed_rtcpre),
      .in2(mbist_rtcpre),
      .sel({mbist_mode, atspeed_mode}),
      .out(rtcpre)
  );

  nbit_mux_3 #(
      .WIDTH(4)
  ) u_d1cpre_mux (
      .in0(raw_d1cpre),
      .in1(atspeed_d1cpre),
      .in2(mbist_d1cpre),
      .sel({mbist_mode, atspeed_mode}),
      .out(d1cpre)
  );

  nbit_mux_3 #(
      .WIDTH(3)
  ) u_d1ppre_mux (
      .in0(raw_d1ppre),
      .in1(atspeed_d1ppre),
      .in2(mbist_d1ppre),
      .sel({mbist_mode, atspeed_mode}),
      .out(d1ppre)
  );

  nbit_mux_3 #(
      .WIDTH(4)
  ) u_hpre_mux (
      .in0(raw_hpre),
      .in1(atspeed_hpre),
      .in2(mbist_hpre),
      .sel({mbist_mode, atspeed_mode}),
      .out(hpre)
  );

  nbit_mux_3 #(
      .WIDTH(3)
  ) u_d2ppre1_mux (
      .in0(raw_d2ppre1),
      .in1(atspeed_d2ppre1),
      .in2(mbist_d2ppre1),
      .sel({mbist_mode, atspeed_mode}),
      .out(d2ppre1)
  );

  nbit_mux_3 #(
      .WIDTH(3)
  ) u_d2ppre2_mux (
      .in0(raw_d2ppre2),
      .in1(atspeed_d2ppre2),
      .in2(mbist_d2ppre2),
      .sel({mbist_mode, atspeed_mode}),
      .out(d2ppre2)
  );

  nbit_mux_3 #(
      .WIDTH(3)
  ) u_d3ppre_mux (
      .in0(raw_d3ppre),
      .in1(atspeed_d3ppre),
      .in2(mbist_d3ppre),
      .sel({mbist_mode, atspeed_mode}),
      .out(d3ppre)
  );

  nbit_mux_3 #(
      .WIDTH(1)
  ) u_timpre_mux (
      .in0(raw_timpre),
      .in1(atspeed_timpre),
      .in2(mbist_timpre),
      .sel({mbist_mode, atspeed_mode}),
      .out(timpre)
  );

  nbit_mux_3 #(
      .WIDTH(1)
  ) u_mac1_rcc_fes_mux (
      .in0(raw_mac1_rcc_fes),
      .in1(atspeed_mac1_rcc_fes),
      .in2(mbist_mac1_rcc_fes),
      .sel({mbist_mode, atspeed_mode}),
      .out(mac1_rcc_fes)
  );

  nbit_mux_3 #(
      .WIDTH(1)
  ) u_mac1_rcc_epis_2_mux (
      .in0(raw_mac1_rcc_epis_2),
      .in1(atspeed_mac1_rcc_epis_2),
      .in2(mbist_mac1_rcc_epis_2),
      .sel({mbist_mode, atspeed_mode}),
      .out(mac1_rcc_epis_2)
  );

  nbit_mux_3 #(
      .WIDTH(1)
  ) u_mac2_rcc_fes_mux (
      .in0(raw_mac2_rcc_fes),
      .in1(atspeed_mac2_rcc_fes),
      .in2(mbist_mac2_rcc_fes),
      .sel({mbist_mode, atspeed_mode}),
      .out(mac2_rcc_fes)
  );

  nbit_mux_3 #(
      .WIDTH(1)
  ) u_mac2_rcc_epis_2_mux (
      .in0(raw_mac2_rcc_epis_2),
      .in1(atspeed_mac2_rcc_epis_2),
      .in2(mbist_mac2_rcc_epis_2),
      .sel({mbist_mode, atspeed_mode}),
      .out(mac2_rcc_epis_2)
  );


endmodule
