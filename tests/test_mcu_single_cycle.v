`timescale 1ns / 1ps

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
		nClear = 1;
	end
      
endmodule

