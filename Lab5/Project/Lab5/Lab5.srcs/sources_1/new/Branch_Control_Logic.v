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


module Branch_Control_Logic(clk, rst, Branch, zero, select_branch);
input clk, rst;
input Branch, zero;
output reg select_branch;

initial
begin
    select_branch = 1'b0;
end

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        select_branch <= 1'b0;
    end
    
    else
    begin
        select_branch <= Branch & zero;
    end
end

endmodule
