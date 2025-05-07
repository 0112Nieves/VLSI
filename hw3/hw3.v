// RAM with 512 x 32 configuration using LEs (behavioral model)
module dual_port_ram_LE (
    input wire clk,
    input wire write_en,
    input wire [8:0] write_addr,
    input wire [31:0] write_data,
    input wire [8:0] read_addr,
    output reg [31:0] read_data
);

    // RAM storage: 512 x 32
    reg [31:0] ram [0:511];

    // Write operation
    always @(posedge clk) begin
        if (write_en)
            ram[write_addr] <= write_data;
    end

    // Read operation
    always @(posedge clk) begin
        read_data <= ram[read_addr];
    end

endmodule
