`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module reg_file_beh(A, B, Aaddr, Baddr, Caddr, C, load, nClear, clk);

	input 	[3:0]  	Aaddr, Baddr, Caddr;
	input 	[15:0] 	C;
	input 		 		load, nClear, clk;
	
	output 	[15:0] 	A, B;
	
	reg [15:0] Aout, Bout;
	
	reg [15:0] r0, r1, r2,  r3,  r4,  r5,  r6,  r7;
	reg [15:0] r8, r9, r10, r11, r12, r13, r14, r15;

	assign A = Aout;
	assign B = Bout;
	
	always @(posedge clk) begin

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
					0: begin
							r0 <= C;
					end
					1: begin
							r1 <= C;
					end
					2: begin
							r2 <= C;
					end
					3: begin
							r3 <= C;
					end
					4: begin
							r4 <= C;
					end
					5: begin
							r5 <= C;
					end
					6: begin
							r6 <= C;
					end
					7: begin
							r7 <= C;
					end
					8: begin
							r8 <= C;
					end
					9: begin
							r9 <= C;
					end
					10: begin
							r10 <= C;
					end
					11: begin
							r11 <= C;
					end
					12: begin
							r12 <= C;
					end
					13: begin
							r13 <= C;
					end
					14: begin
							r14 <= C;
					end
					15: begin
							r15 <= C;
					end
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
				

endmodule
