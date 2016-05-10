`timescale 1ns / 1ps

//2.71 Design on 8x1 mux using AND, OR, NOT gates
module mux8x1(in, sel, out
    );
    input [7:0] in;
    input [2:0] sel;
    output reg out;
    
    always @(*) begin
        out <=
        (in[0] & ~sel[2] & ~sel[1] & ~sel[0]) |
        (in[1] & ~sel[2] & ~sel[1] &  sel[0]) |
        (in[2] & ~sel[2] &  sel[1] & ~sel[0]) |
        (in[3] & ~sel[2] &  sel[1] &  sel[0]) |
        (in[4] &  sel[2] & ~sel[1] & ~sel[0]) |
        (in[5] &  sel[2] & ~sel[1] &  sel[0]) |
        (in[6] &  sel[2] &  sel[1] & ~sel[0]) |
        (in[7] &  sel[2] &  sel[1] &  sel[0]) ;
        
    end
    
endmodule
