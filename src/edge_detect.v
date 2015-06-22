`timescale 1ns / 1ps
//////////////////////////////
//
//////////////////////////////
module edge_detect(btn_edge, btn, clk5K);
	input btn, clk5K;
	output reg btn_edge;
	reg count;
	
	initial begin
		count <= 0;
		btn_edge <= 0;
	end
		
	always @(posedge clk5K) begin
		if (btn == 1 & count == 0) begin
			count <= 1;
			btn_edge <= 1;
		end
		if (btn == 1 & count == 1)
			btn_edge <= 0;
		if (btn == 0 & count == 1)
			count <= 0;
	end

endmodule
