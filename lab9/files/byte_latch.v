module byte_latch(
    input [7:0] D,
    input E,
    output [7:0] Q
);

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : bits
            d_latch latch_inst(
                .D(D[i]),
                .E(E),
                .Q(Q[i]),
                .NotQ()
            );
        end
    endgenerate

endmodule
