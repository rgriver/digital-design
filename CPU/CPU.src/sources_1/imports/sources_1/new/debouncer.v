`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2016 03:38:06
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input clk,
    input reset,
    input sigin,
    output sigout
    );
    
    reg delay1, delay2, delay3;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            delay1 <= 1'b0; 
            delay2 <= 1'b0; 
            delay3 <= 1'b0;
        end else begin
            delay1 <= sigin;
            delay2 <= delay1;
            delay3 <= delay2;
        end
    end
    
    assign sigout = delay1 & delay2 & delay3;   
    
endmodule
