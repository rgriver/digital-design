`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2016 16:51:00
// Design Name: 
// Module Name: processor
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


module processor(
    input clk, reset,
    input [15:0] memdout,
    input [31:0] instr,
    output [15:0] pc,
    output [15:0] alusrca, alusrcb,
    output memwrite
    );
    
    wire c, v, n, z;
    wire mb, md, regwrite, immsrc;
    wire [2:0] pcsrc;
    
    datapath datapath(
        .clk(clk), .reset(reset),
        .instr(instr),
        .mb(mb), .md(md),
        .regwrite(regwrite),
        .pcsrc(pcsrc),
        .immsrc(immsrc),
        .alusrca(alusrca), .alusrcb(alusrcb),
        .c(c), .v(v), .n(n), .z(z),
        .memdout(memdout),
        .pc(pc)   
        );
    
    control_unit controller(
        .op(instr[31:25]),
        .c(c), .v(v), .n(n), .z(z),
        .mb(mb), .md(md),
        .regwrite(regwrite), .memwrite(memwrite),
        .pcsrc(pcsrc), .immsrc(immsrc)
        );
    
    
endmodule
