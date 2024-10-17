module rcc_vdd_reg(
    input wire wdata,
    output wire [15:0] rdata,
    input wire rst_n,
    input wire rcc_c1_rsr_rmvf_wren,
    input wire rcc_c2_rsr_rmvf_wren,
    input wire rcc_csr_lsion_wren,
    
    input wire nrst_in,
    input wire obl_rst,
    input wire lpwr2_rst,
    input wire lpwr1_rst,
    input wire wwdg1_out_rst,
    input wire wwdg2_out_rst,
    input wire iwdg1_out_rst,
    input wire iwdg2_out_rst,
    input wire cpu2_sftrst,
    input wire cpu1_sftrst,
    input wire pwr_por_rst,
    input wire pwr_bor_rst,
    input wire d2_rst,
    input wire d1_rst,
    input wire cpu2_rst,
    input wire cpu1_rst,
    input wire lsi_rdy,

    // rcc_c1_rsr 
    output reg cur_rcc_c1_rsr_lpwr2rstf,
    output reg cur_rcc_c1_rsr_lpwr1rstf,
    output reg cur_rcc_c1_rsr_wwdg2rstf,
    output reg cur_rcc_c1_rsr_wwdg1rstf,
    output reg cur_rcc_c1_rsr_iwdg2rstf,
    output reg cur_rcc_c1_rsr_iwdg1rstf,
    output reg cur_rcc_c1_rsr_sft2rstf,
    output reg cur_rcc_c1_rsr_sft1rstf,
    output reg cur_rcc_c1_rsr_porrstf,
    output reg cur_rcc_c1_rsr_pinrstf,
    output reg cur_rcc_c1_rsr_borrstf,
    output reg cur_rcc_c1_rsr_d2rstf,
    output reg cur_rcc_c1_rsr_d1rstf,
    output reg cur_rcc_c1_rsr_oblrstf,
    output wire cur_rcc_c1_rsr_rmvf,
    // rcc_c2_rsr 
    output reg cur_rcc_c2_rsr_lpwr2rstf,
    output reg cur_rcc_c2_rsr_lpwr1rstf,
    output reg cur_rcc_c2_rsr_wwdg2rstf,
    output reg cur_rcc_c2_rsr_wwdg1rstf,
    output reg cur_rcc_c2_rsr_iwdg2rstf,
    output reg cur_rcc_c2_rsr_iwdg1rstf,
    output reg cur_rcc_c2_rsr_sft2rstf,
    output reg cur_rcc_c2_rsr_sft1rstf,
    output reg cur_rcc_c2_rsr_porrstf,
    output reg cur_rcc_c2_rsr_pinrstf,
    output reg cur_rcc_c2_rsr_borrstf,
    output reg cur_rcc_c2_rsr_d2rstf,
    output reg cur_rcc_c2_rsr_d1rstf,
    output reg cur_rcc_c2_rsr_oblrstf,
    output wire cur_rcc_c2_rsr_rmvf,
    // rcc_csr
    output wire cur_rcc_csr_lsirdy,
    output reg cur_rcc_csr_lsion
);

