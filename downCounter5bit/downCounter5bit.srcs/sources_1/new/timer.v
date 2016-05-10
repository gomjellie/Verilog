`timescale 1ns / 1ps

module timer(
    input load,enable,clk,
    input [4:0] M,
    output wire Q
    );
    wire [4:0] unused;
    wire [4:0] B;
    wire [4:0] D;
    
    register5bit _register5bit( .ld(load), .clk(clk), .input5bit(M), .output5bit(B) );
    mux5bit _mux5bit( .ld(load), .leftInput(M), .rightInput(B), .mOut5bit(D));
    downCounter5bit _downCounter5bit( .clk(clk), .ld(load|Q), .cnt(enable), .input5bit(D), .mux_out(unused), .tc(Q)); 
    
endmodule
