`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2016 23:27:50
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
    input clk,
    input reset,
    output clk190
    );
    
    reg [18:0] count;
    
    always @ (posedge clk or posedge reset) begin
        if (reset == 1)
            count <= 19'b0;
        else
            count <= count + 1;
    end
    
    assign clk190 = count[18]; 
    
endmodule
