`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2016 23:50:50
// Design Name: 
// Module Name: posedge_detector
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


module posedge_detector(
    input clk,
    input sigin,
    output sigout
    );
    
    reg q;
    
    always @(posedge clk) begin
        q <= sigin;
    end
    
    assign sigout = (sigin) & (~q);
  
endmodule
