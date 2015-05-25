`timescale 1ns / 1ps

module mux8_1bit(in, sel, out);
	input [7:0] in;
	input [2:0] sel;

	output out;

	wire [5:0] temp;

	mux2_1bit mux1 (in[7],   in[6],   sel[0], temp[5]);
	mux2_1bit mux2 (in[5],   in[4],   sel[0], temp[4]);
	mux2_1bit mux3 (in[3],   in[2],   sel[0], temp[3]);
	mux2_1bit mux4 (in[1],   in[0],   sel[0], temp[2]);
	mux2_1bit mux5 (temp[5], temp[4], sel[1], temp[1]);
	mux2_1bit mux6 (temp[3], temp[2], sel[1], temp[0]);
	mux2_1bit mux7 (temp[1], temp[0], sel[2], out);

endmodule
