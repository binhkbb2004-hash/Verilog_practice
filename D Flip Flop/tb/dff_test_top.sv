`timescale 1ns/1ps
module dff_test_top;
    reg clk;
    dff_if top_io(clk);
    dff_env test(top_io);
    dff DUT (
        .clk (top_io.clk),
        .rst_n (top_io.rst_n),
        .d (top_io.d),
        .q (top_io.q)
    );

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~ clk;
        end
    end
endmodule