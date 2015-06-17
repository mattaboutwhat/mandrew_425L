`timescale 1ns / 1ps

module instruct_mem(PC, INSTR, clk);
	input clk;
	input [15:0] PC;
	output reg [15:0] INSTR;

	always @(posedge clk) begin
		case(PC)
			0:		INSTR = 16'h0000;	//interrupt vector
			1:		INSTR = 16'h3012; //ADDi; R1 := R0 + 2 
			2:  	INSTR = 16'h3121; //ADDi; R2 := R1 + 1			
			3:  	INSTR = 16'h3231; //ADDi; R3 := R1 + 1
			4:  	INSTR = 16'h3341; //ADDi; R4 := R1 + 1
			5:  	INSTR = 16'h3451; //ADDi; R5 := R1 + 1
			6:  	INSTR = 16'h3561; //ADDi; R6 := R1 + 1
			7:  	INSTR = 16'h3671; //ADDi; R7 := R1 + 1
			8:  	INSTR = 16'h3781; //ADDi; R8 := R1 + 1
			9:  	INSTR = 16'h3891; //ADDi; R9 := R1 + 1
			10:  	INSTR = 16'h39A1; //ADDi; RA := R1 + 1
			11:  	INSTR = 16'h3AB1; //ADDi; RB := R1 + 1
			12:  	INSTR = 16'h3BC1; //ADDi; RC := R1 + 1
			13:  	INSTR = 16'h3CD1; //ADDi; RD := R1 + 1
			14:  	INSTR = 16'h3DE1; //ADDi; RE := R1 + 1
			15:  	INSTR = 16'h3EF1; //ADDi; RF := R1 + 1
			default:  INSTR=16'hF001; //JUMP 1
		endcase
	end

endmodule 
