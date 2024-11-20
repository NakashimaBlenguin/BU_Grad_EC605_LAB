`timescale 1ns / 1ns
module Instruction_Memory(Address, ReadData);
    parameter BITSIZE = 32;
    parameter MEMSIZE = 32;
    input [$clog2(MEMSIZE)-1:0] Address;
    output reg [BITSIZE-1:0] ReadData;

    reg [BITSIZE-1:0] memory_file [MEMSIZE-1:0]; // Entire list of memory

    // Asynchronous read of memory
    always @(Address, memory_file[Address])
    begin
        ReadData = memory_file[Address];
    end

    integer i;
    // Initialize memory with new instruction set
    initial
        begin
        i = 0;
        memory_file[i] = 32'b000000000101_00000_010_00001_0011111; 
        
        i = i+1;
        memory_file[i] = 32'b0000000_00001_00001_001_00010_1110011; 
        
        i = i+1;
        memory_file[i] = 32'b00000000000000000111_00011_0110000; 
        
        i = i+1;
        memory_file[i] = 32'b0000000_00001_00011_110_00100_1110011; 
        
        i = i+1;
        memory_file[i] = 32'b0000000_00000_00001_001_00101_1110011; 
        
        i = i+1;
        memory_file[i] = 32'b0_000000_00101_00001_000_0001_0_1101011; 
        
        i = i+1;
        memory_file[i] = 32'b0000000_00001_00100_010_00100_1110011; 
        
        i = i+1;
        memory_file[i] = 32'b0000000_00100_00001_010_01001_1100011; 
        
        i = i+1;
        memory_file[i] = 32'b0_000000_00000_00010_001_0011_0_1101011; 
        
        i = i+1;
        memory_file[i] = 32'b000000001001_00001_010_00001_1000011; 
        end
endmodule
