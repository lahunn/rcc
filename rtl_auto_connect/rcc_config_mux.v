module rcc_config_mux (
    //================================================================
    // original signals
    //================================================================
    //select signals
    input  [1:0] raw_pllsrc,
    input  [2:0] raw_mco1sel,
    input  [2:0] raw_mco2sel,
    input  [1:0] raw_sw,
    input        raw_hrtimsel,
    input  [1:0] raw_clkpersel,
    //division ratio signals
    input  [1:0] raw_hsidiv,
    input  [5:0] raw_divm1,
    input  [5:0] raw_divm2,
    input  [5:0] raw_divm3,
    input  [3:0] raw_mco1pre,
    input  [3:0] raw_mco2pre,
    input  [5:0] raw_rtcpre,
    input  [3:0] raw_d1cpre,
    input  [2:0] raw_d1ppre,
    input  [3:0] raw_hpre,
    input  [2:0] raw_d2ppre1,
    input  [2:0] raw_d2ppre2,
    input  [2:0] raw_d3ppre,
    input        raw_timpre,
    input        mac1_rcc_fes,
    input        mac1_rcc_epis_2,
    input        mac2_rcc_fes,
    input        mac2_rcc_epis_2,
    //================================================================
    // test mode signals
    //================================================================
    // input        scan_mode,
    input        atspeed_mode,
    //select signals
    input  [1:0] test_pllsrc,
    input  [2:0] test_mco1sel,
    input  [2:0] test_mco2sel,
    input  [1:0] test_sw,
    input        test_hrtimsel,
    input  [1:0] test_clkpersel,
    //division ratio signals
    input  [1:0] test_hsidiv,
    input  [5:0] test_divm1,
    input  [5:0] test_divm2,
    input  [5:0] test_divm3,
    input  [3:0] test_mco1pre,
    input  [3:0] test_mco2pre,
    input  [5:0] test_rtcpre,
    input  [3:0] test_d1cpre,
    input  [2:0] test_d1ppre,
    input  [3:0] test_hpre,
    input  [2:0] test_d2ppre1,
    input  [2:0] test_d2ppre2,
    input  [2:0] test_d3ppre,
    input        test_timpre,
    input        test_mac1_rcc_fes,
    input        test_mac1_rcc_epis_2,
    input        test_mac2_rcc_fes,
    input        test_mac2_rcc_epis_2,
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
    output       gen_mac1_rcc_fes,
    output       gen_mac1_rcc_epis_2,
    output       gen_mac2_rcc_fes,
    output       gen_mac2_rcc_epis_2
);

  nbit_mux #(
      .WIDTH(2)
  ) u_pllsrc_mux (
      .in0(raw_pllsrc),
      .in1(test_pllsrc),
      .sel(atspeed_mode),
      .out(pllsrc)
  );

  nbit_mux #(
      .WIDTH(3)
  ) u_mco1sel_mux (
      .in0(raw_mco1sel),
      .in1(test_mco1sel),
      .sel(atspeed_mode),
      .out(mco1sel)
  );

  nbit_mux #(
      .WIDTH(3)
  ) u_mco2sel_mux (
      .in0(raw_mco2sel),
      .in1(test_mco2sel),
      .sel(atspeed_mode),
      .out(mco2sel)
  );

  nbit_mux #(
      .WIDTH(2)
  ) u_sw_mux (
      .in0(raw_sw),
      .in1(test_sw),
      .sel(atspeed_mode),
      .out(sw)
  );

  nbit_mux #(
      .WIDTH(1)
  ) u_hrtimsel_mux (
      .in0(raw_hrtimsel),
      .in1(test_hrtimsel),
      .sel(atspeed_mode),
      .out(hrtimsel)
  );

  nbit_mux #(
      .WIDTH(2)
  ) u_clkpersel_mux (
      .in0(raw_clkpersel),
      .in1(test_clkpersel),
      .sel(atspeed_mode),
      .out(clkpersel)
  );

  nbit_mux #(
      .WIDTH(2)
  ) u_hsidiv_mux (
      .in0(raw_hsidiv),
      .in1(test_hsidiv),
      .sel(atspeed_mode),
      .out(hsidiv)
  );

  nbit_mux #(
      .WIDTH(6)
  ) u_divm1_mux (
      .in0(raw_divm1),
      .in1(test_divm1),
      .sel(atspeed_mode),
      .out(divm1)
  );

  nbit_mux #(
      .WIDTH(6)
  ) u_divm2_mux (
      .in0(raw_divm2),
      .in1(test_divm2),
      .sel(atspeed_mode),
      .out(divm2)
  );

  nbit_mux #(
      .WIDTH(6)
  ) u_divm3_mux (
      .in0(raw_divm3),
      .in1(test_divm3),
      .sel(atspeed_mode),
      .out(divm3)
  );

  nbit_mux #(
      .WIDTH(4)
  ) u_mco1pre_mux (
      .in0(raw_mco1pre),
      .in1(test_mco1pre),
      .sel(atspeed_mode),
      .out(mco1pre)
  );

  nbit_mux #(
      .WIDTH(4)
  ) u_mco2pre_mux (
      .in0(raw_mco2pre),
      .in1(test_mco2pre),
      .sel(atspeed_mode),
      .out(mco2pre)
  );

  nbit_mux #(
      .WIDTH(6)
  ) u_rtcpre_mux (
      .in0(raw_rtcpre),
      .in1(test_rtcpre),
      .sel(atspeed_mode),
      .out(rtcpre)
  );

  nbit_mux #(
      .WIDTH(4)
  ) u_d1cpre_mux (
      .in0(raw_d1cpre),
      .in1(test_d1cpre),
      .sel(atspeed_mode),
      .out(d1cpre)
  );

  nbit_mux #(
      .WIDTH(3)
  ) u_d1ppre_mux (
      .in0(raw_d1ppre),
      .in1(test_d1ppre),
      .sel(atspeed_mode),
      .out(d1ppre)
  );

  nbit_mux #(
      .WIDTH(4)
  ) u_hpre_mux (
      .in0(raw_hpre),
      .in1(test_hpre),
      .sel(atspeed_mode),
      .out(hpre)
  );

  nbit_mux #(
      .WIDTH(3)
  ) u_d2ppre1_mux (
      .in0(raw_d2ppre1),
      .in1(test_d2ppre1),
      .sel(atspeed_mode),
      .out(d2ppre1)
  );

  nbit_mux #(
      .WIDTH(3)
  ) u_d2ppre2_mux (
      .in0(raw_d2ppre2),
      .in1(test_d2ppre2),
      .sel(atspeed_mode),
      .out(d2ppre2)
  );

  nbit_mux #(
      .WIDTH(3)
  ) u_d3ppre_mux (
      .in0(raw_d3ppre),
      .in1(test_d3ppre),
      .sel(atspeed_mode),
      .out(d3ppre)
  );

  nbit_mux #(
      .WIDTH(1)
  ) u_timpre_mux (
      .in0(raw_timpre),
      .in1(test_timpre),
      .sel(atspeed_mode),
      .out(timpre)
  );

  nbit_mux #(
      .WIDTH(1)
  ) u_mac1_rcc_fes_mux (
      .in0(mac1_rcc_fes),
      .in1(test_mac1_rcc_fes),
      .sel(atspeed_mode),
      .out(gen_mac1_rcc_fes)
  );

  nbit_mux #(
      .WIDTH(1)
  ) u_mac1_rcc_epis_2_mux (
      .in0(mac1_rcc_epis_2),
      .in1(test_mac1_rcc_epis_2),
      .sel(atspeed_mode),
      .out(gen_mac1_rcc_epis_2)
  );

  nbit_mux #(
      .WIDTH(1)
  ) u_mac2_rcc_fes_mux (
      .in0(mac2_rcc_fes),
      .in1(test_mac2_rcc_fes),
      .sel(atspeed_mode),
      .out(gen_mac2_rcc_fes)
  );

  nbit_mux #(
      .WIDTH(1)
  ) u_mac2_rcc_epis_2_mux (
      .in0(mac2_rcc_epis_2),
      .in1(test_mac2_rcc_epis_2),
      .sel(atspeed_mode),
      .out(gen_mac2_rcc_epis_2)
  );


endmodule
