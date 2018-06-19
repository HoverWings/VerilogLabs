`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2018 07:50:37 PM
// Design Name: 
// Module Name: lab3_6
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
`include "divider.v"
`include "counter.v"
`include "lab3_4.v"
`include "lab3_5.v"

module dynamic_scan(clk,SEG,AN);
    input clk;          // ????
    output [7:0] SEG;   
    output [7:0] AN;   
    // ????
    wire [2:0] clk_N;
    wire [2:0] counter_out;
    wire [3:0] data;
    wire [7:0] out;
    divider N_divider(clk,clk_N);
    counter counter_(clk_N,counter_out);
    rom8x4  rom_(counter_out,data);
    pattern pattern_(data,SEG);
    decoder3_8 decoder3_8_(counter_out,out); 
    assign AN=~out;
endmodule




// ???? CA?CB?CC?CD?CE?CF?CG ?DP














