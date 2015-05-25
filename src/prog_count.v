`timescale 1ns / 1ps

module prog_count(PC, PC_next, clk, nClear);

	input 			clk, nClear;
	input  [15:0] 	PC_next;
	output [15:0] 	PC;
	
	d_ff_beh 		DFF		[15:0]	(clk, PC_next[15:0], PC[15:0], nClear);	

endmodule
