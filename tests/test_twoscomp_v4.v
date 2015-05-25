`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:12:03 04/15/2015
// Design Name:   TwosCompl
// Module Name:   C:/Users/Andrew's Account/Documents/ECE 425L/Lab 2/AdderBrianModified/Adder2scompl/test_twoscomp_v4.v
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

module test_twoscomp_v4;

	// Inputs
	reg [15:0] x;
	reg [15:0] y;

	// Outputs
	wire [15:0] s;
	wire carry;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	TwosCompl uut (
		.x(x), 
		.y(y), 
		.s(s), 
		.carry(carry), 
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		x = 16'b0101010101010101;
		y = 16'b0001111111111111;

		// Wait 100 ns for global reset to finish
		#100;
		x = 16'b0001010101010101;
		y = 16'b0101111111111111;
		
		#100;
		x = 16'b0101111111111111;
		y = 16'b0101111111111111;

        
		// Add stimulus here

	end
      
endmodule

