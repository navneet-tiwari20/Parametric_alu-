`include "alu_opcode.vh"

module logic_unit #(parameter WIDTH = 16)
(
    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    input [4:0] op,

    output reg [WIDTH-1:0] out
);

always @(*) begin

    if(op == `AND)
        out = A & B;

    else if(op == `OR)
        out = A | B;

    else if(op == `XOR)
        out = A ^ B;

    else if(op == `NOT)
        out = ~A;

    else
        out = 0;

end

endmodule