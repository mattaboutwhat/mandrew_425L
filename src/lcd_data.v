`timescale 1ns/1ps
/////////////////////////////////
//
/////////////////////////////////
module lcd_data(data, state, sel, INSTR, PC, m_state, m_data, r_data, clk);
	input [31:0] m_data, r_data;
	input [15:0] INSTR;
	input [15:0] PC;
	input  [3:0] m_state;
	input  [4:0] sel;
	input  [1:0] state;
	input  clk;
	output reg [7:0] data;

	wire [7:0] Rs, Rt, Rd, PCa, PCb, PCc, PCd,
				  m_s_l,  m_sp1_l, M0, M1, M2, M3,
				  M4, M5, M6, M7,  D0, D1, D2, D3,
				  D4, D5, D6, D7;
	wire [3:0] m_state_plus1;

	//0: OPCODE and PC Display
	lcd_decode				RsDec		(Rs, INSTR[11:8]);
	lcd_decode				RtDec		(Rt, INSTR[7:4]);
	lcd_decode				RdDec		(Rd, INSTR[3:0]);

	lcd_decode				PCaDec	(PCa, PC[15:12]);
	lcd_decode				PCbDec	(PCb, PC[11:8] );
	lcd_decode				PCcDec	(PCc, PC[7:4]  );
	lcd_decode				PCdDec	(PCd, PC[3:0]  );

	//1: Register Display
	u_add_4bit 				ADD1		(m_state_plus1, m_state, 4'b0001);

	lcd_decode				M_SDec0	(m_s_l, m_state);
	lcd_decode				M_SDec1	(m_sp1_l, m_state_plus1);

	lcd_decode 				MLCD0		(M0, m_data[31:28]);
	lcd_decode 				MLCD1		(M1, m_data[27:24]);
	lcd_decode 				MLCD2		(M2, m_data[23:20]);
	lcd_decode 				MLCD3		(M3, m_data[19:16]);

	lcd_decode 				MLCD4		(M4, m_data[15:12]);
	lcd_decode 				MLCD5		(M5, m_data[11:8] );
	lcd_decode 				MLCD6		(M6, m_data[7:4]  );
	lcd_decode 				MLCD7		(M7, m_data[3:0]  );

	//2: DMem Display
	lcd_decode 				DLCD0		(D0, r_data[31:28]);
	lcd_decode 				DLCD1		(D1, r_data[27:24]);
	lcd_decode 				DLCD2		(D2, r_data[23:20]);
	lcd_decode 				DLCD3		(D3, r_data[19:16]);

	lcd_decode 				DLCD4		(D4, r_data[15:12]);
	lcd_decode 				DLCD5		(D5, r_data[11:8] );
	lcd_decode 				DLCD6		(D6, r_data[7:4]  );
	lcd_decode 				DLCD7		(D7, r_data[3:0]  );
	
	always @(posedge clk) begin
		case(state)
			0: begin //OPCODE and PC display 
				case(INSTR[15:12])
						4'b0010: case(sel) //add
										0: data<=8'h41;	//A
										1: data<=8'h64;	//d
										2: data<=8'h64;	//d
										3: data<=8'h20;	//space
										4: data<=8'h24;	//$
										5: data<=Rs;	//Rs
										6: data<=8'h20;	//space
										7: data<=8'h24;	//$
										8: data<=Rt;	//Rt
										9: data<=8'h20; //space
										10:data<=8'h24;	//$
										11:data<=Rd; //Rd
										16:data<=8'h50; //P
										17:data<=8'h43; //C
										18:data<=8'h3D; //=
										19:data<=PCa; //PC[15:12]
										20:data<=PCb; //PC[11:8]
										21:data<=PCc; //PC[7:4]
										22:data<=PCd; //PC[3:0]
										default:data<=8'h20; //space
									endcase
						4'b0011: case(sel) //addi
										0: data<=8'h41;	//A
										1: data<=8'h64;	//d
										2: data<=8'h64;	//d
										3: data<=8'h69; //i
										4: data<=8'h20;	//space
										5: data<=8'h24;	//$
										6: data<=Rs;	//Rs
										7: data<=8'h20;	//space
										8: data<=8'h24;	//$
										9: data<=Rt;	//Rt
										10: data<=8'h20; //space
										11:data<=8'h24;	//$
										12:data<=Rd; //Rd
										16:data<=8'h50; //P
										17:data<=8'h43; //C
										18:data<=8'h3D; //=
										19:data<=PCa; //PC[15:12]
										20:data<=PCb; //PC[11:8]
										21:data<=PCc; //PC[7:4]
										22:data<=PCd; //PC[3:0]
										default:data<=8'h20; //space
									endcase
						4'b0110: case(sel) //subtract
										0: data<=8'h53;	//S
										1: data<=8'h75;	//u
										2: data<=8'h62;	//b
										3: data<=8'h20;	//space
										4: data<=8'h24;	//$
										5: data<=Rs;	//Rs
										6: data<=8'h20;	//space
										7: data<=8'h24;	//$
										8: data<=Rt;	//Rt
										9: data<=8'h20; //space
										10:data<=8'h24; //$
										11:data<=Rd; //Rd
										16:data<=8'h50; //P
										17:data<=8'h43; //C
										18:data<=8'h3D; //=
										19:data<=PCa; //PC[15:12]
										20:data<=PCb; //PC[11:8]
										21:data<=PCc; //PC[7:4]
										22:data<=PCd; //PC[3:0]
										default:data<=8'h20; //space
									endcase
						4'b0000: case(sel) //and
										0: data<=8'h41;	//A
										1: data<=8'h6E;	//n
										2: data<=8'h64;	//d
										3: data<=8'h20;	//space
										4: data<=8'h24;	//$
										5: data<=Rs;	//Rs
										6: data<=8'h20;	//space
										7: data<=8'h24;	//$
										8: data<=Rt;	//Rt
										9: data<=8'h20; //space
										10:data<=8'h24; //$
										11:data<=Rd; //Rd
										16:data<=8'h50; //P
										17:data<=8'h43; //C
										18:data<=8'h3D; //=
										19:data<=PCa; //PC[15:12]
										20:data<=PCb; //PC[11:8]
										21:data<=PCc; //PC[7:4]
										22:data<=PCd; //PC[3:0]
										default:data<=8'h20;  //space
									endcase
						4'b0001: case(sel) //or
										0: data<=8'h6F;	//o
										1: data<=8'h72;	//r
										2: data<=8'h20;	//space
										3: data<=8'h24;	//$
										4: data<=Rs;	//Rs
										5: data<=8'h20;	//space
										6: data<=8'h24;	//$
										7: data<=Rt;	//Rt
										8: data<=8'h20;	//space
										9: data<=8'h24; //$
										10:data<=Rd; //Rd
										16:data<=8'h50; //P
										17:data<=8'h43; //C
										18:data<=8'h3D; //=
										19:data<=PCa; //PC[15:12]
										20:data<=PCb; //PC[11:8]
										21:data<=PCc; //PC[7:4]
										22:data<=PCd; //PC[3:0]
										default:data<=8'h20;  //space
									endcase
						4'b0111: case(sel) //SLT
										0: data<=8'h53;	//S
										1: data<=8'h4C;	//L
										2: data<=8'h54;	//T
										3: data<=8'h20;	//space
										4: data<=8'h24;	//$
										5: data<=Rs;	//Rs
										6: data<=8'h20;	//space
										7: data<=8'h24;	//$
										8: data<=Rt;	//Rt
										9: data<=8'h20; //space
										10:data<=8'h24; //$
										11:data<=Rd; //Rd
										16:data<=8'h50; //P
										17:data<=8'h43; //C
										18:data<=8'h3D; //=
										19:data<=PCa; //PC[15:12]
										20:data<=PCb; //PC[11:8]
										21:data<=PCc; //PC[7:4]
										22:data<=PCd; //PC[3:0]
										default:data<=8'h20;  //space
									endcase
						4'b1000: case(sel) //LW
										0: data<=8'h4C;	//L
										1: data<=8'h57;	//W
										2: data<=8'h20;	//space
										3: data<=8'h24;	//$
										4: data<=Rs;	//Rs
										5: data<=8'h20; //space 
										6: data<=8'h24;	//$
										7: data<=Rt;	//Rt
										8: data<=8'h20; //space
										9: data<=8'h24; //$
										10:data<=Rd; //Rd
										16:data<=8'h50; //P
										17:data<=8'h43; //C
										18:data<=8'h3D; //=
										19:data<=PCa; //PC[15:12]
										20:data<=PCb; //PC[11:8]
										21:data<=PCc; //PC[7:4]
										22:data<=PCd; //PC[3:0]
										default:data<=8'h20;  //space
									endcase
						4'b1010: case(sel) //SW
										0: data<=8'h53;	//S
										1: data<=8'h57;	//W
										2: data<=8'h20;	//space
										3: data<=8'h24;	//$
										4: data<=Rs;	//Rs
										5: data<=8'h20;	//space 
										6: data<=8'h24;	//$
										7: data<=Rt;	//Rt
										8: data<=8'h20; //space
										9: data<=8'h24; //$
										10:data<=Rd; //Rd
										16:data<=8'h50; //P
										17:data<=8'h43; //C
										18:data<=8'h3D; //=
										19:data<=PCa; //PC[15:12]
										20:data<=PCb; //PC[11:8]
										21:data<=PCc; //PC[7:4]
										22:data<=PCd; //PC[3:0]
										default:data<=8'h20;  //space
									endcase
						4'b1110: case(sel) //BNE
										0: data<=8'h42;	//B
										1: data<=8'h4E;	//N
										2: data<=8'h45;	//E
										3: data<=8'h20;	//space
										4: data<=8'h24;	//$
										5: data<=Rs;	//Rs
										6: data<=8'h20;	//space
										7: data<=8'h24;	//$
										8: data<=Rt;	//Rt
										9: data<=8'h20; //space
										10:data<=8'h24; //$
										11:data<=Rd; //Rd
										16:data<=8'h50; //P
										17:data<=8'h43; //C
										18:data<=8'h3D; //=
										19:data<=PCa; //PC[15:12]
										20:data<=PCb; //PC[11:8]
										21:data<=PCc; //PC[7:4]
										22:data<=PCd; //PC[3:0]
										default:data<=8'h20;  //space
									endcase
						4'b1111: case(sel) //jump
										0: data<=8'h4A;	//J
										1: data<=8'h75;	//u
										2: data<=8'h6D;	//m
										3: data<=8'h70;	//p
										4: data<=8'h20;	//space
										5: data<=8'h24;	//$
										6: data<=Rs;	//Rs
										7: data<=8'h20;	//space
										8: data<=8'h24;	//$
										9: data<=Rt;	//Rt
										10:data<=8'h20;	//space
										11:data<=8'h24; //$
										12:data<=Rd; //Rd
										16:data<=8'h50; //P
										17:data<=8'h43; //C
										18:data<=8'h3D; //=
										19:data<=PCa; //PC[15:12]
										20:data<=PCb; //PC[11:8]
										21:data<=PCc; //PC[7:4]
										22:data<=PCd; //PC[3:0]
										default:data<=8'h20;  //space
									endcase
								default: case(sel) //Default
										0: data<=8'h44; //D
										1: data<=8'h65; //e
										2: data<=8'h66; //f
										3: data<=8'h61; //a
										4: data<=8'h75; //u
										5: data<=8'h6C; //l
										6: data<=8'h74; //t
										7: data<=8'h00; //CG0
										16:data<=8'h50; //P
										17:data<=8'h43; //C
										18:data<=8'h3D; //=
										19:data<=PCa; //PC[15:12]
										20:data<=PCb; //PC[11:8]
										21:data<=PCc; //PC[7:4]
										22:data<=PCd; //PC[3:0]
										default:data<=8'h20;
									endcase
					endcase
			end
			1: begin //Mem display
				case(sel)
					0: data<=8'h52; //R
					1: data<=8'h65; //e
					2: data<=8'h67; //g
					3: data<=m_s_l; //Current Register Number
					4: data<=8'h3A; //:
					5: data<=M0; //
					6: data<=M1; //
					7: data<=M2; //
					8: data<=M3; //
					16:data<=8'h52; //R
					17:data<=8'h65; //e
					18:data<=8'h67; //g
					19:data<=m_sp1_l; //Next Register Number
					20:data<=8'h3A; //:
					21:data<=M4; //
					22:data<=M5; //
					23:data<=M6; //
					24:data<=M7; //
					default:data<=8'h20; //space
				endcase
			end
			2: begin //DRAM display
				case(sel)
					0: data<=8'h44; //D
					1: data<=8'h65; //e
					2: data<=8'h66; //f
					3: data<=8'h61; //a
					4: data<=8'h75; //u
					5: data<=8'h6C; //l
					6: data<=8'h74; //t
					7: data<=8'h32; //2
					default:data<=8'h20;
				endcase
			end
			3:	//I dunno
				case(sel)
					0: data<=8'h44; //D
					1: data<=8'h65; //e
					2: data<=8'h66; //f
					3: data<=8'h61; //a
					4: data<=8'h75; //u
					5: data<=8'h6C; //l
					6: data<=8'h74; //t
					7: data<=8'h33; //3
					default:data<=8'h20;
				endcase
			default:case(sel)
					0: data<=8'h44; //D
					1: data<=8'h65; //e
					2: data<=8'h66; //f
					3: data<=8'h61; //a
					4: data<=8'h75; //u
					5: data<=8'h6C; //l
					6: data<=8'h74; //t
					7: data<=8'h00; //CS0
					default:data<=8'h20;
				endcase
		endcase
	end
endmodule
