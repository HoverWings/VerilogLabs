`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2018 09:54:07 PM
// Design Name: 
// Module Name: divier
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


module divider
(
    input clk,
    input [31:0] frequency_need,
    output reg clk_need
);
    parameter frequency_before = 32'd100_000_000;  
    reg [31:0] counter;
    //parameter frequency_need = 200;   
    wire [31:0] N; 
    
    assign N = (frequency_before/frequency_need) / 2;
    initial counter = 0;
    initial clk_need = 0;   
    
    always @(posedge clk)
        begin
            counter <= counter+1;
            if(counter == N-1)   
            begin 
                clk_need <= ~clk_need;
                counter <= 0;
            end
        end
endmodule
