`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2016 16:54:43
// Design Name: 
// Module Name: register_file
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


module register_file(
    input clk,
    input reset,
    input [3:0] addra, addrb,
    input [15:0] din,
    input [3:0] waddr,
    input we,
    output [15:0] douta, doutb
    );
    
    reg [15:0] regfile [1:15];
       
    assign douta = (addra != 0) ? regfile[addra] : 0;
    assign doutb = (addrb != 0) ? regfile[addrb] : 0;
    
    reg [15:0] i;
    
    always @ (posedge clk, posedge reset) begin
        if (reset) begin
            regfile[1] <= 16'h1111;
            for (i = 16'h1111; i <= 16'hffff; i = i + 16'h1111)
                regfile[i[3:0]] <= i;                                
        end else if ((waddr != 0) && we)
            regfile[waddr] <= din;
    end

endmodule
