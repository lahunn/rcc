// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : RCC VSW top module
// ****************************************************************
module rcc_vsw_top (
    input pwr_vsw_rst,
    input sync_vsw_rst_n,  // vsw reset signal sync with sys clk
    //hse rtc clk
    input raw_hse_rtc_clk,     //hse clock from vcore domain
    input lsi_clk,         //lsi clock from vdd domain
    input lse_clk,         //lsi clock from vsw domain
    //test mode
    input testmode,
    input scan_mode,
    input test_clk,
    /*AUTOINPUT*/
    //rtc kernel clk
    output rcc_rtc_ker_clk,
    //vsw reset signal not sync with sys clk
    output vsw_rst_n
    /*AUTOOUTPUT*/
);

  /*AUTOWIRE*/

  ///================================================================
  // rcc vsw domain test clock mux 
  //================================================================

  rcc_vsw_port_clock_mux u_rcc_vsw_port_clock_mux (
  /*AUTOINST*/
  );

  // rcc vsw registers
  rcc_vsw_reg u_rcc_vsw_reg (
      .rst_n(sync_vsw_rst_n)
      /*AUTOINST*/
  );
  rcc_vsw_clk_rst_ctrl u_rcc_vsw_clk_rst_ctrl (
      .lse_clk(gen_lse_clk)
      /*AUTOINST*/
  );
  // level shift
  // level shift should be added in integration
  // voltage isolation 
  // voltage isolation should be added in integration
endmodule
