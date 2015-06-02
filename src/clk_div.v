`timescale 1ns / 1ps
///////////////////////////////////////
//
//
///////////////////////////////////////
module clk_div(clk_in, clk_out);
	input clk_in;
	output reg clk_out;
	reg [26:0]counter;
	
	initial begin
		counter <= 0;
	end
	
	always @(posedge clk_in) begin
		if (counter < 50_000_001) begin
			clk_out <= 0;
			counter = counter + 1;
		end else if (counter >= 50_000_001 && counter <100_000_000) begin
			clk_out <= 1;
			counter = counter + 1;
			end
		else
			counter = 0;
	end


endmodule
