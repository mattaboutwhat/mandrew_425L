`timescale 1ns / 1ps

/////////////////////////////////////////////////

module mux16_16bit(OUT, SEL, A, B, C, D, E, F, G, H, I, J, K ,L, M, N, O, P);

	input [15:0] A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P;
	input [3:0]  SEL;

	output [15:0] OUT;

	wire [15:0] w0, w1;

	mux8_16bit	MUX1 	(A, B, C, D, E, F, G, H, SEL[2:0], w0);
	mux8_16bit 	MUX2	(I, J, K, L, M, N, O, P, SEL[2:0], w1);

	mux2_16bit	MUX3	(w0, w1, SEL[3], OUT);

endmodule
