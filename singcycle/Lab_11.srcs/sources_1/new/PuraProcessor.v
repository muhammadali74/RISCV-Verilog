`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 10:58:53 AM
// Design Name: 
// Module Name: PuraProcessor
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


module PuraProcessor(
    input clk,reset,
    output [63:0] PcOut_InstAddr,
    [31:0] Instr,
     [4:0] rs1,
     [4:0] rs2,
     [4:0] rd,
     [63:0] ReadData1,
     [63:0] ReadData2,
     [63:0] WriteData,
     [63:0] ImmData,
     [63:0] AluResult,
     [63:0] ReadMemData,
//     [63:0] ReadDataOne,
     Branch,MemRead,MemReg,MemWrite,AluSrc,RegWrite,
     [1:0] ALUOp,
     [3:0] Operation,
    [6:0] OpCode,
    [7:0] Arr1,
    [7:0] Arr2,
    [7:0] Arr3,
    [7:0] Arr4,
    [7:0] Arr5,
    [7:0] Arr6
    );
    wire [63:0]PC_in;
    wire [63:0] PcOut_InstAddr;
    wire [31:0] Instr;
    wire [6:0] OpCode;
    wire [63:0] Four_add;
    wire [63:0] Branch_add;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [4:0] rd;
    wire [63:0] ReadData1;
    wire [63:0] ReadData2;
    wire [63:0] WriteData;
    wire [63:0] ImmData;
    wire [63:0] Mux_Alu;
    wire [63:0] AluResult;
    wire [63:0] ReadMemData;
//    wire [63:0] ReadDataOne;
    wire Branch,MemRead,MemReg,MemWrite,AluSrc,RegWrite;
    wire [1:0] ALUOp;
    wire [3:0] Operation;
    reg [63:0] b=64'd4;
    wire branch_dec;
    wire Zero;
    wire [2:0] funct3;
    wire [6:0] funct7;
    
    wire [7:0] Arr1;
    wire [7:0] Arr2;
    wire [7:0] Arr3;
    wire [7:0] Arr4;
    wire [7:0] Arr5;
    wire [7:0] Arr6;
    
    
    
    assign branch_dec = Branch & Zero;
    
    
    
    
    Program_Counter pc(clk,reset,PC_in,PcOut_InstAddr);
    pc_adder add(PcOut_InstAddr,b,Four_add);
    pc_adder add2(PcOut_InstAddr, ImmData<<1 ,Branch_add); //tbd
    Mux branch(Four_add,Branch_add,branch_dec,PC_in);
    Instruction_Memory Mem(PcOut_InstAddr,Instr);
    InsParser Pars(Instr,OpCode,rd,funct3,rs1,rs2,funct7);
    registerFile REG(clk,reset,WriteData,rs1,rs2,rd,RegWrite,ReadData1,ReadData2);
    Control_Unit CU(OpCode, Branch, MemRead,MemReg,MemWrite,AluSrc, RegWrite,ALUOp);
    Mux ALU(ReadData2,ImmData,AluSrc, Mux_Alu);
    ALU_64 a64(Zero,ReadData1,Mux_Alu,Operation,AluResult);
    Data_Memory data(AluResult,ReadData2,clk,MemWrite,MemRead,ReadMemData, Arr1, Arr2, Arr3, Arr4, Arr5, Arr6);
    Mux wb(AluResult,ReadMemData,MemReg,WriteData);
    
    ImmGen IG(Instr,ImmData);
    ALU_Control aluct(ALUOp, {Instr[30], Instr[14:12]},Operation);
    
    
    
    
    
endmodule
