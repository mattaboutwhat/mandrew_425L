`timescale 1ns / 1ps
////////////////////////////////////////////////			 
//		A ------|\
//            | |
//				  | | -- OUT
//	           | |
//		B ------|/
//			      |
//		sel -----|	
////////////////////////////////////////////////
module mux2_1bit(A, B, sel, OUT);

	input A, B, sel;
	output OUT;
	wire c, d;

	not 	NOT1 	(sel_n, sel);
	nand 	NA1	(c, A, sel_n);
	nand 	NA2	(d, B, sel);
	nand 	NA3	(OUT, c, d);

endmodule
