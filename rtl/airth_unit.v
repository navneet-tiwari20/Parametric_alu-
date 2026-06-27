`include "alu_opcode.vh"

module arith_unit #(parameter WIDTH = 16)
(
    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    input [4:0] op,
    input sign_mode,

    output reg [WIDTH-1:0] out,
    output reg carry,
    output reg overflow
);

reg signed [WIDTH-1:0] signed_a;
reg signed [WIDTH-1:0] signed_b;

always @(*) begin

    signed_a = A;
    signed_b = B;

    out = 0;
    carry = 0;
    overflow = 0;

    if(op == `ADD) begin
        if(sign_mode)
            out = signed_a + signed_b;
        else
            out = A + B;
    end

    else if(op == `SUB) begin
        if(sign_mode)
            out = signed_a - signed_b;
        else
            out = A - B;
    end

    else if(op == `INC)
        out = A + 1;

    else if(op == `DEC)
        out = A - 1;

    else if(op == `MUL) begin
        if(sign_mode)
            out = signed_a * signed_b;
        else
            out = A * B;
    end

    else if(op == `DIV) begin
        if(B != 0) begin
            if(sign_mode)
                out = signed_a / signed_b;
            else
                out = A / B;
        end
        else
            out = 0;
    end

    else if(op == `MOD) begin
        if(B != 0) begin
            if(sign_mode)
                out = signed_a % signed_b;
            else
                out = A % B;
        end
        else
            out = 0;
    end

end

endmodule