`include "alu_opcode.vh"

module shift_unit #(parameter WIDTH = 16)
(
    input [WIDTH-1:0] A,
    input [4:0] op,
    input [$clog2(WIDTH)-1:0] shift,

    output reg [WIDTH-1:0] out
);

always @(*) begin
    out = {WIDTH{1'b0}};

    case(op)

        `SHL:
            out = A << shift;

        `SHR:
            out = A >> shift;

        `ROL:
            if(shift == 0)
                out = A;
            else
                out = (A << shift) | (A >> (WIDTH-shift));

        `ROR:
            if(shift == 0)
                out = A;
            else
                out = (A >> shift) | (A << (WIDTH-shift));

        default:
            out = {WIDTH{1'b0}};

    endcase
end

endmodule