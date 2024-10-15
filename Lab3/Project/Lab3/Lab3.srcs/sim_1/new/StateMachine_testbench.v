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


module StateMachine_testbench ();
  reg clk, rst, in, pause;
  wire [3:0] out;
  wire [2:0] leds;

  State_Machine SM_test (
      .clk(clk),
      .rst(rst),
      .in(in),
      .pause(pause),
      .out(out),
      .state(leds)
  );

  always #50 clk = ~clk;
  initial begin
    clk = 0;
    rst = 1;
    in = 0;
    pause = 0;
    #50 rst = 1'b0;
    #100 in = 1'b1;
    #100 in = 1'b0;
    #100 in = 1'b1;
    #100 in = 1'b0;
    #100 in = 1'b1;
    #100 in = 1'b0;
    #100 pause = 1'b1;
    in = 1'b1;
    #100 in = 1'b0;
    #100 in = 1'b1;
    #100 in = 1'b0;
    #100 pause = 1'b0;
    in = 1'b1;
    #100 in = 1'b0;
    #100 in = 1'b1;
    #100 in = 1'b0;
    #100 rst = 1'b1;
    #100 rst = 1'b0;
  end
endmodule
