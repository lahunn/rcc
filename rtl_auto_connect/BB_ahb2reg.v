module BB_ahb2reg #(
    parameter DW = 64,
    parameter AW = 15,
    parameter WW = (DW / 8)
) (
    input           hclk,
    input           hresetn,
    input           hready,
    input           hsel,
    input  [   1:0] htrans,
    input           hwrite,
    input  [  31:0] haddr,
    input  [   2:0] hsize,
    input  [DW-1:0] hwdata,
    output [DW-1:0] hrdata,
    output          hreadyout,
    output          hresp,

    output          mreq,
    output          mwrite,
    output [AW-1:0] maddr,
    output [WW-1:0] mwstrb,
    output [DW-1:0] mdata,
    input  [DW-1:0] sdata,
    input           sready,
    input           sresp
);

  localparam BW = $clog2(WW);
  localparam CW = (AW + WW);

  wire          act_trans;
  wire          cvld_set;
  wire          cvld_clr;
  wire          cvld_save;
  wire          nxt_cvld;
  wire          cur_cvld;
  wire [CW-1:0] cur_ctrl;
  wire [CW-1:0] nxt_ctrl;
  wire          ctrl_save;
  wire [BW-1:0] haddrl;
  wire [AW-1:0] haddrh;
  wire [WW-1:0] buf_we;
  wire [AW-1:0] buf_addr;
  wire [  BW:0] size_line  [WW-1:0];
  wire [WW-1:0] int_we;
  wire          wait_state;
  wire          cur_err;
  wire          nxt_err;
  wire          err_save;
  wire          err_set;
  wire          err_clr;

  //===============================================================================================
  //  SIGNAL ALIAS
  //===============================================================================================

  assign act_trans  = hready && hsel && htrans[1];

  assign wait_state = cur_cvld && !sready;

  assign haddrl     = haddr[BW-1:0];
  assign haddrh     = haddr[BW+:AW];  // haddr[AW+BW-1:BW];
  assign hreadyout  = !wait_state && !err_set;
  assign hresp      = err_set || cur_err;
  assign hrdata     = sdata;
  //access register
  assign mreq       = cur_cvld;
  assign maddr      = buf_addr;
  assign mwrite     = |buf_we;
  assign mwstrb     = buf_we;
  assign mdata      = hwdata;

  //===============================================================================================
  //  CONTROL BUFFER
  //===============================================================================================
  //control valid 
  BB_dfflr #(
      .DW     (1),
      .RST_VAL(1'b0)
  ) u_cvld_dfflr (
      .clk  (hclk),
      .rst_n(hresetn),
      .en   (cvld_save),
      .din  (nxt_cvld),
      .dout (cur_cvld)
  );
  assign cvld_save = cvld_set || cvld_clr;
  assign nxt_cvld  = cvld_set;

  //Set when control is not valid and incoming transfer
  assign cvld_set  = !cur_cvld && act_trans;

  //cleared when transfer accepted while incoming transfer
  assign cvld_clr  = cur_cvld && !act_trans && sready;

  //control signal enter this buffer unless pending request not accepted
  BB_dfflr #(
      .DW     (CW),
      .RST_VAL({CW{1'b0}})
  ) u_ctrl_dfflr (
      .clk  (hclk),
      .rst_n(hresetn),
      .en   (ctrl_save),
      .din  (nxt_ctrl),
      .dout (cur_ctrl)
  );
  assign ctrl_save          = act_trans && !wait_state;
  assign nxt_ctrl           = {int_we, haddrh};
  assign {buf_we, buf_addr} = cur_ctrl;

  //Response error , asserted only one cycle
  BB_dfflr #(
      .DW     (1),
      .RST_VAL(1'b0)
  ) u_err_dfflr (
      .clk  (hclk),
      .rst_n(hresetn),
      .en   (err_save),
      .din  (nxt_err),
      .dout (cur_err)
  );
  assign err_save = err_set || err_clr;
  assign nxt_err  = err_set;
  assign err_set  = cur_cvld && sready && sresp;
  assign err_clr  = cur_err;

  //===============================================================================================
  // BYTE WRITE ENABLE GENERATION
  //===============================================================================================
  generate
    genvar i, j, k;
    for (i = 0; i <= BW; i = i + 1) begin : bw_blk
      for (j = 0; j < WW; j = j + 1) begin : ww_blk
        case (i)
          0: begin : smallest_blk
            assign size_line[j][0] = (hsize == 0) && (haddr == j / (2 ** 0));
          end
          BW: begin : largest_blk
            assign size_line[j][BW] = (hsize == BW);
          end
          default:
          begin : default_blk
            assign size_line[j][i] = (hsize == i) && ((haddrl >> i) == j / (2 ** i));
          end
        endcase
      end
    end

    for (k = 0; k < WW; k = k + 1) begin : we_blk
      assign int_we[k] = |size_line[k] && hwrite;
    end
  endgenerate

endmodule
