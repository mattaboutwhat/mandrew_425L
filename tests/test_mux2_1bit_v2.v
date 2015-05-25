`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:44:12 04/22/2015
// Design Name:   mux2_1bit
// Module Name:   D:/My Documents/University/Year 5/Quarter 3/ECE 425/src/tests/test_mux2_1bit_v2.v
// Project Name:  lab_2_alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux2_1bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mux2_1bit_v2;

	// Inputs
	reg A;
	reg B;
	reg sel;

	// Outputs
	wire OUT;

	// Instantiate the Unit Under Test (UUT)
	mux2_1bit uut (
		.A(A), 
		.B(B), 
		.sel(sel), 
		.OUT(OUT)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 1;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		sel = 1;
		#2;
		B = 0;
		#2;
		sel = 0;
		#2;
		A = 1;
		
	end
      
endmodule

