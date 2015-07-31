`timescale 1ns / 1ps

module d_ff_beh_c1 (clk, D, Q, nClear);
	input clk, D, nClear;
	output reg Q;
	
	always @(posedge clk or negedge nClear)
	begin
		if (~nClear) 
			Q=1;
		else 
			Q=D;
	end

endmodule
