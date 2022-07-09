module fpga_gpu(
    CLOCK_50,
    KEY,

    // SRAM_ADDR,
    // SRAM_DQ,
    // SRAM_OE_N,
    // SRAM_WE_N,
    // SRAM_CE_N,
    // SRAM_LB_N,
    // SRAM_UB_N,

    LTM_R,
    LTM_G,
    LTM_B,
    LTM_NCLK,
    LTM_DEN,
    LTM_HD,
    LTM_VD,
    LTM_GREST);

input CLOCK_50;
input [3:0] KEY;

// output [19:0] SRAM_ADDR;
// inout [15:0] SRAM_DQ;
// output SRAM_OE_N;
// output SRAM_WE_N;
// output SRAM_CE_N;
// output SRAM_LB_N;
// output SRAM_UB_N;

output [7:0] LTM_R;
output [7:0] LTM_G;
output [7:0] LTM_B;
output LTM_NCLK;
output LTM_DEN;
output LTM_HD;
output LTM_VD;
output LTM_GREST;

wire display_clk;
platform u0 (
    .clock_50_clk       (CLOCK_50),
    .reset_reset_n      (KEY[0]),
    .display_clk_clk    (display_clk),
    .ltm_r_new_signal   (LTM_R),
    .ltm_g_new_signal   (LTM_G),
    .ltm_b_new_signal   (LTM_B),
    .ltm_den_new_signal (LTM_DEN),
    .ltm_hd_new_signal  (LTM_HD),
    .ltm_vd_new_signal  (LTM_VD));

// assign SRAM_LB_N = 0;
// assign SRAM_UB_N = 0;

assign LTM_NCLK = display_clk;
assign LTM_GREST = 1;

endmodule
