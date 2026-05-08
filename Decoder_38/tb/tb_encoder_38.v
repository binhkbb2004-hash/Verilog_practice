module tb_decoder_38 ();
    reg [2:0] addr;
    reg en;
    wire [7:0] y;
//Biến phụ
    integer i;
//DUT
    decoder_38 DUT (
        .addr(addr),
        .en(en),
        .y(y)
    );
//Test
    initial begin
        check(1'b0);
        #2;
        check(1'b1);
    $stop;
    end
//Task
    task check;
        input i_en;
        begin
            $display("Check en = %b", i_en);
            for(i=0; i<8; i = i + 1) begin
                en = i_en;
                addr = i;
                #1;
                if(!en) begin
                    if(y == 8'd0)
                        $display("PASSED");
                    else
                        $display("FAILED");
                end else begin
                    if(y == (8'd1 << addr))
                        $display("PASSED");
                    else
                        $display("FAILED");
                    end
            end
        end
    endtask
endmodule