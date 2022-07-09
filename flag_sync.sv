module flag_sync(
    in_clk,
    in_flag,
    out_clk,
    out_flag);

input in_clk;
input in_flag;
input out_clk;
output reg out_flag;

reg sync;

always_ff @(posedge out_clk) begin
    sync <= in_flag;
    out_flag <= sync;
end

endmodule
