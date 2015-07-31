`timescale 1ns / 1ps
/////////////////////////////////////
//
/////////////////////////////////////
module reg_file_beh(A, B, Aaddr, Baddr, Caddr, C, load, nClear, m_state, m_data);

	input 	[3:0]  	Aaddr, Baddr, Caddr;
	input 	[15:0] 	C;
	input 		 		load, nClear;
	input 	[3:0] 	m_state;
	output 	[15:0] 	A, B;
	output reg [31:0] m_data;
	
	reg [15:0] Aout, Bout;
	
	reg [15:0] r0, r1, r2,  r3,  r4,  r5,  r6,  r7,
				  r8, r9, r10, r11, r12, r13, r14, r15;

	assign A = Aout;
	assign B = Bout;

	always @(Aaddr, Baddr, Caddr, C, load, nClear) begin
		
		Aout <= 	(Aaddr == 0) ? r0 :
					(Aaddr == 1) ? r1 :
					(Aaddr == 2) ? r2 :
					(Aaddr == 3) ? r3 :
					(Aaddr == 4) ? r4 :
					(Aaddr == 5) ? r5 :
					(Aaddr == 6) ? r6 :
					(Aaddr == 7) ? r7 :
					(Aaddr == 8) ? r8 :
					(Aaddr == 9) ? r9 :
					(Aaddr == 10) ? r10 :
					(Aaddr == 11) ? r11 :
					(Aaddr == 12) ? r12 :
					(Aaddr == 13) ? r13 :
					(Aaddr == 14) ? r14 :
					(Aaddr == 15) ? r15 : 0;

	 	Bout <= 	(Baddr == 0) ? r0 :
					(Baddr == 1) ? r1 :
					(Baddr == 2) ? r2 :
					(Baddr == 3) ? r3 :
					(Baddr == 4) ? r4 :
					(Baddr == 5) ? r5 :
					(Baddr == 6) ? r6 :
					(Baddr == 7) ? r7 :
					(Baddr == 8) ? r8 :
					(Baddr == 9) ? r9 :
					(Baddr == 10) ? r10 :
					(Baddr == 11) ? r11 :
					(Baddr == 12) ? r12 :
					(Baddr == 13) ? r13 :
					(Baddr == 14) ? r14 :
					(Baddr == 15) ? r15 : 0;

			if (load) begin
				case(Caddr)
					0: r0 <= C;
					1: r1 <= C;
					2: r2 <= C;
					3: r3 <= C;
					4: r4 <= C;
					5: r5 <= C;
					6: r6 <= C;
					7: r7 <= C;
					8: r8 <= C;
					9: r9 <= C;
					10: r10 <= C;
					11: r11 <= C;
					12: r12 <= C;
					13: r13 <= C;
					14: r14 <= C;
					15: r15 <= C;
				endcase
			end
			if (~nClear) begin
				r0 <= 0;
				r1 <= 0;
				r2 <= 0;
				r3 <= 0;
				r4 <= 0;
				r5 <= 0;
				r6 <= 0;
				r7 <= 0;
				r8 <= 0;
				r9 <= 0;
				r10 <= 0;
				r11 <= 0;
				r12 <= 0;
				r13 <= 0;
				r14 <= 0;
				r15 <= 0;
				Aout <= 0;
				Bout <= 0;
			end

	end

	//debug outputs
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
