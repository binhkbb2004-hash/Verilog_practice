`timescale 1ns/1ps
program alu_env(alu_if.TB ALU_Interface);
	
	parameter   reg_wd    	= 8;

	reg	[reg_wd-1:0] 	payload_a[$];		
	reg	[reg_wd-1:0] 	payload_b[$];
	reg [2:0]           payload_op[$];			
	reg [2:0]			opcode;
	reg [reg_wd:0]		result;

	int i;
	
// MAIN CODE		
initial begin
        reset();
        for(i=0; i < 256; i = i + 1) begin
            gen($urandom_range(0,255), $urandom_range(0,255), $urandom_range(0,5));
            send();
            repeat(5) @(ALU_Interface.cb);
    end
    $stop;
end
//	RESET TASK
	task reset();
		$display("RESET BEGIN");		
		ALU_Interface.rst_n 				<= 1'b0;
		ALU_Interface.cb.enable 			<= 1'b0;
		repeat(5) @(ALU_Interface.cb);
		ALU_Interface.rst_n 				<= 1'b1;
		ALU_Interface.cb.enable 			<= 1'b1;
		$display("RESET END");
	endtask

//	GENERATE PACKETS
    task gen(input [reg_wd-1:0] exp_a, input [reg_wd-1:0] exp_b, input [2:0] exp_opcode);
        $display("[GENERATE] Pushing inputs to Queue");
        payload_a.push_back(exp_a);
        payload_b.push_back(exp_b);
        payload_op.push_back(exp_opcode);
    endtask


//	SEND PAYLOAD
	task send();
		send_payload();
	endtask

//	SEND PAYLOAD TASK
task send_payload();
        ALU_Interface.cb.enable     <= 1'b1;
        
        while (payload_a.size() != 0)
        begin 
            ALU_Interface.cb.a      <= payload_a.pop_front();
            ALU_Interface.cb.b      <= payload_b.pop_front();
            ALU_Interface.cb.opcode <= payload_op.pop_front(); 

			@(ALU_Interface.cb);    
            @(ALU_Interface.cb);
            display();
        end
    endtask

//	DISPLAY  TASK
task display();
    // Khai báo biến cục bộ
    logic [8:0] expected_result;
    logic [7:0] act_a, act_b;
    logic [2:0] act_op;
    logic [8:0] actual_result;

    // 1. Lấy mẫu dữ liệu (Sampling)
    // Đọc lại các giá trị đã đưa vào DUT và kết quả ngõ ra hiện tại
    act_a         = ALU_Interface.cb.a;
    act_b         = ALU_Interface.cb.b;
    act_op        = ALU_Interface.cb.opcode;
    actual_result = ALU_Interface.cb.result;

    // 2. Mô hình tham chiếu (Golden Model)
    // Mô phỏng lại chính xác hành vi của phần cứng bằng phần mềm
    case (act_op)
        3'b000:  expected_result = act_a + act_b;               // ADD
        3'b001:  expected_result = act_a - act_b;               // SUB
        3'b010:  expected_result = {1'b0, act_a & act_b};       // AND
        3'b011:  expected_result = {1'b0, act_a | act_b};       // OR
        3'b100:  expected_result = {1'b0, act_a ^ act_b};       // XOR
        3'b101:  expected_result = {1'b0, ~act_a};              // NOT
        default: expected_result = 9'd0;
    endcase

    // 3. So sánh và Đánh giá (Checking)
    // Sử dụng toán tử === để bắt chặt cả các trạng thái X (Unknown) hoặc Z (High-Z)
    if (actual_result === expected_result) begin
        $display("[PASSED] OP: %b | A: %3d | B: %3d | Actual: %9b | Expected: %9b", 
                 act_op, act_a, act_b, actual_result, expected_result);
    end else begin
        $display("[FAILED] OP: %b | A: %3d | B: %3d | Actual: %9b | Expected: %9b", 
                 act_op, act_a, act_b, actual_result, expected_result);
    end
endtask
endprogram
