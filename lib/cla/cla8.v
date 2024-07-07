module cla8 (a, b, ci, co, y);
    input[7:0] a, b;
    input ci;

    output[7:0] y;
    output co;

    wire c;
    
    cla4 cla4_1(.a(a[3:0]), .b(b[3:0]), .ci(ci), .co(c), .y(y[3:0]));
    cla4 cla4_2(.a(a[7:4]), .b(b[7:4]), .ci(c), .co(co), .y(y[7:4]));
    
endmodule