`timescale 1ns/1ps

//module Control_Unit
//(
//	input [6:0] Opcode,
//	output reg Branch, reg MemRead, reg MemtoReg, reg MemWrite, reg ALUSrc, RegWrite, reg [1:0] ALUOp
//);

//	always @ (Opcode)
//	begin
//		case (Opcode)
//			7'b0110011: //R type
//				begin
//					Branch = 0;
//					MemRead = 0;
//					MemtoReg = 0;
//					MemWrite = 0;
//					ALUSrc = 0;
//					RegWrite = 1;
//					ALUOp = 2'b10;
//				end
//			7'b0000011: //ld
//				begin
//					Branch = 0;
//					MemRead = 1;
//					MemtoReg = 1;
//					MemWrite = 0;
//					ALUSrc = 1;
//					RegWrite = 1;
//					ALUOp = 2'b00;
//				end
//			7'b0010011: //addi
//				begin
//					Branch = 0;
//					MemRead = 0;
//					MemtoReg = 0;
//					MemWrite = 0;
//					ALUSrc = 1;
//					RegWrite = 1;
//					ALUOp = 2'b00;
//				end
//			7'b0100011: // I type SD
//				begin
//					Branch = 0;
//					MemRead = 0;
//					MemtoReg = 1'bx;
//					MemWrite = 1;
//					ALUSrc = 1;
//					RegWrite = 0;
//					ALUOp = 2'b00;
//				end
//			7'b1100011:  //SB
//				begin
//					Branch = 1;
//					MemRead = 0;
//					MemtoReg = 1'bx;
//					MemWrite = 0;
//					ALUSrc = 0;
//					RegWrite = 0;
//					ALUOp = 2'b01;
//				end
//		endcase
//	end
module Control_Unit(
    input [6:0] Opcode,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg AluSrc,
    output reg RegWrite,
    output reg [1:0] AluOp
    );
    
    always@(Opcode)
    begin
    case(Opcode)
    7'b0110011: begin
    assign AluSrc = 1'b0;
    assign MemtoReg = 1'b0;
    assign RegWrite = 1'b1;
    assign MemRead  = 1'b0;
    assign MemWrite = 1'b0;
    assign Branch = 1'b0;
    assign AluOp = 2'b10;
    end
    
    7'b0000011: begin
    assign AluSrc = 1'b1;
     assign MemtoReg = 1'b1;
    assign  RegWrite = 1'b1;
     assign MemRead  = 1'b1;
    assign  MemWrite = 1'b0;
    assign  Branch = 1'b0;
    assign  AluOp = 2'b00;
    end
    
    7'b0100011: begin
    assign AluSrc = 1'b1;
    assign MemtoReg = 1'bx;
    assign RegWrite = 1'b0;
    assign MemRead  = 1'b0;
    assign MemWrite = 1'b1;
    assign Branch = 1'b0;
    assign AluOp = 2'b00;
    end
    
    7'b1100011: begin
    assign AluSrc = 1'b0;
    assign MemtoReg = 1'bx;
    assign RegWrite = 1'b0;
    assign MemRead  = 1'b0;
    assign MemWrite = 1'b0;
    assign Branch = 1'b1;
    assign AluOp = 2'b01;
    end
    
    7'b1100011: begin
    assign AluSrc = 1'b0;
    assign MemtoReg = 1'bx;
    assign RegWrite = 1'b0;
    assign MemRead  = 1'b0;
    assign MemWrite = 1'b0;
    assign Branch = 1'b1;
    assign AluOp = 2'b01;
    end
    
    7'b0010011: begin
    assign AluSrc = 1'b1;
    assign MemtoReg = 1'b0;
    assign RegWrite = 1'b1;
    assign MemRead  = 1'b0;
    assign MemWrite = 1'b0;
    assign Branch = 1'b0;
    assign AluOp = 2'b00;
    end

    endcase
    
    end
endmodule

 