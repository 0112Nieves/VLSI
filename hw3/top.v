module top (
    input clk,
    input write_en,
    input [8:0] write_adr,
    input [31:0] write_data,
    input [8:0] read_adr,
    output [31:0] read_data
);

    dual_port_ram_bram ram_inst (
        .clock(clk),
        .data(write_data),
        .rdaddress(read_adr),
        .wraddress(write_adr),
        .wren(write_en),
        .q(read_data)
    );

endmodule
