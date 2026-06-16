program dff_env (dff_if.TB dff_if);
    parameter W=8;

    //class
    class Inputs;
        rand reg [W-1:0] d;

    constraint limit {
        d inside {[0:255]};
    }
    endclass

    //Khai báo các biến, mảng, hàng đợi
    Inputs arr[];
    Inputs send_input = new();
    Inputs recv_input = new();
    //queue
    Inputs input_dff[$];
    logic [W-1:0] output_dff[$];
    //biến phụ
    integer i;
    integer pass_cnt = 0;
    integer fail_cnt = 0;
    integer num;
    logic [W-1:0] exp_output;
    logic [W-1:0] act_output;

    //Initial block
    initial begin
        dff_if.rst_n <= 1'b0;
        repeat(5) @(dff_if.cb);
        dff_if.rst_n <= 1'b1;

        gen();
        fork
            send();
            recv();
            check();
        join
        repeat(5) @(dff_if.cb);
        $display("Tong ket: PASS: %d | FAIL: %d", pass_cnt, fail_cnt);
        $stop;
    end

    //TASK
    // Sequencer
    task gen();
        num = 1000;
        arr = new[num];
        for (i=0; i<num; i = i + 1) begin
            arr[i] = new();
        end

        for(i=0; i<num; i = i + 1) begin
            if(!send_input.randomize()) begin
                $display("Randomize Failed");
            end

            arr[i].d = send_input.d;
        end
    endtask

    //Driver
    task send();
        foreach (arr[i]) begin
            send_input = arr[i];
            dff_if.cb.d <= send_input.d;
            input_dff.push_back(send_input);
            @(dff_if.cb);
        end
        arr.delete();
    endtask

    //Monitor
    task recv();
        @(dff_if.cb);
        repeat(num) begin
            @(dff_if.cb);
            output_dff.push_back(dff_if.cb.q);
        end
    endtask

    //Scoreboard
    task check();
        repeat(num) begin
            wait(input_dff.size()>0 && output_dff.size()>0);
            recv_input = input_dff.pop_front();

            // so sánh
            exp_output = recv_input.d;
            act_output = output_dff.pop_front();
            if(exp_output == act_output) begin
                $display("PASSED");
                pass_cnt = pass_cnt + 1;
            end else begin
                $display("FAILED");
                fail_cnt = fail_cnt + 1;
            end
        end
    endtask
endprogram 