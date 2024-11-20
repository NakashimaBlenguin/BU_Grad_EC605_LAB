`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/03 15:40:13
// Design Name: 
// Module Name: Branch_Control_Logic
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


module Branch_Control_Logic(clk, rst, Branch, zero, select_branch,func3);
input clk, rst;
input Branch, zero,func3;
output reg select_branch;

initial
begin
    select_branch = 1'b0;
end

always @(*)
begin
    if(rst)
    begin
        select_branch <= 1'b0;
    end
    
    else
    begin
        if(func3==3'b000)
            select_branch <= Branch & zero;
        else if(func3==3'b001)
            select_branch <= Branch & (!zero);
    end
end

endmodule
