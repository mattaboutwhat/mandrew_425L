`timescale 1ns / 1ps
///////////////////////////////////////
//
///////////////////////////////////////
module counter_test(display, cw, ccw, btn, clk);
	output reg [7:0] display; 
	input cw, ccw, btn, clk;

	always @(posedge clk) begin
		if (btn) 
			display=8'b00000001;
		
		else if (cw) 
			if (display == 8'b00000001) 
				display = 8'b10000000;
			else
				display = display >> 1;
		
		else if (ccw) 
			if (display == 8'b10000000)
				display = 8'b00000001;
			else
				display = display << 1;

	end
endmodule
