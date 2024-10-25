module rcc_vdd_top (
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
    // rcc_vdd_reg Inputs
    input wdata,                 //low to high level, default 0
    input rcc_c1_rsr_rmvf_wren,  //low to high level, default 0
    input rcc_c2_rsr_rmvf_wren,  //low to high level, default 0
    input rcc_csr_lsion_wren,    //low to high level, default 0
    input nrst_in,               //low to high level, default 0
    input obl_rst,               //low to high level, default 0
    input lpwr2_rst,             //low to high level, default 0
    input lpwr1_rst,             //low to high level, default 0
    input wwdg1_out_rst,         //low to high level, default 0
    input wwdg2_out_rst,         //low to high level, default 0
    input iwdg1_out_rst,
    input iwdg2_out_rst,
    input cpu2_sftrst,           //low to high level, default 0
    input cpu1_sftrst,           //low to high level, default 0
    input pwr_por_rst,           //low to high level, default 0
    input pwr_bor_rst,           //low to high level, default 0
    input d2_rst,                //low to high level, default 0
    input d1_rst,                //low to high level, default 0
    input lsi_rdy,

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
    output cur_rcc_csr_lsirdy,        //hign to low level, default 0
    output cur_rcc_csr_lsion          //hign to low level, default 0
);
  /*AUTOWIRE*/
  /*AUTO DECLARE*/

  rcc_vdd_reg u_rcc_vdd_reg (
    .rst_n               (~pwr_por_rst),
    /*AUTOINST*/
		);


  // level shift
  // level shift should be added in integration
  // voltage isolation 
  // voltage isolation should be added in integration

endmodule
