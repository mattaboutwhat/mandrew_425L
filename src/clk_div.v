`timescale 1ns / 1ps
///////////////////////////////////////
//
//
///////////////////////////////////////
module clk_div(clk_in, clk_out, enable);
	input clk_in, enable;
	output reg clk_out;
	reg [25:0]counter;

	always @(posedge clk_in) begin
		if (enable) begin
			if (counter < 25_000_001) begin
				clk_out <= 0;
				counter <= counter + 1;
			end else if (counter < 50_000_000) begin
				clk_out <= 1;
				counter <= counter + 1;
			end else begin
				counter <= 0;
				clk_out <= 1;
			end
		end
	end


endmodule
