`timescale 1ns / 1ps

//note: IN is a 2's complement subtraction output of A and B
module comparator(IN, lt, gt, eq);

	input [15:0] IN; 
	output lt, gt, eq;

	//equal
	nor nor1(eq, IN[0],IN[1],IN[2],IN[3],IN[4],IN[5],IN[6],IN[7],IN[8],IN[9],IN[10],IN[11],IN[12],IN[13],IN[14],IN[15]);

	//less than 
	not n1 (in_msb_not, IN[15]);
	not n2 (lt, in_msb_not);

	//grather than
	not n3 (noteq, eq);
	and a1 (gt, noteq, in_msb_not);
	
endmodule
