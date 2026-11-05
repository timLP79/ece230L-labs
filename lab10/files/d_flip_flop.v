module d_flip_flop(
    input D, clk,
    output reg Q,
    output NotQ
);

    initial begin
        Q = 1'b0;
    end

    always @(posedge clk) begin
        Q <= D;
    end

    assign NotQ = ~Q;

endmodule
