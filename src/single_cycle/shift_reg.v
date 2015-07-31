`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:43:48 04/06/2015 
// Design Name: 
// Module Name:    ShiftRegister 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module shift_reg(mode, clk, enable, inbit, loadval, regval);

input [2:0] mode;
input clk;
input enable;
input inbit;
input [3:0] loadval;
output reg [3:0] regval=4'b1111;


always @ (enable, clk)
case (mode)
	3'b000:begin
				//Load - this is going to load the preffered value
				regval <= loadval;
				end
	3'b001:begin
				//Hold - make no changes to 
				regval <= regval;
				end
	3'b010:begin
				//Right Shift - shift contained values to the right one bit
				regval<=regval >> 1;
				end
	3'b011:begin
				//Left Shift - shift contained values to the left one bit
				regval<=regval << 1;
				end
	3'b100:begin
				//Right Shift Input - shift right and input a bit
				if (inbit==0)begin
					regval<=regval >> 1;
					end
						
				else begin
					regval <= regval >> 1;
					regval[3]<=1;
					end
				end
	3'b101:begin
				//Left Shift Input - shift left and input a bit
				if (inbit==0)begin
					regval<=regval << 1;
					end

				else begin
					regval <= regval << 1;
					regval[0]<=1;
					end
				end
endcase
				
endmodule
