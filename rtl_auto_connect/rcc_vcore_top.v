module rcc_vcore_top #(
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
    parameter WW = 4
) (
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);
  wire [DW-1:0] rdata;
  wire [   1:0] rsp;
  wire          mreq;
  wire [AW-1:0] maddr;
  wire [WW-1:0] mwstrb;
  wire [DW-1:0] mdata;
  /*AUTOWIRE*/
  /*AUTO DECLARE*/
  BB_ahb2reg #(  /*AUTOINSTPARAM*/
  ) u_BB_rcc_ahb2reg (
      .mwrite(),
      .sready(1'b1),
      .sresp (rsp[0]),
      .sdata (rdata),
      .mreq  (mreq),
      .mwstrb (mwstrb),
      .maddr (maddr),
      .mdata (mdata),
      /*AUTOINST*/
  );

  rcc_sys_clk_rst_ctrl #(  /*AUTOINSTPARAM*/
  ) u_rcc_sys_clk_rst_ctrl (  /*AUTOINST*/
  );

  rcc_per_clk_rst_control #(  /*AUTOINSTPARAM*/
  ) u_rcc_per_clk_rst_control (
  /*AUTOINST*/
  );

  rcc_eth_ker_clk_ctrl u_rcc_eth_ker_clk_ctrl (
      .rst_n(sys_sync_rst_n),
      /*AUTOINST*/
  );

  rcc_reg #(  /*AUTOINSTPARAM*/
  ) u_rcc_reg (
      .clk  (hclk),
      .rst_n(hresetn),
      .req  (mreq),
      .we   (mwstrb),
      .addr (maddr),
      .wdata(mdata),
      .rdata(rdata),
      .rsp  (rsp),
      /*AUTOINST*/
  );

endmodule
