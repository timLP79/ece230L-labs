module t_flip_flop(
    input T, clk, rst,
    output Q,
    output NotQ
);

    jk_flip_flop jkff(
        .J(T),
        .K(T),
        .clk(clk),
        .rst(rst),
        .Q(Q),
        .NotQ(NotQ)
    );

endmodule
