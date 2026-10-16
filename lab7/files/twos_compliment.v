module twos_compliment(
    input [7:0] A,
    output [7:0] B
);

wire [7:0] Carry;

genvar i;

generate 

full_adder lsb(
    .A(~A[0]),
    .B(1'b1),
    .Y(B[0]),
    .Cin(1'b0),
    .Cout(Carry[0])
);

for (i = 1; i < 8; i = i + 1)

begin

    full_adder add(
	.A(~A[i]),
	.B(1'b0),
	.Y(B[i]),
	.Cin(Carry[i-1]),
	.Cout(Carry[i])
    );

end

endgenerate

endmodule