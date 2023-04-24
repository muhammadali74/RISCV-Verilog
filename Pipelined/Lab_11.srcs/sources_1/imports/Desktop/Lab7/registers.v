`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2023 04:28:19 PM
// Design Name: 
// Module Name: registers
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


module registerFile(
input clk,reset,
input [63:0] WriteData,
input [4:0] rs1,rs2,rd,
input RegWrite,
output [63:0] ReadData1,ReadData2
    );
    reg [63:0] register [31:0];
    integer i;
    initial begin
    for (i =0; i<32; i=i+1) begin
        register[i] = 0;
    end
    register[10] = 64'd12;
    end
    
    always @ (posedge clk or posedge reset)
    begin
        register[rd] = RegWrite?WriteData:register[rd];
        
        register[0] = reset?64'b0:register[0];
        register[1] = reset?64'b0:register[1];
        register[2] = reset?64'b0:register[2];
        register[3] = reset?64'b0:register[3];
        register[4] = reset?64'b0:register[4];
        register[5] = reset?64'b0:register[5];
        register[6] = reset?64'b0:register[6];
        register[7] = reset?64'b0:register[7];
        
        register[8] = reset?64'b0:register[8];
        register[9] = reset?64'b0:register[9];
        register[10] = reset?64'b0:register[10];
        register[11] = reset?64'b0:register[11];
        register[12] = reset?64'b0:register[12];
        register[13] = reset?64'b0:register[13];
        register[14] = reset?64'b0:register[14];
        register[15] = reset?64'b0:register[15];
        
        register[16] = reset?64'b0:register[16];
        register[17] = reset?64'b0:register[17];
        register[18] = reset?64'b0:register[18];
        register[19] = reset?64'b0:register[19];
        register[20] = reset?64'b0:register[20];
        register[21] = reset?64'b0:register[21];
        register[22] = reset?64'b0:register[22];
        register[23] = reset?64'b0:register[23];
        
        register[24] = reset?64'b0:register[24];
        register[25] = reset?64'b0:register[25];
        register[26] = reset?64'b0:register[26];
        register[27] = reset?64'b0:register[27];
        register[28] = reset?64'b0:register[28];
        register[29] = reset?64'b0:register[29];
        register[30] = reset?64'b0:register[30];
        register[31] = reset?64'b0:register[31];
    end
    
    assign ReadData1 = register[rs1];
    assign ReadData2 = register[rs2];
endmodule
