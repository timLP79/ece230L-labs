module top(
    input [7:0] sw,
    output [5:0] led
);

light stairway (
    .downstairs(sw[0]),
    .upstairs(sw[1]),
    .stair_light(led[0])
);

endmodule
