`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 06:40:52 AM
// Design Name: 
// Module Name: branch_decision
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


module branch_decision(
    input branch,
    input zero,
    output reg dec
    );
    
    
//    initial begin
//    dec = 1'b0;
//    end
    
    always@(*)
    begin
//    case (zero)
//    1'b1: assign dec = branch & zero;
//    1'b0: assign dec = branch & zero;
//    1'bx: assign dec = 0;
//    endcase
    end
    
    
endmodule
