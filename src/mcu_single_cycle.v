`timescale 1ns / 1ps

module mcu_single_cycle(clk, nClear, PC_next, write_back_data);
	input clk, nClear;
	output [15:0] PC_next, write_back_data;
	
	//instruction, PC and its variants
	wire [15:0] INSTR, PC, PC_next, PC_plus1;
	//16-bit wux outputs
	wire [15:0] b_mux_out, alu_mux_out;
	wire [3:0]  reg_mux_out;
	//sign-extend and branch address
	wire [15:0] sign_ext_out, branch_addr;
	//register stuff
	wire [15:0] data1, data2, write_back_data;
	//alu stuff
	wire [15:0] alu_out;
	wire [2:0]  ALUop;
	//data mem stuff
	wire [15:0] data_out;
	//other stuff
	wire [1:0]  NC;
	wire nul=0;
	
	//Program Counter and PC+1 unsigned adder
	prog_count				PCount	(PC, PC_next, clk, nClear);
	unsigned_add			PCadd		(PC_plus1, NC[0], 16'b1, PC, nul);
	
	//instruction memory (behavioral)
	instruct_mem			IM			(PC, INSTR, clk);

	//control 
	control 					CNTRL		(INSTR[15:12],RegDst,Jump,Branch,MemRead,MemToReg,ALUop,MemWrite,ALUsrc,RegWrite);
	
	//sign-extender, before branch address calculator
	sign_extend				SE			(INSTR[3:0], sign_ext_out);
	
	//branch address calculate; branch and jump muxes; branch AND
	unsigned_add			TCadd		(branch_addr, NC[1], PC_plus1, sign_ext_out, nul);
	and									(b_mux_sel, Branch, E);
	mux2_16bit				B_mux		(PC_plus1, branch_addr, b_mux_sel, b_mux_out);
	mux2_16bit				J_mux		(b_mux_out, {PC_plus1[15:12], INSTR[11:0]}, Jump, PC_next);
	
	//File register and its preceding mux
	mux2_4bit				MUX_REG	(INSTR[7:4], INSTR[3:0], RegDst, reg_mux_out);
	reg_file_struct 		REG		(data1, data2, INSTR[11:8], INSTR[7:4], reg_mux_out, write_back_data, RegWrite, nClear, clk);
	
	//ALU and its mux
	mux2_16bit				MUX_ALU	(data2, sign_ext_out, ALUsrc, alu_mux_out);
	alu						ALU		(data1, alu_mux_out, Cin, ALUop, alu_out, Cout, V, L, G, E);

	//data mem and its output mux
	reg_data_mem			DMem		(data_out, alu_out, data2, MemWrite, MemRead, clk);
	mux2_16bit				DOutMux	(alu_out, data_out, MemToReg, write_back_data);
	
endmodule
