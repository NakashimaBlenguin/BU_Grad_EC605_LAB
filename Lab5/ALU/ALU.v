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
    Y,
    Z,
    clk,
    rst
);
  input [31:0] A;
  input [31:0] B;
  input [3:0] OPCODE;   
  input clk,rst;                                      
  output reg [31:0] Y;
  output reg Z;
  
  initial
  begin
    Z <=1'b0;
  end

  always @(posedge clk or posedge rst) begin
    if(rst)
    begin
        Y = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        Z =1'b0;
    end
    
    else
    begin
        case (OPCODE)
          4'b0000:  Y = A & B;
          4'b0001:  Y = A | B;
          4'b0010:  Y = A ^ B;
          4'b0011:  Y = ($signed(A)) >>> B;
          4'b0100:  Y = A << B;
          4'b0101:  Y = A - B;
          4'b0110:  Y = A + B ;
          4'b0111:  Y = (A < B) ? 1 : 0;
          4'b1000:  Y = B;
          default: Y = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        endcase
    
        Z = (Y == 32'b0000_0000_0000_0000_0000_0000_0000_0000) ? 1 : 0;
    end
  end

endmodule

