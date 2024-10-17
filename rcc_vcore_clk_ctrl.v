module rcc_vcore_clk_ctrl(
// signals connected to PAD 
    input [0:0] OSC32_IN,
    output [0:0] OSC32_OUT,
    input [0:0] OSC_IN,
    output [0:0] OSC_OUT,
    output [0:0] MCO1,
    output [0:0] MCO2,
    input [0:0] ARCG_ON,
    input [0:0] I2S_CLKIN,
    input [0:0] ETH_MII_TX_CLK,
    input [0:0] ETH_MII_RX_CLK,
    input [0:0] ETH_RMII_REF_CLK,
    input [0:0] USB_PHY1,
    input [0:0] USB_PHY2,
// signals connected to PWR 
    input [0:0] d3_deepsleep,
    input [0:0] pwr_d3_wkup,
    input [0:0] pwr_d2_wkup,
    input [0:0] pwr_d1_wkup,
    output [0:0] rcc_pwd_d3_req,
    output [0:0] rcc_pwd_d2_req,
    output [0:0] rcc_pwd_d1_req,
    output [0:0] cpu_per_alloc_d1,
    output [0:0] cpu_per_alloc_d2,
    input [0:0] pwr_vcore_ok,
    input [0:0] backup_protect,
    input [0:0] pwr_vdd_poweroff,
// signals connected to CPU 
    input [0:0] c2_sleep,
    input [0:0] c2_deepsleep,
    input [0:0] c1_sleep,
    input [0:0] c1_deepsleep,
    output [0:0] rcc_c2_clk,
    output [0:0] rcc_fclk_c2,
    output [0:0] rcc_c2_systick_clk,
    output [0:0] rcc_c2_rst_n,
    output [0:0] rcc_c1_clk,
    output [0:0] rcc_fclk_c1,
    output [0:0] rcc_c1_systick_clk,
    output [0:0] rcc_c1_rst_n,
// signals connected to FLASH 
    output [0:0] rcc_obl_rst,
    output [0:0] rcc_obl_clk,
    output [0:0] rcc_flash_rst,
    output [0:0] rcc_flash_aclk1,
    output [0:0] rcc_flash_aclk2,
    output [0:0] rcc_flash_hclk,
    input [0:0] flash_obl_reload,
    input [0:0] Tamp_rst_req,
    input [7:0] flash_csi_opt,
    input [11:0] flash_hsi_opt,
    input [0:0] obl_done,
// signals connected to CRS 
    input [9:0] crs_hsi48_trim,
// signals connected to 各类外设 
    output [0:0] rcc_perx_rst,
    output [0:0] rcc_perx_pclk,
    output perx_hclk,
    output perx_aclk,
    output [0:0] rcc_perx_ker_clk,
    input [0:0] perx_ker_clk_req,
// signals connected to 总线时钟 
    output [0:0] rcc_bus_clk,
    output [0:0] rcc_bus_clk_en,
// signals connected to 复位源 
    input [0:0] nrst_in,
    output [0:0] nrst_out,
    input [0:0] iwdg1_out_rst,
    input [0:0] wwdg1_out_rst,
    input [0:0] iwdg2_out_rst,
    input [0:0] wwdg2_out_rst,
    input lpwr2_rst,
    input lpwr1_rst,
    input [0:0] obl_load_rst,
    input [0:0] pwr_bor_rst,
    input [0:0] pwr_por_rst,
    input [0:0] pwr_vsw_rst,
    input [0:0] d1_rst,
    input [0:0] d2_rst,
    input [0:0] stby_rst,
    input [0:0] cpu2_sftrst,
    input [0:0] cpu1_sftrst,
// signals connected to busy 指示信号 
    input [0:0] axibridge_d1_busy,
    input [0:0] ahbbridge_d1_busy,
    input [0:0] apbbridge_d1_busy,
    input [0:0] ahb1bridge_d2_busy,
    input [0:0] ahb2bridge_d2_busy,
    input [0:0] apb1bridge_d2_busy,
    input [0:0] apb2bridge_d2_busy,
    input [0:0] ahb4bridge_d3_busy,
    input [0:0] apb4bridge_d3_busy,
    input [0:0] flash_busy,
// signals connected to PLL * 3 
    input [0:0] pllx_rdy,
    output [0:0] pllx_on,
    output [0:0] divrx_en,
    output [0:0] divqx_en,
    output [0:0] divpx_en,
    output [1:0] pllx_rge,
    output [0:0] pllx_vco_sel,
    output [0:0] pllx_frac_en,
    output [6:0] rcc_pllx_divrx,
    output [6:0] rcc_pllx_divqx,
    output [6:0] rcc_pllx_divpx,
    output [8:0] rcc_pllx_divnx,
    output [12:0] rcc_pllx_fracnx,
    output [0:0] rcc_pllx_ref_clk,
    input [0:0] pllx_pclk,
    input [0:0] pllx_qclk,
    input [0:0] pllx_rclk,
// signals connected to HSE 
    output [0:0] hse_css_on,
    output [0:0] hse_byp,
    input [0:0] hse_rdy,
    output [0:0] hse_on,
    input [0:0] hse_css_fail,
    input [0:0] hse_clk_pre,
// signals connected to HSI48 
    input [0:0] hsi48_ready,
    output [0:0] hsi48_on,
    output [9:0] hsi48_trim,
    input [0:0] hsi48_clk,
// signals connected to CSI 
    output [0:0] csi_on,
    input [0:0] csi_rdy,
    output [7:0] csi_trim,
    input [0:0] csi_clk_pre,
// signals connected to HSI 
    input [0:0] hsi_rdy,
    output [0:0] hsi_on,
    output [11:0] hsi_trim,
    input [0:0] hsi_origin_clk,

// signals connected to LSE 
    input [0:0] lse_css_fail,
    output [0:0] lse_css_on,
    output [0:0] lse_drv,
    output [0:0] lse_byp,
    input [0:0] lse_rdy,
    output [0:0] lse_on,
    input [0:0] lse_clk,
// signals connected to LSI 
    input [0:0] lsi_rdy,
    output [0:0] lsi_on,
    input [0:0] lsi_clk,

// reset signals 
    input wire pwr_por_rst_n,
    input wire pwr_vsw_rst_n,
    input wire sys_rst_n,
    input wire rcc_perx_rst_n,
    input wire d1_rst_n,
    input wire d2_rst_n,
    input wire sdby_rst_n,

// register signals
    input mco1sel,
    input mco2sel,
    input rtcpre,
    input hsidiv,
    input divm1,
    input divm2,
    input divm3
);


