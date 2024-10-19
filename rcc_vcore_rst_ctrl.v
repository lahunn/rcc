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
    input  pwr_vsw_rst,
    input  stby_rst,
    input  cpu2_sftrst,
    input  cpu1_sftrst,


    input wire pwr_vcore_ok,
    input wire pwr_d1_ok,
    input wire pwr_d2_ok,
    input wire flash_obl_reload,
    input wire obl_done,

    // reset signals
    output wire pwr_por_rst_n,
    output wire pwr_vsw_rst_n,
    output wire sys_rst_n,
    output wire rcc_perx_rst_n,
    output reg d1_rst_n,
    output reg d2_rst_n,
    output wire sdby_rst_n,

    // nrst output 
    output nrst_out,

    // clock input 
    input wire sys_d1cpre_clk,  // same as c1_clk but not gated
    input wire sys_hpre_clk  // same as c2_clk but not gated


);
    
wire obl_rst;
wire sys_rst;
wire rcc_perx_rst;
wire sdby_rst;

reg [$clog2(D1_RST_DURATION)-1:0] d1_rst_n_counter;
reg [$clog2(D2_RST_DURATION)-1:0] d2_rst_n_counter;

reg rcc_vcore_rst;
wire hw_init_done;

///////////////////////////////
//nrst_out
///////////////////////////////

assign nrst_out = obl_rst | pwr_por_rst_n | pwr_bor_rst | lpwr1_rst | lpwr2_rst | wwdg1_out_rst | wwdg2_out_rst | iwdg1_out_rst | iwdg2_out_rst ;

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
always @(*) begin
    if(~pwr_vcore_ok)begin
        rcc_vcore_rst = 1'b1;
    end
    else if(obl_done & ~flash_obl_reload)begin
        rcc_vcore_rst = 1'b0;
    end
    else begin
        rcc_vcore_rst = rcc_vcore_rst;
    end
end

///////////////////////////////
//standby reset generate
///////////////////////////////
assign stby_rst = rcc_vcore_rst;


endmodule
