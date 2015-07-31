`timescale 1ns / 1ps
////////////////////////////////////////
//
////////////////////////////////////////
module top_lcd_test(clk, dataout, control, clk1Hz);
	input wire clk;
	output clk1Hz;
	output wire [3:0] dataout;
	output wire [2:0] control;
	wire   [3:0] OPCODE;
	wire clk1Hz;
	
	clk_div					CLKDIV		(clk, clk1Hz);
	opcode_test				OPCTEST		(clk1Hz, OPCODE);
	lcd						LCD			(clk, dataout, control, OPCODE);
	
endmodule
