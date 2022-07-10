module fpga_gpu(
    input       CLOCK_50,
    input [3:0] KEY,

    // SRAM interface
    output [19:0] SRAM_ADDR,
    inout  [15:0] SRAM_DQ,
    output        SRAM_OE_N,
    output        SRAM_WE_N,
    output        SRAM_CE_N,
    output        SRAM_LB_N,
    output        SRAM_UB_N,

    // LCD interface
    output [7:0] LTM_R,
    output [7:0] LTM_G,
    output [7:0] LTM_B,
    output       LTM_NCLK,
    output       LTM_DEN,
    output       LTM_HD,
    output       LTM_VD,
    output       LTM_GREST
);

    platform u0 (
        .clock_50_clk   (CLOCK_50),
        .reset_reset_n  (KEY[0]),
        .clk_scanout_clk(LTM_NCLK),

        .sram_dq_new_signal  (SRAM_DQ),
        .sram_addr_new_signal(SRAM_ADDR),
        .sram_ce_n_new_signal(SRAM_CE_N),
        .sram_oe_n_new_signal(SRAM_OE_N),
        .sram_we_n_new_signal(SRAM_WE_N),

        // .sram_DQ  (SRAM_DQ),
        // .sram_ADDR(SRAM_ADDR),
        // .sram_LB_N(SRAM_LB_N),
        // .sram_UB_N(SRAM_UB_N),
        // .sram_CE_N(SRAM_CE_N),
        // .sram_OE_N(SRAM_OE_N),
        // .sram_WE_N(SRAM_WE_N),

        .ltm_r_new_signal  (LTM_R),
        .ltm_g_new_signal  (LTM_G),
        .ltm_b_new_signal  (LTM_B),
        .ltm_den_new_signal(LTM_DEN),
        .ltm_hd_new_signal (LTM_HD),
        .ltm_vd_new_signal (LTM_VD)
    );

    assign SRAM_LB_N = 0;
    assign SRAM_UB_N = 0;

    assign LTM_GREST = 1;

endmodule
