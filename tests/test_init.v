`timescale 1ns / 1ps

module test_init;

	// Inputs
	reg clk;

	// Outputs
	wire init;

	// Instantiate the Unit Under Test (UUT)
	init uut (
		.init(init), 
		.clk(clk)
	);

	always
		#1 clk=~clk;

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

