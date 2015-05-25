`timescale 1ns / 1ps
 
////////////////////////////////////////////////////////////////////////////////

module test_mux16_16bit;

	// Inputs
	reg [255:0] IN;
	reg [3:0] SEL;

	// Outputs
	wire [15:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	mux16_16bit uut (
		.OUT(OUT), 
		.IN(IN), 
		.SEL(SEL)
	);

	initial begin
		// Initialize Inputs
		IN = 0;
		SEL = 0;

		IN[255:240] = 16'h8000;
		IN[239:224] = 16'h4000;
		IN[223:208] = 16'h2000;
		IN[207:192] = 16'h1000;
		IN[191:176] = 16'h800;
		IN[175:160] = 16'h400;
		IN[159:144] = 16'h200;
		IN[143:128] = 16'h100;
		IN[127:112] = 16'h80;
		IN[111:96]  = 16'h40;
		IN[95:80]   = 16'h20;
		IN[79:64]   = 16'h10;
		IN[63:48]   = 16'h8;
		IN[47:32]   = 16'h4;
		IN[31:16]   = 16'h2;
		IN[15:0]    = 16'h1;


		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#1; SEL = 1;
		#1; SEL = 2;
		#1; SEL = 3;
		#1; SEL = 4;
		#1; SEL = 5;
		#1; SEL = 6;
		#1; SEL = 7;
		#1; SEL = 8;
		#1; SEL = 9;
		#1; SEL = 10;
		#1; SEL = 11;
		#1; SEL = 12;
		#1; SEL = 13;
		#1; SEL = 14;
		#1; SEL = 15;
	end


endmodule

