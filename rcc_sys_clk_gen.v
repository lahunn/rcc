module rcc_sys_clk_gen (
    input wire sys_rst_n,

    // clock source of sys_clk
    input wire hsi_clk,
    input wire csi_clk,
    input wire hse_clk,
    input wire pll1_pclk,

    //clock select
    input wire sys_clk_sw,

    //divide factor
    input wire [3:0] d1cpre,
    input wire [2:0] d1ppre,
    input wire [3:0] hpre,
    input wire [2:0] d2ppre1,
    input wire [2:0] d2ppre2,
    input wire [2:0] d3ppre,

    input wire timpre,
    input wire hrtimsel,

    //control signals of sys_clk
    input wire [0:0] c2_sleep,
    input wire [0:0] c2_deepsleep,
    input wire [0:0] c1_sleep,
    input wire [0:0] c1_deepsleep,
    input wire d3_deepsleep,
    input wire c2_per_alloc_d1,
    input wire c1_per_alloc_d2,

    //output clocks
    output wire [0:0] rcc_c2_clk,
    output wire [0:0] rcc_fclk_c2,
    output wire [0:0] rcc_c2_systick_clk,
    output wire [0:0] rcc_c2_rst_n,
    output wire [0:0] rcc_c1_clk,
    output wire [0:0] rcc_fclk_c1,
    output wire [0:0] rcc_c1_systick_clk,
    output wire [0:0] rcc_c1_rst_n,
    output wire [0:0] rcc_axibridge_d1_clk,
    output wire [0:0] rcc_ahb3bridge_d1_clk,
    output wire [0:0] rcc_apb3bridge_d1_clk,
    output wire [0:0] rcc_ahb1bridge_d2_clk,
    output wire [0:0] rcc_ahb2bridge_d2_clk,
    output wire [0:0] rcc_apb1bridge_d2_clk,
    output wire [0:0] rcc_apb2bridge_d2_clk,
    output wire [0:0] rcc_ahb4bridge_d3_clk,
    output wire [0:0] rcc_apb4bridge_d3_clk,
    output wire [0:0] rcc_timx_ker_clk,
    output wire [0:0] rcc_timy_ker_clk,
    output wire [0:0] rcc_hrtimer_ker_clk,
    output wire sys_d1cpre_clk,
    output wire sys_hpre_clk,

    // signals connected to busy 指示信号 
    input axibridge_d1_busy,
    input ahbbridge_d1_busy,
    input apbbridge_d1_busy,
    input ahb1bridge_d2_busy,
    input ahb2bridge_d2_busy,
    input apb1bridge_d2_busy,
    input apb2bridge_d2_busy,
    input ahb4bridge_d3_busy,
    input apb4bridge_d3_busy,
    input flash_busy
);

// sys_clk_generate
    wire sys_clk_pre;
    wire sys_clk_gated;
    wire sys_clk_en;

    wire rcc_d1_bus_clk;
    wire rcc_d2_bus_clk;
    wire rcc_d3_bus_clk;

    wire rcc_d1_bus_clk_en;
    wire rcc_d2_bus_clk_en;
    wire rcc_d3_bus_clk_en;
    wire rcc_c1_clk_en;

    wire hrtim_ker_clk_hspeed;

    wire d1_busy;
    wire d2_busy;
    wire d3_busy;


///////////////////////////////////////
// clock gate control /////////////////
///////////////////////////////////////

    assign d1_busy = axibridge_d1_busy | ahbbridge_d1_busy | apbbridge_d1_busy  | flash_busy;
    assign d2_busy = ahb1bridge_d2_busy | ahb2bridge_d2_busy | apb1bridge_d2_busy | apb2bridge_d2_busy;
    assign d3_busy = d1_busy | d2_busy | ahb4bridge_d3_busy | apb4bridge_d3_busy;
    
    assign sys_clk_en = (~(c1_deepsleep & c2_deepsleep & d3_deepsleep)) | d3_busy | rcc_d1_bus_clk_en | rcc_d2_bus_clk_en;
    assign rcc_c1_clk_en = ~c1_deepsleep & ~c1_sleep;
    assign rcc_c2_clk_en = ~c2_deepsleep & ~c2_sleep;

    assign rcc_d1_bus_clk_en = ~c1_deepsleep | (c2_per_alloc_d1 & ~c2_deepsleep) | d1_busy;
    assign rcc_d2_bus_clk_en = ~c2_deepsleep | (c1_per_alloc_d2 & ~c1_deepsleep) | d2_busy;
    assign rcc_d3_bus_clk_en = sys_clk_en;



///////////////////////////////////////
// system clock generate///////////////
///////////////////////////////////////

    glitch_free_clk_switch #(
        .CLK_NUM(4)
    ) sys_clk_switch (
        .clk_in({pll1_pclk, hse_clk, csi_clk, hsi_clk}),
        .sel(sys_clk_sw),
        .clk_out(sys_clk_pre)
    );
    rcc_clk_gate_cell sys_clk_gate(
        .clk_in(sys_clk_pre),
        .clk_out(sys_clk_gated),
        .clk_gate(sys_clk_en)
    );

    div_x_stage #(
        .STAGE_NUM(9),   // 2 ^ 9 = 512
        .IS_STAGE_REMOVE(1),
        .STAGE_REMOVED(5)  // remove 32 divided clock
    ) sys_d1cpre_clk_divider(
        .clk_in(sys_clk_gated),
        .div_sel(d1cpre),
        .clk_out(sys_d1cpre_clk)
    );

