`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/02 20:49:10
// Design Name: 
// Module Name: ClockDivider
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


module ClockDivider (
    clk_1hz,
    clk_100mhz,
    rst
);
  input clk_100mhz, rst;
  output reg clk_1hz;

  reg [26:0] cnt;
  localparam REVERSE = 50_000_000;
  always @(posedge clk_100mhz or posedge rst) begin
    if (rst) begin
      cnt <= 0;
      clk_1hz <= 0;
    end else begin
      if (cnt == (REVERSE - 1)) begin
        cnt <= 0;
        clk_1hz <= ~clk_1hz;
      end else begin
        cnt <= cnt + 1;
      end
    end
  end
endmodule
