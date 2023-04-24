`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 12:00:45 PM
// Design Name: 
// Module Name: tbPuraProcessor
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


module tbPuraProcessor(

    );
    reg clk,reset;
//    wire [63:0]PC_in;
    wire [63:0] PcOut_InstAddr;
    wire [31:0] Instr;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [4:0] rd;
    wire [63:0] ReadData1;
    wire [63:0] ReadData2;
    wire [63:0] WriteData;
    wire [63:0] ImmData;
    wire [63:0] AluResult;
    wire [63:0] ReadMemData;
//    wire [63:0] ReadDataOne;
    wire Branch,MemRead,MemReg,MemWrite,AluSrc,RegWrite;
    wire [1:0] ALUOp;
    wire [3:0] Operation;
    wire [6:0] OpCode;
    wire [7:0] Arr1;
    wire [7:0] Arr2;
    wire [7:0] Arr3;
    wire [7:0] Arr4;
    wire [7:0] Arr5;
    wire [7:0] Arr6;
    wire branch_dec;
    wire [4:0] rd_memwb_out;
    wire [63:0] Result_memwb_out;
    wire MemtoReg_memwb_out;
    wire RegWrite_memwb_out;
    wire [63:0] alu1;
    wire [63:0] alu2;
    wire [1:0] fwdb;
    wire Branch_exmem_out;
    wire Zero_exmem_out;
    
    PuraProcessor PP(clk,reset, PcOut_InstAddr,
    Instr,
    rs1,
    rs2,
    rd,
    ReadData1,
     ReadData2,
    WriteData,
    ImmData,
    AluResult,
    ReadMemData,
//    ReadDataOne,
    Branch,MemRead,MemReg,MemWrite,AluSrc,RegWrite,
    ALUOp,
    Operation,OpCode, Arr1, Arr2, Arr3, Arr4, Arr5, Arr6, branch_dec, rd_memwb_out, Result_memwb_out, MemtoReg_memwb_out,
    RegWrite_memwb_out, alu1, alu2, fwdb, Branch_exmem_out, Zero_exmem_out);
    
    initial begin
    reset=0;
    clk=0;
    end
    always 
    #5 clk =~clk;
    
    
endmodule
