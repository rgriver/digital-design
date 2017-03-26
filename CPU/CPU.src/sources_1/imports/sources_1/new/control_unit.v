`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2016 03:40:11
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [6:0] op,
    input c, v, n, z,
    output reg mb, md, regwrite, memwrite, immsrc,
    output reg [2:0] pcsrc
    );
    
    reg b;
    reg [2:0] j;
    
    
    always @(*) begin
        case (op[6:4])
            3'b000: begin
                mb = 1'b0; md = 1'b0; regwrite = 1'b1; memwrite = 1'b0;
                pcsrc = 3'b00x; immsrc = 1'bx;
            end
            3'b001: begin
                mb = 1'b0; md = 1'b1; regwrite = 1'b1; memwrite = 1'b0;
                pcsrc = 3'b00x; immsrc = 1'bx;
            end
            3'b010: begin
                mb = 1'b0; md = 1'bx; regwrite = 1'b0; memwrite = 1'b1;
                pcsrc = 3'b00x; immsrc = 1'bx;            
            end
            3'b100: begin
                mb = 1'b1; md = 1'b0; regwrite = 1'b1; memwrite = 1'b0;
                pcsrc = 3'b00x; immsrc = 1'b0;             
            end
            3'b110: begin 
                mb = 1'bx; md = 1'bx; regwrite = 1'b0; memwrite = 1'b0;
                pcsrc = {1'b0, b, 1'b0}; immsrc = 1'bx;             
            end
            3'b111: begin
                mb = 1'bx; md = 1'bx; regwrite = j[2]; memwrite = 1'b0;
                pcsrc = {2'b11, j[1]}; immsrc = j[0]; 
            end
            default: begin
                mb = 1'bx; md = 1'bx; regwrite = 1'bx; memwrite = 1'bx;
                pcsrc = 3'bxxx; immsrc = 1'bx;            
            end
        endcase
    end
    
    always @(*) begin
        case (op[2:0]) 
            3'b000: b = ~v;
            3'b001: b = v;
            3'b010: b = ~c;
            3'b011: b = c;
            3'b100: b = ~n;
            3'b101: b = n;
            3'b110: b = ~z;
            3'b111: b = z;
            default: b = 0;
        endcase        
    end
    
    //JMP, JSR and RTS => {regwrite, pc[0], aluimm}
    always @(*) begin
        case (op[3:2])
            2'b00: j = 3'b01x;
            2'b01: j = 3'b00x;
            2'b11: j = 3'b101;
            default: j = 3'bxxx;
        endcase   
    end
              
endmodule
