`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/11 13:35:38
// Design Name: 
// Module Name: StateMachine_testbench
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


module Convertor_testbench(
    );
    reg clk,pause,rst;
    reg switch0,switch1,switch2,switch3,switch4,switch5,switch6,switch7,switch8,switch9;
    wire [9:0] sequence;
    Convertor SI_test(
        .clk(clk),
        .pause(pause),
        .rst(rst),
        .switch0(switch0),
        .switch1(switch1),
        .switch2(switch2),
        .switch3(switch3),
        .switch4(switch4),
        .switch5(switch5),
        .switch6(switch6),
        .switch7(switch7),
        .switch8(switch8),
        .switch9(switch9),
        .sequence(sequence)
    );
    
    always #50 clk=~clk;
    
    initial
    begin
    clk=0;
    rst=0;
    pause=0;
    switch0 = 1; switch1 = 0; switch2 = 1; switch3 = 0; switch4 = 1;
    switch5 = 0; switch6 = 1; switch7 = 0; switch8 = 1; switch9 = 0;
    
    #50   rst=1;
    #100   rst=0;
    switch0 = 0; switch1 = 0; switch2 = 0; switch3 = 0; switch4 = 0;
    switch5 = 0; switch6 = 0; switch7 = 0; switch8 = 0; switch9 = 0;
    #300   pause=1;
    #300   pause=0;
    #300   rst=1;
    #50   rst=0;
    end
    
endmodule
