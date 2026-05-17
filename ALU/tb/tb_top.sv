`timescale 1ns/1ps
module tb_top;
	reg  SysClock;
	alu_if top_io(SysClock);
	alu_env test(top_io);   
	alu DUT(
		.clk	(top_io.clk), 
		.rst_n	(top_io.rst_n), 
		.enable (top_io.enable),
		.a(top_io.a),   
		.b(top_io.b),
		.opcode(top_io.opcode),
		.result	(top_io.result)
	);

	initial begin
		SysClock = 0;
		forever 
		begin
			#5;
			SysClock = ~SysClock;
		end
	end
endmodule