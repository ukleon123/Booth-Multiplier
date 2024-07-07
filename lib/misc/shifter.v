module shifter129(a, y);
    input[128:0] a;
    output[128:0] y;

    assign y = {a[128], a[128:1]};
endmodule