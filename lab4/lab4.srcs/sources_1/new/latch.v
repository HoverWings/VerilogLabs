`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2018 10:11:31 PM
// Design Name: 
// Module Name: latch
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


module latch
(
    input wire [WIDTH-1:0] data,
    //input wire clk,reset,load,
    inout clk,reset,load,
    output reg [WIDTH-1:0] result
);
    parameter WIDTH = 8;
    always @(posedge clk) 
    begin
        if(reset) result <= 0;
        else if(load) result <= data;
    end
     
endmodule
