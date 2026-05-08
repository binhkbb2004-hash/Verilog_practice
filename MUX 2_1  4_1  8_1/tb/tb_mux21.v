`timescale 1ns/1ps
module tb_mux21();
    reg [1:0] d;
    reg sel;
    wire y;
//Biến phụ
    integer i;
//DUT
    mux_21 DUT (
        .d(d),
        .sel(sel),
        .y(y)
    );
//Test
    initial begin
        for (i=0; i <4; i = i + 1) begin
            d = i;
            sel = 0;
            #1;
            if(y == d[0])
                $display ("PASSED");
            else
                $display("FAILED");
            #1;
            sel = 1;
            #1;
            if(y == d[1])
                $display ("PASSED");
            else
                $display("FAILED");
        end
    $stop;
    end
endmodule