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


module ClockDivider_test ();
  reg clk_100mhz, rst;
  wire clk_1hz;
  ClockDivider CD_test (
      .clk_1hz(clk_1hz),
      .clk_100mhz(clk_100mhz),
      .rst(rst)
  );

  always #1 clk_100mhz = ~clk_100mhz;

  initial begin
    clk_100mhz = 0;
    rst = 1;
    #50000000 rst = 0;
  end
endmodule
