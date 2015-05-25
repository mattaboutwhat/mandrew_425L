`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:41:39 04/22/2015
// Design Name:   unsinged_adder
// Module Name:   D:/My Documents/University/Year 5/Quarter 3/ECE 425/src/tests/test_unsigned_adder.v
// Project Name:  lab_2_alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: unsinged_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_unsigned_adder;

	// Inputs
	reg [15:0] X;
	reg [15:0] Y;
	reg Cin;

	// Outputs
	wire [15:0] out;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	unsinged_adder uut (
		.X(X), 
		.Y(Y), 
		.out(out), 
		.Cin(Cin), 
		.Cout(Cout)
	);

	initial begin
		// Initialize Inputs
		X = 16'b1111111111111111;
		Y = 16'b0000000000000000;
		Cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Cin=1;
		#1;
		Y=1;
		#1;
		Cin=0;
		#1;
		Y=16'b1111111111111111;
		#1;
		Cin=1;
	end
      
endmodule

