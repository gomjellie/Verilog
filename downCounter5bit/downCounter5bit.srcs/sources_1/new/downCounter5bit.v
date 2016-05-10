`timescale 1ns / 1ps

module downCounter5bit(
    input clk, ld, cnt,
    input [4:0] input5bit,
    output reg [4:0] mux_out,//unused
    output reg tc
    );
    
    reg [4:0] down_counter;
    
    always @(*) begin
        mux_out <= down_counter;
    end
    
    always @(posedge clk) begin
        if(cnt)
            down_counter <= down_counter - 1'b1;
    end
    
    always @(ld) begin
        if(ld==1)
            down_counter<=input5bit;
    end
    
    always @(*) begin
        if(mux_out==5'b00000)
            tc<=1;
        else
            tc<=0;
    end

endmodule
