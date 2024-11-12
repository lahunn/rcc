/* verilator lint_off UNUSEDSIGNAL */
// spyglass disable_block W240
//regret not read input bug
// spyglass disable_block W287b
//neglect not used output bug
module per_clk_rst_control #(
    parameter BUS_CLK_NUM = 1,
    parameter SUPPORT_LPEN = 0,
    parameter SUPPORT_AMEN = 0,
    parameter D3_DEFAULT_NO_CLK = 0,  //for a d3 domain IP , it could be no clock by default, or it could be a clock by default 
    parameter ASSIGNED_TO_CPU1 = 0,  //implicitly_assigned_to_cpu1 0 or 1
    parameter ASSIGNED_TO_CPU2 = 0,  //implicitly_assigned_to 0 or 1
    parameter DOMAIN = 1,  //DOMAIN = 1,2,3  other values are not allowed
    parameter CLK_ON_AFTER_PER_RST_RELEASE = 2
) (
    input [BUS_CLK_NUM-1:0] bus_clks,
    input                   rcc_c1_per_en,
    input                   rcc_c1_per_lpen,
    input                   rcc_c2_per_en,
    input                   rcc_c2_per_lpen,
    input                   rcc_per_amen,
    input                   c1_sleep,
    input                   c1_deepsleep,
    input                   c2_sleep,
    input                   c2_deepsleep,
    input                   d3_deepsleep,
    input                   arcg_on,
    //testmode
    input                   testmode,
    // sys reset
    input                   sys_rst_n,
    // dx reset
    input                   d1_rst_n,         //for D1 peripherals
    input                   d2_rst_n,         //for D2 peripherals
    //software reset
    input                   sft_rst_n,

    output [BUS_CLK_NUM-1:0] per_bus_clks,
    output                   per_rst_n
);

  wire bus_clk_en;
  wire c1_bus_clk_en;
  wire c2_bus_clk_en;
  wire c1_bus_clk_lpen;
  wire c2_bus_clk_lpen;
  wire d3_bus_clk_en;
  wire arcg_clk_en;

  // clock control

  generate
    if (SUPPORT_LPEN == 1) begin : lp_support
      assign c1_bus_clk_lpen = ~c1_sleep || rcc_c1_per_lpen;
      assign c2_bus_clk_lpen = ~c1_sleep || rcc_c2_per_lpen;
    end else begin : lp_not_support
      assign c1_bus_clk_lpen = 1'b1;  //default enable
      assign c2_bus_clk_lpen = 1'b1;  //default enable
    end
  endgenerate

  generate
    if (ASSIGNED_TO_CPU1 == 1) begin : per_assigned_to_cpu1
      assign c1_bus_clk_en = c1_bus_clk_lpen && ~c1_deepsleep;
    end else begin : per_not_assigned_to_cpu1
      assign c1_bus_clk_en = rcc_c1_per_en && c1_bus_clk_lpen && ~c1_deepsleep;
    end
  endgenerate

  generate
    if (ASSIGNED_TO_CPU2 == 1) begin : per_assigned_to_cpu2
      assign c2_bus_clk_en = c2_bus_clk_lpen && ~c2_deepsleep;
    end else begin : per_not_assigned_to_cpu2
      assign c2_bus_clk_en = rcc_c2_per_en && c2_bus_clk_lpen && ~c2_deepsleep;
    end
  endgenerate

  generate
    if (DOMAIN == 3) begin : per_domain_d3
      if (SUPPORT_AMEN == 1) begin : per_domain_d3_amen
        assign d3_bus_clk_en = rcc_per_amen && ~d3_deepsleep;
      end else begin : per_domain_d3_no_amen
        if (D3_DEFAULT_NO_CLK == 1) begin : per_domain_d3_no_clk
          assign d3_bus_clk_en = 1'b0;
        end else begin : per_domain_d3_default_clk
          assign d3_bus_clk_en = ~d3_deepsleep;
        end
      end
    end else begin : per_domain_d1_d2b
      assign d3_bus_clk_en = ~d3_deepsleep;
    end
  endgenerate

  //async reset clock control, use the slowest clock to control arcg_clk_en
  sync_reset_clk_gate #(
      .DELAY(CLK_ON_AFTER_PER_RST_RELEASE)
  ) u_sync_reset_clk_gate (
      .src_rst_n(per_rst_n),
      .i_clk    (bus_clks[0]),
      .arcg_on  (arcg_on),
      .clk_en   (arcg_clk_en)
  );

  assign bus_clk_en = (c1_bus_clk_en || c2_bus_clk_en || d3_bus_clk_en) && arcg_clk_en;

  //bus clock gates

  generate
    genvar i;
    for (i = 0; i < BUS_CLK_NUM; i = i + 1) begin : bus_clk_gate
      async_clk_gating u_bus_clk_gating (
          .raw_clk(bus_clks[i]),
          .active (bus_clk_en),
          .bypass (testmode),
          .rst_n  (per_rst_n),
          .gen_clk(per_bus_clks[i])
      );
    end
  endgenerate
  //reset control
  generate
    if (DOMAIN == 1) begin : per_domain_d1_rst
      assign per_rst_n = sys_rst_n && d1_rst_n && sft_rst_n;
    end else if (DOMAIN == 2) begin : per_domain_d2_rst
      assign per_rst_n = sys_rst_n && d2_rst_n && sft_rst_n;
    end else begin : per_domain_d3_rst
      assign per_rst_n = sys_rst_n && sft_rst_n;
    end
  endgenerate

endmodule
// spyglass enable_block W240
// spyglass enable_block W287b