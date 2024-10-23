// rcc_vsw_top Inputs
reg   lsecss_fail;
reg   lse_clk;
reg   lserdy;
reg   lsi_clk;
reg   hse_rtc_clk;
reg   pwr_vsw_rst;
reg   rcc_bdcr_byte2_wren;
reg   rcc_bdcr_byte1_wren;
reg   rcc_bdcr_byte0_wren;
reg   nxt_rcc_bdcr_bdrst;
reg   nxt_rcc_bdcr_rtcen;
reg   [1:0]  nxt_rcc_bdcr_rtcsel;
reg   nxt_rcc_bdcr_lsecsson;
reg   [1:0]  nxt_rcc_bdcr_lsedrv;
reg   nxt_rcc_bdcr_lsebyp;
reg   nxt_rcc_bdcr_lseon;

// rcc_vsw_top Outputs
wire  rcc_rtc_ker_clk;
wire  bdrst;
wire  rtcen;
wire  [1:0]  rtcsel;
wire  lsecssd;
wire  lsecsson;
wire  [1:0]  lsedrv;
wire  lsebyp;
wire  cur_rcc_bdcr_lserdy;
wire  lseon;

rcc_vsw_top  u_rcc_vsw_top (
    .lsecss_fail             ( lsecss_fail             ),
    .lse_clk                 ( lse_clk                 ),
    .lserdy                  ( lserdy                  ),
    .lsi_clk                 ( lsi_clk                 ),
    .hse_rtc_clk             ( hse_rtc_clk             ),
    .pwr_vsw_rst             ( pwr_vsw_rst             ),
    .rcc_bdcr_byte2_wren     ( rcc_bdcr_byte2_wren     ),
    .rcc_bdcr_byte1_wren     ( rcc_bdcr_byte1_wren     ),
    .rcc_bdcr_byte0_wren     ( rcc_bdcr_byte0_wren     ),
    .nxt_rcc_bdcr_bdrst      ( nxt_rcc_bdcr_bdrst      ),
    .nxt_rcc_bdcr_rtcen      ( nxt_rcc_bdcr_rtcen      ),
    .nxt_rcc_bdcr_rtcsel     ( nxt_rcc_bdcr_rtcsel     ),
    .nxt_rcc_bdcr_lsecsson   ( nxt_rcc_bdcr_lsecsson   ),
    .nxt_rcc_bdcr_lsedrv     ( nxt_rcc_bdcr_lsedrv     ),
    .nxt_rcc_bdcr_lsebyp     ( nxt_rcc_bdcr_lsebyp     ),
    .nxt_rcc_bdcr_lseon      ( nxt_rcc_bdcr_lseon      ),

    .rcc_rtc_ker_clk         ( rcc_rtc_ker_clk         ),
    .bdrst                   ( bdrst                   ),
    .rtcen                   ( rtcen                   ),
    .rtcsel                  ( rtcsel                  ),
    .lsecssd                 ( lsecssd                 ),
    .lsecsson                ( lsecsson                ),
    .lsedrv                  ( lsedrv                  ),
    .lsebyp                  ( lsebyp                  ),
    .cur_rcc_bdcr_lserdy     ( cur_rcc_bdcr_lserdy     ),
    .lseon                   ( lseon                   )
);
