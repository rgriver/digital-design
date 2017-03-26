`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2016 02:01:52
// Design Name: 
// Module Name: instr_memory
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


module instr_memory(
    input [4:0] addr, //from the PC
    output [31:0] dout //32-bit instruction
    );
    
    reg [31:0] imem [0:63];
    
    initial $readmemh("C:/Users/Rodrigo Rivera/Documents/Vivado_Projects/CPU4/imem.txt", imem);
    
    assign dout = imem[addr];
    
endmodule
