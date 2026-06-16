module dff #(parameter W = 8) (
    input wire clk,
    input wire rst_n,
    input wire [W-1:0] d,
    output reg [W-1:0] q
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= {W{1'b0}};
        else
            q <= d;
    end
endmodule