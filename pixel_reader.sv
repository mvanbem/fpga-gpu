module pixel_reader(
    input clk,
    input reset_n,

    // Frame advance signal coupled with the display_scanout module
    input next_frame,

    // Avalon-MM controller
    output logic [19:0] mm_address,
    output logic        mm_read,
    input        [15:0] mm_readdata,
    input               mm_waitrequest,

    // Avalon-ST source
    output logic [23:0] st_pixel_data,
    output logic        st_pixel_valid,
    input               st_pixel_ready
);

    typedef enum logic [1:0] {ST_INIT, ST_READ, ST_WRITE, ST_PAST_END} State;

    State        state;
    logic [9:0]  x;
    logic [8:0]  y;
    logic [15:0] registered_mm_readdata;

    always_ff @(posedge clk) begin
        mm_address <= 20'bx;
        mm_read <= 0;
        st_pixel_data <= 24'bx;
        st_pixel_valid <= 0;

        if (!reset_n || next_frame) begin
            state <= ST_INIT;
            x <= 10'd0;
            y <= 9'd0;
        end else if (state == ST_INIT || (state == ST_WRITE && st_pixel_ready)) begin
            // Issue an MM read.
            mm_address <= {1'd0, y, x};
            mm_read <= 1;
            state <= ST_READ;
            // Advance the pixel location for the next transaction.
            if (x != 799) begin
                x <= x + 10'd1;
            end else begin
                x <= 10'd0;
                if (y != 479) begin
                    y <= y + 9'd1;
                end else begin
                    state <= ST_PAST_END;
                    x <= 10'bx;
                    y <= 9'bx;
                end
            end
        end else if (state == ST_READ) begin
            if (!mm_waitrequest) begin
                // MM read acknowledged. Pass the data to the FIFO and start a FIFO write.
                // Repack RGB565 to RGB888.
                st_pixel_data <= rgb565_to_rgb888(mm_readdata);
                registered_mm_readdata <= mm_readdata;
                st_pixel_valid <= 1;
                state <= ST_WRITE;
            end else begin
                // Maintain the MM read until acknowledged.
                mm_address <= mm_address;
                mm_read <= 1;
            end
        end else if (state == ST_WRITE) begin
            // Maintain the FIFO write until acknowledged. Acknowledgement is handled in the ST_INIT
            // case above.
            st_pixel_data <= rgb565_to_rgb888(registered_mm_readdata);
            st_pixel_valid <= 1;
        end
    end

    function automatic logic [23:0] rgb565_to_rgb888(logic [15:0] rgb565);
        logic [4:0] r = rgb565[4:0];
        logic [5:0] g = rgb565[10:5];
        logic [4:0] b = rgb565[15:11];
        return {r, r[4:2], g, g[5:4], b, b[4:2]};
    endfunction

endmodule
