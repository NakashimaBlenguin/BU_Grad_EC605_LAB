`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/04 17:48:27
// Design Name: 
// Module Name: CtrlLog_testbench
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


module CtrlLog_testbench(
    );
reg clk,rst;
reg [31:0] ReadInstruction;
wire [31:0] Immediate;
wire [4:0] ReadReg1Address, ReadReg2Address, WriteRegAddress;
wire ALU_Src, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
wire [3:0] ALU_Control;

Control_Logic CL_TEST(clk,rst,ReadInstruction,ReadReg1Address, ReadReg2Address, WriteRegAddress,Immediate,ALU_Src, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALU_Control);

always #50 clk = ~clk;

initial
begin
clk=0;rst=1;
ReadInstruction=32'b00000000000000000000000000000000;
#50 rst=0;ReadInstruction=32'b00000001111110101000001011110011;
#100 ReadInstruction=32'b00000000011010010001011111110011;
#100 ReadInstruction=32'b00000001010100001010001111110011;
#100 ReadInstruction=32'b01000000101001100001100001110011;
#100 ReadInstruction=32'b00000000000100111100101111110011;
#100 ReadInstruction=32'b00000000001010111101100101110011;
#100 ReadInstruction=32'b00000001100100101110001111110011;
#100 ReadInstruction=32'b00000001011000111111100111110011;
#100 ReadInstruction=32'b10111000010000110000110001101011;
#100 ReadInstruction=32'b11000000101001110001100001101011;
#100 ReadInstruction=32'b11100011110010100010001101100011;
#100 ReadInstruction=32'b10000011101000101010110011000011;
#100 ReadInstruction=32'b11001111100101110001011000110000;
#100 ReadInstruction=32'b00011010111010101000111110011111;
#100 ReadInstruction=32'b11010001101111001001000100011111;
#100 ReadInstruction=32'b11010001101111001001000100011111;
#100 ReadInstruction=32'b10100111011101111010100000011111;
end

endmodule
