`timescale 1ns / 1ps

////////////////////////////////////////////////////////////

module mux16_16bit(OUT, IN, SEL);
	
	input 	[255:0] 	IN;
	input 	[3:0]		SEL;
	output 	[15:0]	OUT;

	wire [15:0] w0, w1; 

	mux8_16bit MUX1 (IN[255:240], IN[239:224], IN[223:208], IN[207:192], IN[191:176], IN[175:160], IN[159:144], IN[143:128], SEL[2:0], w0);
	mux8_16bit MUX2 (IN[127:112], IN[111:96],  IN[95:80],   IN[79:64],   IN[63:48],   IN[47:32],   IN[31:16],   IN[15:0],    SEL[2:0], w1);

	mux2_16bit MUX3 (w0, w1, SEL[3], OUT);

endmodule
