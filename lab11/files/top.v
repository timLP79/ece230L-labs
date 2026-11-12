module top(
    input btnC, btnU,
    output [15:0] led
);

    ripple_counter part1(
        .clk(btnC),
        .rst(btnU),
        .Q(led[2:0])
    );

    modulo_counter part2(
        .clk(btnC),
        .rst(btnU),
        .count(led[5:3]),
        .divided_clk(led[6])
    );

    assign led[15:7] = 9'b0;

endmodule
