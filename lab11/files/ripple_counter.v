module ripple_counter(
    input clk, rst,
    output [2:0] Q
);

    t_flip_flop stage1(
        .T(1'b1),
        .clk(clk),
        .rst(rst),
        .Q(Q[0]),
        .NotQ()
    );

    t_flip_flop stage2(
        .T(1'b1),
        .clk(Q[0]),
        .rst(rst),
        .Q(Q[1]),
        .NotQ()
    );

    t_flip_flop stage3(
        .T(1'b1),
        .clk(Q[1]),
        .rst(rst),
        .Q(Q[2]),
        .NotQ()
    );

endmodule
