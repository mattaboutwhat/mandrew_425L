`timescale 1ns / 1ps

module mux2_4bit (A, B, sel, OUT);
	input [3:0] A, B;
	input sel;
	output [3:0] OUT;

	mux2_1bit	MUX2_ 	[3:0] (A[3:0], B[3:0], sel, OUT[3:0]);

endmodule
