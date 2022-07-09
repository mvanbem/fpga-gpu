module pixel_generator(
    in_clk,
    in_reset_n,

    in_next_frame,

    out_pixel_data,
    out_pixel_valid,
    out_pixel_ready);

input in_clk;
input in_reset_n;

input in_next_frame;

output reg [23:0] out_pixel_data;
output reg out_pixel_valid;
input out_pixel_ready;

typedef enum reg [1:0] {ST_RUNNING, ST_PAST_END} State;

State state;
reg [9:0] x;
reg [8:0] y;

always_ff @(posedge in_clk) begin
    out_pixel_data <= 24'bx;
    out_pixel_valid <= 0;

    if (!in_reset_n || in_next_frame) begin
        state <= ST_RUNNING;
        x <= 10'd0;
        y <= 9'd0;
    end else if (state == ST_RUNNING && out_pixel_ready) begin
        // Prepare the next pixel.
        out_pixel_data <= {
            x[9:8], x[9:8], x[9:8], x[9:8],
            y[7:0],
            x[7:0]};
        out_pixel_valid <= 1;
        if (x != 799) begin
            state <= ST_RUNNING;
            x <= x + 10'd1;
        end else begin
            x <= 10'd0;
            if (y != 479) begin
                state <= ST_RUNNING;
                y <= y + 9'd1;
            end else begin
                state <= ST_PAST_END;
                x <= 10'bx;
                y <= 9'bx;
            end
        end
    end
end

endmodule
