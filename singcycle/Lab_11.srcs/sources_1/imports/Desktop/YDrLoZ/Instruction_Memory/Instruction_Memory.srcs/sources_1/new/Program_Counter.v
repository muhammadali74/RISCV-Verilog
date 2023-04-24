`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2023 11:44:56 AM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(
    input clk,
    input reset,
    input [63:0] PC_in,
    output reg [63:0] PC_out
    );
    
    initial begin
     PC_out = 0;
     
    end
    
    always@(posedge clk)
    begin
        PC_out = PC_in;
        
        if (reset ==1)
            PC_out = 0;
   end
    
    
endmodule


module pc_adder(
    input [63:0] a,
    input [63:0] b,
    output reg [63:0] out
    );
    
    always@(*)
     out = a + b;
    
    
    
endmodule

