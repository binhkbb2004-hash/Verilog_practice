module cra_4bit(
    input wire [3:0] a,
    input wire [3:0] b,
    output wire c_out,
    output wire [3:0] sum
);
    wire [3:0] w_c;
    genvar i;
    half_adder DUT_0(
        .a(a[0]),
        .b(b[0]),
        .c(w_c[0]),
        .sum(sum[0])
    );
    generate
        for(i=1; i<4; i = i + 1) begin
            full_adder DUT_i(
                .a(a[i]),
                .b(b[i]),
                .c_in(w_c[i-1]),
                .c_out(w_c[i]),
                .sum(sum[i])
            );
        end
    endgenerate
    assign c_out = w_c[3];
endmodule