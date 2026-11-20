module top(
    input sw,
    output [9:0] led,
    input btnC,
    input btnU
);
    onehot onehot_fsm(
        .w(sw), .clk(btnC), .reset(btnU),
        .state(led[6:2]), .z(led[0])
    );

    binary binary_fsm(
        .w(sw), .clk(btnC), .reset(btnU),
        .state(led[9:7]), .z(led[1])
    );
endmodule
