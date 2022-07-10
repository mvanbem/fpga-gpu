`timescale 1ns/100ps

module pixel_reader_test;

    logic clk;
    logic reset_n;

    logic [19:0] mm_address;
    logic        mm_read;
    logic [15:0] mm_readdata;
    logic        mm_waitrequest;

    logic [23:0] st_pixel_data;
    logic        st_pixel_valid;
    logic        st_pixel_ready;

    logic        stall;
    logic [23:0] last_value;
    logic [7:0]  num_values;

    pixel_reader u0(
        .clk,
        .reset_n,

        .next_frame('0),

        .mm_address,
        .mm_read,
        .mm_readdata,
        .mm_waitrequest,

        .st_pixel_data,
        .st_pixel_valid,
        .st_pixel_ready
    );

    fake_sink #(
        .DATA_WIDTH(24)
    ) u1(
        .clk,
        .reset_n,

        .data(st_pixel_data),
        .valid(st_pixel_valid),
        .ready(st_pixel_ready),

        .stall,
        .last_value,
        .num_values
    );

    initial begin
           clk = 0; reset_n = 0; mm_readdata = 16'hxxxx; mm_waitrequest = 1; stall = 0;
        #5 clk = 1;
        #5 clk = 0; reset_n = 1;
        #5 clk = 1;
        #5 clk = 0; mm_readdata = 16'hxxxx; mm_waitrequest = 1; stall = 0;
        #5 clk = 1;
        #5 clk = 0; mm_readdata = 16'hxxxx; mm_waitrequest = 1; stall = 0;
        #5 clk = 1;
        #5 clk = 0; mm_readdata = 16'h001f; mm_waitrequest = 0; stall = 0;
        #5 clk = 1;
        #5 clk = 0; mm_readdata = 16'hxxxx; mm_waitrequest = 1; stall = 1;
        #5 clk = 1;
        #5 clk = 0; mm_readdata = 16'hxxxx; mm_waitrequest = 1; stall = 0;
        #5 clk = 1;
        #5 clk = 0; mm_readdata = 16'h07e0; mm_waitrequest = 0; stall = 0;
        #5 clk = 1;
        #5 clk = 0; mm_readdata = 16'hxxxx; mm_waitrequest = 1; stall = 0;
        #5 clk = 1;
        #5 clk = 0; mm_readdata = 16'hf800; mm_waitrequest = 0; stall = 0;
        #5 clk = 1;
        #5 clk = 0; mm_readdata = 16'hxxxx; mm_waitrequest = 1; stall = 0;
        #5 clk = 1;
        #5 clk = 0; mm_readdata = 16'hxxxx; mm_waitrequest = 1; stall = 0;
        #5 clk = 1;
        #5 clk = 0; mm_readdata = 16'hxxxx; mm_waitrequest = 1; stall = 0;
        #5 clk = 1;
    end

endmodule
