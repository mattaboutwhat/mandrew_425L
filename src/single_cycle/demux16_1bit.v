`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

module demux16_1bit(s,out);
	input [3:0] s;
	output [15:0] out;

	not not1 (ns0, s[0]);
	not not2 (ns1, s[1]);
	not not3 (ns2, s[2]);
	not not4 (ns3, s[3]);

	and and0  (out[15], s[0], s[1], s[2], s[3]);
	and and1  (out[14], ns0,  s[1], s[2], s[3]);
	and and2  (out[13], s[0], ns1,  s[2], s[3]);
	and and3  (out[12], ns0,  ns1,  s[2], s[3]);
	and and4  (out[11], s[0], s[1], ns2,  s[3]);
	and and5  (out[10], ns0,  s[1], ns2,  s[3]);
	and and6  (out[9],  s[0], ns1,  ns2,  s[3]);
	and and7  (out[8],  ns0,  ns1,  ns2,  s[3]);
	and and8  (out[7],  s[0], s[1], s[2], ns3);
	and and9  (out[6],  ns0,  s[1], s[2], ns3);
	and and10 (out[5],  s[0], ns1,  s[2], ns3);
	and and11 (out[4],  ns0,  ns1,  s[2], ns3);
	and and12 (out[3],  s[0], s[1], ns2,  ns3);
	and and13 (out[2],  ns0,  s[1], ns2,  ns3);
	and and14 (out[1],  s[0], ns1,  ns2,  ns3);
	and and15 (out[0],  ns0,  ns1,  ns2,  ns3);


endmodule
