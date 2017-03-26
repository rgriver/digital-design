`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2016 02:48:33
// Design Name: 
// Module Name: data_memory_test
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


module data_memory_test(
    input clk,
    input we,
    input [4:0] addr,
    input [15:0] din,
    output [15:0] dout
    );

    reg [15:0] dmem [0:63];

    initial $readmemh("C:/Users/Rodrigo Rivera/Documents/Vivado_Projects/CPU4/dmem.txt", dmem);

    assign dout = dmem[addr];

    always @(posedge clk)
        if (we)
            dmem[addr] <= din;

endmodule
