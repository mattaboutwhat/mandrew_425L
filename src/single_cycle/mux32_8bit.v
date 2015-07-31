`timescale 1ns / 1ps
///////////////////
//
///////////////////
module mux32_8bit(OUT, sel, r0,  r1,  r2,  r3,  r4,  r5,  r6,  r7,
									 r8,  r9,  r10, r11, r12, r13, r14, r15,
									 r16, r17, r18, r19, r20, r21, r22, r23,
									 r24, r25, r26, r27, r28, r29, r30, r31);

	input [4:0] sel;
	input [7:0] r0,  r1,  r2,  r3,  r4,  r5,  r6,  r7,
				   r8,  r9,  r10, r11, r12, r13, r14, r15,
				   r16, r17, r18, r19, r20, r21, r22, r23,
				   r24, r25, r26, r27, r28, r29, r30, r31;
	output reg [7:0] OUT;

	always @(sel) begin
			case(sel)
				0: OUT=r0;
				1: OUT=r1;
				2: OUT=r2;
				3: OUT=r3;
				4: OUT=r4;
				5: OUT=r5;
				6: OUT=r6;
				7: OUT=r7;
				8: OUT=r8;
				9: OUT=r9;
				10:OUT=r10;
				11:OUT=r11;
				12:OUT=r12;
				13:OUT=r13;
				14:OUT=r14;
				15:OUT=r15;
				16:OUT=r16;
				17:OUT=r17;
				18:OUT=r18;
				19:OUT=r19;
				20:OUT=r20;
				21:OUT=r21;
				22:OUT=r22;
				23:OUT=r23;
				24:OUT=r24;
				25:OUT=r25;
				26:OUT=r26;
				27:OUT=r27;
				28:OUT=r28;
				29:OUT=r29;
				30:OUT=r30;
				31:OUT=r31;
			endcase
	end

endmodule
