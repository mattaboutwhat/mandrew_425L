`timescale 1ns / 1ps
//////////////////////////////
//
//////////////////////////////
module clk_5K(clk_out, clk);
	output reg clk_out;
	input clk;
	reg [13:0]counter;
	
	initial begin
		counter <= 0;
	end
	
	always @(posedge clk) begin
		if (counter < 5001) begin
			clk_out <= 0;
			counter <= counter + 1;
		end else if (counter >= 5001 && counter <10001) begin
			clk_out <= 1;
			counter <= counter + 1;
		end
		else 
			counter <= 0;
	end

endmodule
