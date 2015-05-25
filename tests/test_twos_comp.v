`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:27:01 04/27/2015
// Design Name:   twos_comp
// Module Name:   D:/My Documents/University/Year 5/Quarter 3/ECE 425/src/tests/test_twos_comp.v
// Project Name:  lab_2_alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: twos_comp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_twos_comp;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg sub_en;

	// Outputs
	wire [15:0] OUT;
	wire Cout;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	twos_comp uut (
		.OUT(OUT), 
		.Cout(Cout), 
		.overflow(overflow), 
		.A(A), 
		.B(B), 
		.sub_en(sub_en)
	);

	initial begin
		// Initialize Inputs
		A = 4;
		B = 4;
		sub_en = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#1; A = 100;
		#1; B = 200;
		#1; A = 16'b0111111111111111;
		#1; B = 1;
		#1; A = 16'b1000000000000000;
		#1; B = 16'b1000000000000000;
		#1; sub_en = 0;
		#1; B = 200;
		#1; A = 100;

	end
      
endmodule

