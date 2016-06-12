`timescale 1ns / 1ps
module LinearFeedbackShiftReg(
    input clock,
    input reset,
    output [15:0] rnd
    );
parameter LEN=16;
reg [LEN-1:0] random, random_next, random_safe;
reg [2:0] count, count_next;
wire feedback = random[0] ^ random[1] ^ random[3] ^ random[12];

    always @ (posedge clock or posedge reset)begin
    
        if(reset)begin
            random <= 16'hAAA;
            count <= 1'b0;
        end
        
        else begin
            random <= random_next;
            count <= count_next;
        end
    end
    
    always @ (*) begin
        
        random_next = {random[LEN-2:0], feedback};
        count_next = count + 1;
        
        if (count % 3 == 1) begin
            random_safe = random;
        end else begin
            random_safe = random ^ 16'hfab7;
        end
        
    end
    
    assign rnd = random_safe;
endmodule
