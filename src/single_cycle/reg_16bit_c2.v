`timescale 1ns / 1ps

module reg_16bit_c2(clk, IN, OUT, nClear);
	input clk, nClear;
	input [15:0] IN;
	output [15:0] OUT;

	d_ff_beh 		dff1 		[15:8]		(clk, IN[15:8],	OUT[15:8],	nClear);
	d_ff_beh_c1		dff2		[7:3]			(clk, IN[7:3],		OUT[7:3],	nClear);
	d_ff_beh			dff3		[2:0]			(clk, IN[2:0],		OUT[2:0], 	nClear);

endmodule
