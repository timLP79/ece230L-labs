module t_flip_flop(
    input T, clk,
    output Q,
    output NotQ
);

    jk_flip_flop jkff(
        .J(T),
        .K(T),
        .clk(clk),
        .Q(Q),
        .NotQ(NotQ)
    );

endmodule
