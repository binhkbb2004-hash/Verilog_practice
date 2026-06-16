`timescale 1ns/1ps
program dff_env (dff_if.TB dff_if);
    parameter W = 8;
    reg [W-1:0] payload_d [$];
    
    integer pass_cnt = 0;
    integer fail_cnt = 0;

    logic [W-1:0] rand_d;

    // main code
    initial begin
        dff_if.rst_n <= 1'b0;
        @(dff_if.cb);
        if(dff_if.cb.q === {W{1'b0}})
            $display("RESET PASSED");
        else
            $display("RESET FAILED");
        repeat (3) @(dff_if.cb);
        dff_if.rst_n <= 1'b1;

        //Test
        for(int i = 0; i < 1000; i = i + 1) begin
            rand_d = $urandom_range(0,255);
            gen(rand_d);
        end
        send();

        repeat (5) @(dff_if.cb);
        $display("TONG KET: PASS: %d | FAIL: %d", pass_cnt, fail_cnt);
        $stop;
    end

//Sequencer
    task gen (input [W-1:0] exp_d);
        payload_d.push_back(exp_d);
    endtask

//Driver
    task send ();
        while(payload_d.size()!=0) begin
            dff_if.cb.d <= payload_d.pop_front();
            repeat(2) @(dff_if.cb);

            display(); //gọi monitor & scoreboard
        end
    endtask

//Monitor & Scoreboard
    task display();
        logic [W-1:0] act_q;
        logic [W-1:0] act_d;
        logic [W-1:0] exp_q;

        act_q = dff_if.cb.q;
        act_d = dff_if.cb.d;

        exp_q = act_d;

        if(exp_q === act_q) begin
            $display("PASSED");
            pass_cnt = pass_cnt + 1;
        end else begin
            $display("FAILED");
            fail_cnt = fail_cnt + 1;
        end
    endtask
endprogram