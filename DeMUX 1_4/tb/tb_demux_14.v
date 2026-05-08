module tb_demux_14();
    reg d;
    reg [1:0] sel;
    wire [3:0] y;
//Biến phụ
    integer i;
//DUT
    demux_14 DUT (
        .d(d),
        .sel(sel),
        .y(y)
    );
//Test
    initial begin
        d = 1;
        for (i=0; i<4; i = i + 1) begin
            sel = i;
            #1;
            if(y[i] == d)
                $display("PASSED");
            else
                $display("FAILED");
        end
    $stop;
    end
endmodule