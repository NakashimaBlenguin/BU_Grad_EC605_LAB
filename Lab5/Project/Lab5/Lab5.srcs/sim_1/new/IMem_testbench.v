`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/28 20:36:37
// Design Name: 
// Module Name: IMem_Testbench
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


module IMem_testbench(
    );
    reg [4:0] Address;
    wire [31:0] ReadData;
    
    Instruction_Memory IMEM_TEST(.Address(Address),.ReadData(ReadData));
    
    always #50 Address <= Address + 1;
    
    initial
    begin
    Address <= 0;
    end
endmodule
