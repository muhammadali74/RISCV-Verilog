`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2023 12:06:51 PM
// Design Name: 
// Module Name: ForwardingUnit
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


module ForwardingUnit(
    input [4:0] IDRs1,
    input [4:0] IDRs2,
    input MemRegWrite,
    input WBRegWrite,
    input [4:0] WBRd,
    input [4:0] MEMRd,
    output reg [1:0] ForwardA,
    output reg [1:0] ForwardB
    
    );
    
    always @(MEMRd or WBRd or MemRegWrite or WBRegWrite or IDRs1 or IDRs2)
  begin
    if ((MemRegWrite == 1) && (MEMRd != 0) && (MEMRd == IDRs1))  
            ForwardA <= 2'b10;
    else if ((WBRegWrite == 1) &&  (WBRd != 0)  && (WBRd == IDRs1) && !(MemRegWrite == 1 && MEMRd != 0 && MEMRd == IDRs1))	
            ForwardA <= 2'b01;
    else
            ForwardA <= 2'b00;
            
            
    if ((MemRegWrite == 1) && (MEMRd != 0) && (MEMRd == IDRs2))  
            ForwardB <= 2'b10;
    else if ((WBRegWrite == 1) &&  (WBRd != 0)  && (WBRd == IDRs2))	
            ForwardB <= 2'b01;
    else
            ForwardB <= 2'b00;
     
  end
    
    
    
    
    
    
    
endmodule