// rcc_c1_rsr 
wire rcc_c1_rsr_lpwr2rstf_set;
wire rcc_c1_rsr_lpwr2rstf_clr;
wire rcc_c1_rsr_lpwr1rstf_set;
wire rcc_c1_rsr_lpwr1rstf_clr;
wire rcc_c1_rsr_wwdg2rstf_set;
wire rcc_c1_rsr_wwdg2rstf_clr;
wire rcc_c1_rsr_wwdg1rstf_set;
wire rcc_c1_rsr_wwdg1rstf_clr;
wire rcc_c1_rsr_iwdg2rstf_set;
wire rcc_c1_rsr_iwdg2rstf_clr;
wire rcc_c1_rsr_iwdg1rstf_set;
wire rcc_c1_rsr_iwdg1rstf_clr;
wire rcc_c1_rsr_sft2rstf_set;
wire rcc_c1_rsr_sft2rstf_clr;
wire rcc_c1_rsr_sft1rstf_set;
wire rcc_c1_rsr_sft1rstf_clr;
wire rcc_c1_rsr_porrstf_set;
wire rcc_c1_rsr_porrstf_clr;
wire rcc_c1_rsr_pinrstf_set;
wire rcc_c1_rsr_pinrstf_clr;
wire rcc_c1_rsr_borrstf_set;
wire rcc_c1_rsr_borrstf_clr;
wire rcc_c1_rsr_d2rstf_set;
wire rcc_c1_rsr_d2rstf_clr;
wire rcc_c1_rsr_d1rstf_set;
wire rcc_c1_rsr_d1rstf_clr;
wire rcc_c1_rsr_oblrstf_set;
wire rcc_c1_rsr_oblrstf_clr;
// rcc_c2_rsr 
wire rcc_c2_rsr_lpwr2rstf_set;
wire rcc_c2_rsr_lpwr2rstf_clr;
wire rcc_c2_rsr_lpwr1rstf_set;
wire rcc_c2_rsr_lpwr1rstf_clr;
wire rcc_c2_rsr_wwdg2rstf_set;
wire rcc_c2_rsr_wwdg2rstf_clr;
wire rcc_c2_rsr_wwdg1rstf_set;
wire rcc_c2_rsr_wwdg1rstf_clr;
wire rcc_c2_rsr_iwdg2rstf_set;
wire rcc_c2_rsr_iwdg2rstf_clr;
wire rcc_c2_rsr_iwdg1rstf_set;
wire rcc_c2_rsr_iwdg1rstf_clr;
wire rcc_c2_rsr_sft2rstf_set;
wire rcc_c2_rsr_sft2rstf_clr;
wire rcc_c2_rsr_sft1rstf_set;
wire rcc_c2_rsr_sft1rstf_clr;
wire rcc_c2_rsr_porrstf_set;
wire rcc_c2_rsr_porrstf_clr;
wire rcc_c2_rsr_pinrstf_set;
wire rcc_c2_rsr_pinrstf_clr;
wire rcc_c2_rsr_borrstf_set;
wire rcc_c2_rsr_borrstf_clr;
wire rcc_c2_rsr_d2rstf_set;
wire rcc_c2_rsr_d2rstf_clr;
wire rcc_c2_rsr_d1rstf_set;
wire rcc_c2_rsr_d1rstf_clr;
wire rcc_c2_rsr_oblrstf_set;
wire rcc_c2_rsr_oblrstf_clr;
// rcc_csr
wire        rcc_csr_sel       ;
wire        nxt_rcc_csr_lsion ;
wire        rcc_csr_lsion_en  ;


// --------------------------------------------------------------------------------
// 31:31               lpwr2rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_rsr_lpwr2rstf_set = lpwr2_rst                                        ;
assign rcc_c1_rsr_lpwr2rstf_clr = cur_rcc_c1_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c1_rsr_lpwr2rstf_clr)begin
        cur_rcc_c1_rsr_lpwr2rstf = 1'b0;
    end
    else if(rcc_c1_rsr_lpwr2rstf_set)begin
        cur_rcc_c1_rsr_lpwr2rstf = 1'b1;
    end
    else begin
        cur_rcc_c1_rsr_lpwr2rstf = cur_rcc_c1_rsr_lpwr2rstf;
    end
end





// --------------------------------------------------------------------------------
// 30:30               lpwr1rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_rsr_lpwr1rstf_set = lpwr1_rst                                        ;
assign rcc_c1_rsr_lpwr1rstf_clr = cur_rcc_c1_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c1_rsr_lpwr1rstf_clr)begin
        cur_rcc_c1_rsr_lpwr1rstf = 1'b0;
    end
    else if(rcc_c1_rsr_lpwr1rstf_set)begin
        cur_rcc_c1_rsr_lpwr1rstf = 1'b1;
    end
    else begin
        cur_rcc_c1_rsr_lpwr1rstf = cur_rcc_c1_rsr_lpwr1rstf;
    end
end





// --------------------------------------------------------------------------------
// 29:29               wwdg2rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_rsr_wwdg2rstf_set = wwdg2_out_rst                                        ;
assign rcc_c1_rsr_wwdg2rstf_clr = cur_rcc_c1_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c1_rsr_wwdg2rstf_clr)begin
        cur_rcc_c1_rsr_wwdg2rstf = 1'b0;
    end
    else if(rcc_c1_rsr_wwdg2rstf_set)begin
        cur_rcc_c1_rsr_wwdg2rstf = 1'b1;
    end
    else begin
        cur_rcc_c1_rsr_wwdg2rstf = cur_rcc_c1_rsr_wwdg2rstf;
    end
end





