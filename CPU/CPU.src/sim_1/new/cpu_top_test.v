`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2016 02:07:00
// Design Name: 
// Module Name: cpu_top_test
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


module cpu_top_test(
    input clk,
    input reset
    );
    
    
    wire memwrite;
    wire [15:0] pc;
    wire [31:0] instr;
    wire [15:0] memaddr, memdin, memdout;
    
    
    
    //Processor   
    processor processor(
        .clk(clk), .reset(reset),
        .memdout(memdout),
        .pc(pc),
        .memwrite(memwrite),
        .instr(instr),
        .alusrca(memaddr), .alusrcb(memdin)
        );
    
    //Instruction memory
    instr_memory instrmem(
        .addr(pc[4:0]),
        .dout(instr)
        );
    
    //Data memory
    data_memory_test datamem(
        .clk(clk),
        .we(memwrite),
        .addr(memaddr[4:0]),
        .din(memdin), .dout(memdout)
        );

endmodule
