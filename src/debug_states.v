`timescale 1ns / 1ps
//////////////////////////////
//
//////////////////////////////
module debug_states(d_state, btn, clk);
	input clk, btn;
	output reg [1:0] d_state;

	always @(posedge clk) begin
		case(d_state)
			0: begin 
					if (btn)
						d_state<=1;
			end
			1: begin 
					if (btn)
						d_state<=2;
			end
			2: begin 
					if (btn)
						d_state<=3;
			end
			3: begin 
					if (btn)
						d_state<=0;
			end
			default: d_state<=0;
		endcase
	end
endmodule 
