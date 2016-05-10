`timescale 1ns / 1ps

module doorProblem(input door, input swch, output led
    );
    mux4x1 m1( .in(door) , .sel(swch), .out(led) );
    
endmodule
