`include "alu_opcode.vh"

module cmp_unit #(parameter WIDTH = 16)
(
    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    input [4:0] op,
    input sign_mode,

    output reg [WIDTH-1:0] out
);

reg signed [WIDTH-1:0] signed_a;
reg signed [WIDTH-1:0] signed_b;

always @(*) begin

    signed_a = A;
    signed_b = B;

    out = 0;

    if(op == `EQ)
        out = (A == B);

    else if(op == `GT) begin
        if(sign_mode)
            out = (signed_a > signed_b);
        else
            out = (A > B);
    end

    else if(op == `LT) begin
        if(sign_mode)
            out = (signed_a < signed_b);
        else
            out = (A < B);
    end

end

endmodule