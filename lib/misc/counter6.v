module counter8 ( count, n_count);   
    input[7:0] count;
    output [7:0] n_count;

    wire[7:0] result;

    cla8 cla_8_counter(.a(count), .b(8'b1), .ci(1'b0), .co(), .y(result));

    assign n_count = result;
endmodule