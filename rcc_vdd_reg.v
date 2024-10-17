module rcc_vdd_reg(
    input wire write_pulse,
    input wire write_en,
    input wire [15:0] wdata,
    output wire [15:0] rdata,
    input wire addr,
    input wire rst_n,
    
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
    output reg lseon
);






    
endmodule