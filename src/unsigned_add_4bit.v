`timescale 1ns / 1ps
////////////////////////////////////////
//
////////////////////////////////////////
module u_add_4bit(OUT, A, B);

	input  [3:0] A, B;
	output [3:0] OUT;

	wire [2:0] carry;

	full_adder 		fa1 	(A[0], B[0], 1'b0,     carry[0], OUT[0]);
	full_adder 		fa2	(A[1], B[1], carry[0], carry[1], OUT[1]);
	full_adder 		fa3	(A[2], B[2], carry[1], carry[2], OUT[2]);
	full_adder	 	fa4	(A[3], B[3], carry[2], , OUT[3]);
endmodule