// --------------------------------------------------------------------------------
// 28:28               wwdg1rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_rsr_wwdg1rstf_set = wwdg1_out_rst                                        ;
assign rcc_c1_rsr_wwdg1rstf_clr = cur_rcc_c1_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c1_rsr_wwdg1rstf_clr)begin
        cur_rcc_c1_rsr_wwdg1rstf = 1'b0;
    end
    else if(rcc_c1_rsr_wwdg1rstf_set)begin
        cur_rcc_c1_rsr_wwdg1rstf = 1'b1;
    end
    else begin
        cur_rcc_c1_rsr_wwdg1rstf = cur_rcc_c1_rsr_wwdg1rstf;
    end
end





// --------------------------------------------------------------------------------
// 27:27               iwdg2rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_rsr_iwdg2rstf_set = iwdg1_out_rst                                        ;
assign rcc_c1_rsr_iwdg2rstf_clr = cur_rcc_c1_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c1_rsr_iwdg2rstf_clr)begin
        cur_rcc_c1_rsr_iwdg2rstf = 1'b0;
    end
    else if(rcc_c1_rsr_iwdg2rstf_set)begin
        cur_rcc_c1_rsr_iwdg2rstf = 1'b1;
    end
    else begin
        cur_rcc_c1_rsr_iwdg2rstf = cur_rcc_c1_rsr_iwdg2rstf;
    end
end





// --------------------------------------------------------------------------------
// 26:26               iwdg1rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_rsr_iwdg1rstf_set = iwdg1_out_rst                                        ;
assign rcc_c1_rsr_iwdg1rstf_clr = cur_rcc_c1_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c1_rsr_iwdg1rstf_clr)begin
        cur_rcc_c1_rsr_iwdg1rstf = 1'b0;
    end
    else if(rcc_c1_rsr_iwdg1rstf_set)begin
        cur_rcc_c1_rsr_iwdg1rstf = 1'b1;
    end
    else begin
        cur_rcc_c1_rsr_iwdg1rstf = cur_rcc_c1_rsr_iwdg1rstf;
    end
end





// --------------------------------------------------------------------------------
// 25:25               sft2rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_rsr_sft2rstf_set = cpu2_sftrst                                        ;
assign rcc_c1_rsr_sft2rstf_clr = cur_rcc_c1_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c1_rsr_sft2rstf_clr)begin
        cur_rcc_c1_rsr_sft2rstf = 1'b0;
    end
    else if(rcc_c1_rsr_sft2rstf_set)begin
        cur_rcc_c1_rsr_sft2rstf = 1'b1;
    end
    else begin
        cur_rcc_c1_rsr_sft2rstf = cur_rcc_c1_rsr_sft2rstf;
    end
end





// --------------------------------------------------------------------------------
// 24:24               sft1rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_rsr_sft1rstf_set = cpu1_sftrst                                        ;
assign rcc_c1_rsr_sft1rstf_clr = cur_rcc_c1_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c1_rsr_sft1rstf_clr)begin
        cur_rcc_c1_rsr_sft1rstf = 1'b0;
    end
    else if(rcc_c1_rsr_sft1rstf_set)begin
        cur_rcc_c1_rsr_sft1rstf = 1'b1;
    end
    else begin
        cur_rcc_c1_rsr_sft1rstf = cur_rcc_c1_rsr_sft1rstf;
    end
end





// --------------------------------------------------------------------------------
// 23:23               porrstf              RO                  1'b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_rsr_porrstf_set = pwr_por_rst                                        ;
assign rcc_c1_rsr_porrstf_clr = cur_rcc_c1_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c1_rsr_porrstf_clr)begin
        cur_rcc_c1_rsr_porrstf = 1'b0;
    end
    else if(rcc_c1_rsr_porrstf_set)begin
        cur_rcc_c1_rsr_porrstf = 1'b1;
    end
    else begin
        cur_rcc_c1_rsr_porrstf = cur_rcc_c1_rsr_porrstf;
    end
end





// --------------------------------------------------------------------------------
// 22:22               pinrstf              RO                  1'b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_rsr_pinrstf_set = nrst_in                                        ;
assign rcc_c1_rsr_pinrstf_clr = cur_rcc_c1_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c1_rsr_pinrstf_clr)begin
        cur_rcc_c1_rsr_pinrstf = 1'b0;
    end
    else if(rcc_c1_rsr_pinrstf_set)begin
        cur_rcc_c1_rsr_pinrstf = 1'b1;
    end
    else begin
        cur_rcc_c1_rsr_pinrstf = cur_rcc_c1_rsr_pinrstf;
    end
end





