module rcc_vsw_reg(
    input wire write_pulse,
    input wire write_en,
    input wire [10:0] wdata,
    output wire [10:0] rdata,
    input wire rst_n,
    
    output reg bdrst,
    output reg rtcen,
    output reg [1:0] rtcsel,
    input wire lsecssd,
    output reg lsecsson,
    output reg [1:0] lsedrv,
    output reg lsebyp,
    input wire lserdy,
    output reg lseon
);


//lsecsson should be cleared when lsecssd is asserted

    
endmodule