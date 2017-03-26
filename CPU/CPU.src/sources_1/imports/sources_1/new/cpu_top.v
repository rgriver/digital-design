`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2016 03:43:55
// Design Name: 
// Module Name: cpu_top
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


module cpu_top(
    input clk, //100 MHz clock
    input btnC,
    input [4:0] sw,
    output [6:0] seg,
    output [3:0] an, 
    output dp
    );
    
    wire clk190;
    wire reset;
    
    wire [15:0] userdout;
    
    wire memwrite;
    wire [15:0] pc;
    wire [31:0] instr;
    wire [15:0] memaddr, memdin, memdout;
    
    //Posedge detector
    posedge_detector posdetect(
        .clk(clk), .sigin(btnC),
        .sigout(reset)
        );
    
    //Clock debounce
    /*debouncer db(
        .clk(clk), .reset(reset),
        .sigin(btnU), .sigout(dbclk)
        ); */
    
    //Clk divider
    clk_divider clkdiv(
        .clk(clk), .reset(reset),
        .clk190(clk190)
        );  
        
        
    //Seven segment
    seven_seg sevenseg(
        .clk(clk190), .reset(reset),
        .data(userdout),
        .g_to_a(seg), .an(an), .dp(dp)
        );
    
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
    data_memory datamem(
        .clk(clk),
        .we(memwrite),
        .addr(memaddr[4:0]), .useraddr(sw),
        .din(memdin), .dout(memdout), .userdout(userdout)
        );
    
endmodule
