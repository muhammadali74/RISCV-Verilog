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
    [7:0] Arr6,
    branch_dec, Branch_exmem_out, Zero_exmem_out
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
    
    wire [63:0] ifid_pcin;
    wire [31:0] ifid_instr;
    wire ifid_write = 1;
    
   wire [63:0] PC_Out;
   wire [3:0] Funct_out;
   wire [1:0] ALUOp_out;
   wire MemtoReg_out; 
   wire RegWrite_out;
   wire Branch_out;
   wire MemWrite_out; 
   wire MemRead_out;
   wire ALUSrc_out;
   wire [63:0] ReadData1_out;
   wire [63:0]ReadData2_out;
   wire [4:0] rs1_out;
   wire [4:0] rs2_out;
   wire [4:0] rd_out;
   wire [63:0] immdata_out; 
   
   wire [63:0] data_out;
   wire [63:0] Branchadd_out;
   wire [4:0] rd_exmem_out;
   wire Branch_exmem_out;
   wire MemWrite_exmem_out;
   wire MemRead_exmem_out;
   wire MemtoReg_exmem_out; 
   wire RegWrite_exmem_out;
   wire [63:0] Result_exmem_out;
   wire Zero_exmem_out;
   
   wire MemtoReg_memwb_out; 
   wire RegWrite_memwb_out;
   wire [63:0] Result_memwb_out;
   wire [63:0]ReadMemData_out;
   wire [4:0] rd_memwb_out;
    
   
//    branch_decision bd(Branch_exmem_out, Zero_exmem_out, branch_dec);
    assign branch_dec = Branch_exmem_out & Zero_exmem_out;
   
    
    
    
    
    Program_Counter pc(clk,reset,PC_in,ifid_pcin);
    pc_adder add(ifid_pcin,b,Four_add);
    pc_adder add2(PC_Out, immdata_out<<1 ,Branch_add); //tbd
    Mux2 branch(Four_add,Branchadd_out,branch_dec,PC_in);
    Instruction_Memory Mem(ifid_pcin,ifid_instr);
    
    IFID ifid(clk, reset, ifid_pcin, ifid_instr, Instr, PcOut_InstAddr,ifid_write);
    
    IDEX idex(clk, reset, {Instr[30], Instr[14:12]}, ALUOp, MemReg, RegWrite, Branch, MemWrite, MemRead, AluSrc, ReadData1, ReadData2, rd, rs1, rs2, ImmData, PcOut_InstAddr,
    PC_Out, Funct_out, ALUOp_out, MemtoReg_out, RegWrite_out, Branch_out, MemWrite_out, MemRead_out, ALUSrc_out, 
    ReadData1_out, ReadData2_out, rs1_out, rs2_out, rd_out, immdata_out);
    
    EXMEM exmem(clk, reset, rd_out, Branch_out, MemWrite_out, MemRead_out, MemtoReg_out, RegWrite_out, Branch_add, AluResult, Zero, ReadData2_out,
    data_out, Branchadd_out, rd_exmem_out, Branch_exmem_out, MemWrite_exmem_out, MemRead_exmem_out, MemtoReg_exmem_out,
    RegWrite_exmem_out, Result_exmem_out, Zero_exmem_out);
    
    MEMWB memwb(clk, reset, Result_exmem_out, ReadMemData, rd_exmem_out, MemtoReg_exmem_out, RegWrite_exmem_out, 
    MemtoReg_memwb_out, RegWrite_memwb_out, Result_memwb_out, ReadMemData_out, rd_memwb_out);
    
    
    
    
    
    
    
    InsParser Pars(Instr,OpCode,rd,funct3,rs1,rs2,funct7);
    registerFile REG(clk,reset,WriteData,rs1,rs2,rd_memwb_out,RegWrite_memwb_out, ReadData1,ReadData2);
    Control_Unit CU(OpCode, Branch, MemRead,MemReg,MemWrite,AluSrc, RegWrite,ALUOp);
    Mux ALU(ReadData2_out,immdata_out,AluSrc_out, Mux_Alu);
    ALU_64 a64(Zero,ReadData1_out,Mux_Alu,Operation,AluResult);
    Data_Memory data(Result_exmem_out,data_out,clk,MemWrite_exmem_out,MemRead_exmem_out,ReadMemData, Arr1, Arr2, Arr3, Arr4, Arr5, Arr6);
    Mux wb(Result_memwb_out,ReadMemData_out,MemtoReg_memwb_out,WriteData);
    
    ImmGen IG(Instr,ImmData);
    ALU_Control aluct(ALUOp_out, Funct_out,Operation);
    
    
    
    
    
    
    
endmodule
