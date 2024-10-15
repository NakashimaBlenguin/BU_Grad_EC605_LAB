`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/03 11:25:03
// Design Name: 
// Module Name: State_Machine
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


module State_Machine (
    clk,
    rst,
    in,
    pause,
    out,
    state
);
  input clk, rst;
  input in, pause;
  output reg [3:0] out;
  output reg [2:0] state;


  always @(posedge clk or posedge rst) begin
    if (rst) begin
      out   <= 4'b0000;
      state <= 3'b000;
    end else begin

      if (pause) begin
        state <= state;
      end else begin
        case (state)
          3'b000:  state <= (in == 1'b1) ? 3'b001 : 3'b000;
          3'b001:  state <= (in == 1'b1) ? 3'b001 : 3'b010;
          3'b010:  state <= (in == 1'b1) ? 3'b101 : 3'b000;
          3'b101: begin
            state <= (in == 1'b1) ? 3'b001 : 3'b010;
            out   <= out + 4'b0001;
          end
          default: state <= state;
        endcase
      end
    end
  end

endmodule
