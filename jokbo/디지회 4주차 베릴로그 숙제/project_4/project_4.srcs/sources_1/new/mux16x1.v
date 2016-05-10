`timescale 1ns / 1ps

//2.71 Design on 8x1 mux using AND, OR, NOT gates
module mux16x1(in, sel, out
    );
    input [15:0] in;
    input [3:0] sel;
    output reg out;
    
    always @(*) begin
        out <=
        (in[0] & ~sel[3] & ~sel[2] & ~sel[1] & ~sel[0]) |
        (in[1] & ~sel[3] & ~sel[2] & ~sel[1] &  sel[0]) |
        (in[2] & ~sel[3] & ~sel[2] &  sel[1] & ~sel[0]) |
        (in[3] & ~sel[3] & ~sel[2] &  sel[1] &  sel[0]) |
        (in[4] & ~sel[3] &  sel[2] & ~sel[1] & ~sel[0]) |
        (in[5] & ~sel[3] &  sel[2] & ~sel[1] &  sel[0]) |
        (in[6] & ~sel[3] &  sel[2] &  sel[1] & ~sel[0]) |
        (in[7] & ~sel[3] &  sel[2] &  sel[1] &  sel[0]) |
        (in[8] &  sel[3] & ~sel[2] & ~sel[1] & ~sel[0]) |
        (in[9] &  sel[3] & ~sel[2] & ~sel[1] &  sel[0]) |
        (in[10] &  sel[3] & ~sel[2] &  sel[1] & ~sel[0]) |
        (in[11] &  sel[3] & ~sel[2] &  sel[1] &  sel[0]) |
        (in[12] &  sel[3] &  sel[2] & ~sel[1] & ~sel[0]) |
        (in[13] &  sel[3] &  sel[2] & ~sel[1] &  sel[0]) |
        (in[14] &  sel[3] &  sel[2] &  sel[1] & ~sel[0]) |
        (in[15] &  sel[3] &  sel[2] &  sel[1] &  sel[0]);
    end
    
endmodule
