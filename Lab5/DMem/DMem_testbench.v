`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/29 18:48:47
// Design Name: 
// Module Name: DMem_testbench
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


module DMem_testbench(
    );
    parameter BITSIZE = 32;
    parameter MEMSIZE = 64;
    reg [$clog2(MEMSIZE)-1:0] Address;
    reg [BITSIZE-1:0] WriteData;
    reg MemoryRead, MemoryWrite;
    wire [BITSIZE-1:0] ReadData;
    reg clk, rst;
    
    Data_Memory DMEM_TEST(.Address(Address), .WriteData(WriteData), .MemoryRead(MemoryRead), .MemoryWrite(MemoryWrite), .ReadData(ReadData), .clk(clk), .rst(rst));
    
    always #50 clk = ~clk;
    
    initial
    begin
    clk=0;
    rst=1;
    Address=5'b00000;
    WriteData=32'b0000_0000_0000_0000_0000_0000_0000_0000;
    MemoryRead=0;
    MemoryWrite=0;
    #50 rst=0;MemoryRead=1;Address=5'b00001;
    #100 Address=5'b00010;
    #100 Address=5'b00100;
    #100 Address=5'b01000;
    #100 Address=5'b10000;
    #100 MemoryRead=0;MemoryWrite=1;Address=5'b00001;
    #100 Address=5'b00010;
    #100 Address=5'b00100;
    #100 Address=5'b01000;
    #100 Address=5'b10000;
    #100 MemoryRead=1;MemoryWrite=0;Address=5'b00001;
    #100 Address=5'b00010;
    #100 Address=5'b00100;
    #100 Address=5'b01000;
    #100 Address=5'b10000;
    end
endmodule
