module rcc_top #(
    parameter CLK_ON_AFTER_PER_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_SYS_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_D1_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_D2_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_CPU1_RST_RELEASE = 8,
    parameter CLK_ON_AFTER_CPU2_RST_RELEASE = 8,
    parameter D2_RST_DURATION = 10,
    parameter D1_RST_DURATION = 10,
    // ================================================================================
    // CONFIGURABLE PARAMETERS
    // ================================================================================
    parameter AW = 32,
    parameter DW = 32,
    parameter WW = DW / 8
) (
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);

  /*AUTOWIRE*/
  /*AUTO DECLARE*/

  //INSTANTCE

  rcc_vsw_top u_rcc_vsw_top (  /*AUTOINST*/
      .wdata(rcc_vsw_wdata),
  );

  rcc_vdd_top u_rcc_vdd_top (  /*AUTOINST*/
      .wdata(rcc_vdd_wdata),
  );

  rcc_vcore_top #(  /*AUTOINSTPARAM*/
  ) u_rcc_vcore_top (  /*AUTOINST*/

  );


endmodule
