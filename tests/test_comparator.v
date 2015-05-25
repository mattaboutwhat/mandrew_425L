`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:27:59 04/27/2015
// Design Name:   comparator
// Module Name:   D:/My Documents/University/Year 5/Quarter 3/ECE 425/src/tests/test_comparator.v
// Project Name:  lab_2_alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: comparator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_comparator;

	// Inputs
	reg [15:0] IN;

	// Outputs
	wire lt;
	wire gt;
	wire eq;

	// Instantiate the Unit Under Test (UUT)
	comparator uut (
		.IN(IN), 
		.lt(lt), 
		.gt(gt), 
		.eq(eq)
	);

	initial begin
		// Initialize Inputs
		IN = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

