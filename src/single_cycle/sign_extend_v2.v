`timescale 1ns / 1ps

module sign_extend(IN, OUT);
	input [3:0] IN;
	output [15:0] OUT;

	buf 	BUF1_		[11:0] (OUT[15:4], IN[3]);
	buf 	BUF2_		[3:0]  (OUT[3:0],  IN[3:0]);

endmodule
