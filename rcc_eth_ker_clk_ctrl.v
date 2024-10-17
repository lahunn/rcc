module rcc_eth_ker_clk_ctrl (
    input wire pad_rcc_eth_mii_tx_clk,
    input wire pad_rcc_eth_mii_rx_clk,
    input wire eth_rcc_fes,
    input wire eth_rcc_epis_2,

    // reset signal
    input wire sys_rst_n,

    //output
    output wire rcc_eth_mii_tx_clk,
    output wire rcc_eth_mii_rx_clk,
    output wire rcc_eth_rmii_ref_clk,

    // control signals
    input c1_sleep,
    input c1_deepsleep,
    input c2_sleep,
    input c2_deepsleep,


    //register signals

    // eth1rx control signals
    input rcc_c1_eth1rx_en,
    input rcc_c2_eth1rx_en,
    input rcc_c1_eth1rx_lpen,
    input rcc_c2_eth1rx_lpen,
    // eth1tx control signals
    input rcc_c1_eth1tx_en,
    input rcc_c2_eth1tx_en,
    input rcc_c1_eth1tx_lpen,
    input rcc_c2_eth1tx_lpen

);
    wire rcc_eth_mii_tx_clk_pre;
    wire rcc_eth_mii_rx_clk_pre;
    wire pad_rcc_eth_mii_rx_clk_divided;
    wire pad_rcc_eth_mii_rx_clk_div_2;
    wire pad_rcc_eth_mii_rx_clk_div_20;

    wire rcc_eth1rx_clk_en;
    wire rcc_eth1tx_clk_en;
    wire rcc_eth_rmii_ref_clk_en;

    glitch_free_clk_switch #(
    .CLK_NUM ( 2 ))
    eth_mii_tx_clk_switch (
        .clk_in                  ( {pad_rcc_eth_mii_rx_clk_divided,pad_rcc_eth_mii_tx_clk}    ),
        .sel                     ( eth_rcc_epis_2       ),

        .clk_out                 ( rcc_eth_mii_tx_clk_pre   )
    );

    glitch_free_clk_switch #(
    .CLK_NUM ( 2 ))
    eth_mii_rx_clk_switch (
        .clk_in                  ( {pad_rcc_eth_mii_rx_clk_divided,pad_rcc_eth_mii_rx_clk}    ),
        .sel                     ( eth_rcc_epis_2       ),

        .clk_out                 ( rcc_eth_mii_rx_clk_pre   )
    );

    div_even_stable #(
    .DIVISION ( 2 ))
    eth_mii_rx_clk_divider_2 (
        .clk_in                  ( pad_rcc_eth_mii_rx_clk    ),
        .rst_n                   ( sys_rst_n     ),

        .clk_out                 ( pad_rcc_eth_mii_rx_clk_div_2   )
    );

    div_even_stable #(
    .DIVISION ( 20 ))
    eth_mii_rx_clk_divider_20 (
        .clk_in                  ( pad_rcc_eth_mii_rx_clk    ),
        .rst_n                   ( sys_rst_n     ),

        .clk_out                 ( pad_rcc_eth_mii_rx_clk_div_20   )
    );

    assign pad_rcc_eth_mii_rx_clk_divided = eth_rcc_fes ? pad_rcc_eth_mii_rx_clk_div_2 : pad_rcc_eth_mii_rx_clk_div_20;


// gates

    assign rcc_eth1rx_clk_en = (rcc_c1_eth1rx_en & (~c1_sleep | rcc_c1_eth1rx_lpen) & ~c1_deepsleep) | (rcc_c2_eth1rx_en & (~c2_sleep | rcc_c2_eth1rx_lpen) & ~c2_deepsleep);
    assign rcc_eth1tx_clk_en = (rcc_c1_eth1tx_en & (~c1_sleep | rcc_c1_eth1tx_lpen) & ~c1_deepsleep) | (rcc_c2_eth1tx_en & (~c2_sleep | rcc_c2_eth1tx_lpen) & ~c2_deepsleep);
    assign rcc_eth_rmii_ref_clk_en = rcc_eth1rx_clk_en | rcc_eth1tx_clk_en;

    rcc_clk_gate_cell eth_mii_tx_clk_gate(
        .clk_in                  (rcc_eth_mii_tx_clk_pre),
        .clk_en                  (rcc_eth1rx_clk_en),
        .clk_out                 (rcc_eth_mii_tx_clk)
    );  

    rcc_clk_gate_cell eth_mii_rx_clk_gate(
        .clk_in                  (rcc_eth_mii_rx_clk_pre),
        .clk_en                  (rcc_eth1tx_clk_en),
        .clk_out                 (rcc_eth_mii_rx_clk)
    );  

    rcc_clk_gate_cell eth_rmii_ref_clk_gate(
        .clk_in                  (pad_rcc_eth_mii_rx_clk),
        .clk_en                  (rcc_eth_rmii_ref_clk_en),
        .clk_out                 (rcc_eth_rmii_ref_clk)
    );

    
endmodule