// --------------------------------------------------------------------------------
// 21:21               borrstf              RO                  1'b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_rsr_borrstf_set = pwr_bor_rst                                        ;
assign rcc_c1_rsr_borrstf_clr = cur_rcc_c1_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c1_rsr_borrstf_clr)begin
        cur_rcc_c1_rsr_borrstf = 1'b0;
    end
    else if(rcc_c1_rsr_borrstf_set)begin
        cur_rcc_c1_rsr_borrstf = 1'b1;
    end
    else begin
        cur_rcc_c1_rsr_borrstf = cur_rcc_c1_rsr_borrstf;
    end
end





// --------------------------------------------------------------------------------
// 20:20               d2rstf              RO                  1'b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_rsr_d2rstf_set = d2_rst                                        ;
assign rcc_c1_rsr_d2rstf_clr = cur_rcc_c1_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c1_rsr_d2rstf_clr)begin
        cur_rcc_c1_rsr_d2rstf = 1'b0;
    end
    else if(rcc_c1_rsr_d2rstf_set)begin
        cur_rcc_c1_rsr_d2rstf = 1'b1;
    end
    else begin
        cur_rcc_c1_rsr_d2rstf = cur_rcc_c1_rsr_d2rstf;
    end
end





// --------------------------------------------------------------------------------
// 19:19               d1rstf              RO                  1'b1                 
// --------------------------------------------------------------------------------
assign rcc_c1_rsr_d1rstf_set = d1_rst                                        ;
assign rcc_c1_rsr_d1rstf_clr = cur_rcc_c1_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c1_rsr_d1rstf_clr)begin
        cur_rcc_c1_rsr_d1rstf = 1'b0;
    end
    else if(rcc_c1_rsr_d1rstf_set)begin
        cur_rcc_c1_rsr_d1rstf = 1'b1;
    end
    else begin
        cur_rcc_c1_rsr_d1rstf = cur_rcc_c1_rsr_d1rstf;
    end
end





// --------------------------------------------------------------------------------
// 17:17               oblrstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c1_rsr_oblrstf_set = obl_rst                                        ;
assign rcc_c1_rsr_oblrstf_clr = cur_rcc_c1_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c1_rsr_oblrstf_clr)begin
        cur_rcc_c1_rsr_oblrstf = 1'b0;
    end
    else if(rcc_c1_rsr_oblrstf_set)begin
        cur_rcc_c1_rsr_oblrstf = 1'b1;
    end
    else begin
        cur_rcc_c1_rsr_oblrstf = cur_rcc_c1_rsr_oblrstf;
    end
end


// --------------------------------------------------------------------------------
// 16:16               rmvf                RW                  0b0                 
// --------------------------------------------------------------------------------
assign nxt_rcc_c1_rsr_rmvf = wdata                ;

BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c1_rsr_rmvf (
  .clk  (rcc_c1_rsr_rmvf_wren),
  .rst_n(rst_n               ),
  .en   (wdata   ),
  .din  (nxt_rcc_c1_rsr_rmvf),
  .dout (cur_rcc_c1_rsr_rmvf)
);


// --------------------------------------------------------------------------------
// 31:31               lpwr2rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_rsr_lpwr2rstf_set = lpwr2_rst                                        ;
assign rcc_c2_rsr_lpwr2rstf_clr = cur_rcc_c2_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c2_rsr_lpwr2rstf_clr)begin
        cur_rcc_c2_rsr_lpwr2rstf = 1'b0;
    end
    else if(rcc_c2_rsr_lpwr2rstf_set)begin
        cur_rcc_c2_rsr_lpwr2rstf = 1'b1;
    end
    else begin
        cur_rcc_c2_rsr_lpwr2rstf = cur_rcc_c2_rsr_lpwr2rstf;
    end
end





// --------------------------------------------------------------------------------
// 30:30               lpwr1rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_rsr_lpwr1rstf_set = lpwr1_rst                                        ;
assign rcc_c2_rsr_lpwr1rstf_clr = cur_rcc_c2_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c2_rsr_lpwr1rstf_clr)begin
        cur_rcc_c2_rsr_lpwr1rstf = 1'b0;
    end
    else if(rcc_c2_rsr_lpwr1rstf_set)begin
        cur_rcc_c2_rsr_lpwr1rstf = 1'b1;
    end
    else begin
        cur_rcc_c2_rsr_lpwr1rstf = cur_rcc_c2_rsr_lpwr1rstf;
    end
end





