// rcc_vdd_top Inputs
wire   vdd_wdata;
wire   rcc_c1_rsr_rmvf_wren;
wire   rcc_c2_rsr_rmvf_wren;
wire   rcc_csr_lsion_wren;
wire   nrst_in;
wire   obl_rst;
wire   lpwr2_rst;
wire   lpwr1_rst;
wire   wwdg1_out_rst;
wire   wwdg2_out_rst;
wire   iwdg1_out_rst;
wire   iwdg2_out_rst;
wire   cpu2_sftrst;
wire   cpu1_sftrst;
wire   pwr_por_rst;
wire   pwr_bor_rst;
wire   d2_rst;
wire   d1_rst;
wire   lsi_rdy;

// rcc_vdd_top Outputs
wire  cur_rcc_c1_rsr_lpwr2rstf;
wire  cur_rcc_c1_rsr_lpwr1rstf;
wire  cur_rcc_c1_rsr_wwdg2rstf;
wire  cur_rcc_c1_rsr_wwdg1rstf;
wire  cur_rcc_c1_rsr_iwdg2rstf;
wire  cur_rcc_c1_rsr_iwdg1rstf;
wire  cur_rcc_c1_rsr_sft2rstf;
wire  cur_rcc_c1_rsr_sft1rstf;
wire  cur_rcc_c1_rsr_porrstf;
wire  cur_rcc_c1_rsr_pinrstf;
wire  cur_rcc_c1_rsr_borrstf;
wire  cur_rcc_c1_rsr_d2rstf;
wire  cur_rcc_c1_rsr_d1rstf;
wire  cur_rcc_c1_rsr_oblrstf;
wire  cur_rcc_c1_rsr_rmvf;
wire  cur_rcc_c2_rsr_lpwr2rstf;
wire  cur_rcc_c2_rsr_lpwr1rstf;
wire  cur_rcc_c2_rsr_wwdg2rstf;
wire  cur_rcc_c2_rsr_wwdg1rstf;
wire  cur_rcc_c2_rsr_iwdg2rstf;
wire  cur_rcc_c2_rsr_iwdg1rstf;
wire  cur_rcc_c2_rsr_sft2rstf;
wire  cur_rcc_c2_rsr_sft1rstf;
wire  cur_rcc_c2_rsr_porrstf;
wire  cur_rcc_c2_rsr_pinrstf;
wire  cur_rcc_c2_rsr_borrstf;
wire  cur_rcc_c2_rsr_d2rstf;
wire  cur_rcc_c2_rsr_d1rstf;
wire  cur_rcc_c2_rsr_oblrstf;
wire  cur_rcc_c2_rsr_rmvf;
wire  cur_rcc_csr_lsirdy;
wire  cur_rcc_csr_lsion;

