module flag_unit #(parameter WIDTH = 16)
(
    input [WIDTH-1:0] out,

    output zero,
    output negative
);

assign zero = (out == 0);
assign negative = out[WIDTH-1];

endmodule