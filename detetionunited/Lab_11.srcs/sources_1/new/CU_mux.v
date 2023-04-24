`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 08:09:02 AM
// Design Name: 
// Module Name: CU_mux
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


module CU_mux(Mux_Write, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUOp, Branch_out, MemRead_out, MemtoReg_out, MemWrite_out, ALUSrc_out, RegWrite_out, ALUOp_out);
  
  input Mux_Write;
  input Branch;
  input MemRead;
  input MemtoReg;
  input MemWrite;
  input ALUSrc;
  input RegWrite;
  input [1:0] ALUOp;

  output reg Branch_out;
  output reg MemRead_out;
  output reg MemtoReg_out; 
  output reg MemWrite_out;
  output reg ALUSrc_out;
  output reg RegWrite_out;
  output reg [1:0] ALUOp_out;
  
  always@(*)
    begin
      if (~Mux_Write)
        begin
          Branch_out=0;
          MemRead_out=0;
          MemtoReg_out=0;
          MemWrite_out=0;
          ALUSrc_out=0;
          RegWrite_out=0;
          ALUOp_out=0;
        end
      else
        begin
          Branch_out=Branch;
          MemRead_out=MemRead;
          MemtoReg_out=MemtoReg;
          MemWrite_out=MemWrite;
          ALUSrc_out=ALUSrc;
          RegWrite_out=RegWrite;
          ALUOp_out=ALUOp;
        end
    end
endmodule
