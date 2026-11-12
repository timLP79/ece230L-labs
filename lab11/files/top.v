module top(
    input btnC, btnU,
    output [15:0] led
);

    ripple_counter part1(
        .clk(btnC),
        .rst(btnU),
        .Q(led[2:0])
    );

    assign led[15:3] = 13'b0;

endmodule
