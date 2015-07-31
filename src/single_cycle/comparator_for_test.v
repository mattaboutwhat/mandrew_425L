`timescale 1ns / 1ps

module comparator_for_test(OUT, Cout, lt, gt, eq, A, B, sub_en);

	input [15:0] A, B;
	input sub_en;
	output [15:0] OUT;
	output lt, gt, eq, Cout;
	
	wire hi = 1;
	wire nul= 0;
	wire [15:0] sub_out;
	
	twos_comp 	Add_Sub	(OUT, 	 Cout, overflow, A, B, sub_en);
	twos_comp	COMP_SUB	(sub_out, c1, overflow, A, B, hi);
	comparator	COMP		(sub_out, lt, gt, eq);

endmodule
