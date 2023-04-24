module Mux
(
	input [63:0] a,
	input [63:0] b,
	input  sel,
	
	output reg [63:0]data_out
);

//assign data_out = sel? b:a ;

always @ (a, b, sel)
begin
	if (!sel)
		data_out = a;
	else
		data_out = b;
		
end

endmodule 




module Mux2
(
	input [63:0] a,
	input [63:0] b,
	input  sel,
	
	output reg [63:0]data_out
);

//assign data_out = sel? b:a ;

always @ (a, b, sel)
begin
	case (sel)
	1'b0: data_out = a;
	1'b1: data_out = b;
	1'bx: data_out = a;
	endcase
		
end

endmodule 



module Mux3
(
	input [63:0] a,
	input [63:0] b,
	input [63:0] c,
	input [1:0] sel,
	
	output reg [63:0] data_out
);

//assign data_out = sel? b:a ;

always @ (a, b, c, sel)
begin
	case (sel)
	2'b00: data_out = a;
	2'b01: data_out = b;
	2'b10: data_out = c;
	1'bx: data_out = a;
	endcase
		
end

endmodule 