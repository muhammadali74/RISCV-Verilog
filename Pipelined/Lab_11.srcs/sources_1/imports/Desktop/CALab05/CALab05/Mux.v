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