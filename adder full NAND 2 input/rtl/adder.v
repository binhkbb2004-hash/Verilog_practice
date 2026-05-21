module adder(
    input wire a,
    input wire b,
    input wire cin,
    output wire s,
    output wire cout
);
    wire [8:0] nand_n;
    assign nand_n[0] = ~(a & b);
    assign nand_n[1] = ~(a & nand_n[0]);
    assign nand_n[2] = ~(b & nand_n[0]);
    assign nand_n[3] = ~(nand_n[1] & nand_n[2]);
    assign nand_n[4] = ~(nand_n[3] & cin);
    assign nand_n[5] = ~(nand_n[3] & nand_n[4]);
    assign nand_n[6] = ~(nand_n[4] & cin);
    assign nand_n[7] = ~(nand_n[5] & nand_n[6]);
    assign nand_n[8] = ~(nand_n[0] & nand_n[4]);
    assign s = nand_n[7];
    assign cout = nand_n[8];
endmodule