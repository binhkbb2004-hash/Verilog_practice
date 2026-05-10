`timescale 1ns/1ps
module tb_barrel_shifter();
    reg [7:0] din;
    reg [2:0] shift_amt;
    reg dir;
    wire [7:0] dout;
//Biến phụ
    integer i;
    reg [7:0] exp_dout;
//DUT
    barrel_shifter DUT(
        .din(din),
        .shift_amt(shift_amt),
        .dir(dir),
        .dout(dout)
    );
//Test
    initial begin
        check(8'b10110100, 1'b0);
        #2;
        check(8'b10110100, 1'b1);
        #5;
        $stop;
    end
//Task
    task check(
        input [7:0] i_din,
        input i_dir
    );
        begin
            $display("Input: %b, Direction: %b  (0: trai, 1: phai)",i_din, i_dir);
            for(i=0; i<8; i = i + 1) begin
                din = i_din;
                dir = i_dir;
                shift_amt = i;
                $display("CASE: shift_amt = %d",i);
                if(i_dir) begin
                    exp_dout = din >> i;
                    #2;
                end else begin
                    exp_dout = din << i;
                    #2;
                end
                if(dout == exp_dout)
                    $display("PASSED");
                else
                    $display("FAILED");
            end
        end
    endtask
endmodule