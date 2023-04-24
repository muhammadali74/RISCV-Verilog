`timescale 1ns/1ps
module Data_Memory
(
	input [63:0] Mem_Addr,
	input [63:0] Write_Data,
	input clk, MemWrite, MemRead,
	output reg [63:0] Read_Data,
	output reg [7:0] Arr1,
	output reg [7:0] Arr2,
	output reg [7:0] Arr3,
	output reg [7:0] Arr4,
	output reg [7:0] Arr5,
	output reg [7:0] Arr6
);



	reg [7:0] DataMemory [304:0];

	initial
	begin
		DataMemory[0] = 8'h0;
        DataMemory[1] = 8'h0;
        DataMemory[2] = 8'h0;
        DataMemory[3] = 8'h0;
        DataMemory[4] = 8'h0;
        DataMemory[5] = 8'h0;
        DataMemory[6] = 8'h0;
        DataMemory[7] = 8'h0;
        DataMemory[8] = 8'h0;
        DataMemory[9] = 8'h0;
        DataMemory[10] = 8'h0;
        DataMemory[11] = 8'h0;
        DataMemory[12] = 8'h0;
        DataMemory[13] = 8'h0;
        DataMemory[14] = 8'h0;
        DataMemory[15] = 8'h0;
        DataMemory[16] = 8'h0;
        DataMemory[17] = 8'h0;
        DataMemory[18] = 8'h0;
        DataMemory[19] = 8'h0;
        DataMemory[20] = 8'h0;
        DataMemory[21] = 8'h0;
        DataMemory[22] = 8'h0;
        DataMemory[23] = 8'h0;
        DataMemory[24] = 8'h0;
        DataMemory[25] = 8'h0;
        DataMemory[26] = 8'h0;
        DataMemory[27] = 8'h0;
        DataMemory[28] = 8'h0;
        DataMemory[29] = 8'h0;
        DataMemory[30] = 8'h0;
        DataMemory[31] = 8'h0;
        DataMemory[32] = 8'h0;
        DataMemory[33] = 8'h0;
        DataMemory[34] = 8'h0;
        DataMemory[35] = 8'h0;
        DataMemory[36] = 8'h0;
        DataMemory[37] = 8'h0;
        DataMemory[38] = 8'h0;
        DataMemory[39] = 8'h0;
        DataMemory[40] = 8'h0;
        DataMemory[41] = 8'h0;
        DataMemory[42] = 8'h0;
        DataMemory[43] = 8'h0;
        DataMemory[44] = 8'h0;
        DataMemory[45] = 8'h0;
        DataMemory[46] = 8'h0;
        DataMemory[47] = 8'h0;
        DataMemory[48] = 8'h0;
        DataMemory[49] = 8'h0;
        DataMemory[50] = 8'h0;
        DataMemory[51] = 8'h0;
        DataMemory[52] = 8'h0;
        DataMemory[53] = 8'h0;
        DataMemory[54] = 8'h0;
        DataMemory[55] = 8'h0;
        DataMemory[56] = 8'h0;
        DataMemory[57] = 8'h0;
        DataMemory[58] = 8'h0;
        DataMemory[59] = 8'h0;
        DataMemory[60] = 8'h0;
        DataMemory[61] = 8'h0;
        DataMemory[62] = 8'h0;
        DataMemory[63] = 8'h0;
                
        DataMemory[64] = 8'h0;
        DataMemory[65] = 8'h0;
        DataMemory[66] = 8'h0;
        DataMemory[67] = 8'h0;
        DataMemory[68] = 8'h0;
        DataMemory[69] = 8'h0;
        DataMemory[70] = 8'h0;
        DataMemory[71] = 8'h0;
        DataMemory[72] = 8'h0;
        DataMemory[73] = 8'h0;
        DataMemory[74] = 8'h0;
        DataMemory[75] = 8'h0;
        DataMemory[76] = 8'h0;
        DataMemory[77] = 8'h0;
        DataMemory[78] = 8'h0;
        DataMemory[79] = 8'h0;
        DataMemory[80] = 8'h0;
        DataMemory[81] = 8'h0;
        DataMemory[82] = 8'h0;
        DataMemory[83] = 8'h0;
        DataMemory[84] = 8'h0;
        DataMemory[85] = 8'h0;
        DataMemory[86] = 8'h0;
        DataMemory[87] = 8'h0;
        DataMemory[88] = 8'h0;
        DataMemory[89] = 8'h0;
        DataMemory[90] = 8'h0;
        DataMemory[91] = 8'h0;
        DataMemory[92] = 8'h0;
        DataMemory[93] = 8'h0;
        DataMemory[94] = 8'h0;
        DataMemory[95] = 8'h0;
        DataMemory[96] = 8'h0;
        DataMemory[97] = 8'h0;
        DataMemory[98] = 8'h0;
        DataMemory[99] = 8'h0;
        DataMemory[100] = 8'h0;
        DataMemory[101] = 8'h0;
        DataMemory[102] = 8'h0;
        DataMemory[103] = 8'h0;
        DataMemory[104] = 8'h0;
        DataMemory[105] = 8'h0;
        DataMemory[106] = 8'h0;
        DataMemory[107] = 8'h0;
        DataMemory[108] = 8'h0;
        DataMemory[109] = 8'h0;
        DataMemory[110] = 8'h0;
        DataMemory[111] = 8'h0;
        DataMemory[112] = 8'h0;
        DataMemory[113] = 8'h0;
        DataMemory[114] = 8'h0;
        DataMemory[115] = 8'h0;
        DataMemory[116] = 8'h0;
        DataMemory[117] = 8'h0;
        DataMemory[118] = 8'h0;
        DataMemory[119] = 8'h0;
        DataMemory[120] = 8'h0;
        DataMemory[121] = 8'h0;
        DataMemory[122] = 8'h0;
        DataMemory[123] = 8'h0;
        DataMemory[124] = 8'h0;
        DataMemory[125] = 8'h0;
        DataMemory[126] = 8'h0;
        DataMemory[127] = 8'h0;
        DataMemory[128] = 8'h0;
        DataMemory[129] = 8'h0;
        DataMemory[130] = 8'h0;
        DataMemory[131] = 8'h0;
        DataMemory[132] = 8'h0;
        DataMemory[133] = 8'h0;
        DataMemory[134] = 8'h0;
        DataMemory[135] = 8'h0;
        DataMemory[136] = 8'h0;
        DataMemory[137] = 8'h0;
        DataMemory[138] = 8'h0;
        DataMemory[139] = 8'h0;
        DataMemory[140] = 8'h0;
        DataMemory[141] = 8'h0;
        DataMemory[142] = 8'h0;
        DataMemory[143] = 8'h0;
        DataMemory[144] = 8'h0;
        DataMemory[145] = 8'h0;
        DataMemory[146] = 8'h0;
        DataMemory[147] = 8'h0;
        DataMemory[148] = 8'h0;
        DataMemory[149] = 8'h0;
        DataMemory[150] = 8'h0;
        DataMemory[151] = 8'h0;
        DataMemory[152] = 8'h0;
        DataMemory[153] = 8'h0;
        DataMemory[154] = 8'h0;
        DataMemory[155] = 8'h0;
        DataMemory[156] = 8'h0;
        DataMemory[157] = 8'h0;
        DataMemory[158] = 8'h0;
        DataMemory[159] = 8'h0;
        DataMemory[160] = 8'h0;
        DataMemory[161] = 8'h0;
        DataMemory[162] = 8'h0;
        DataMemory[163] = 8'h0;
        DataMemory[164] = 8'h0;
        DataMemory[165] = 8'h0;
        DataMemory[166] = 8'h0;
        DataMemory[167] = 8'h0;
        DataMemory[168] = 8'h0;
        DataMemory[169] = 8'h0;
        DataMemory[170] = 8'h0;
        DataMemory[171] = 8'h0;
        DataMemory[172] = 8'h0;
        DataMemory[173] = 8'h0;
        DataMemory[174] = 8'h0;
        DataMemory[175] = 8'h0;
        DataMemory[176] = 8'h0;
        DataMemory[177] = 8'h0;
        DataMemory[178] = 8'h0;
        DataMemory[179] = 8'h0;
        DataMemory[180] = 8'h0;
        DataMemory[181] = 8'h0;
        DataMemory[182] = 8'h0;
        DataMemory[183] = 8'h0;
        DataMemory[184] = 8'h0;
        DataMemory[185] = 8'h0;
        DataMemory[186] = 8'h0;
        DataMemory[187] = 8'h0;
        DataMemory[188] = 8'h0;
        DataMemory[189] = 8'h0;
        DataMemory[190] = 8'h0;
        DataMemory[191] = 8'h0;
        DataMemory[192] = 8'h0;
        DataMemory[193] = 8'h0;
        DataMemory[194] = 8'h0;
        DataMemory[195] = 8'h0;
        DataMemory[196] = 8'h0;
        DataMemory[197] = 8'h0;
        DataMemory[198] = 8'h0;
        DataMemory[199] = 8'h0;
        DataMemory[200] = 8'h0;
        DataMemory[201] = 8'h0;
        DataMemory[202] = 8'h0;
        DataMemory[203] = 8'h0;
        DataMemory[204] = 8'h0;
        DataMemory[205] = 8'h0;
        DataMemory[206] = 8'h0;
        DataMemory[207] = 8'h0;
        DataMemory[208] = 8'h0;
        DataMemory[209] = 8'h0;
        DataMemory[210] = 8'h0;
        DataMemory[211] = 8'h0;
        DataMemory[212] = 8'h0;
        DataMemory[213] = 8'h0;
        DataMemory[214] = 8'h0;
        DataMemory[215] = 8'h0;
        DataMemory[216] = 8'h0;
        DataMemory[217] = 8'h0;
        DataMemory[218] = 8'h0;
        DataMemory[219] = 8'h0;
        DataMemory[220] = 8'h0;
        DataMemory[221] = 8'h0;
        DataMemory[222] = 8'h0;
        DataMemory[223] = 8'h0;
        DataMemory[224] = 8'h0;
        DataMemory[225] = 8'h0;
        DataMemory[226] = 8'h0;
        DataMemory[227] = 8'h0;
        DataMemory[228] = 8'h0;
        DataMemory[229] = 8'h0;
        DataMemory[230] = 8'h0;
        DataMemory[231] = 8'h0;
        DataMemory[232] = 8'h0;
        DataMemory[233] = 8'h0;
        DataMemory[234] = 8'h0;
        DataMemory[235] = 8'h0;
        DataMemory[236] = 8'h0;
        DataMemory[237] = 8'h0;
        DataMemory[238] = 8'h0;
        DataMemory[239] = 8'h0;
        DataMemory[240] = 8'h0;
        DataMemory[241] = 8'h0;
        DataMemory[242] = 8'h0;
        DataMemory[243] = 8'h0;
        DataMemory[244] = 8'h0;
        DataMemory[245] = 8'h0;
        DataMemory[246] = 8'h0;
        DataMemory[247] = 8'h0;
        DataMemory[248] = 8'h0;
        DataMemory[249] = 8'h0;
        DataMemory[250] = 8'h0;
        DataMemory[251] = 8'h0;
        DataMemory[252] = 8'h0;
        DataMemory[253] = 8'h0;
        DataMemory[254] = 8'h0;
        DataMemory[255] = 8'h0;
        DataMemory[256] = 8'h06;
        DataMemory[257] = 8'h0;
        DataMemory[258] = 8'h0;
        DataMemory[259] = 8'h0;
        DataMemory[260] = 8'h0;
        DataMemory[261] = 8'h0;
        DataMemory[262] = 8'h0;
        DataMemory[263] = 8'h0;
        DataMemory[264] = 8'h05;
        DataMemory[265] = 8'h0;
        DataMemory[266] = 8'h0;
        DataMemory[267] = 8'h0;
        DataMemory[268] = 8'h0;
        DataMemory[269] = 8'h0;
        DataMemory[270] = 8'h0;
        DataMemory[271] = 8'h0;
        DataMemory[272] = 8'h03;
        DataMemory[273] = 8'h0;
        DataMemory[274] = 8'h0;
        DataMemory[275] = 8'h0;
        DataMemory[276] = 8'h0;
        DataMemory[277] = 8'h0;
        DataMemory[278] = 8'h0;
        DataMemory[279] = 8'h0;
        DataMemory[280] = 8'h02;
        DataMemory[281] = 8'h0;
        DataMemory[282] = 8'h0;
        DataMemory[283] = 8'h0;
        DataMemory[284] = 8'h0;
        DataMemory[285] = 8'h0;
        DataMemory[286] = 8'h0;
        DataMemory[287] = 8'h0;
        DataMemory[288] = 8'h01;
        DataMemory[289] = 8'h0;
        DataMemory[290] = 8'h0;
        DataMemory[291] = 8'h0;
        DataMemory[292] = 8'h0;
        DataMemory[293] = 8'h0;
        DataMemory[294] = 8'h0;
        DataMemory[295] = 8'h0;
        DataMemory[296] = 8'h0;
        DataMemory[297] = 8'h0;
        DataMemory[298] = 8'h0;
        DataMemory[299] = 8'h0;
        DataMemory[300] = 8'h0;
            end
	
	always @ (*)
	begin
		if (MemRead)
		begin
			assign Read_Data = {DataMemory[Mem_Addr+7],DataMemory[Mem_Addr+6],DataMemory[Mem_Addr+5],DataMemory[Mem_Addr+4],DataMemory[Mem_Addr+3],DataMemory[Mem_Addr+2],DataMemory[Mem_Addr+1],DataMemory[Mem_Addr]};
	   end
	   
	   assign Arr1 = DataMemory[256];
	   assign Arr2 = DataMemory[264];
	   assign Arr3 = DataMemory[272];
	   assign Arr4 = DataMemory[280];
	   assign Arr5 = DataMemory[288];
	   assign Arr6 = DataMemory[296];
	   
	
	end
	
	
	
	always @ (posedge clk)
	begin
		if (MemWrite)
		begin
			DataMemory[Mem_Addr] = Write_Data[7:0];
			DataMemory[Mem_Addr+1] = Write_Data[15:8];
			DataMemory[Mem_Addr+2] = Write_Data[23:16];
			DataMemory[Mem_Addr+3] = Write_Data[31:24];
			DataMemory[Mem_Addr+4] = Write_Data[39:32];
			DataMemory[Mem_Addr+5] = Write_Data[47:40];
			DataMemory[Mem_Addr+6] = Write_Data[55:48];
			DataMemory[Mem_Addr+7] = Write_Data[63:56];
		end
	end
	
	
	
	
endmodule
