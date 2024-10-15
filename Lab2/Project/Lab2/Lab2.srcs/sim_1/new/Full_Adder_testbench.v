`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2024 03:27:03 PM
// Design Name: 
// Module Name: Full_Adder_testbench
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


module Full_Adder_testbench(

    );
    reg A, B, Cin;
    wire Sum, Cout;
    
    Full_Adder FA1(.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));
    
    initial
    begin
        A=0;
        B=0;
        Cin=0;
        
        #100 A=0;B=0;Cin=0;
        #100 A=0;B=0;Cin=1;
        #100 A=0;B=1;Cin=0;
        #100 A=0;B=1;Cin=1;
        #100 A=1;B=0;Cin=0;
        #100 A=1;B=0;Cin=1;
        #100 A=1;B=1;Cin=0;
        #100 A=1;B=1;Cin=1;
        #100 $finish;
    end
endmodule
