`timescale 1ns / 1ps
////////////////////
//
////////////////////
module demux32_1bit(s, out);
	input [4:0] s;
	output [31:0] out;

	wire [4:0] ns;

	not 	NOT_	[4:0]  (ns[4:0], s[4:0]);

	and and0  (out[0],     s[0],  s[1],  s[2],  s[3],  s[4]);
	and and1  (out[1],    ns[0],  s[1],  s[2],  s[3],  s[4]);
	and and2  (out[2],     s[0], ns[1],  s[2],  s[3],  s[4]);
	and and3  (out[3],    ns[0], ns[1],  s[2],  s[3],  s[4]);
	and and4  (out[4],     s[0],  s[1], ns[2],  s[3],  s[4]);
	and and5  (out[5],    ns[0],  s[1], ns[2],  s[3],  s[4]);
	and and6  (out[6],     s[0], ns[1], ns[2],  s[3],  s[4]);
	and and7  (out[7],    ns[0], ns[1], ns[2],  s[3],  s[4]);
	and and8  (out[8],     s[0],  s[1],  s[2], ns[3],  s[4]);
	and and9  (out[9],    ns[0],  s[1],  s[2], ns[3],  s[4]);
	and and10 (out[10],    s[0], ns[1],  s[2], ns[3],  s[4]);
	and and11 (out[11],   ns[0], ns[1],  s[2], ns[3],  s[4]);
	and and12 (out[12],    s[0],  s[1], ns[2], ns[3],  s[4]);
	and and13 (out[13],   ns[0],  s[1], ns[2], ns[3],  s[4]);
	and and14 (out[14],    s[0], ns[1], ns[2], ns[3],  s[4]);
	and and15 (out[15],   ns[0], ns[1], ns[2], ns[3],  s[4]);

	and and16  (out[16],   s[0],  s[1],  s[2],  s[3],  ns[4]);
	and and17  (out[17],  ns[0],  s[1],  s[2],  s[3],  ns[4]);
	and and18  (out[18],   s[0], ns[1],  s[2],  s[3],  ns[4]);
	and and19  (out[19],  ns[0], ns[1],  s[2],  s[3],  ns[4]);
	and and20  (out[20],   s[0],  s[1], ns[2],  s[3],  ns[4]);
	and and21  (out[21],  ns[0],  s[1], ns[2],  s[3],  ns[4]);
	and and22  (out[22],   s[0], ns[1], ns[2],  s[3],  ns[4]);
	and and23  (out[23],  ns[0], ns[1], ns[2],  s[3],  ns[4]);
	and and24  (out[24],   s[0],  s[1],  s[2], ns[3],  ns[4]);
	and and25  (out[25],  ns[0],  s[1],  s[2], ns[3],  ns[4]);
	and and26  (out[26],   s[0], ns[1],  s[2], ns[3],  ns[4]);
	and and27  (out[27],  ns[0], ns[1],  s[2], ns[3],  ns[4]);
	and and28  (out[28],   s[0],  s[1], ns[2], ns[3],  ns[4]);
	and and29  (out[29],  ns[0],  s[1], ns[2], ns[3],  ns[4]);
	and and30  (out[30],   s[0], ns[1], ns[2], ns[3],  ns[4]);
	and and31  (out[31],  ns[0], ns[1], ns[2], ns[3],  ns[4]);

endmodule
