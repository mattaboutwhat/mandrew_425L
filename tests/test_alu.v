`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
//	THINGS TO TEST:
//		1. All 'opcode' inputs for static 'A' and 'B' and 'Cin'.
//				. All outputs for garbage opcode inputs.
//		2. 'lt', 'gt' and 'eq' flags for multitude of inputs
//		3.	Overflow output for our signed add/sub.
// 
////////////////////////////////////////////////////////////////////////////////

module test_alu;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg Cin;
	reg [2:0] opcod;

	// Outputs
	wire [15:0] OUT;
	wire Cout;
	wire overflow;
	wire lt;
	wire gt;
	wire eq;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.A(A), 
		.B(B), 
		.Cin(Cin), 
		.opcod(opcod), 
		.OUT(OUT), 
		.Cout(Cout), 
		.overflow(overflow), 
		.lt(lt), 
		.gt(gt), 
		.eq(eq)
	);

	initial begin
		// Initialize Inputs
		A = 16'b0000100100010010;
		B = 16'b1111000000100011;
		Cin = 0;
		opcod = 3'b001;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100; opcod = 3'b010;
		#100; opcod = 3'b011;
		#100; opcod = 3'b100;
		#100; A=16'b1111000000100011;
		
	end
      
endmodule

