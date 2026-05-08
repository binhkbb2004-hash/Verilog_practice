`timescale 1ns/1ps
module tb_half_adder();
    reg a;
    reg b;
    wire [1:0] sum;
//Biến phụ 
    reg [1:0] exp;
    integer i;
//DUT
    half_adder DUT (
        .a(a),
        .b(b),
        .c(sum[1]),
        .sum(sum[0])
    );
//Test
    initial begin
        for (i=0; i<4; i = i + 1) begin
            {a,b} = i;
            exp = a + b;
            #1;
            if(exp == sum)
                $display("CASE: %d | PASSED", i);
            else
                $display("FAILED");
        end
    $stop;
    end
endmodule