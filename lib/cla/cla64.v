module cla64(a, b, ci, co, y);
    input[63:0] a, b;
    input ci;

    output[63:0] y;
    output co;

    wire c;
    
    cla32 cla32_1(.a(a[31:0]), .b(b[31:0]), .ci(ci), .co(c), .y(y[31:0]));
    cla32 cla32_2(.a(a[63:32]), .b(b[63:32]), .ci(c), .co(co), .y(y[63:32]));
    
endmodule