`timescale 1ns / 1ps

module register5bit(
    input ld, clk,
    input [4:0] input5bit,
    output reg [4:0] output5bit
    );
    reg[4:0] save;
    
    always @(posedge clk) begin
        if(ld==1)
            save<=input5bit;
    end
    
    always @(*) begin
        output5bit<=save;
    end
    
endmodule
