module fake_sram(
    input [19:0] addr,
    inout [15:0] dq,
    input        ce_n,
    input        oe_n,
    input        we_n
);

    logic [15:0] mem[0:15];

    assign dq = (!ce_n && !oe_n && we_n) ? mem[addr[3:0]] : 'z;

    always_comb begin
        for (int i = 0; i < 16; ++i) begin
            if (!ce_n && !we_n && addr[3:0] == i) begin
                mem[i] = dq;
            end
        end
    end

endmodule
