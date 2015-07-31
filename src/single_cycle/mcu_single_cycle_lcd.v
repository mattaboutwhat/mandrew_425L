`timescale 1ns / 1ps
//////////////////////////////////////
// Matthew Allen & Andrew Bakhit
// ECE 425L | Spring 2015
// Dr. Halima el Naga
// Cal Poly Pomona (www.cpp.edu)
//////////////////////////////////////

module mcu_single_cycle_lcd(clk_in, nClear, clk_en, lcd_dataout, lcd_control, display, btn, rot_a, rot_b);
	input clk_in, nClear, clk_en;
	input btn, rot_a, rot_b;
	output [3:0] lcd_dataout; 
	output [2:0] lcd_control;
	//output clk;
	
	output wire [7:0] display;
	
//WIRES AND ASSIGNS
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
	//lcd and debug stuff
	wire [1:0] d_state;
	wire [3:0] m_state;
	wire [31:0] m_data;
	wire [31:0] r_data;
	wire [4:0] d_sel;
	wire [7:0] d_data;
	//other stuff
	wire nul=0;
	
//BUTTON AND QUAD ENC. KNOB
	debounce 				BTN_DBNC 	(btn_clean, btn, clk5K);
	edge_detect				BTN_EDGE 	(btn_edge, btn_clean, clk5K);

	quad_debounce 			A_DBNC 		(rot_a_clean, !rot_a, clk5K);
	quad_debounce 			B_DBNC 		(rot_b_clean, !rot_b, clk5K);
	quad_states				Q_STATE		(cw, ccw, rot_a_clean, rot_b_clean, clk5K);
	
	//counter_test			CNT_TEST		(display, cw, ccw, btn_edge, clk_in);
	debug_states			D_STATES		(d_state, btn_edge, clk5K);
	mem_states				M_STATES		(m_state, cw, ccw, clk5K);
	
//CLOCK MODULES
	clk_div					CLKDIV	(clk_in, clk, clk_en);
	clk_5K					CLK_5K	(clk5K, clk_in);
	
//MCU MODULES
	//Program Counter and PC+1 unsigned adder
	prog_count				PCount	(PC, PC_next, clk, nClear);
	unsigned_add			PCadd		(PC_plus1, , 16'b1, PC, nul);
	
	//instruction memory (behavioral)
	instruct_mem			IM			(PC, INSTR);
	
	//control 
	control 					CNTRL		(INSTR[15:12],RegDst,Jump,Branch,MemRead,MemToReg,ALUop,MemWrite,ALUsrc,RegWrite);
	
	//sign-extender, before branch address calculator
	sign_extend				SE			(INSTR[3:0], sign_ext_out);
	
	//branch address calculate; branch and jump muxes; branch AND
	unsigned_add			TCadd		(branch_addr, , PC_plus1, sign_ext_out, nul);
	and									(b_mux_sel, Branch, ~E);
	mux2_16bit				B_mux		(PC_plus1, branch_addr, b_mux_sel, b_mux_out);
	mux2_16bit				J_mux		(b_mux_out, {PC_plus1[15:12], INSTR[11:0]}, Jump, PC_next);
	
	//File register and its preceding mux
	mux2_4bit				MUX_REG	(INSTR[7:4], INSTR[3:0], RegDst, reg_mux_out);
	reg_file_beh			REG		(data1, data2, INSTR[11:8], INSTR[7:4], reg_mux_out, write_back_data, RegWrite, nClear, m_state, m_data);
//	reg_file_beh			REG		(data1, data2, INSTR[11:8], INSTR[7:4], reg_mux_out, write_back_data, RegWrite, nClear, clk, m_state, m_data);
//	reg_file_struct 		REG		(data1, data2, INSTR[11:8], INSTR[7:4], reg_mux_out, write_back_data, RegWrite, nClear, clk);
	
	//ALU and its mux
	mux2_16bit				MUX_ALU	(data2, sign_ext_out, ALUsrc, alu_mux_out);
	alu						ALU		(data1, alu_mux_out, Cin, ALUop, alu_out, Cout, V, L, G, E);

	//data mem and its output mux
	reg_data_mem_beh		DMem		(data_out, alu_out, data2, MemWrite, MemRead, nClear, m_state, r_data);
//	reg_data_mem_beh		DMem		(data_out, alu_out, data2, MemWrite, MemRead, clk, nClear, m_state, r_data);
//	reg_data_mem			DMem		(data_out, alu_out, data2, MemWrite, MemRead, clk);
	mux2_16bit				DOutMux	(alu_out, data_out, MemToReg, write_back_data);
	
	
//LCD MODULES
	lcd_data					LCD_DATA	(d_data, d_state, d_sel, INSTR, PC, m_state, m_data, r_data, clk_in);
	lcd 						LCD		(clk_in, lcd_dataout, lcd_control, d_sel, d_data);
	//lcd						LCD		(clk_in, lcd_dataout, lcd_control, INSTR[15:12], INSTR[11:8], INSTR[7:4], INSTR[3:0], PC);
	
endmodule
