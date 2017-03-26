`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2016 23:21:51
// Design Name: 
// Module Name: seven_seg
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


module seven_seg(
    input [15:0] data,
    input clk,
    input reset,
    output reg [6:0] g_to_a,
    output reg [3:0] an,
    output wire dp 
    );
	 
    reg [1:0] s;	 
    reg [7:0] digit;
    wire [1:0] aen;

    assign dp = 1;

    always @(*) begin
	    case(s)
            0: digit = data[3:0]; 
            1: digit = data[7:4];
            2: digit = data[11:8];
            3: digit = data[15:12];
            default: digit = data[3:0];
        endcase
    end	

    always @(*) begin
        case(digit)
		    4'h0: g_to_a = 7'b1000000;
            4'h1: g_to_a = 7'b1111001;
            4'h2: g_to_a = 7'b0100100;
            4'h3: g_to_a = 7'b0110000;
            4'h4: g_to_a = 7'b0011001;
            4'h5: g_to_a = 7'b0010010;
            4'h6: g_to_a = 7'b0000010;
            4'h7: g_to_a = 7'b1111000;
            4'h8: g_to_a = 7'b0000000;
            4'h9: g_to_a = 7'b0010000;
            4'ha: g_to_a = 7'b0001000;
            4'hb: g_to_a = 7'b0000011;
            4'hc: g_to_a = 7'b1000110;
            4'hd: g_to_a = 7'b0100001;
            4'he: g_to_a = 7'b0000110;
            4'hf: g_to_a = 7'b0001110;
            default:  g_to_a = 7'b1000000;
        endcase
    end

    always @(*) begin
        an = 4'b1111;
        an[s] = 0;
    end

    always @(posedge clk) begin
        if (reset == 1)
            s <= 0;
        else
            s <= s + 1;
    end

endmodule
