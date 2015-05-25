`timescale 1ns / 1ps

module reg_16bit(clk, IN, OUT, nClear);
	input clk, nClear;
	input [15:0] IN;
	output [15:0] OUT;

	d_ff_beh dff_ [15:0](clk, IN, OUT, nClear);


endmodule
