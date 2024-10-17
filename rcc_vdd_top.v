module rcc_vdd_top(
    input wire rcc_vdd_write_pulse,
    input wire rcc_vdd_write_en,
    input wire [15:0] rcc_vdd_wdata,
    output wire [15:0] rcc_vdd_rdata,
    input wire rcc_vdd_addr,

    input wire lpwr2rstf,
    input wire lpwr1rstf,
    input wire wwdg2rstf,
    input wire wwdg1rstf,
    input wire iwdg2rstf,
    input wire iwdg1rstf,
    input wire sft2rstf,
    input wire sft1rstf,
    input wire porrstf,
    input wire pinrstf,
    input wire borrstf,
    input wire d2rstf,
    input wire d1rstf,
    input wire cpu2rstf,
    input wire cpu1rstf,
    input wire lserdy,

    output wire lseon
);


rcc_vdd_reg  x_rcc_vdd_reg (
    .write_pulse             ( rcc_vdd_write_pulse   ),
    .write_en                ( rcc_vdd_write_en      ),
    .wdata                   ( rcc_vdd_wdata         ),
    .addr                    ( rcc_vdd_addr          ),
    .rst_n                   ( rst_n         ),
    .lpwr2rstf               ( lpwr2rstf     ),
    .lpwr1rstf               ( lpwr1rstf     ),
    .wwdg2rstf               ( wwdg2rstf     ),
    .wwdg1rstf               ( wwdg1rstf     ),
    .iwdg2rstf               ( iwdg2rstf     ),
    .iwdg1rstf               ( iwdg1rstf     ),
    .sft2rstf                ( sft2rstf      ),
    .sft1rstf                ( sft1rstf      ),
    .porrstf                 ( porrstf       ),
    .pinrstf                 ( pinrstf       ),
    .borrstf                 ( borrstf       ),
    .d2rstf                  ( d2rstf        ),
    .d1rstf                  ( d1rstf        ),
    .cpu2rstf                ( cpu2rstf      ),
    .cpu1rstf                ( cpu1rstf      ),
    .lserdy                  ( lserdy        ),

    .rdata                   ( rcc_vdd_rdata         ),
    .lseon                   ( lseon         )
);


//level shift

//isolation



endmodule