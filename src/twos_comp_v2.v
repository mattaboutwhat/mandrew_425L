`timescale 1ns / 1ps

module twos_comp(OUT, Cout, overflow, A, B, sub_en);
	
	input [15:0] A, B;
	input sub_en;

	output [15:0] OUT;
	output Cout, overflow;

	wire [15:0] w;
	wire [14:0] c;

	xor XOR [15:0] (w[15:0], sub_en, B[15:0]);

	full_adder	FADD15 			(A[15],   w[15],   c[14],   Cout_buf,    OUT[15]);
	full_adder  FADD_	 [14:1] 	(A[14:1], w[14:1], c[13:0], c[14:1], OUT[14:1]);
	full_adder	FADD0				(A[0],    w[0],    sub_en,  c[0],    OUT[0]);

	//overflow
	xor	(overflow_buf, Cout, c[14]);
	xor   (Cout, Cout_buf, sub_en);
	xor 	(overflow, overflow_buf, sub_en);

endmodule
