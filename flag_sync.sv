module flag_sync(
    input        clk_in,
    input        in_flag,
    input        clk_out,
    output logic out_flag
);

    logic in_flag_q;

    always_ff @(posedge clk_out) begin
        in_flag_q <= in_flag;
        out_flag <= in_flag_q;
    end

endmodule
