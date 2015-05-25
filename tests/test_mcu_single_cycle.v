`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:37:59 05/24/2015
// Design Name:   mcu_single_cycle
// Module Name:   D:/My Documents/University/Year 5/Quarter 3/ECE 425/src/tests/test_mcu_single_cycle.v
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
	reg clk;
	reg nClear;

	// Outputs
	wire [15:0] PC_next;
	wire [15:0] write_back_data;

	// Instantiate the Unit Under Test (UUT)
	mcu_single_cycle uut (
		.clk(clk), 
		.nClear(nClear), 
		.PC_next(PC_next), 
		.write_back_data(write_back_data)
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
		
	end
      
endmodule

