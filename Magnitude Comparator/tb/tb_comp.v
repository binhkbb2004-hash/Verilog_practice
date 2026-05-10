`timescale 1ns/1ps
module tb_comp();
    reg [3:0] a;
    reg [3:0] b;
    wire et;
    wire gt;
    wire lt;
//Biến phụ
    integer i;
    integer j;
    reg exp_et;
    reg exp_gt;
    reg exp_lt;
//DUT
    comp DUT(
        .a(a),
        .b(b),
        .et(et),
        .gt(gt),
        .lt(lt)
    );
//Test
    initial begin
        for(i=0; i<16; i = i + 1) begin
            for(j=0; j<16; j = j + 1) begin
                $display("CASE: a = %b, b = %b", i, j);
                a = i;
                b = j;
                exp_et = (a==b);
                exp_gt = (a>b);
                exp_lt = (a<b);
                #2;
                if((exp_et == et) && (exp_gt == gt) && (exp_lt == lt))
                    $display("PASSED");
                else
                    $display("FAILED");
            end
        end
    #5;
    $stop;
    end
endmodule