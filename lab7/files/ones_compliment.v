module ones_compliment(
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] Y
);

wire [3:0] s1;
wire [3:0] c1;
wire [3:0] c2;

generate
full_adder fa0(
    .A(A[0]),
    .B(B[0]),
    .Cin(1'b0),
    .Y(s1[0]),
    .Cout(c1[0])
);

full_adder fa1(
    .A(A[1]),
    .B(B[1]),
    .Cin(c1[0]),
    .Y(s1[1]),
    .Cout(c1[1])
);

full_adder fa2(
    .A(A[2]),
    .B(B[2]),
    .Cin(c1[1]),
    .Y(s1[2]),
    .Cout(c1[2])
);

full_adder fa3(
    .A(A[3]),
    .B(B[3]),
    .Cin(c1[2]),
    .Y(s1[3]),
    .Cout(c1[3])
);

full_adder fb0(
    .A(s1[0]),
    .B(1'b0),
    .Cin(c1[3]),
    .Y(Y[0]),
    .Cout(c2[0])
);

full_adder fb1(
    .A(s1[1]),
    .B(1'b0),
    .Cin(c2[0]),
    .Y(Y[1]),
    .Cout(c2[1])
);

full_adder fb2(
    .A(s1[2]),
    .B(1'b0),
    .Cin(c2[1]),
    .Y(Y[2]),
    .Cout(c2[2])
);

full_adder fb3(
    .A(s1[3]),
    .B(1'b0),
    .Cin(c2[2]),
    .Y(Y[3]),
    .Cout(c2[3])
);

endgenerate
endmodule
