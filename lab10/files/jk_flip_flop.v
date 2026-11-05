module jk_flip_flop(
    input J, K, clk,
    output Q,
    output NotQ
);

    wire D;

    assign D = (J & ~Q) | (~K & Q);

    d_flip_flop dff(
        .D(D),
        .clk(clk),
        .Q(Q),
        .NotQ(NotQ)
    );

endmodule
