module demux_14 (
    input wire d,
    input wire [1:0] sel,
    output reg [3:0] y
);
    always @(d or sel) begin
        case (sel)
            2'd0: y = {3'b0,d};
            2'd1: y = {2'b0,d,1'b0};
            2'd2: y = {1'b0,d,2'b0};
            default: y = {d,3'b0};
        endcase
    end
endmodule            