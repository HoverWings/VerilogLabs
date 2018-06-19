`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2018 08:05:44 PM
// Design Name: 
// Module Name: divider
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




module divider(clk, clk_N);
    input clk;                      // ????
    output reg clk_N;                   // ??????
    parameter N = 100_000_000;      // 1Hz???,N=fclk/fclk_N
    reg [31:0] counter;             /* ???????????????
                                   ?????0???(N/2-1)??
                                   ???????????? */
    always @(posedge clk) 
    begin    // ?????
        counter = counter + 1;
        if(counter == N/2-1)
            begin
                clk_N = ~clk_N;
                counter = 0;
            end
    end 
endmodule
