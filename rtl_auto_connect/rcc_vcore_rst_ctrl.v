module rcc_vcore_rst_ctrl #(
    D2_RST_DURATION = 10,
    D1_RST_DURATION = 10
) (
    // signals connected to 复位源 
    input nrst_in,
    input iwdg1_out_rst,
    input wwdg1_out_rst,
    input iwdg2_out_rst,
    input wwdg2_out_rst,
    input lpwr2_rst,
    input lpwr1_rst,
    input pwr_bor_rst,
    input pwr_por_rst,
    input cpu2_sftrst,
    input cpu1_sftrst,

    input pwr_vcore_ok,
    input pwr_d1_ok,
    input pwr_d2_ok,
    input flash_obl_reload,
    input obl_done,
    input flash_power_ok,
    input hsi_rdy,

    //wwdg rst control
    input ww2rsc,
    input ww1rsc,

    // reset signals
    output wire pwr_por_rst_n,
    output reg  sys_rst_n,
    output reg  d1_rst_n,
    output reg  d2_rst_n,
    output wire stby_rst_n,

    // nrst output 
    output nrst_out,
    output cpu1_rst_n,
    output cpu2_rst_n,

    // clock input 
    input  wire sys_d1cpre_clk,      // same as c1_clk but not gated
    input  wire sys_hpre_clk,        // same as c2_clk but not gated
    input  wire sys_clk_pre,
    //peripheral reset signals
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
);
  reg  [$clog2(D1_RST_DURATION)-1:0] d1_rst_n_counter;
  reg  [$clog2(D2_RST_DURATION)-1:0] d2_rst_n_counter;
  /*AUTOWIRE*/
  /*AUTO DECLARE*/



  //generate rst_n for pwr_por_rst
  assign pwr_por_rst_n = ~pwr_por_rst;

  //generate reset for option byte load module
  assign rcc_obl_rst_n = pwr_bor_rst_n & pwr_vcore_ok; // option byte load reset release until power on and vcore power ok

  ///////////////////////////////
  //nrst_out
  ///////////////////////////////

  assign nrst_out      = obl_rst | pwr_por_rst_n | pwr_bor_rst | lpwr1_rst | lpwr2_rst | (wwdg1_out_rst & ww1rsc) | (wwdg2_out_rst & ww2rsc) | iwdg1_out_rst | iwdg2_out_rst | cpu2_sftrst | cpu1_sftrst;

  ///////////////////////////////
  //d1 d2 system standby reset generate
  ///////////////////////////////
  always @(posedge sys_d1cpre_clk or negedge pwr_d1_ok) begin
    if (~pwr_d1_ok) begin
      d1_rst_n         <= 1'b0;
      d1_rst_n_counter <= 0;
    end else begin
      if (d1_rst_n_counter < D1_RST_DURATION) begin
        d1_rst_n         <= 1'b0;
        d1_rst_n_counter <= d1_rst_n_counter + 1;
      end else begin
        if (flash_power_ok) d1_rst_n <= 1'b1;
        d1_rst_n_counter <= D1_RST_DURATION;
      end
    end
  end

  always @(posedge sys_hpre_clk or negedge pwr_d2_ok) begin
    if (~pwr_d2_ok) begin
      d2_rst_n         <= 1'b0;
      d2_rst_n_counter <= 0;
    end else begin
      if (d2_rst_n_counter < D2_RST_DURATION) begin
        d2_rst_n         <= 1'b0;
        d2_rst_n_counter <= d2_rst_n_counter + 1;
      end else begin
        d2_rst_n         <= 1'b1;
        d2_rst_n_counter <= D2_RST_DURATION;
      end
    end
  end

  ///////////////////////////////
  //system reset generate
  ///////////////////////////////

  always @(posedge sys_clk_pre or negedge sys_rst_n_assert) begin
    if (~sys_rst_n_assert) begin
      sys_rst_n <= 1'b0;
    end else begin
      if (sys_rst_n_release) sys_rst_n <= 1'b1;
    end
  end
  assign sys_rst_n_assert  = ~nrst_in & hw_init_done;
  assign sys_rst_n_release = hsi_rdy & flash_power_ok;

  ///////////////////////////////
  //hw init done generate 
  ///////////////////////////////
  assign hw_init_done      = ~pwr_por_rst & pwr_vcore_ok & ~flash_obl_reload & obl_done;

  ///////////////////////////////
  //obl reset generate
  ///////////////////////////////
  assign obl_rst           = ~obl_done | flash_obl_reload;

  ///////////////////////////////
  //rcc vcore reset generate
  ///////////////////////////////
  assign rcc_vcore_rst     = pwr_por_rst | ~pwr_vcore_ok | ~obl_done;

  ///////////////////////////////
  //standby reset generate
  ///////////////////////////////
  assign stby_rst_n        = ~rcc_vcore_rst;

  //////////////////////////////////
  //cpu and bus reset generate
  /////////////////////////////////
  assign cpu1_rst_n        = sys_rst_n & d1_rst_n & ~wwdg1_out_rst;
  assign cpu2_rst_n        = sys_rst_n & d2_rst_n & ~wwdg2_out_rst;

  rcc_per_rst_control u_rcc_rcc_per_rst_control (/*AUTOINST*/
  
  );


endmodule
