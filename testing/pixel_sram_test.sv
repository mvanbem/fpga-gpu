`timescale 1ns/100ps

module pixel_sram_test;

    logic clk;
    logic reset_n;

    logic [19:0] sram_addr;
    wire  [15:0] sram_dq;
    logic        sram_oe_n;
    logic        sram_we_n;
    logic        sram_ce_n;

    logic next_frame;

    logic [23:0] last_value;
    logic  [7:0] num_values;
    logic        stall;

    pixel_sram_platform u0(
        .clk_clk(clk),
        .reset_reset_n(reset_n),

        .sram_controller_sram_addr_new_signal(sram_addr),
        .sram_controller_sram_dq_new_signal(sram_dq),
        .sram_controller_sram_oe_n_new_signal(sram_oe_n),
        .sram_controller_sram_ce_n_new_signal(sram_ce_n),
        .sram_controller_sram_we_n_new_signal(sram_we_n),

        .pixel_reader_next_frame_next_frame(next_frame),

        .fake_sink_last_value_new_signal(last_value),
        .fake_sink_num_values_new_signal(num_values),
        .fake_sink_stall_new_signal(stall)
    );

    fake_sram u1(
        .addr(sram_addr),
        .dq(sram_dq),
        .ce_n(sram_ce_n),
        .oe_n(sram_oe_n),
        .we_n(sram_we_n)
    );

    initial begin
           clk = 0; reset_n = 0; stall = 0; next_frame = 1;
        #5 clk = 1;
        #5 clk = 0; reset_n = 1;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0; next_frame = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 clk = 1;
    end

endmodule
