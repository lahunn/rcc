module rcc_vdd_top(
    // rcc_vdd_reg Inputs
    input wire  wdata,//low to high level, default 0
    input wire  rcc_c1_rsr_rmvf_wren,//low to high level, default 0
    input wire  rcc_c2_rsr_rmvf_wren,//low to high level, default 0
    input wire  rcc_csr_lsion_wren,//low to high level, default 0
    input wire  nrst_in,//low to high level, default 0
    input wire  obl_rst,//low to high level, default 0
    input wire  lpwr2_rst,//low to high level, default 0
    input wire  lpwr1_rst,//low to high level, default 0
    input wire  wwdg1_out_rst,//low to high level, default 0
    input wire  wwdg2_out_rst,//low to high level, default 0
    input wire  iwdg1_out_rst,
    input wire  iwdg2_out_rst,
    input wire  cpu2_sftrst,//low to high level, default 0
    input wire  cpu1_sftrst,//low to high level, default 0
    input wire  pwr_por_rst,//low to high level, default 0
    input wire  pwr_bor_rst,//low to high level, default 0
    input wire  d2_rst,//low to high level, default 0
    input wire  d1_rst,//low to high level, default 0
    input wire  cpu2_rst,//low to high level, default 0
    input wire  cpu1_rst,//low to high level, default 0
    input wire  lsi_rdy,
    
    // rcc_vdd_reg Outputs
    output wire  cur_rcc_c1_rsr_lpwr2rstf,//hign to low level, default 0
    output wire  cur_rcc_c1_rsr_lpwr1rstf,//hign to low level, default 0
    output wire  cur_rcc_c1_rsr_wwdg2rstf,//hign to low level, default 0
    output wire  cur_rcc_c1_rsr_wwdg1rstf,//hign to low level, default 0
    output wire  cur_rcc_c1_rsr_iwdg2rstf,//hign to low level, default 0
    output wire  cur_rcc_c1_rsr_iwdg1rstf,//hign to low level, default 0
    output wire  cur_rcc_c1_rsr_sft2rstf,//hign to low level, default 0
    output wire  cur_rcc_c1_rsr_sft1rstf,//hign to low level, default 0
    output wire  cur_rcc_c1_rsr_porrstf,//hign to low level, default 0
    output wire  cur_rcc_c1_rsr_pinrstf,//hign to low level, default 0
    output wire  cur_rcc_c1_rsr_borrstf,//hign to low level, default 0
    output wire  cur_rcc_c1_rsr_d2rstf,//hign to low level, default 0
    output wire  cur_rcc_c1_rsr_d1rstf,//hign to low level, default 0
    output wire  cur_rcc_c1_rsr_oblrstf,//hign to low level, default 0
    output wire  cur_rcc_c1_rsr_rmvf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_lpwr2rstf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_lpwr1rstf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_wwdg2rstf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_wwdg1rstf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_iwdg2rstf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_iwdg1rstf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_sft2rstf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_sft1rstf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_porrstf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_pinrstf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_borrstf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_d2rstf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_d1rstf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_oblrstf,//hign to low level, default 0
    output wire  cur_rcc_c2_rsr_rmvf,//hign to low level, default 0
    output wire  cur_rcc_csr_lsirdy,//hign to low level, default 0
    output wire  cur_rcc_csr_lsion//hign to low level, default 0
);

rcc_vdd_reg  u_rcc_vdd_reg (
    .wdata                     ( wdata                      ),
    .rst_n                     ( ~pwr_por_rst               ),
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
    .cpu2_rst                  ( cpu2_rst                   ),
    .cpu1_rst                  ( cpu1_rst                   ),
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


// level shift
    // level shift should be added in integration
// voltage isolation 
    // voltage isolation should be added in integration

endmodule