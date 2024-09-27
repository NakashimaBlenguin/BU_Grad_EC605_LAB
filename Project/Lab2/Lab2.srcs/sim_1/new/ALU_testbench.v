`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/27 12:02:41
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
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] OPCODE;
    reg Cin;
    wire [3:0] Y;
    wire N,Z,C,V;
    
    ALU alu(A,B,OPCODE,Cin,Y,N,Z,C,V);
    
    initial
    begin
        A=4'b0000;
        B=4'b0000;
        OPCODE=3'b000;
        Cin=1'b0;
        #100  A=4'b0110;B=4'b0010;OPCODE=3'b000;Cin=1'b0;
        #100  A=4'b0110;B=4'b0010;OPCODE=3'b001;Cin=1'b0;
        #100  A=4'b0010;B=4'b0010;OPCODE=3'b010;Cin=1'b0;
        #100  A=4'b0110;B=4'b0010;OPCODE=3'b011;Cin=1'b0;
        #100  A=4'b0110;B=4'b0010;OPCODE=3'b100;Cin=1'b0;
        #100  A=4'b0110;B=4'b0011;OPCODE=3'b101;Cin=1'b0;
        #100  A=4'b0110;B=4'b0110;OPCODE=3'b101;Cin=1'b1;
        #100  A=4'b1100;B=4'b1010;OPCODE=3'b110;Cin=1'b0;
        #100  A=4'b1100;B=4'b1010;OPCODE=3'b110;Cin=1'b1;
        #100  A=4'b0001;B=4'b0010;OPCODE=3'b111;Cin=1'b0;
        #100  $finish;
    end
endmodule
