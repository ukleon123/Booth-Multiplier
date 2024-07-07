module cla16(a, b, ci, co, y);
    input[15:0] a, b;
    input ci;

    output[15:0] y;
    output co;

    wire c;
    
    cla8 cla8_1(.a(a[7:0]), .b(b[7:0]), .ci(ci), .co(c), .y(y[7:0]));
    cla8 cla8_2(.a(a[15:8]), .b(b[15:8]), .ci(c), .co(co), .y(y[15:8]));
    
endmodule