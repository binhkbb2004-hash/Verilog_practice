`timescale 1ns/1ps
module tb_full_adder ();
    reg a;
    reg b;
    reg c_in;
    wire [1:0] sum;
//Biến phụ
    reg [1:0] exp;
    integer i;
//DUT
    full_adder DUT (
        .a(a),
        .b(b),
        .c_in(c_in),
        .sum(sum[0]),
        .c_out(sum[1])
    );
//Test
    initial begin
        for (i=0; i<8; i = i + 1) begin
            {a,b,c_in} = i;
            exp = a + b + c_in;
            #2;
            if(sum == exp)
                $display("CASE: %d | PASSED", i);
            else
                $display("FAILED");
        end
    $stop;
    end
endmodule