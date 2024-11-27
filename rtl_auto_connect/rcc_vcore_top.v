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
    input  raw_i2s_clk_in,
    input  raw_usb_phy1,
    input  raw_csi_origin_clk,
    input  raw_hse_origin_clk,
    input  raw_hsi48_origin_clk,
    input  raw_hsi_origin_clk,
    input  raw_pad_rcc_eth_mii_tx_clk,
    input  raw_pad_rcc_eth_mii_rx_clk,
    input  raw_pll1_p_clk,
    input  raw_pll1_q_clk,
    input  raw_pll2_p_clk,
    input  raw_pll2_q_clk,
    input  raw_pll2_r_clk,
    input  raw_pll3_p_clk,
    input  raw_pll3_q_clk,
    input  raw_pll3_r_clk,
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

  //select signals
  wire [   1:0] raw_pllsrc;
  wire [   2:0] raw_mco1sel;
  wire [   2:0] raw_mco2sel;
  wire [   1:0] raw_sw;
  wire          raw_hrtimsel;
  wire [   1:0] raw_clkpersel;
  //division ratio signals
  wire [   1:0] raw_hsidiv;
  wire [   5:0] raw_divm1;
  wire [   5:0] raw_divm2;
  wire [   5:0] raw_divm3;
  wire [   3:0] raw_mco1pre;
  wire [   3:0] raw_mco2pre;
  wire [   5:0] raw_rtcpre;
  wire [   3:0] raw_d1cpre;
  wire [   2:0] raw_d1ppre;
  wire [   3:0] raw_hpre;
  wire [   2:0] raw_d2ppre1;
  wire [   2:0] raw_d2ppre2;
  wire [   2:0] raw_d3ppre;
  wire          raw_timpre;

  wire          gen_pll1_q_clk;
  wire          gen_pll2_p_clk;
  wire          gen_pll2_q_clk;
  wire          gen_pll2_r_clk;
  wire          gen_pll3_p_clk;
  wire          gen_pll3_q_clk;
  wire          gen_pll3_r_clk;

  wire          gen_eth_rcc_fes;
  wire          gen_eth_rcc_epis_2;
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
      .mdata  (mdata)
      /*AUTOINST*/
  );
  //================================================================
  // rcc PAD clock mux 
  //================================================================

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
      .bdrst         (cur_rcc_bdcr_bdrst),
      .gen_pll1_q_clk(gen_pll1_q_clk),
      .gen_pll2_p_clk(gen_pll2_p_clk),
      .gen_pll2_q_clk(gen_pll2_q_clk),
      .gen_pll2_r_clk(gen_pll2_r_clk),
      .gen_pll3_p_clk(gen_pll3_p_clk),
      .gen_pll3_q_clk(gen_pll3_q_clk),
      .gen_pll3_r_clk(gen_pll3_r_clk)
      /*AUTOINST*/
  );

  //rcc_per_clk_rst_control

  rcc_per_clk_rst_control #(  /*AUTOINSTPARAM*/
  ) u_rcc_per_clk_rst_control (
      .pll1_q_clk(gen_pll1_q_clk),
      .pll2_p_clk(gen_pll2_p_clk),
      .pll2_q_clk(gen_pll2_q_clk),
      .pll2_r_clk(gen_pll2_r_clk),
      .pll3_p_clk(gen_pll3_p_clk),
      .pll3_q_clk(gen_pll3_q_clk),
      .pll3_r_clk(gen_pll3_r_clk)
      /*AUTOINST*/
  );

  //rcc_eth_ker_clk_ctrl
  rcc_eth_ker_clk_ctrl u_rcc_eth_ker_clk_ctrl (
      .rst_n         (sys_rst_n),
      .eth_rcc_fes   (gen_eth_rcc_fes),
      .eth_rcc_epis_2(gen_eth_rcc_epis_2)
      /*AUTOINST*/
  );

  //================================================================
  // rcc config mux for atspeed test
  //================================================================
  rcc_config_mux u_rcc_config_mux (
      .gen_eth_rcc_fes   (gen_eth_rcc_fes),
      .gen_eth_rcc_epis_2(gen_eth_rcc_epis_2)
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
      .pllsrc             (raw_pllsrc),
      .mco1sel            (raw_mco1sel),
      .mco2sel            (raw_mco2sel),
      .sw                 (raw_sw),
      .hrtimsel           (raw_hrtimsel),
      .clkpersel          (raw_clkpersel),
      .hsidiv             (raw_hsidiv),
      .divm1              (raw_divm1),
      .divm2              (raw_divm2),
      .divm3              (raw_divm3),
      .mco1pre            (raw_mco1pre),
      .mco2pre            (raw_mco2pre),
      .rtcpre             (raw_rtcpre),
      .d1cpre             (raw_d1cpre),
      .d1ppre             (raw_d1ppre),
      .hpre               (raw_hpre),
      .d2ppre1            (raw_d2ppre1),
      .d2ppre2            (raw_d2ppre2),
      .d3ppre             (raw_d3ppre),
      .timpre             (raw_timpre)
      /*AUTOINST*/
  );

endmodule
