`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/11 19:45:45
// Design Name: 
// Module Name: lab2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module lab3_1(clk,out);  // top module
    input clk;
    output out;
    reg out1;
    wire  a;
    wire  b;
    parameter delay=50_000_000;
    divider sub_divider
    (
    .clk(clk),
    .clk_N(out1),
    .delay(delay)
    );
    counter sub_counter
    (
    .clk(out1),
    .out(out),
    );
endmodule



//module lab2(input [15:0] SW,output CA,output CB,output CC,output CD,output CE,output CF,output CG,output DP,output [7:0] AN,output [15:0] LED);
//module lab2(input [15:0] SW,output reg [7:0] SEG,output [7:0] AN,output [15:0] LED);
//module lab3(SW, SEG, AN, LED);
//    input [15:0] SW;                          // 16?????
//	output reg [7:0] SEG;                          // 7????????????
//	output reg [7:0] AN;                          // 7??????????????
//	output [15:0] LED;                        // 16?LED????????

/*lab1 
    assign CA = SW[7];
    assign CB = SW[6];
    assign CC = SW[5];
    assign CD = SW[4];
    assign CE = SW[3];
    assign CF = SW[2];
    assign CG = SW[1];
    assign DP = SW[0];
        
    assign AN[7:0] = SW[15:8];
    assign LED[15:0] = SW[15:0];
*/
    
    
/*lab 2
    assign AN[7:0] = SW[15:8];
    assign LED[15:0] = SW[15:0];
    always@(SW[3:0])
    begin
        case(SW[3:0])
            4'b0000: SEG[7:0] = 8'b11000000;
            4'b0001: SEG[7:0] = 8'b11111001;
            4'b0010: SEG[7:0] = 8'b10100100;
            4'b0011: SEG[7:0] = 8'b10110000;
            4'b0100: SEG[7:0] = 8'b10011001;
            4'b0101: SEG[7:0] = 8'b10010010;
            4'b0110: SEG[7:0] = 8'b10000010;
            4'b0111: SEG[7:0] = 8'b11111000;
            4'b1000: SEG[7:0] = 8'b10000000;
            4'b1001: SEG[7:0] = 8'b10011000;
            4'b1010: SEG[7:0] = 8'b10001000;
            4'b1011: SEG[7:0] = 8'b10000011;
            4'b1100: SEG[7:0] = 8'b11000110;
            4'b1101: SEG[7:0] = 8'b10100001;
            4'b1110: SEG[7:0] = 8'b10000110;
            4'b1111: SEG[7:0] = 8'b10001110;
        endcase
    end
*/

/*lab3*/
module lab3(SW, SEG, AN, LED);
    input [15:0] SW;                          // 16?????
	output reg [7:0] SEG;                          // 7????????????
	output reg [7:0] AN;                          // 7??????????????
	output [15:0] LED;                        // 16?LED????????
    always@(AN[7:0])
    begin
        case(SW[15:13])
            3'b000: AN[7:0] = 8'b00000001;
            3'b001: AN[7:0] = 8'b00000010;
            3'b010: AN[7:0] = 8'b00000100;
            3'b011: AN[7:0] = 8'b00001000;
            3'b100: AN[7:0] = 8'b00010000;
            3'b101: AN[7:0] = 8'b00100000;
            3'b110: AN[7:0] = 8'b01000000;
            3'b111: AN[7:0] = 8'b10000000;
        endcase
    end
    assign LED[15:0] = SW[15:0];
    always@(SW[3:0])
    begin
        case(SW[3:0])
            4'b0000: SEG[7:0] = 8'b11000000;
            4'b0001: SEG[7:0] = 8'b11111001;
            4'b0010: SEG[7:0] = 8'b10100100;
            4'b0011: SEG[7:0] = 8'b10110000;
            4'b0100: SEG[7:0] = 8'b10011001;
            4'b0101: SEG[7:0] = 8'b10010010;
            4'b0110: SEG[7:0] = 8'b10000010;
            4'b0111: SEG[7:0] = 8'b11111000;
            4'b1000: SEG[7:0] = 8'b10000000;
            4'b1001: SEG[7:0] = 8'b10011000;
            4'b1010: SEG[7:0] = 8'b10001000;
            4'b1011: SEG[7:0] = 8'b10000011;
            4'b1100: SEG[7:0] = 8'b11000110;
            4'b1101: SEG[7:0] = 8'b10100001;
            4'b1110: SEG[7:0] = 8'b10000110;
            4'b1111: SEG[7:0] = 8'b10001110;
        endcase
    end
endmodule

//D:for divider clk into clj_N
module divider(clk,clk_N,delay);
    input clk;                      // ????
    input delay;                
    output clk_N;                   // ??????
    reg clk_N;
    parameter N = 100_000_000;     // 1Hz???,N=fclk/fclk_N


    reg [31:0] counter;            // ???????????????
                                    //?????0???(N/2-1)??
                                    //???????????? 
                                    // ?????
    always @(posedge clk)           // ????
    begin    
       if(counter==delay)
        begin
            clk_N<=~clk_N;
        end
    else
        begin
            counter<=counter+32'd1;
        end                             
    end                           
endmodule



module counter(clk, out);
    input clk;                    // ????
    output [2:0] out;             // ???
    reg [2:0] out;
    always @(posedge clk)         // ??????????1
    begin  
                                  // ????
        out<=out+32'd1;
    end                           
endmodule






