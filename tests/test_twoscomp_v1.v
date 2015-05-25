`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:31:53 04/01/2015
// Design Name:   TwosCompl
// Module Name:   E:/ECE 425 Lab 1/Adder2scompl/test_twoscomp_v1.v
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

module test_twoscomp_v1;

	// Inputs
	reg [1:0] x;
	reg [1:0] y;
	reg subc;

	// Outputs
	wire s0;
	wire s1;
	wire c2;

	// Instantiate the Unit Under Test (UUT)
	TwosCompl uut (
		.x(x), 
		.y(y), 
		.subc(subc), 
		.s0(s0), 
		.s1(s1), 
		.c2(c2)
	);

	initial begin
		// Initialize Inputs
		x = 2'b11;
		y = 2'b00;
		subc = 0;

		// Wait 100 ns for global reset to finish
		#100;
		x = 2'b11;
		y = 2'b11;
		subc = 0;
		
		#100;
		x = 2'b11;
		y = 2'b11;
		subc = 1;
        
		// Add stimulus here

	end
      
endmodule

