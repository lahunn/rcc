module rcc_vcore_rst_ctrl
#(
    D2_RST_DURATION = 10,
    D1_RST_DURATION = 10
)
(
    // signals connected to 复位源 
    input  nrst_in,
    input  iwdg1_out_rst,
    input  wwdg1_out_rst,
    input  iwdg2_out_rst,
    input  wwdg2_out_rst,
    input  lpwr2_rst,
    input  lpwr1_rst,
    input  pwr_bor_rst,
    input  pwr_por_rst,
    input  cpu2_sftrst,
    input  cpu1_sftrst,


    input wire pwr_vcore_ok,
    input wire pwr_d1_ok,
    input wire pwr_d2_ok,
    input wire flash_obl_reload,
    input wire obl_done,

    // reset signals
    output wire pwr_por_rst_n,
    output wire sys_rst_n,
    output reg d1_rst_n,
    output reg d2_rst_n,
    output wire stby_rst_n,

    // nrst output 
    output nrst_out,

    // clock input 
    input wire sys_d1cpre_clk,  // same as c1_clk but not gated
    input wire sys_hpre_clk,  // same as c2_clk but not gated

//peripheral reset signals
    output rcc_flash_rst_n,
    input qspirst,
    output rcc_qspi_rst_n,
    output rcc_axisram_rst_n,
    input fmcrst,
    output rcc_fmc_rst_n,
    input dma2drst,
    output rcc_dma2d_rst_n,
    input mdmarst,
    output rcc_mdma_rst_n,
    input ltdcrst,
    output rcc_ltdc_rst_n,
    output rcc_ramecc1_rst_n,
    output rcc_gpv_rst_n,
    output rcc_itcm_rst_n,
    output rcc_dtcm2_rst_n,
    output rcc_dtcm1_rst_n,
    input jpgdecrst,
    output rcc_jpgdec_rst_n,
    input sdmmc1rst,
    output rcc_sdmmc1_rst_n,
    output rcc_wwdg1_rst_n,
    output rcc_usb2ulpi_rst_n,
    input usb2otgrst,
    output rcc_usb2otg_rst_n,
    output rcc_usb1ulpi_rst_n,
    input usb1otgrst,
    output rcc_usb1otg_rst_n,
    output rcc_eth1rx_rst_n,
    output rcc_eth1tx_rst_n,
    input eth1macrst,
    output rcc_eth1mac_rst_n,
    input adc12rst,
    output rcc_adc12_rst_n,
    input dma2rst,
    output rcc_dma2_rst_n,
    input dma1rst,
    output rcc_dma1_rst_n,
    output rcc_sram3_rst_n,
    output rcc_sram2_rst_n,
    output rcc_sram1_rst_n,
    input sdmmc2rst,
    output rcc_sdmmc2_rst_n,
    input rngrst,
    output rcc_rng_rst_n,
    input hashrst,
    output rcc_hash_rst_n,
    input cryptrst,
    output rcc_crypt_rst_n,
    input dcmirst,
    output rcc_dcmi_rst_n,
    output rcc_ramecc2_rst_n,
    input uart8rst,
    output rcc_uart8_rst_n,
    input uart7rst,
    output rcc_uart7_rst_n,
    input dac12rst,
    output rcc_dac12_rst_n,
    input hdmicecrst,
    output rcc_hdmicec_rst_n,
    input i2c3rst,
    output rcc_i2c3_rst_n,
    input i2c2rst,
    output rcc_i2c2_rst_n,
    input i2c1rst,
    output rcc_i2c1_rst_n,
    input uart5rst,
    output rcc_uart5_rst_n,
    input uart4rst,
    output rcc_uart4_rst_n,
    input usart3rst,
    output rcc_usart3_rst_n,
    input usart2rst,
    output rcc_usart2_rst_n,
    input spdifrxrst,
    output rcc_spdifrx_rst_n,
    input spi3rst,
    output rcc_spi3_rst_n,
    input spi2rst,
    output rcc_spi2_rst_n,
    output rcc_wwdg2_rst_n,
    input lptim1rst,
    output rcc_lptim1_rst_n,
    input tim14rst,
    output rcc_tim14_rst_n,
    input tim13rst,
    output rcc_tim13_rst_n,
    input tim12rst,
    output rcc_tim12_rst_n,
    input tim7rst,
    output rcc_tim7_rst_n,
    input tim6rst,
    output rcc_tim6_rst_n,
    input tim5rst,
    output rcc_tim5_rst_n,
    input tim4rst,
    output rcc_tim4_rst_n,
    input tim3rst,
    output rcc_tim3_rst_n,
    input tim2rst,
    output rcc_tim2_rst_n,
    input fdcanrst,
    output rcc_fdcan_rst_n,
    input mdiosrst,
    output rcc_mdios_rst_n,
    input opamprst,
    output rcc_opamp_rst_n,
    input swpmirst,
    output rcc_swpmi_rst_n,
    input crsrst,
    output rcc_crs_rst_n,
    input hrtimrst,
    output rcc_hrtim_rst_n,
    input dfsdm1rst,
    output rcc_dfsdm1_rst_n,
    input sai3rst,
    output rcc_sai3_rst_n,
    input sai2rst,
    output rcc_sai2_rst_n,
    input sai1rst,
    output rcc_sai1_rst_n,
    input spi5rst,
    output rcc_spi5_rst_n,
    input tim17rst,
    output rcc_tim17_rst_n,
    input tim16rst,
    output rcc_tim16_rst_n,
    input tim15rst,
    output rcc_tim15_rst_n,
    input spi4rst,
    output rcc_spi4_rst_n,
    input spi1rst,
    output rcc_spi1_rst_n,
    input usart6rst,
    output rcc_usart6_rst_n,
    input usart1rst,
    output rcc_usart1_rst_n,
    input tim8rst,
    output rcc_tim8_rst_n,
    input tim1rst,
    output rcc_tim1_rst_n,
    output rcc_sram4_rst_n,
    output rcc_bkpram_rst_n,
    output rcc_ramecc3_rst_n,
    input hsemrst,
    output rcc_hsem_rst_n,
    input adc3rst,
    output rcc_adc3_rst_n,
    input bdmarst,
    output rcc_bdma_rst_n,
    input crcrst,
    output rcc_crc_rst_n,
    input gpiokrst,
    output rcc_gpiok_rst_n,
    input gpiojrst,
    output rcc_gpioj_rst_n,
    input gpioirst,
    output rcc_gpioi_rst_n,
    input gpiohrst,
    output rcc_gpioh_rst_n,
    input gpiogrst,
    output rcc_gpiog_rst_n,
    input gpiofrst,
    output rcc_gpiof_rst_n,
    input gpioerst,
    output rcc_gpioe_rst_n,
    input gpiodrst,
    output rcc_gpiod_rst_n,
    input gpiocrst,
    output rcc_gpioc_rst_n,
    input gpiobrst,
    output rcc_gpiob_rst_n,
    input gpioarst,
    output rcc_gpioa_rst_n,
    output rcc_rcc_rst_n,
    output rcc_pwr_rst_n,
    input sai4rst,
    output rcc_sai4_rst_n,
    output rcc_rtc_rst_n,
    input vrefrst,
    output rcc_vref_rst_n,
    input comp12rst,
    output rcc_comp12_rst_n,
    input lptim5rst,
    output rcc_lptim5_rst_n,
    input lptim4rst,
    output rcc_lptim4_rst_n,
    input lptim3rst,
    output rcc_lptim3_rst_n,
    input lptim2rst,
    output rcc_lptim2_rst_n,
    input i2c4rst,
    output rcc_i2c4_rst_n,
    input spi6rst,
    output rcc_spi6_rst_n,
    input lpuart1rst,
    output rcc_lpuart1_rst_n,
    input syscfgrst,
    output rcc_syscfg_rst_n,
    output rcc_iwdg2_rst_n,
    output rcc_iwdg1_rst_n,
    output rcc_exti_rst_n


);
    
