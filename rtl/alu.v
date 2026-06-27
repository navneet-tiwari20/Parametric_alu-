`include "alu_opcode.vh"

module alu #(parameter WIDTH = 16)
(
    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,

    input [4:0] op,
    input sign_mode,

    input [$clog2(WIDTH)-1:0] shift,

    output reg [WIDTH-1:0] out,

    output carry,
    output overflow,
    output zero,
    output negative
);

wire [WIDTH-1:0] arith_out;
wire [WIDTH-1:0] logic_out;
wire [WIDTH-1:0] shift_out;
wire [WIDTH-1:0] cmp_out;

arith_unit arith1(
    .A(A),
    .B(B),
    .op(op),
    .sign_mode(sign_mode),
    .out(arith_out),
    .carry(carry),
    .overflow(overflow)
);

logic_unit logic1(
    .A(A),
    .B(B),
    .op(op),
    .out(logic_out)
);

shift_unit shift1(
    .A(A),
    .op(op),
    .shift(shift),
    .out(shift_out)
);

cmp_unit cmp1(
    .A(A),
    .B(B),
    .op(op),
    .sign_mode(sign_mode),
    .out(cmp_out)
);

always @(*) begin

    out = 0;

    if(op == `ADD || op == `SUB || op == `INC ||
       op == `DEC || op == `MUL || op == `DIV ||
       op == `MOD)
        out = arith_out;

    else if(op == `AND || op == `OR ||
            op == `XOR || op == `NOT)
        out = logic_out;

    else if(op == `SHL || op == `SHR ||
            op == `ROL || op == `ROR)
        out = shift_out;

    else if(op == `EQ || op == `GT || op == `LT)
        out = cmp_out;

end

flag_unit flag1(
    .out(out),
    .zero(zero),
    .negative(negative)
);

endmodule
