`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2018 09:30:13 PM
// Design Name: 
// Module Name: selector
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


module selector
(
    input wire [WIDTH-1:0] data_0,
    input wire [WIDTH-1:0] data_1,
    input wire sel,
    output wire [WIDTH-1:0] result
);
    parameter WIDTH = 8;
    assign result = (sel) ? data_1 : data_0;
endmodule
