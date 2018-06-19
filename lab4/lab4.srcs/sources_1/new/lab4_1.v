`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2018 07:37:02 PM
// Design Name: 
// Module Name: lab4_1
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


module datapath
(
    input ld_sum,ld_next,
    input sum_sel,next_sel,a_sel,
    input clk,reset,
    output next_zero,
    output [31:0] sum_out
);
    wire [31:0] result_A1,result_A2;
    wire [31:0] result_S1,result_S2,result_S3;
    wire [31:0] result_LS,result_LN;
    wire [31:0] data_M1;
    
    adder #(32) A1(.data_1(result_LS),.data_2(data_M1),.result(result_A1));
    selector #32 S1(.data_1(result_A1),.data_0(0),.sel(sum_sel),.result(result_S1));
    latch #32 LS(.clk(clk),.reset(reset),.load(ld_sum),.data(result_S1),.result(result_LS));
    memory #32 M1(.address(result_S3),.data(data_M1));
    selector #32 S2(.data_1(data_M1),.data_0(0),.sel(next_sel),.result(result_S2));
    latch #32 LN(.clk(clk),.reset(reset),.load(ld_next),
                 .data(result_S2),.result(result_LN));
    adder #32 A2(.data_1(1),.data_2(result_LN),.result(result_A2));
    selector #32 S3(.data_1(result_A2),.data_0(result_LN),.sel(a_sel),.result(result_S3));
    comparator #32 C1(.data(result_S2),.is_zero(next_zero));
    
    assign sum_out = result_LS;
endmodule

