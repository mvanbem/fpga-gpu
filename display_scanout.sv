module display_scanout(
    input in_clk,
    input in_reset_n,

    // Avalon-ST Sink
    input        [23:0] in_pixel_data,
    input               in_pixel_valid,
    output logic        in_pixel_ready,

    // Frame advance signal coupled with the pixel_reader module
    output logic out_next_frame,

    // LCD interface
    output logic [7:0] ltm_r,
    output logic [7:0] ltm_g,
    output logic [7:0] ltm_b,
    output logic       ltm_den,
    output logic       ltm_hd,
    output logic       ltm_vd
);

    typedef enum logic {PS_BLANK, PS_PASSTHROUGH} PixelState;

    // Registers
    logic      [10:0] scanout_x;
    logic      [9:0]  scanout_y;
    PixelState        pixel_state;

    // Frame structure
    //
    // Horizontal
    // - 1056 clocks total
    // - 800 display clocks (@0)
    // - 40 front porch clocks (@800)
    // - HSYNC pulse (@840)
    //
    // Vertical
    // - 525 lines total
    // - 480 display lines (@0)
    // - 10 front porch lines (@480)
    // - VSYNC pulse (@490)

    always_ff @(posedge in_clk) begin
        if (!in_reset_n) begin
            in_pixel_ready <= 0;
            out_next_frame <= 0;
            ltm_den <= 0;
            ltm_hd <= 1;
            ltm_vd <= 1;
            scanout_x <= 11'd0;
            scanout_y <= 10'd480;
            pixel_state <= PS_BLANK;
        end else begin
            // Generate next-frame signals.
            out_next_frame <= scanout_y == 480;

            // Generate the pixel data control state and operate the pixel streaming interface.
            if (scanout_x < 800 && scanout_y < 480) begin
                in_pixel_ready <= 1;
                pixel_state <= PS_PASSTHROUGH;
            end else if (scanout_y == 480) begin
                // Drain the FIFO.
                in_pixel_ready <= 1;
                pixel_state <= PS_BLANK;
            end else begin
                in_pixel_ready <= 0;
                pixel_state <= PS_BLANK;
            end

            // Generate control signals.
            ltm_den <= scanout_x < 800 && scanout_y < 480;
            ltm_hd <= scanout_x != 840;
            ltm_vd <= scanout_y != 490;

            // Produce next scanout position.
            if (scanout_x != 1055) begin
                scanout_x <= scanout_x + 11'd1;
                scanout_y <= scanout_y;
            end else begin
                scanout_x <= 0;
                if (scanout_y != 524) begin
                    scanout_y <= scanout_y + 10'd1;
                end else begin
                    scanout_y <= 0;
                end
            end
        end
    end

    always_comb begin
        case (pixel_state)
            PS_BLANK: begin
                ltm_r = 8'd0;
                ltm_g = 8'd0;
                ltm_b = 8'd0;
            end
            PS_PASSTHROUGH: begin
                if (in_pixel_valid) begin
                    ltm_r = in_pixel_data[7:0];
                    ltm_g = in_pixel_data[15:8];
                    ltm_b = in_pixel_data[23:16];
                end else begin
                    ltm_r = 8'd255;
                    ltm_g = 8'd0;
                    ltm_b = 8'd255;
                end
            end
        endcase
    end

endmodule
