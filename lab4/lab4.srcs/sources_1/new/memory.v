`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2018 10:09:51 PM
// Design Name: 
// Module Name: memory
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


module memory
(
input wire [WIDTH-1:0] address,
output wire [WIDTH-1:0] data
);
    parameter WIDTH = 8;
    
    reg [WIDTH-1:0] RAM [15:0];
    
    initial 
        begin 
           RAM[0] = 8'h00000003;
           RAM[1] = 8'h00000002;
           RAM[2] = 8'h00000000;
           RAM[3] = 8'h00000007;
           RAM[4] = 8'h00000004;
           RAM[5] = 8'h00000000;
           RAM[6] = 8'h00000000;
           RAM[7] = 8'h0000000b;
           
           RAM[8] = 8'h00000006;
           RAM[9] = 8'h00000000;
           RAM[10] = 8'h00000000;
           RAM[11] = 8'h00000000;
           RAM[12] = 8'h00000008;
           RAM[13] = 8'h00000000;
           RAM[14] = 8'h00000000;
           RAM[15] = 8'h00000000;
        end    
    assign data = RAM[address]; 
endmodule
