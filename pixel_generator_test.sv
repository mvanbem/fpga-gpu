`timescale 1ns/100ps

module pixel_generator_test;

reg clk;
reg reset_n;
wire [23:0] pixel_data;
wire pixel_valid;
reg pixel_ready;

pixel_generator u0(
    .in_clk(clk),
    .in_reset_n(reset_n),

    .in_next_frame(1'b0),

    .out_pixel_data(pixel_data),
    .out_pixel_valid(pixel_valid),
    .out_pixel_ready(pixel_ready));

initial begin
       clk = 0; reset_n = 0; pixel_ready = 0;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; pixel_ready = 0;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; pixel_ready = 0;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; pixel_ready = 1;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; pixel_ready = 0;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; pixel_ready = 0;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; pixel_ready = 1;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; pixel_ready = 1;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; pixel_ready = 0;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; pixel_ready = 0;
    #5 clk = 1;
end

endmodule
