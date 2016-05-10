`timescale 1ns / 1ps

module saleProblem_tb;

reg [2:0] in;
reg enabler;
wire [7:0] out;

saleProblem sP_tb( .switch1(in), .switch2(enabler) , .aisle(out) );

initial begin
    //out = 8'b00000000;
    enabler = 0;
    #10 in = 3'b000;
    #10 in = 3'b001;
    #10 in = 3'b010;
    #10 in = 3'b011;
    #10 in = 3'b100;
    #10 in = 3'b101;
    #10 in = 3'b110;
    #10 in = 3'b111;
    #10 $finish;
end

//always #5 in = in +1;
always #5 enabler = ~enabler;

endmodule
