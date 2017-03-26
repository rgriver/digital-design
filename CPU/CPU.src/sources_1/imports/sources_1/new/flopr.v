`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2016 00:43:03
// Design Name: 
// Module Name: flopr
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


module flopr #(parameter WIDTH = 32) (
    input clk,
    input reset,
    input [WIDTH-1:0] din,
    output reg [WIDTH-1:0] q
    );
    
    always @(posedge clk, posedge reset)
        if (reset)
            q <= 0;
        else
            q <= din;
    
endmodule
