`timescale 1ns / 1ps

module instruct_mem(PC, INSTR);
	input [15:0] PC;
	output reg [15:0] INSTR;

	always @(PC) begin
		case(PC)
/*			0:		INSTR = 16'h0000;	//interrupt vector
			1:		INSTR = 16'h3011; //ADDi; R1 := R0 + 1 
			2:  	INSTR = 16'h3121; //ADDi; R2 := R1 + 1			
			3:  	INSTR = 16'h3231; //ADDi; R3 := R2 + 1
			4:  	INSTR = 16'h3341; //ADDi; R4 := R3 + 1
			5:  	INSTR = 16'h3451; //ADDi; R5 := R4 + 1
			6:  	INSTR = 16'h3561; //ADDi; R6 := R5 + 1
			7:  	INSTR = 16'h3671; //ADDi; R7 := R6 + 1
			8:  	INSTR = 16'h3781; //ADDi; R8 := R7 + 1
			9:  	INSTR = 16'h3891; //ADDi; R9 := R8 + 1
			10:  	INSTR = 16'h39A1; //ADDi; RA := R9 + 1
			11:  	INSTR = 16'h3AB1; //ADDi; RB := RA + 1
			12:  	INSTR = 16'h3BC1; //ADDi; RC := RB + 1
			13:  	INSTR = 16'h3CD1; //ADDi; RD := RC + 1
			14:  	INSTR = 16'h3DE1; //ADDi; RE := RD + 1
			15:  	INSTR = 16'h3EF1; //ADDi; RF := RE + 1
			16: 	INSTR = 16'hA0F0;	//SW $R0 $RF 0
			17: 	INSTR = 16'hA1F0;	//SW $R1 $RF 0
			18: 	INSTR = 16'hA2F0;	//SW $R2 $RF 0
			19: 	INSTR = 16'hA3F0;	//SW $R3 $RF 0
			20: 	INSTR = 16'hA4F0;	//SW $R4 $RF 0
			21: 	INSTR = 16'hA5F0;	//SW $R5 $RF 0
			22: 	INSTR = 16'hA6F0;	//SW $R6 $RF 0
			23: 	INSTR = 16'hA7F0;	//SW $R7 $RF 0
			24: 	INSTR = 16'hA8F0;	//SW $R8 $RF 0
			25: 	INSTR = 16'hA9F0;	//SW $R9 $RF 0
			26: 	INSTR = 16'hAAF0;	//SW $RA $RF 0
			27: 	INSTR = 16'hABF0;	//SW $RB $RF 0
			28: 	INSTR = 16'hACF0;	//SW $RC $RF 0
			29: 	INSTR = 16'hADF0;	//SW $RD $RF 0
			30: 	INSTR = 16'hAEF0;	//SW $RE $RF 0
			31: 	INSTR = 16'hAFF0;	//SW $RF $RF 0
			32: 	INSTR = 16'hE011;	//BNE $R0 $R1 +1  -> should skip the next jump instruction
			33: 	INSTR = 16'hF001; //JUMP 1
			34: 	INSTR = 16'h8330; //LW DRAM($R3+0) -> R3
			35:   INSTR = 16'hF001;	//JUMP 1
			default:  INSTR=16'hD001; //Gibberish, will do nothing	*/
			
			0:		INSTR = 16'h0000;	//interrupt vector
			1:		INSTR = 16'h3011; //ADDi; R1 := R0 + 1
			2:		INSTR = 16'hE011;	//BNE $R0 $R1 +1
			3:		INSTR = 16'hF001;	//JMP 1 				-> 				should be skipped
			4:		INSTR = 16'h3121; //ADDi; R2 := R1 + 1
			5:		INSTR = 16'hF001;	//JMP 1
		endcase
	end

endmodule 
