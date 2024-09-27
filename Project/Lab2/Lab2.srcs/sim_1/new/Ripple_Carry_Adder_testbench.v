`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/27 11:17:09
// Design Name: 
// Module Name: Ripple_Carry_Adder_testbench
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


module Ripple_Carry_Adder_testbench(
    );
    reg [7:0] A;
    reg [7:0] B;
    reg Cin;
    wire [7:0] Sum;
    wire Cout;
    
    Ripple_Carry_Adder RCA1(.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
    
    initial
    begin
        A=8'b00000000;
        B=8'b00000000;
        Cin=1'b0;    
        
        #100 A=8'b00000000;B=8'b00000000;Cin=1'b1; 
         
        #100 A=8'b11111111;B=8'b00000001;Cin=1'b0;  
        #100 A=8'b11111111;B=8'b00000001;Cin=1'b1; 
         
        #100 A=8'b00000010;B=8'b00000001;Cin=1'b0;  
        #100 A=8'b00000010;B=8'b00000001;Cin=1'b1; 
         
        #100 A=8'b01111111;B=8'b00000001;Cin=1'b0;  
        #100 A=8'b01111111;B=8'b00000001;Cin=1'b1; 
         
        #100 A=8'b10000000;B=8'b10000000;Cin=1'b0;  
        #100 A=8'b10000000;B=8'b10000000;Cin=1'b1;  
        
        #100 A=8'b10101010;B=8'b01010101;Cin=1'b0;  
        #100 A=8'b10101010;B=8'b01010101;Cin=1'b1;  
        
        #100 A=8'b11111111;B=8'b11111111;Cin=1'b0;  
        #100 A=8'b11111111;B=8'b11111111;Cin=1'b1;  
        
        #100 A=8'b10000000;B=8'b01000000;Cin=1'b0;  
        #100 A=8'b10000000;B=8'b01000000;Cin=1'b1;
          
        #100 A=8'b11010101;B=8'b00101110;Cin=1'b0;  
        #100 A=8'b11010101;B=8'b00101110;Cin=1'b1;  
        
        #100 $finish;
    end
endmodule
