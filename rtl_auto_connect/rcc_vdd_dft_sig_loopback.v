module rcc_vdd_dft_sig_loopback (
    //================================================================
    // testmode signal
    //================================================================
    input  testmode,
    //================================================================
    // function inputs
    //================================================================
    input  func_rcc_vdd_wdata,             //low to high level, default 0
    input  func_nrst_in,                   //low to high level, default 0
    input  func_obl_rst,                   //low to high level, default 0
    input  func_lpwr2_rst,                 //low to high level, default 0
    input  func_lpwr1_rst,                 //low to high level, default 0
    input  func_wwdg1_out_rst,             //low to high level, default 0
    input  func_wwdg2_out_rst,             //low to high level, default 0
    input  func_cpu2_sftrst,               //low to high level, default 0
    input  func_cpu1_sftrst,               //low to high level, default 0
    input  func_pwr_por_rst,               //low to high level, default 0
    input  func_pwr_bor_rst,               //low to high level, default 0
    input  func_d2_rst,                    //low to high level, default 0
    input  func_d1_rst,                    //low to high level, default 0
    // input lsi_rdy,
    //================================================================
    // function outputs
    //================================================================
    // rcc_vdd_reg Outputs
    input  cur_rcc_c1_rsr_lpwr2rstf,       //hign to low level, default 0
    input  cur_rcc_c1_rsr_lpwr1rstf,       //hign to low level, default 0
    input  cur_rcc_c1_rsr_wwdg2rstf,       //hign to low level, default 0
    input  cur_rcc_c1_rsr_wwdg1rstf,       //hign to low level, default 0
    input  cur_rcc_c1_rsr_iwdg2rstf,       //hign to low level, default 0
    input  cur_rcc_c1_rsr_iwdg1rstf,       //hign to low level, default 0
    input  cur_rcc_c1_rsr_sft2rstf,        //hign to low level, default 0
    input  cur_rcc_c1_rsr_sft1rstf,        //hign to low level, default 0
    input  cur_rcc_c1_rsr_porrstf,         //hign to low level, default 0
    input  cur_rcc_c1_rsr_pinrstf,         //hign to low level, default 0
    input  cur_rcc_c1_rsr_borrstf,         //hign to low level, default 0
    input  cur_rcc_c1_rsr_d2rstf,          //hign to low level, default 0
    input  cur_rcc_c1_rsr_d1rstf,          //hign to low level, default 0
    input  cur_rcc_c1_rsr_oblrstf,         //hign to low level, default 0
    input  cur_rcc_c1_rsr_rmvf,            //hign to low level, default 0
    input  cur_rcc_c2_rsr_lpwr2rstf,       //hign to low level, default 0
    input  cur_rcc_c2_rsr_lpwr1rstf,       //hign to low level, default 0
    input  cur_rcc_c2_rsr_wwdg2rstf,       //hign to low level, default 0
    input  cur_rcc_c2_rsr_wwdg1rstf,       //hign to low level, default 0
    input  cur_rcc_c2_rsr_iwdg2rstf,       //hign to low level, default 0
    input  cur_rcc_c2_rsr_iwdg1rstf,       //hign to low level, default 0
    input  cur_rcc_c2_rsr_sft2rstf,        //hign to low level, default 0
    input  cur_rcc_c2_rsr_sft1rstf,        //hign to low level, default 0
    input  cur_rcc_c2_rsr_porrstf,         //hign to low level, default 0
    input  cur_rcc_c2_rsr_pinrstf,         //hign to low level, default 0
    input  cur_rcc_c2_rsr_borrstf,         //hign to low level, default 0
    input  cur_rcc_c2_rsr_d2rstf,          //hign to low level, default 0
    input  cur_rcc_c2_rsr_d1rstf,          //hign to low level, default 0
    input  cur_rcc_c2_rsr_oblrstf,         //hign to low level, default 0
    input  cur_rcc_c2_rsr_rmvf,            //hign to low level, default 0
    input  cur_rcc_csr_lsion,              //hign to low level, default 0
    //================================================================
    // gen inputs
    //================================================================
    output gen_rcc_vdd_wdata,              //low to high level, default 0
    output gen_nrst_in,                    //low to high level, default 0
    output gen_obl_rst,                    //low to high level, default 0
    output gen_lpwr2_rst,                  //low to high level, default 0
    output gen_lpwr1_rst,                  //low to high level, default 0
    output gen_wwdg1_out_rst,              //low to high level, default 0
    output gen_wwdg2_out_rst,              //low to high level, default 0
    output gen_cpu2_sftrst,                //low to high level, default 0
    output gen_cpu1_sftrst,                //low to high level, default 0
    output gen_pwr_por_rst,                //low to high level, default 0
    output gen_pwr_bor_rst,                //low to high level, default 0
    output gen_d2_rst,                     //low to high level, default 0
    output gen_d1_rst                      //low to high level, default 0
);
  wire test_rcc_vdd_wdata;             //low to high level; default 0
  wire test_nrst_in;                   //low to high level; default 0
  wire test_obl_rst;                   //low to high level; default 0
  wire test_lpwr2_rst;                 //low to high level; default 0
  wire test_lpwr1_rst;                 //low to high level; default 0
  wire test_wwdg1_out_rst;             //low to high level; default 0
  wire test_wwdg2_out_rst;             //low to high level; default 0
  wire test_cpu2_sftrst;               //low to high level; default 0
  wire test_cpu1_sftrst;               //low to high level; default 0
  wire test_pwr_por_rst;               //low to high level; default 0
  wire test_pwr_bor_rst;               //low to high level; default 0
  wire test_d2_rst;                    //low to high level; default 0
  wire test_d1_rst;                    //low to high level; default 0


  assign test_rcc_vdd_wdata            = cur_rcc_c1_rsr_lpwr2rstf ^ cur_rcc_c1_rsr_lpwr1rstf;
  assign test_nrst_in                  = cur_rcc_c1_rsr_porrstf ^ cur_rcc_c1_rsr_pinrstf;
  assign test_obl_rst                  = cur_rcc_c1_rsr_borrstf ^ cur_rcc_c1_rsr_d2rstf;
  assign test_lpwr2_rst                = cur_rcc_c1_rsr_d1rstf ^ cur_rcc_c1_rsr_oblrstf;
  assign test_lpwr1_rst                = cur_rcc_c1_rsr_rmvf ^ cur_rcc_c2_rsr_lpwr2rstf;
  assign test_wwdg1_out_rst            = cur_rcc_c2_rsr_lpwr1rstf ^ cur_rcc_c2_rsr_wwdg2rstf;
  assign test_wwdg2_out_rst            = cur_rcc_c2_rsr_wwdg1rstf ^ cur_rcc_c2_rsr_iwdg2rstf;
  assign test_cpu2_sftrst              = cur_rcc_c2_rsr_iwdg1rstf ^ cur_rcc_c2_rsr_sft2rstf;
  assign test_cpu1_sftrst              = cur_rcc_c2_rsr_sft1rstf ^ cur_rcc_c2_rsr_porrstf;
  assign test_pwr_por_rst              = cur_rcc_c2_rsr_pinrstf ^ cur_rcc_c2_rsr_borrstf;
  assign test_pwr_bor_rst              = cur_rcc_c2_rsr_d2rstf ^ cur_rcc_c2_rsr_d1rstf;
  assign test_d2_rst                   = cur_rcc_c2_rsr_oblrstf ^ cur_rcc_c2_rsr_rmvf;
  assign test_d1_rst                   = cur_rcc_csr_lsion;

  BB_mux_cell u_rcc_vdd_wdata_mux (
      .ina(func_rcc_vdd_wdata),  // 0
      .inb(test_rcc_vdd_wdata),  // 1
      .sel(testmode),
      .out(gen_rcc_vdd_wdata)
  );

  BB_mux_cell u_nrst_in_mux (
      .ina(func_nrst_in),  // 0
      .inb(test_nrst_in),  // 1
      .sel(testmode),
      .out(gen_nrst_in)
  );

  BB_mux_cell u_obl_rst_mux (
      .ina(func_obl_rst),  // 0
      .inb(test_obl_rst),  // 1
      .sel(testmode),
      .out(gen_obl_rst)
  );

  BB_mux_cell u_lpwr2_rst_mux (
      .ina(func_lpwr2_rst),  // 0
      .inb(test_lpwr2_rst),  // 1
      .sel(testmode),
      .out(gen_lpwr2_rst)
  );

  BB_mux_cell u_lpwr1_rst_mux (
      .ina(func_lpwr1_rst),  // 0
      .inb(test_lpwr1_rst),  // 1
      .sel(testmode),
      .out(gen_lpwr1_rst)
  );

  BB_mux_cell u_wwdg1_out_rst_mux (
      .ina(func_wwdg1_out_rst),  // 0
      .inb(test_wwdg1_out_rst),  // 1
      .sel(testmode),
      .out(gen_wwdg1_out_rst)
  );

  BB_mux_cell u_wwdg2_out_rst_mux (
      .ina(func_wwdg2_out_rst),  // 0
      .inb(test_wwdg2_out_rst),  // 1
      .sel(testmode),
      .out(gen_wwdg2_out_rst)
  );

  BB_mux_cell u_cpu2_sftrst_mux (
      .ina(func_cpu2_sftrst),  // 0
      .inb(test_cpu2_sftrst),  // 1
      .sel(testmode),
      .out(gen_cpu2_sftrst)
  );

  BB_mux_cell u_cpu1_sftrst_mux (
      .ina(func_cpu1_sftrst),  // 0
      .inb(test_cpu1_sftrst),  // 1
      .sel(testmode),
      .out(gen_cpu1_sftrst)
  );

  BB_mux_cell u_pwr_por_rst_mux (
      .ina(func_pwr_por_rst),  // 0
      .inb(test_pwr_por_rst),  // 1
      .sel(testmode),
      .out(gen_pwr_por_rst)
  );

  BB_mux_cell u_pwr_bor_rst_mux (
      .ina(func_pwr_bor_rst),  // 0
      .inb(test_pwr_bor_rst),  // 1
      .sel(testmode),
      .out(gen_pwr_bor_rst)
  );

  BB_mux_cell u_d2_rst_mux (
      .ina(func_d2_rst),  // 0
      .inb(test_d2_rst),  // 1
      .sel(testmode),
      .out(gen_d2_rst)
  );

  BB_mux_cell u_d1_rst_mux (
      .ina(func_d1_rst),  // 0
      .inb(test_d1_rst),  // 1
      .sel(testmode),
      .out(gen_d1_rst)
  );

endmodule
