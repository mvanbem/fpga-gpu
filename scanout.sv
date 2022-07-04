module scanout (
    clk,

    reset_writer,

    fifo_rdreq,
    fifo_q,
    fifo_rdempty,

    ltm_r,
    ltm_g,
    ltm_b,
    ltm_den,
    ltm_hd,
    ltm_vd);

input clk;

output reg reset_writer;

output reg fifo_rdreq;
input [23:0] fifo_q;
input fifo_rdempty;

output reg [7:0] ltm_r;
output reg [7:0] ltm_g;
output reg [7:0] ltm_b;
output reg ltm_den;
output reg ltm_hd;
output reg ltm_vd;

typedef enum reg [1:0] {
    RS_NO_DISPLAY,
    RS_READ_FIFO,
    RS_FAULT
} ReadState;

// Registers
reg [10:0] scanout_x;
reg [9:0] scanout_y;
ReadState read_state;

// Combinational logic
wire [10:0] next_scanout_x;
wire [9:0] next_scanout_y;

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
// - 10 front porch clocks (@480)
// - VSYNC pulse (@490)

always_comb begin
    // Produce next scanout position.
    if (scanout_x != 1055) begin
        next_scanout_x = scanout_x + 11'd1;
        next_scanout_y = scanout_y;
    end else begin
        next_scanout_x = 0;
        if (scanout_y != 524) begin
            next_scanout_y = scanout_y + 10'd1;
        end else begin
            next_scanout_y = 0;
        end
    end
end

always_ff @(posedge clk)
begin
    scanout_x <= next_scanout_x;
    scanout_y <= next_scanout_y;

    // Look ahead and query the FIFO.
    if (next_scanout_x < 800 && next_scanout_y < 480) begin
        fifo_rdreq <= !fifo_rdempty;
        read_state <= fifo_rdempty ? RS_FAULT : RS_READ_FIFO;
    end else begin
        fifo_rdreq <= 0;
        read_state <= RS_NO_DISPLAY;
    end

    // Generate control signals.
    ltm_den <= scanout_x < 800 && scanout_y < 480;
    ltm_hd <= scanout_x != 840;
    ltm_vd <= scanout_y != 490;
    reset_writer <= scanout_y == 480;
end

// Generate RGB data.
always_comb begin
    case (read_state)
    RS_NO_DISPLAY: begin
        ltm_r = 8'd0;
        ltm_g = 8'd0;
        ltm_b = 8'd0;
    end
    RS_READ_FIFO: begin
        ltm_r = fifo_q[7:0];
        ltm_g = fifo_q[15:8];
        ltm_b = fifo_q[23:16];
    end
    RS_FAULT: begin
        ltm_r = 8'd255;
        ltm_g = 8'd0;
        ltm_b = 8'd255;
    end
    endcase
end

endmodule
