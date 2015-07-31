`timescale 1ns / 1ps
/////////////////////////
//
/////////////////////////
module quad_states(cw_out, ccw_out, a, b, clk);
	output reg cw_out, ccw_out;
	input a, b, clk;
	reg [1:0]state;
	reg cw, ccw;
	wire [1:0]pins;
	
	initial begin
		state <= 2'b00;
		cw <= 0;
		ccw <= 0;
	end
	
	assign pins = {a,b};
		
	always @(posedge clk) begin
		cw_out  <= 0;
		ccw_out <= 0;
		case(state)
/*00*/		0: begin
						if (pins == 2'b01) begin
							cw <= 1;
							ccw <= 0;
							state <= 2'b01;
						end else if (pins == 2'b10) begin
							ccw <= 1;
							cw <= 0;
							state <= 2'b10;
						end else if (pins == 2'b00) begin
							ccw <= 0;
							ccw_out <= 0;
							cw <= 0;
							cw_out <= 0;
						end
					end
					
/*01*/		1: begin
						if (pins == 2'b00) begin
							if (ccw == 1) begin
								ccw_out <= 1;
								ccw <= 0;
							end
							state <= 2'b00;
						end else if (pins == 2'b10) 
							state <= 2'b00;
						else if (pins == 2'b11)
							state <= 2'b11;
					end
					
/*10*/		2:	begin
						if (pins == 2'b00) begin
							if (cw == 1) begin
								cw_out <= 1;
								cw <= 0;
							end
							state <= 2'b00;
						end else if (pins == 2'b01) 
							state <= 2'b00;
						else if (pins == 2'b11)
							state <= 2'b11;
					end
					
/*11*/		3: begin
						if (pins == 2'b00) 
							state <= 2'b00;
						else if (pins == 2'b01)
							state <= 2'b01;
						else if (pins == 2'b10)
							state <= 2'b10;
					end
		endcase
	end

endmodule
