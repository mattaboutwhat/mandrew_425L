`timescale 1ns / 1ps
//////////////////////////////
//
//////////////////////////////
module quad_debounce(button_clean, button, clk_in);
	input button, clk_in;
	output reg button_clean;
	reg [7:0]sbuf;
	
	initial begin
		sbuf = 0;
		button_clean = 0;
	end
	
	always @(posedge clk_in) begin				//5KHz clock		
		sbuf = {sbuf[6:0], ~button};				
		if (sbuf == 8'b11111111)
			button_clean = 0;
		else
			button_clean = 1;
	end
		
endmodule
