// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : RCC register in VDD domain
// ****************************************************************
// spyglass disable_block Reset_sync02
module rcc_vdd_reg (
    input  rcc_vdd_wdata,
    input  rst_n,
    input  rcc_c1_rsr_rmvf_wren,
    input  rcc_c2_rsr_rmvf_wren,
    input  rcc_csr_lsion_wren,
    //
    input  nrst_in,
    input  obl_rst,
    input  lpwr2_rst,
    input  lpwr1_rst,
    input  wwdg1_out_rst,
    input  wwdg2_out_rst,
    input  iwdg1_out_rst,
    input  iwdg2_out_rst,
    input  cpu2_sftrst,
    input  cpu1_sftrst,
    input  pwr_por_rst,
    input  pwr_bor_rst,
    input  d2_rst,
    input  d1_rst,
    //
    input  testmode,
    input  test_rst_n,
    // input lsi_rdy,
    // rcc_c1_rsr 
    output cur_rcc_c1_rsr_lpwr2rstf,
    output cur_rcc_c1_rsr_lpwr1rstf,
    output cur_rcc_c1_rsr_wwdg2rstf,
    output cur_rcc_c1_rsr_wwdg1rstf,
    output cur_rcc_c1_rsr_iwdg2rstf,
    output cur_rcc_c1_rsr_iwdg1rstf,
    output cur_rcc_c1_rsr_sft2rstf,
    output cur_rcc_c1_rsr_sft1rstf,
    output cur_rcc_c1_rsr_porrstf,
    output cur_rcc_c1_rsr_pinrstf,
    output cur_rcc_c1_rsr_borrstf,
    output cur_rcc_c1_rsr_d2rstf,
    output cur_rcc_c1_rsr_d1rstf,
    output cur_rcc_c1_rsr_oblrstf,
    output cur_rcc_c1_rsr_rmvf,
    // rcc_c2_rsr 
    output cur_rcc_c2_rsr_lpwr2rstf,
    output cur_rcc_c2_rsr_lpwr1rstf,
    output cur_rcc_c2_rsr_wwdg2rstf,
    output cur_rcc_c2_rsr_wwdg1rstf,
    output cur_rcc_c2_rsr_iwdg2rstf,
    output cur_rcc_c2_rsr_iwdg1rstf,
    output cur_rcc_c2_rsr_sft2rstf,
    output cur_rcc_c2_rsr_sft1rstf,
    output cur_rcc_c2_rsr_porrstf,
    output cur_rcc_c2_rsr_pinrstf,
    output cur_rcc_c2_rsr_borrstf,
    output cur_rcc_c2_rsr_d2rstf,
    output cur_rcc_c2_rsr_d1rstf,
    output cur_rcc_c2_rsr_oblrstf,
    output cur_rcc_c2_rsr_rmvf,
    // rcc_csr
    // output cur_rcc_csr_lsirdy,
    output cur_rcc_csr_lsion
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);
  /* verilator lint_off LATCH */
  /*AUTOWIRE*/
  //Start of automatic wire
  //Define assign wires here
  wire rcc_c1_rsr_lpwr2rstf_set;
  wire rcc_c1_rsr_lpwr2rstf_clr;
  wire rcc_c1_rsr_lpwr1rstf_set;
  wire rcc_c1_rsr_lpwr1rstf_clr;
  wire rcc_c1_rsr_wwdg2rstf_set;
  wire rcc_c1_rsr_wwdg2rstf_clr;
  wire rcc_c1_rsr_wwdg1rstf_set;
  wire rcc_c1_rsr_wwdg1rstf_clr;
  wire rcc_c1_rsr_iwdg2rstf_set;
  wire rcc_c1_rsr_iwdg2rstf_clr;
  wire rcc_c1_rsr_iwdg1rstf_set;
  wire rcc_c1_rsr_iwdg1rstf_clr;
  wire rcc_c1_rsr_sft2rstf_set;
  wire rcc_c1_rsr_sft2rstf_clr;
  wire rcc_c1_rsr_sft1rstf_set;
  wire rcc_c1_rsr_sft1rstf_clr;
  wire rcc_c1_rsr_porrstf_set;
  wire rcc_c1_rsr_porrstf_clr;
  wire rcc_c1_rsr_pinrstf_set;
  wire rcc_c1_rsr_pinrstf_clr;
  wire rcc_c1_rsr_borrstf_set;
  wire rcc_c1_rsr_borrstf_clr;
  wire rcc_c1_rsr_d2rstf_set;
  wire rcc_c1_rsr_d2rstf_clr;
  wire rcc_c1_rsr_d1rstf_set;
  wire rcc_c1_rsr_d1rstf_clr;
  wire rcc_c1_rsr_oblrstf_set;
  wire rcc_c1_rsr_oblrstf_clr;
  wire rcc_c2_rsr_lpwr2rstf_set;
  wire rcc_c2_rsr_lpwr2rstf_clr;
  wire rcc_c2_rsr_lpwr1rstf_set;
  wire rcc_c2_rsr_lpwr1rstf_clr;
  wire rcc_c2_rsr_wwdg2rstf_set;
  wire rcc_c2_rsr_wwdg2rstf_clr;
  wire rcc_c2_rsr_wwdg1rstf_set;
  wire rcc_c2_rsr_wwdg1rstf_clr;
  wire rcc_c2_rsr_iwdg2rstf_set;
  wire rcc_c2_rsr_iwdg2rstf_clr;
  wire rcc_c2_rsr_iwdg1rstf_set;
  wire rcc_c2_rsr_iwdg1rstf_clr;
  wire rcc_c2_rsr_sft2rstf_set;
  wire rcc_c2_rsr_sft2rstf_clr;
  wire rcc_c2_rsr_sft1rstf_set;
  wire rcc_c2_rsr_sft1rstf_clr;
  wire rcc_c2_rsr_porrstf_set;
  wire rcc_c2_rsr_porrstf_clr;
  wire rcc_c2_rsr_pinrstf_set;
  wire rcc_c2_rsr_pinrstf_clr;
  wire rcc_c2_rsr_borrstf_set;
  wire rcc_c2_rsr_borrstf_clr;
  wire rcc_c2_rsr_d2rstf_set;
  wire rcc_c2_rsr_d2rstf_clr;
  wire rcc_c2_rsr_d1rstf_set;
  wire rcc_c2_rsr_d1rstf_clr;
  wire rcc_c2_rsr_oblrstf_set;
  wire rcc_c2_rsr_oblrstf_clr;

  wire nxt_rcc_c1_rsr_rmvf;
  wire nxt_rcc_c2_rsr_rmvf;
  wire nxt_rcc_csr_lsion;

  wire gen_rst_n;
  /*AUTO DECLARE*/

  test_rst_mux u_rst_n_mux (
      .test_rst_n(test_rst_n),
      .func_rst_n(rst_n),
      .testmode  (testmode),
      .rst_n     (gen_rst_n)
  );


  // --------------------------------------------------------------------------------
  // 31:31               lpwr2rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_lpwr2rstf_set = lpwr2_rst;
  assign rcc_c1_rsr_lpwr2rstf_clr = cur_rcc_c1_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c1_rsr_lpwr2rstf_latch (
      .D       (~rcc_c1_rsr_lpwr2rstf_clr),
      .GN      (rcc_c1_rsr_lpwr2rstf_set || rcc_c1_rsr_lpwr2rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c1_rsr_lpwr2rstf)
  );





  // --------------------------------------------------------------------------------
  // 30:30               lpwr1rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_lpwr1rstf_set = lpwr1_rst;
  assign rcc_c1_rsr_lpwr1rstf_clr = cur_rcc_c1_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c1_rsr_lpwr1rstf_latch (
      .D       (~rcc_c1_rsr_lpwr1rstf_clr),
      .GN      (rcc_c1_rsr_lpwr1rstf_set || rcc_c1_rsr_lpwr1rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c1_rsr_lpwr1rstf)
  );





  // --------------------------------------------------------------------------------
  // 29:29               wwdg2rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_wwdg2rstf_set = wwdg2_out_rst;
  assign rcc_c1_rsr_wwdg2rstf_clr = cur_rcc_c1_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c1_rsr_wwdg2rstf_latch (
      .D       (~rcc_c1_rsr_wwdg2rstf_clr),
      .GN      (rcc_c1_rsr_wwdg2rstf_set || rcc_c1_rsr_wwdg2rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c1_rsr_wwdg2rstf)
  );





  // --------------------------------------------------------------------------------
  // 28:28               wwdg1rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_wwdg1rstf_set = wwdg1_out_rst;
  assign rcc_c1_rsr_wwdg1rstf_clr = cur_rcc_c1_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c1_rsr_wwdg1rstf_latch (
      .D       (~rcc_c1_rsr_wwdg1rstf_clr),
      .GN      (rcc_c1_rsr_wwdg1rstf_set || rcc_c1_rsr_wwdg1rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c1_rsr_wwdg1rstf)
  );





  // --------------------------------------------------------------------------------
  // 27:27               iwdg2rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_iwdg2rstf_set = iwdg2_out_rst;
  assign rcc_c1_rsr_iwdg2rstf_clr = cur_rcc_c1_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c1_rsr_iwdg2rstf_latch (
      .D       (~rcc_c1_rsr_iwdg2rstf_clr),
      .GN      (rcc_c1_rsr_iwdg2rstf_set || rcc_c1_rsr_iwdg2rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c1_rsr_iwdg2rstf)
  );





  // --------------------------------------------------------------------------------
  // 26:26               iwdg1rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_iwdg1rstf_set = iwdg1_out_rst;
  assign rcc_c1_rsr_iwdg1rstf_clr = cur_rcc_c1_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c1_rsr_iwdg1rstf_latch (
      .D       (~rcc_c1_rsr_iwdg1rstf_clr),
      .GN      (rcc_c1_rsr_iwdg1rstf_set || rcc_c1_rsr_iwdg1rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c1_rsr_iwdg1rstf)
  );




  // --------------------------------------------------------------------------------
  // 25:25               sft2rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_sft2rstf_set = cpu2_sftrst;
  assign rcc_c1_rsr_sft2rstf_clr = cur_rcc_c1_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c1_rsr_sft2rstf_latch (
      .D       (~rcc_c1_rsr_sft2rstf_clr),
      .GN      (rcc_c1_rsr_sft2rstf_set || rcc_c1_rsr_sft2rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c1_rsr_sft2rstf)
  );





  // --------------------------------------------------------------------------------
  // 24:24               sft1rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_sft1rstf_set = cpu1_sftrst;
  assign rcc_c1_rsr_sft1rstf_clr = cur_rcc_c1_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c1_rsr_sft1rstf_latch (
      .D       (~rcc_c1_rsr_sft1rstf_clr),
      .GN      (rcc_c1_rsr_sft1rstf_set || rcc_c1_rsr_sft1rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c1_rsr_sft1rstf)
  );





  // --------------------------------------------------------------------------------
  // 23:23               porrstf              RO                  1'b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_porrstf_set = pwr_por_rst;
  assign rcc_c1_rsr_porrstf_clr = cur_rcc_c1_rsr_rmvf;
  BB_latch u_BB_rcc_c1_rsr_porrstf_latch (
      .D       (rcc_c1_rsr_porrstf_set),
      .GN      (rcc_c1_rsr_porrstf_clr || rcc_c1_rsr_porrstf_set),
      .testmode(testmode),
      .Q       (cur_rcc_c1_rsr_porrstf)
  );





  // --------------------------------------------------------------------------------
  // 22:22               pinrstf              RO                  1'b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_pinrstf_set = nrst_in;
  assign rcc_c1_rsr_pinrstf_clr = cur_rcc_c1_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c1_rsr_pinrstf_latch (
      .D       (~rcc_c1_rsr_pinrstf_clr),
      .GN      (rcc_c1_rsr_pinrstf_clr || rcc_c1_rsr_pinrstf_set),
      .testmode(testmode),
      .Q       (cur_rcc_c1_rsr_pinrstf)
  );





  // --------------------------------------------------------------------------------
  // 21:21               borrstf              RO                  1'b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_borrstf_set = pwr_bor_rst;
  assign rcc_c1_rsr_borrstf_clr = cur_rcc_c1_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c1_rsr_borrstf_latch (
      .D       (~rcc_c1_rsr_borrstf_clr),
      .GN      (rcc_c1_rsr_borrstf_clr || rcc_c1_rsr_borrstf_set),
      .testmode(testmode),
      .Q       (cur_rcc_c1_rsr_borrstf)
  );





  // --------------------------------------------------------------------------------
  // 20:20               d2rstf              RO                  1'b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_d2rstf_set = d2_rst;
  assign rcc_c1_rsr_d2rstf_clr = cur_rcc_c1_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c1_rsr_d2rstf_latch (
      .D       (~rcc_c1_rsr_d2rstf_clr),
      .GN      (rcc_c1_rsr_d2rstf_clr || rcc_c1_rsr_d2rstf_set),
      .testmode(testmode),
      .Q       (cur_rcc_c1_rsr_d2rstf)
  );



  // --------------------------------------------------------------------------------
  // 19:19               d1rstf              RO                  1'b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_d1rstf_set = d1_rst;
  assign rcc_c1_rsr_d1rstf_clr = cur_rcc_c1_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c1_rsr_d1rstf_latch (
      .D       (~rcc_c1_rsr_d1rstf_clr),
      .GN      (rcc_c1_rsr_d1rstf_clr || rcc_c1_rsr_d1rstf_set),
      .testmode(testmode),
      .Q       (cur_rcc_c1_rsr_d1rstf)
  );





  // --------------------------------------------------------------------------------
  // 17:17               oblrstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c1_rsr_oblrstf_set = obl_rst;
  assign rcc_c1_rsr_oblrstf_clr = cur_rcc_c1_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c1_rsr_oblrstf_latch (
      .D       (~rcc_c1_rsr_oblrstf_clr),
      .GN      (rcc_c1_rsr_oblrstf_clr || rcc_c1_rsr_oblrstf_set),
      .testmode(testmode),
      .Q       (cur_rcc_c1_rsr_oblrstf)
  );


  // --------------------------------------------------------------------------------
  // 16:16               rmvf                RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign nxt_rcc_c1_rsr_rmvf = rcc_vdd_wdata;

  BB_dfflr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c1_rsr_rmvf (
      .clk  (rcc_c1_rsr_rmvf_wren),
      .rst_n(gen_rst_n),
      .en   (rcc_vdd_wdata),
      .din  (nxt_rcc_c1_rsr_rmvf),
      .dout (cur_rcc_c1_rsr_rmvf)
  );


  // --------------------------------------------------------------------------------
  // 31:31               lpwr2rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_lpwr2rstf_set = lpwr2_rst;
  assign rcc_c2_rsr_lpwr2rstf_clr = cur_rcc_c2_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c2_rsr_lpwr2rstf_latch (
      .D       (~rcc_c2_rsr_lpwr2rstf_clr),
      .GN      (rcc_c2_rsr_lpwr2rstf_set || rcc_c2_rsr_lpwr2rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c2_rsr_lpwr2rstf)
  );





  // --------------------------------------------------------------------------------
  // 30:30               lpwr1rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_lpwr1rstf_set = lpwr1_rst;
  assign rcc_c2_rsr_lpwr1rstf_clr = cur_rcc_c2_rsr_rmvf || ~gen_rst_n;
  BB_latch u_BB_rcc_c2_rsr_lpwr1rstf_latch (
      .D       (~rcc_c2_rsr_lpwr1rstf_clr),
      .GN      (rcc_c2_rsr_lpwr1rstf_set || rcc_c2_rsr_lpwr1rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c2_rsr_lpwr1rstf)
  );





  // --------------------------------------------------------------------------------
  // 29:29               wwdg2rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_wwdg2rstf_set = wwdg2_out_rst;
  assign rcc_c2_rsr_wwdg2rstf_clr = cur_rcc_c2_rsr_rmvf || ~gen_rst_n;

  BB_latch u_BB_rcc_c2_rsr_wwdg2rstf_latch (
      .D       (~rcc_c2_rsr_wwdg2rstf_clr),
      .GN      (rcc_c2_rsr_wwdg2rstf_set || rcc_c2_rsr_wwdg2rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c2_rsr_wwdg2rstf)
  );




  // --------------------------------------------------------------------------------
  // 28:28               wwdg1rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_wwdg1rstf_set = wwdg1_out_rst;
  assign rcc_c2_rsr_wwdg1rstf_clr = cur_rcc_c2_rsr_rmvf || ~gen_rst_n;

  BB_latch u_BB_rcc_c2_rsr_wwdg1rstf_latch (
      .D       (~rcc_c2_rsr_wwdg1rstf_clr),
      .GN      (rcc_c2_rsr_wwdg1rstf_set || rcc_c2_rsr_wwdg1rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c2_rsr_wwdg1rstf)
  );





  // --------------------------------------------------------------------------------
  // 27:27               iwdg2rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_iwdg2rstf_set = iwdg1_out_rst;
  assign rcc_c2_rsr_iwdg2rstf_clr = cur_rcc_c2_rsr_rmvf || ~gen_rst_n;

  BB_latch u_BB_rcc_c2_rsr_iwdg2rstf_latch (
      .D       (~rcc_c2_rsr_iwdg2rstf_clr),
      .GN      (rcc_c2_rsr_iwdg2rstf_set || rcc_c2_rsr_iwdg2rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c2_rsr_iwdg2rstf)
  );





  // --------------------------------------------------------------------------------
  // 26:26               iwdg1rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_iwdg1rstf_set = iwdg1_out_rst;
  assign rcc_c2_rsr_iwdg1rstf_clr = cur_rcc_c2_rsr_rmvf || ~gen_rst_n;

  BB_latch u_BB_rcc_c2_rsr_iwdg1rstf_latch (
      .D       (~rcc_c2_rsr_iwdg1rstf_clr),
      .GN      (rcc_c2_rsr_iwdg1rstf_set || rcc_c2_rsr_iwdg1rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c2_rsr_iwdg1rstf)
  );





  // --------------------------------------------------------------------------------
  // 25:25               sft2rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_sft2rstf_set = cpu2_sftrst;
  assign rcc_c2_rsr_sft2rstf_clr = cur_rcc_c2_rsr_rmvf || ~gen_rst_n;


  BB_latch u_BB_rcc_c2_rsr_sft2rstf_latch (
      .D       (~rcc_c2_rsr_sft2rstf_clr),
      .GN      (rcc_c2_rsr_sft2rstf_set || rcc_c2_rsr_sft2rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c2_rsr_sft2rstf)
  );



  // --------------------------------------------------------------------------------
  // 24:24               sft1rstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_sft1rstf_set = cpu1_sftrst;
  assign rcc_c2_rsr_sft1rstf_clr = cur_rcc_c2_rsr_rmvf || ~gen_rst_n;

  BB_latch u_BB_rcc_c2_rsr_sft1rstf_latch (
      .D       (~rcc_c2_rsr_sft1rstf_clr),
      .GN      (rcc_c2_rsr_sft1rstf_set || rcc_c2_rsr_sft1rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c2_rsr_sft1rstf)
  );





  // --------------------------------------------------------------------------------
  // 23:23               porrstf              RO                  1'b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_porrstf_set = pwr_por_rst;
  assign rcc_c2_rsr_porrstf_clr = cur_rcc_c2_rsr_rmvf || ~gen_rst_n;

  BB_latch u_BB_rcc_c2_rsr_porrstf_latch (
      .D       (rcc_c2_rsr_porrstf_set),
      .GN      (rcc_c2_rsr_porrstf_clr || rcc_c2_rsr_porrstf_set),
      .testmode(testmode),
      .Q       (cur_rcc_c2_rsr_porrstf)
  );





  // --------------------------------------------------------------------------------
  // 22:22               pinrstf              RO                  1'b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_pinrstf_set = nrst_in;
  assign rcc_c2_rsr_pinrstf_clr = cur_rcc_c2_rsr_rmvf || ~gen_rst_n;

  BB_latch u_BB_rcc_c2_rsr_pinrstf_latch (
      .D       (~rcc_c2_rsr_pinrstf_clr),
      .GN      (rcc_c2_rsr_pinrstf_clr || rcc_c2_rsr_pinrstf_set),
      .testmode(testmode),
      .Q       (cur_rcc_c2_rsr_pinrstf)
  );





  // --------------------------------------------------------------------------------
  // 21:21               borrstf              RO                  1'b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_borrstf_set = pwr_bor_rst;
  assign rcc_c2_rsr_borrstf_clr = cur_rcc_c2_rsr_rmvf || ~gen_rst_n;

  BB_latch u_BB_rcc_c2_rsr_borrstf_latch (
      .D       (~rcc_c2_rsr_borrstf_clr),
      .GN      (rcc_c2_rsr_borrstf_clr || rcc_c2_rsr_borrstf_set),
      .testmode(testmode),
      .Q       (cur_rcc_c2_rsr_borrstf)
  );





  // --------------------------------------------------------------------------------
  // 20:20               d2rstf              RO                  1'b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_d2rstf_set = d2_rst;
  assign rcc_c2_rsr_d2rstf_clr = cur_rcc_c2_rsr_rmvf || ~gen_rst_n;

  BB_latch u_BB_rcc_c2_rsr_d2rstf_latch (
      .D       (~rcc_c2_rsr_d2rstf_clr),
      .GN      (rcc_c2_rsr_d2rstf_set || rcc_c2_rsr_d2rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c2_rsr_d2rstf)
  );




  // --------------------------------------------------------------------------------
  // 19:19               d1rstf              RO                  1'b1                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_d1rstf_set = d1_rst;
  assign rcc_c2_rsr_d1rstf_clr = cur_rcc_c2_rsr_rmvf || ~gen_rst_n;

  BB_latch u_BB_rcc_c2_rsr_d1rstf_latch (
      .D       (~rcc_c2_rsr_d1rstf_clr),
      .GN      (rcc_c2_rsr_d1rstf_set || rcc_c2_rsr_d1rstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c2_rsr_d1rstf)
  );





  // --------------------------------------------------------------------------------
  // 17:17               oblrstf              RO                  1'b0                 
  // --------------------------------------------------------------------------------
  assign rcc_c2_rsr_oblrstf_set = obl_rst;
  assign rcc_c2_rsr_oblrstf_clr = cur_rcc_c2_rsr_rmvf || ~gen_rst_n;

  BB_latch u_BB_rcc_c2_rsr_oblrstf_latch (
      .D       (~rcc_c2_rsr_oblrstf_clr),
      .GN      (rcc_c2_rsr_oblrstf_set || rcc_c2_rsr_oblrstf_clr),
      .testmode(testmode),
      .Q       (cur_rcc_c2_rsr_oblrstf)
  );

  // --------------------------------------------------------------------------------
  // 16:16               rmvf                RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign nxt_rcc_c2_rsr_rmvf = rcc_vdd_wdata;

  BB_dffr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_c2_rsr_rmvf (
      .clk  (rcc_c2_rsr_rmvf_wren),
      .rst_n(gen_rst_n),
      .din  (nxt_rcc_c2_rsr_rmvf),
      .dout (cur_rcc_c2_rsr_rmvf)
  );

  // --------------------------------------------------------------------------------
  // 1:1                 lsirdy              RO                  0b0                 
  // --------------------------------------------------------------------------------
  // assign cur_rcc_csr_lsirdy = lsi_rdy;

  // --------------------------------------------------------------------------------
  // 0:0                 lsion               RW                  0b0                 
  // --------------------------------------------------------------------------------
  assign nxt_rcc_csr_lsion = rcc_vdd_wdata;

  BB_dffr #(
      .DW     (1),
      .RST_VAL('h0)
  ) U_rcc_csr_lsion (
      .clk  (rcc_csr_lsion_wren),
      .rst_n(gen_rst_n),
      .din  (nxt_rcc_csr_lsion),
      .dout (cur_rcc_csr_lsion)
  );


endmodule
// spyglass enable_block Reset_sync02
