module pixel_writer(
    input clk,
    input reset_n,

    // Avalon-MM controller
    output logic [19:0] mm_address,
    output logic        mm_write,
    output logic [15:0] mm_writedata,
    input               mm_waitrequest
);

    reg [9:0]  x;
    reg [8:0]  y;
    reg [15:0] offset;
    reg        writing;

    always_ff @(posedge clk) begin
        if (!reset_n) begin
            mm_address <= 20'hx;
            mm_write <= 0;
            mm_writedata <= 16'hx;
            x <= 10'd0;
            y <= 9'd0;
            offset <= 16'd0;
            writing <= 0;
        end else begin
            // Send a new write command either in the first cycle after init (when not writing) or
            // when we have been writing and waitrequest is not asserted (the write completed).
            if (!writing || !mm_waitrequest) begin
                mm_address <= {1'b0, y, x};
                mm_write <= 1;
                mm_writedata <= {
                    y[4:0],
                    y[5], x[9:5],
                    x[4:0]
                } + offset;
                writing <= 1;
                if (y != 10'd799) begin
                    x <= x + 10'd1;
                end else begin
                    x <= 10'd0;
                    if (y != 9'd479) begin
                        y <= y + 9'd1;
                    end else begin
                        y <= 9'd0;
                        // offset <= offset + 16'd1;
                    end
                end
            end
        end
    end

endmodule
