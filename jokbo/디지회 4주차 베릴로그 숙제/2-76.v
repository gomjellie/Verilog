`timescale 1ns / 1ps

module saleProblem(switch1, switch2, aisle
    );
    input wire [2:0] switch1;
    input wire switch2;
    output wire [7:0] aisle;
    
    Decoder3x8 dec( .in(switch1), .enabler(switch2), .out(aisle) );
    
endmodule