///////////////////////////////////////
// d1 domian clock generate///////////
///////////////////////////////////////
    rcc_clk_gate_cell rcc_c1_clk_gate(
        .clk_in(sys_d1cpre_clk),
        .clk_out(rcc_c1_clk),
        .clk_gate(rcc_c1_clk_en)
    );
    assign rcc_fclk_c1 = rcc_c1_clk;

    div_2_to_xth #(
        .SQUARE(3)
    ) c1_systick_clk_div(
        .clk_in(rcc_c1_clk),
        .clk_out(rcc_c1_systick_clk)
    );

    div_x_stage #(
        .STAGE_NUM(9),   // 2 ^ 9 = 512
        .IS_STAGE_REMOVE(1),
        .STAGE_REMOVED(5)  // remove 32 divided clock
    ) sys_hpre_clk_divider(
        .clk_in(sys_d1cpre_clk),
        .div_sel(hpre),
        .clk_out(sys_hpre_clk)
    );

    rcc_clk_gate_cell rcc_d1_bus_clk_gate(
        .clk_in(sys_hpre_clk),
        .clk_out(rcc_d1_bus_clk),
        .clk_gate(rcc_d1_bus_clk_en)
    );

    assign rcc_axibridge_d1_clk = rcc_d1_bus_clk;
    assign rcc_ahbbridge_d1_clk = rcc_d1_bus_clk;
    
    div_x_stage #(
        .STAGE_NUM(4), // 2 ^ 4 = 16
        .IS_STAGE_REMOVE(0),   // don't remove
        .STAGE_REMOVED(0)
    ) rcc_d2_bus_clk_divider(
        .clk_in(rcc_d1_bus_clk),
        .div_sel(d1ppre),
        .clk_out(rcc_apb3bridge_d1_clk)
    );

///////////////////////////////////////
// d2 domian clock generate///////////
///////////////////////////////////////

    rcc_clk_gate_cell rcc_c2_clk_gate(
        .clk_in(sys_hpre_clk),
        .clk_out(rcc_c2_clk),
        .clk_gate(rcc_c2_clk_en)
    );

    assign rcc_fclk_c2 = rcc_c2_clk;

    div_2_to_xth #(
        .SQUARE(3)
    ) c2_systick_clk_div(
        .clk_in(rcc_c2_clk),
        .clk_out(rcc_c2_systick_clk)
    );

    rcc_clk_gate_cell rcc_d2_bus_clk_gate(
        .clk_in(sys_hpre_clk),
        .clk_out(rcc_d2_bus_clk),
        .clk_gate(rcc_d2_bus_clk_en)
    );

    assign rcc_ahb1bridge_d2_clk = rcc_d2_bus_clk;
    assign rcc_ahb2bridge_d2_clk = rcc_d2_bus_clk;

    rcc_pclk_timer_div rcc_apb1clk_timer_div(
        .clk_in(rcc_d2_bus_clk),
        .rst_n(sys_rst_n),
        .div_sel(d2ppre1),
        .timpre(timpre),
        .tim_ker_clk(rcc_timx_ker_clk),
        .pclk(rcc_apb1bridge_d2_clk)
    );

    rcc_pclk_timer_div rcc_apb2clk_timer_div(
        .clk_in(rcc_d2_bus_clk),
        .rst_n(sys_rst_n),
        .div_sel(d2ppre2),
        .timpre(timpre),
        .tim_ker_clk(rcc_timy_ker_clk),
        .pclk(rcc_apb2bridge_d2_clk)
    );

    rcc_clk_gate_cell hrtim_ker_clk_hspeed_gate(
        .clk_in(sys_d1cpre_clk),
        .clk_out(hrtim_ker_clk_hspeed),
        .clk_gate(hrtim_ker_clk_hspeed_en)
    );

    assign rcc_hrtimer_ker_clk = hrtimsel ? rcc_timy_ker_clk : hrtim_ker_clk_hspeed;

///////////////////////////////////////
// d2 domian clock generate///////////
///////////////////////////////////////

    rcc_clk_gate_cell rcc_d3_bus_clk_gate(
        .clk_in(sys_hpre_clk),
        .clk_out(rcc_d3_bus_clk),
        .clk_gate(rcc_d3_bus_clk_en)
    );

    assign rcc_ahb4bridge_d3_clk = rcc_d3_bus_clk;
    
    div_x_stage #(
        .STAGE_NUM(4), // 2 ^ 4 = 16
        .IS_STAGE_REMOVE(0),   // don't remove
        .STAGE_REMOVED(0)
    ) rcc_d3_bus_clk_divider(
        .clk_in(rcc_d3_bus_clk),
        .rst_n(sys_rst_n),
        .div_sel(d3ppre),
        .clk_out(rcc_apb4bridge_d3_clk)
    );



endmodule