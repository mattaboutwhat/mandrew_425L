`timescale 1ns / 1ps

module test_mcu_single_cycle;

	// Inputs
	reg clk;
	reg nClear;

	// Outputs
	reg [3:0] lcd_dataout;
	reg [2:0] lcd_control;
	reg ledpin, ledpin2;
	
	// Instantiate the Unit Under Test (UUT)
	mcu_single_cycle uut (
		.clk_in(clk), 
		.nClear(nClear),
		.lcd_dataout(lcd_dataout),
		.lcd_control(lcd_control),
		.ledpin(ledpin),
		.ledpin2(ledpin2)
	);

	always
		#1 clk=~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		nClear = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		nClear = 1;
	end
      
endmodule

