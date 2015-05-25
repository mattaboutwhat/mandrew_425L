`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:08:32 04/22/2015
// Design Name:   mux4_1bit
// Module Name:   D:/My Documents/University/Year 5/Quarter 3/ECE 425/src/tests/test_mux4_1bit.v
// Project Name:  lab_2_alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux4_1bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mux4_1bit;

	// Inputs
	reg A;
	reg B;
	reg C;
	reg D;
	reg [1:0] sel;

	// Outputs
	wire OUT;

	// Instantiate the Unit Under Test (UUT)
	mux4_1bit uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.sel(sel), 
		.OUT(OUT)
	);

	initial begin
		// Initialize Inputs
		A = 1;
		B = 0;
		C = 1;
		D = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		sel = 1;
		#1;
		sel = 2;
		#1;
		C = 0;
		#1;
		sel = 3;
		#1;
		D = 1;
	
	end
      
endmodule

