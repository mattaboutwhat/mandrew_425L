`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

module mux8_16bit(A, B, C, D, E, F, G, H, sel, out);
	input [15:0] A, B, C, D, E, F, G, H;
	input [2:0] sel;
	
	wire [15:0] i, j, k, l, m, n;
	
	output [15:0] out;
	
	mux2_16bit mux16_1 (A, B, sel[0], i);
	mux2_16bit mux16_2 (C, D, sel[0], j);
	mux2_16bit mux16_3 (E, F, sel[0], k);
	mux2_16bit mux16_4 (G, H, sel[0], l);
	mux2_16bit mux16_5 (i, j, sel[1], m);
	mux2_16bit mux16_6 (k, l, sel[1], n);
	mux2_16bit mux16_7 (m, n, sel[2], out);
	
endmodule
