module cla4 (a, b, ci, co, y);
  input ci;
  input [3:0] a, b;

  output co;
  output[3:0] y;

  wire[2:0] c;
  wire[3:0] g, p;


  full_adder fa_1 (.a(a[0]), .b(b[0]), .ci(ci), .g(g[0]), .p(p[0]), .y(y[0]));
  full_adder fa_2(.a(a[1]), .b(b[1]), .ci(c[0]), .g(g[1]), .p(p[1]), .y(y[1]));
  full_adder fa_3 (.a(a[2]), .b(b[2]), .ci(c[1]), .g(g[2]), .p(p[2]), .y(y[2]));
  full_adder fa_4 (.a(a[3]), .b(b[3]), .ci(c[2]), .g(g[3]), .p(p[3]), .y(y[3]));
  clb clb4_1(.p(p), .g(g), .ci(ci), .co({co, c}));

endmodule