wire obl_rst;
wire sys_rst;

reg [$clog2(D1_RST_DURATION)-1:0] d1_rst_n_counter;
reg [$clog2(D2_RST_DURATION)-1:0] d2_rst_n_counter;

wire rcc_vcore_rst;
wire hw_init_done;

//generate rst_n for pwr_por_rst
assign pwr_por_rst_n = ~pwr_por_rst;


///////////////////////////////
//nrst_out
///////////////////////////////

assign nrst_out = obl_rst | pwr_por_rst_n | pwr_bor_rst | lpwr1_rst | lpwr2_rst | wwdg1_out_rst | wwdg2_out_rst | iwdg1_out_rst | iwdg2_out_rst | cpu2_sftrst | cpu1_sftrst;

///////////////////////////////
//System reset generate
///////////////////////////////


///////////////////////////////
//d1 d2 system standby reset generate
///////////////////////////////
always @(posedge sys_d1cpre_clk or negedge pwr_d1_ok) begin
    if(~pwr_d1_ok) begin
        d1_rst_n <= 1'b0;
        d1_rst_n_counter <= 0;
    end else begin
        if(d1_rst_n_counter < D1_RST_DURATION) begin
            d1_rst_n <= 1'b0;
            d1_rst_n_counter <= d1_rst_n_counter + 1;
        end else begin
            d1_rst_n <= 1'b1;
            d1_rst_n_counter <= D1_RST_DURATION;
        end
    end
