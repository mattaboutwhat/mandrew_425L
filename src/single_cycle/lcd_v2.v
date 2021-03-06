`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Matthew Allen & Andrew Bakhit
// ECE 425L | Spring 2015
// Dr. Halima el Naga
// Cal Poly Pomona (www.cpp.edu)
// Adapted from Shayan Daryoush's "PowerInit.v"
//
//////////////////////////////////////////////////////////////////////////////////
module lcd(clk, dataout, control, OPCODE);
	input clk;
	input  [3:0] OPCODE;
	output reg [3:0] dataout;
	output reg [2:0] control;

	reg [7:0] DR;
	reg [7:0] MUX;

	reg [2:0] stage=0;
	reg [4:0] state=0;
	reg [4:0] sel=0;
	
	reg [20:0] delay;		//largest delay: 205_000 -> 18bits

	always @(posedge clk) begin
		case(stage)
			//Power init
			0: begin
				case(state)
					//Wait 15 ms or longer, e.g., 750,000 clock cycles at 50 MHz
					0: begin delay <= 750_000; state<=1;  control<=0; 														end

					//SF_D<11:8> = 0x03, LCD_E = high for 12 clock cycles
					1: begin if(delay==0) begin delay<=12; 			state<=2; control<=3'h4; dataout<=4'h3; 	end
								else delay<=delay-1; 																				end

					//Wait 4.1 ms or longer, 205,000 clock cycles
					2: begin if(delay==0) begin delay<=205_000; 		state<=3; control<=0; 							end
								else delay<=delay-1; 																				end

					//SF_D<11:8>=0x03,LCD_E=high for 12 clock cycles
					3: begin if(delay==0) begin delay<=12; 			state<=4; control<=3'h4; dataout<=4'h3; 	end
								else delay<=delay-1;																					end

					//Wait 100 us or longer, 205,000 clock cycles
					4: begin if(delay==0) begin delay<=205_000; 		state<=5; control <=0; 							end
								else delay<=delay-1; 																				end

					5: begin if(delay==0) begin delay<=12; 			state<=6; control<=3'h4; dataout<=4'h3; 	end
								else delay<=delay-1; 																				end

					6: begin if(delay==0) begin delay<=2_000;			state<=7; control<=0; 							end
								else delay<=delay-1; 																				end

					7: begin if(delay==0) begin delay<=12; 			state<=8; control<=3'h4; dataout<=4'h2; 	end
								else delay<=delay-1; 																				end

					8: begin if(delay==0) begin delay<=2_000; 		state<=9; control<=0; 							end
								else delay<=delay-1; 																				end

					9: begin if(delay==0) begin 							state<=0; 			stage<=1; 					end 
								else delay<=delay-1; 																				end
					default: state<=0; 
				endcase
			end

			//Display config
			1: begin
				case(state)
					0: case(sel)
							0: begin state<=1; DR<=8'h28; end
							1: begin state<=1; DR<=8'h06; end
							2: begin state<=1; DR<=8'h0C; end
							3: begin state<=1; DR<=8'h01; end
							4: begin state<=10;delay<=82000; end
							default: sel<=0; 
					endcase
					1: begin delay<=2; control<=3'b000; 	state<=2; dataout<=DR[7:4]; 		end
					2: begin if(delay==0) begin delay<=12; state<=3; control<=3'b100; 		end
								else delay<=delay-1; 														end
					3: begin if(delay==0) begin delay<=2; 	state<=4; control<=3'b000; 		end
								else delay<=delay-1; 														end
					4: begin if(delay==0) begin delay<=50; state<=5;								end
								else delay<=delay-1; 														end
					5: begin if(delay==0) begin delay<=2; 	state<=6; dataout<=DR[3:0]; 		end
								else delay<=delay-1; 														end
					6: begin if(delay==0) begin delay<=12; state<=7; control<=3'b100; 		end
								else delay<=delay-1; 														end
					7: begin if(delay==0) begin delay<=2; 	state<=8; control<=3'b000; 		end
								else delay<=delay-1;															end
					8: begin if(delay==0) begin delay<=2000; state<=9; 							end
								else delay<=delay-1;															end
					9: begin if(delay==0) begin  				state<=0; sel<=sel+1; 				end
								else delay<=delay-1;															end
					10:begin if(delay==0) begin stage<=2; 	state<=0; sel<=0; 					end
								else delay<=delay-1;															end
				endcase
			end

			//CG RAM writing
			2: begin
				//data to be writting
				case(sel)
					0: begin MUX<=8'h0C; end
					1: begin MUX<=8'h0E; end
					2: begin MUX<=8'h04; end
					3: begin MUX<=8'h1F; end
					4: begin MUX<=8'h04; end
					5: begin MUX<=8'h0A; end
					6: begin MUX<=8'h1B; end
					7: begin MUX<=8'h00; end
				endcase
				//writing the data
				case(state)
					//Start with CG RAM address 0 instruction
					0: begin 					DR<=8'h40;								state<=1; 						end
					//send 4 MSBs
					1: begin delay<=2; 		dataout<=DR[7:4]; 					state<=2; control<=3'b000; end
					2: begin if(delay==0) begin delay<=12; 						state<=3; control<=3'b100; end
								else delay<=delay-1; end
					3: begin if(delay==0) begin delay<=52; 						state<=4; control<=3'b000; end
								else delay<=delay-1; end

					//send 4 LSBS
					4: begin if(delay==0) begin delay<=2; dataout<=DR[3:0]; 	state<=5; control<=3'b000; end
								else delay<=delay-1; end
					5: begin if(delay==0) begin delay<=12; 						state<=6; control<=3'b100; end
								else delay<=delay-1; end
					6: begin if(delay==0) begin delay<=2002; 						state<=7; control<=3'b000; end
								else delay<=delay-1; end

					//writing our data to CG RAM
					7: begin if(delay==0) begin 				DR<=MUX; 			state<=8; 						end
								else delay<=delay-1; end

					//send 4 MSBs
					8: begin if(delay==0) begin delay<=2;  control<=3'b010; 	state<=9; dataout<=DR[7:4];end
								else delay<=delay-1; end
					9: begin if(delay==0) begin delay<=12; control<=3'b110; 	state<=10; 						end
								else delay<=delay-1; end
					10:begin if(delay==0) begin delay<=2;  control<=3'b010; 	state<=11; 						end
								else delay<=delay-1; end
					11:begin if(delay==0) begin delay<=50; control<=3'b000; 	state<=12; 						end
								else delay<=delay-1; end

					//send 4 LSBs
					12:begin if(delay==0) begin delay<=2;  control<=3'b010; 	state<=13;dataout<=DR[3:0];end
								else delay<=delay-1; end
					13:begin if(delay==0) begin delay<=12; control<=3'b110; 	state<=14;						end
								else delay<=delay-1; end
					14:begin if(delay==0) begin delay<=2;  control<=3'b010; 	state<=15; 						end
								else delay<=delay-1; end
					15:begin if(delay==0) begin delay<=2000; control<=3'b000;state<=16;						end
								else delay<=delay-1; end
					16:begin if(delay==0) begin
									if(sel==7) 			state<=17;
									else begin 			state<=7; 	sel<=sel+1; end end
								else delay<=delay-1; end

					//delay and exit
					17:begin delay<=40000;			state<=18;	end
					18:begin if(delay==0) begin sel<=0; 	stage<=3; 			state<=0; 	end
								else delay<=delay-1;

					end
				endcase
			end

			//DD RAM writing
			3: begin
				case(OPCODE)
					4'b0010: case(sel) //add
									0: MUX<=8'h41;
									1: MUX<=8'h64;
									2: MUX<=8'h64;
									3: MUX<=8'h00;
									4: MUX<=8'h20;
									5: MUX<=8'h20;
									6: MUX<=8'h20;
									7: MUX<=8'h20;
									8: MUX<=8'h20;
									9: MUX<=8'h20;
									10:MUX<=8'h20;
									11:MUX<=8'h20;
									12:MUX<=8'h20;
									13:MUX<=8'h20;
									14:MUX<=8'h20;
									15:MUX<=8'h20;
									16:MUX<=8'hFF;
									17:MUX<=8'h20;
									18:MUX<=8'h20;
									19:MUX<=8'h20;
									20:MUX<=8'h20;
									21:MUX<=8'h20;
									22:MUX<=8'h20;
									23:MUX<=8'h20;
									24:MUX<=8'h20;
									25:MUX<=8'h20;
									26:MUX<=8'h20;
									27:MUX<=8'h20;
									28:MUX<=8'h20;
									29:MUX<=8'h20;
									30:MUX<=8'h20;
									31:MUX<=8'h20;
								endcase
					4'b0011: case(sel) //addi
									0: MUX<=8'h41;	//A
									1: MUX<=8'h64;	//d
									2: MUX<=8'h64;	//d
									3: MUX<=8'h69;	//i
									4: MUX<=8'h00;
									5: MUX<=8'h20;
									6: MUX<=8'h20;
									7: MUX<=8'h20;
									8: MUX<=8'h20;
									9: MUX<=8'h20;
									10:MUX<=8'h20;
									11:MUX<=8'h20;
									12:MUX<=8'h20;
									13:MUX<=8'h20;
									14:MUX<=8'h20;
									15:MUX<=8'h20;
									16:MUX<=8'hFF;
									17:MUX<=8'h20;
									18:MUX<=8'h20;
									19:MUX<=8'h20;
									20:MUX<=8'h20;
									21:MUX<=8'h20;
									22:MUX<=8'h20;
									23:MUX<=8'h20;
									24:MUX<=8'h20;
									25:MUX<=8'h20;
									26:MUX<=8'h20;
									27:MUX<=8'h20;
									28:MUX<=8'h20;
									29:MUX<=8'h20;
									30:MUX<=8'h20;
									31:MUX<=8'h20;
								endcase
					4'b0110: case(sel) //subtract
									0: MUX<=8'h53;
									1: MUX<=8'h75;
									2: MUX<=8'h62;
									3: MUX<=8'h00;
									4: MUX<=8'h20;
									5: MUX<=8'h20;
									6: MUX<=8'h20;
									7: MUX<=8'h20;
									8: MUX<=8'h20;
									9: MUX<=8'h20;
									10:MUX<=8'h20;
									11:MUX<=8'h20;
									12:MUX<=8'h20;
									13:MUX<=8'h20;
									14:MUX<=8'h20;
									15:MUX<=8'h20;
									16:MUX<=8'hFF;
									17:MUX<=8'h20;
									18:MUX<=8'h20;
									19:MUX<=8'h20;
									20:MUX<=8'h20;
									21:MUX<=8'h20;
									22:MUX<=8'h20;
									23:MUX<=8'h20;
									24:MUX<=8'h20;
									25:MUX<=8'h20;
									26:MUX<=8'h20;
									27:MUX<=8'h20;
									28:MUX<=8'h20;
									29:MUX<=8'h20;
									30:MUX<=8'h20;
									31:MUX<=8'h20;
								endcase
					4'b0000: case(sel) //and
									0: MUX<=8'h41;
									1: MUX<=8'h6E;
									2: MUX<=8'h64;
									3: MUX<=8'h00;
									4: MUX<=8'h20;
									5: MUX<=8'h20;
									6: MUX<=8'h20;
									7: MUX<=8'h20;
									8: MUX<=8'h20;
									9: MUX<=8'h20;
									10:MUX<=8'h20;
									11:MUX<=8'h20;
									12:MUX<=8'h20;
									13:MUX<=8'h20;
									14:MUX<=8'h20;
									15:MUX<=8'h20;
									16:MUX<=8'hFF;
									17:MUX<=8'h20;
									18:MUX<=8'h20;
									19:MUX<=8'h20;
									20:MUX<=8'h20;
									21:MUX<=8'h20;
									22:MUX<=8'h20;
									23:MUX<=8'h20;
									24:MUX<=8'h20;
									25:MUX<=8'h20;
									26:MUX<=8'h20;
									27:MUX<=8'h20;
									28:MUX<=8'h20;
									29:MUX<=8'h20;
									30:MUX<=8'h20;
									31:MUX<=8'h20;
								endcase
					4'b0001: case(sel) //or
									0: MUX<=8'h6F;
									1: MUX<=8'h72;
									2: MUX<=8'h00;
									3: MUX<=8'h20;
									4: MUX<=8'h20;
									5: MUX<=8'h20;
									6: MUX<=8'h20;
									7: MUX<=8'h20;
									8: MUX<=8'h20;
									9: MUX<=8'h20;
									10:MUX<=8'h20;
									11:MUX<=8'h20;
									12:MUX<=8'h20;
									13:MUX<=8'h20;
									14:MUX<=8'h20;
									15:MUX<=8'h20;
									16:MUX<=8'hFF;
									17:MUX<=8'h20;
									18:MUX<=8'h20;
									19:MUX<=8'h20;
									20:MUX<=8'h20;
									21:MUX<=8'h20;
									22:MUX<=8'h20;
									23:MUX<=8'h20;
									24:MUX<=8'h20;
									25:MUX<=8'h20;
									26:MUX<=8'h20;
									27:MUX<=8'h20;
									28:MUX<=8'h20;
									29:MUX<=8'h20;
									30:MUX<=8'h20;
									31:MUX<=8'h20;
								endcase
					4'b0111: case(sel) //SLT
									0: MUX<=8'h53;
									1: MUX<=8'h4C;
									2: MUX<=8'h54;
									3: MUX<=8'h00;
									4: MUX<=8'h20;
									5: MUX<=8'h20;
									6: MUX<=8'h20;
									7: MUX<=8'h20;
									8: MUX<=8'h20;
									9: MUX<=8'h20;
									10:MUX<=8'h20;
									11:MUX<=8'h20;
									12:MUX<=8'h20;
									13:MUX<=8'h20;
									14:MUX<=8'h20;
									15:MUX<=8'h20;
									16:MUX<=8'hFF;
									17:MUX<=8'h20;
									18:MUX<=8'h20;
									19:MUX<=8'h20;
									20:MUX<=8'h20;
									21:MUX<=8'h20;
									22:MUX<=8'h20;
									23:MUX<=8'h20;
									24:MUX<=8'h20;
									25:MUX<=8'h20;
									26:MUX<=8'h20;
									27:MUX<=8'h20;
									28:MUX<=8'h20;
									29:MUX<=8'h20;
									30:MUX<=8'h20;
									31:MUX<=8'h20;
								endcase
					4'b1000: case(sel) //LW
									0: MUX<=8'h4C;
									1: MUX<=8'h57;
									2: MUX<=8'h00;
									3: MUX<=8'h00;
									4: MUX<=8'h20;
									5: MUX<=8'h20;
									6: MUX<=8'h20;
									7: MUX<=8'h20;
									8: MUX<=8'h20;
									9: MUX<=8'h20;
									10:MUX<=8'h20;
									11:MUX<=8'h20;
									12:MUX<=8'h20;
									13:MUX<=8'h20;
									14:MUX<=8'h20;
									15:MUX<=8'h20;
									16:MUX<=8'hFF;
									17:MUX<=8'h20;
									18:MUX<=8'h20;
									19:MUX<=8'h20;
									20:MUX<=8'h20;
									21:MUX<=8'h20;
									22:MUX<=8'h20;
									23:MUX<=8'h20;
									24:MUX<=8'h20;
									25:MUX<=8'h20;
									26:MUX<=8'h20;
									27:MUX<=8'h20;
									28:MUX<=8'h20;
									29:MUX<=8'h20;
									30:MUX<=8'h20;
									31:MUX<=8'h20;
								endcase
					4'b1010: case(sel) //SW
									0: MUX<=8'h53;
									1: MUX<=8'h57;
									2: MUX<=8'h00;
									3: MUX<=8'h20;
									4: MUX<=8'h20;
									5: MUX<=8'h20;
									6: MUX<=8'h20;
									7: MUX<=8'h20;
									8: MUX<=8'h20;
									9: MUX<=8'h20;
									10:MUX<=8'h20;
									11:MUX<=8'h20;
									12:MUX<=8'h20;
									13:MUX<=8'h20;
									14:MUX<=8'h20;
									15:MUX<=8'h20;
									16:MUX<=8'hFF;
									17:MUX<=8'h20;
									18:MUX<=8'h20;
									19:MUX<=8'h20;
									20:MUX<=8'h20;
									21:MUX<=8'h20;
									22:MUX<=8'h20;
									23:MUX<=8'h20;
									24:MUX<=8'h20;
									25:MUX<=8'h20;
									26:MUX<=8'h20;
									27:MUX<=8'h20;
									28:MUX<=8'h20;
									29:MUX<=8'h20;
									30:MUX<=8'h20;
									31:MUX<=8'h20;
								endcase
					4'b1110: case(sel) //BNE
									0: MUX<=8'h42;
									1: MUX<=8'h4E;
									2: MUX<=8'h45;
									3: MUX<=8'h00;
									4: MUX<=8'h20;
									5: MUX<=8'h20;
									6: MUX<=8'h20;
									7: MUX<=8'h20;
									8: MUX<=8'h20;
									9: MUX<=8'h20;
									10:MUX<=8'h20;
									11:MUX<=8'h20;
									12:MUX<=8'h20;
									13:MUX<=8'h20;
									14:MUX<=8'h20;
									15:MUX<=8'h20;
									16:MUX<=8'hFF;
									17:MUX<=8'h20;
									18:MUX<=8'h20;
									19:MUX<=8'h20;
									20:MUX<=8'h20;
									21:MUX<=8'h20;
									22:MUX<=8'h20;
									23:MUX<=8'h20;
									24:MUX<=8'h20;
									25:MUX<=8'h20;
									26:MUX<=8'h20;
									27:MUX<=8'h20;
									28:MUX<=8'h20;
									29:MUX<=8'h20;
									30:MUX<=8'h20;
									31:MUX<=8'h20;
								endcase
					4'b1111: case(sel) //jump
									0: MUX<=8'h4A;
									1: MUX<=8'h75;
									2: MUX<=8'h6D;
									3: MUX<=8'h70;
									4: MUX<=8'h00;
									5: MUX<=8'h20;
									6: MUX<=8'h20;
									7: MUX<=8'h20;
									8: MUX<=8'h20;
									9: MUX<=8'h20;
									10:MUX<=8'h20;
									11:MUX<=8'h20;
									12:MUX<=8'h20;
									13:MUX<=8'h20;
									14:MUX<=8'h20;
									15:MUX<=8'h20;
									16:MUX<=8'hFF;
									17:MUX<=8'h20;
									18:MUX<=8'h20;
									19:MUX<=8'h20;
									20:MUX<=8'h20;
									21:MUX<=8'h20;
									22:MUX<=8'h20;
									23:MUX<=8'h20;
									24:MUX<=8'h20;
									25:MUX<=8'h20;
									26:MUX<=8'h20;
									27:MUX<=8'h20;
									28:MUX<=8'h20;
									29:MUX<=8'h20;
									30:MUX<=8'h20;
									31:MUX<=8'h20;
								endcase						
							default: case(sel) //Default
									0: MUX<=8'h44;
									1: MUX<=8'h65;
									2: MUX<=8'h66;
									3: MUX<=8'h61;
									4: MUX<=8'h75;
									5: MUX<=8'h6C;
									6: MUX<=8'h74;
									7: MUX<=8'h00;
									8: MUX<=8'h20;
									9: MUX<=8'h20;
									10:MUX<=8'h20;
									11:MUX<=8'h20;
									12:MUX<=8'h20;
									13:MUX<=8'h20;
									14:MUX<=8'h20;
									15:MUX<=8'h20;
									16:MUX<=8'hFF;
									17:MUX<=8'h20;
									18:MUX<=8'h20;
									19:MUX<=8'h20;
									20:MUX<=8'h20;
									21:MUX<=8'h20;
									22:MUX<=8'h20;
									23:MUX<=8'h20;
									24:MUX<=8'h20;
									25:MUX<=8'h20;
									26:MUX<=8'h20;
									27:MUX<=8'h20;
									28:MUX<=8'h20;
									29:MUX<=8'h20;
									30:MUX<=8'h20;
									31:MUX<=8'h20;
								endcase				
				endcase													

				case(state)
					//set address: 0x00
					0: begin DR<=8'h80; state<=1; end
					//send MSBs
					1: begin delay<=2; control<=3'b000; state<=2; dataout<=DR[7:4]; end
					2: begin if(delay==0) begin delay<=12; control<=3'b100; state<=3; end
								else delay<=delay-1; end
					3: begin if(delay==0) begin delay<=52; control<=3'b000; state<=4; end
								else delay<=delay-1; end
					//send LSBs
					4: begin if(delay==0) begin delay<=2; control<=3'b000; state<=5; dataout<=DR[3:0];end
								else delay<=delay-1; end
					5: begin if(delay==0) begin delay<=12; control<=3'b100; state<=6;	end
								else delay<=delay-1; end
					6: begin if(delay==0) begin delay<=2002;control<=3'b000; state<=7; end
								else delay<=delay-1; end

					//sending data
					7: begin if(delay==0) begin DR<=MUX; state<=8; end
								else delay<=delay-1; end
					//send MSBs
					8: begin if(delay==0) begin delay<=2; control<=3'b010; state<=9; dataout<=DR[7:4]; end
								else delay<=delay-1; end
					9: begin if(delay==0) begin delay<=12; control<=3'b110; state<=10; end
								else delay<=delay-1; end
					10:begin if(delay==0) begin delay<=2; control<=3'b010; state<=11; end
								else delay<=delay-1; end
					11:begin if(delay==0) begin delay<=50; control<=3'b000; state<=12; end
								else delay<=delay-1; end
					//send LSBs
					12:begin if(delay==0) begin delay<=2; control<=3'b010; state<=13; dataout<=DR[3:0]; end
								else delay<=delay-1; end
					13:begin if(delay==0) begin delay<=12; control<=3'b110; state<=14; end
								else delay<=delay-1; end
					14:begin if(delay==0) begin delay<=2; control<=3'b010; state<=15; end
								else delay<=delay-1; end
					15:begin if(delay==0) begin delay<=2000; control<=3'b000; state<=16;end
								else delay<=delay-1; end

					//loop or exit
					16:begin if(delay==0) begin delay<=40000; sel<=sel+1; state<=17; end 
								else delay<=delay-1; end
					17:begin if(delay==0) begin 	if(sel==16) begin 		//next line
																DR<=8'hC0; state<=1; end
															else if(sel==31) begin 	//done, start over
																stage<=2; state<=18; sel<=0; 	end
															else 							//next character
																state<=7;				end
								else delay<=delay-1; 								end
				endcase
			end

			default: begin stage<=0; state<=0; dataout<=0; control<=0; sel<=0; end
		endcase
	end
endmodule
