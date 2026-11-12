module modulo_counter(
    input clk, rst,
    output [2:0] count,
    output divided_clk
);

    wire [2:0] incremented;
    wire [2:0] next_count;
    wire at_limit;
    wire next_output;

    incrementer add_one(
        .A(count),
        .Y(incremented)
    );

    assign at_limit = (count == 3'd5);
    assign next_count = at_limit ? 3'b000 : incremented;
    assign next_output = at_limit ? ~divided_clk : divided_clk;

    genvar i;
    generate
        for (i = 0; i < 3; i = i + 1) begin : counter_bits
            d_flip_flop count_ff(
                .D(next_count[i]),
                .clk(clk),
                .rst(rst),
                .Q(count[i]),
                .NotQ()
            );
        end
    endgenerate

    d_flip_flop output_ff(
        .D(next_output),
        .clk(clk),
        .rst(rst),
        .Q(divided_clk),
        .NotQ()
    );

endmodule
