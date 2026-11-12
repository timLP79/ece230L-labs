module incrementer(
    input [2:0] A,
    output [2:0] Y
);

    wire carry1, carry2;

    full_adder bit0(
        .A(A[0]),
        .B(1'b0),
        .Cin(1'b1),
        .Y(Y[0]),
        .Cout(carry1)
    );

    full_adder bit1(
        .A(A[1]),
        .B(1'b0),
        .Cin(carry1),
        .Y(Y[1]),
        .Cout(carry2)
    );

    full_adder bit2(
        .A(A[2]),
        .B(1'b0),
        .Cin(carry2),
        .Y(Y[2]),
        .Cout()
    );

endmodule
