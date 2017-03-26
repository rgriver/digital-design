`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2016 19:03:33
// Design Name: 
// Module Name: alu
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


module alu(
    input [15:0] a, b,
    input [3:0] f,
    input qc,
    output reg [15:0] y,
    output reg carry, overflow, 
    output negative, zero
    );
    
    wire cprime;
    wire [15:0] bprime;
    reg [16:0] sum;
   
    
    assign cprime = ((f == 4'b0011) | (f == 4'b0100)) ? qc : f[0];
    
    assign bprime = (f[2] ^ f[1]) ? ((f[1] ? b : ~b) + cprime) : 
        (f[0] ? 16'b1 : 16'hffff);
    
    always @(*) begin   
        carry = 0;
        overflow = 0;
        sum = 16'b0;      
        case (f)
            4'h0, 4'h7: y = a;
            4'h1, 4'h2, 4'h3, 4'h4, 4'h5, 4'h6: begin
                y = a + bprime;
                sum = {1'b0, a} + {1'b0, bprime};
                carry = sum[16];
                overflow = a[15] ^ bprime[15] ^ y[15] ^ carry;
            end
            4'h8: y = a & b;
            4'h9: y = a | b;
            4'ha: y = a ^ b;
            4'hb: y = ~a;
            4'hc: y = b;
            4'hd: begin //shift right with carry
                y = {1'b0, b[15:1]};
                carry = b[0]; 
            end 
            4'he: begin //shift left with carry
                y = {b[14:0], 1'b0};
                carry = b[15];
            end
            default: y = 16'bxxxxxxxxxxxxxxxx;
        endcase        
    end

    //Negative and zero
    assign zero = (y == 16'b0); 
    assign negative = y[15];
       
    
endmodule
