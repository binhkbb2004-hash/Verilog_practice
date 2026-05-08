module mux_81 (
    input wire [7:0] d,
    input wire [2:0] sel,
    output reg y 
);
    always@(sel or d) begin
        case(sel)
            3'd0: y = d[0];
            3'd1: y = d[1];
            3'd2: y = d[2];
            3'd3: y = d[3];
            3'd4: y = d[4];
            3'd5: y = d[5];
            3'd6: y = d[6];
            default: y = d[7];
        endcase
    end
endmodule