module top(

input [9:0] sw,
output [13:0] led
);

half_sub half_subtractor(
 .A(sw[0]),
 .B(sw[1]),
 .Y(led[0]),
 .Borrow(led[1])
);
ones_compliment ones_compliment(
 .A(sw[5:2]),
 .B(sw[9:6]),
 .Y(led[5:2])
);

twos_compliment twos_compliment(
 .A(sw[9:2]),
 .B(led[13:6])
);

endmodule
