`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2023 12:07:30 PM
// Design Name: 
// Module Name: HazardDetection
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


module HazardDetection(
    input [4:0] IFIDRs1,
    input [4:0] IFIDRs2,
    input [4:0] IDEXRd,
    input IDEXMemRead,
    output reg PC_Write,
    output reg CU_Mux,
    output reg IFID_Write
    
    );
    
    always@(*)
    begin
      if (IDEXMemRead && ((IDEXRd ==IFIDRs1) ||(IDEXRd==IFIDRs2)))
        begin
          PC_Write=0;
          CU_Mux=0;
          IFID_Write=0;
        end
      else
        begin
          PC_Write=1;
          CU_Mux=1;
          IFID_Write=1;
        end
    end
endmodule
