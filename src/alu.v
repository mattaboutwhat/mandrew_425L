`timescale 1ns / 1ps
///////////////////////////////////////////////
//	OPCODE:
//			000:	AND
//			001:	OR
//			010:	Unsigned ADD
//			011:	Signed 	ADD
//			100:	Signed 	SUB
//			101:	SLT output
//			110:	n/a
//			111:	n/a
//	NOTES:
//			. Less-than, greater-than and equal-to flags are always updated 
//			  for each input A and B.
//			. Unsigned addition DOES NOT have an overflow; does it need one?
//			. 5 warnings (Xst:1290) expected during Synthesize; these are from 
//			  the use of our generalized 8-1 muxes with multiple un-populated
//			  inputs.
//////////////////////////////////////////////
module alu(A, B, Cin, opcod, OUT, Cout, overflow, lt, gt, eq);

	input [15:0] A, B;
	input [2:0] opcod;
	input Cin;

	output [15:0] OUT;
	output Cout, overflow, lt, gt, eq;

	wire [15:0] and_out, or_out, u_add_out, s_add_out, s_sub_out;

	wire nul=0;
	wire hi =1;
	wire [15:0] null = 0;

	and_16bit 		AND 	(and_out, A, B);
	or_16bit			OR 	(or_out,  A, B);
	unsigned_add	UADD 	(u_add_out, Cout_1, A, B, Cin);
	twos_comp		TCadd	(s_add_out, Cout_2, overflow_2, A, B, nul);
	twos_comp		TCsub	(s_sub_out, Cout_3, overflow_3, A, B, hi);

	comparator		COMP 	(s_sub_out, lt, gt, eq);

	mux8_16bit		MUX1 	(and_out, or_out, u_add_out, s_add_out, s_sub_out, {15'b0, lt}, null, null, 	opcod, OUT);
	mux8_1bit		MUX2 	({nul,    nul,    Cout_1,    Cout_2,    Cout_3,    nul,  nul, 	nul}, 	opcod, Cout);
	mux8_1bit 		MUX3	({nul,    nul,    nul,       overflow_2,overflow_3,nul,  nul,  nul},  	opcod, overflow);

endmodule
