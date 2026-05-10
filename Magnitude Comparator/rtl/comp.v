module comp(
    input wire [3:0] a,
    input wire [3:0] b,
    output wire et,
    output wire gt,
    output wire lt
);
    assign et = (a == b);
    assign gt = (a > b);
    assign lt = (a < b);
endmodule