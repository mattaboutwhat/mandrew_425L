`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Daryoush Enterprises
// Engineer: Shayan Daryoush
//
//////////////////////////////////////////////////////////////////////////////////
module DisplayConfig(
    );

	case(state)
		0: case(sel)
				0: begin state <=10;delay<=82_000; 	end
				1: begin state <=1; DR<=8'h01; 		end
				2: begin state <=1; DR<=8'h0c; 		end
				3: begin state <=1; DR <= 8'h06; 	end
				4: begin state <=1; DR <= 8'h28; 	end
				default: state <=0;
			endcase
		1: begin delay<=2; control<=0; dataout<=DR[7:4]; 				state<=2;   							end
		2: begin if (delay==0) begin delay<=12; control <= 3'h4;		state<=3;  								end
			else delay <= delay-1; 																							end
		3: begin if (delay==0) begin delay<=2;  control <= 0;			state<=4;  								end
			else delay <= delay-1; 																							end
		4: begin if (delay==0) begin delay<=50; 							state<=5; 								end
			else delay <= delay-1; 																							end
		5: begin if (delay==0) begin delay<=2;  control <= 0; 		state<=6; dataout <= DR[3:0] 		end
			else delay <= delay-1; 																							end
		6: begin if (delay==0) begin delay<=12; control <= 3'h4;		state<=7;  								end
			else delay <= delay-1; 																							end
		7: begin if (delay==0) begin delay<=2;  control <= 0;			state<=8;  								end
			else delay <= delay-1; 																							end
		8: begin if (delay==0) begin delay<=2_000; 						state<=9; 								end
			else delay <= delay-1; 																							end
		9: begin if (delay==0) begin sel<=sel-1; 							state<=10;								end
			else delay <= delay-1; 																							end
		10: begin if(delay==0) begin stage <=2;							state<=1;  								end
			else delay <= delay-1; 																							end 
	endcase
	

endmodule