//////////////////////////////////
//signals definition
//////////////////////////////////

wire hse_clk;
wire hes_clk_en;
wire hse_ker_clk;
wire hse_ker_clk_en;


wire hsi_clk_pre;  // hsi_clk is the clock before gate
wire hsi_clk;
wire hsi_ker_clk;
wire hsi_clk_en;
wire hsi_ker_clk_en;

wire csi_clk;
wire csi_clk_en;
wire csi_ker_clk;
wire csi_ker_clk_en;

wire hsi48_ker_clk;

wire per_clk;
wire ckpersel;

wire pll_src_clk;
wire pll1_src_clk;
wire pll2_src_clk;
wire pll3_src_clk;

wire sys_clk_en;
wire hsi_ker_clk_req;
wire csi_ker_clk_req;


//////////////////////////////////
// HSI CSI clock control /////////
//////////////////////////////////

assign hsi_clk_en = sys_clk_en;
assign hsi_ker_clk_en = sys_clk_en | hsi_ker_clk_req;
assign csi_clk_en = sys_clk_en;
assign csi_ker_clk_en = csi_clk_en | csi_ker_clk_req;


assign hse_clk_en = ~hse_css_fail;
assign hse_ker_clk_en = ~hse_css_fail;

//////////////////////////////////
// MCO clock out
//////////////////////////////////

clk_switch_cell #(
    .CLK_NUM ( 5 ))
 mco1_clk_switch_cell (
    .clk_in                  ( {hsi48_clk,pll1_q_clk,hse_clk,lse_clk,hsi_clk}    ),
    .sel                     ( mco1sel       ),

    .clk_out                 ( MCO1   )
);

clk_switch_cell #(
    .CLK_NUM ( 6 ))
 mco2_clk_switch_cell (
    .clk_in                  ( {lsi_clk,csi_clk,pll1_p_clk,hse_clk,pll2_p_clk,sys_clk}    ),
    .sel                     ( mco2sel       ),

    .clk_out                 ( MCO2   )
);


//////////////////////////////////
// hse_rtc_clk generate
//////////////////////////////////

div_odd_even #(
    .MAX_DIV_FAC ( 63 ))
 hse_rtc_clk_div(
    .clk_in                  ( hse_clk_pre   ),
    .rst_n                   ( sys_rst_n ),
    .div_sel                 ( rtcpre   ),

    .clk_out                 ( hse_rtc_clk )
);


