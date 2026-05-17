`timescale 1ns/1ps
interface alu_if(input bit clk);
  	parameter   reg_wd    	=   8;

  	logic						rst_n, enable;
  	logic 	[reg_wd -1:0]       a, b; 
  	logic 	[2:0]       		opcode;
	logic  	[reg_wd:0]          result; 

//---------------------------------------------------
// Clocking Block
//---------------------------------------------------

  	clocking cb @(posedge clk);
    	default input #1 output #1;
		output 	enable;
   		output	a, b; 
   		output 	opcode; 
   		input	result;
  	endclocking

//---------------------------------------------------
// Modport
//---------------------------------------------------

  	modport TB(clocking cb, output rst_n);
endinterface