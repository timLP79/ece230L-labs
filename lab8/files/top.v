module ternary_4_mux_4_bits(
    input  wire [3:0] A, B, C, D,
    input  wire [1:0] Sel,
    output wire [3:0] Y
);

    assign Y = (Sel == 2'b00) ? A :
               (Sel == 2'b01) ? B :
               (Sel == 2'b10) ? C : D;

endmodule

module demux_4_bits(
    input  wire [3:0] In,
    input  wire [1:0] Sel,
    output wire [3:0] Y1,
    output wire [3:0] Y2,
    output wire [3:0] Y3,
    output wire [3:0] Y4
);

    assign Y1 = (Sel == 2'b00) ? In : 0;
    assign Y2 = (Sel == 2'b01) ? In : 0;
    assign Y3 = (Sel == 2'b10) ? In : 0;
    assign Y4 = (Sel == 2'b11) ? In : 0;

endmodule

module top (
    input  wire [15:0] sw,
    input  wire        btnC, btnL, btnU, btnD, btnR,
    output wire [15:0] led
);

    wire [3:0] mux_to_demux;

    ternary_4_mux_4_bits my_mux (
        .A(sw[3:0]),
        .B(sw[7:4]),
        .C(sw[11:8]),
        .D(sw[15:12]),
        .Sel({btnU, btnL}),
        .Y(mux_to_demux)
    );

    demux_4_bits my_demux (
        .In(btnC ? mux_to_demux : 4'b0000),
        .Sel({btnR, btnD}),
        .Y1(led[3:0]),
        .Y2(led[7:4]),
        .Y3(led[11:8]),
        .Y4(led[15:12])
    );

endmodule