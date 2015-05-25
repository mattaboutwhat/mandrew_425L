`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:03:52 04/15/2015
// Design Name:   TwosCompl
// Module Name:   C:/Users/Andrew's Account/Documents/ECE 425L/ECE 425 Lab 1/AdderBrianModified/Adder2scompl/test_twoscomp_v3.v
// Project Name:  Adder2scompl
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TwosCompl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_twoscomp_v3;

	// Inputs
	reg [15:0] x;
	reg [15:0] y;
	reg subc;

	// Outputs
	wire [15:0] s;
	wire carry;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	TwosCompl uut (
		.x(x), 
		.y(y), 
		.subc(subc), 
		.s(s), 
		.carry(carry), 
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		x = 16'b1010101010101010;
		y = 16'b1111111111111111;
		subc = 0;

		// Wait 100 ns for global reset to finish
		#100;
		x = 16'b1010101010101010;
		y = 16'b0000000000000000;
		subc = 0;
		
		#100;
		x = 16'b1010101010101010;
		y = 16'b1111111111111111;
		subc = 1;
		// Add stimulus here

	end
      
endmodule

