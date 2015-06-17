`timescale 1ns / 1ps
/////////////////////////////////////
//
/////////////////////////////////////
module reg_8bit_lcd(clk, IN, OUT, nClear);
	input clk, nClear;
	input [7:0] IN;
	output [7:0] OUT;

	d_ff_beh			dff7_5		[7:5]		(clk,  IN[7:5], 	OUT[7:5], 	nClear);
	d_ff_beh_c1		dff4						(clk,  IN[4], 		OUT[4], 		nClear);
	d_ff_beh 		dff3_0		[3:0]		(clk,  IN[3:0], 	OUT[3:0], 	nClear);

endmodule