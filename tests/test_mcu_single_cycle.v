`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:46:41 06/02/2015
// Design Name:   mcu_single_cycle
// Module Name:   D:/My Documents/University/Year 5/Quarter 3/ECE 425/mandrew_425L/tests/test_mcu_single_cycle.v
// Project Name:  lab_4_path_and_control
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mcu_single_cycle
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mcu_single_cycle;

	// Inputs
	reg clk_in;
	reg nClear;

	// Outputs
	wire [3:0] lcd_dataout;
	wire [2:0] lcd_control;

	// Instantiate the Unit Under Test (UUT)
	mcu_single_cycle uut (
		.clk(clk_in), 
		.nClear(nClear), 
		.lcd_dataout(lcd_dataout), 
		.lcd_control(lcd_control)
	);

	always
		#1 clk_in=~clk_in;

	initial begin
		// Initialize Inputs
		clk_in = 0;
		nClear = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		nClear = 1;
	end
      
endmodule

