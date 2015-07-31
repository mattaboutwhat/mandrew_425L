`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

module reg_data_mem (data_out, addr, data_in, MemWrite, MemRead, clk);

	input  [15:0] 	addr;
	input  [15:0] 	data_in;
	input 			MemWrite, MemRead, clk;
	output [15:0]	data_out;

	wire [15:0] demux_out, load_out, A;
	
	wire [15:0] reg1_out,  reg2_out,  reg3_out,  reg4_out,  reg5_out,  reg6_out,
					reg7_out,  reg8_out,  reg9_out,  reg10_out, reg11_out, reg12_out,
					reg13_out, reg14_out, reg15_out, reg16_out;
					
	wire [15:0] reg1_in,   reg2_in,   reg3_in,   reg4_in,   reg5_in,  reg6_in,
					reg7_in,   reg8_in,   reg9_in,   reg10_in,  reg11_in, reg12_in,
					reg13_in,  reg14_in,  reg15_in,  reg16_in;

	wire hi=1;
	
	//register select decoder
	demux16_1bit	DEMUX					(addr[3:0], demux_out);
	
	//pre-load-mux AND
	and 				AND_		[15:0]	(load_out[15:0], MemWrite, demux_out[15:0]);
	
	//to write or not to write?
	mux2_16bit		MUX_LOAD1	(reg1_out,  data_in, load_out[0],  reg1_in),
						MUX_LOAD2	(reg2_out,  data_in, load_out[1],  reg2_in),
						MUX_LOAD3	(reg3_out,  data_in, load_out[2],  reg3_in),
						MUX_LOAD4	(reg4_out,  data_in, load_out[3],  reg4_in),
						MUX_LOAD5	(reg5_out,  data_in, load_out[4],  reg5_in),
						MUX_LOAD6	(reg6_out,  data_in, load_out[5],  reg6_in),
						MUX_LOAD7	(reg7_out,  data_in, load_out[6],  reg7_in),
						MUX_LOAD8	(reg8_out,  data_in, load_out[7],  reg8_in),
						MUX_LOAD9	(reg9_out,  data_in, load_out[8],  reg9_in),
						MUX_LOAD10	(reg10_out, data_in, load_out[9],  reg10_in),
						MUX_LOAD11	(reg11_out, data_in, load_out[10], reg11_in),
						MUX_LOAD12	(reg12_out, data_in, load_out[11], reg12_in),
						MUX_LOAD13	(reg13_out, data_in, load_out[12], reg13_in),
						MUX_LOAD14	(reg14_out, data_in, load_out[13], reg14_in),
						MUX_LOAD15	(reg15_out, data_in, load_out[14], reg15_in),
						MUX_LOAD16	(reg16_out, data_in, load_out[15], reg16_in);

	//registers
	reg_16bit		DREG1		(clk, reg1_in,  reg1_out,  hi),
						DREG2		(clk, reg2_in,  reg2_out,  hi),
						DREG3		(clk, reg3_in,  reg3_out,  hi),
						DREG4		(clk, reg4_in,  reg4_out,  hi),
						DREG5		(clk, reg5_in,  reg5_out,  hi),
						DREG6		(clk, reg6_in,  reg6_out,  hi),
						DREG7		(clk, reg7_in,  reg7_out,  hi),
						DREG8		(clk, reg8_in,  reg8_out,  hi),
						DREG9		(clk, reg9_in,  reg9_out,  hi),
						DREG10	(clk, reg10_in, reg10_out, hi),
						DREG11	(clk, reg11_in, reg11_out, hi),
						DREG12	(clk, reg12_in, reg12_out, hi),
						DREG13	(clk, reg13_in, reg13_out, hi),
						DREG14	(clk, reg14_in, reg14_out, hi),
						DREG15	(clk, reg15_in, reg15_out, hi),
						DREG16	(clk, reg16_in, reg16_out, hi);
	//outputs

	mux16_16bit		MUX_OUT	(A, addr[3:0], reg1_out, reg2_out, reg3_out, reg4_out, reg5_out, reg6_out, reg7_out, reg8_out, reg9_out, reg10_out, reg11_out, reg12_out, reg13_out, reg14_out, reg15_out, reg16_out);
	and_16bit 		AND_OUT	(data_out, {16{MemRead}}, A);
	
endmodule
