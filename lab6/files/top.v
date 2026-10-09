module top(
    input [7:0] sw,
    output [5:0] led
);

light stairway (
    .downstairs(sw[0]),
    .upstairs(sw[1]),
    .stair_light(led[0])
);

adder one_bit_adder (
    .A(sw[2]),
    .B(sw[3]),
    .Y(led[1]),
    .Carry(led[2])
);

wire carry_between_bits;

full_adder low_bit(
    .A(sw[4]),
    .B(sw[6]),
    .Cin(1'b0),
    .Y(led[3]),
    .Cout(carry_between_bits)
);

full_adder high_bit(
    .A(sw[5]),
    .B(sw[7]),
    .Cin(carry_between_bits),
    .Y(led[4]),
    .Cout(led[5])
);

endmodule
