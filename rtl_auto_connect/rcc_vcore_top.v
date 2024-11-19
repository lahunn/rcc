// ****************************************************************
// DATA : 2024-11-14
// AUTHOR : yunbai@zju.edu.cn
// FUNCTION : RCC VCORE TOP
// ****************************************************************
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
    //bus clock signals
    output rcc_axibridge_d1_clk,
    output rcc_ahb3bridge_d1_clk,
    output rcc_apb3bridge_d1_clk,
    output rcc_ahb1bridge_d2_clk,
    output rcc_ahb2bridge_d2_clk,
    output rcc_apb1bridge_d2_clk,
    output rcc_apb2bridge_d2_clk,
    output rcc_ahb4bridge_d3_clk,
    output rcc_apb4bridge_d3_clk
);
  wire [DW-1:0] rdata;
  wire [   1:0] rsp;
  wire          mreq;
  wire [AW-1:0] maddr;
  wire [WW-1:0] mwstrb;
  wire [DW-1:0] mdata;
  wire          sync_lsecss_fail;
  wire          sync_hsecss_fail;
  wire          sync_hsecss_fail_rst;  //async reset sync release
  /*AUTOWIRE*/

  //==============================================================================
  //rcc_ahb_lite bus
  //==============================================================================

  BB_ahb2reg #(  /*AUTOINSTPARAM*/
  ) u_BB_rcc_ahb2reg (
      .hclk   (rcc_rcc_hclk),
      .hresetn(rcc_rcc_sync_rst_n),
      .mwrite (),
      .sready (1'b1),
      .sresp  (rsp[0]),
      .sdata  (rdata),
      .mreq   (mreq),
      .mwstrb (mwstrb),
      .maddr  (maddr),
      .mdata  (mdata),
      /*AUTOINST*/
  );
  //==============================================================================
  //signal synchronize 
  //==============================================================================

  rcc_signal_sync u_rcc_signal_sync (
  /*AUTOINST*/
  );

  rcc_rst_sync u_rcc_rst_sync (
  /*AUTOINST*/
  );


  //==============================================================================
  //clock and reset control
  //==============================================================================
  rcc_sys_clk_rst_ctrl #(  /*AUTOINSTPARAM*/
  ) u_rcc_sys_clk_rst_ctrl (
    .bdrst(cur_rcc_bdcr_bdrst),  
    /*AUTOINST*/
  );

  //rcc_per_clk_rst_control

  rcc_per_clk_rst_control #(  /*AUTOINSTPARAM*/
  ) u_rcc_per_clk_rst_control (
  /*AUTOINST*/
  );

  //rcc_eth_ker_clk_ctrl
  rcc_eth_ker_clk_ctrl u_rcc_eth_ker_clk_ctrl (
      .rst_n(sys_rst_n),
      /*AUTOINST*/
  );


  //==============================================================================
  //rcc_vcore_reg
  //==============================================================================
  rcc_vcore_reg #(  /*AUTOINSTPARAM*/
  ) u_rcc_vcore_reg (
      .clk                (rcc_rcc_hclk),
      .rst_n              (rcc_rcc_sync_rst_n),
      .req                (mreq),
      .we                 (mwstrb),
      .addr               (maddr),
      .wdata              (mdata),
      .rdata              (rdata),
      .rsp                (rsp),
      .cur_rcc_csr_lsirdy (sync_lsi_rdy),
      .cur_rcc_bdcr_lserdy(sync_lse_rdy),
      /*AUTOINST*/
  );

endmodule
