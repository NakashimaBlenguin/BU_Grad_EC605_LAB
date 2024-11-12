`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/04 17:12:10
// Design Name: 
// Module Name: PC_testbench
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


module PC_testbench(
    );
    reg clk,rst;
    reg [31:0] InstructionCountIn;
    wire [31:0] InstructionCountOut;
    reg select_branch;
    
    always #50 clk = ~clk;
    
    Program_Counter PC_TEST(clk,rst,InstructionCountIn,InstructionCountOut,select_branch);
    
    initial
    begin
    clk = 0; rst = 1;
    InstructionCountIn = 32'b0101_0101_0101_0101_0101_0101_0101_0101;
    select_branch=0;
    #50 rst=0;
    #500 select_branch=1;
    #100 select_branch=0;
    #500 rst = 1;
    #100 rst = 0;
    end
endmodule
