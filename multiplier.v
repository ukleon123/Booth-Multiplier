module multiplier(clk, reset_n, multiplier, multiplicand, op_start, op_done, result);
	input clk, reset_n, op_start;
	input[63:0] multiplier, multiplicand;
	
	output op_done;
	output[127:0] result;

	wire en_cnt;
	wire s1, s2, s3;
	wire [7:0] count, n_count;

	wire[63:0] A, S, inv_S, init_S, selected;
	wire [128:0] current_P, prev_P, next_unshift_P, next_P, value;

	assign result = current_P[128:1];

	//data preprecessing part
	_inv64 inv_multiplicand(.a(multiplicand), .y(inv_S));
	cla64 adder_1(.a(inv_S), .b(64'b0), .ci(1'b1), .y(init_S));

	//mux part
	mux2_129 mux_multiplier(.a(next_P), .b({64'b0, multiplier, 1'b0}), .s(s1), .y(current_P));
	mux2_64 mux_multiplicand(.a(A), .b(S), .s(s2), .y(selected));
	mux2_129 mux_result(.a(prev_P), .b(value), .s(s3), .y(next_unshift_P));
	
	//data register part
	register64_res_n_en reg_A(.clk(clk), .reset_n(reset_n), .en(op_start), .d(multiplicand), .q(A));
	register64_res_n_en reg_S(.clk(clk), .reset_n(reset_n), .en(op_start), .d(init_S), .q(S));
	register129_res_n_en reg_P(.clk(clk), .reset_n(reset_n), .en(en_cnt), .d(current_P), .q(prev_P));
	
	//Adder part
	cla129 adder_2(.a(prev_P), .b({selected, 65'b0}), .y(value));

	//shifter part
	shifter129 shifter(.a(next_unshift_P), .y(next_P));

	//controller && counter part
	_inv inv_op_done(.a(op_done), .y(en_cnt));
	register8_res_n_en reg_cnt(.clk(clk), .reset_n(reset_n), .en(en_cnt), .d(n_count), .q(count));
	controller controller(.clk(clk), .op_start(op_start), .s1(s1), .s2(s2), .s3(s3), .p(prev_P[1:0]), .count(count), .n_count(n_count), .op_done(op_done));


endmodule