`timescale 1ns/100ps

module sram_controller_test;

    logic clk;
    logic reset_n;

    logic [19:0] mm_address;
    logic        mm_read;
    logic [15:0] mm_readdata;
    logic        mm_write;
    logic [15:0] mm_writedata;

    logic [19:0] sram_addr;
    wire  [15:0] sram_dq;
    logic        sram_oe_n;
    logic        sram_we_n;
    logic        sram_ce_n;

    sram_controller u0(
        .clk,
        .reset_n,

        .mm_address,
        .mm_read,
        .mm_readdata,
        .mm_write,
        .mm_writedata,

        .sram_addr,
        .sram_dq,
        .sram_oe_n,
        .sram_we_n,
        .sram_ce_n
    );

    fake_sram u1(
        .addr(sram_addr),
        .dq(sram_dq),
        .ce_n(sram_ce_n),
        .oe_n(sram_oe_n),
        .we_n(sram_we_n)
    );

    initial begin
           clk = 0; reset_n = 0; mm_read = 0; mm_write = 0;
        #5 clk = 1;
        #5 clk = 0; reset_n = 1;
        #5 clk = 1;
        #5 clk = 0; mm_address = 20'h01234; mm_read = 0; mm_write = 1; mm_writedata = 16'haaaa;
        #5 clk = 1;
        #5 clk = 0; mm_address = 20'h01235; mm_read = 0; mm_write = 1; mm_writedata = 16'h5555;
        #5 clk = 1;
        #5 clk = 0; mm_address = 20'h01234; mm_read = 1; mm_write = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0; mm_address = 20'h01235; mm_read = 1; mm_write = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0; mm_address = 20'hxxxxx; mm_read = 0; mm_write = 0;
        #5 clk = 1;
    end

endmodule
