module sram_scanout(
    clk,
    sreset,

    fifo_data,
    fifo_wrreq,
    fifo_wrfull,

    sram_addr,
    sram_dq,
    sram_oe_n,
    sram_we_n,
    sram_ce_n);

input clk;
input sreset;

output reg [23:0] fifo_data;
output reg fifo_wrreq;
input fifo_wrfull;

output reg [19:0] sram_addr;
inout reg [15:0] sram_dq;
output sram_oe_n;
output sram_we_n;
output sram_ce_n;

localparam [2:0] CTRL_IDLE = 3'b111;
localparam [2:0] CTRL_READ = 3'b010;
localparam [2:0] CTRL_WRITE = 3'b100;

reg [2:0] sram_ctrl;

reg [3:0] post_reset_wait;
reg past_the_end;
reg [9:0] x;
reg [8:0] y;

always_ff @(posedge clk) begin
    sram_addr <= 20'd0;
    sram_dq <= 16'bz;
    sram_ctrl <= CTRL_IDLE;

    if (sreset) begin
        // Don't do anything until reset ends.
        fifo_data <= 24'bx;
        fifo_wrreq <= 0;
        post_reset_wait <= 4'd15;
        past_the_end <= 0;
        x <= 10'd0;
        y <= 9'd0;
    end else if (post_reset_wait != 0) begin
        fifo_data <= 24'bx;
        fifo_wrreq <= 0;
        post_reset_wait <= post_reset_wait - 4'd15;
    end else if (fifo_wrfull) begin
        // The FIFO is (or might be) full. Stall.
        fifo_data <= 24'bx;
        fifo_wrreq <= 0;
    end else if (!past_the_end) begin
        // FIFO has capacity. Submit a pixel.
        // 24'b11111111_10000000_01000000
        fifo_data <= {x[9:8], x[9:8], x[9:8], x[9:8], y[7:0], x[7:0]};
        // fifo_data <=
        // 	(x == 0 ? 24'h0000ff : 24'h000000)
        // 	| (y == 0 ? 24'h00ff00 : 24'h000000)
        // 	| (x == 799 || y == 479 ? 24'hff0000 : 24'h000000);
        fifo_wrreq <= 1;
        if (x != 799) begin
            x <= x + 10'd1;
        end else begin
            x <= 10'd0;
            if (y != 479) begin
                y <= y + 9'd1;
            end else begin
                past_the_end <= 1;
                x <= 10'bx;
                y <= 9'bx;
            end
        end
    end else begin
        fifo_data <= 24'dx;
        fifo_wrreq <= 1;
        x <= 10'bx;
        y <= 9'bx;
    end
end

assign sram_oe_n = sram_ctrl[2];
assign sram_we_n = sram_ctrl[1];
assign sram_ce_n = sram_ctrl[0];

endmodule