//////////////////////////////////
// hsi_div
//////////////////////////////////

div_x_stage #(
    .STAGE_NUM       ( 4 ),
    .IS_STAGE_REMOVE ( 0 ),
    .STAGE_REMOVED   ( 0 ))
 hsi_clk_div (
    .clk_in                  ( hsi_origin_clk    ),
    .rst_n                   ( sys_rst_n ),
    .div_sel                 ( hsidiv   ),

    .clk_out                 ( hsi_clk_pre )
);

////////////////////////////////
//hsi clk gate
///////////////////////////////

rcc_clk_gate_cell  hsi_clk_gate (
    .clk_in                  ( hsi_clk_pre    ),
    .clk_en                  ( hsi_clk_en    ),

    .clk_out                 ( hsi_clk   )
);

rcc_clk_gate_cell hsi_ker_clk_gate (
    .clk_in                  ( hsi_clk_pre    ),
    .clk_en                  ( hsi_ker_clk_en    ),

    .clk_out                 ( hsi_ker_clk   )   
);

//////////////////////////////
//hse clk gate
/////////////////////////////
rcc_clk_gate_cell hse_clk_gate (
    .clk_in                  ( hse_clk_pre    ),
    .clk_en                  ( hse_clk_en    ),

    .clk_out                 ( hse_clk   )
);

rcc_clk_gate_cell hse_ker_clk_gate (
    .clk_in                  ( hse_clk_pre    ),
    .clk_en                  ( hse_ker_clk_en    ),

    .clk_out                 ( hse_ker_clk   )
);

////////////////////////////
//csi clock gate
///////////////////////////

rcc_clk_gate_cell csi_clk_gate(
    .clk_in                  ( csi_clk_pre    ),
    .clk_en                  ( csi_clk_en    ),

    .clk_out                 ( csi_clk   )   
);

rcc_clk_gate_cell csi_ker_clk_gate(
    .clk_in                  ( csi_clk_pre    ),
    .clk_en                  ( csi_ker_clk_en    ),

    .clk_out                 ( csi_ker_clk   )   
);

////////////////////////////
//per_clk selection
///////////////////////////
glitch_free_clk_switch #(
    .CLK_NUM ( 3 ))
 per_clk_switch (
    .clk_in                  ( {hse_ker_clk,csi_ker_clk,hsi_ker_clk}    ),
    .sel                     ( ckpersel       ),

    .clk_out                 ( per_clk   )
);

////////////////////////////
//hsi48 kernel clock 
///////////////////////////

assign hsi48_ker_clk = hsi48_clk;


////////////////////////////
//pll source clock generate
///////////////////////////

glitch_free_clk_switch #(
    .CLK_NUM ( 3 ))
 pll_src_clk_switch (
    .clk_in                  ( {hse_clk,csi_clk,hsi_clk}    ),
    .sel                     ( pll_src_sel       ),

    .clk_out                 ( pll_src_clk   )
);

div_odd_even #(
    .MAX_DIV_FAC (63)
)
pll1_src_clk_div (
    .clk_in                  ( pll_src_clk    ),
    .rst_n                   ( sys_rst_n ),
    .div_sel                 ( divm1   ),

    .clk_out                 ( pll1_src_clk )
);

div_odd_even #(
    .MAX_DIV_FAC (63)
)
pll2_src_clk_div (
    .clk_in                  ( pll_src_clk    ),
    .rst_n                   ( sys_rst_n ),
    .div_sel                 ( divm2   ),

    .clk_out                 ( pll2_src_clk )
);

div_odd_even #(
    .MAX_DIV_FAC (63)
)
pll3_src_clk_div (
    .clk_in                  ( pll_src_clk    ),
    .rst_n                   ( sys_rst_n ),
    .div_sel                 ( divm3   ),

    .clk_out                 ( pll3_src_clk )
);


