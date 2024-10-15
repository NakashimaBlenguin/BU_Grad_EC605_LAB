`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2024 01:28:51 PM
// Design Name: 
// Module Name: Ripple_Carry_Adder
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


module Ripple_Carry_Adder (
    A,
    B,
    Cin,
    Sum,
    Cout
);
  input [7:0] A;
  input [7:0] B;
  input Cin;
  output [7:0] Sum;
  output Cout;
  wire w0, w1, w2, w3, w4, w5, w6;

  Full_Adder FA0 (
      A[0],
      B[0],
      Cin,
      Sum[0],
      w0
  );
  Full_Adder FA1 (
      A[1],
      B[1],
      w0,
      Sum[1],
      w1
  );
  Full_Adder FA2 (
      A[2],
      B[2],
      w1,
      Sum[2],
      w2
  );
  Full_Adder FA3 (
      A[3],
      B[3],
      w2,
      Sum[3],
      w3
  );
  Full_Adder FA4 (
      A[4],
      B[4],
      w3,
      Sum[4],
      w4
  );
  Full_Adder FA5 (
      A[5],
      B[5],
      w4,
      Sum[5],
      w5
  );
  Full_Adder FA6 (
      A[6],
      B[6],
      w5,
      Sum[6],
      w6
  );
  Full_Adder FA7 (
      A[7],
      B[7],
      w6,
      Sum[7],
      Cout
  );

endmodule
