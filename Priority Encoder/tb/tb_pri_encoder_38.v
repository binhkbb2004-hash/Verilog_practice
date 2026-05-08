module tb_pri_encoder_38 ();
    reg [7:0] in;
    reg en;
    wire [2:0] out;
    wire valid;
//Biến phụ
    integer i;
    integer pass_cnt = 0;
    integer fail_cnt = 0;
//DUT
    pri_encoder_38 DUT (
        .in(in),
        .en(en),
        .out(out),
        .valid(valid)
    );
//Test
    initial begin
        check(1'b0);
        #2;
        check(1'b1);
        #10;
    $stop;
    end
//Task
    task check;
        input i_en;
        begin
            $display("Check en = %d", i_en);
            for(i=0; i<256; i = i + 1) begin
                $display("CASE: %d", i);
                en = i_en;
                in = i;
                #1;
                $display("Input: %b",in);
                if(!en) begin
                    if((out == 3'd0) && (valid == 1'b0)) begin
                        $display("PASSED");
                        pass_cnt = pass_cnt + 1;
                    end else begin
                        $display("FAILED");
                        fail_cnt = fail_cnt + 1;
                    end
                end else begin
                    if(in[7]==1) begin
                        if((out == 3'd7) && (valid == 1'b1)) begin
                            $display("PASSED");
                            pass_cnt = pass_cnt + 1;
                        end else begin
                            $display("FAILED");
                            fail_cnt = fail_cnt + 1;
                        end
                    end else if(in[6]==1) begin
                        if((out == 3'd6) && (valid == 1'b1)) begin
                            $display("PASSED");
                            pass_cnt = pass_cnt + 1;
                        end else begin
                            $display("FAILED");
                            fail_cnt = fail_cnt + 1;
                        end
                    end else if(in[5]==1) begin
                        if((out == 3'd5) && (valid == 1'b1)) begin
                            $display("PASSED");
                            pass_cnt = pass_cnt + 1;
                        end else begin
                            $display("FAILED");
                            fail_cnt = fail_cnt + 1;
                        end
                    end else if(in[4]==1) begin
                        if((out == 3'd4) && (valid == 1'b1)) begin
                            $display("PASSED");
                            pass_cnt = pass_cnt + 1;
                        end else begin
                            $display("FAILED");
                            fail_cnt = fail_cnt + 1;
                        end
                    end else if(in[3]==1) begin
                        if((out == 3'd3) && (valid == 1'b1)) begin
                            $display("PASSED");
                            pass_cnt = pass_cnt + 1;
                        end else begin
                            $display("FAILED");
                            fail_cnt = fail_cnt + 1;
                        end
                    end else if(in[2]==1) begin
                        if((out == 3'd2) && (valid == 1'b1)) begin
                            $display("PASSED");
                            pass_cnt = pass_cnt + 1;
                        end else begin
                            $display("FAILED");
                            fail_cnt = fail_cnt + 1;
                        end
                    end else if(in[1]==1) begin
                        if((out == 3'd1) && (valid == 1'b1)) begin
                            $display("PASSED");
                            pass_cnt = pass_cnt + 1;
                        end else begin
                            $display("FAILED");
                            fail_cnt = fail_cnt + 1;
                        end
                    end else if(in[0]==1) begin
                        if((out == 3'd0) && (valid == 1'b1)) begin
                            $display("PASSED");
                            pass_cnt = pass_cnt + 1;
                        end else begin
                            $display("FAILED");
                            fail_cnt = fail_cnt + 1;
                        end
                    end else begin
                        if((out == 3'd0) && (valid == 1'b0)) begin
                            $display("PASSED");
                            pass_cnt = pass_cnt + 1;
                        end else begin
                            $display("FAILED");
                            fail_cnt = fail_cnt + 1;
                        end
                    end
                end
            end
            #1;
            $display("-----TONG KET: PASS: %d | FAIL: %d", pass_cnt, fail_cnt);
            #1;
            pass_cnt = 0;
            fail_cnt = 0;
        end
    endtask
endmodule