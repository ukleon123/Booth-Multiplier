module cla128(a, b, ci, co, y);
    input[127:0] a, b;
    input ci;

    output[127:0] y;
    output co;

    wire c;
    
    cla64 cla64_1(.a(a[63:0]), .b(b[63:0]), .ci(ci), .co(c), .y(y[63:0]));
    cla64 cla64_2(.a(a[127:64]), .b(b[127:64]), .ci(c), .co(co), .y(y[127:64]));
endmodule