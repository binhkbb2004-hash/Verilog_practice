module barrel_shifter(
    input wire [7:0] din,
    input wire [2:0] shift_amt,
    input wire dir, // 0 trái, 1 phải nhé
    output reg [7:0] dout
);
    always@(din or shift_amt or dir) begin
        if(dir) begin
            case(shift_amt)
                3'd0:   dout = din;
                3'd1:   dout = {1'b0,din[7:1]};
                3'd2:   dout = {2'b0,din[7:2]};
                3'd3:   dout = {3'b0,din[7:3]};
                3'd4:   dout = {4'b0,din[7:4]};
                3'd5:   dout = {5'b0,din[7:5]};
                3'd6:   dout = {6'b0,din[7:6]};
                default:dout = {7'b0,din[7]};
            endcase
        end else begin
            case(shift_amt)
                3'd0:   dout = din;
                3'd1:   dout = {din[6:0],1'b0};
                3'd2:   dout = {din[5:0],2'b0};
                3'd3:   dout = {din[4:0],3'b0};
                3'd4:   dout = {din[3:0],4'b0};
                3'd5:   dout = {din[2:0],5'b0};
                3'd6:   dout = {din[1:0],6'b0};
                default:dout = {din[0],7'b0};
            endcase
        end
    end
endmodule