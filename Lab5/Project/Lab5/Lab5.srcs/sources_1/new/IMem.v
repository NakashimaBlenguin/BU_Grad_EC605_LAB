`timescale 1ns / 1ns
module Instruction_Memory(Address, ReadData);
    parameter BITSIZE = 32;
    parameter MEMSIZE = 32;
    input [$clog2(MEMSIZE)-1:0] Address;
    output reg [BITSIZE-1:0] ReadData;

    reg [BITSIZE-1:0] memory_file [0:MEMSIZE-1]; // Entire list of memory

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
            memory_file[i] = 32'b00000001000000000000000010110000;  // LUI x1, 0x1000
            i = i+1;
            memory_file[i] = 32'b00000000010000001000000100011111;  // ADDI x2, x1, 4
            i = i+1;
            memory_file[i] = 32'b11111111000000001001000110011111;  // ORI x3, x1, 0xFF0
            i = i+1;
            memory_file[i] = 32'b00000000111100011010001000011111;  // XORI x4, x3, 0xF
            i = i+1;
            memory_file[i] = 32'b00000000001100010001001011110011;  // ADD x5, x2, x3
            i = i+1;
            memory_file[i] = 32'b01000000001000101001001101110011;  // SUB x6, x5, x2
            i = i+1;
            memory_file[i] = 32'b00000000010100100000001111110011;  // AND x7, x4, x5
            i = i+1;
            memory_file[i] = 32'b00000000011100110100010001110011;  // XOR x8, x6, x7
            i = i+1;
            memory_file[i] = 32'b00000000000101000010010011110011;  // OR x9, x8, x1
            i = i+1;
            memory_file[i] = 32'b00000000001100010110010101110011;  // SLL x10, x2, x3
            i = i+1;
            memory_file[i] = 32'b00000000001001010101010111110011;  // SRA x11, x10, x2
            i = i+1;
            memory_file[i] = 32'b00000000011000101111011001110011;  // SLT x12, x5, x6
            i = i+1;
            memory_file[i] = 32'b00000000011000101000001001101011;  // BEQ x5, x6, label1
            i = i+1;
            memory_file[i] = 32'b00000000011100101001001001101011;  // BLT x5, x7, label2
            i = i+1;
            memory_file[i] = 32'b00000000010000001010000001100011;  // SW x4, 0(x1)
            i = i+1;
            memory_file[i] = 32'b00000000000000001010011011000011;  // LW x13, 0(x1)
            i = i+1;
            memory_file[i] = 32'b00000000000101101000011100011111;  // ADDI x14, x13, 1
            i = i+1;
            memory_file[i] = 32'b00000000000101110010011110011111;  // XORI x15, x14, 1
            i = i+1;
            memory_file[i] = 32'b11111110000000000000111111101011;  // BEQ x0, x0, loop (infinite loop)
        end
endmodule
