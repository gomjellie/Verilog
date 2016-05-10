`timescale 1ns / 1ps

module mux5bit(
    input ld,
    input [4:0] leftInput,rightInput,
    output reg [4:0] mOut5bit
    );
    always @(*)begin
        if(ld==1)
            mOut5bit<=leftInput;
        else
            mOut5bit<=rightInput;
    end
endmodule
