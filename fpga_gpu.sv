module fpga_gpu(
    CLOCK_50,

    SRAM_ADDR,
    SRAM_DQ,
    SRAM_OE_N,
    SRAM_WE_N,
    SRAM_CE_N,
    SRAM_LB_N,
    SRAM_UB_N,

    LTM_R,
    LTM_G,
    LTM_B,
    LTM_NCLK,
    LTM_DEN,
    LTM_HD,
    LTM_VD,
    LTM_GREST,
    
    LEDR);

input CLOCK_50;

output [19:0] SRAM_ADDR;
inout [15:0] SRAM_DQ;
output SRAM_OE_N;
output SRAM_WE_N;
output SRAM_CE_N;
output SRAM_LB_N;
output SRAM_UB_N;

output [7:0] LTM_R;
output [7:0] LTM_G;
output [7:0] LTM_B;
output LTM_NCLK;
output LTM_DEN;
output LTM_HD;
output LTM_VD;
output LTM_GREST;

output [17:0] LEDR;

wire sram_clk;
sram_pll sram_pll0 (
    .inclk0(CLOCK_50),
    .c0(sram_clk));

wire display_clk;
display_pll display_pll0 (
    .inclk0(CLOCK_50),
    .c0(display_clk));

reg scanout_sreset_sync;
reg scanout_sreset;
sram_scanout sram_scanout0 (
    .clk(sram_clk),
    .sreset(scanout_sreset),
    .fifo_data(fifo_data),
    .fifo_wrreq(fifo_wrreq),
    .fifo_wrfull(fifo_wr_almost_full),
    .sram_addr(SRAM_ADDR),
    .sram_dq(SRAM_DQ),
    .sram_oe_n(SRAM_OE_N),
    .sram_we_n(SRAM_WE_N),
    .sram_ce_n(SRAM_CE_N));

// Synchronize the reset signal from the scanout module
// from the display clock domain to the SRAM clock domain.
always_ff @(posedge sram_clk) begin
    scanout_sreset_sync <= fifo_aclr;
    scanout_sreset <= scanout_sreset_sync;
end

wire fifo_aclr;
wire [23:0] fifo_data;
wire fifo_wrreq;
wire fifo_wrfull;
wire [7:0] fifo_wrusedw;
wire fifo_wr_almost_full;
wire [23:0] fifo_q;
wire fifo_rdreq;
wire fifo_rdempty;
wire [7:0] fifo_rdusedw;
wire fifo_rd_almost_empty;
scanout_fifo scanout_fifo0 (
    .aclr(fifo_aclr),

    .wrclk(sram_clk),
    .data(fifo_data),
    .wrreq(fifo_wrreq),
    .wrfull(fifo_wrfull),
    .wrusedw(fifo_wrusedw),

    .rdclk(display_clk),
    .q(fifo_q),
    .rdreq(fifo_rdreq),
    .rdempty(fifo_rdempty),
    .rdusedw(fifo_rdusedw));
assign fifo_wr_almost_full = fifo_wrusedw >= 192;
assign fifo_rd_almost_empty = fifo_rdusedw < 64;


scanout scanout0 (
    .clk(display_clk),

    .reset_writer(fifo_aclr),

    .fifo_rdreq(fifo_rdreq),
    .fifo_q(fifo_q),
    .fifo_rdempty(fifo_rd_almost_empty),

    .ltm_r(LTM_R),
    .ltm_g(LTM_G),
    .ltm_b(LTM_B),
    .ltm_den(LTM_DEN),
    .ltm_hd(LTM_HD),
    .ltm_vd(LTM_VD));

assign SRAM_LB_N = 0;
assign SRAM_UB_N = 0;

assign LTM_NCLK = display_clk;
assign LTM_GREST = 1;

assign LEDR = 18'b0;

endmodule
