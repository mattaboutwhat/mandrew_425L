`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:36:47 04/22/2015
// Design Name:   mux2_16bit
// Module Name:   D:/My Documents/University/Year 5/Quarter 3/ECE 425/src/tests/test_mux2_16bit.v
// Project Name:  lab_2_alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux2_16bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mux2_16bit;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg sel;

	// Outputs
	wire [15:0] X;

	// Instantiate the Unit Under Test (UUT)
	mux2_16bit uut (
		.A(A), 
		.B(B), 
		.sel(sel), 
		.X(X)
	);

	initial begin
		// Initialize Inputs
		A = 40;
		B = 33;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		sel =1;
	end
      
endmodule

