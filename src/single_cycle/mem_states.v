`timescale 1ns / 1ps
//////////////////////////////
//
//////////////////////////////
module mem_states(m_state, cw, ccw, clk);
	input clk, cw, ccw;
	output reg [3:0] m_state;

	always @(posedge clk) begin
		case(m_state)
			0: begin 
					if (cw)
						m_state<=1;
					else if (ccw)
						m_state<=15;
			end
			1: begin 
					if (cw)
						m_state<=2;
					else if (ccw)
						m_state<=0;
			end
			2: begin 
					if (cw)
						m_state<=3;
					else if (ccw)
						m_state<=1;
			end
			3: begin 
					if (cw)
						m_state<=4;
					else if (ccw)
						m_state<=2;
			end
			4: begin 
					if (cw)
						m_state<=5;
					else if (ccw)
						m_state<=3;
			end
			5: begin 
					if (cw)
						m_state<=6;
					else if (ccw)
						m_state<=4;
			end
			6: begin 
					if (cw)
						m_state<=7;
					else if (ccw)
						m_state<=5;
			end
			7: begin 
					if (cw)
						m_state<=8;
					else if (ccw)
						m_state<=6;
			end
			8: begin 
					if (cw)
						m_state<=9;
					else if (ccw)
						m_state<=7;
			end
			9: begin 
					if (cw)
						m_state<=10;
					else if (ccw)
						m_state<=8;
			end
			10: begin 
					if (cw)
						m_state<=11;
					else if (ccw)
						m_state<=9;
			end
			11: begin 
					if (cw)
						m_state<=12;
					else if (ccw)
						m_state<=10;
			end
			12: begin 
					if (cw)
						m_state<=13;
					else if (ccw)
						m_state<=11;
			end
			13: begin 
					if (cw)
						m_state<=14;
					else if (ccw)
						m_state<=12;
			end
			14: begin 
					if (cw)
						m_state<=15;
					else if (ccw)
						m_state<=13;
			end
			15: begin 
					if (cw)
						m_state<=0;
					else if (ccw)
						m_state<=14;
			end
			default: m_state<=0;
		endcase
	end
endmodule 
