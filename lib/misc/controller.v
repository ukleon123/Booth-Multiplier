module controller ( clk, 
                    op_start, 
                    s1, s2, s3, 
                    p,
                    count, n_count, 
                    op_done);
    
    input op_start, clk;
    output s1;
    output reg s2, s3, op_done;

    input[1:0] p;

    input[7:0] count;
    output[7:0] n_count;
   
    assign s1 = op_start;
    counter8 counter(.count(count), .n_count(n_count));

    always@ (posedge clk or posedge op_start) begin
        if (op_start == 1'b1)begin
            op_done <= 1'b0;
        end
        else begin
            if (count === 8'd64)begin
                op_done <= 1'b1;
            end
            else begin 
                case(p)
                2'b01: begin
                    s2 <= 1'b0;
                    s3 <= 1'b1;
                end
                2'b10: begin
                    s2 <= 1'b1;
                    s3 <= 1'b1;
                end
                default:begin
                    s3 <= 1'b0;
                end
                endcase
            end
        end
    end
    
endmodule