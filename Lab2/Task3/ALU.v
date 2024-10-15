`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2024 01:40:22 PM
// Design Name: 
// Module Name: ALU
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


module ALU (
    A,
    B,
    OPCODE,
    Cin,
    Y,
    N,
    Z,
    C,
    V
);
  input [3:0] A;
  input [3:0] B;
  input [2:0] OPCODE;
  input Cin;
  output reg [3:0] Y;
  output reg N, Z, C, V;

  always @(*) begin
    N = 0;
    Z = 0;
    C = 0;
    V = 0;
    case (OPCODE)
      3'b000:  Y = A & B;
      3'b001:  Y = A | B;
      3'b010:  Y = A ^ B;
      3'b011:  Y = ($signed(A)) >>> B;
      3'b100:  Y = A << B;
      3'b101:  {C, Y} = A - B - Cin;
      3'b110:  {C, Y} = A + B + Cin;
      3'b111:  Y = (A < B) ? 1 : 0;
      default: Y = 4'b0000;
    endcase

    N = (Y[3] == 1) ? 1 : 0;
    Z = (Y == 4'b0000) ? 1 : 0;
    if (OPCODE == 3'b101) begin
      V = ((A[3] == B[3]) && (Y[3] != A[3])) ? 1 : 0;
    end

    if (OPCODE == 3'b110) begin
      V = ((A[3] != B[3]) && (Y[3] != A[3])) ? 1 : 0;
    end
  end

endmodule

