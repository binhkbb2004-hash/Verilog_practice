module bin_to_gray #(parameter W=8) (
    input wire [W-1:0] bit_in,
    input wire sel, // sel = 0: bin to gray, sel = 1: gray to bin
    output reg [W-1:0] bit_out
);
    integer i;
    always @(sel or bit_in) begin
        case(sel)
            1'b0: bit_out = bit_in ^ (bit_in >> 1);
            default: begin
                    for(i=W-1;i>=0;i=i-1) begin
                        if(i==(W-1)) begin
                            bit_out[i] = bit_in[i];
                        end else begin
                            bit_out[i] = bit_in[i] ^ bit_out[i+1];
                        end
                    end
            end
        endcase
    end
endmodule   