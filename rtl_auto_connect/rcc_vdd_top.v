// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : RCC VDD TOP
// ****************************************************************
module rcc_vdd_top (
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
    //================================================================
    // test mode signals
    //================================================================
    input test_clk,
    input scan_mode,
    input testmode,
    input test_rst_n,
    // rcc_vdd_reg Inputs
    input rcc_vdd_wdata,             //low to high level, default 0
    input raw_rcc_c1_rsr_rmvf_wren,  //low to high level, default 0
    input raw_rcc_c2_rsr_rmvf_wren,  //low to high level, default 0
    input raw_rcc_csr_lsion_wren,    //low to high level, default 0
    input nrst_in,                   //low to high level, default 0
    input obl_rst,                   //low to high level, default 0
    input lpwr2_rst,                 //low to high level, default 0
    input lpwr1_rst,                 //low to high level, default 0
    input wwdg1_out_rst,             //low to high level, default 0
    input wwdg2_out_rst,             //low to high level, default 0
    input iwdg1_out_rst,             //in vdd domain
    input iwdg2_out_rst,             //in vdd domain
    input cpu2_sftrst,               //low to high level, default 0
    input cpu1_sftrst,               //low to high level, default 0
    input pwr_por_rst,               //low to high level, default 0
    input pwr_bor_rst,               //low to high level, default 0
    input d2_rst,                    //low to high level, default 0
    input d1_rst,                    //low to high level, default 0
    input lsi_clk,                   //in vdd domain
    // input lsi_rdy,

    output lsion,
    // rcc_vdd_reg Outputs
    output cur_rcc_c1_rsr_lpwr2rstf,  //hign to low level, default 0
    output cur_rcc_c1_rsr_lpwr1rstf,  //hign to low level, default 0
    output cur_rcc_c1_rsr_wwdg2rstf,  //hign to low level, default 0
    output cur_rcc_c1_rsr_wwdg1rstf,  //hign to low level, default 0
    output cur_rcc_c1_rsr_iwdg2rstf,  //hign to low level, default 0
    output cur_rcc_c1_rsr_iwdg1rstf,  //hign to low level, default 0
    output cur_rcc_c1_rsr_sft2rstf,   //hign to low level, default 0
    output cur_rcc_c1_rsr_sft1rstf,   //hign to low level, default 0
    output cur_rcc_c1_rsr_porrstf,    //hign to low level, default 0
    output cur_rcc_c1_rsr_pinrstf,    //hign to low level, default 0
    output cur_rcc_c1_rsr_borrstf,    //hign to low level, default 0
    output cur_rcc_c1_rsr_d2rstf,     //hign to low level, default 0
    output cur_rcc_c1_rsr_d1rstf,     //hign to low level, default 0
    output cur_rcc_c1_rsr_oblrstf,    //hign to low level, default 0
    output cur_rcc_c1_rsr_rmvf,       //hign to low level, default 0
    output cur_rcc_c2_rsr_lpwr2rstf,  //hign to low level, default 0
    output cur_rcc_c2_rsr_lpwr1rstf,  //hign to low level, default 0
    output cur_rcc_c2_rsr_wwdg2rstf,  //hign to low level, default 0
    output cur_rcc_c2_rsr_wwdg1rstf,  //hign to low level, default 0
    output cur_rcc_c2_rsr_iwdg2rstf,  //hign to low level, default 0
    output cur_rcc_c2_rsr_iwdg1rstf,  //hign to low level, default 0
    output cur_rcc_c2_rsr_sft2rstf,   //hign to low level, default 0
    output cur_rcc_c2_rsr_sft1rstf,   //hign to low level, default 0
    output cur_rcc_c2_rsr_porrstf,    //hign to low level, default 0
    output cur_rcc_c2_rsr_pinrstf,    //hign to low level, default 0
    output cur_rcc_c2_rsr_borrstf,    //hign to low level, default 0
    output cur_rcc_c2_rsr_d2rstf,     //hign to low level, default 0
    output cur_rcc_c2_rsr_d1rstf,     //hign to low level, default 0
    output cur_rcc_c2_rsr_oblrstf,    //hign to low level, default 0
    output cur_rcc_c2_rsr_rmvf,       //hign to low level, default 0
    // output cur_rcc_csr_lsirdy,        //hign to low level, default 0
    output cur_rcc_csr_lsion          //hign to low level, default 0
);
  /*AUTOWIRE*/
  /*AUTO DECLARE*/
  // rcc_vdd_dft_sig_loopback Outputs
  // wire gen_rcc_vdd_wdata;
  // wire gen_nrst_in;
  // wire gen_obl_rst;
  // wire gen_lpwr2_rst;
  // wire gen_lpwr1_rst;
  // wire gen_wwdg1_out_rst;
  // wire gen_wwdg2_out_rst;
  // wire gen_cpu2_sftrst;
  // wire gen_cpu1_sftrst;
  // wire gen_pwr_por_rst;
  // wire gen_pwr_bor_rst;
  // wire gen_d2_rst;
  // wire gen_d1_rst;
  ///================================================================
  // rcc vdd domain test clock mux 
  //================================================================

  rcc_vdd_port_clock_mux u_rcc_vdd_port_clock_mux (
  /*AUTOINST*/
  );

  // rcc_vdd_dft_sig_loopback u_rcc_vdd_dft_sig_loopback (
  //     .testmode                (testmode),
  //     .func_rcc_vdd_wdata      (rcc_vdd_wdata),
  //     .func_nrst_in            (nrst_in),
  //     .func_obl_rst            (obl_rst),
  //     .func_lpwr2_rst          (lpwr2_rst),
  //     .func_lpwr1_rst          (lpwr1_rst),
  //     .func_wwdg1_out_rst      (wwdg1_out_rst),
  //     .func_wwdg2_out_rst      (wwdg2_out_rst),
  //     .func_cpu2_sftrst        (cpu2_sftrst),
  //     .func_cpu1_sftrst        (cpu1_sftrst),
  //     .func_pwr_por_rst        (pwr_por_rst),
  //     .func_pwr_bor_rst        (pwr_bor_rst),
  //     .func_d2_rst             (d2_rst),
  //     .func_d1_rst             (d1_rst),
  //     .cur_rcc_c1_rsr_lpwr2rstf(cur_rcc_c1_rsr_lpwr2rstf),
  //     .cur_rcc_c1_rsr_lpwr1rstf(cur_rcc_c1_rsr_lpwr1rstf),
  //     .cur_rcc_c1_rsr_wwdg2rstf(cur_rcc_c1_rsr_wwdg2rstf),
  //     .cur_rcc_c1_rsr_wwdg1rstf(cur_rcc_c1_rsr_wwdg1rstf),
  //     .cur_rcc_c1_rsr_iwdg2rstf(cur_rcc_c1_rsr_iwdg2rstf),
  //     .cur_rcc_c1_rsr_iwdg1rstf(cur_rcc_c1_rsr_iwdg1rstf),
  //     .cur_rcc_c1_rsr_sft2rstf (cur_rcc_c1_rsr_sft2rstf),
  //     .cur_rcc_c1_rsr_sft1rstf (cur_rcc_c1_rsr_sft1rstf),
  //     .cur_rcc_c1_rsr_porrstf  (cur_rcc_c1_rsr_porrstf),
  //     .cur_rcc_c1_rsr_pinrstf  (cur_rcc_c1_rsr_pinrstf),
  //     .cur_rcc_c1_rsr_borrstf  (cur_rcc_c1_rsr_borrstf),
  //     .cur_rcc_c1_rsr_d2rstf   (cur_rcc_c1_rsr_d2rstf),
  //     .cur_rcc_c1_rsr_d1rstf   (cur_rcc_c1_rsr_d1rstf),
  //     .cur_rcc_c1_rsr_oblrstf  (cur_rcc_c1_rsr_oblrstf),
  //     .cur_rcc_c1_rsr_rmvf     (cur_rcc_c1_rsr_rmvf),
  //     .cur_rcc_c2_rsr_lpwr2rstf(cur_rcc_c2_rsr_lpwr2rstf),
  //     .cur_rcc_c2_rsr_lpwr1rstf(cur_rcc_c2_rsr_lpwr1rstf),
  //     .cur_rcc_c2_rsr_wwdg2rstf(cur_rcc_c2_rsr_wwdg2rstf),
  //     .cur_rcc_c2_rsr_wwdg1rstf(cur_rcc_c2_rsr_wwdg1rstf),
  //     .cur_rcc_c2_rsr_iwdg2rstf(cur_rcc_c2_rsr_iwdg2rstf),
  //     .cur_rcc_c2_rsr_iwdg1rstf(cur_rcc_c2_rsr_iwdg1rstf),
  //     .cur_rcc_c2_rsr_sft2rstf (cur_rcc_c2_rsr_sft2rstf),
  //     .cur_rcc_c2_rsr_sft1rstf (cur_rcc_c2_rsr_sft1rstf),
  //     .cur_rcc_c2_rsr_porrstf  (cur_rcc_c2_rsr_porrstf),
  //     .cur_rcc_c2_rsr_pinrstf  (cur_rcc_c2_rsr_pinrstf),
  //     .cur_rcc_c2_rsr_borrstf  (cur_rcc_c2_rsr_borrstf),
  //     .cur_rcc_c2_rsr_d2rstf   (cur_rcc_c2_rsr_d2rstf),
  //     .cur_rcc_c2_rsr_d1rstf   (cur_rcc_c2_rsr_d1rstf),
  //     .cur_rcc_c2_rsr_oblrstf  (cur_rcc_c2_rsr_oblrstf),
  //     .cur_rcc_c2_rsr_rmvf     (cur_rcc_c2_rsr_rmvf),
  //     .cur_rcc_csr_lsion       (cur_rcc_csr_lsion),

  //     .gen_rcc_vdd_wdata(gen_rcc_vdd_wdata),
  //     .gen_nrst_in      (gen_nrst_in),
  //     .gen_obl_rst      (gen_obl_rst),
  //     .gen_lpwr2_rst    (gen_lpwr2_rst),
  //     .gen_lpwr1_rst    (gen_lpwr1_rst),
  //     .gen_wwdg1_out_rst(gen_wwdg1_out_rst),
  //     .gen_wwdg2_out_rst(gen_wwdg2_out_rst),
  //     .gen_cpu2_sftrst  (gen_cpu2_sftrst),
  //     .gen_cpu1_sftrst  (gen_cpu1_sftrst),
  //     .gen_pwr_por_rst  (gen_pwr_por_rst),
  //     .gen_pwr_bor_rst  (gen_pwr_bor_rst),
  //     .gen_d2_rst       (gen_d2_rst),
  //     .gen_d1_rst       (gen_d1_rst)
  // );

  rcc_vdd_reg u_rcc_vdd_reg (
      .rst_n        (~pwr_por_rst)
      /*AUTOINST*/
  );



  // level shift
  // level shift should be added in integration
  // voltage isolation 
  // voltage isolation should be added in integration

endmodule
