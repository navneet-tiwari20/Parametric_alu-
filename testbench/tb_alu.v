
`include "alu_opcode.vh"

module tb_alu;

reg [15:0] A, B;
reg [4:0] op;
reg sign_mode;
reg [3:0] shift;

wire [15:0] out;
wire carry, overflow, zero, negative;

alu dut(
    .A(A),
    .B(B),
    .op(op),
    .sign_mode(sign_mode),
    .shift(shift),
    .out(out),
    .carry(carry),
    .overflow(overflow),
    .zero(zero),
    .negative(negative)
);

initial begin

    // Initial Values
    A = 0;
    B = 0;
    op = 0;
    sign_mode = 0;
    shift = 0;

    #10;

    // Arithmetic Operations
    A = 16'd10;
    B = 16'd5;

    op = `ADD; #10;
    op = `SUB; #10;
    op = `INC; #10;
    op = `DEC; #10;
    op = `MUL; #10;
    op = `DIV; #10;
    op = `MOD; #10;

    // Logic Operations
    op = `AND; #10;
    op = `OR;  #10;
    op = `XOR; #10;
    op = `NOT; #10;

    // Shift Operations
    shift = 2;

    op = `SHL; #10;
    op = `SHR; #10;
    op = `ROL; #10;
    op = `ROR; #10;

    // Comparison Operations
    A = 16'd10;
    B = 16'd5;

    op = `GT; #10;
    op = `LT; #10;
    op = `EQ; #10;

    // Equal Numbers
    A = 16'd20;
    B = 16'd20;
    op = `EQ; #10;

    // Zero Flag
    A = 16'd15;
    B = 16'd15;
    op = `SUB; #10;

    // Carry Test
    A = 16'hFFFF;
    B = 16'h0001;
    op = `ADD; #10;

    // Signed Operations
    sign_mode = 1;

    A = -16'd10;
    B = 16'd5;

    op = `ADD; #10;
    op = `SUB; #10;
    op = `MUL; #10;

    // Negative Result
    A = -16'd10;
    B = 16'd5;
    op = `ADD; #10;

    #20;

    $finish;

end

endmodule
