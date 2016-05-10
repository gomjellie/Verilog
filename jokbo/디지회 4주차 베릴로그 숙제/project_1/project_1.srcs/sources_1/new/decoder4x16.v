`timescale 1ns / 1ps
//2.71 Design a 4x16 Decoder using AND, OR, and NOT gates
module decoder4x16(in, out
    );
    input [3:0] in;
    output reg [15:0] out;
    
    initial begin
        out <= 16'h0000;
    end
    always @(*) begin
        out[0]<= ~in[3] & ~in[2] & ~in[1] & ~in[0];
        out[1]<= ~in[3] & ~in[2] & ~in[1] &  in[0];
        out[2]<= ~in[3] & ~in[2] &  in[1] & ~in[0];
        out[3]<= ~in[3] & ~in[2] &  in[1] &  in[0];//
        out[4]<= ~in[3] &  in[2] & ~in[1] & ~in[0];
        out[5]<= ~in[3] &  in[2] & ~in[1] &  in[0];
        out[6]<= ~in[3] &  in[2] &  in[1] & ~in[0];
        out[7]<= ~in[3] &  in[2] &  in[1] &  in[0];//
        out[8]<=  in[3] & ~in[2] & ~in[1] & ~in[0];
        out[9]<=  in[3] & ~in[2] & ~in[1] &  in[0];
        out[10]<=  in[3] & ~in[2] &  in[1] & ~in[0];
        out[11]<=  in[3] & ~in[2] &  in[1] &  in[0];//
        out[12]<=  in[3] &  in[2] & ~in[1] & ~in[0];
        out[13]<=  in[3] &  in[2] & ~in[1] &  in[0];
        out[14]<=  in[3] &  in[2] &  in[1] & ~in[0];
        out[15]<=  in[3] &  in[2] &  in[1] &  in[0];//
    end
    
endmodule
