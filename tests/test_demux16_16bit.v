`timescale 1ns / 1ps

/////////////////////////////////////////////////

module test_demux16_16bit;

	// Inputs
	reg [3:0] s;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	demux16_1bit uut (
		.s(s), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		s = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#1; s = 1;
		#1; s = 2;
		#1; s = 3;
		#1; s = 4;
		#1; s = 5;
		#1; s = 6;
		#1; s = 7;
		#1; s = 8;
		#1; s = 9;
		#1; s = 10;
		#1; s = 11;
		#1; s = 12;
		#1; s = 13;
		#1; s = 14;
		#1; s = 15;
	end
      
endmodule

