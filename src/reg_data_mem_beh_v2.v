`timescale 1ns / 1ps
///////////////////////////////
//
///////////////////////////////
module reg_data_mem_beh(data_out, addr, data_in, MemWrite, MemRead, nClear, m_state, m_data);
	input [15:0] addr;
	input [15:0] data_in;
	input [3:0]  m_state;
	input 		 MemWrite, MemRead, nClear;
	output reg [15:0] data_out;
	output reg [31:0] m_data;

	reg [15:0] r0, r1, r2,  r3,  r4,  r5,  r6,  r7,
	           r8, r9, r10, r11, r12, r13, r14, r15;

	always @(addr, data_in, MemWrite, MemRead, nClear) begin
		
		data_out	<=	(addr == 0) ? r0 :
						(addr == 1) ? r1 :
						(addr == 2) ? r2 :
						(addr == 3) ? r3 :
						(addr == 4) ? r4 :
						(addr == 5) ? r5 :
						(addr == 6) ? r6 :
						(addr == 7) ? r7 :
						(addr == 8) ? r8 :
						(addr == 9) ? r9 :
						(addr == 10) ? r10 :
						(addr == 11) ? r11 :
						(addr == 12) ? r12 :
						(addr == 13) ? r13 :
						(addr == 14) ? r14 :
						(addr == 15) ? r15 : 0;

		if (MemWrite) begin
				case(addr)
					0: r0<=data_in;
					1: r1<=data_in;
					2: r2<=data_in;
					3: r3<=data_in;
					4: r4<=data_in;
					5: r5<=data_in;
					6: r6<=data_in;
					7: r7<=data_in;
					8: r8<=data_in;
					9: r9<=data_in;
					10:r10<=data_in;
					11:r11<=data_in;
					12:r12<=data_in;
					13:r13<=data_in;
					14:r14<=data_in;
					15:r15<=data_in;
				endcase
		end

		if (~nClear) begin
				r0<=0;
				r1<=0;
				r2<=0;
				r3<=0;
				r4<=0;
				r5<=0;
				r6<=0;
				r7<=0;
				r8<=0;
				r9<=0;
				r10<=0;
				r11<=0;
				r12<=0;
				r13<=0;
				r14<=0;
				r15<=0;
		end
	end

	always @(m_state)
		case(m_state)
			0:  m_data<={r0, r1};
			1:  m_data<={r1, r2};
			2:  m_data<={r2, r3};
			3:  m_data<={r3, r4};
			4:  m_data<={r4, r5};
			5:  m_data<={r5, r6};
			6:  m_data<={r6, r7};
			7:  m_data<={r7, r8};
			8:  m_data<={r8, r9};
			9:  m_data<={r9, r10};
			10: m_data<={r10, r11};
			11: m_data<={r11, r12};
			12: m_data<={r12, r13};
			13: m_data<={r13, r14};
			14: m_data<={r14, r15};
			15: m_data<={r15, r0};
		endcase
endmodule
