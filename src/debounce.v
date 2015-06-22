`timescale 1ns / 1ps
/////////////////////////////////
//
/////////////////////////////////
module debounce(state, button, clk_in);
	input button, clk_in;
	output reg state;
	reg [7:0]sbuf;
	
	initial begin
		sbuf = 0;
		state = 0;
	end
	
	always @(posedge clk_in) begin				//5KHz clock		
		sbuf = {sbuf[6:0], button};				
		if (sbuf == 8'b11111111)
			state = 1;
		else
			state = 0;
	end
		
endmodule
