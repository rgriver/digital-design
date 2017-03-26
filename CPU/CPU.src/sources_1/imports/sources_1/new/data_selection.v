`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2016 04:46:38
// Design Name: 
// Module Name: data_selection
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


module data_selection(
    input [15:0] din,
    output reg [3:0] y
    );
    
    //Priority encoder
    always @(*) begin
        if (din[15]) y = 4'hf;
        else if (din[14]) y = 4'he;
        else if (din[13]) y = 4'hd;
        else if (din[12]) y = 4'hc;
        else if (din[11]) y = 4'hb;
        else if (din[10]) y = 4'ha;
        else if (din[9]) y = 4'h9;
        else if (din[8]) y = 4'h8;
        else if (din[7]) y = 4'h7;
        else if (din[6]) y = 4'h6;
        else if (din[5]) y = 4'h5;
        else if (din[4]) y = 4'h4;
        else if (din[3]) y = 4'h3;
        else if (din[2]) y = 4'h2;
        else if (din[1]) y = 4'h1;
        else if (din[0]) y = 4'h0;
        else y = 4'bxxxx;
    end
    
    
    
    
    
endmodule
