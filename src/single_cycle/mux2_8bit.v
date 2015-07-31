`timescale 1ns / 1ps
///////////////
//
///////////////
module mux2_8bit(A, B, sel, OUT);
	input sel;
	input [7:0] A, B;
	output [7:0] OUT;

	mux2_1bit 	MUX2_1 	[7:0]		(A[7:0], B[7:0], sel, OUT[7:0]);
	
endmodule
