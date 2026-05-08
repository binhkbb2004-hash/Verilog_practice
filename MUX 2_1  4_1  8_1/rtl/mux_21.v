module mux_21(
    input wire [1:0] d,
    input wire sel,
    output reg y
);
    always @(d or sel) begin
        case(sel)
            1'b0: y = d[0];
            default: y = d[1];
        endcase
    end
endmodule 