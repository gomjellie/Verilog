`timescale 1ns / 1ps

module mux4x1( in, sel, out );

input[1:0] sel;
input[3:0] in;
output     out;

wire      out;
wire[1:0] sel;
wire[3:0] in;

assign out = in[sel];

endmodule