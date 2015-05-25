`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

module reg_file_struct(A, B, Aaddr, Baddr, Caddr, C, load, nClear, clk);

	input  [3:0] 	Aaddr, Baddr, Caddr;
	input  [15:0] 	C;
	input 			load, nClear, clk;
	output [15:0]	A, B;
	
	wire [15:0] demux_out;
	wire [15:0] load_out;
	wire [15:0] load_mux_out1,  load_mux_out2,  load_mux_out3,  load_mux_out4,
					load_mux_out5,  load_mux_out6,  load_mux_out7,  load_mux_out8,
					load_mux_out9,  load_mux_out10, load_mux_out11, load_mux_out12,
					load_mux_out13, load_mux_out14, load_mux_out15, load_mux_out16;
				
	wire [15:0] reg1_out,  reg2_out,  reg3_out,  reg4_out,  reg5_out,  reg6_out,
					reg7_out,  reg8_out,  reg9_out,  reg10_out, reg11_out, reg12_out,
					reg13_out, reg14_out, reg15_out, reg16_out;
					
	wire [15:0] reg1_in,   reg2_in,   reg3_in,   reg4_in,   reg5_in,  reg6_in,
					reg7_in,   reg8_in,   reg9_in,   reg10_in,  reg11_in, reg12_in,
					reg13_in,  reg14_in,  reg15_in,  reg16_in;
	
	//register select decoder
	
	demux16_1bit	DEMUX					(Caddr, demux_out);
	
	//pre-load-mux AND
	and 				AND_		[15:0]	(load_out[15:0], load, demux_out[15:0]);
	
	//to load or not to load?
	mux2_16bit		MUX_LOAD1	(reg1_out,  C, load_out[0],  load_mux_out1),
						MUX_LOAD2	(reg2_out,  C, load_out[1],  load_mux_out2),
						MUX_LOAD3	(reg3_out,  C, load_out[2],  load_mux_out3),
						MUX_LOAD4	(reg4_out,  C, load_out[3],  load_mux_out4),
						MUX_LOAD5	(reg5_out,  C, load_out[4],  load_mux_out5),
						MUX_LOAD6	(reg6_out,  C, load_out[5],  load_mux_out6),
						MUX_LOAD7	(reg7_out,  C, load_out[6],  load_mux_out7),
						MUX_LOAD8	(reg8_out,  C, load_out[7],  load_mux_out8),
						MUX_LOAD9	(reg9_out,  C, load_out[8],  load_mux_out9),
						MUX_LOAD10	(reg10_out, C, load_out[9],  load_mux_out10),
						MUX_LOAD11	(reg11_out, C, load_out[10], load_mux_out11),
						MUX_LOAD12	(reg12_out, C, load_out[11], load_mux_out12),
						MUX_LOAD13	(reg13_out, C, load_out[12], load_mux_out13),
						MUX_LOAD14	(reg14_out, C, load_out[13], load_mux_out14),
						MUX_LOAD15	(reg15_out, C, load_out[14], load_mux_out15),
						MUX_LOAD16	(reg16_out, C, load_out[15], load_mux_out16);
	//synchronous clear
	and_16bit		AND1		(reg1_in,  {16{nClear}}, load_mux_out1),
						AND2		(reg2_in,  {16{nClear}}, load_mux_out2),
						AND3		(reg3_in,  {16{nClear}}, load_mux_out3),
						AND4		(reg4_in,  {16{nClear}}, load_mux_out4),
						AND5		(reg5_in,  {16{nClear}}, load_mux_out5),
						AND6		(reg6_in,  {16{nClear}}, load_mux_out6),
						AND7		(reg7_in,  {16{nClear}}, load_mux_out7),
						AND8		(reg8_in,  {16{nClear}}, load_mux_out8),
						AND9		(reg9_in,  {16{nClear}}, load_mux_out9),
						AND10		(reg10_in, {16{nClear}}, load_mux_out10),
						AND11		(reg11_in, {16{nClear}}, load_mux_out11),
						AND12		(reg12_in, {16{nClear}}, load_mux_out12),
						AND13		(reg13_in, {16{nClear}}, load_mux_out13),
						AND14		(reg14_in, {16{nClear}}, load_mux_out14),
						AND15		(reg15_in, {16{nClear}}, load_mux_out15),
						AND16		(reg16_in, {16{nClear}}, load_mux_out16);
	//registers
	reg_16bit		REG1		(clk, reg1_in,  reg1_out,  nClear),
						REG2		(clk, reg2_in,  reg2_out,  nClear),
						REG3		(clk, reg3_in,  reg3_out,  nClear),
						REG4		(clk, reg4_in,  reg4_out,  nClear),
						REG5		(clk, reg5_in,  reg5_out,  nClear),
						REG6		(clk, reg6_in,  reg6_out,  nClear),
						REG7		(clk, reg7_in,  reg7_out,  nClear),
						REG8		(clk, reg8_in,  reg8_out,  nClear),
						REG9		(clk, reg9_in,  reg9_out,  nClear),
						REG10		(clk, reg10_in, reg10_out, nClear),
						REG11		(clk, reg11_in, reg11_out, nClear),
						REG12		(clk, reg12_in, reg12_out, nClear),
						REG13		(clk, reg13_in, reg13_out, nClear),
						REG14		(clk, reg14_in, reg14_out, nClear),
						REG15		(clk, reg15_in, reg15_out, nClear),
						REG16		(clk, reg16_in, reg16_out, nClear);
	//outputs
	mux16_16bit		MUXA		(A, Aaddr, reg1_out, reg2_out, reg3_out, reg4_out, reg5_out, reg6_out, reg7_out, reg8_out, reg9_out, reg10_out, reg11_out, reg12_out, reg13_out, reg14_out, reg15_out, reg16_out);
	mux16_16bit		MUXB		(B, Baddr, reg1_out, reg2_out, reg3_out, reg4_out, reg5_out, reg6_out, reg7_out, reg8_out, reg9_out, reg10_out, reg11_out, reg12_out, reg13_out, reg14_out, reg15_out, reg16_out);
	
endmodule
