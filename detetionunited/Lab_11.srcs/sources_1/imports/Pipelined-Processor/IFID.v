module IFID(clk, reset, PC_In, Inst_input,	Inst_output, PC_Out, IFIDWrite, flush);
  
  input wire clk;
  input reset;
  input wire [63:0] PC_In;
  input  [31:0] Inst_input;
  input wire IFIDWrite;
  output reg [31:0]Inst_output;
  output reg [63:0] PC_Out;
  input flush;
  
  always @ (posedge clk or posedge reset)
    begin
    if (reset)
      begin
         PC_Out <= PC_Out; 
         Inst_output <= 0;
      end
     else if (~IFIDWrite) 
        begin
          PC_Out <= PC_Out;
          Inst_output <= Inst_output;
        end
     else 
       begin
         PC_Out = PC_In;
         Inst_output <= Inst_input;
       end
       
       if (flush) begin
      Inst_output <= 32'd0;
    end
    end
endmodule
