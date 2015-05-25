`timescale 1ns / 1ps

module reg_16bit_c1(clk, IN, OUT, nClear);
	input clk, nClear;
	input [15:0] IN;
	output [15:0] OUT;

	d_ff_beh 		dff1 		[15:10]		(clk, IN[15:10], OUT[15:10], nClear);
	d_ff_beh_c1		dff2						(clk, IN[9], 	  OUT[9],     nClear);
	d_ff_beh			dff3						(clk, IN[8], 	  OUT[8],     nClear);
	d_ff_beh_c1		dff4		[7:5]			(clk, IN[7:5],   OUT[7:5],   nClear);
	d_ff_beh			dff5		[4:1]			(clk, IN[4:1],   OUT[4:1],   nClear);
	d_ff_beh_c1		dff6						(clk, IN[0], 	  OUT[0],     nClear);

endmodule
