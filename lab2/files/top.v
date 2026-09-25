module top(
    input [15:0] sw,
    output [15:0] led
);

    // Enter your equation here
assign led[0] = sw[0];
endmodule