end

always @(posedge sys_hpre_clk or negedge pwr_d2_ok) begin
    if(~pwr_d2_ok) begin
        d2_rst_n <= 1'b0;
        d2_rst_n_counter <= 0;
    end else begin
        if(d2_rst_n_counter < D2_RST_DURATION) begin
            d2_rst_n <= 1'b0;
            d2_rst_n_counter <= d2_rst_n_counter + 1;
        end else begin
            d2_rst_n <= 1'b1;
            d2_rst_n_counter <= D2_RST_DURATION;
        end
    end
    
end

///////////////////////////////
//system reset generate
///////////////////////////////
assign sys_rst_n = ~sys_rst;
assign sys_rst = nrst_in | rcc_vcore_rst | ~hw_init_done;

///////////////////////////////
//hw init done generate 
///////////////////////////////
assign hw_init_done = ~pwr_por_rst | pwr_vcore_ok | ~flash_obl_reload | obl_done; 

///////////////////////////////
//obl reset generate
///////////////////////////////
assign obl_rst = ~obl_done | flash_obl_reload;

///////////////////////////////
//rcc vcore reset generate
///////////////////////////////
assign rcc_vcore_rst = ~obl_done | flash_obl_reload;

///////////////////////////////
//standby reset generate
///////////////////////////////
assign stby_rst_n = ~rcc_vcore_rst;


