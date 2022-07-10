`timescale 1ns/100ps

module fake_sink_test;

logic       clk;
logic       reset_n;
logic [7:0] data;
logic       valid;
logic       ready;
logic       stall;
logic [7:0] last_value;
logic [3:0] num_values;

fake_sink #(
    .DATA_WIDTH(8),
    .COUNTER_WIDTH(4)
) u0 (
    .clk,
    .reset_n,

    .data,
    .valid,
    .ready,

    .stall,
    .last_value,
    .num_values
);

initial begin
       clk = 0; reset_n = 0; data = 'hxx; valid = 0; stall = 0;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; data = 'hxx; valid = 0; stall = 0;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; data = 'h12; valid = 1; stall = 0;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; data = 'h34; valid = 1; stall = 0;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; data = 'h56; valid = 1; stall = 0;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; data = 'h78; valid = 1; stall = 1;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; data = 'h78; valid = 1; stall = 1;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; data = 'h78; valid = 1; stall = 0;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; data = 'hxx; valid = 0; stall = 0;
    #5 clk = 1;
    #5 clk = 0; reset_n = 1; data = 'hxx; valid = 0; stall = 0;
    #5 clk = 1;
end

endmodule
