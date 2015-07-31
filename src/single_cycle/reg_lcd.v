`timescale 1ns / 1ps
//////////////////////
//
//////////////////////

module lcd_reg(data_out, data_in, sel, write, write_addr);
	input [7:0] data_in;
	input [4:0] write_addr;
	input [4:0] sel;
	input write;
	output [7:0] data_out;

	wire [31:0] demux_out_read, demux_out_write, load_out;

	wire [7:0]  reg0_out,  reg1_out,  reg2_out,  reg3_out,  reg4_out,  reg5_out,  reg6_out,  reg7_out,
					reg8_out,  reg9_out,  reg10_out, reg11_out, reg12_out, reg13_out, reg14_out, reg15_out,
					reg16_out, reg17_out, reg18_out, reg19_out, reg20_out, reg21_out, reg22_out, reg23_out,
					reg24_out, reg25_out, reg26_out, reg27_out, reg28_out, reg29_out, reg30_out, reg31_out;

	wire [7:0]  reg0_in,  reg1_in,  reg2_in,  reg3_in,  reg4_in,  reg5_in,  reg6_in,  reg7_in,
					reg8_in,  reg9_in,  reg10_in, reg11_in, reg12_in, reg13_in, reg14_in, reg15_in,
					reg16_in, reg17_in, reg18_in, reg19_in, reg20_in, reg21_in, reg22_in, reg23_in,
					reg24_in, reg25_in, reg26_in, reg27_in, reg28_in, reg29_in, reg30_in, reg31_in;

	demux32_1bit		DEMUXread 			(sel, demux_out_read);
	demux32_1bit		DEMUXwrite 			(write_addr, demux_out_write);

	mux2_8bit			MUX_LOAD0 			(reg0_out,  data_in, load_out[0],  reg0_in),
							MUX_LOAD1			(reg1_out,  data_in, load_out[1],  reg1_in),
							MUX_LOAD2			(reg2_out,  data_in, load_out[2],  reg2_in),
							MUX_LOAD3			(reg3_out,	data_in, load_out[3],  reg3_in),
							MUX_LOAD4			(reg4_out,  data_in, load_out[4],  reg4_in),
							MUX_LOAD5			(reg5_out,  data_in, load_out[5],  reg5_in),
							MUX_LOAD6			(reg6_out,  data_in, load_out[6],  reg6_in),
							MUX_LOAD7			(reg7_out,  data_in, load_out[7],  reg7_in),
							MUX_LOAD8			(reg8_out,  data_in, load_out[8],  reg8_in),
							MUX_LOAD9			(reg9_out,  data_in, load_out[9],  reg9_in),
							MUX_LOAD10			(reg10_out, data_in, load_out[10], reg10_in),
							MUX_LOAD11			(reg11_out, data_in, load_out[11], reg11_in),
							MUX_LOAD12			(reg12_out, data_in, load_out[12], reg12_in),
							MUX_LOAD13			(reg13_out, data_in, load_out[13], reg13_in),
							MUX_LOAD14			(reg14_out, data_in, load_out[14], reg14_in),
							MUX_LOAD15			(reg15_out, data_in, load_out[15], reg15_in),
							MUX_LOAD16			(reg16_out, data_in, load_out[16], reg16_in),
							MUX_LOAD17			(reg17_out, data_in, load_out[17], reg17_in),
							MUX_LOAD18			(reg18_out, data_in, load_out[18], reg18_in),
							MUX_LOAD19			(reg19_out,	data_in, load_out[19], reg19_in),
							MUX_LOAD20			(reg20_out, data_in, load_out[20], reg20_in),
							MUX_LOAD21			(reg21_out, data_in, load_out[21], reg21_in),
							MUX_LOAD22			(reg22_out, data_in, load_out[22], reg22_in),
							MUX_LOAD23			(reg23_out, data_in, load_out[23], reg23_in),
							MUX_LOAD24			(reg24_out, data_in, load_out[24], reg24_in),
							MUX_LOAD25			(reg25_out, data_in, load_out[25], reg25_in),
							MUX_LOAD26			(reg26_out, data_in, load_out[26], reg26_in),
							MUX_LOAD27			(reg27_out, data_in, load_out[27], reg27_in),
							MUX_LOAD28			(reg28_out, data_in, load_out[28], reg28_in),
							MUX_LOAD29			(reg29_out, data_in, load_out[29], reg29_in),
							MUX_LOAD30			(reg30_out, data_in, load_out[30], reg30_in),
							MUX_LOAD31			(reg31_out, data_in, load_out[31], reg31_in);

	reg_8bit_lcd		DREG1					(clk, reg1_in,  reg1_out,  hi),
							DREG2					(clk, reg2_in,  reg2_out,  hi),
							DREG3					(clk, reg3_in,  reg3_out,  hi),
							DREG4					(clk, reg4_in,  reg4_out,  hi),
							DREG5					(clk, reg5_in,  reg5_out,  hi),
							DREG6					(clk, reg6_in,  reg6_out,  hi),
							DREG7					(clk, reg7_in,  reg7_out,  hi),
							DREG8					(clk, reg8_in,  reg8_out,  hi),
							DREG9					(clk, reg9_in,  reg9_out,  hi),
							DREG10				(clk, reg10_in, reg10_out, hi),
							DREG11				(clk, reg11_in, reg11_out, hi),
							DREG12				(clk, reg12_in, reg12_out, hi),
							DREG13				(clk, reg13_in, reg13_out, hi),
							DREG14				(clk, reg14_in, reg14_out, hi),
							DREG15				(clk, reg15_in, reg15_out, hi),
							DREG16				(clk, reg16_in, reg16_out, hi),
							DREG17				(clk, reg17_in, reg17_out, hi),
							DREG18				(clk, reg18_in, reg18_out, hi),
							DREG19				(clk, reg19_in, reg19_out, hi),
							DREG20				(clk, reg20_in, reg20_out, hi),
							DREG21				(clk, reg21_in, reg21_out, hi),
							DREG22				(clk, reg22_in, reg22_out, hi),
							DREG23				(clk, reg23_in, reg23_out, hi),
							DREG24				(clk, reg24_in, reg24_out, hi),
							DREG25				(clk, reg25_in, reg25_out, hi),
							DREG26				(clk, reg26_in, reg26_out, hi),
							DREG27				(clk, reg27_in, reg27_out, hi),
							DREG28				(clk, reg28_in, reg28_out, hi),
							DREG29				(clk, reg29_in, reg29_out, hi),
							DREG30				(clk, reg30_in, reg30_out, hi),
							DREG31				(clk, reg31_in, reg31_out, hi);

	mux32_8bit			MUX_OUT				(data_out, sel, 	reg0_out, reg1_out, reg2_out, reg3_out, reg4_out, reg5_out, reg6_out, reg7_out,
																			reg8_out, reg9_out, reg10_out,reg11_out,reg12_out,reg13_out,reg14_out,reg15_out,
																			reg16_out,reg17_out,reg18_out,reg19_out,reg20_out,reg21_out,reg22_out,reg23_out,
																			reg24_out,reg25_out,reg26_out,reg27_out,reg28_out,reg29_out,reg30_out,reg31_out);

endmodule
