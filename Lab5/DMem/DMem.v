module Data_Memory(
    input [$clog2(MEMSIZE)-1:0] Address,
    input [BITSIZE-1:0] WriteData,
    input MemoryRead, MemoryWrite,
    output reg [BITSIZE-1:0] ReadData,
    input clk, rst
);

    parameter BITSIZE = 32;
    parameter MEMSIZE = 64;
    
    reg [BITSIZE-1:0] mem_file [MEMSIZE-1:0];
    integer i;
    
    always @(*) begin
        if (MemoryWrite) begin
            mem_file[Address] = WriteData; 
        end
    end

    always @(*) begin
        if (MemoryRead)
            ReadData = mem_file[Address]; 
    end

    always @(posedge rst) begin
        if (rst) begin
            for (i = 0; i < MEMSIZE; i = i + 1)
                mem_file[i] <= i; 
        end
    end

endmodule
