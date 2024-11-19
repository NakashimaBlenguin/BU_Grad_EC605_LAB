`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/03 16:11:38
// Design Name: 
// Module Name: Control_Logic
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

module Control_Unit(clk,rst,OPCODE,ALU_Src, MemtoReg, RegWrite, MemRead, MemWrite, Branch,ALU_Op);
input clk,rst;
input [6:0] OPCODE;
output reg ALU_Src, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
output reg [1:0] ALU_Op;

always @(*)
begin
    if(rst)
    begin
        ALU_Src <= 1'b0;
        MemtoReg <= 1'b0;
        RegWrite <= 1'b0;
        MemRead <= 1'b0;
        MemWrite <= 1'b0;
        Branch <= 1'b0;
        ALU_Op <= 2'b00;
    end
    else
    begin
        if(OPCODE == 7'b1110011)
        begin
            ALU_Src <= 1'b0;
            MemtoReg <= 1'b0;
            RegWrite <= 1'b1;
            MemRead <= 1'b0;
            MemWrite <= 1'b0;
            Branch <= 1'b0;
            ALU_Op <= 2'b10;
        end
        
        else if(OPCODE == 7'b1101011)
        begin
            ALU_Src <= 1'b0;
            MemtoReg <= 1'b0;
            RegWrite <= 1'b0;
            MemRead <= 1'b0;
            MemWrite <= 1'b0;
            Branch <= 1'b1;
            ALU_Op <= 2'b01;
        end
        
        else if(OPCODE == 7'b1100011)
        begin
            ALU_Src <= 1'b1;
            MemtoReg <= 1'b0;
            RegWrite <= 1'b0;
            MemRead <= 1'b0;
            MemWrite <= 1'b1;
            Branch <= 1'b0;
            ALU_Op <= 2'b00;
        end
        
        else if(OPCODE == 7'b1000011)
        begin
            ALU_Src <= 1'b1;
            MemtoReg <= 1'b1;
            RegWrite <= 1'b1;
            MemRead <= 1'b1;
            MemWrite <= 1'b0;
            Branch <= 1'b0;
            ALU_Op <= 2'b00;
        end
        
        else if(OPCODE == 7'b0110000)
        begin
            ALU_Src <= 1'b1;
            MemtoReg <= 1'b0;
            RegWrite <= 1'b1;
            MemRead <= 1'b0;
            MemWrite <= 1'b0;
            Branch <= 1'b0;
            ALU_Op <= 2'b11;
        end
        
        else if(OPCODE == 7'b0011111)
        begin
            ALU_Src <= 1'b1;
            MemtoReg <= 1'b0;
            RegWrite <= 1'b1;
            MemRead <= 1'b0;
            MemWrite <= 1'b0;
            Branch <= 1'b0;
            ALU_Op <= 2'b10;
        end
    end
end
endmodule

module ALU_Control_Generator(clk,rst,ALU_Op,ReadInstruction,ALU_Control);
input clk,rst;
input [1:0] ALU_Op;
input [31:0] ReadInstruction;
output reg [3:0] ALU_Control;

always @(*)
begin
    if(rst)
    begin
        ALU_Control <= 4'b0000;
    end
    
    else
    begin
        if(ReadInstruction[6:0]==7'b1110011)
        begin
            if(ReadInstruction[14:12] == 3'b000 && ReadInstruction[31:25] == 7'b0000000)
                ALU_Control <= 4'b0000;
                
            else if(ReadInstruction[14:12] == 3'b001 && ReadInstruction[31:25] == 7'b0000000)
                ALU_Control <= 4'b0110;
                
            else if(ReadInstruction[14:12] == 3'b010 && ReadInstruction[31:25] == 7'b0000000)
                ALU_Control <= 4'b0001;
                
            else if(ReadInstruction[14:12] == 3'b001 && ReadInstruction[31:25] == 7'b0100000)
                ALU_Control <= 4'b0101;
                
            else if(ReadInstruction[14:12] == 3'b100 && ReadInstruction[31:25] == 7'b0000000)
                ALU_Control <= 4'b0010;
                
            else if(ReadInstruction[14:12] == 3'b101 && ReadInstruction[31:25] == 7'b0000000)
                ALU_Control <= 4'b0011;
                
            else if(ReadInstruction[14:12] == 3'b110 && ReadInstruction[31:25] == 7'b0000000)
                ALU_Control <= 4'b0100;
                
            else if(ReadInstruction[14:12] == 3'b111 && ReadInstruction[31:25] == 7'b0000000)
                ALU_Control <= 4'b0111;
        end
        
        else if(ReadInstruction[6:0]==7'b1101011)
            ALU_Control <= 4'b0101;
            
        else if(ReadInstruction[6:0]==7'b1100011)
            ALU_Control <= 4'b0101;
            
        else if(ReadInstruction[6:0]==7'b1000011)
            ALU_Control <= 4'b0101;
            
        else if(ReadInstruction[6:0]==7'b0110000)
            ALU_Control <= 4'b1000;
            
        else if(ReadInstruction[6:0]==7'b0011111)
        begin
            if(ReadInstruction[14:12] == 3'b000)
                ALU_Control <= 4'b0110;
                
            else if(ReadInstruction[14:12] == 3'b001)
                ALU_Control <= 4'b0001;
                
            else if(ReadInstruction[14:12] == 3'b010)
                ALU_Control <= 4'b0010;
        end
    end
end
endmodule

module Immediate_Generator(clk,rst,ReadInstruction,Immediate);
input clk,rst;
input [31:0] ReadInstruction;
output reg [31:0] Immediate;

always @(*)
begin
    if(rst)
        Immediate <= 32'b0;
    
    else
    begin
        if(ReadInstruction[6:0]==7'b1101011)
            Immediate <= $signed({ReadInstruction[31], ReadInstruction[7], ReadInstruction[30:25], ReadInstruction[11:8],1'b0});
        else if(ReadInstruction[6:0]==7'b0110000)
            Immediate <= ReadInstruction[31:12] << 12 ;
        else if(ReadInstruction[6:0]==7'b0011111)
            Immediate <= ReadInstruction[31:20];
    end
end

endmodule


module Control_Logic(clk,rst,ReadInstruction,ReadReg1Address, ReadReg2Address, WriteRegAddress,Immediate,ALU_Src, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALU_Control);
input clk,rst;
input [31:0] ReadInstruction;
output [31:0] Immediate;
output reg [4:0] ReadReg1Address, ReadReg2Address, WriteRegAddress;
output ALU_Src, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
output [3:0] ALU_Control;

wire ALU_Op;

always @(*)
begin
    if(rst)
    begin
        ReadReg1Address <= 0;
        ReadReg2Address <= 0;
        WriteRegAddress <= 0;
    end
    
    else
    begin
        ReadReg1Address <= ReadInstruction[19:15];
        ReadReg2Address <= ReadInstruction[24:20];
        WriteRegAddress <= ReadInstruction[11:7];
    end
end

Control_Unit CU(clk,rst,ReadInstruction[6:0],ALU_Src, MemtoReg, RegWrite, MemRead, MemWrite, Branch,ALU_Op);
ALU_Control_Generator ACG(clk,rst,ALU_Op,ReadInstruction,ALU_Control);
Immediate_Generator IG(clk,rst,ReadInstruction,Immediate);

endmodule
