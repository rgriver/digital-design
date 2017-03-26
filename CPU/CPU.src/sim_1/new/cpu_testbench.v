`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2016 21:45:41
// Design Name: 
// Module Name: cpu_testbench
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


module cpu_testbench();
    
    reg clk, reset;
    
    cpu_top_test  dut(
        .clk(clk), .reset(reset)
        );

    integer i;
    
    initial begin
    
    reset = 1; clk = 0; #10;
    
    reset = 0; #10;
    
        for (i = 1; i < 44; i = i + 1) begin
            clk = ~clk; #10;
        end
    
    end

endmodule
