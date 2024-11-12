module Data_Memory(Address, WriteData, MemoryRead, MemoryWrite, ReadData, clk, rst);

    parameter BITSIZE = 32;
    parameter MEMSIZE = 64;
    input [$clog2(MEMSIZE)-1:0] Address;
    input [BITSIZE-1:0] WriteData;
    input MemoryRead, MemoryWrite;
    output reg [BITSIZE-1:0] ReadData;
    input clk, rst;

    reg [BITSIZE-1:0] mem_file [MEMSIZE-1:0];   // Entire list of registers

    integer i;                                  // Used below to rst all registers
    
    always @(Address, mem_file[Address])
    begin
        if (MemoryRead)
            ReadData <= mem_file[Address];
    end

    always @(posedge clk or posedge rst)
        begin
            if (rst)
                for (i=0; i<MEMSIZE; i=i+1) mem_file[i] <= i; // rst all registers
            else
            begin        
                if (MemoryWrite)
                    mem_file[Address] <= WriteData; //If writeback is enabled and not register0.
            end
        end

endmodule
