`timescale 1ns/1ps
interface dff_if (input bit clk);
    parameter W = 8;
    logic rst_n;
    logic [W-1:0] d;
    logic [W-1:0] q;

    clocking cb @(posedge clk);
        default input #1 output #1;
        input q;
        output d;
    endclocking

    modport TB(clocking cb, output rst_n);
endinterface