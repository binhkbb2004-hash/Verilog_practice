module tb_mux41 ();
    reg [3:0] d;
    reg [1:0] sel;
    wire y;
//Biến phụ
    integer i, j;
//DUT
    mux_41 DUT (
        .d(d),
        .sel(sel),
        .y(y)
    );
//Test
    initial begin
        for (i=0; i<16; i = i + 1) begin
            $display("CASE: %d", i);
            for (j=0; j<4; j = j + 1) begin
                d = i;
                sel = j;
                #1;
                $display("d = %b | sel = %b", d, sel);
                if(y == d[j])
                    $display ("PASSED");
                else
                    $display ("FAILED");
            end
        end
    $stop;
    end
endmodule