// --------------------------------------------------------------------------------
// 29:29               wwdg2rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_rsr_wwdg2rstf_set = wwdg2_out_rst                                        ;
assign rcc_c2_rsr_wwdg2rstf_clr = cur_rcc_c2_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c2_rsr_wwdg2rstf_clr)begin
        cur_rcc_c2_rsr_wwdg2rstf = 1'b0;
    end
    else if(rcc_c2_rsr_wwdg2rstf_set)begin
        cur_rcc_c2_rsr_wwdg2rstf = 1'b1;
    end
    else begin
        cur_rcc_c2_rsr_wwdg2rstf = cur_rcc_c2_rsr_wwdg2rstf;
    end
end





// --------------------------------------------------------------------------------
// 28:28               wwdg1rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_rsr_wwdg1rstf_set = wwdg1_out_rst                                        ;
assign rcc_c2_rsr_wwdg1rstf_clr = cur_rcc_c2_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c2_rsr_wwdg1rstf_clr)begin
        cur_rcc_c2_rsr_wwdg1rstf = 1'b0;
    end
    else if(rcc_c2_rsr_wwdg1rstf_set)begin
        cur_rcc_c2_rsr_wwdg1rstf = 1'b1;
    end
    else begin
        cur_rcc_c2_rsr_wwdg1rstf = cur_rcc_c2_rsr_wwdg1rstf;
    end
end





// --------------------------------------------------------------------------------
// 27:27               iwdg2rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_rsr_iwdg2rstf_set = iwdg1_out_rst                                        ;
assign rcc_c2_rsr_iwdg2rstf_clr = cur_rcc_c2_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c2_rsr_iwdg2rstf_clr)begin
        cur_rcc_c2_rsr_iwdg2rstf = 1'b0;
    end
    else if(rcc_c2_rsr_iwdg2rstf_set)begin
        cur_rcc_c2_rsr_iwdg2rstf = 1'b1;
    end
    else begin
        cur_rcc_c2_rsr_iwdg2rstf = cur_rcc_c2_rsr_iwdg2rstf;
    end
end





// --------------------------------------------------------------------------------
// 26:26               iwdg1rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_rsr_iwdg1rstf_set = iwdg1_out_rst                                        ;
assign rcc_c2_rsr_iwdg1rstf_clr = cur_rcc_c2_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c2_rsr_iwdg1rstf_clr)begin
        cur_rcc_c2_rsr_iwdg1rstf = 1'b0;
    end
    else if(rcc_c2_rsr_iwdg1rstf_set)begin
        cur_rcc_c2_rsr_iwdg1rstf = 1'b1;
    end
    else begin
        cur_rcc_c2_rsr_iwdg1rstf = cur_rcc_c2_rsr_iwdg1rstf;
    end
end





// --------------------------------------------------------------------------------
// 25:25               sft2rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_rsr_sft2rstf_set = cpu2_sftrst                                        ;
assign rcc_c2_rsr_sft2rstf_clr = cur_rcc_c2_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c2_rsr_sft2rstf_clr)begin
        cur_rcc_c2_rsr_sft2rstf = 1'b0;
    end
    else if(rcc_c2_rsr_sft2rstf_set)begin
        cur_rcc_c2_rsr_sft2rstf = 1'b1;
    end
    else begin
        cur_rcc_c2_rsr_sft2rstf = cur_rcc_c2_rsr_sft2rstf;
    end
end





// --------------------------------------------------------------------------------
// 24:24               sft1rstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_rsr_sft1rstf_set = cpu1_sftrst                                        ;
assign rcc_c2_rsr_sft1rstf_clr = cur_rcc_c2_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c2_rsr_sft1rstf_clr)begin
        cur_rcc_c2_rsr_sft1rstf = 1'b0;
    end
    else if(rcc_c2_rsr_sft1rstf_set)begin
        cur_rcc_c2_rsr_sft1rstf = 1'b1;
    end
    else begin
        cur_rcc_c2_rsr_sft1rstf = cur_rcc_c2_rsr_sft1rstf;
    end
end





// --------------------------------------------------------------------------------
// 23:23               porrstf              RO                  1'b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_rsr_porrstf_set = pwr_por_rst                                        ;
assign rcc_c2_rsr_porrstf_clr = cur_rcc_c2_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c2_rsr_porrstf_clr)begin
        cur_rcc_c2_rsr_porrstf = 1'b0;
    end
    else if(rcc_c2_rsr_porrstf_set)begin
        cur_rcc_c2_rsr_porrstf = 1'b1;
    end
    else begin
        cur_rcc_c2_rsr_porrstf = cur_rcc_c2_rsr_porrstf;
    end
end





