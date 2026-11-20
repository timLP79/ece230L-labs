module onehot(
    input w,
    input clk,
    input reset,
    output [4:0] state,
    output z
);
    wire [4:0] next_state;

    assign next_state[0] = 1'b0;
    assign next_state[1] = ~w & (state[0] | state[3] | state[4]);
    assign next_state[2] = ~w & (state[1] | state[2]);
    assign next_state[3] =  w & (state[0] | state[1] | state[2]);
    assign next_state[4] =  w & (state[3] | state[4]);
    assign z = state[2] | state[4];

    dff a(.Default(1'b1), .D(next_state[0]), .clk(clk), .reset(reset), .Q(state[0]));
    dff b(.Default(1'b0), .D(next_state[1]), .clk(clk), .reset(reset), .Q(state[1]));
    dff c(.Default(1'b0), .D(next_state[2]), .clk(clk), .reset(reset), .Q(state[2]));
    dff d(.Default(1'b0), .D(next_state[3]), .clk(clk), .reset(reset), .Q(state[3]));
    dff e(.Default(1'b0), .D(next_state[4]), .clk(clk), .reset(reset), .Q(state[4]));
endmodule
