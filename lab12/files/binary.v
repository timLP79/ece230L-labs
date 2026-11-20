module binary(
    input w,
    input clk,
    input reset,
    output [2:0] state,
    output z
);
    wire [2:0] next_state;
    wire low_bits_differ;
    wire to_d;

    assign low_bits_differ = state[1] ^ state[0];
    assign to_d = w & ~state[2] & (~state[1] | ~state[0]);

    assign next_state[2] = w & (state[2] | (state[1] & state[0]));
    assign next_state[1] = low_bits_differ | (w & ~state[2] & ~state[1]);
    assign next_state[0] = (~w & ~low_bits_differ) | to_d;
    assign z = (state == 3'b010) | (state == 3'b100);

    dff msb(.Default(1'b0), .D(next_state[2]), .clk(clk), .reset(reset), .Q(state[2]));
    dff mid(.Default(1'b0), .D(next_state[1]), .clk(clk), .reset(reset), .Q(state[1]));
    dff lsb(.Default(1'b0), .D(next_state[0]), .clk(clk), .reset(reset), .Q(state[0]));
endmodule
