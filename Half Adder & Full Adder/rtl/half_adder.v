module half_adder (
    input wire a,
    input wire b,
    output wire c,
    output wire sum
);
    assign sum = a ^ b;
    assign c = a & b;
endmodule