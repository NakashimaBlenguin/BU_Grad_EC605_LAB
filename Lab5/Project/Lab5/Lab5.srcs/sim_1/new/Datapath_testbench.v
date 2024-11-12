`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/08 10:55:03
// Design Name: 
// Module Name: Datapath_testbench
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


module Datapath_testbench(
    );
    reg clk, rst;
    Datapath DP_TEST(clk, rst);
    
    always #50 clk = ~clk;
    
    initial
    begin
    clk=0;rst=1;
    #50 rst=0;
    end
endmodule
