`timescale 1ns / 1ps

module decoder4x16_tb;

reg [3:0] in;
wire [15:0] out;

decoder4x16 dec_tb( .in(in), .out(out) );

initial begin
    #10 in = 4'b0000;
    #10 in = 4'b0001;
    #10 in = 4'b0010;
    #10 in = 4'b0011;
    #10 in = 4'b0100;
    #10 in = 4'b0101;
    #10 in = 4'b0110;
    #10 in = 4'b0111;
    #10 in = 4'b1000;
    #10 in = 4'b1001;
    #10 in = 4'b1010;
    #10 in = 4'b1011;
    #10 in = 4'b1100;
    #10 in = 4'b1101;
    #10 in = 4'b1110;
    #10 in = 4'b1111;
    #10 $finish;
end


endmodule
