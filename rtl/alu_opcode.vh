`ifndef ALU_OPCODE_VH
`define ALU_OPCODE_VH

`define ADD 5'b00000
`define SUB 5'b00001
`define INC 5'b00010
`define DEC 5'b00011
`define MUL 5'b00100
`define DIV 5'b00101
`define MOD 5'b00110

`define AND 5'b00111
`define OR  5'b01000
`define XOR 5'b01001
`define NOT 5'b01010

`define SHL 5'b01011
`define SHR 5'b01100
`define ROL 5'b01101
`define ROR 5'b01110

`define EQ  5'b01111
`define GT  5'b10000
`define LT  5'b10001

`endif