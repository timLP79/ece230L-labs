module top(
    input [15:0] sw,
    input btnC,
    output [15:0] led
);

    d_flip_flop part1(
        .D(sw[0]),
        .clk(btnC),
        .Q(led[0]),
        .NotQ(led[1])
    );

     jk_flip_flop part2(
         .J(sw[1]),
         .K(sw[2]),
         .clk(btnC),
         .Q(led[2]),
         .NotQ(led[3])
     );

     t_flip_flop part3(
         .T(sw[3]),
         .clk(btnC),
         .Q(led[4]),
         .NotQ(led[5])
     );

     assign led[15:6] = 10'b0;

endmodule