rcc_vdd_top  u_rcc_vdd_top (
    .wdata                     ( wdata                      ),
    .rcc_c1_rsr_rmvf_wren      ( rcc_c1_rsr_rmvf_wren       ),
    .rcc_c2_rsr_rmvf_wren      ( rcc_c2_rsr_rmvf_wren       ),
    .rcc_csr_lsion_wren        ( rcc_csr_lsion_wren         ),
    .nrst_in                   ( nrst_in                    ),
    .obl_rst                   ( obl_rst                    ),
    .lpwr2_rst                 ( lpwr2_rst                  ),
    .lpwr1_rst                 ( lpwr1_rst                  ),
    .wwdg1_out_rst             ( wwdg1_out_rst              ),
    .wwdg2_out_rst             ( wwdg2_out_rst              ),
    .iwdg1_out_rst             ( iwdg1_out_rst              ),
    .iwdg2_out_rst             ( iwdg2_out_rst              ),
    .cpu2_sftrst               ( cpu2_sftrst                ),
    .cpu1_sftrst               ( cpu1_sftrst                ),
    .pwr_por_rst               ( pwr_por_rst                ),
    .pwr_bor_rst               ( pwr_bor_rst                ),
    .d2_rst                    ( d2_rst                     ),
    .d1_rst                    ( d1_rst                     ),
    .lsi_rdy                   ( lsi_rdy                    ),

    .cur_rcc_c1_rsr_lpwr2rstf  ( cur_rcc_c1_rsr_lpwr2rstf   ),
    .cur_rcc_c1_rsr_lpwr1rstf  ( cur_rcc_c1_rsr_lpwr1rstf   ),
    .cur_rcc_c1_rsr_wwdg2rstf  ( cur_rcc_c1_rsr_wwdg2rstf   ),
    .cur_rcc_c1_rsr_wwdg1rstf  ( cur_rcc_c1_rsr_wwdg1rstf   ),
    .cur_rcc_c1_rsr_iwdg2rstf  ( cur_rcc_c1_rsr_iwdg2rstf   ),
    .cur_rcc_c1_rsr_iwdg1rstf  ( cur_rcc_c1_rsr_iwdg1rstf   ),
    .cur_rcc_c1_rsr_sft2rstf   ( cur_rcc_c1_rsr_sft2rstf    ),
    .cur_rcc_c1_rsr_sft1rstf   ( cur_rcc_c1_rsr_sft1rstf    ),
    .cur_rcc_c1_rsr_porrstf    ( cur_rcc_c1_rsr_porrstf     ),
    .cur_rcc_c1_rsr_pinrstf    ( cur_rcc_c1_rsr_pinrstf     ),
    .cur_rcc_c1_rsr_borrstf    ( cur_rcc_c1_rsr_borrstf     ),
    .cur_rcc_c1_rsr_d2rstf     ( cur_rcc_c1_rsr_d2rstf      ),
    .cur_rcc_c1_rsr_d1rstf     ( cur_rcc_c1_rsr_d1rstf      ),
    .cur_rcc_c1_rsr_oblrstf    ( cur_rcc_c1_rsr_oblrstf     ),
    .cur_rcc_c1_rsr_rmvf       ( cur_rcc_c1_rsr_rmvf        ),
    .cur_rcc_c2_rsr_lpwr2rstf  ( cur_rcc_c2_rsr_lpwr2rstf   ),
    .cur_rcc_c2_rsr_lpwr1rstf  ( cur_rcc_c2_rsr_lpwr1rstf   ),
    .cur_rcc_c2_rsr_wwdg2rstf  ( cur_rcc_c2_rsr_wwdg2rstf   ),
    .cur_rcc_c2_rsr_wwdg1rstf  ( cur_rcc_c2_rsr_wwdg1rstf   ),
    .cur_rcc_c2_rsr_iwdg2rstf  ( cur_rcc_c2_rsr_iwdg2rstf   ),
    .cur_rcc_c2_rsr_iwdg1rstf  ( cur_rcc_c2_rsr_iwdg1rstf   ),
    .cur_rcc_c2_rsr_sft2rstf   ( cur_rcc_c2_rsr_sft2rstf    ),
    .cur_rcc_c2_rsr_sft1rstf   ( cur_rcc_c2_rsr_sft1rstf    ),
    .cur_rcc_c2_rsr_porrstf    ( cur_rcc_c2_rsr_porrstf     ),
    .cur_rcc_c2_rsr_pinrstf    ( cur_rcc_c2_rsr_pinrstf     ),
    .cur_rcc_c2_rsr_borrstf    ( cur_rcc_c2_rsr_borrstf     ),
    .cur_rcc_c2_rsr_d2rstf     ( cur_rcc_c2_rsr_d2rstf      ),
    .cur_rcc_c2_rsr_d1rstf     ( cur_rcc_c2_rsr_d1rstf      ),
    .cur_rcc_c2_rsr_oblrstf    ( cur_rcc_c2_rsr_oblrstf     ),
    .cur_rcc_c2_rsr_rmvf       ( cur_rcc_c2_rsr_rmvf        ),
    .cur_rcc_csr_lsirdy        ( cur_rcc_csr_lsirdy         ),
    .cur_rcc_csr_lsion         ( cur_rcc_csr_lsion          )
);
