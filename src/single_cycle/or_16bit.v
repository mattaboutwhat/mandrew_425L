`timescale 1ns / 1ps

module or_16bit(OUT, A, B);
	
	input  [15:0] A, B;
	output [15:0] OUT;

	or OR [15:0] (OUT, A, B);

endmodule
