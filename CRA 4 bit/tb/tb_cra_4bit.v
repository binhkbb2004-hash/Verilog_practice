module tb_cra4bit();
    reg [3:0] a;
    reg [3:0] b;
    wire [4:0] sum;
//Biến phụ
    integer i;
    reg [4:0] exp_sum;
//DUT
    cra_4bit DUT (
        .a(a),
        .b(b),
        .sum(sum[3:0]),
        .c_out(sum[4])
    );
//Test
    initial begin
        for(i=0; i<16; i = i + 1) begin
            a = i;
            b = $urandom_range(0,15);
            exp_sum = a + b;
            #2;
            if(sum == exp_sum)
                $display("PASSED");
            else
                $display("FAILED");
        end
    $stop;
    end
endmodule