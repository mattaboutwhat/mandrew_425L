`timescale 1ns / 1ps

module mcu_single_cycle(clk, nClear, PC_next, INSTR,
	Jump,Branch,MemRead,MemToReg,ALUop,MemWrite,ALUsrc,
	branch_addr, data1, data2);

	input clk, nClear;
	output [15:0]PC_next, branch_addr, data1, data2;
	output wire [15:0] INSTR;
	output [2:0] ALUop;
	output Jump,Branch,MemRead,MemToReg,MemWrite,ALUsrc;

	wire [15:0] PC, PC_next, PC_plus1;
	wire [15:0] sign_ext_out;
	wire  [3:0] reg_mux_out;

	//Program Counter and PC+1 unsigned adder
	prog_count		PCmod		(PC, PC_next, clk, nClear);
	unsigned_add 	PCadd		(PC_plus1, , PC, 16'h0001, 1'b0);

	//instruction memory
	instruct_mem	IM 			(PC, INSTR, clk);
	
	//control
	control			CNTRL 		(INSTR[15:12],RegDst,Jump,Branch,MemRead,MemToReg,ALUop,MemWrite,ALUsrc,RegWrite);

	//sign-extender, before branch addess calculation
	sign_extend		SE 			(INSTR[3:0], sign_ext_out);

	//branch address calculate; branch and jump muxes; branch AND
	unsigned_add	TCadd		(branch_addr, , PC_plus1, sign_ext_out, 1'b0);

	//File Register, its preceding MUX
	mux2_4bit		MUX_REG		(INSTR[7:4], INSTR[3:0], RegDst, reg_mux_out);
	reg_file_struct	REG 		(data1, data2, INSTR[11:8], INSTR[7:4], reg_mux_out, /*write_back_data*/,RegWrite, nClear, clk);


//TEMP STUFF
	buf 	BUF 	[15:0]		(PC_next[15:0], PC_plus1[15:0]);
	
endmodule
