module cla129(a, b, y);
    input[128:0] a, b;

    output[128:0] y;

    wire co;

    cla128 cla128_1(.a(a[127:0]), .b(b[127:0]), .ci(1'b0), .co(co), .y(y[127:0]));
    _xor3 xor3_1(.a(a[128]), .b(b[128]), .c(co), .y(y[128])); 
endmodule