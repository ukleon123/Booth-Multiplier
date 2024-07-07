module mux2_64 (a, b, s, y);
    input s;
    input[63:0] a, b;

    output[63:0] y;

    assign y = s ? b : a;
endmodule

module mux2_129 (a, b, s, y);
    input s;
    input[128:0] a, b;

    output[128:0] y;
    assign y = s ? b : a;
endmodule