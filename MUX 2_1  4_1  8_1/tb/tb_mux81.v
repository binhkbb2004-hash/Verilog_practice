module tb_mux81 ();
    reg [7:0] d;
    reg [2:0] sel;
    wire y;
//Biến phụ
    integer i, j;
//DUT
    mux_81 DUT (
        .d(d),
        .sel(sel),
        .y(y)
    );
//Test
    initial begin
        for (i=0; i<255; i = i + 1) begin
            $display("CASE: %d", i);
            for (j=0; j<8; j = j + 1) begin
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