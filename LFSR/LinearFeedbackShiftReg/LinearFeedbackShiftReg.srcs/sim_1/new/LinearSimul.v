`timescale 1ns / 1ps

module LinearSimul;

    reg clock;
    reg reset;
    
    wire [15:0] rnd;
    
    LinearFeedbackShiftReg uut(
        .clock(clock),
        .reset(reset),
        .rnd(rnd)
    );
    
    initial begin
        clock =0;
        
    end
    initial begin
        reset = 0;
        
        #1;
            reset = 1;
        #1; reset = 0;
        
        #3000 $finish;
    end
    
    always #2 clock = ~clock;

endmodule
