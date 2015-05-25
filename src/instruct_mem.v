`timescale 1ns / 1ps

module instruct_mem(PC, INSTR, clk);
	input clk;
	input [15:0] PC;
	output reg [15:0] INSTR;

	always @(posedge clk) begin
		case(PC)
			0:		INSTR = 16'h0000;	//interrupt vector
			1:  	INSTR = 16'h3000;	//clear instruction
			2:  	INSTR = 16'h0000;
			3: 	INSTR = 16'h0000;
			4: 	INSTR = 16'h0000;
			5: 	INSTR = 16'h0000;
			
			default:  INSTR=16'hFFFF;
		endcase
	end

endmodule 
