`timescale 1ns / 1ps
////////////////////////////////////////
//
////////////////////////////////////////
module top_lcd_test(clk, dataout, control, led);
	input clk;
	output led;
	output [3:0] dataout;
	output [2:0] control;
	wire   [3:0] OPCODE;
	wire clk1Hz;
	
	assign led=clk1Hz;
	
	lcd						LCD			(clk, dataout, control, OPCODE);
	clk_div					CLKDIV		(clk, clk1Hz);
	opcode_test				OPCTEST		(clk1Hz, OPCODE);
	
endmodule
