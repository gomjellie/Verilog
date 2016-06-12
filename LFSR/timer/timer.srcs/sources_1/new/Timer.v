`timescale 1ns / 1ps

module Timer(
    input clk, load, cnt,
    [3:0] M,
    //output [3:0] Q,
    output reg led, reg [7:0] seg, reg [5:0] digit
    );
    reg [3:0] A;
    reg ld;
    wire tc;
    wire [3:0] B;
    wire [3:0] D;
    wire [3:0] Q;
    reg clk_1hz;
    reg [26:0]clk_cnt;
    
    Reg_4 Reg(A,load,clk_1hz,B);
    Mux_4 Mux(A,B,load,D);
    Down_ct count(D,load,cnt,clk_1hz,Q);
    //LED_7 (led, seg, digit
    always@(*)
        A = M - 1;
        
    always@(posedge clk) begin//???
        if(clk_cnt == 27'd1000_0000_0) //???
            clk_cnt <= 27'd0;
        else 
            clk_cnt <= clk_cnt + 1'b1;
    end
    
    always@(*)//???
        clk_1hz <= clk_cnt[25];
        
    always@(*) begin
        digit <= 6'b100000;
        case(Q)
        4'b0000 : seg <= 8'b0011_1111;//0
        4'b0001 : seg <= 8'b0000_0110;//1
        4'b0010 : seg <= 8'b0101_1011;//2
        4'b0011 : seg <= 8'b0100_1111;//3
        4'b0100 : seg <= 8'b0110_0110;//4
        4'b0101 : seg <= 8'b0110_1101;//5
        4'b0110 : seg <= 8'b0111_1100;//6
        4'b0111 : seg <= 8'b0010_0111;//7
        4'b1000 : seg <= 8'b0111_1111;//8
        4'b1001 : seg <= 8'b0110_0111;//9
        4'b1010 : seg <= 8'b1111_0111;//A
        4'b1011 : seg <= 8'b1111_1100;//B
        4'b1100 : seg <= 8'b1011_1001;//C
        4'b1101 : seg <= 8'b1101_1110;//D
        4'b1110 : seg <= 8'b1111_1001;//E
        4'b1111 : seg <= 8'b1111_0001;//F
        default : seg <= 8'b0011_1111;
        endcase
        if (tc==1)
            led <= 1;
    end
                
endmodule

module Reg_4(A,load,clk_1hz,B);
    input [3:0] A;
    input load, clk_1hz;
    output reg [3:0] B;

    always@(posedge clk_1hz) begin
        if(load)
            B <= A;
        else
            B <= B;
    end
endmodule

module Mux_4(A,B,load,D);
    input [3:0] A;
    input [3:0] B;
    input load;
    output reg [3:0] D;
    
    always@(*) begin
            if(load)
                D <= A;
            else
                D <= B;
        end
endmodule

module Down_ct(D,load,cnt,clk_1hz,Q);
    input [3:0] D;
    input load,cnt,clk_1hz;
    output reg [3:0] Q;
    reg tc, ld;//??
    reg [3:0] D1;
    wire randPart = D1[2] ^ D1[3];
    
    always@(posedge clk_1hz & cnt) begin//??
        if(ld==1) 
            D1 <= D;
        else
            D1 <= {D1[2:0],randPart};
            //D1 <= D1 - 1'b1;
        tc <= ~(D1[0] | D1[1] | D1[2] | D1[3]);
        Q <= D1;
    end
    
    always@(*)
        ld <= load | tc;
endmodule
