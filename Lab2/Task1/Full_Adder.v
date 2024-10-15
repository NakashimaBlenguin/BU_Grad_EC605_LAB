`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2024 03:48:55 PM
// Design Name: 
// Module Name: Full_Adder
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


module Full_Adder(A,B,Cin,Sum,Cout);
    input A,B,Cin;
    output Sum,Cout;
    
    wire w0,w1,w2; 

    //assign Sum=A^B^Cin;
    //assign Cout= (A&&B)||(A&&Cin)||(B&&Cin);
    
    xor(Sum,A,B,Cin);
    and(w0,A,B);
    and(w1,A,Cin);
    and(w2,B,Cin);
    or(Cout,w0,w1,w2);

endmodule
