`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/04 17:41:58
// Design Name: 
// Module Name: BranchCtrlLog_testbench
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


module BranchCtrlLog_testbench(
    );
reg clk, rst;
reg Branch, zero;
wire select_branch;

Branch_Control_Logic BCL_TEST(clk, rst, Branch, zero, select_branch);

always #50 clk = ~clk;

initial
begin
    clk = 0;rst = 1;
    Branch = 0;
    zero = 0;
    #50 rst = 0; Branch = 1;
    #100 Branch = 0; zero = 1;
    #100 Branch = 1;
    #100 rst = 1;
    #100 rst = 0;
end

endmodule
