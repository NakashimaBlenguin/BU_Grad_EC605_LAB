`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/15 21:54:53
// Design Name: 
// Module Name: Top_Module_testbench
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


module Top_Module_testbench(
    );
    reg clk,rst;
    reg [10:0] switches;
    wire [2:0] leds; 
    wire [6:0] seven_seg; 
    wire [3:0] seven_enable;
    
    Top_module TM_test(.clk(clk),.rst(rst),.switches(switches),.leds(leds),.seven_seg(seven_seg),.seven_enable(seven_enable));
    
    always #5 clk=~clk;
    
    initial
    begin
    clk=0;
    rst=0;
    switches=11'b01010101010;
    #250000000 rst=1'b1;
    #100000000 rst=1'b0;
    #1000000000 switches[10]=1'b1;
    #1000000000 switches[10]=1'b0;
    end
endmodule
