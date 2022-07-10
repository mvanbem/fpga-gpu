`timescale 1ns/100ps

module pixel_writer_test;

    logic        clk;
    logic        reset_n;
    logic [19:0] mm_address;
    logic        mm_write;
    logic [15:0] mm_writedata;
    logic        mm_waitrequest;

    pixel_writer u0(
        .clk,
        .reset_n,

        .mm_address,
        .mm_write,
        .mm_writedata,
        .mm_waitrequest
    );

    initial begin
           clk = 0; reset_n = 0; mm_waitrequest = 0;
        #5 clk = 1;
        #5 clk = 0; reset_n = 1;
        #5 clk = 1;
        #5 clk = 0; mm_waitrequest = 0;
        #5 clk = 1;
        #5 clk = 0; mm_waitrequest = 0;
        #5 clk = 1;
        #5 clk = 0; mm_waitrequest = 1;
        #5 clk = 1;
        #5 clk = 0; mm_waitrequest = 1;
        #5 clk = 1;
        #5 clk = 0; mm_waitrequest = 1;
        #5 clk = 1;
        #5 clk = 0; mm_waitrequest = 0;
        #5 clk = 1;
        #5 clk = 0; mm_waitrequest = 0;
        #5 clk = 1;
        #5 clk = 0; mm_waitrequest = 0;
        #5 clk = 1;
        #5 clk = 0; mm_waitrequest = 0;
        #5 clk = 1;
    end

endmodule
