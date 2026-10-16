module ones_compliment(
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] Y
);

    wire [4:0] sum;

    assign sum = {1'b0, A} + {1'b0, B};
    assign Y = sum[3:0] + {3'b000, sum[4]};

endmodule
