module alu(
    input wire clk,
    input wire rst_n,
    input wire enable,
    input wire [7:0] a,
    input wire [7:0] b,
    input wire [2:0] opcode,
    output reg [8:0] result
);
    always @ (posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            result <= 9'b0;
        end else begin
            if (enable) begin
                case (opcode)
                    3'b000: result <= a + b; //ADD
                    3'b001: result <= a - b; //SUB
                    3'b010: result <= {1'b0, a & b}; //AND
                    3'b011: result <= {1'b0, a | b}; //OR
                    3'b100: result <= {1'b0, a ^ b}; //XOR
                    3'b101: result <= {1'b0, ~a}; //NOT
                    default: result <= 9'd0;
                endcase
            end else begin
                result <= 9'b0;
            end
        end
    end
endmodule