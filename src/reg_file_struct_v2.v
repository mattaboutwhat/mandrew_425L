`timescale 1ns / 1ps

module reg_file_struct(A, B, Aaddr, Baddr, Caddr, C, load, nClear, clk);

	input  [3:0] 	Aaddr, Baddr, Caddr;
	input  [15:0] 	C;
	input 			load, nClear, clk;
	output [15:0]	A, B;
//	output [7:0]  reg1;
	
	wire [15:0] demux_out;
	wire [15:0] load_out;
				
	wire [15:0] reg1_out,  reg2_out,  reg3_out,  reg4_out,  reg5_out,  reg6_out,
					reg7_out,  reg8_out,  reg9_out,  reg10_out, reg11_out, reg12_out,
					reg13_out, reg14_out, reg15_out, reg16_out;
					
	wire [15:0] reg1_in,   reg2_in,   reg3_in,   reg4_in,   reg5_in,  reg6_in,
					reg7_in,   reg8_in,   reg9_in,   reg10_in,  reg11_in, reg12_in,
					reg13_in,  reg14_in,  reg15_in,  reg16_in;
	
//	assign reg1 = reg7_out[7:0];
	
	//register select decoder
	
	demux16_1bit	DEMUX					(Caddr, demux_out);
	
	//pre-load-mux AND
	and 				AND_		[15:0]	(load_out[15:0], load, demux_out[15:0]);
	
	//to load or not to load?
	mux2_16bit		MUX_LOAD1	(reg1_out,  C, load_out[0],  reg1_in),
						MUX_LOAD2	(reg2_out,  C, load_out[1],  reg2_in),
						MUX_LOAD3	(reg3_out,  C, load_out[2],  reg3_in),
						MUX_LOAD4	(reg4_out,  C, load_out[3],  reg4_in),
						MUX_LOAD5	(reg5_out,  C, load_out[4],  reg5_in),
						MUX_LOAD6	(reg6_out,  C, load_out[5],  reg6_in),
						MUX_LOAD7	(reg7_out,  C, load_out[6],  reg7_in),
						MUX_LOAD8	(reg8_out,  C, load_out[7],  reg8_in),
						MUX_LOAD9	(reg9_out,  C, load_out[8],  reg9_in),
						MUX_LOAD10	(reg10_out, C, load_out[9],  reg10_in),
						MUX_LOAD11	(reg11_out, C, load_out[10], reg11_in),
						MUX_LOAD12	(reg12_out, C, load_out[11], reg12_in),
						MUX_LOAD13	(reg13_out, C, load_out[12], reg13_in),
						MUX_LOAD14	(reg14_out, C, load_out[13], reg14_in),
						MUX_LOAD15	(reg15_out, C, load_out[14], reg15_in),
						MUX_LOAD16	(reg16_out, C, load_out[15], reg16_in);

	//registers
	reg_16bit		REG1		(clk, reg1_in,  reg1_out,  1'b0  ),		//$zero
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
						
	//reg_16bit_c1	REG5		(clk, reg5_in, reg5_out, nClear);
	//reg_16bit_c2	REG6		(clk, reg6_in, reg6_out, nClear);
	
	//outputs
	mux16_16bit		MUXA		(A, Aaddr, reg1_out, reg2_out, reg3_out, reg4_out, reg5_out, reg6_out, reg7_out, reg8_out, reg9_out, reg10_out, reg11_out, reg12_out, reg13_out, reg14_out, reg15_out, reg16_out);
	mux16_16bit		MUXB		(B, Baddr, reg1_out, reg2_out, reg3_out, reg4_out, reg5_out, reg6_out, reg7_out, reg8_out, reg9_out, reg10_out, reg11_out, reg12_out, reg13_out, reg14_out, reg15_out, reg16_out);
	
endmodule
