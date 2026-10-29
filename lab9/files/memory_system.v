module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output reg [7:0] memory
);

    reg [7:0] byte_data [3:0];
    reg [3:0] byte_enable;
    wire [7:0] byte_output [3:0];

    always @(*) begin
        case (addr)
            2'b00: begin
                {byte_data[3], byte_data[2],
                 byte_data[1], byte_data[0]}
                    <= {8'b0, 8'b0, 8'b0, data};
                byte_enable <= {3'b0, store};
            end

            2'b01: begin
                {byte_data[3], byte_data[2],
                 byte_data[1], byte_data[0]}
                    <= {8'b0, 8'b0, data, 8'b0};
                byte_enable <= {2'b0, store, 1'b0};
            end

            2'b10: begin
                {byte_data[3], byte_data[2],
                 byte_data[1], byte_data[0]}
                    <= {8'b0, data, 8'b0, 8'b0};
                byte_enable <= {1'b0, store, 2'b0};
            end

            2'b11: begin
                {byte_data[3], byte_data[2],
                 byte_data[1], byte_data[0]}
                    <= {data, 8'b0, 8'b0, 8'b0};
                byte_enable <= {store, 3'b0};
            end

            default: begin
                {byte_data[3], byte_data[2],
                 byte_data[1], byte_data[0]} <= 32'b0;
                byte_enable <= 4'b0;
            end
        endcase
    end

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : bytes
            byte_latch byte_inst(
                .D(byte_data[i]),
                .E(byte_enable[i]),
                .Q(byte_output[i])
            );
        end
    endgenerate

    always @(*) begin
        case (addr)
            2'b00: memory <= byte_output[0];
            2'b01: memory <= byte_output[1];
            2'b10: memory <= byte_output[2];
            2'b11: memory <= byte_output[3];
            default: memory <= 8'bx;
        endcase
    end

endmodule
