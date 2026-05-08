module pri_encoder_38(
    input wire [7:0] in,
    input wire en,
    output reg [2:0] out,
    output reg valid
);
    always@(in or en) begin
        if(!en) begin
            out = 3'b0;
            valid = 1'b0;
        end else begin
            if(in[7]==1) begin
                out = 3'd7;
                valid = 1'b1;
            end else if(in[6]==1) begin
                out = 3'd6;
                valid = 1'b1;
            end else if(in[5]==1) begin
                out = 3'd5;
                valid = 1'b1;
            end else if(in[4]==1) begin
                out = 3'd4;
                valid = 1'b1;
            end else if(in[3]==1) begin
                out = 3'd3;
                valid = 1'b1;
            end else if(in[2]==1) begin
                out = 3'd2;
                valid = 1'b1;
            end else if(in[1]==1) begin
                out = 3'd1;
                valid = 1'b1;
            end else if(in[0]==1) begin
                out = 3'd0;
                valid = 1'b1;
            end else begin
                out = 3'd0;
                valid = 1'b0;
            end
        end
    end
endmodule