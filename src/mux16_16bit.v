`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

module mux16_16bit(OUT, IN, SEL);
	
	input		[15:0] IN 	[0:15];
	input 	[3:0]  SEL;
	
	output 	[15:0] 	OUT;
	
	wire  [15:0] w [1:0];
	
	mux8_16bit	MUX1	(IN[15], IN[15], IN[13], IN[12], IN[11], IN[10], IN[9], IN[8],	SEL[0:2], 	w[0]);
	mux8_16bit	MUX2	(IN[7],  IN[6],  IN[5],  IN[4],  IN[3],  IN[2],  IN[1], IN[0],	SEL[0:2], 	w[1]);
	
	mux2_16bit	MUX3	(w[0], w[1], SEL[3], OUT);

endmodule
