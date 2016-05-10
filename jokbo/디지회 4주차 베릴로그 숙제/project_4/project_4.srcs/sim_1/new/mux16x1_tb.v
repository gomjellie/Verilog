`timescale 1ns / 1ps

module mux16x1_tb;
    reg [15:0] in;
    reg [3:0] sel;
    wire out;
    
    mux16x1 mx_tb( .in(in), .sel(sel), .out(out) );
    
    initial begin
        in = 16'b0000000000110000;
        #10 sel = 4'b0000;
        #10 sel = 4'b0001;
        #10 sel = 4'b0100;
        #10 sel = 4'b0101;
        #10 sel = 4'b0110;
        #10 sel = 4'b1010;
        #10 $finish;
    end
    
endmodule