rcc_per_rst_control  u_rcc_rcc_per_rst_control (
    .qspirst                 ( qspirst              ),
    .fmcrst                  ( fmcrst               ),
    .dma2drst                ( dma2drst             ),
    .mdmarst                 ( mdmarst              ),
    .ltdcrst                 ( ltdcrst              ),
    .jpgdecrst               ( jpgdecrst            ),
    .sdmmc1rst               ( sdmmc1rst            ),
    .usb2otgrst              ( usb2otgrst           ),
    .usb1otgrst              ( usb1otgrst           ),
    .eth1macrst              ( eth1macrst           ),
    .adc12rst                ( adc12rst             ),
    .dma2rst                 ( dma2rst              ),
    .dma1rst                 ( dma1rst              ),
    .sdmmc2rst               ( sdmmc2rst            ),
    .rngrst                  ( rngrst               ),
    .hashrst                 ( hashrst              ),
    .cryptrst                ( cryptrst             ),
    .dcmirst                 ( dcmirst              ),
    .uart8rst                ( uart8rst             ),
    .uart7rst                ( uart7rst             ),
    .dac12rst                ( dac12rst             ),
    .hdmicecrst              ( hdmicecrst           ),
    .i2c3rst                 ( i2c3rst              ),
    .i2c2rst                 ( i2c2rst              ),
    .i2c1rst                 ( i2c1rst              ),
    .uart5rst                ( uart5rst             ),
    .uart4rst                ( uart4rst             ),
    .usart3rst               ( usart3rst            ),
    .usart2rst               ( usart2rst            ),
    .spdifrxrst              ( spdifrxrst           ),
    .spi3rst                 ( spi3rst              ),
    .spi2rst                 ( spi2rst              ),
    .lptim1rst               ( lptim1rst            ),
    .tim14rst                ( tim14rst             ),
    .tim13rst                ( tim13rst             ),
    .tim12rst                ( tim12rst             ),
    .tim7rst                 ( tim7rst              ),
    .tim6rst                 ( tim6rst              ),
    .tim5rst                 ( tim5rst              ),
    .tim4rst                 ( tim4rst              ),
    .tim3rst                 ( tim3rst              ),
    .tim2rst                 ( tim2rst              ),
    .fdcanrst                ( fdcanrst             ),
    .mdiosrst                ( mdiosrst             ),
    .opamprst                ( opamprst             ),
    .swpmirst                ( swpmirst             ),
    .crsrst                  ( crsrst               ),
    .hrtimrst                ( hrtimrst             ),
    .dfsdm1rst               ( dfsdm1rst            ),
    .sai3rst                 ( sai3rst              ),
    .sai2rst                 ( sai2rst              ),
    .sai1rst                 ( sai1rst              ),
    .spi5rst                 ( spi5rst              ),
    .tim17rst                ( tim17rst             ),
    .tim16rst                ( tim16rst             ),
    .tim15rst                ( tim15rst             ),
    .spi4rst                 ( spi4rst              ),
    .spi1rst                 ( spi1rst              ),
    .usart6rst               ( usart6rst            ),
    .usart1rst               ( usart1rst            ),
    .tim8rst                 ( tim8rst              ),
    .tim1rst                 ( tim1rst              ),
    .hsemrst                 ( hsemrst              ),
    .adc3rst                 ( adc3rst              ),
    .bdmarst                 ( bdmarst              ),
    .crcrst                  ( crcrst               ),
    .gpiokrst                ( gpiokrst             ),
    .gpiojrst                ( gpiojrst             ),
    .gpioirst                ( gpioirst             ),
    .gpiohrst                ( gpiohrst             ),
    .gpiogrst                ( gpiogrst             ),
    .gpiofrst                ( gpiofrst             ),
    .gpioerst                ( gpioerst             ),
    .gpiodrst                ( gpiodrst             ),
    .gpiocrst                ( gpiocrst             ),
    .gpiobrst                ( gpiobrst             ),
    .gpioarst                ( gpioarst             ),
    .sai4rst                 ( sai4rst              ),
    .vrefrst                 ( vrefrst              ),
    .comp12rst               ( comp12rst            ),
    .lptim5rst               ( lptim5rst            ),
    .lptim4rst               ( lptim4rst            ),
    .lptim3rst               ( lptim3rst            ),
    .lptim2rst               ( lptim2rst            ),
    .i2c4rst                 ( i2c4rst              ),
    .spi6rst                 ( spi6rst              ),
    .lpuart1rst              ( lpuart1rst           ),
    .syscfgrst               ( syscfgrst            ),
    .sys_rst_n               ( sys_rst_n            ),
    .d1_rst_n                ( d1_rst_n             ),
    .d2_rst_n                ( d2_rst_n             ),

    .rcc_flash_rst_n         ( rcc_flash_rst_n      ),
    .rcc_qspi_rst_n          ( rcc_qspi_rst_n       ),
    .rcc_axisram_rst_n       ( rcc_axisram_rst_n    ),
    .rcc_fmc_rst_n           ( rcc_fmc_rst_n        ),
    .rcc_dma2d_rst_n         ( rcc_dma2d_rst_n      ),
    .rcc_mdma_rst_n          ( rcc_mdma_rst_n       ),
    .rcc_ltdc_rst_n          ( rcc_ltdc_rst_n       ),
    .rcc_ramecc1_rst_n       ( rcc_ramecc1_rst_n    ),
    .rcc_gpv_rst_n           ( rcc_gpv_rst_n        ),
    .rcc_itcm_rst_n          ( rcc_itcm_rst_n       ),
    .rcc_dtcm2_rst_n         ( rcc_dtcm2_rst_n      ),
    .rcc_dtcm1_rst_n         ( rcc_dtcm1_rst_n      ),
    .rcc_jpgdec_rst_n        ( rcc_jpgdec_rst_n     ),
    .rcc_sdmmc1_rst_n        ( rcc_sdmmc1_rst_n     ),
    .rcc_wwdg1_rst_n         ( rcc_wwdg1_rst_n      ),
    .rcc_usb2ulpi_rst_n      ( rcc_usb2ulpi_rst_n   ),
    .rcc_usb2otg_rst_n       ( rcc_usb2otg_rst_n    ),
    .rcc_usb1ulpi_rst_n      ( rcc_usb1ulpi_rst_n   ),
    .rcc_usb1otg_rst_n       ( rcc_usb1otg_rst_n    ),
    .rcc_eth1rx_rst_n        ( rcc_eth1rx_rst_n     ),
    .rcc_eth1tx_rst_n        ( rcc_eth1tx_rst_n     ),
    .rcc_eth1mac_rst_n       ( rcc_eth1mac_rst_n    ),
    .rcc_adc12_rst_n         ( rcc_adc12_rst_n      ),
    .rcc_dma2_rst_n          ( rcc_dma2_rst_n       ),
    .rcc_dma1_rst_n          ( rcc_dma1_rst_n       ),
    .rcc_sram3_rst_n         ( rcc_sram3_rst_n      ),
    .rcc_sram2_rst_n         ( rcc_sram2_rst_n      ),
    .rcc_sram1_rst_n         ( rcc_sram1_rst_n      ),
    .rcc_sdmmc2_rst_n        ( rcc_sdmmc2_rst_n     ),
    .rcc_rng_rst_n           ( rcc_rng_rst_n        ),
    .rcc_hash_rst_n          ( rcc_hash_rst_n       ),
    .rcc_crypt_rst_n         ( rcc_crypt_rst_n      ),
    .rcc_dcmi_rst_n          ( rcc_dcmi_rst_n       ),
    .rcc_ramecc2_rst_n       ( rcc_ramecc2_rst_n    ),
    .rcc_uart8_rst_n         ( rcc_uart8_rst_n      ),
    .rcc_uart7_rst_n         ( rcc_uart7_rst_n      ),
    .rcc_dac12_rst_n         ( rcc_dac12_rst_n      ),
    .rcc_hdmicec_rst_n       ( rcc_hdmicec_rst_n    ),
    .rcc_i2c3_rst_n          ( rcc_i2c3_rst_n       ),
    .rcc_i2c2_rst_n          ( rcc_i2c2_rst_n       ),
    .rcc_i2c1_rst_n          ( rcc_i2c1_rst_n       ),
    .rcc_uart5_rst_n         ( rcc_uart5_rst_n      ),
    .rcc_uart4_rst_n         ( rcc_uart4_rst_n      ),
    .rcc_usart3_rst_n        ( rcc_usart3_rst_n     ),
    .rcc_usart2_rst_n        ( rcc_usart2_rst_n     ),
    .rcc_spdifrx_rst_n       ( rcc_spdifrx_rst_n    ),
    .rcc_spi3_rst_n          ( rcc_spi3_rst_n       ),
    .rcc_spi2_rst_n          ( rcc_spi2_rst_n       ),
    .rcc_wwdg2_rst_n         ( rcc_wwdg2_rst_n      ),
    .rcc_lptim1_rst_n        ( rcc_lptim1_rst_n     ),
    .rcc_tim14_rst_n         ( rcc_tim14_rst_n      ),
    .rcc_tim13_rst_n         ( rcc_tim13_rst_n      ),
    .rcc_tim12_rst_n         ( rcc_tim12_rst_n      ),
    .rcc_tim7_rst_n          ( rcc_tim7_rst_n       ),
    .rcc_tim6_rst_n          ( rcc_tim6_rst_n       ),
    .rcc_tim5_rst_n          ( rcc_tim5_rst_n       ),
    .rcc_tim4_rst_n          ( rcc_tim4_rst_n       ),
    .rcc_tim3_rst_n          ( rcc_tim3_rst_n       ),
    .rcc_tim2_rst_n          ( rcc_tim2_rst_n       ),
    .rcc_fdcan_rst_n         ( rcc_fdcan_rst_n      ),
    .rcc_mdios_rst_n         ( rcc_mdios_rst_n      ),
    .rcc_opamp_rst_n         ( rcc_opamp_rst_n      ),
    .rcc_swpmi_rst_n         ( rcc_swpmi_rst_n      ),
    .rcc_crs_rst_n           ( rcc_crs_rst_n        ),
    .rcc_hrtim_rst_n         ( rcc_hrtim_rst_n      ),
    .rcc_dfsdm1_rst_n        ( rcc_dfsdm1_rst_n     ),
    .rcc_sai3_rst_n          ( rcc_sai3_rst_n       ),
    .rcc_sai2_rst_n          ( rcc_sai2_rst_n       ),
    .rcc_sai1_rst_n          ( rcc_sai1_rst_n       ),
    .rcc_spi5_rst_n          ( rcc_spi5_rst_n       ),
    .rcc_tim17_rst_n         ( rcc_tim17_rst_n      ),
    .rcc_tim16_rst_n         ( rcc_tim16_rst_n      ),
    .rcc_tim15_rst_n         ( rcc_tim15_rst_n      ),
    .rcc_spi4_rst_n          ( rcc_spi4_rst_n       ),
    .rcc_spi1_rst_n          ( rcc_spi1_rst_n       ),
    .rcc_usart6_rst_n        ( rcc_usart6_rst_n     ),
    .rcc_usart1_rst_n        ( rcc_usart1_rst_n     ),
    .rcc_tim8_rst_n          ( rcc_tim8_rst_n       ),
    .rcc_tim1_rst_n          ( rcc_tim1_rst_n       ),
    .rcc_sram4_rst_n         ( rcc_sram4_rst_n      ),
    .rcc_bkpram_rst_n        ( rcc_bkpram_rst_n     ),
    .rcc_ramecc3_rst_n       ( rcc_ramecc3_rst_n    ),
    .rcc_hsem_rst_n          ( rcc_hsem_rst_n       ),
    .rcc_adc3_rst_n          ( rcc_adc3_rst_n       ),
    .rcc_bdma_rst_n          ( rcc_bdma_rst_n       ),
    .rcc_crc_rst_n           ( rcc_crc_rst_n        ),
    .rcc_gpiok_rst_n         ( rcc_gpiok_rst_n      ),
    .rcc_gpioj_rst_n         ( rcc_gpioj_rst_n      ),
    .rcc_gpioi_rst_n         ( rcc_gpioi_rst_n      ),
    .rcc_gpioh_rst_n         ( rcc_gpioh_rst_n      ),
    .rcc_gpiog_rst_n         ( rcc_gpiog_rst_n      ),
    .rcc_gpiof_rst_n         ( rcc_gpiof_rst_n      ),
    .rcc_gpioe_rst_n         ( rcc_gpioe_rst_n      ),
    .rcc_gpiod_rst_n         ( rcc_gpiod_rst_n      ),
    .rcc_gpioc_rst_n         ( rcc_gpioc_rst_n      ),
    .rcc_gpiob_rst_n         ( rcc_gpiob_rst_n      ),
    .rcc_gpioa_rst_n         ( rcc_gpioa_rst_n      ),
    .rcc_rcc_rst_n           ( rcc_rcc_rst_n        ),
    .rcc_pwr_rst_n           ( rcc_pwr_rst_n        ),
    .rcc_sai4_rst_n          ( rcc_sai4_rst_n       ),
    .rcc_rtc_rst_n           ( rcc_rtc_rst_n        ),
    .rcc_vref_rst_n          ( rcc_vref_rst_n       ),
    .rcc_comp12_rst_n        ( rcc_comp12_rst_n     ),
    .rcc_lptim5_rst_n        ( rcc_lptim5_rst_n     ),
    .rcc_lptim4_rst_n        ( rcc_lptim4_rst_n     ),
    .rcc_lptim3_rst_n        ( rcc_lptim3_rst_n     ),
    .rcc_lptim2_rst_n        ( rcc_lptim2_rst_n     ),
    .rcc_i2c4_rst_n          ( rcc_i2c4_rst_n       ),
    .rcc_spi6_rst_n          ( rcc_spi6_rst_n       ),
    .rcc_lpuart1_rst_n       ( rcc_lpuart1_rst_n    ),
    .rcc_syscfg_rst_n        ( rcc_syscfg_rst_n     ),
    .rcc_iwdg2_rst_n         ( rcc_iwdg2_rst_n      ),
    .rcc_iwdg1_rst_n         ( rcc_iwdg1_rst_n      ),
    .rcc_exti_rst_n          ( rcc_exti_rst_n       )
);


endmodule
