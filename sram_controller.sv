module sram_controller(
    input clk,
    input reset_n,

    // Avalon-MM target
    input  [19:0] mm_address,
    input         mm_read,
    output [15:0] mm_readdata,
    input         mm_write,
    input  [15:0] mm_writedata,

    // SRAM interface
    output logic [19:0] sram_addr,
    inout        [15:0] sram_dq,
    output              sram_oe_n,
    output              sram_we_n,
    output              sram_ce_n
);

    typedef enum logic [2:0] {
        //            +--- oe_n
        //            |+-- we_n
        //            ||+- ce_n
        //            |||
        SC_IDLE  = 3'b111,
        SC_READ  = 3'b010,
        SC_WRITE = 3'b100
    } SRAMControl;

    typedef enum logic [1:0] {
        ST_INIT,
        ST_READ_WAIT,
        ST_READ_OUTPUT,
        ST_WRITE
    } State;

    SRAMControl        sram_control;
    State              state;
    logic       [15:0] dq_value;
    logic              dq_assert;

    always_ff @(posedge clk) begin
        dq_value <= 16'hx;
        dq_assert <= 0;
        if (!reset_n) begin
            sram_addr <= 16'hx;
            sram_control <= SC_IDLE;
            state <= ST_INIT;
        end else begin
            case (state)
                ST_INIT,
                ST_WRITE: begin
                    if (mm_read) begin
                        sram_addr <= mm_address;
                        sram_control <= SC_READ;
                        state <= ST_READ_WAIT;
                    end else if (mm_write) begin
                        sram_addr <= mm_address;
                        dq_value <= mm_writedata;
                        dq_assert <= 1;
                        sram_control <= SC_WRITE;
                        state <= ST_WRITE;
                    end else begin
                        sram_addr <= 16'hx;
                        sram_control <= SC_IDLE;
                        state <= ST_INIT;
                    end
                end
                ST_READ_WAIT: begin
                    // hold sram_addr
                    sram_control <= SC_READ;
                    state <= ST_READ_OUTPUT;
                end
                ST_READ_OUTPUT: begin
                    // The read signal is guaranteed to be asserted after an Avalon-MM transfer that
                    // was delayed by the agent. There must be a recovery cycle before the read
                    // signal can be sampled again.
                    sram_control <= SC_IDLE;
                    state <= ST_INIT;
                end
            endcase
        end
    end

    assign mm_readdata = state == ST_READ_OUTPUT ? sram_dq : 16'hx;

    assign sram_dq = dq_assert ? dq_value : 'z;
    assign sram_oe_n = sram_control[2];
    assign sram_we_n = sram_control[1];
    assign sram_ce_n = sram_control[0];

endmodule
