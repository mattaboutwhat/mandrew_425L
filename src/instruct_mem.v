`timescale 1ns / 1ps

module instruct_mem(PC, INSTR, clk);
	input clk;
	input [15:0] PC;
	output reg [15:0] INSTR;

	always @(posedge clk) begin
		case(PC)
			0:		INSTR = 16'h0000;	//interrupt vector
			1:  	INSTR = 16'h2456;	//ADD $R5 $R6 $R7
			2:  	INSTR = 16'h6456;	//SUB $R5 $R6 $R5
			3: 	INSTR = 16'h0444;	//AND $R5 $R5 $R5
			4: 	INSTR = 16'h1444;	//OR  $R5 $R5 $R5
			5: 	INSTR = 16'h7105;	//SLT $R2 $R1 $R6	[will always be less than]
			6:		INSTR = 16'hA040; //SW  $R1(address of Daddr to store to)  $R5(data to be stored) 0(offset)
			7:		INSTR = 16'h8030; //LW  $R1(address of Daddr to read from) $R4(Raddr to write to) 0(offset)
			8: 	INSTR = 16'hF009; //JUMP 9
			9: 	INSTR = 16'hE04E; //BNE $R1 $R5 -2
			
			default:  INSTR=16'hF001; //JUMP 1
		endcase
	end

endmodule 
