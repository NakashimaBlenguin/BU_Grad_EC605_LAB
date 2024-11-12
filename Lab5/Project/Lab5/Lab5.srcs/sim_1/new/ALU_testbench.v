`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/28 19:44:21
// Design Name: 
// Module Name: ALU_testbench
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


module ALU_testbench(
    );
    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] OPCODE;
    reg clk,rst;
    wire [31:0] Y;
    wire Z;
    
    ALU ALU_TEST(
    .A(A),
    .B(B),
    .OPCODE(OPCODE),
    .Y(Y),
    .Z(Z),
    .clk(clk),
    .rst(rst)
    );
    
    always #50 clk = ~clk;
    
    initial
    begin
        A=32'b0000_1111_1010_1010_1010_1010_1010_1010;
        B=32'b0000_1111_0101_0101_0101_0101_0101_0101;
        OPCODE=4'b0000;
        clk=0;
        rst=1;
        #50 rst=0;
        #100 OPCODE=4'b0001;
        #100 OPCODE=4'b0010;
        #100 OPCODE=4'b0011;
        #100 OPCODE=4'b0100;
        #100 OPCODE=4'b0101;
        #100 OPCODE=4'b0110;
        #100 OPCODE=4'b0111;
        #100 rst=1'b1;
    end
    
endmodule
