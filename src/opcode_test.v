`timescale 1ns / 1ps
///////////////////////////////////////
//
///////////////////////////////////////
module opcode_test(clk, OPCODE);
	input clk;
	output reg [3:0] OPCODE;
	
	reg [3:0] state=0;
	
	always @(posedge clk)
		case(state)
			0: begin OPCODE<=4'b0010; state<=1; end
			1: begin OPCODE<=4'b0011; state<=2; end
			2: begin OPCODE<=4'b0000; state<=3; end
			3: begin OPCODE<=4'b0001; state<=4; end
			4: begin OPCODE<=4'b0111; state<=5; end
			5: begin OPCODE<=4'b1000; state<=6; end
			6: begin OPCODE<=4'b1010; state<=7; end
			7: begin OPCODE<=4'b1110; state<=8; end
			8: begin OPCODE<=4'b1111; state<=0; end
			default: begin state<=0; end
		endcase
endmodule
