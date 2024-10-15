`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/02 20:29:04
// Design Name: 
// Module Name: Task1
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


module Convertor(clk, pause, rst, sequence, switch0,switch1,switch2,switch3,switch4,switch5,switch6,switch7,switch8,switch9);
    input clk, pause, rst;
    input switch0,switch1,switch2,switch3,switch4,switch5,switch6,switch7,switch8,switch9;
    output reg [9:0] sequence;

    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            sequence[9]<=switch9;
            sequence[8]<=switch8;
            sequence[7]<=switch7;
            sequence[6]<=switch6;
            sequence[5]<=switch5;
            sequence[4]<=switch4;
            sequence[3]<=switch3;
            sequence[2]<=switch2;
            sequence[1]<=switch1;
            sequence[0]<=switch0;
        end
        
        else if(pause == 1'b1)
        begin
            sequence <= sequence;
        end
        
        else
        begin
            sequence <= sequence << 1;
        end
    end


endmodule
