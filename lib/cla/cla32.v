module cla32(a, b, ci, co, y);
    input[31:0] a, b;
    input ci;

    output[31:0] y;
    output co;

    wire c;
    
    cla16 cla16_1(.a(a[15:0]), .b(b[15:0]), .ci(ci), .co(c), .y(y[15:0]));
    cla16 cla16_2(.a(a[31:16]), .b(b[31:16]), .ci(c), .co(co), .y(y[31:16]));
    
endmodule