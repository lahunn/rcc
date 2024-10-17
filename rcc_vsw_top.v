module rcc_vsw_top(
    // register signals
    input wire rcc_vsw_write_pulse,
    input wire rcc_vsw_write_en,
    input wire [10:0] rcc_vsw_wdata,
    output wire [10:0] rcc_vsw_rdata,


    // lse signals
    input wire lse_css_fail,
    output wire lse_css_on,
    output wire lse_drv,
    output wire lse_byp,
    input wire [1:0] lse_rdy,
    output wire lse_on,
    input wire lse_clk,
    // lsi signals
    input wire lsi_rdy,
    output wire lsi_on,
    input wire lsi_clk,
    // rtc CLK SEL
    input wire hse_rtc_clk,
    //rtc CLK
    output wire rcc_rtc_ker_clk,

    //reset signals
    input wire pwr_vsw_rst,
    output wire rcc_vsw_rst_n

);
    wire lse_clk_gated;

    wire rcc_rtcsel_clk;
    wire bdrst;
    wire bdrst_n;
    wire rtcen;
    wire [1:0] rtcsel;



    assign bdrst_n = ~bdrst;
    assign rcc_vsw_rst_n = bdrst_n & ~pwr_vsw_rst;

    rcc_vsw_reg x_rcc_vsw_reg (
        .write_pulse(rcc_vsw_write_pulse),
        .write_en(rcc_vsw_write_en),
        .wdata(rcc_vsw_wdata),
        .rdata(rcc_vsw_rdata),
        .rst_n(bdrst_n),
        .bdrst(bdrst),
        .rtcen(rtcen),
        .rtcsel(rtcsel),
        .lsecssd(lse_css_fail),
        .lsecsson(lse_css_on),
        .lsedrv(lse_drv),
        .lsebyp(lse_byp),
        .lserdy(lsi_rdy),
        .lseon(lse_on)
    );

    // rtc ker clock gate
    rcc_clk_gate_cell_sync rcc_rtc_ker_clk_gate (
        .clk_in(rcc_rtcsel_clk),
        .clk_en(rtcen),
        .clk_out(rcc_rtc_ker_clk)
    );

    // rtc ker clock select logic
    glitch_free_clk_switch #(
        .CLK_NUM(4)
    ) rcc_usart16sel_clk_switch(
    .clk_in({hse_rtc_clk,lsi_clk,lse_clk_gated,0}),
    .sel(rtcsel),
    .clk_out(rcc_rtcsel_clk)
    );

    // lse clock gate
    rcc_clk_gate_cell_sync rcc_lse_clk_gate (
        .clk_in(lse_clk),
        .clk_en(lse_css_fail),
        .clk_out(lse_clk_gated)
    );



// level shift

// voltage isolation 
    
endmodule