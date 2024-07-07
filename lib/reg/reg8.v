module register8_res_n_en(
    clk,
    reset_n,
    en,
    d,
    q
);
    input clk, reset_n, en;
    input [7:0] d;

    output reg[7:0] q;

    always @(posedge clk) 
    begin
        if (en === 1'b1)
            q <= d;
        else
            q <= q;
    end

    always @(*) 
    begin
        if (reset_n === 1'b0)
            q <= 8'b0;
        else 
            q <= q;
    end 
endmodule