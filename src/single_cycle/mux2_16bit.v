`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

module mux2_16bit(A, B, sel, OUT);
	input [15:0] A;
	input [15:0] B;
	input sel;
	output [15:0] OUT;
	
	//Call the 2to1 mux 16  times to create a 16 bit 2to1 mux
	mux2_1bit	mux1 	(A[0],	B[0],		sel,	OUT[0]);
	mux2_1bit 	mux2 	(A[1],	B[1],		sel, 	OUT[1]);
	mux2_1bit 	mux3 	(A[2],	B[2],		sel, 	OUT[2]);
	mux2_1bit 	mux4 	(A[3],	B[3],		sel, 	OUT[3]);
	mux2_1bit 	mux5 	(A[4],	B[4],		sel, 	OUT[4]);
	mux2_1bit 	mux6 	(A[5],	B[5],		sel, 	OUT[5]);
	mux2_1bit 	mux7 	(A[6],	B[6],		sel, 	OUT[6]);
	mux2_1bit 	mux8 	(A[7],	B[7],		sel, 	OUT[7]);
	mux2_1bit 	mux9 	(A[8],	B[8],		sel, 	OUT[8]);
	mux2_1bit 	mux10	(A[9],	B[9],		sel, 	OUT[9]);
	mux2_1bit 	mux11	(A[10],	B[10],	sel, 	OUT[10]);
	mux2_1bit 	mux12	(A[11],	B[11],	sel, 	OUT[11]);
	mux2_1bit 	mux13	(A[12],	B[12],	sel, 	OUT[12]);
	mux2_1bit 	mux14	(A[13],	B[13],	sel, 	OUT[13]);
	mux2_1bit 	mux15	(A[14],	B[14],	sel, 	OUT[14]);
	mux2_1bit 	mux16	(A[15],	B[15],	sel, 	OUT[15]);
	
	
endmodule
