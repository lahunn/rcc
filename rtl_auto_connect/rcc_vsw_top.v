module rcc_vsw_top (
  input pwr_vsw_rst,
  input sync_vsw_rst_n,// vsw reset signal sync with sys clk
  //hse rtc clk
  input hse_rtc_clk,//hse clock from vcore domain
  input lsi_clk,//lsi clock from vdd domain
  input lse_clk,//lsi clock from vsw domain
  //test mode
  input testmode,
  /*AUTOINPUT*/
  /*AUTOOUTPUT*/
  //rtc kernel clk
  output rcc_rtc_ker_clk,
  //vsw reset signal not sync with sys clk
  output pre_vsw_rst_n
  /*AUTOINPUT*/
  /*AUTOOUTPUT*/
);

  /*AUTOWIRE*/

  // rcc vsw registers
  rcc_vsw_reg u_rcc_vsw_reg (
      .rst_n(sync_vsw_rst_n),
      /*AUTOINST*/
  );
  rcc_vsw_clk_rst_ctrl u_rcc_vsw_clk_rst_ctrl (
      /*AUTOINST*/
  );
  // level shift
  // level shift should be added in integration
  // voltage isolation 
  // voltage isolation should be added in integration
endmodule
