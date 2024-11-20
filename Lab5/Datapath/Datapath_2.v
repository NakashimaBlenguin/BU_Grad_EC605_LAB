`timescale 1ns / 1ps

/* 

The top module for the datapath instantiates all the other modules you created for task 1.
The module only takes clk and rst as inputs; all other logic is carried out by internal signals.
Below, each section declares necessary input and output wires for each module to instantiate when
they first appear. These wires may be used in other modules as well.

You may need to add additional logic and/or signals to implement your version of the datapath,
depending on your module designs for task 1 and the drawing you made for your datapath design.

*/

module Datapath(clk, rst);
    input clk, rst;
    
//----------------Program Counter----------------//
    
    wire [31:0] InstructionCountIn;
    wire [31:0] InstructionCountOut;
    Program_Counter PC(clk,rst,Immediate,InstructionCountOut,select_branch);
    
    // instantiate program counter

//----------------Instruction Memory----------------//    
    
    wire [31:0] ReadInstruction;
    Instruction_Memory IMem(InstructionCountOut, ReadInstruction);
    
    // instantiate instruction memory

//----------------Control Unit----------------//
    
    wire [4:0] ReadReg1Address, ReadReg2Address, WriteRegAddress;
    wire [31:0] Immediate;
    wire ALU_Src, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
    wire [3:0] ALU_Control;
    
    Control_Logic Control_Unit(clk,rst,ReadInstruction,ReadReg1Address, ReadReg2Address, WriteRegAddress,Immediate,ALU_Src, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALU_Control);
                                      
    // instantiate control unit

//----------------Register File----------------//

    /*
    Note: the register file module has two PARAMETERs. The instantiation of the register file also
    needs to set the size of the PARAMETERs; the proper format to do so is provided.
    */

    wire [31:0] ReadRegData1, ReadRegData2;
    wire [31:0] WriteRegData;
    Register_File Reg_File(ReadReg1Address, ReadReg2Address, WriteRegAddress, WriteRegData, RegWrite, ReadRegData1, ReadRegData2, clk, rst);
    // instantiate: Register_File #(32, 32) regfile(); // #(32, 32) sets the values of the PARAMETERs

//----------------ALU----------------//
    
    wire [31:0] ALU1, ALU2;
    wire [31:0] ALU_Out;
    wire zero;
    
    MUX M1(ReadRegData2,Immediate,ALU_Src,ALU2);
    ALU ALU_DP(ReadRegData1,ALU2,ALU_Control,ALU_Out,zero,clk,rst);


    // instantiate ALU
            
//----------------Branch Control----------------//
    
    wire select_branch;
    Branch_Control_Logic BCL(clk, rst, Branch, zero, select_branch,ReadInstruction[14:12]);
    
    // instantiate branch control unit

//----------------Data Memory----------------//

    wire [31:0] ReadMemData;
    Data_Memory DMem(ALU_Out[5:0], ReadRegData2, MemRead, MemWrite, ReadMemData, clk, rst);
    MUX M2(ALU_Out,ReadMemData,MemtoReg,WriteRegData);
    // instantiate: Data_Memory #( , ) DMem(); // remember to set the parameters for the data memory
    
endmodule
