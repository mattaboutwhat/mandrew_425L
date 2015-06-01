`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Daryoush Enterprises
// Engineer: Shayan Daryoush
//
//////////////////////////////////////////////////////////////////////////////////
module PowerInit(clk,dataout,control,ledpin,ledpin2);
	input clk;
	output reg [3:0] dataout;//SF_D
	output reg [2:0] control; //LCD_E,LCD_RS,LCD_RW
	reg [7:0]  DR;
	reg [3:0]  sel=4;
	reg [25:0] delay=0;
	reg [2:0]  stage=0;//0=Power Init, 1=Display Config, 2=Writing data, 3=disable
	reg [4:0]  state=0;//state within each stage
	reg [7:0]  MUX;
	output reg ledpin = 0;
	output reg ledpin2 = 0;
	
	
	always @(posedge clk)
	begin
		case(stage)
		0: begin
				case(state)
					//Wait 15 ms or longer, e.g., 750,000 clock cycles at 50 MHz
					0: begin delay <= 750_000; state<=1;  control<=0; 														end

					//SF_D<11:8> = 0x03, LCD_E = high for 12 clock cycles
					1: begin if(delay==0) begin delay<=12; 			state<=2; control<=3'h4; dataout<=4'h3; 	end
								else delay <= delay-1; 																				end

					//Wait 4.1 ms or longer, 205,000 clock cycles
					2: begin if(delay==0) begin delay <= 205_000; 	state<=3; control<=0; 							end
								else delay <= delay-1; 																				end

					//SF_D<11:8>=0x03,LCD_E=high for 12 clock cycles
					3: begin if(delay==0) begin delay<=12; 			state<=4; control<=3'h4; dataout<=4'h3; 	end
								else delay <= delay-1;																				end

					//Wait 100 us or longer, 205,000 clock cycles
					4: begin if(delay==0) begin delay <= 205_000; 	state<=5; control <=0; 							end
								else delay <=delay-1; 																				end

					5: begin if(delay==0) begin delay<=12; 			state<=6; control<=3'h4; dataout<=4'h3; 	end
								else delay <=delay-1; 																				end

					6: begin if(delay==0) begin delay <=2_000;		state<=7; control<=0; 							end
								else delay <=delay-1; 																				end

					7: begin if(delay==0) begin delay<=12; 			state<=8; control<=3'h4; dataout<=4'h2; 	end
								else delay <=delay-1; 																				end

					8: begin if(delay==0) begin delay <= 2_000; 		state<=9; control<=0; 							end
								else delay <=delay-1; 																				end

					9: begin if(delay==0) begin 							state <=0; 			stage<=1; 					end 
								else delay <=delay-1; 																				end
				endcase
			end
	
		1: begin 
				case(state)
					0: begin case(sel)
							0: begin state <=10;	delay<=82_000; end
							1: begin state <=1; 	DR<=8'h01; 		end
							2: begin state <=1; 	DR<=8'h0c; 		end
							3: begin state <=1; 	DR<=8'h06;	 	end
							4: begin state <=1; 	DR<=8'h28;	 	end
							default: state <=0;
						endcase end
					1: begin state <=2; control <=0; dataout <= DR[7:4]; delay <=2; end
					2: begin if (delay==0) begin delay <= 12; 	state <= 3; control <= 3'h4; 						end
								else delay <= delay-1; 																				end
					3: begin if (delay==0) begin delay <= 2; 		state <= 4; control <= 0; 							end
								else delay <= delay-1; 																				end
					4: begin if (delay==0) begin delay <= 50; 	state <= 5; 											end
								else delay <= delay-1; 																				end
					5: begin if (delay==0) begin delay <= 2; 		state <= 6; control <= 0; dataout<=DR[3:0];	end
								else delay <= delay-1; 																				end
					6: begin if (delay==0) begin delay <= 12; 	state <= 7; control <= 3'h4; 						end
								else delay <= delay-1; 																				end
					7: begin if (delay==0) begin delay <= 2; 		state <= 8; control <= 0; 							end
								else delay <= delay-1; 																				end
					8: begin if (delay==0) begin delay <= 2_000; state <= 9; 											end
								else delay <= delay-1; 																				end
					9: begin if (delay==0) begin 						state <= 0; sel<=sel-1;	 							end
								else delay <= delay-1; 																				end
					10:begin if (delay==0) begin 						state <= 0; stage<=2; sel<=15; 					end
								else delay <= delay-1; 																				end
				endcase
			end
	
		2: begin 
			case(sel)
				0: begin MUX = 8'h20; end //space
				1: begin MUX = 8'h00; end //custom cgram bitmap
				2: begin MUX = 8'h68; end //h
				3: begin MUX = 8'h73; end //s
				4: begin MUX = 8'h75; end //u
				5: begin MUX = 8'h6F; end //o
				6: begin MUX = 8'h79; end //y
				7: begin MUX = 8'h72; end //r
				8: begin MUX = 8'h61; end //a
				9: begin MUX = 8'h44; end //D
				10:begin MUX = 8'h6E; end //n
				11:begin MUX = 8'h61; end //a
				12:begin MUX = 8'h79; end //y
				13:begin MUX = 8'h61; end //a
				14:begin MUX = 8'h68; end //h
				15:begin MUX = 8'h53; end //S
			endcase
			// DISPLAYING STAGE
			case(state)
				0: begin state <= 1;																									end

				// setting the starting dd ram address (lcd_rs=0, lcd_rw=0, db7=1, address=0000000
				1: begin state <= 2; DR <=8'h80; 																				end  

				// select first 4 most significant bits of command from state 1
				2: begin state <= 3; control <= 0; dataout <= DR[7:4]; delay <= 2; 									end 

				// LCD_E and LCD_RS high to enable writing to LCD, sends the 4 MSB
				3: begin if(delay==0) begin delay <= 12; 		state<= 4; control<=3'h4; 								end 
						 		else delay <= delay -1 ;																			end

				// turn off LCD_E and LCD_RS
				4: begin if(delay==0) begin delay <= 2; 		state<= 5; control<=0; 									end 
								else delay <= delay -1 ; 																			end
				5: begin if(delay==0) begin delay <= 50 ; 	state<= 6; 													end 
								else delay <= delay -1 ; 																			end

				//set least 4 significant bits
				6: begin if(delay==0) begin delay <= 2;		state <= 7; control <= 0; dataout <=DR[3:0]; 	end 
								else delay <= delay -1 ; 																			end
				7: begin if(delay==0) begin delay <= 12; 		state <= 8; control<=3'h4; 							end
								else delay <= delay -1 ; 																			end
				8: begin if(delay==0) begin delay <= 2; 		state <= 9; control<=0; 								end
								else delay <= delay -1 ; 																			end
				9: begin if(delay==0) begin delay <= 2_000 ; state<= 10; 												end
								else delay <= delay -1 ; 																			end

				//sel=# characters to display
				10:begin if(delay==0) begin 						state<= 11;													end 
								else delay <= delay -1 ; 																			end

				// WRITING DATA TO THE DISPLAY
				11:begin state <= 12; DR <= MUX; 																				end
				12:begin state <= 13; control <= 3'b010; dataout <= DR[7:4]; delay <= 2; 							end
				13:begin if(delay==0)begin delay <= 12; 		state<= 14; control<=3'b110; 							end
							else delay <= delay -1 ;																				end
				14:begin if(delay==0)begin delay <= 2; 		state<= 15; control<=3'b010; 							end
							else delay <= delay -1 ; 																				end
				15:begin if(delay==0)begin delay <= 50 ; 		state<= 16;control<=0;									end
							else delay <= delay -1 ; 																				end
				16:begin if(delay==0)begin delay <= 2; state <= 17; control <= 3'b010; dataout <= DR[3:0]; 	end
							else delay <= delay -1 ; 																				end
				17:begin if(delay==0)begin delay <= 12; 		state<= 18; control<=3'b110; 							end
							else delay <= delay -1 ; 																				end
				18:begin if(delay==0)begin delay <= 2; 		state<= 19; control<=3'b010; 							end
							else delay <= delay -1 ; 																				end
				19:begin if(delay==0)begin delay <= 2_000 ; 	state<= 20; control<=0; 								end
							else delay <= delay -1 ; 																				end
				20:begin if(delay==0) begin 
								if(sel==10) begin DR <=8'hC0; 	state<=2; sel<=sel-1;									end 
							   else 										state<=21;													end
							else delay <= delay-1; 																					end
				21:begin if(delay==0)  begin 
								if(sel==0) begin 						state<= 22; 												end
								if(sel==2) begin 						state<=0;   sel<=7;       stage<=3;					end 
								else begin 								state<= 11; sel<=sel - 1; 								end end
							else begin delay <= delay -1 ; 																		end end

				// DELAY BETWEEN DISPLAYING
				22:begin delay <= 40_000_000; 					state<= 23;  												end
				23:begin if(delay==0)begin 						state<= 22;													end
							else delay <= delay -1 ; 																				end   
				default: 												state <= 0;
			endcase	
		end 		//end of case 2
	
	
		3: begin
			case(sel)
				0: begin MUX = 8'h1B; end//space
				1: begin MUX = 8'h0A; end//space
				2: begin MUX = 8'h04; end//h
				3: begin MUX = 8'h1F; end//s
				4: begin MUX = 8'h04; end//u
				5: begin MUX = 8'h0E; end//o
				6: begin MUX = 8'h0A; end//y
				7: begin MUX = 8'h0E; end//r
			endcase
			// DISPLAYING STAGE
			case(state)
				0: begin state <= 1; 																									end

				// setting the starting DD RAM address (LCD_RS=0, LCD_RW=0, DB7=1, Address=0000000
				1: begin DR <= 8'h40; 									state<=2; 													end

				// select first 4 most significant bits of command from state 1
				2: begin delay <= 2; 		dataout <= DR[7:4]; 	state<=3; control <= 0;   								end 

				// LCD_E and LCD_RS high to enable writing to LCD, sends the 4 MSB
				3: begin if(delay==0) begin delay <= 12; 			state<=4; control<=3'h4; 								end 
						 	else delay <= delay -1 ;																					end

				// turn off LCD_E and LCD_RS
				4: begin if(delay==0) begin delay <= 2; 			state<=5; control<=0; 									end 
						 	else delay <= delay -1 ; 																					end
				5: begin if(delay==0) begin delay <= 50 ; 		state<=6; 													end
						 	else delay <= delay -1 ; 																					end

				//set least 4 significant bits
				6: begin if(delay==0) begin delay <= 2; 			state<=7; control<=0; dataout<=DR[3:0];			end 
						 	else delay <= delay -1 ; 																					end
				7: begin if(delay==0) begin delay <= 12; 			state<=8; control<=3'h4; 								end
						 	else delay <= delay -1 ; 																					end
				8: begin if(delay==0) begin delay <= 2; 			state<=9; control<=0; 									end
						 	else delay <= delay -1 ;																					end
				9: begin if(delay==0) begin delay <= 2_000 ; 	state<=10; 													end
						 	else delay <= delay -1 ; 																					end

				//sel=# characters to display
				10:begin if(delay==0) begin 							state<=11;  sel<=7; 										end 
							else delay <= delay -1 ; 																					end

				// WRITING DATA TO THE DISPLAY
				11:begin DR <= MUX; 										state<=12;													end
				12:begin delay <= 2; control <= 3'b010;			state<=13; dataout <= DR[7:4];  						end
				13:begin if(delay==0) begin delay <= 12; 			state<=14; control<=3'b110; 							end
						 else delay <= delay -1 ;																						end
				14:begin if(delay==0) begin delay <= 2; 			state<=15; control<=3'b010; 							end
						 else delay <= delay -1 ; 																						end
				15:begin if(delay==0) begin delay <= 50;	 		state<=16; control<=0; 									end
						 else delay <= delay -1 ; 																						end
				16:begin if(delay==0) begin delay <= 2;			state<=17; control<=3'b010; dataout<=DR[3:0]; 	end
						 else delay <= delay -1 ; 																						end
				17:begin if(delay==0) begin delay <= 12; 			state<=18; control<=3'b110; 							end
						 else delay <= delay -1 ; 																						end
				18:begin if(delay==0) begin delay <= 2; 			state<=19; control<=3'b010; 							end
						 else delay <= delay -1 ; 																						end
				19:begin if(delay==0) begin delay <= 2_000;	 	state<=20; control<=0; 									end
						 else delay <= delay -1 ; 																						end
				20:begin if(delay==0) begin 
								if(sel==0) 									state<=21;
								else begin 									state<=11; sel<=sel-1;	 								end end
			 				else delay <= delay -1 ; 																					end

				// DELAY BETWEEN DISPLAYING
				21:begin state <= 22; delay <= 40_000_000; 																		end
				22:begin if(delay==0) begin ledpin=1; ledpin2=1;state<=2; stage<=2; DR<=8'hCE; sel<=1;				end
			 				else delay <= delay -1 ; 																					end   
				default: 													state<=0;
			endcase
		end 	//end of case 3

		endcase
	end
endmodule
