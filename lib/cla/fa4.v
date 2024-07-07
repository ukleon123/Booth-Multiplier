module full_adder (a, b, ci, g, p, y);
    input a, b, ci;
    output p, g, y;

    _or2 or2_1(.a(a), .b(b), .y(p));
    _and2 and2_1(.a(a), .b(b), .y(g));
    _xor3 xor3_1(.a(a), .b(b), .c(ci), .y(y));
endmodule