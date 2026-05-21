module tb_adder ();
    reg a;
    reg b;
    reg cin;
    wire [1:0] sum;
//Biến phụ
    integer i;
    reg [1:0] exp_sum;
//DUT
    adder DUT(
        .a(a),
        .b(b),
        .cin(cin),
        .s(sum[0]),
        .cout(sum[1])
    );
//Test
    initial begin
        for(i=0;i<8;i=i+1) begin
            {a,b,cin} = i;
            exp_sum = a + b + cin;
            #2;
            if(exp_sum == sum)
                $display("PASSED");
            else
                $display("FAILED");
            #2;
        end
    #10;
    $stop;
    end
endmodule