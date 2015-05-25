`timescale 1ns / 1ps

module test_comparator_for_test;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg sub_en;

	// Outputs
	wire [15:0] OUT;
	wire Cout;
	wire lt;
	wire gt;
	wire eq;

	// Instantiate the Unit Under Test (UUT)
	comparator_for_test uut (
		.OUT(OUT),
		.Cout(Cout),
		.lt(lt), 
		.gt(gt), 
		.eq(eq), 
		.A(A), 
		.B(B),
		.sub_en(sub_en)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		sub_en = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#1 A = 100;
		#1 B = 200;
		#1 A = 32767;
		#1 B = 1;
		#1 A = -32768;
		#1 B = -32768;
		#1 sub_en = 0;
		#1 B = 200;
		#1 A = 100;
	end
      
endmodule

