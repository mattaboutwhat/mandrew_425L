`timescale 1ns / 1ps
////////////////////////////////////////
//
////////////////////////////////////////
module unsigned_add(OUT, Cout, A, B, Cin);

	input [15:0] A, B;
	input Cin;

	output [15:0] OUT;
	output Cout;

	wire [14:0] carry;

	full_adder 	fa1 				(A[0], 		B[0], 		Cin, 				carry[0], 		OUT[0]);
	full_adder 	fa_	[1:14] 	(A[14:1], 	B[14:1], 	carry[13:0], 	carry[14:1], 	OUT[14:1]);
	full_adder 	fa16 				(A[15], 		B[15], 		carry[14], 		Cout, 			OUT[15]);

endmodule
