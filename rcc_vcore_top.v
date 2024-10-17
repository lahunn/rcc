module rcc_vcore_top(
    // signals connected to PWR 
    input [0:0] d3_deepsleep,
    input [0:0] pwr_d1_wkup,
    input [0:0] pwr_d2_wkup,
    input [0:0] pwr_d3_wkup,
    output reg rcc_pwr_d1_req,
    output reg rcc_pwr_d2_req,
    output reg rcc_pwr_d3_req,
    output [0:0] c2_per_alloc_d1,
    output [0:0] c1_per_alloc_d2,
    input [0:0] flash_power_ok,
    input [0:0] pwr_d1_ok,
    input [0:0] pwr_d2_ok,
    input [0:0] pwr_vcore_ok,
    input [0:0] backup_protect,

    // signals connected to CPU
    input [0:0] c1_sleep,
    input [0:0] c2_sleep,
    input [0:0] c1_deepsleep,
    input [0:0] c2_deepsleep,


    // reset signals
    output wire pwr_por_rst_n,
    output wire pwr_vsw_rst_n,
    output wire sys_rst_n,
    output wire rcc_perx_rst_n,
    output reg d1_rst_n,
    output reg d2_rst_n,
    output wire sdby_rst_n
    
);


wire c1_per_alloc_d1;
wire c2_per_alloc_d2;

wire rcc_pwr_d1_req_rst_n;
wire rcc_pwr_d2_req_rst_n;
wire rcc_pwr_d3_req_rst_n;
wire rcc_d1_stop;
wire rcc_d2_stop;
wire rcc_sys_stop;

wire sys_clk;


///////////////////////////////////////
// dx_req signal generate /////////////
///////////////////////////////////////

assign rcc_d1_stop = ~(c1_deepsleep & (~c2_per_alloc_d1 | c2_deepsleep));
assign rcc_d2_stop = ~(c2_deepsleep & (~c1_per_alloc_d2 | c1_deepsleep));
assign rcc_sys_stop = ~ (c1_deepsleep & c2_deepsleep & d3_deepsleep) ;

assign rcc_pwr_d1_req_set_n = ~rcc_d1_stop;
assign rcc_pwr_d2_req_set_n = ~rcc_d2_stop;
assign rcc_pwr_d3_req_rst_n = ~rcc_sys_stop;//& hse_off & hsi48_off & pll_off   do we need to add these signals?

always @(posedge sys_clk or negedge sys_rst_n or rcc_pwr_d1_req_rst_n)begin
    if(~sys_rst_n) begin
        rcc_pwr_d1_req <= 1'b0;
    end
    else if(~rcc_pwr_d1_req_rst_n)begin
        rcc_pwr_d1_req <= 1'b1;
    end
    else begin
        if(pwr_d1_wkup)
            rcc_pwr_d1_req<=1'b0;
    end
end

always @(posedge sys_clk or negedge sys_rst_n or rcc_pwr_d2_req_rst_n) begin
    if(~sys_rst_n) begin
        rcc_pwr_d2_req <= 1'b0;
    end
    else if(~rcc_pwr_d2_req_rst_n) begin
        rcc_pwr_d2_req <= 1'b1;
    end
    else begin
        if(pwr_d2_wkup)
            rcc_pwr_d2_req <= 1'b0;
    end
end

always @(posedge sys_clk or negedge sys_rst_n or rcc_pwr_d3_req_rst_n) begin
    if(~sys_rst_n) begin
        rcc_pwr_d3_req <= 1'b0;
    end
    else if(~rcc_pwr_d3_req_rst_n) begin
        rcc_pwr_d3_req <= 1'b1;
    end
    else begin
        if(pwr_d3_wkup)
            rcc_pwr_d3_req <= 1'b0;
    end
end






endmodule