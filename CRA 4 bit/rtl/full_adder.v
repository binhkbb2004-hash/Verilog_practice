module full_adder(
    input wire a,
    input wire b,
    input wire c_in,
    output wire c_out,
    output wire sum
);
    wire w_sum, w_c0, w_c1;
    half_adder ha1 (
        .a(a),
        .b(b),
        .c(w_c0),
        .sum(w_sum)
    );
    half_adder ha2 (
        .a(w_sum),
        .b(c_in),
        .c(w_c1),
        .sum(sum)
    );
    assign c_out = w_c0 | w_c1;
endmodule