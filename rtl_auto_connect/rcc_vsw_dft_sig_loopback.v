module rcc_vsw_dft_sig_loopback (
    //================================================================
    // testmode signals
    //================================================================
    input       testmode,
    input       func_nxt_rcc_bdcr_bdrst,     // vcore to vsw
    input       func_nxt_rcc_bdcr_lsebyp,    // vcore to vsw
    input       func_nxt_rcc_bdcr_lsecsson,  // vcore to vsw
    input [1:0] func_nxt_rcc_bdcr_lsedrv,    // vcore to vsw
    input       func_nxt_rcc_bdcr_lseon,     // vcore to vsw
    input       func_nxt_rcc_bdcr_rtcen,     // vcore to vsw
    input [1:0] func_nxt_rcc_bdcr_rtcsel,    // vcore to vsw

    output       gen_nxt_rcc_bdcr_bdrst,     // vcore to vsw
    output       gen_nxt_rcc_bdcr_lsebyp,    // vcore to vsw
    output       gen_nxt_rcc_bdcr_lsecsson,  // vcore to vsw
    output [1:0] gen_nxt_rcc_bdcr_lsedrv,    // vcore to vsw
    output       gen_nxt_rcc_bdcr_lseon,     // vcore to vsw
    output       gen_nxt_rcc_bdcr_rtcen,     // vcore to vsw
    output [1:0] gen_nxt_rcc_bdcr_rtcsel,    // vcore to vsw

    input       cur_rcc_bdcr_bdrst,     // vsw to vcore
    input       cur_rcc_bdcr_lsebyp,    // vsw to vcore
    input       cur_rcc_bdcr_lsecssd,   // vsw to vcore
    input       cur_rcc_bdcr_lsecsson,  // vsw to vcore
    input [1:0] cur_rcc_bdcr_lsedrv,    // vsw to vcore
    input       cur_rcc_bdcr_lseon,     // vsw to vcore
    input       cur_rcc_bdcr_rtcen,     // vsw to vcore
    input [1:0] cur_rcc_bdcr_rtcsel     // vsw to vcore
);

  wire       test_nxt_rcc_bdcr_bdrst;  // vcore to vsw
  wire       test_nxt_rcc_bdcr_lsebyp;  // vcore to vsw
  wire       test_nxt_rcc_bdcr_lsecsson;  // vcore to vsw
  wire [1:0] test_nxt_rcc_bdcr_lsedrv;  // vcore to vsw
  wire       test_nxt_rcc_bdcr_lseon;  // vcore to vsw
  wire       test_nxt_rcc_bdcr_rtcen;  // vcore to vsw
  wire [1:0] test_nxt_rcc_bdcr_rtcsel;  // vcore to vsw
  //================================================================
  // test signal assignment
  //================================================================
  assign test_nxt_rcc_bdcr_bdrst    = cur_rcc_bdcr_bdrst;
  assign test_nxt_rcc_bdcr_lsebyp   = cur_rcc_bdcr_lsebyp;
  assign test_nxt_rcc_bdcr_lsecsson = cur_rcc_bdcr_lsecssd;
  assign test_nxt_rcc_bdcr_lsedrv   = cur_rcc_bdcr_lsedrv;
  assign test_nxt_rcc_bdcr_lseon    = cur_rcc_bdcr_lsecsson;
  assign test_nxt_rcc_bdcr_rtcen    = cur_rcc_bdcr_lseon ^ cur_rcc_bdcr_rtcen;
  assign test_nxt_rcc_bdcr_rtcsel   = cur_rcc_bdcr_rtcsel;

  //================================================================
  // test mux
  //================================================================
  BB_mux_cell u_nxt_rcc_bdcr_bdrst_mux (
      .ina(func_nxt_rcc_bdcr_bdrst),  // 0
      .inb(test_nxt_rcc_bdcr_bdrst),  // 1
      .sel(testmode),
      .out(gen_nxt_rcc_bdcr_bdrst)
  );
  BB_mux_cell u_nxt_rcc_bdcr_lsebyp_mux (
      .ina(func_nxt_rcc_bdcr_lsebyp),  // 0
      .inb(test_nxt_rcc_bdcr_lsebyp),  // 1
      .sel(testmode),
      .out(gen_nxt_rcc_bdcr_lsebyp)
  );

  BB_mux_cell u_nxt_rcc_bdcr_lsecsson_mux (
      .ina(func_nxt_rcc_bdcr_lsecsson),  // 0
      .inb(test_nxt_rcc_bdcr_lsecsson),  // 1
      .sel(testmode),
      .out(gen_nxt_rcc_bdcr_lsecsson)
  );

  BB_mux_cell u_nxt_rcc_bdcr_lsedrv_mux_0 (
      .ina(func_nxt_rcc_bdcr_lsedrv[0]),  // 0
      .inb(test_nxt_rcc_bdcr_lsedrv[0]),  // 1
      .sel(testmode),
      .out(gen_nxt_rcc_bdcr_lsedrv[0])
  );

  BB_mux_cell u_nxt_rcc_bdcr_lsedrv_mux_1 (
      .ina(func_nxt_rcc_bdcr_lsedrv[1]),  // 0
      .inb(test_nxt_rcc_bdcr_lsedrv[1]),  // 1
      .sel(testmode),
      .out(gen_nxt_rcc_bdcr_lsedrv[1])
  );

  BB_mux_cell u_nxt_rcc_bdcr_lseon_mux (
      .ina(func_nxt_rcc_bdcr_lseon),  // 0
      .inb(test_nxt_rcc_bdcr_lseon),  // 1
      .sel(testmode),
      .out(gen_nxt_rcc_bdcr_lseon)
  );

  BB_mux_cell u_nxt_rcc_bdcr_rtcen_mux (
      .ina(func_nxt_rcc_bdcr_rtcen),  // 0
      .inb(test_nxt_rcc_bdcr_rtcen),  // 1
      .sel(testmode),
      .out(gen_nxt_rcc_bdcr_rtcen)
  );

  BB_mux_cell u_nxt_rcc_bdcr_rtcsel_mux_0 (
      .ina(func_nxt_rcc_bdcr_rtcsel[0]),  // 0
      .inb(test_nxt_rcc_bdcr_rtcsel[0]),  // 1
      .sel(testmode),
      .out(gen_nxt_rcc_bdcr_rtcsel[0])
  );

  BB_mux_cell u_nxt_rcc_bdcr_rtcsel_mux_1 (
      .ina(func_nxt_rcc_bdcr_rtcsel[1]),  // 0
      .inb(test_nxt_rcc_bdcr_rtcsel[1]),  // 1
      .sel(testmode),
      .out(gen_nxt_rcc_bdcr_rtcsel[1])
  );


endmodule
