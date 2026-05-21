`timescale 1ns/1ps
module tb_bin_to_gray ();
    reg [7:0] bit_in;
    reg sel;
    wire [7:0] bit_out;
//Biến phụ
    integer i, j;
    reg [7:0] exp_out;
//DUT
    bin_to_gray DUT(
        .bit_in(bit_in),
        .sel(sel),
        .bit_out(bit_out)
    );
//Test
    initial begin
        for(i=0;i<256;i=i+1) begin
            $display("CASE: %d | bit_in: %b | bin to gray", i, i);
            check(1'b0, i);
            #3;
        end
        for(i=0;i<256;i=i+1) begin
            $display("CASE: %d | bit_in: %b | gray to bin", i, i);
            check(1'b1, i);
            #3;
        end
    #10;
    $stop;
    end
//Task
    task check;
        input exp_sel;
        input [7:0] exp_in;
    begin
        sel = exp_sel;
        bit_in = exp_in;
        #2;
        case(exp_sel)
            1'b0: exp_out = exp_in ^ (exp_in >> 1);
            default: begin
                    for(j=7;j>=0;j=j-1) begin
                        if(j==7) begin
                            exp_out[j] = exp_in[j];
                        end else begin
                            exp_out[j] = exp_in[j] ^ exp_out[j+1];
                        end
                    end
            end
        endcase
        #2;
        if(exp_out === bit_out)
            $display("PASSED");
        else
            $display("FAILED");
        end
    endtask
endmodule