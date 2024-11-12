`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/28 22:10:52
// Design Name: 
// Module Name: Register_FIle_testbench
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


module Register_FIle_testbench(
    );
    parameter BITSIZE = 32;
    parameter REGSIZE = 32;
    reg [$clog2(REGSIZE)-1:0] ReadSelect1, ReadSelect2, WriteSelect;
    reg [BITSIZE-1:0] WriteData;
    reg WriteEnable;
    wire [BITSIZE-1:0] ReadData1, ReadData2;
    reg clk, rst;
    
    Register_File RG_TEST(.ReadSelect1(ReadSelect1), .ReadSelect2(ReadSelect2), .WriteSelect(WriteSelect), .WriteData(WriteData), .WriteEnable(WriteEnable), .ReadData1(ReadData1), .ReadData2(ReadData2), .clk(clk), .rst(rst));
    
    always 
    begin
        #50 clk=~clk;
    end
    
    initial
    begin
        clk=0;
        rst=1;
        ReadSelect1=5'b00001;
        ReadSelect2=5'b00010;
        WriteSelect=5'b00000;
        WriteData=32'b0000_0000_0000_0000_0000_0000_0000_0000;
        WriteEnable=1;
        #50 rst=0;WriteData=32'b0000_0000_0000_0000_0000_0000_0000_1000;WriteSelect=5'b00001;
        #100 WriteData=32'b0000_0000_0000_0000_0000_0000_1000_0000;WriteSelect=5'b00010;
        #100 WriteData=32'b0000_0000_0000_0000_0000_1000_0000_0000;WriteSelect=5'b00100;
        #100 WriteData=32'b0000_0000_0000_0000_1000_0000_0000_0000;WriteSelect=5'b01000;
        #100 WriteData=32'b0000_0000_0000_1000_0000_0000_0000_0000;WriteSelect=5'b10000;
        #100 WriteEnable=0;WriteData=32'b0000_0000_0000_0000_0000_0000_0000_0000;WriteSelect=5'b00000;
        #100 ReadSelect1=5'b00100;ReadSelect2=5'b01000;
        #100 ReadSelect1=5'b10000;ReadSelect2=5'b10000;
        #100 rst=1;
    end
endmodule
