`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 11:21:44 AM
// Design Name: 
// Module Name: ALU_64
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

module ALU_64(
    output reg Zero, 
    input [63:0] a,
    input [63:0] b, 
    input [3:0] ALUOp,
    output reg [63:0] Result,
    output reg poss
    );
    
    always @(*)
    begin
    case (ALUOp)
    4'b0000: Result = a&b;
    4'b0001: Result = a|b;
    4'b0010: Result = a+b;
    4'b0110: Result = a-b;
    4'b1100: Result = ~(a|b);
    4'b1111: Result = a<b ? 0:1;
    default: Result = 0;
    
    endcase
    
    if (Result ==0)
    Zero = 1;
    else
    Zero = 0;
    
    poss <= ~Result[63];
    end
    
endmodule
