module rcc_vcore_top #(
    parameter CLK_ON_AFTER_PER_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_SYS_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_D1_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_D2_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_CPU1_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_CPU2_RST_RELEASE = 8,
    // ================================================================================
    // CONFIGURABLE PARAMETERS
    // ================================================================================
    parameter AW = 29,
    parameter DW = 32,
    parameter WW = DW / 8
) (
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);
  /*AUTOWIRE*/
  /*AUTO DECLARE*/

  ///////////////////////////////////////
  // dx_req signal generate /////////////
  ///////////////////////////////////////

  assign rcc_exit_sys_stop    = pwr_d3_wkup;

  assign d1_rst               = ~d1_rst_n;
  assign d2_rst               = ~d2_rst_n;

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
  ) u_BB_rcc_pwr_d1_req_dfflrs (
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
  ) u_BB_rcc_pwr_d2_req_dfflrs (
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
  ) u_BB_rcc_pwr_d3_req_dfflrs (
      .clk  (sys_clk),
      .rst_n(sys_arcg_rst_n),
      .set_n(rcc_pwr_d3_req_set_n),
      .en   (pwr_d3_wkup),
      .din  (1'b0),

      .dout(rcc_pwr_d3_req)
  );

  // interrrupt logic
  assign rcc_hsefail_it    = rcc_hsecssf;
  assign rcc_lsefail_it    = rcc_lsecssf & lsecssie;
  assign rcc_it            = (rcc_pll3rdyf & pll3rdyie) | (rcc_pll2rdyf & pll2rdyie) | (rcc_pll1rdyf & pll1rdyie) | (rcc_hsi48rdyf & hsi48rdyie) | (rcc_csirdyf & csirdyie) | (rcc_hserdyf & hserdyie) | (rcc_hsirdyf & hsirdyie) | (rcc_lserdyf & lserdyie) | (rcc_lsirdyf & lsirdyie);


  ///////////////////////////////////////
  //signals rename //////////////////////
  ///////////////////////////////////////
  assign sys_clk_sw        = sw;
  assign pll_src_sel       = pllsrc;
  assign rcc_c1_flash_lpen = rcc_c1_flitf_lpen;
  assign rcc_c2_flash_en   = rcc_c2_flitf_en;
  assign rcc_c2_flash_lpen = rcc_c2_flitf_lpen;

  rcc_vcore_clk_ctrl u_rcc_vcore_clk_ctrl (  /*AUTOINST*/
  );

  rcc_reg #(  /*AUTOINSTPARAM*/
  ) u_rcc_reg (  /*AUTOINST*/
  );

endmodule
