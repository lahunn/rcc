module rcc_vcore_dft_sig_loopback (
    //================================================================
    // testmode signals
    //================================================================
    input        testmode,
    //================================================================
    // function outputs
    //================================================================
    input        rcc_vdd_wdata,                  //low to high level, default 0
    input        nxt_rcc_bdcr_bdrst,             // vcore to vsw
    input        nxt_rcc_bdcr_lsebyp,            // vcore to vsw
    input        nxt_rcc_bdcr_lsecsson,          // vcore to vsw
    input  [1:0] nxt_rcc_bdcr_lsedrv,            // vcore to vsw
    input        nxt_rcc_bdcr_lseon,             // vcore to vsw
    input        nxt_rcc_bdcr_rtcen,             // vcore to vsw
    input  [1:0] nxt_rcc_bdcr_rtcsel,            // vcore to vsw
    //================================================================
    // function inputs
    //================================================================
    input        func_cur_rcc_bdcr_bdrst,        // vsw to vcore
    input        func_cur_rcc_bdcr_lsebyp,       // vsw to vcore
    input        func_cur_rcc_bdcr_lsecssd,      // vsw to vcore
    input        func_cur_rcc_bdcr_lsecsson,     // vsw to vcore
    input  [1:0] func_cur_rcc_bdcr_lsedrv,       // vsw to vcore
    input        func_cur_rcc_bdcr_lseon,        // vsw to vcore
    input        func_cur_rcc_bdcr_rtcen,        // vsw to vcore
    input  [1:0] func_cur_rcc_bdcr_rtcsel,       // vsw to vcore
    // rcc_vdd_reg Outputs
    input        func_cur_rcc_c1_rsr_lpwr2rstf,  //vdd to vcore
    input        func_cur_rcc_c1_rsr_lpwr1rstf,  //vdd to vcore
    input        func_cur_rcc_c1_rsr_wwdg2rstf,  //vdd to vcore
    input        func_cur_rcc_c1_rsr_wwdg1rstf,  //vdd to vcore
    input        func_cur_rcc_c1_rsr_iwdg2rstf,  //vdd to vcore
    input        func_cur_rcc_c1_rsr_iwdg1rstf,  //vdd to vcore
    input        func_cur_rcc_c1_rsr_sft2rstf,   //vdd to vcore
    input        func_cur_rcc_c1_rsr_sft1rstf,   //vdd to vcore
    input        func_cur_rcc_c1_rsr_porrstf,    //vdd to vcore
    input        func_cur_rcc_c1_rsr_pinrstf,    //vdd to vcore
    input        func_cur_rcc_c1_rsr_borrstf,    //vdd to vcore
    input        func_cur_rcc_c1_rsr_d2rstf,     //vdd to vcore
    input        func_cur_rcc_c1_rsr_d1rstf,     //vdd to vcore
    input        func_cur_rcc_c1_rsr_oblrstf,    //vdd to vcore
    input        func_cur_rcc_c1_rsr_rmvf,       //vdd to vcore
    input        func_cur_rcc_c2_rsr_lpwr2rstf,  //vdd to vcore
    input        func_cur_rcc_c2_rsr_lpwr1rstf,  //vdd to vcore
    input        func_cur_rcc_c2_rsr_wwdg2rstf,  //vdd to vcore
    input        func_cur_rcc_c2_rsr_wwdg1rstf,  //vdd to vcore
    input        func_cur_rcc_c2_rsr_iwdg2rstf,  //vdd to vcore
    input        func_cur_rcc_c2_rsr_iwdg1rstf,  //vdd to vcore
    input        func_cur_rcc_c2_rsr_sft2rstf,   //vdd to vcore
    input        func_cur_rcc_c2_rsr_sft1rstf,   //vdd to vcore
    input        func_cur_rcc_c2_rsr_porrstf,    //vdd to vcore
    input        func_cur_rcc_c2_rsr_pinrstf,    //vdd to vcore
    input        func_cur_rcc_c2_rsr_borrstf,    //vdd to vcore
    input        func_cur_rcc_c2_rsr_d2rstf,     //vdd to vcore
    input        func_cur_rcc_c2_rsr_d1rstf,     //vdd to vcore
    input        func_cur_rcc_c2_rsr_oblrstf,    //vdd to vcore
    input        func_cur_rcc_c2_rsr_rmvf,       //vdd to vcore
    input        func_cur_rcc_csr_lsion,         //vdd to vcore
    //================================================================
    // gen inputs
    //================================================================
    output       gen_cur_rcc_bdcr_bdrst,         // vsw to vcore
    output       gen_cur_rcc_bdcr_lsebyp,        // vsw to vcore
    output       gen_cur_rcc_bdcr_lsecssd,       // vsw to vcore
    output       gen_cur_rcc_bdcr_lsecsson,      // vsw to vcore
    output [1:0] gen_cur_rcc_bdcr_lsedrv,        // vsw to vcore
    output       gen_cur_rcc_bdcr_lseon,         // vsw to vcore
    output       gen_cur_rcc_bdcr_rtcen,         // vsw to vcore
    output [1:0] gen_cur_rcc_bdcr_rtcsel,        // vsw to vcore
    // rcc_vdd_reg Outputs
    output       gen_cur_rcc_c1_rsr_lpwr2rstf,   //vdd to vcore
    output       gen_cur_rcc_c1_rsr_lpwr1rstf,   //vdd to vcore
    output       gen_cur_rcc_c1_rsr_wwdg2rstf,   //vdd to vcore
    output       gen_cur_rcc_c1_rsr_wwdg1rstf,   //vdd to vcore
    output       gen_cur_rcc_c1_rsr_iwdg2rstf,   //vdd to vcore
    output       gen_cur_rcc_c1_rsr_iwdg1rstf,   //vdd to vcore
    output       gen_cur_rcc_c1_rsr_sft2rstf,    //vdd to vcore
    output       gen_cur_rcc_c1_rsr_sft1rstf,    //vdd to vcore
    output       gen_cur_rcc_c1_rsr_porrstf,     //vdd to vcore
    output       gen_cur_rcc_c1_rsr_pinrstf,     //vdd to vcore
    output       gen_cur_rcc_c1_rsr_borrstf,     //vdd to vcore
    output       gen_cur_rcc_c1_rsr_d2rstf,      //vdd to vcore
    output       gen_cur_rcc_c1_rsr_d1rstf,      //vdd to vcore
    output       gen_cur_rcc_c1_rsr_oblrstf,     //vdd to vcore
    output       gen_cur_rcc_c1_rsr_rmvf,        //vdd to vcore
    output       gen_cur_rcc_c2_rsr_lpwr2rstf,   //vdd to vcore
    output       gen_cur_rcc_c2_rsr_lpwr1rstf,   //vdd to vcore
    output       gen_cur_rcc_c2_rsr_wwdg2rstf,   //vdd to vcore
    output       gen_cur_rcc_c2_rsr_wwdg1rstf,   //vdd to vcore
    output       gen_cur_rcc_c2_rsr_iwdg2rstf,   //vdd to vcore
    output       gen_cur_rcc_c2_rsr_iwdg1rstf,   //vdd to vcore
    output       gen_cur_rcc_c2_rsr_sft2rstf,    //vdd to vcore
    output       gen_cur_rcc_c2_rsr_sft1rstf,    //vdd to vcore
    output       gen_cur_rcc_c2_rsr_porrstf,     //vdd to vcore
    output       gen_cur_rcc_c2_rsr_pinrstf,     //vdd to vcore
    output       gen_cur_rcc_c2_rsr_borrstf,     //vdd to vcore
    output       gen_cur_rcc_c2_rsr_d2rstf,      //vdd to vcore
    output       gen_cur_rcc_c2_rsr_d1rstf,      //vdd to vcore
    output       gen_cur_rcc_c2_rsr_oblrstf,     //vdd to vcore
    output       gen_cur_rcc_c2_rsr_rmvf,        //vdd to vcore
    output       gen_cur_rcc_csr_lsion           //vdd to vcore
);


  wire       test_cur_rcc_bdcr_bdrst;  // vsw to vcore
  wire       test_cur_rcc_bdcr_lsebyp;  // vsw to vcore
  wire       test_cur_rcc_bdcr_lsecssd;  // vsw to vcore
  wire       test_cur_rcc_bdcr_lsecsson;  // vsw to vcore
  wire [1:0] test_cur_rcc_bdcr_lsedrv;  // vsw to vcore
  wire       test_cur_rcc_bdcr_lseon;  // vsw to vcore
  wire       test_cur_rcc_bdcr_rtcen;  // vsw to vcore
  wire [1:0] test_cur_rcc_bdcr_rtcsel;  // vsw to vcore

  // rcc_vdd_reg Outputs
  wire       test_cur_rcc_c1_rsr_lpwr2rstf;  //vdd to vcore
  wire       test_cur_rcc_c1_rsr_lpwr1rstf;  //vdd to vcore
  wire       test_cur_rcc_c1_rsr_wwdg2rstf;  //vdd to vcore
  wire       test_cur_rcc_c1_rsr_wwdg1rstf;  //vdd to vcore
  wire       test_cur_rcc_c1_rsr_iwdg2rstf;  //vdd to vcore
  wire       test_cur_rcc_c1_rsr_iwdg1rstf;  //vdd to vcore
  wire       test_cur_rcc_c1_rsr_sft2rstf;  //vdd to vcore
  wire       test_cur_rcc_c1_rsr_sft1rstf;  //vdd to vcore
  wire       test_cur_rcc_c1_rsr_porrstf;  //vdd to vcore
  wire       test_cur_rcc_c1_rsr_pinrstf;  //vdd to vcore
  wire       test_cur_rcc_c1_rsr_borrstf;  //vdd to vcore
  wire       test_cur_rcc_c1_rsr_d2rstf;  //vdd to vcore
  wire       test_cur_rcc_c1_rsr_d1rstf;  //vdd to vcore
  wire       test_cur_rcc_c1_rsr_oblrstf;  //vdd to vcore
  wire       test_cur_rcc_c1_rsr_rmvf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_lpwr2rstf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_lpwr1rstf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_wwdg2rstf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_wwdg1rstf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_iwdg2rstf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_iwdg1rstf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_sft2rstf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_sft1rstf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_porrstf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_pinrstf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_borrstf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_d2rstf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_d1rstf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_oblrstf;  //vdd to vcore
  wire       test_cur_rcc_c2_rsr_rmvf;  //vdd to vcore
  wire       test_cur_rcc_csr_lsion;  //vdd to vcore

  assign test_cur_rcc_bdcr_bdrst       = nxt_rcc_bdcr_bdrst;
  assign test_cur_rcc_bdcr_lsebyp      = nxt_rcc_bdcr_lsebyp;
  assign test_cur_rcc_bdcr_lsecssd     = nxt_rcc_bdcr_lsecsson;
  assign test_cur_rcc_bdcr_lsecsson    = nxt_rcc_bdcr_lseon;
  assign test_cur_rcc_bdcr_lsedrv      = nxt_rcc_bdcr_lsedrv;
  assign test_cur_rcc_bdcr_lseon       = nxt_rcc_bdcr_rtcen;
  assign test_cur_rcc_bdcr_rtcen       = nxt_rcc_bdcr_rtcen;
  assign test_cur_rcc_bdcr_rtcsel      = nxt_rcc_bdcr_rtcsel;

  assign test_cur_rcc_c1_rsr_lpwr2rstf = rcc_vdd_wdata;
  assign test_cur_rcc_c1_rsr_lpwr1rstf = rcc_vdd_wdata;
  assign test_cur_rcc_c1_rsr_wwdg2rstf = rcc_vdd_wdata;
  assign test_cur_rcc_c1_rsr_wwdg1rstf = rcc_vdd_wdata;
  assign test_cur_rcc_c1_rsr_iwdg2rstf = rcc_vdd_wdata;
  assign test_cur_rcc_c1_rsr_iwdg1rstf = rcc_vdd_wdata;
  assign test_cur_rcc_c1_rsr_sft2rstf  = rcc_vdd_wdata;
  assign test_cur_rcc_c1_rsr_sft1rstf  = rcc_vdd_wdata;
  assign test_cur_rcc_c1_rsr_porrstf   = rcc_vdd_wdata;
  assign test_cur_rcc_c1_rsr_pinrstf   = rcc_vdd_wdata;
  assign test_cur_rcc_c1_rsr_borrstf   = rcc_vdd_wdata;
  assign test_cur_rcc_c1_rsr_d2rstf    = rcc_vdd_wdata;
  assign test_cur_rcc_c1_rsr_d1rstf    = rcc_vdd_wdata;
  assign test_cur_rcc_c1_rsr_oblrstf   = rcc_vdd_wdata;
  assign test_cur_rcc_c1_rsr_rmvf      = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_lpwr2rstf = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_lpwr1rstf = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_wwdg2rstf = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_wwdg1rstf = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_iwdg2rstf = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_iwdg1rstf = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_sft2rstf  = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_sft1rstf  = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_porrstf   = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_pinrstf   = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_borrstf   = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_d2rstf    = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_d1rstf    = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_oblrstf   = rcc_vdd_wdata;
  assign test_cur_rcc_c2_rsr_rmvf      = rcc_vdd_wdata;
  assign test_cur_rcc_csr_lsion        = rcc_vdd_wdata;


  BB_mux_cell u_cur_rcc_bdcr_bdrst_mux (
      .ina(func_cur_rcc_bdcr_bdrst),  // 0
      .inb(test_cur_rcc_bdcr_bdrst),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_bdcr_bdrst)
  );

  BB_mux_cell u_cur_rcc_bdcr_lsebyp_mux (
      .ina(func_cur_rcc_bdcr_lsebyp),  // 0
      .inb(test_cur_rcc_bdcr_lsebyp),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_bdcr_lsebyp)
  );

  BB_mux_cell u_cur_rcc_bdcr_lsecssd_mux (
      .ina(func_cur_rcc_bdcr_lsecssd),  // 0
      .inb(test_cur_rcc_bdcr_lsecssd),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_bdcr_lsecssd)
  );

  BB_mux_cell u_cur_rcc_bdcr_lsecsson_mux (
      .ina(func_cur_rcc_bdcr_lsecsson),  // 0
      .inb(test_cur_rcc_bdcr_lsecsson),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_bdcr_lsecsson)
  );

  BB_mux_cell u_cur_rcc_bdcr_lsedrv_mux_0 (
      .ina(func_cur_rcc_bdcr_lsedrv[0]),  // 0
      .inb(test_cur_rcc_bdcr_lsedrv[0]),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_bdcr_lsedrv[0])
  );

  BB_mux_cell u_cur_rcc_bdcr_lsedrv_mux_1 (
      .ina(func_cur_rcc_bdcr_lsedrv[1]),  // 0
      .inb(test_cur_rcc_bdcr_lsedrv[1]),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_bdcr_lsedrv[1])
  );

  BB_mux_cell u_cur_rcc_bdcr_lseon_mux (
      .ina(func_cur_rcc_bdcr_lseon),  // 0
      .inb(test_cur_rcc_bdcr_lseon),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_bdcr_lseon)
  );

  BB_mux_cell u_cur_rcc_bdcr_rtcen_mux (
      .ina(func_cur_rcc_bdcr_rtcen),  // 0
      .inb(test_cur_rcc_bdcr_rtcen),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_bdcr_rtcen)
  );

  BB_mux_cell u_cur_rcc_bdcr_rtcsel_mux_0 (
      .ina(func_cur_rcc_bdcr_rtcsel[0]),  // 0
      .inb(test_cur_rcc_bdcr_rtcsel[0]),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_bdcr_rtcsel[0])
  );

  BB_mux_cell u_cur_rcc_bdcr_rtcsel_mux_1 (
      .ina(func_cur_rcc_bdcr_rtcsel[1]),  // 0
      .inb(test_cur_rcc_bdcr_rtcsel[1]),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_bdcr_rtcsel[1])
  );

  BB_mux_cell u_cur_rcc_c1_rsr_lpwr2rstf_mux (
      .ina(func_cur_rcc_c1_rsr_lpwr2rstf),  // 0
      .inb(test_cur_rcc_c1_rsr_lpwr2rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_lpwr2rstf)
  );

  BB_mux_cell u_cur_rcc_c1_rsr_lpwr1rstf_mux (
      .ina(func_cur_rcc_c1_rsr_lpwr1rstf),  // 0
      .inb(test_cur_rcc_c1_rsr_lpwr1rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_lpwr1rstf)
  );

  BB_mux_cell u_cur_rcc_c1_rsr_wwdg2rstf_mux (
      .ina(func_cur_rcc_c1_rsr_wwdg2rstf),  // 0
      .inb(test_cur_rcc_c1_rsr_wwdg2rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_wwdg2rstf)
  );

  BB_mux_cell u_cur_rcc_c1_rsr_wwdg1rstf_mux (
      .ina(func_cur_rcc_c1_rsr_wwdg1rstf),  // 0
      .inb(test_cur_rcc_c1_rsr_wwdg1rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_wwdg1rstf)
  );

  BB_mux_cell u_cur_rcc_c1_rsr_iwdg2rstf_mux (
      .ina(func_cur_rcc_c1_rsr_iwdg2rstf),  // 0
      .inb(test_cur_rcc_c1_rsr_iwdg2rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_iwdg2rstf)
  );

  BB_mux_cell u_cur_rcc_c1_rsr_iwdg1rstf_mux (
      .ina(func_cur_rcc_c1_rsr_iwdg1rstf),  // 0
      .inb(test_cur_rcc_c1_rsr_iwdg1rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_iwdg1rstf)
  );

  BB_mux_cell u_cur_rcc_c1_rsr_sft2rstf_mux (
      .ina(func_cur_rcc_c1_rsr_sft2rstf),  // 0
      .inb(test_cur_rcc_c1_rsr_sft2rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_sft2rstf)
  );

  BB_mux_cell u_cur_rcc_c1_rsr_sft1rstf_mux (
      .ina(func_cur_rcc_c1_rsr_sft1rstf),  // 0
      .inb(test_cur_rcc_c1_rsr_sft1rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_sft1rstf)
  );

  BB_mux_cell u_cur_rcc_c1_rsr_porrstf_mux (
      .ina(func_cur_rcc_c1_rsr_porrstf),  // 0
      .inb(test_cur_rcc_c1_rsr_porrstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_porrstf)
  );

  BB_mux_cell u_cur_rcc_c1_rsr_pinrstf_mux (
      .ina(func_cur_rcc_c1_rsr_pinrstf),  // 0
      .inb(test_cur_rcc_c1_rsr_pinrstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_pinrstf)
  );

  BB_mux_cell u_cur_rcc_c1_rsr_borrstf_mux (
      .ina(func_cur_rcc_c1_rsr_borrstf),  // 0
      .inb(test_cur_rcc_c1_rsr_borrstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_borrstf)
  );

  BB_mux_cell u_cur_rcc_c1_rsr_d2rstf_mux (
      .ina(func_cur_rcc_c1_rsr_d2rstf),  // 0
      .inb(test_cur_rcc_c1_rsr_d2rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_d2rstf)
  );

  BB_mux_cell u_cur_rcc_c1_rsr_d1rstf_mux (
      .ina(func_cur_rcc_c1_rsr_d1rstf),  // 0
      .inb(test_cur_rcc_c1_rsr_d1rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_d1rstf)
  );

  BB_mux_cell u_cur_rcc_c1_rsr_oblrstf_mux (
      .ina(func_cur_rcc_c1_rsr_oblrstf),  // 0
      .inb(test_cur_rcc_c1_rsr_oblrstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_oblrstf)
  );

  BB_mux_cell u_cur_rcc_c1_rsr_rmvf_mux (
      .ina(func_cur_rcc_c1_rsr_rmvf),  // 0
      .inb(test_cur_rcc_c1_rsr_rmvf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c1_rsr_rmvf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_lpwr2rstf_mux (
      .ina(func_cur_rcc_c2_rsr_lpwr2rstf),  // 0
      .inb(test_cur_rcc_c2_rsr_lpwr2rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_lpwr2rstf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_lpwr1rstf_mux (
      .ina(func_cur_rcc_c2_rsr_lpwr1rstf),  // 0
      .inb(test_cur_rcc_c2_rsr_lpwr1rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_lpwr1rstf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_wwdg2rstf_mux (
      .ina(func_cur_rcc_c2_rsr_wwdg2rstf),  // 0
      .inb(test_cur_rcc_c2_rsr_wwdg2rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_wwdg2rstf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_wwdg1rstf_mux (
      .ina(func_cur_rcc_c2_rsr_wwdg1rstf),  // 0
      .inb(test_cur_rcc_c2_rsr_wwdg1rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_wwdg1rstf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_iwdg2rstf_mux (
      .ina(func_cur_rcc_c2_rsr_iwdg2rstf),  // 0
      .inb(test_cur_rcc_c2_rsr_iwdg2rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_iwdg2rstf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_iwdg1rstf_mux (
      .ina(func_cur_rcc_c2_rsr_iwdg1rstf),  // 0
      .inb(test_cur_rcc_c2_rsr_iwdg1rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_iwdg1rstf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_sft2rstf_mux (
      .ina(func_cur_rcc_c2_rsr_sft2rstf),  // 0
      .inb(test_cur_rcc_c2_rsr_sft2rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_sft2rstf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_sft1rstf_mux (
      .ina(func_cur_rcc_c2_rsr_sft1rstf),  // 0
      .inb(test_cur_rcc_c2_rsr_sft1rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_sft1rstf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_porrstf_mux (
      .ina(func_cur_rcc_c2_rsr_porrstf),  // 0
      .inb(test_cur_rcc_c2_rsr_porrstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_porrstf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_pinrstf_mux (
      .ina(func_cur_rcc_c2_rsr_pinrstf),  // 0
      .inb(test_cur_rcc_c2_rsr_pinrstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_pinrstf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_borrstf_mux (
      .ina(func_cur_rcc_c2_rsr_borrstf),  // 0
      .inb(test_cur_rcc_c2_rsr_borrstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_borrstf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_d2rstf_mux (
      .ina(func_cur_rcc_c2_rsr_d2rstf),  // 0
      .inb(test_cur_rcc_c2_rsr_d2rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_d2rstf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_d1rstf_mux (
      .ina(func_cur_rcc_c2_rsr_d1rstf),  // 0
      .inb(test_cur_rcc_c2_rsr_d1rstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_d1rstf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_oblrstf_mux (
      .ina(func_cur_rcc_c2_rsr_oblrstf),  // 0
      .inb(test_cur_rcc_c2_rsr_oblrstf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_oblrstf)
  );

  BB_mux_cell u_cur_rcc_c2_rsr_rmvf_mux (
      .ina(func_cur_rcc_c2_rsr_rmvf),  // 0
      .inb(test_cur_rcc_c2_rsr_rmvf),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_c2_rsr_rmvf)
  );

  BB_mux_cell u_cur_rcc_csr_lsion_mux (
      .ina(func_cur_rcc_csr_lsion),  // 0
      .inb(test_cur_rcc_csr_lsion),  // 1
      .sel(testmode),
      .out(gen_cur_rcc_csr_lsion)
  );


endmodule
