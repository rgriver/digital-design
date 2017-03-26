`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2016 17:40:04
// Design Name: 
// Module Name: datapath
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


module datapath(
    input clk,
    input reset,
    input [31:0] instr,
    input regwrite,
    input mb, md, //Mux selectors
    input [2:0] pcsrc,
    input immsrc,
    input [15:0] memdout, //From the data memory
    output reg c, v, n, z, //ALU flags
    output [15:0] alusrca, alusrcb, //To the data memory
    output [15:0] pc
    );
     
    wire carry, overflow, negative, zero;
    wire [15:0] addsrca, addsrcb, result, pcmux0out, regdoutb, imm;
    wire [15:0] pcnext, aluout;
    
    //Program counter logic  
    mux2 #(16) pcmux2(
        .sel(pcsrc[2]),
        .d1(16'b0), .d0(pc),
        .y(addsrca)
        );
        
    mux2 #(16) pcmux1(
        .sel(pcsrc[1]),
        .d1(pcmux0out), .d0(16'b1),
        .y(addsrcb)
        );
                
    mux2 #(16) pcmux0(
        .sel(pcsrc[0]),
        .d1(result), .d0(instr[15:0]),
        .y(pcmux0out)
        );    
    
    adder pcadder(
        .a(addsrca), .b(addsrcb),
        .y(pcnext)
        );
        
    flopr #(16) pcreg(
        .clk(clk),
        .reset(reset),
        .din(pcnext),
        .q(pc)
        );        
        
    //Immediate
    mux2 #(16) imux(
        .sel(immsrc),
        .d1(pc), .d0(instr[15:0]),
        .y(imm)
        );                       
    
    //Register file
    register_file registerfile(
        .clk(clk), .reset(reset),
        .addra(instr[19:16]), .addrb(instr[15:12]),
        .din(result),
        .waddr(instr[23:20]),
        .we(regwrite),
        .douta(alusrca), .doutb(regdoutb)
        );
        
    mux2 #(16) muxb(
        .sel(mb),
        .d1(imm), .d0(regdoutb),
        .y(alusrcb)
        );
    
    //ALU
    alu alu(
        .a(alusrca), .b(alusrcb),
        .f(instr[28:25]),
        .y(aluout),
        .qc(c),
        .carry(carry), .overflow(overflow), .negative(negative), .zero(zero)
        );
        
    //ALU flags    
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            c <= 1'b0; v <= 1'b0; n <= 1'b0; z <= 1'b0; 
        end else if (instr[24]) begin
            c <= carry; v <= overflow; n <= negative; z <= zero;
        end
    end              
        
    //Mux D
    mux2 #(16) muxd(
        .sel(md),
        .d1(memdout), .d0(aluout),
        .y(result)
        );    
endmodule
