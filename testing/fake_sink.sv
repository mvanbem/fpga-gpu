module fake_sink #(
    parameter DATA_WIDTH = 8,
    parameter COUNTER_WIDTH = 8
) (
    input clk,
    input reset_n,

    input        [DATA_WIDTH-1:0] data,
    input                         valid,
    output logic                  ready,

    input                            stall,
    output logic [DATA_WIDTH-1:0]    last_value,
    output logic [COUNTER_WIDTH-1:0] num_values
);

    always_ff @(posedge clk) begin
        if (!reset_n) begin
            last_value <= 'x;
            num_values <= '0;
        end else if (valid && !stall) begin
            last_value <= data;
            num_values <= num_values + COUNTER_WIDTH'(1);
        end
    end

    always_comb begin
        ready = !stall;
    end

endmodule
