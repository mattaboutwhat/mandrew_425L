`timescale 1ns / 1ps

module test_top_lcd_test;

	// Inputs
	reg clk;

	// Outputs
	wire [3:0] dataout;
	wire [2:0] control;
	wire led;

	// Instantiate the Unit Under Test (UUT)
	top_lcd_test uut (
		.clk(clk), 
		.dataout(dataout), 
		.control(control), 
		.led(led)
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