rcc_sys_clk_gen  x_rcc_sys_clk_gen (
    .sys_rst_n               ( sys_rst_n               ),
    .hsi_clk                 ( hsi_clk                 ),
    .csi_clk                 ( csi_clk                 ),
    .hse_clk                 ( hse_clk                 ),
    .pll1_pclk               ( pll1_pclk               ),
    .sys_clk_sw              ( sys_clk_sw              ),
    .d1cpre                  ( d1cpre                  ),
    .d1ppre                  ( d1ppre                  ),
    .hpre                    ( hpre                    ),
    .d2ppre1                 ( d2ppre1                 ),
    .d2ppre2                 ( d2ppre2                 ),
    .d3ppre                  ( d3ppre                  ),
    .timpre                  ( timpre                  ),
    .hrtimsel                ( hrtimsel                ),
    .c2_sleep                ( c2_sleep                ),
    .c2_deepsleep            ( c2_deepsleep            ),
    .c1_sleep                ( c1_sleep                ),
    .c1_deepsleep            ( c1_deepsleep            ),
    .d3_deepsleep            ( d3_deepsleep            ),
    .c2_per_alloc_d1         ( c2_per_alloc_d1         ),
    .c1_per_alloc_d2         ( c1_per_alloc_d2         ),

    .rcc_c2_clk              ( rcc_c2_clk              ),
    .rcc_fclk_c2             ( rcc_fclk_c2             ),
    .rcc_c2_systick_clk      ( rcc_c2_systick_clk      ),
    .rcc_c2_rst_n            ( rcc_c2_rst_n            ),
    .rcc_c1_clk              ( rcc_c1_clk              ),
    .rcc_fclk_c1             ( rcc_fclk_c1             ),
    .rcc_c1_systick_clk      ( rcc_c1_systick_clk      ),
    .rcc_c1_rst_n            ( rcc_c1_rst_n            ),
    .rcc_axibridge_d1_clk    ( rcc_axibridge_d1_clk    ),
    .rcc_ahb3bridge_d1_clk   ( rcc_ahb3bridge_d1_clk   ),
    .rcc_apb3bridge_d1_clk   ( rcc_apb3bridge_d1_clk   ),
    .rcc_ahb1bridge_d2_clk   ( rcc_ahb1bridge_d2_clk   ),
    .rcc_ahb2bridge_d2_clk   ( rcc_ahb2bridge_d2_clk   ),
    .rcc_apb1bridge_d2_clk   ( rcc_apb1bridge_d2_clk   ),
    .rcc_apb2bridge_d2_clk   ( rcc_apb2bridge_d2_clk   ),
    .rcc_ahb4bridge_d3_clk   ( rcc_ahb4bridge_d3_clk   ),
    .rcc_apb4bridge_d3_clk   ( rcc_apb4bridge_d3_clk   ),
    .rcc_timx_ker_clk        ( rcc_timx_ker_clk        ),
    .rcc_timy_ker_clk        ( rcc_timy_ker_clk        ),
    .rcc_hrtimer_ker_clk     ( rcc_hrtimer_ker_clk     )
);


rcc_eth_ker_clk_ctrl  x_rcc_eth_ker_clk_ctrl (
    .pad_rcc_eth_mii_tx_clk  ( pad_rcc_eth_mii_tx_clk   ),
    .pad_rcc_eth_mii_rx_clk  ( pad_rcc_eth_mii_rx_clk   ),
    .eth_rcc_fes             ( eth_rcc_fes              ),
    .eth_rcc_epis_2          ( eth_rcc_epis_2           ),
    .sys_rst_n               ( sys_rst_n                ),
    .c1_sleep                ( c1_sleep                 ),
    .c1_deepsleep            ( c1_deepsleep             ),
    .c2_sleep                ( c2_sleep                 ),
    .c2_deepsleep            ( c2_deepsleep             ),
    .rcc_c1_eth1rx_en        ( rcc_c1_eth1rx_en         ),
    .rcc_c2_eth1rx_en        ( rcc_c2_eth1rx_en         ),
    .rcc_c1_eth1rx_lpen      ( rcc_c1_eth1rx_lpen       ),
    .rcc_c2_eth1rx_lpen      ( rcc_c2_eth1rx_lpen       ),
    .rcc_c1_eth1tx_en        ( rcc_c1_eth1tx_en         ),
    .rcc_c2_eth1tx_en        ( rcc_c2_eth1tx_en         ),
    .rcc_c1_eth1tx_lpen      ( rcc_c1_eth1tx_lpen       ),
    .rcc_c2_eth1tx_lpen      ( rcc_c2_eth1tx_lpen       ),

    .rcc_eth_mii_tx_clk      ( rcc_eth_mii_tx_clk       ),
    .rcc_eth_mii_rx_clk      ( rcc_eth_mii_rx_clk       ),
    .rcc_eth_rmii_ref_clk    ( rcc_eth_rmii_ref_clk     )
);





endmodule