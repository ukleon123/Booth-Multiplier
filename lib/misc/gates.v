
module _inv(a, y);
	input a;
	output y;
	assign y = ~a;
endmodule
module _inv64(a, y);
	input [63:0] a;
	output [63:0] y;
	assign y = ~a;
endmodule

module _and2(a, b, y);
	input a, b;
	output y;
	assign y = a & b;
endmodule

module _and3(a, b, c, y);
	input a, b, c;
	output y;
	assign y = a & b & c;
endmodule

module _and4(a, b, c, d, y);
	input a, b, c, d;
	output y;
	assign y = a & b & c & d;
endmodule

module _and5(a, b, c, d, e, y);
	input a, b, c, d, e;
	output y;
	assign y = a & b & c & d & e;
endmodule

module _or2(a, b, y);
	input a, b;
	output y;
	assign y = a | b;
endmodule

module _or3(a, b, c, y);
	input a, b, c;
	output y;
	assign y = a | b | c;
endmodule

module _or4(a, b, c, d, y);
	input a, b, c, d;
	output y;
	assign y = a | b | c | d;
endmodule

module _or5(a, b, c, d, e, y);
	input a, b, c, d, e;
	output y;
	assign y = a | b | c | d | e;
endmodule

module _nand2(a, b, y);
	input a, b;
	output y;
	assign y = ~(a & b);
endmodule

module _xor2(a, b, y);
	input a, b;
	output y;
	assign y = a ^ b;
endmodule

module _xor3(a, b, c, y);
	input a, b, c;
	output y;
	assign y = a ^ b ^ c;
endmodule

module _inv_4bits(a, y);
	input [3:0] a;
	output[3:0] y;
	assign y = ~a;
endmodule

module _and2_4bits(a, b, y);
	input [3:0] a, b;
	output[3:0] y;
	assign y = a & b;
endmodule

module _or2_4bits(a, b, y);
	input [3:0] a, b;
	output[3:0] y;
	assign y = a | b;
endmodule

module _xor2_4bits(a, b, y);
	input [3:0] a, b;
	output [3:0] y;
	_xor2 xor1(.a(a[0]), .b(b[0]), .y(y[0]));
	_xor2 xor2(.a(a[1]), .b(b[1]), .y(y[1]));
	_xor2 xor3(.a(a[2]), .b(b[2]), .y(y[2]));
	_xor2 xor4(.a(a[3]), .b(b[3]), .y(y[3]));
endmodule

module _xor3_4bits(a, b, c, y);
	input [3:0] a, b, c;
	output [3:0] y;
	
	assign y = a ^ b ^ c;
endmodule

module _xnor2_4bits(a,b,y);
	input [3:0] a,b;
	output [3:0] y;
	wire [3:0] w;
	_xor2_4bits xor2_4b(.a(a), .b(b), .y(w));
	_inv_4bits inv_4b(.a(w), .y(y));
endmodule

//32 bit operation
module _inv_32bits(a, y);
	input [31:0] a;
	output [31:0] y;
	assign y = ~a;
endmodule

module _and2_32bits(a, b, y);
	input [31:0] a, b;
	output [31:0] y;
	assign y = a & b;
endmodule

module _or2_32bits(a, b, y);
	input [31:0] a, b;
	output [31:0] y;
	assign y = a | b;
endmodule

module _xor2_32bits(a, b, y);
	input [31:0] a, b;
	output [31:0] y;
	_xor2_4bits xor1(.a(a[3:0]), .b(b[3:0]), .y(y[3:0]));
	_xor2_4bits xor2(.a(a[7:4]), .b(b[7:4]), .y(y[7:4]));
	_xor2_4bits xor3(.a(a[11:8]), .b(b[11:8]), .y(y[11:8]));
	_xor2_4bits xor4(.a(a[15:12]), .b(b[15:12]), .y(y[15:12]));
	_xor2_4bits xor5(.a(a[19:16]), .b(b[19:16]), .y(y[19:16]));
	_xor2_4bits xor6(.a(a[23:20]), .b(b[23:20]), .y(y[23:20]));
	_xor2_4bits xor7(.a(a[27:24]), .b(b[27:24]), .y(y[27:24]));
	_xor2_4bits xor8(.a(a[31:28]), .b(b[31:28]), .y(y[31:28]));	
endmodule

module _xnor2_32bits(a, b, y);
	input [31:0] a, b;
	output [31:0] y;
	wire [31:0] w;
	_xor2_32bits XOR1(.a(a), .b(b), .y(w));
	_inv_32bits INV(.a(w), .y(y));
endmodule

//64 bit operation
module _inv_64bits(a, y);
	input [63:0] a;
	output [63:0] y;
	assign y = ~a;
endmodule