// --------------------------------------------------------------------------------
// 22:22               pinrstf              RO                  1'b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_rsr_pinrstf_set = nrst_in                                        ;
assign rcc_c2_rsr_pinrstf_clr = cur_rcc_c2_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c2_rsr_pinrstf_clr)begin
        cur_rcc_c2_rsr_pinrstf = 1'b0;
    end
    else if(rcc_c2_rsr_pinrstf_set)begin
        cur_rcc_c2_rsr_pinrstf = 1'b1;
    end
    else begin
        cur_rcc_c2_rsr_pinrstf = cur_rcc_c2_rsr_pinrstf;
    end
end





// --------------------------------------------------------------------------------
// 21:21               borrstf              RO                  1'b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_rsr_borrstf_set = pwr_bor_rst                                        ;
assign rcc_c2_rsr_borrstf_clr = cur_rcc_c2_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c2_rsr_borrstf_clr)begin
        cur_rcc_c2_rsr_borrstf = 1'b0;
    end
    else if(rcc_c2_rsr_borrstf_set)begin
        cur_rcc_c2_rsr_borrstf = 1'b1;
    end
    else begin
        cur_rcc_c2_rsr_borrstf = cur_rcc_c2_rsr_borrstf;
    end
end





// --------------------------------------------------------------------------------
// 20:20               d2rstf              RO                  1'b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_rsr_d2rstf_set = d2_rst                                        ;
assign rcc_c2_rsr_d2rstf_clr = cur_rcc_c2_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c2_rsr_d2rstf_clr)begin
        cur_rcc_c2_rsr_d2rstf = 1'b0;
    end
    else if(rcc_c2_rsr_d2rstf_set)begin
        cur_rcc_c2_rsr_d2rstf = 1'b1;
    end
    else begin
        cur_rcc_c2_rsr_d2rstf = cur_rcc_c2_rsr_d2rstf;
    end
end





// --------------------------------------------------------------------------------
// 19:19               d1rstf              RO                  1'b1                 
// --------------------------------------------------------------------------------
assign rcc_c2_rsr_d1rstf_set = d1_rst                                        ;
assign rcc_c2_rsr_d1rstf_clr = cur_rcc_c2_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c2_rsr_d1rstf_clr)begin
        cur_rcc_c2_rsr_d1rstf = 1'b0;
    end
    else if(rcc_c2_rsr_d1rstf_set)begin
        cur_rcc_c2_rsr_d1rstf = 1'b1;
    end
    else begin
        cur_rcc_c2_rsr_d1rstf = cur_rcc_c2_rsr_d1rstf;
    end
end





// --------------------------------------------------------------------------------
// 17:17               oblrstf              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_c2_rsr_oblrstf_set = obl_rst                                        ;
assign rcc_c2_rsr_oblrstf_clr = cur_rcc_c2_rsr_rmvf|~rst_n                                        ;
always @(*)begin
    if(rcc_c2_rsr_oblrstf_clr)begin
        cur_rcc_c2_rsr_oblrstf = 1'b0;
    end
    else if(rcc_c2_rsr_oblrstf_set)begin
        cur_rcc_c2_rsr_oblrstf = 1'b1;
    end
    else begin
        cur_rcc_c2_rsr_oblrstf = cur_rcc_c2_rsr_oblrstf;
    end
end
    
// --------------------------------------------------------------------------------
// 16:16               rmvf                RW                  0b0                 
// --------------------------------------------------------------------------------
assign nxt_rcc_c2_rsr_rmvf = wdata                ;

BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_c2_rsr_rmvf (
  .clk  (rcc_c2_rsr_rmvf_wren),
  .rst_n(rst_n               ),
  .en   (1'b1             ),
  .din  (nxt_rcc_c2_rsr_rmvf),
  .dout (cur_rcc_c2_rsr_rmvf)
);

// --------------------------------------------------------------------------------
// 1:1                 lsirdy              RO                  0b0                 
// --------------------------------------------------------------------------------
assign cur_rcc_csr_lsirdy = lsi_rdy;

// --------------------------------------------------------------------------------
// 0:0                 lsion               RW                  0b0                 
// --------------------------------------------------------------------------------
assign nxt_rcc_csr_lsion = wdata      ;

BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_csr_lsion (
  .clk  (rcc_csr_lsion_wren),
  .rst_n(rst_n            ),
  .en   (1'b1             ),
  .din  (nxt_rcc_csr_lsion),
  .dout (cur_rcc_csr_lsion)
);


endmodule