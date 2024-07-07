module clb (p, g, ci, co);
    input[3:0] p, g;

    input ci;
    output[3:0] co;
 
    assign co[0] = g[0] | p[0] & ci;
    assign co[1] = g[1] | p[1] & co[0];
    assign co[2] = g[2] | p[2] & co[1];
    assign co[3] = g[3] | p[3] & co[2];
    
    
endmodule