module rcc_vsw_reg(
    input wire rst_n,

    output reg bdrst,
    output reg rtcen,
    output reg [1:0] rtcsel,
    input wire rcc_lsecss_fail,
    output reg lsecsson,
    output reg [1:0] lsedrv,
    output reg lsebyp,
    input wire lserdy,
    output reg lseon,

    input wire rcc_bdcr_byte2_wren,
    input wire rcc_bdcr_byte1_wren,
    input wire rcc_bdcr_byte0_wren,

    // rcc_bdcr 
    output wire cur_rcc_bdcr_bdrst,
    input wire nxt_rcc_bdcr_bdrst,
    output wire cur_rcc_bdcr_rtcen,
    input wire nxt_rcc_bdcr_rtcen,
    output wire [1:0]cur_rcc_bdcr_rtcsel,
    input wire [1:0]nxt_rcc_bdcr_rtcsel,
    output reg cur_rcc_bdcr_lsecssd,
    output wire cur_rcc_bdcr_lsecsson,
    input wire nxt_rcc_bdcr_lsecsson,
    output wire [1:0]cur_rcc_bdcr_lsedrv,
    input wire [1:0]nxt_rcc_bdcr_lsedrv,
    output wire cur_rcc_bdcr_lsebyp,
    input wire nxt_rcc_bdcr_lsebyp,
    output wire cur_rcc_bdcr_lserdy,
    output wire cur_rcc_bdcr_lseon,
    input wire nxt_rcc_bdcr_lseon
);


wire rtcsel_wren_n;
wire lsecsson_wren_n;
wire rcc_bdcr_lsecssd_set;
wire rcc_bdcr_lsecssd_clr;


// --------------------------------------------------------------------------------
// 16:16               bdrst              RW                  1'b0                 
// --------------------------------------------------------------------------------
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_bdcr_bdrst (
  .clk  (rcc_bdcr_byte2_wren),
  .rst_n(rst_n             ),
  .en   (1'b1 ),
  .din  (nxt_rcc_bdcr_bdrst),
  .dout (cur_rcc_bdcr_bdrst)
);





// --------------------------------------------------------------------------------
// 15:15               rtcen              RW                  1'b0                 
// --------------------------------------------------------------------------------
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_bdcr_rtcen (
  .clk  (rcc_bdcr_byte1_wren),
  .rst_n(rst_n             ),
  .en   (1'b1 ),
  .din  (nxt_rcc_bdcr_rtcen),
  .dout (cur_rcc_bdcr_rtcen)
);





// --------------------------------------------------------------------------------
// 9:8               rtcsel              RWOnce                  2'b0                 
// --------------------------------------------------------------------------------
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_bdcr_rtcsel_wren (
  .clk  (rcc_bdcr_byte1_wren),
  .rst_n(rst_n & (~rcc_lsecss_fail)),
  .en   (1'b1 ),
  .din  ((nxt_rcc_bdcr_rtcsel != 2'b00) | (cur_rcc_bdcr_rtcsel != 2'b00)),
  .dout (rtcsel_wren_n)
);

BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_bdcr_rtcsel (
  .clk  (rcc_bdcr_byte1_wren & ~rtcsel_wren_n),
  .rst_n(rst_n             ),
  .en   (1'b1 ),
  .din  (nxt_rcc_bdcr_rtcsel),
  .dout (cur_rcc_bdcr_rtcsel)
);





// --------------------------------------------------------------------------------
// 6:6               lsecssd              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign rcc_bdcr_lsecssd_set = rcc_lsecss_fail ;
assign rcc_bdcr_lsecssd_clr = ~rst_n ;
always @(*)begin
    if(rcc_bdcr_lsecssd_clr)begin
        cur_rcc_bdcr_lsecssd = 1'b0;
    end
    else if(rcc_bdcr_lsecssd_set)begin
        cur_rcc_bdcr_lsecssd = 1'b1;
    end
    else begin
        cur_rcc_bdcr_lsecssd = cur_rcc_bdcr_lsecssd;
    end
end


// --------------------------------------------------------------------------------
// 5:5               lsecsson              W1S                  1'b0                 
// --------------------------------------------------------------------------------
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_bdcr_lsecsson_wren (
  .clk  (rcc_bdcr_byte0_wren),
  .rst_n(rst_n & (~rcc_lsecss_fail)),
  .en   (1'b1 ),
  .din  ((nxt_rcc_bdcr_lsecsson != 1'b0) | (cur_rcc_bdcr_lsecsson != 1'b0)),
  .dout (lsecsson_wren_n)
);

BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_bdcr_lsecsson (
  .clk  (rcc_bdcr_byte0_wren & lsecsson_wren_n),
  .rst_n(rst_n             ),
  .en   (1'b1 ),
  .din  (nxt_rcc_bdcr_lsecsson),
  .dout (cur_rcc_bdcr_lsecsson)
);





// --------------------------------------------------------------------------------
// 4:3               lsedrv              RW                  2'b0                 
// --------------------------------------------------------------------------------
BB_dfflr #(
  .DW     (2  ),
  .RST_VAL('h0)
) U_rcc_bdcr_lsedrv (
  .clk  (rcc_bdcr_byte0_wren),
  .rst_n(rst_n             ),
  .en   (1'b1 ),
  .din  (nxt_rcc_bdcr_lsedrv),
  .dout (cur_rcc_bdcr_lsedrv)
);





// --------------------------------------------------------------------------------
// 2:2               lsebyp              RW                  1'b0                 
// --------------------------------------------------------------------------------
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_bdcr_lsebyp (
  .clk  (rcc_bdcr_byte0_wren),
  .rst_n(rst_n             ),
  .en   (1'b1 ),
  .din  (nxt_rcc_bdcr_lsebyp),
  .dout (cur_rcc_bdcr_lsebyp)
);





// --------------------------------------------------------------------------------
// 1:1               lserdy              RO                  1'b0                 
// --------------------------------------------------------------------------------
assign cur_rcc_bdcr_lserdy = lserdy;



// --------------------------------------------------------------------------------
// 0:0               lseon              RW                  1'b0                 
// --------------------------------------------------------------------------------
BB_dfflr #(
  .DW     (1  ),
  .RST_VAL('h0)
) U_rcc_bdcr_lseon (
  .clk  (rcc_bdcr_byte0_wren),
  .rst_n(rst_n             ),
  .en   (1'b1 ),
  .din  (nxt_rcc_bdcr_lseon),
  .dout (cur_rcc_bdcr_lseon)
);
    
endmodule